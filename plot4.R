data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE)
data2 <- data[grep("\\b1/2/2007\\b|\\b2/2/2007\\b", data$Date),]
data2$Global_active_power <- as.numeric(data2$Global_active_power)
datetime <- strptime(paste(data2$Date, data2$Time, sep = " "),"%d/%m/%Y %H:%M:%S") #had been using "alltimes" in previous scripts but changed here so the axis titles would be automatic.
png("plot4.png")
par(mfrow = c(2,2), mar = c(4,4,2,1), oma = c(0,0,2,0))
with(data2, {
  plot(datetime, data2$Global_active_power, type="l", xlab = "", ylab = "Global Active Power")
  plot(datetime, data2$Voltage, type="l", ylab = "Voltage")
  plot(datetime, as.numeric(data2$Sub_metering_1), type="l", xlab = "", ylab = "Energy sub metering")
  lines(datetime, as.numeric(data2$Sub_metering_2), type = "l", col = "red")
  lines(datetime, as.numeric(data2$Sub_metering_3), type = "l", col = "blue")
  legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1, lwd = 2, bty = "n")
  plot(datetime, as.numeric(data2$Global_reactive_power), ylab = "Global_reactive_power", type = "l")
})
dev.off()