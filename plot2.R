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

# Create the second plot, using labels given in the Instructions
png("plot2.png", width = 480, height = 480)

plot(x = housepower[, DateTime],
     y = housepower[, Global_active_power],
     type="l", 
     xlab="", 
     ylab="Global Active Power (kilowatts)")

dev.off()
