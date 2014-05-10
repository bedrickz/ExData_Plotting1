power <- read.csv(paste(getwd(), "/household_power_consumption.txt", sep = ""), sep=";")

power$DateTime <- as.POSIXct(strptime(paste(power$Date, power$Time), "%d/%m/%Y %H:%M"))

power2 <- power[power$DateTime >= as.POSIXct('2007-02-01') & power$DateTime < as.POSIXct('2007-02-03') ,]

attach(mtcars)
par(mfrow=c(2,2))

plot(power2$DateTime, as.numeric(as.character(power2$Global_active_power)),  type="o", pch="", ylab="Global Active Power",
     xlab = "")

plot(power2$DateTime, as.numeric(as.character(power2$Voltage)),  type="o", pch="" , ylab="Voltage",
     xlab = "datetime")

plot(power2$DateTime, as.numeric(as.character(power2$Sub_metering_1)),  type="o", pch="", ylab="Energy sub metering",
     xlab = "")
lines(power2$DateTime,as.numeric(as.character(power2$Sub_metering_2)),col="red")
lines(power2$DateTime,as.numeric(as.character(power2$Sub_metering_3)),col="blue")
legend('topright',c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1), lwd=c(2.5,2.5,2.5),col=c("black","blue","red"))

plot(power2$DateTime, as.numeric(as.character(power2$Global_reactive_power)),  type="o", pch="" , ylab="Global_reactive_power",
     xlab = "datetime")

dev.copy(png,'plot4.png')
dev.off()
