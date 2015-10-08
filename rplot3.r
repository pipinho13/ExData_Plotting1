

####plot 3 
df <- tbl_df(read.table("household_power_consumption.txt", header=TRUE, sep= ";", na.strings = c("?","")))
df$Date <- as.Date(df$Date, format = "%d/%m/%Y")
df$timetemp <- paste(df$Date, df$Time)
df$Time <- strptime(df$timetemp, format = "%Y-%m-%d %H:%M:%S")
dfsubset<-subset(df, Date >= "2007-02-01" & Date<= "2007-02-02")  

png(file = "plot3.png", bg = "transparent", width = 480, height = 480)
plot(dfsubset$Time, dfsubset$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
lines(dfsubset$Time, dfsubset$Sub_metering_2, type="l", col="red")
lines(dfsubset$Time, dfsubset$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1","Sub_metering_2", "Sub_metering_3") , lty=c(1,1,1), col=c("black", "red", "blue"))
dev.off()
