
## Formatting the data

powerdatatab <- data.table::fread(input = "household_power_consumption.txt", na.strings="?")

powerdatatab[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]

powerdatatab <- powerdatatab[(dateTime >= "2007-02-01") & (dateTime <= "2007-02-02")]

datetime <- strptime(paste(powerdatatab$Date, powerdatatab$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

GlobPow <- as.numeric(powerdatatab$Global_active_power)

##Plot2
png("plot2.png", width=480, height=480)

plot(datetime, GlobPow, type="l", xlab="", ylab="Global Active Power (kilowatts)", labels="Thu","fri","Sat")

dev.off()
