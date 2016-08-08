# Load data

# Using a gzfile here to avoid checking large file in to GitHub
# This gzfile is just the original input data set, recompressed in a different format
inData <- read.csv(gzfile("household_power_consumption.txt.gz"), sep = ";", na.strings = "?")
inData$Date <- as.Date(inData$Date, format = "%d/%m/%Y")

# Subset to target dates

data <- inData
data <- subset(data, Date >= as.Date("2007-02-01"))
data <- subset(data, Date <= as.Date("2007-02-02"))

data$DateTime <- strptime(paste(data$Date, data$Time), format = '%Y-%m-%d %H:%M:%S')

# Create plot

png(file = "plot3.png")
with(data, {
	plot(DateTime, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
	lines(DateTime, Sub_metering_2, col = "red")
	lines(DateTime, Sub_metering_3, col = "blue")
	})
legend("topright", pch = '-', col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
