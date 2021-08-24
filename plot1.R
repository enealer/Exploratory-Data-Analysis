library("data.table")

## Formatting the data

powerdatatab <- data.table::fread(input = "household_power_consumption.txt", na.strings="?")

powerdatatab[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]

powerdatatab[, Date := lapply(.SD, as.Date, "%d/%m/%Y"), .SDcols = c("Date")]

powerdatatab <- powerdatatab[(Date >= "2007-02-01") & (Date <= "2007-02-02")]

## Plot 1

png("plot1.png", width=480, height=480)

hist(powerdatatab[, Global_active_power], main="Global Active Power", xlab="Global Active Power (Kilowatts)", ylab="Frequency", col=c("red"))
dev.off()
