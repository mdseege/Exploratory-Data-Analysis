#download household power file
hpc <- read.table("household_power_consumption.txt",header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".", na.strings = "?")

#subset dates
hpcDate <- hpc[hpc$Date == "1/2/2007" | hpc$Date == "2/2/2007",]

#change dates to date format
hpcDate$Date <- as.Date(hpcDate$Date, "%d/%m/%Y")

#paste date and time in new column
hpcDate$datetime <- strptime(paste(hpcDate$Date, hpcDate$Time),"%Y-%m-%d %H:%M:%S")

png("plot4.png", height = 480, width = 480)
par(mfrow= c(2, 2))

plot(hpcDate$datetime, hpcDate$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
plot(hpcDate$datetime, hpcDate$Voltage, type ="l", xlab = "datetime", ylab = "Voltage")
plot(hpcDate$datetime, hpcDate$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(hpcDate$datetime, hpcDate$Sub_metering_2, col = "red", type = "l")
lines(hpcDate$datetime, hpcDate$Sub_metering_3, col = "blue", type = "l")
legend("topright",x.intersp = .5 ,y.intersp = .5 ,xjust = 0, yjust = 1, cex = 1 ,c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

plot(hpcDate$datetime, hpcDate$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")


dev.off()
?legend
