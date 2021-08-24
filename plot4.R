##Formatting data
powerdatatab <- data.table::fread(input = "household_power_consumption.txt", na.strings="?")

powerdatatab[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]

powerdatatab[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]

powerdatatab <- powerdatatab[(dateTime >= "2007-02-01") & (dateTime <= "2007-02-02")]

## Plot 4
png("plot4.png", width=480, height=480)

par(mfrow=c(2,2))

plot(powerdatatab[, dateTime], powerdatatab[, Global_active_power], type="l", xlab="", ylab="Global Active Power")

plot(powerdatatab[, dateTime], powerdatatab[, Voltage], type="l", xlab="datetime", ylab="Voltage")

plot(powerdatatab[, dateTime], powerdatatab[, Sub_metering_1], type = "l", xlab = "", ylab = "Energy sub metering")
lines(powerdatatab[, dateTime], powerdatatab[, Sub_metering_2], col =c("red"))
lines(powerdatatab[,dateTime], powerdatatab[,Sub_metering_3], col=c("Blue"))
legend("topright", col=c("black","red","blue"), c("sub_metering_1", "sub_metering_2","Sub_metering_3"), lty=c(1,1), lwd=c(1,1))

plot(powerdatatab[, dateTime], powerdatatab[, Global_reactive_power], type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()