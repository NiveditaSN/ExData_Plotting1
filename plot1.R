#Clear the memory
rm(list=ls())

#Read the data within date range "2007-02-01" and "2007-02-02"

pwrcon<- read.table(text = grep("^[1,2]/2/2007", readLines("./household_power_consumption.txt"), value = TRUE), col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),   sep = ";", header = TRUE)

#Plot Histogram and save to plot1.png file

png(file= "./plot1.png", width = 480, height = 480, units = "px", bg = "white")
par(mar= c(4, 4, 2, 1))
hist(pwrcon$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "red")
dev.off()







