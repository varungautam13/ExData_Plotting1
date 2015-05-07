## Loading Package data.table 
library(data.table)

## Assigning the text file to an object and 
## reading it into a data table object Power_Consp
Power_Consumption_File <- "household_power_consumption.txt"
Power_Consp <- fread(Power_Consumption_File,header=T,sep=";", na.strings="?")

## Converting Date field from charcater to Date
Power_Consp$Date <- as.Date(Power_Consp$Date, format="%d/%m/%Y")

## Subsetting Power_Consp dataset for dates 2007-02-01 and 2007-02-02
Consp_Subset <-Power_Consp[Date >="2007-02-01"& Date <="2007-02-02",]

## removing the Power_Consp object to free up memory space
rm(Power_Consp)

## Plotting a histogram for Global Active Power and saving it as plot1.png
png("plot1.png", width=480,height=480)
hist(as.numeric(Consp_Subset$Global_active_power), main="Global Active Power", xlab="Global Active Power (kilowatts)", col="Red")
## Closing the png graphic device
dev.off()

