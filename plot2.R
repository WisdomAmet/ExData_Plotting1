setwd("~/coursera")
HPC = read.table("household_power_consumption.txt", header = T, sep = ";", na.strings = "?", stringsAsFactors =F)
HPC1 = subset(HPC, HPC$Date == "1/2/2007")
HPC2 = subset(HPC, HPC$Date == "2/2/2007")
HPCNew = rbind(HPC1, HPC2)

DateTime = paste(HPCNew$Date, HPCNew$Time)
HPCNew = cbind(HPCNew, DateTime)
HPCNew$DateTime = strptime(HPCNew$DateTime, "%d/%m/%Y %H:%M:%S")
HPCNew$DateTime = as.Date(HPCNew$DateTime)

png(filename = "plot2.png")
plot(HPCNew$DateTime, HPCNew$Global_active_power, type = "l", ylab = "Gobal active power (kilowatts)", xlab = "")
dev.off()
