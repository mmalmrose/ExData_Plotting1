#Read the data
data <- read.csv('household_power_consumption.txt', sep=';', na.strings=c("?"))
data$Date <- as.Date(data$Date, format ="%d/%m/%Y")
#Filter the dates
dbeg <- as.Date('01/02/2007', format='%d/%m/%Y')
dend <- as.Date('02/02/2007', format='%d/%m/%Y')
subset <- data[data$Date >= dbeg & data$Date <= dend,]
#combine the date and time columns in order to create a usable timestamp
combodate <- paste(subset$Date, Subset$Time)
tstamp <- strptime(combodate, format="%Y-%m-%d %H:%M:%S")
#crate the plot array
par(mfrow=c(2,2))
#make the first plot
plot(tstamp, subset$Global_active_power,
    type='l',
    ylab="Energy sub metering", 
    col="black")
#make the second plot
plot(tstamp, subset$Voltage, 
    type= "l", 
    ylab = "Voltage", 
    xlab = "Date Time")
#make the third plot
plot(tstamp, subset$Sub_metering_1, 
    type="l",
    xlab="", 
    ylab="Energy sub metering", 
    col="black")
lines(tstamp, subset$Sub_metering_2, col="red")
lines(tstamp, subset$Sub_metering_3, col="blue")
#make the legend for third plot
legend("topright", lty=1, col=c("black","red","blue"), 
    legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    
#make the fourth plot
 plot(tstamp, subset$Global_reactive_power, 
    type="l", 
    ylab="Global Reactive Power", 
    xlab = "Date Time")
dev.copy(device = png, filename = 'plot4.png', width = 480, height = 480)
dev.off()
