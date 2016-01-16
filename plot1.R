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
ta2$Date <- strptime(ta2$Date, "%d/%m/%Y")
ta2$Global_active_power <- as.character(ta2$Global_active_power)
ta2$Global_active_power <- as.numeric(ta2$Global_active_power)
with(ta2, hist(Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power"))
dev.copy(png, file = "plot1.png")
dev.off()
setwd(wd)