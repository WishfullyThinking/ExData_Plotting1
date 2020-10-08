tab<-read.table("exdata_data_household_power_consumption/household_power_consumption.txt", sep=";", header = TRUE, stringsAsFactors = FALSE)
tab$Date<-as.Date(tab$Date, format="%d/%m/%Y")
des<-subset(tab, tab$Date==as.Date("2007-02-01")|tab$Date==as.Date("2007-02-02"))
des$Global_active_power<-as.numeric(des$Global_active_power)

datetime<-as.POSIXct(paste(des$Date, des$Time), format="%Y-%m-%d %H:%M:%S")

par(mfcol=c(2,2))
plot(x=datetime, y=des$Global_active_power, type="l", col="black", xlab="", ylab="Global Active Power (kilowatts)")

plot(datetime, des$Sub_metering_1, col="black", xlab = "", ylab="Energy sub metering", type="l")
lines(datetime, des$Sub_metering_2, type="l", col = "orange")
lines(datetime, des$Sub_metering_3, type="l", col="blue")
legend("topright", legend=c("Sub metering 1", "Sub metering 2", "Sub metering 3"), col=c("black", "orange", "blue"), lty = rep(1, 3), cex=0.3)

plot(datetime, des$Voltage, ylab="Voltage", type="l")

plot(datetime, des$Global_reactive_power, ylab="Global_reactive_power", type="h")

dev.copy(png, "plot4.png")
dev.off()
