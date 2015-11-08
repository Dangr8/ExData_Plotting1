data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE)
data2 <- data[grep("\\b1/2/2007\\b|\\b2/2/2007\\b", data$Date),]
data2$Global_active_power <- as.numeric(data2$Global_active_power)
png("plot1.png")
hist(data2$Global_active_power, xlab ="Global Active Power (kilowatts)", col = "red", main = "Global Active Power")
dev.off()