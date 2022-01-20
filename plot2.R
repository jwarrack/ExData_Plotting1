sourcefile <- "household_power_consumption.txt"
data <- read.table(sourcefile, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")

# subsetting for dates
byDate <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

## plotting
png("plot2.png", height=480, width=480)
datetime <- strptime(paste(byDate$Date, byDate$Time, sep=" "), 
                     "%d/%m/%Y %H:%M:%S") 
plot(datetime, as.numeric(byDate$Global_active_power), 
     type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
