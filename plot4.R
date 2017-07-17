#Clear the memory
rm(list=ls())

#Read the data within date range "2007-02-01" and "2007-02-02"

power<- read.table(text = grep("^[1,2]/2/2007", readLines("./household_power_consumption.txt"), value = TRUE),  na.strings = "?", skipNul =TRUE, col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),   sep = ";", header = TRUE)

# Format date and save 

power$Date <- as.Date(power$Date, format="%d/%m/%Y")
power <- transform(power, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")

#Plot Graph and save to plot4.png file
par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))

with( power, {
plot(timestamp,Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
  
plot(timestamp,Voltage, type="l", xlab="datetime", ylab="Voltage")
plot(timestamp,Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(timestamp,Sub_metering_2,col="red")
lines(timestamp,Sub_metering_3,col="blue")
legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), lwd=c(1,1))
plot(timestamp,Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
})

dev.copy(png, file="./plot4.png", width=480, height=480)
dev.off()





