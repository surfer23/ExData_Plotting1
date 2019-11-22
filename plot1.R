#Read in the entire power consumption dataset
data <- read.table("household_power_consumption.txt", sep = ";", header=TRUE, na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))

#Specify date format
data$Date <- as.Date(data$Date, "%d/%m/%Y") #16/12/2006

#We will only be using data from the dates 2007-02-01 and 2007-02-02. 
data_sub <- subset(data, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

#Create the PNG with the required specifications
png(filename = 'plot1.png', width = 480, height = 480, units='px')

#Plot the data which will be added to the PNG
with(data_sub, hist(Global_active_power, xlab = 'Global Active Power (kilowatts)', main = 'Global Active Power', col = 'red'))

#Release the device
dev.off()

