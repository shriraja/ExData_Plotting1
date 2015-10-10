## Read the data file
powdata<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")
## Convert the first column as Date
powdata$Date<-as.Date(powdata$Date,"%d/%m/%Y")
## Plot the graph as plot2.png file
png(filename="plot2.png",width=480,height=480,units="px")
subdata<-subset(powdata,powdata$Date >= '2007-02-01' & powdata$Date <= '2007-02-02')
plot(strptime(paste(subdata$Date,subdata$Time,sep=" "),format="%Y-%m-%d %H:%M:%S"),subdata$Global_active_power,type="l",xlab="",ylab="Global Actice Power(kilowatts)")
dev.off()