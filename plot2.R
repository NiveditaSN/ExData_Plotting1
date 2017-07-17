#Clear the memory
rm(list=ls())

#Read the data within date range "2007-02-01" and "2007-02-02"

power<- read.table(text = grep("^[1,2]/2/2007", readLines("./household_power_consumption.txt"), value = TRUE),  na.strings = "?", skipNul =TRUE, col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),   sep = ";", header = TRUE)

# Format date and save 

power$Date <- as.Date(power$Date, format="%d/%m/%Y")
power <- transform(power, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")

#Plot Graph and save to plot2.png file

plot(power$timestamp,power$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.copy(png, file="./plot2.png", width=480, height=480)
dev.off()





