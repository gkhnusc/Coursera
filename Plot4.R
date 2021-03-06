week1data<-read.csv("household_power_consumption.txt", sep=";",header=TRUE, na.strings="?",nrows=70000)
data<-subset(week1data, Date=="1/2/2007" | Date=="2/2/2007")
data$Date<-as.Date(data$Date, format = "%d/%m/%Y")
data$DateTime<- paste(data$Date, data$Time)
data$DateTime <- strptime(data$DateTime, format = "%Y-%m-%d %H:%M:%S")
png("Plot4.png", 480, 480)
par(mfrow=c(2,2))
plot(data$DateTime,data$Global_active_power,type="l",lwd=1.5,xlab="",ylab="Global Active Power (kilowatts)")
plot(data$DateTime,data$Voltage,type="l",lwd=1.5,xlab="datetime",ylab="Voltage")
plot(data$DateTime,data$Sub_metering_1,type="l",lwd=1.5,col="black",xlab="",ylab="Energy sub metering")
lines(data$DateTime,data$Sub_metering_2,type="l",lwd=1.5,col="red",xlab="",ylab="Energy sub metering")
lines(data$DateTime,data$Sub_metering_3,type="l",lwd=1.5,col="blue",xlab="",ylab="Energy sub metering")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty=c(1,1,1),col=c("black","red","blue"))
plot(data$DateTime,data$Global_reactive_power,type="l",lwd=1.5,xlab="datetime",ylab="Global_reactive_ower")
dev.off()