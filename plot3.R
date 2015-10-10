## Read the data file
powdata<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")
## Convert the first column as Date
powdata$Date<-as.Date(powdata$Date,"%d/%m/%Y")
## Plot the graph and save it as plot3.png file
png(filename="plot3.png",width=480,height=480,units="px")
subdata<-subset(powdata,powdata$Date >= '2007-02-01' & powdata$Date <= '2007-02-02')
plot(strptime(paste(subdata$Date,subdata$Time,sep=" "),format="%Y-%m-%d %H:%M:%S"),subdata$Sub_metering_1,type="l",xlab="",ylab="Energy Sub metering")
lines(strptime(paste(subdata$Date,subdata$Time,sep=" "),format="%Y-%m-%d %H:%M:%S"),subdata$Sub_metering_2,type="l",col="red")
lines(strptime(paste(subdata$Date,subdata$Time,sep=" "),format="%Y-%m-%d %H:%M:%S"),subdata$Sub_metering_3,type="l",col="blue")
legend("topright",lty="solid",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()