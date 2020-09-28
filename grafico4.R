grafic <- read.table("household_power_consumption.txt",skip=1,sep=";")
names(grafic) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
subgrafic <- subset(grafic,grafic$Date=="1/2/2007" | grafic$Date =="2/2/2007")

subgrafic$Date <- as.Date(subgrafic$Date, format="%d/%m/%Y")
subgrafic$Time <- strptime(subgrafic$Time, format="%H:%M:%S")
subgrafic[1:1440,"Time"] <- format(subgrafic[1:1440,"Time"],"2007-02-01 %H:%M:%S")
subgrafic[1441:2880,"Time"] <- format(subgrafic[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

par(mfrow=c(2,2))

with(subgrafic,{
  plot(subgrafic$Time,as.numeric(as.character(subgrafic$Global_active_power)),type="l",  xlab="",ylab="Global Active Power")  
  plot(subgrafic$Time,as.numeric(as.character(subgrafic$Voltage)), type="l",xlab="datetime",ylab="Voltage")
  plot(subgrafic$Time,subgrafic$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
  with(subgrafic,lines(Time,as.numeric(as.character(Sub_metering_1))))
  with(subgrafic,lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
  with(subgrafic,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))
  legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering1","Sub_metering2","Sub_metering3"), cex = 0.6)
  plot(subgrafic$Time,as.numeric(as.character(subgrafic$Global_reactive_power)),type="l",xlab="datetime",ylab="Global_reactive_power")
})