## Loading Package data.table and lubridate (for datetime operations)
library(data.table)
library(lubridate)

## Assigning the text file to an object and 
## reading it into a data table object Power_Consp
Power_Consumption_File <- "household_power_consumption.txt"
Power_Consp <- fread(Power_Consumption_File,header=T,sep=";", na.strings="?")

## Converting Date field from charcater to Date
Power_Consp$Date <- as.Date(Power_Consp$Date, format="%d/%m/%Y")

## Subsetting Power_Consp dataset for dates 2007-02-01 and 2007-02-02
Consp_Subset <-Power_Consp[Date >="2007-02-01"& Date <="2007-02-02",]

## Removing the Power_Consp object to free up memory 
rm(Power_Consp)

## Adding a datetime field to the subset dataset
Consp_Subset$datetime <- ymd_hms(paste(Consp_Subset$Date, Consp_Subset$Time))

## Plotting a graph for datetime and Sub Metering 1,2 &3 and saving it as plot3.png
png("plot3.png", width=480,height=480)
plot(Consp_Subset$datetime,as.numeric(Consp_Subset$Sub_metering_1), type="l", xlab="", ylab="Energy sub metering")
lines(Consp_Subset$datetime,as.numeric(Consp_Subset$Sub_metering_2), col="red")
lines(Consp_Subset$datetime,as.numeric(Consp_Subset$Sub_metering_3),col="blue")
## Adding Legend
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1, lwd=1, col=c("black","red","blue"))
## Closing the png graphic device
dev.off()