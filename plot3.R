if(!file.exists("./data")){dir.create("./data")}

fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl,destfile="./data/ElectricPowerConsumption.zip")

unzip("./data/ElectricPowerConsumption.zip", exdir= "./data")

epc <- read.table("./data/household_power_consumption.txt", header=TRUE, 
                  sep=";", stringsAsFactors=FALSE, dec=".")

date.range<- epc[epc$Date == c("1/2/2007", "2/2/2007"),]
date.range$Date <- as.Date(date.range$Date, format = "%d/%m/%Y")
date.time<- paste(date.range$Date, date.range$Time)
date.range$date.time<- as.POSIXct(date.time)
png(filename = "plot3.png", width = 480, height = 480, units = "px")

plot(date.range$date.time, date.range$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(date.range$date.time, date.range$Sub_metering_2, col = "red")
lines(date.range$date.time, date.range$Sub_metering_3, col = "blue")   


legend("topright", col= c("black", "red", "blue"), lty = 1, lwd =
       legend= c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()