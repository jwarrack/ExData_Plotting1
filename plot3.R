sourcefile <- "household_power_consumption.txt"
data <- read.table(sourcefile, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")

# subsetting for dates
byDate <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

## plotting
png("plot3.png", height=480, width=480)
datetime <- strptime(paste(byDate$Date, byDate$Time, sep=" "), 
                     "%d/%m/%Y %H:%M:%S") 

#subMetering1
plot(datetime, subMetering1 <- as.numeric(byDate$Sub_metering_1),
     type="l", ylab="Energy Submetering", xlab="")

#subMetering2
lines(datetime, as.numeric(byDate$Sub_metering_2), type="l", col="red")

#subMetering3
lines(datetime, as.numeric(byDate$Sub_metering_3), type="l", col="blue")

#legend
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()