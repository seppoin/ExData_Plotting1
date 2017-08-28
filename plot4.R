library("data.table")

# Set the working dir to where the data file is
setwd("C:/Users/Seyed/Documents/Courses/Data Science, Python and R Courses/JHU 04 Exploratory Data Analysis/project1")

#Read the data from file. Note: The missing values are coded as ?
housepower <- fread(input = "household_power_consumption.txt", na.strings="?")

# Get a glimpse of data types and values of the data
str(housepower)

# Filter the data only for two days: 2007-02-01 and 2007-02-02
housepower <- housepower[Date == "1/2/2007" | Date == "2/2/2007",]

# Create a combined Date & Time column, using paste
# Since str shows Date & Time as Characters, use POSIX too
housepower[, DateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]

housepower$Global_active_power = as.numeric(as.character(housepower$Global_active_power))

# Create the final combo plot, using labels given in the Instructions
png("plot4.png", width = 480, height = 480)

# Set the canvas to 2 rows x 2 cols plots
par(mfrow=c(2,2))

# Plot 1
plot(x = housepower[, DateTime],
     y = housepower[, Global_active_power], 
     type="l", 
     xlab="", 
     ylab="Global Active Power")

# Plot 2
plot(housepower[, DateTime],
     housepower[, Voltage], 
     type="l", 
     xlab="datetime", 
     ylab="Voltage")

# Plot 3
plot(housepower[, DateTime], 
     housepower[, Sub_metering_1], 
     type="l", 
     xlab="", 
     ylab="Energy sub metering")

lines(housepower[, DateTime], housepower[, Sub_metering_2], col="red")
lines(housepower[, DateTime], housepower[, Sub_metering_3],col="blue")

legend("topright", 
       col=c("black","red","blue"),
       c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"),
       lty=1,
       bty="n",
       cex=.7) 

# Plot 4
plot(housepower[, DateTime], 
     housepower[,Global_reactive_power], 
     type="l", xlab="datetime", 
     ylab="Global_reactive_power")

dev.off()
