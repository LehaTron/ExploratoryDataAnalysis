##read file
f <- file.path(getwd(), "household_power_consumption.txt")
epc <- read.csv(f, sep=";", header = T, na.strings = "?", check.names = F, stringsAsFactors = F)

##changing format
epc$Date <- as.Date((epc$Date),format="%d/%m/%Y")

##subsetting data
epcclr<-subset(epc, subset=(Date>="2007-02-01" & Date<="2007-02-02"))
##str(epcclr)
rm(epc)

##showing histogramm
par(mfrow=c(1,1))
hist(epcclr$Global_active_power, main="Global active power", ylab="Frequency", xlab = "Global active power(kilowatts)", col = "Orange")

##saving plot1 to file in getwd()
png(file="plot1.png",bg="transparent",height=480, width=480)
hist(epcclr$Global_active_power, main="Global active power", ylab="Frequency", xlab = "Global active power(kilowatts)", col = "Orange")
dev.off()
