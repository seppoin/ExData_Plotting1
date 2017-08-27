library("data.table")

# Set the working dir to where the data file is
setwd("C:/Users/Seyed/Documents/Courses/Data Science, Python and R Courses/JHU 04 Exploratory Data Analysis/project1")

#Read the data from file. Note: The missing values are coded as ?
housepower <- fread(input = "household_power_consumption.txt", na.strings="?")

# Get a glimpse of data types and values of the data
str(housepower)

# str shows date as Characters. Change to Date type
housepower[, Date := lapply(.SD, as.Date, "%d/%m/%Y"), .SDcols = c("Date")]

# Filter the data only for two days: 2007-02-01 and 2007-02-02. We end up with just 1441 rows
housepower <- housepower[(Date >= "2007-02-01") & (Date <= "2007-02-02")]

# Create the first plot, using labels given in the Instructions
png("plot1.png", width = 480, height = 480)

hist(housepower[, Global_active_power], 
     main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", 
     ylab="Frequency", 
     col="Red")

dev.off()
