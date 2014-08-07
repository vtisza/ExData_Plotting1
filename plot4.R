setwd("E:/Kaeggle/Coursera/Explanatory/")
Sys.setlocale("LC_TIME", "English")
adat<-read.csv("household_power_consumption.txt", sep=";",na.strings = "?")
adat$Date1<-as.Date(adat$Date,"%d/%m/%Y")
adat<-subset(adat,Date1>=as.Date("01/02/2007","%d/%m/%Y") & Date1<=as.Date("02/02/2007","%d/%m/%Y"))
adat$Datetime <- strptime(paste(adat$Date, adat$Time), "%d/%m/%Y %H:%M:%S")

par(mfrow=c(2,2))
plot(adat$Datetime,adat$Global_active_power, ylab= "Global Active Power (kilowatts)",
     xlab="", type="l")
plot(adat$Datetime,adat$Voltage, ylab= "Voltage",
     xlab="datetime", type="l")


plot(adat$Datetime,adat$Sub_metering_1, ylab= "Energy sub metering",
     xlab="", type="l")
points(adat$Datetime,adat$Sub_metering_2, ylab= "Energy sub metering",
       xlab="", type="l", col="red")
points(adat$Datetime,adat$Sub_metering_3, ylab= "Energy sub metering",
       xlab="", type="l", col="blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"),bty = "n", cex=0.5)

plot(adat$Datetime,adat$Global_reactive_power, ylab= "Global_reactive_power",
     xlab="datetime", type="l")

dev.copy(png,"plot4.png", width = 480, height=480)
dev.off()