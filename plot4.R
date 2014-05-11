if("sqldf" %in% rownames(installed.packages()) == FALSE) install.packages("sqldf")
library(sqldf)


directory <- "ExData_Plotting1" #for saving images

datapath <- file.path("household_power_consumption.txt")
mydata <- read.csv(datapath,na.strings="?",sep=";",header=TRUE)
gooddata <- mydata[mydata$Date=="1/2/2007" | mydata$Date=="2/2/2007", ]
rm(mydata)

gooddata$Time <- strptime(paste(gooddata$Date,gooddata$Time),"%d/%m/%Y %H:%M:%S")
gooddata$Date <- as.Date(gooddata$Date,"%d/%m/%Y")

png(filename=file.path(directory,"plot4.png"), height=480, width=480,bg="transparent")

par(mfrow=c(2,2), cex=0.75)

with(gooddata, {
    
    plot(Time,
         Global_active_power,
         type="l",
         main="",
         ylab="Global Active Power",
         xlab="")
    
    
    plot(Time,
         Voltage,
         ylab="Voltage",
         type="l",
         xlab="datetime")
    
    
    plot(Time,
         Sub_metering_1, 
         col=c("black","red","blue"),
         type="l",
         main="",
         ylab="Energy sub metering",
         xlab="")
    points(Time,Sub_metering_2,type="l",col="red")
    points(Time,Sub_metering_3,type="l",col="blue")
    legend("topright", 
           lty=1,
           bty="n",
           col = c("black", "red","blue"), 
           legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
    
    
    plot(Time,
         Global_reactive_power,
         type="l",
         xlab="datetime")
})

dev.off()

