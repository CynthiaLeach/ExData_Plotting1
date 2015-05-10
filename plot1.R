plot1 <- function() {
        data <- read.table("~/Documents/Coursera/ExploratoryDataAnalysis/household_power_consumption.txt", header = FALSE, sep=";", na.strings="?", colClasses=c("character","character","numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), skip=66637, nrows=2880, stringsAsFactors=FALSE)
        header <- read.table("~/Documents/Coursera/ExploratoryDataAnalysis/household_power_consumption.txt", nrows=1, header = FALSE, sep=";", stringsAsFactors=FALSE)
        colnames(data) <- header
        data$datetime <- strptime(paste(data$Date,data$Time), format="%d/%m/%Y %H:%M:%S")
        png(file="plot1.png")
        hist(data$Global_active_power, xlab="Global Active Power (kilowatts)", main="Global Active Power", col="red", yaxt="n")
        axis(side=2, at=seq(0,1200, by=200))
        dev.off()
}
