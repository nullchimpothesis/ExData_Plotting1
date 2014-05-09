#Read the household_power_consumption.txt file into variable powerD------------
powerD<-fread("household_power_consumption.txt")
#Get subset of data only on dates 1/2/2007 and 2/2/2007------------------------
powerDsub<-subset(powerD, (( Date == "1/2/2007" | Date == "2/2/2007") 
                           & Date != "?"))
#Remove the main data set to free up memory------------------------------------
rm(powerD)
#Start a png device to plot the graph to---------------------------------------
png(filename="plot4.png", width=480, height=480)
#Set the number of rows and columns in the graph to 2--------------------------
par(mfrow = c(2,2))
#Draw a plot of the Global Active Power----------------------------------------
plot(as.POSIXct(paste(as.Date(powerDsub$Date, format="%d/%m/%Y"), 
                      powerDsub$Time, sep=" ")), 
     as.numeric(powerDsub$Global_active_power), type="l",
     ylab="Global Active Power",
     xlab="")

#Draw a plot of Voltage--------------------------------------------------------
plot(as.POSIXct(paste(as.Date(powerDsub$Date, format="%d/%m/%Y"), 
                      powerDsub$Time, sep=" ")), 
     as.numeric(powerDsub$Voltage), type="l",
     ylab="Voltage",
     xlab="datetime")

#Draw a plot for Energy Sub Metering-------------------------------------------
plot(as.POSIXct(paste(as.Date(powerDsub$Date, format="%d/%m/%Y"), 
                      powerDsub$Time, sep=" ")), 
     as.numeric(powerDsub$Sub_metering_1), type="n",
     ylab="Energy sub metering",
     xlab="")
#Add points for Sub Metering 1-------------------------------------------------
lines(as.POSIXct(paste(as.Date(powerDsub$Date, format="%d/%m/%Y"), 
                      powerDsub$Time, sep=" ")), 
     as.numeric(powerDsub$Sub_metering_1), type="l")
#Add points for Sub Metering 2-------------------------------------------------
lines(as.POSIXct(paste(as.Date(powerDsub$Date, format="%d/%m/%Y"), 
                        powerDsub$Time, sep=" ")), 
       as.numeric(powerDsub$Sub_metering_2), type="l", col="red")
#Add points for Sub Metering 3-------------------------------------------------
lines(as.POSIXct(paste(as.Date(powerDsub$Date, format="%d/%m/%Y"), 
                        powerDsub$Time, sep=" ")), 
       as.numeric(powerDsub$Sub_metering_3), type="l", col="blue")
#Add Legend--------------------------------------------------------------------
legend("topright", cex=0.8, lty=1, col=c("black", "red", "blue"), 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       bty="n")

#Draw a plot of the Global Reactive Power---------------------------------------
plot(as.POSIXct(paste(as.Date(powerDsub$Date, format="%d/%m/%Y"), 
                      powerDsub$Time, sep=" ")), 
     as.numeric(powerDsub$Global_reactive_power), type="l",
     ylab="Global_reactive_power",
     xlab="datetime")

#Turn the PNG Device Off-------------------------------------------------------
dev.off()