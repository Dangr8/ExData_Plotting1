data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE)
data2 <- data[grep("\\b1/2/2007\\b|\\b2/2/2007\\b", data$Date),]
data2$Global_active_power <- as.numeric(data2$Global_active_power)
alltimes <- strptime(paste(data2$Date, data2$Time, sep = " "),"%d/%m/%Y %H:%M:%S")
png("plot2.png")
plot(alltimes, data2$Global_active_power, type="l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()