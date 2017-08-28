library("data.table")

# Set the working dir to where the data file is
setwd("C:/Users/Seyed/Documents/Courses/Data Science, Python and R Courses/JHU 04 Exploratory Data Analysis/project1")

#Read the data from file. Note: The missing values are coded as ?
housepower <- fread(input = "household_power_consumption.txt", na.strings="?")

# Get a glimpse of data types and values of the data
str(housepower)

# str shows date as Characters. Change to Date type
housepower$Date = as.Date(housepower$Date,"%d/%m/%Y")

# Filter the data only for two days: 2007-02-01 and 2007-02-02
housepower <- housepower[(Date >= as.Date("2007-02-01")) & (Date <= as.Date("2007-02-02"))]

# Create the first plot, using labels given in the Instructions
png("plot1.png", width = 480, height = 480)

hist(housepower[, Global_active_power], 
     main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", 
     ylab="Frequency", 
     col="Red")

dev.off()
