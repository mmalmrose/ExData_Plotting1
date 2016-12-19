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
#make the main plot
plot(tstamp, subset$Sub_metering_1, 
    type="l",
    xlab="", 
    ylab="Energy sub metering", 
    col="black")
lines(tstamp, subset$Sub_metering_2, col="red")
lines(tstamp, subset$Sub_metering_3, col="blue")
#make the legend
legend("topright", lty=1, col=c("black","red","blue"), 
    legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
#Save the output
dev.copy(device = png, filename = 'plot3.png', width = 480, height = 480)
dev.off()

