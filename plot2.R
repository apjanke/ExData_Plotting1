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

png(file = "plot2.png")
with(data, plot(DateTime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)"))
dev.off()
