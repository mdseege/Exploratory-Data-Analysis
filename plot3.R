#download household power file
hpc <- read.table("household_power_consumption.txt",header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".", na.strings = "?")

#subset dates
hpcDate <- hpc[hpc$Date == "1/2/2007" | hpc$Date == "2/2/2007",]

hpcDate$Date <- as.Date(hpcDate$Date, "%d/%m/%Y")


hpcDate$datetime <- strptime(paste(hpcDate$Date, hpcDate$Time),"%Y-%m-%d %H:%M:%S")


plot(hpcDate$datetime, hpcDate$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(hpcDate$datetime, hpcDate$Sub_metering_2, col = "red", type = "l")
lines(hpcDate$datetime, hpcDate$Sub_metering_3, col = "blue", type = "l")
legend("topright",c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

dev.copy(png, file="plot3.png", height = 480, width = 480)
dev.off()
?legend
