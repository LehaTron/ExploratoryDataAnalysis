##read file
f <- file.path(getwd(), "household_power_consumption.txt")
epc <- read.csv(f, sep=";", header = T, na.strings = "?", check.names = F, stringsAsFactors = F)

##changing format
epc$Date <- as.Date((epc$Date),format="%d/%m/%Y")

##subsetting data
epcclr<-subset(epc, subset=(Date>="2007-02-01" & Date<="2007-02-02"))
##str(epcclr)
rm(epc)

x <- paste(epcclr$Date, epcclr$Time)
epcclr$DateTime<-as.POSIXct(x)

##display plot
par(mfrow=c(1,1))
plot(epcclr$DateTime,epcclr$Global_active_power, type = "l", xlab="", ylab = "Global active power(kilowatts)")

##saving plot2 to file in getwd()
png(file="plot2.png",bg="transparent",height=480, width=480)
plot(epcclr$DateTime,epcclr$Global_active_power, type = "l", xlab="", ylab = "Global active power(kilowatts)")
dev.off()


