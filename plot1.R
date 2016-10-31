# Set work directory and create folder
setwd('C:/Users/Rafael/Documents/MEGA/R')
if(!file.exists('eda')) dir.create('eda')

# Download data
fileUrl <- 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'
download.file(fileUrl, destfile = './eda/household_power_consumption.zip')

# Unzip data
unzip('./eda/household_power_consumption.zip', exdir = './eda')

# Read data
files <- file('./eda/household_power_consumption.txt')
data <- read.table(text = grep("^[1,2]/2/2007",readLines(files),value=TRUE), sep = ';', col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), na.strings = '?')

# Create Plot 1
if(!file.exists('plots')) dir.create('plots')
png(filename = './plots/plot1.png', width = 480, height = 480, units='px')
with(data, hist(Global_active_power, xlab = 'Global Active Power (kilowatt)', main = 'Global Active Power', col = 'red'))
dev.off()

