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
png(filename = "plot2.png", width = 480, height = 480, units = "px")

g.active.power<- as.numeric(date.range$Global_active_power)
plot(date.range$date.time, g.active.power, type = "l", xlab ="", ylab = "Global Active Power (kilowatts)")

dev.off()