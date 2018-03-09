gcd.zip <- download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile = "eda.zip")
unzip("eda.zip")


library(dplyr)

#download household power file
hpc <- read.table("household_power_consumption.txt",header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".", na.strings = "?")
#subset dates
hpcDate <- hpc[hpc$Date == "1/2/2007" | hpc$Date == "2/2/2007",]

#create historgram
hist(hpcDate$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

#create plot1
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
