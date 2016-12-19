#Read the data
data <- read.csv('household_power_consumption.txt', sep=';', na.strings=c("?"))
data$Date <- as.Date(data$Date, format ="%d/%m/%Y")
#Filter out the dates I'm interested in
dbeg <- as.Date('01/02/2007', format='%d/%m/%Y')
dend <- as.Date('02/02/2007', format='%d/%m/%Y')
subset <- data[data$Date >= dbeg & data$Date <= dend,]
subset$Global_active_power <- as.numeric(subset$Global_active_power, na.rm=TRUE)
#Make the histogram
p1 <- hist(subset$Global_active_power, 
           xlab="Global Active Power (kilowatts)",
           col="Red", 
           main="Global Active Power")
#Save the output
dev.copy(device = png, filename = 'plot1.png', width = 480, height = 480)
dev.off()

