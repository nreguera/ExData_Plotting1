## Set the working directory
setwd("D:/Docs/Estudios/Data Scientist/4. Exploratory Data Analysis/Week 1/Project Assignment/")

## Reading the data into R
# Read the data. Missing values noted to '?'
power=read.csv("household_power_consumption.txt", sep=";", na.strings = "?")
# Convert Date/Time variables to the right classes in R
power$Date <- as.Date(power$Date,"%d/%m/%Y")
power$DateTime <- paste(power$Date,power$Time)
power$DateTime <- strptime(power$DateTime, format="%Y-%m-%d %H:%M:%S", tz="")
#Subset to dates range
powerSubset <- power[power$Date>="2007-02-01" & power$Date<="2007-02-02",]

## Drawing the plot (number 1)
# Plot the histogram
hist(powerSubset$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
# Create the png file of the plot and close the device
dev.copy(png,file="plot1.png")
dev.off()