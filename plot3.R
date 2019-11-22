#Read in the entire power consumption dataset
data <- read.table("household_power_consumption.txt", sep = ";", header=TRUE, na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))

#Specify date format
data$Date <- as.Date(data$Date, "%d/%m/%Y") #16/12/2006

#We will only be using data from the dates 2007-02-01 and 2007-02-02. 
data_sub <- subset(data, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

#Remove NA
data_sub <- data_sub[complete.cases(data_sub),]

#Join Date and Time
date_time <- paste(data_sub$Date, data_sub$Time)

#Add new date time column and format it as datetime using POSIXct
data_sub <- cbind(date_time, data_sub)
data_sub$date_time <- as.POSIXct(date_time)

#Create the PNG with the required specifications
png(filename = 'plot3.png', width = 480, height = 480, units='px')

#Plot the data which will be added to the PNG
with(data_sub, {
  plot(Sub_metering_1~date_time, type="l",ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2~date_time,col='Red')
  lines(Sub_metering_3~date_time,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
})

#Release the device
dev.off()
