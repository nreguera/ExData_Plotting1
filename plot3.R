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

## Drawing the plot (number 3)
# Create the png file for the plot
png(filename="plot3.png", width = 480, height = 480, units = "px", pointsize = 12)
# Plot the graph. Please note that the name of the week days are in Spanish abreviarion: Ju (Thu), Vi (Fri) and Sá (Sat)
plot(powerSubset$DateTime,powerSubset$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
lines(powerSubset$DateTime,powerSubset$Sub_metering_2,col="red")
lines(powerSubset$DateTime,powerSubset$Sub_metering_3,col="blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col = c("black", "red", "blue"), lty=c(1,1,1))
# Close the device
dev.off()