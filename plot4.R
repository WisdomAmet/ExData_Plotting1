setwd("~/coursera")
HPC = read.table("household_power_consumption.txt", header = T, sep = ";", na.strings = "?", stringsAsFactors =F)
HPC1 = subset(HPC, HPC$Date == "1/2/2007")
HPC2 = subset(HPC, HPC$Date == "2/2/2007")
HPCNew = rbind(HPC1, HPC2)

DateTime = paste(HPCNew$Date, HPCNew$Time)
HPCNew = cbind(HPCNew, DateTime)
HPCNew$DateTime = strptime(HPCNew$DateTime, "%d/%m/%Y %H:%M:%S")


png(filename = "plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))
plot(HPCNew$DateTime, HPCNew$Global_active_power, type = "l", ylab = "Global active power (kilowatts)", xlab = " ")
plot(HPCNew$DateTime, HPCNew$Voltage, type = "l", ylab = "Voltage", xlab = "datetime")
plot(HPCNew$DateTime, HPCNew$Sub_metering_1, type = "l", col = "black", ylab = "Energy sub metering", xlab = "")
        points(HPCNew$DateTime, HPCNew$Sub_metering_2, type ="l", col = "red")
        points(HPCNew$DateTime, HPCNew$Sub_metering_3, type ="l", col = "blue")
        legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, col = c("black", "red", "blue"))
plot(HPCNew$DateTime, HPCNew$Global_reactive_power, type = "l", ylab = "Global Reactive Power", xlab = "datetime")
dev.off()