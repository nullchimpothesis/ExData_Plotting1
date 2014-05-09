#Read the household_power_consumption.txt file into variable powerD------------
powerD<-fread("household_power_consumption.txt")
#Get subset of data only on dates 1/2/2007 and 2/2/2007------------------------
powerDsub<-subset(powerD, (( Date == "1/2/2007" | Date == "2/2/2007") 
                           & Date != "?"))
#Remove the main data set to free up memory------------------------------------
rm(powerD)
#Start a png device to plot the graph to---------------------------------------
png(filename="plot2.png", width=480, height=480)
#Draw a plot of the Global Active Power----------------------------------------
plot(as.POSIXct(paste(as.Date(powerDsub$Date, format="%d/%m/%Y"), 
                      powerDsub$Time, sep=" ")), 
     as.numeric(powerDsub$Global_active_power), type="l",
     ylab="Global Active Power (kilowatts)",
     xlab="")
#Turn the PNG Device Off-------------------------------------------------------
dev.off()