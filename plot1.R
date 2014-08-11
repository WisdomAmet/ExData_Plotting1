#SETTING WORKING DIRECTORY
setwd("~/coursera")

#READING THE WHOLE DATA INTO R
HPC = read.table("household_power_consumption.txt",
	 header = TRUE, sep = ";", na.strings = "?")

#SUBSETTING THE DATA 
DataOne = subset(HPC, HPC$Date == "1/2/2007")
DataTwo = subset(HPC, HPC$Date == "2/2/2007")
NewData = rbind(DataOne, DataTwo)

#PLOTTING OF HISTOGRAM AND SAVING IT AS plot1.png 
#with width = 480 pixels and height = 480 pixels

png(filename ="plot1.png", width = 480, height = 480)
hist(NewData$Global_active_power, col = "red", 
	xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()

