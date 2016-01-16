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
ta2$Global_active_power <- as.character(ta2$Global_active_power)
ta2$Global_active_power <- as.numeric(ta2$Global_active_power)
with(ta2, plot(x = Date, y = Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)"))
dev.copy(png, file = "plot2.png")
dev.off()
setwd(wd)