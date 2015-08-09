##read file
f <- file.path(getwd(), "household_power_consumption.txt")
epc <- read.csv(f, sep=";", header = T, na.strings = "?", check.names = F, stringsAsFactors = F)

##changing format
epc$Date <- as.Date((epc$Date),format="%d/%m/%Y")

##subsetting data
epcclr<-subset(epc, subset=(Date>="2007-02-01" & Date<="2007-02-02"))
##str(epcclr)
rm(epc)

##creating new col DateTime
x <- paste(epcclr$Date, epcclr$Time)
epcclr$DateTime<-as.POSIXct(x)

##display plot
par(mfrow=c(2,2))
plot(epcclr$DateTime,epcclr$Global_active_power, type = "l", xlab="", ylab = "Global active power(kilowatts)")
plot(epcclr$Voltage~epcclr$DateTime, type = "l", xlab="datetime", ylab = "Voltage")
with(epcclr, {plot(DateTime,Sub_metering_1, type="l",ylab="Energy sub metering", xlab="") 
  lines(DateTime,Sub_metering_2,col='Red')      
  lines(DateTime,Sub_metering_3,col='Blue')})
legend("topright", col=c("black", "red", "blue"),lty=1,bty="n",legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),cex=1)
plot(epcclr$Global_reactive_power~epcclr$DateTime, type = "l", xlab="datetime", ylab = "Global active power(kilowatts)")

##saving to file in getwd()
png(file="plot4.png",bg="transparent",height=480, width=480)
par(mfrow=c(2,2))
plot(epcclr$DateTime,epcclr$Global_active_power, type = "l", xlab="", ylab = "Global active power(kilowatts)")
plot(epcclr$Voltage~epcclr$DateTime, type = "l", xlab="datetime", ylab = "Voltage")
with(epcclr, {plot(DateTime,Sub_metering_1, type="l",ylab="Energy sub metering", xlab="") 
  lines(DateTime,Sub_metering_2,col='Red')      
  lines(DateTime,Sub_metering_3,col='Blue')})
legend("topright", col=c("black", "red", "blue"),lty=1,bty="n",legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),cex=1)
plot(epcclr$Global_reactive_power~epcclr$DateTime, type = "l", xlab="datetime", ylab = "Global active power(kilowatts)")
par(mfrow=c(1,1))
dev.off()