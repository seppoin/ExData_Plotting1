library("data.table")

# Set the working dir to where the data file is
setwd("C:/Users/Seyed/Documents/Courses/Data Science, Python and R Courses/JHU 04 Exploratory Data Analysis/project1")

#Read the data from file. Note: ? indicates the missing values

housepower <- fread(input = "household_power_consumption.txt", na.strings="?")

# Get a glimpse of data types and values of the data
str(housepower)

# Create a combined Date & Time column, using paste
# Since str shows Date & Time as Characters, use POSIX too
housepower[, DateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]

# Filter the data only for two days: 2007-02-01 and 2007-02-02. We end up with just 1441 rows
housepower <- housepower[(DateTime >= "2007-02-01") & (DateTime <= "2007-02-02")]

# Create the second plot, using labels given in the Instructions
png("plot2.png", width = 480, height = 480)

plot(x = housepower[, DateTime],
     y = housepower[, Global_active_power],
     type="l", 
     xlab="", 
     ylab="Global Active Power (kilowatts)")

dev.off()
