if(!file.exists("./data")){dir.create("./data")}

fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl,destfile="./data/ElectricPowerConsumption.zip")

unzip("./data/ElectricPowerConsumption.zip", exdir= "./data")

epc <- read.table("./data/household_power_consumption.txt", header=TRUE, 
                        sep=";", stringsAsFactors=FALSE, dec=".")

date.range<- epc[epc$Date == c("1/2/2007", "2/2/2007"),]

g.active.power<- as.numeric(date.range$Global_active_power)

png(filename = "plot1.png", width = 480, height = 480, units = "px")

histogram<- hist(g.active.power, col = "red", main= "Global Active Power", 
        xlab = "Global Active Power (kilowatts)", xaxt='n')

axis(1, seq(0, length(g.active.power),2))

dev.off()

