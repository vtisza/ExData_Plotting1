setwd("E:/Kaeggle/Coursera/Explanatory/")
Sys.setlocale("LC_TIME", "English")

adat<-read.csv("household_power_consumption.txt", sep=";",na.strings = "?")
adat$Date1<-as.Date(adat$Date,"%d/%m/%Y")
adat<-subset(adat,Date1>=as.Date("01/02/2007","%d/%m/%Y") & Date1<=as.Date("02/02/2007","%d/%m/%Y"))
adat$Datetime <- strptime(paste(adat$Date, adat$Time), "%d/%m/%Y %H:%M:%S")


plot(adat$Datetime,adat$Global_active_power, ylab= "Global Active Power (kilowatts)",
     xlab="", type="l")
dev.copy(png,"plot2.png", width = 480, height=480)
dev.off()