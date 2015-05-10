plot4 <- function() {
        data <- read.table("~/Documents/Coursera/ExploratoryDataAnalysis/household_power_consumption.txt", header = FALSE, sep=";", na.strings="?", colClasses=c("character","character","numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), skip=66637, nrows=2880, stringsAsFactors=FALSE)
        header <- read.table("~/Documents/Coursera/ExploratoryDataAnalysis/household_power_consumption.txt", nrows=1, header = FALSE, sep=";", stringsAsFactors=FALSE)
        colnames(data) <- header
        data$datetime <- strptime(paste(data$Date,data$Time), format="%d/%m/%Y %H:%M:%S")
        png(file="plot4.png")
        par(mfrow=c(2,2), mar=c(4,4,4,4), oma=c(0,0,0,0))
        with(data, {
                plot(datetime, Global_active_power, "l", xlab="", ylab="Global Active Power")
                plot(datetime, Voltage, "l")
                plot(datetime, Sub_metering_1, "l", col="black", xlab="", ylab="Energy sub metering")
                lines(datetime, Sub_metering_2, col="red")
                lines(datetime, Sub_metering_3, col="blue")
                legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"), lty=c(1,1), bty="n")
                plot(datetime, Global_reactive_power, "l")
        })
        dev.off()

}