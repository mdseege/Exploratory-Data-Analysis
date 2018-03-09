gcd.zip <- download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile = "eda.zip")
unzip("eda.zip")

#download household power file
hpc <- read.table("household_power_consumption.txt",header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".", na.strings = "?")

#subset dates
hpcDate <- hpc[hpc$Date == "1/2/2007" | hpc$Date == "2/2/2007",]

hpcDate$Date <- as.Date(hpcDate$Date, "%d/%m/%Y")

hpcDate$datetime <- strptime(paste(hpcDate$Date, hpcDate$Time),"%Y-%m-%d %H:%M:%S")


plot(hpcDate$datetime, hpcDate$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
