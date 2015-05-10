plot2 <- function() {
        data <- read.table("~/Documents/Coursera/ExploratoryDataAnalysis/household_power_consumption.txt", header = FALSE, sep=";", na.strings="?", colClasses=c("character","character","numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), skip=66637, nrows=2880, stringsAsFactors=FALSE)
        header <- read.table("~/Documents/Coursera/ExploratoryDataAnalysis/household_power_consumption.txt", nrows=1, header = FALSE, sep=";", stringsAsFactors=FALSE)
        colnames(data) <- header
        data$datetime <- strptime(paste(data$Date,data$Time), format="%d/%m/%Y %H:%M:%S")
        png(file="plot2.png")
        with(data, plot(datetime, Global_active_power, "l", xlab="", ylab="Global Active Power (kilowatts)"))
        dev.off()
}