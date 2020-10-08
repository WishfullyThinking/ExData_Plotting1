tab<-read.table("exdata_data_household_power_consumption/household_power_consumption.txt", sep=";", header = TRUE, stringsAsFactors = FALSE)
tab$Date<-as.Date(tab$Date, format="%d/%m/%Y")
des<-subset(tab, tab$Date==as.Date("2007-02-01")|tab$Date==as.Date("2007-02-02"))
des$Global_active_power<-as.numeric(des$Global_active_power)

datetime<-as.POSIXct(paste(des$Date, des$Time), format="%Y-%m-%d %H:%M:%S")
plot(x=datetime, y=des$Global_active_power, type="l", col="black", xlab="", ylab="Global Active Power (kilowatts)")
dev.copy(png, "plot2.png")
dev.off()
