## Read the data file
powdata<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")
## Convert the first column as date
powdata$Date<-as.Date(powdata$Date,"%d/%m/%Y")
## Plot the graph and save it as plot1.png file
png(filename="plot1.png",width=480,height=480,units="px")
subdata<-subset(powdata,powdata$Date >= '2007-02-01' & powdata$Date <= '2007-02-02')
hist(subdata$Global_active_power,col="orangered",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()