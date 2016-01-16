wd <- getwd()
if(!file.exists("asmt1")){
    dir.create("asmt1")
}
setwd("./asmt1")
if(!file.exists("HPC.zip")){
    fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
    download.file(fileUrl, destfile = "HPC.zip")
}
unzip("HPC.zip")
ta <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
ta2 <- ta[ta$Date == c("1/2/2007", "2/2/2007"),]
ta2$Date <- strptime(paste(ta2$Date, ta2$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
ta2$Sub_metering_1 <- as.character(ta2$Sub_metering_1)
ta2$Sub_metering_2 <- as.character(ta2$Sub_metering_2)
ta2$Sub_metering_1 <- as.numeric(ta2$Sub_metering_1)
ta2$Sub_metering_2 <- as.numeric(ta2$Sub_metering_2)
plot(x = ta2$Date, y = ta2$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
points(ta2$Date, ta2$Sub_metering_2, type = "l", col = "red" )
points(ta2$Date, ta2$Sub_metering_3, type = "l", col = "blue" )
legend("topright", pch = "-", col = c("black", "red", "blue"), cex = 1, legend = c("sub metering 1", "sub metering 2", "sub metering 3"))
dev.copy(png, file = "plot3.png", width = 609, height = 400)
dev.off()
setwd(wd)