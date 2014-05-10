power <- read.csv(paste(getwd(), "/household_power_consumption.txt", sep = ""), sep=";")

power$DateTime <- as.POSIXct(strptime(paste(power$Date, power$Time), "%d/%m/%Y %H:%M"))

power2 <- power[power$DateTime >= as.POSIXct('2007-02-01') & power$DateTime < as.POSIXct('2007-02-03') ,]

plot(power2$DateTime, as.numeric(as.character(power2$Global_active_power)),  type="o", pch="", ylab="Global Active Power (kilowatts)",
     xlab = "")

dev.copy(png,'plot2.png')
dev.off()
