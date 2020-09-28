grafic <- read.table("household_power_consumption.txt",skip=1,sep=";")
names(grafic) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
subgrafic <- subset(grafic,grafic$Date=="1/2/2007" | grafic$Date =="2/2/2007")

subgrafic$Date <- as.Date(subgrafic$Date, format="%d/%m/%Y")
subgrafic$Time <- strptime(subgrafic$Time, format="%H:%M:%S")
subgrafic[1:1440,"Time"] <- format(subgrafic[1:1440,"Time"],"2007-02-01 %H:%M:%S")
subgrafic[1441:2880,"Time"] <- format(subgrafic[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

plot(subgrafic$Time,as.numeric(as.character(subgrafic$Global_active_power)),type="l",xlab="",ylab="Global Active Power (kilowatts)") 

title(main="Global Active Power Vs Time")