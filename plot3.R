power <- read.csv(paste(getwd(), "/household_power_consumption.txt", sep = ""), sep=";")

power$DateTime <- as.POSIXct(strptime(paste(power$Date, power$Time), "%d/%m/%Y %H:%M"))

power2 <- power[power$DateTime >= as.POSIXct('2007-02-01') & power$DateTime < as.POSIXct('2007-02-03') ,]

plot(power2$DateTime, as.numeric(power2$Sub_metering_1),  type="o", pch="", ylab="Energy sub metering",
     xlab = "")
lines(power2$DateTime,as.numeric(as.character(power2$Sub_metering_2)),col="red")
lines(power2$DateTime,as.numeric(power2$Sub_metering_3),col="blue")
legend('topright',c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1), lwd=c(2.5,2.5,2.5),col=c("black","blue","red"))

dev.copy(png,'plot3.png')
dev.off()
