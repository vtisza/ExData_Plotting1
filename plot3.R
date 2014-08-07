setwd("E:/Kaeggle/Coursera/Explanatory/")
Sys.setlocale("LC_TIME", "English")
adat<-read.csv("household_power_consumption.txt", sep=";",na.strings = "?")
adat$Date1<-as.Date(adat$Date,"%d/%m/%Y")
adat<-subset(adat,Date1>=as.Date("01/02/2007","%d/%m/%Y") & Date1<=as.Date("02/02/2007","%d/%m/%Y"))
adat$Datetime <- strptime(paste(adat$Date, adat$Time), "%d/%m/%Y %H:%M:%S")

plot(adat$Datetime,adat$Sub_metering_1, ylab= "Energy sub metering",
     xlab="", type="l")
points(adat$Datetime,adat$Sub_metering_2, ylab= "Energy sub metering",
       xlab="", type="l", col="red")
points(adat$Datetime,adat$Sub_metering_3, ylab= "Energy sub metering",
       xlab="", type="l", col="blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))

dev.copy(png,"plot3.png", width = 480, height=480)
dev.off()