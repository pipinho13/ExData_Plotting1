
###plot 1
###assuming that we have downloaded and unzip localy the dataset we create the table
df <- tbl_df(read.table("household_power_consumption.txt", header=TRUE, sep= ";", na.strings = c("?","")))
####create datetime
df$Date <- as.Date(df$Date, format = "%d/%m/%Y")
df$timetemp <- paste(df$Date, df$Time)
df$Time <- strptime(df$timetemp, format = "%Y-%m-%d %H:%M:%S")
####choose only the relevant dates
dfsubset<-subset(df, Date >= "2007-02-01" & Date<= "2007-02-02") 

png(file = "plot1.png", bg = "transparent", width = 480, height = 480)
hist(dfsubset$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
