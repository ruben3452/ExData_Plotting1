
grafic <- read.table("household_power_consumption.txt",skip=1,sep=";")
names(grafic) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
subgrafic <- subset(grafic,grafic$Date=="1/2/2007" | grafic$Date =="2/2/2007")


hist(as.numeric(as.character(subgrafic$Global_active_power)),col="brown",main="Global Active Power",xlab="Global Active Power(kilowatts)")


title(main="Global Active Power")