directory <- "ExData_Plotting1" #for saving images

datapath <- file.path("household_power_consumption.txt")
mydata <- read.csv(datapath,na.strings="?",sep=";",header=TRUE)
gooddata <- mydata[mydata$Date=="1/2/2007" | mydata$Date=="2/2/2007", ]
rm(mydata)

gooddata$Time <- strptime(paste(gooddata$Date,gooddata$Time),"%d/%m/%Y %H:%M:%S")
gooddata$Date <- as.Date(gooddata$Date,"%d/%m/%Y")

png(filename=file.path(directory,"plot1.png"), height=480, width=480,bg="transparent")

with(gooddata,hist(Global_active_power, 
                   breaks=12, 
                   col="red",
                   main="Global Active Power",
                   xlab="Global Active Power (kilowatts)"))

dev.off()

