directory <- "ExData_Plotting1" #for saving images

datapath <- file.path("household_power_consumption.txt")
mydata <- read.csv(datapath,na.strings="?",sep=";",header=TRUE)
gooddata <- mydata[mydata$Date=="1/2/2007" | mydata$Date=="2/2/2007", ]
rm(mydata)

gooddata$Time <- strptime(paste(gooddata$Date,gooddata$Time),"%d/%m/%Y %H:%M:%S")
gooddata$Date <- as.Date(gooddata$Date,"%d/%m/%Y")

png(filename=file.path(directory,"plot3.png"), height=480, width=480,bg="transparent")

with(gooddata,plot(Time,Sub_metering_1, 
                   col=c("black","red","blue"),
                   type="l",
                   main="",
                   ylab="Energy sub metering",
                   xlab=""))

with(gooddata,points(Time,Sub_metering_2,type="l",col="red"))
with(gooddata,points(Time,Sub_metering_3,type="l",col="blue"))

legend("topright", 
       lty=1,
       col = c("black", "red","blue"), 
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
           
dev.off()

