sourcefile <- "household_power_consumption.txt"
data <- read.table(sourcefile, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")

# subsetting for dates
byDate <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

## plotting
png("plot1.png")
hist(as.numeric(byDate$Global_active_power), col = "red", 
     main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()