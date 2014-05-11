if("sqldf" %in% rownames(installed.packages()) == FALSE) install.packages("sqldf")
library(sqldf)


directory <- "ExData_Plotting1" #for saving images

datapath <- file.path("household_power_consumption.txt")
mydata <- read.csv(datapath,na.strings="?",sep=";",header=TRUE)
gooddata <- mydata[mydata$Date=="1/2/2007" | mydata$Date=="2/2/2007", ]
rm(mydata)

gooddata$Time <- strptime(paste(gooddata$Date,gooddata$Time),"%d/%m/%Y %H:%M:%S")
gooddata$Date <- as.Date(gooddata$Date,"%d/%m/%Y")


png(filename=file.path(directory,"plot2.png"), height=480, width=480,bg="transparent")

with(gooddata,plot(Time,
                   Global_active_power, 
                   type="l",
                   main="",
                   ylab="Global Active Power (kilowatts)",
                   xlab=""))

#dev.copy(png,file=file.path(directory,"plot2.png"))
dev.off()
