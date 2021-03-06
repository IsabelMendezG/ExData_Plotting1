library("data.table")
#Save file in that folder
setwd("/Users/isabelmendez/Documents/R/ExploratoryDataAnalysis-Assignment_CourseProject1")

#Load Data

data <- read.table("/Users/isabelmendez/Documents/R/ExploratoryDataAnalysis/household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))
summary(data)

## Format date to Type Date
data$Date <- as.Date(data$Date, "%d/%m/%Y")

## Get data from the dates 2007-02-01 and 2007-02-02
data <- subset(data,Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

## Combine Date and Time column
dateTime <- paste(data$Date, data$Time)
dateTime <- setNames(dateTime, "DateTime")
data <- cbind(dateTime, data)
data$dateTime <- as.POSIXct(dateTime)

#Variables: 

globalActivePower <- as.numeric(data$Global_active_power)
globalReactivePower <- as.numeric(data$Global_reactive_power)
voltage <- as.numeric(data$Voltage)
subMetering1 <- as.numeric(data$Sub_metering_1)
subMetering2 <- as.numeric(data$Sub_metering_2)
subMetering3 <- as.numeric(data$Sub_metering_3)


# Create a Time series

plot(data$Global_active_power~data$dateTime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png,"plot2.png", width=480, height=480)
dev.off()