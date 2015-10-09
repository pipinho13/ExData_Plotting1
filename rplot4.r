
#####plot 4 
###assuming that we have downloaded and unzip localy the dataset we create the table
df <- tbl_df(read.table("household_power_consumption.txt", header=TRUE, sep= ";", na.strings = c("?","")))
####create datetime
df$Date <- as.Date(df$Date, format = "%d/%m/%Y")
df$timetemp <- paste(df$Date, df$Time)
df$Time <- strptime(df$timetemp, format = "%Y-%m-%d %H:%M:%S")
####choose only the relevant dates
dfsubset<-subset(df, Date >= "2007-02-01" & Date<= "2007-02-02") 

png(file = "plot4.png", bg = "transparent", width = 480, height = 480)
par(mfrow=c(2,2))
plot(dfsubset$Time, dfsubset$Global_active_power, type="l", ylab= "Global Active Power", xlab="")
plot(dfsubset$Time, dfsubset$Voltage, type="l", ylab="Voltage", xlab="datetime")
plot(dfsubset$Time, dfsubset$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
lines(dfsubset$Time, dfsubset$Sub_metering_2, type="l", col="red")
lines(dfsubset$Time, dfsubset$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1","Sub_metering_2", "Sub_metering_3") , lty=c(1,1,1), col=c("black", "red", "blue"))
plot(dfsubset$Time, dfsubset$Global_reactive_power, type="l", ylab="Global_reactive_power", xlab="datetime")
dev.off()
