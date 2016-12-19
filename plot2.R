#Read in the data
data <- read.csv('household_power_consumption.txt', sep=';', na.strings=c("?"))
data$Date <- as.Date(data$Date, format ="%d/%m/%Y")
#Filter out dates of interest
dbeg <- as.Date('01/02/2007', format='%d/%m/%Y')
dend <- as.Date('02/02/2007', format='%d/%m/%Y')
subset <- data[data$Date >= dbeg & data$Date <= dend,]
#Combine date and time cols to create usable time stamp
combodate <- paste(subset$Date, Subset$Time)
tstamp <- strptime(combodate, format="%Y-%m-%d %H:%M:%S")
#make the plot
plot(tstamp, subset$Global_active_power, 
    type='l',
    xlab=" ", 
    ylab="Global Active Power (kW)")
#save the output
dev.copy(device = png, filename = 'plot2.png', width = 480, height = 480)
dev.off()
