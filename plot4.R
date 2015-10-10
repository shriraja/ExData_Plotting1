## Read the data file
powdata<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")
## Convert the first column as date
powdata$Date<-as.Date(powdata$Date,"%d/%m/%Y")
subdata<-subset(powdata,powdata$Date >= '2007-02-01' & powdata$Date <= '2007-02-02')
## Draw 4 graphs and save it as plot4.png file
png(filename="plot4.png",width=480,height=480,units="px")
par(mfrow=c(2,2))
plot(strptime(paste(subdata$Date,subdata$Time,sep=" "),format="%Y-%m-%d %H:%M:%S"),subdata$Global_active_power,type="l",xlab="",ylab="Global Active Power")
plot(strptime(paste(subdata$Date,subdata$Time,sep=" "),format="%Y-%m-%d %H:%M:%S"),subdata$Voltage,type="l",xlab="datetime",ylab="Voltage")
plot(strptime(paste(subdata$Date,subdata$Time,sep=" "),format="%Y-%m-%d %H:%M:%S"),subdata$Sub_metering_1,type="l",xlab="",ylab="Energy Sub metering")
lines(strptime(paste(subdata$Date,subdata$Time,sep=" "),format="%Y-%m-%d %H:%M:%S"),subdata$Sub_metering_2,type="l",col="red")
lines(strptime(paste(subdata$Date,subdata$Time,sep=" "),format="%Y-%m-%d %H:%M:%S"),subdata$Sub_metering_3,type="l",col="blue")
legend("topright",bty="n",lty="solid",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
plot(strptime(paste(subdata$Date,subdata$Time,sep=" "),format="%Y-%m-%d %H:%M:%S"),subdata$Global_reactive_power,type="l",xlab="",ylab="Global_reactive_power")
dev.off()