file<-'household_power_consumption.txt'
con<-file(description=file,open="r")
library(sqldf)
mySql <- "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"
myFile <- "household_power_consumption.txt"
myData <- read.csv2.sql(myFile,mySql)
head(myData,n=3)
close(con)

x<-as.Date(myData$Date, format="%d/%m/%Y")
datetime <- paste(myData$Date, myData$Time)
xx<-strptime(datetime, format="%d/%m/%Y %H:%M:%S")
png(filename="plot3.png",width=480,height=480,units="px")
ncol<-c("black","red","blue")
lbls<-c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
with(myData,plot(xx,Sub_metering_1,ylab="Energy sub meering", xlab="",type="l",col="black"),
     lines(xx,myData$Sub_metering_2,type="l",col="red"),
     lines(xx,myData$Sub_metering_3,type="l",col="blue"),
     legend("topright",legend=lbls,col=lncol,lty="solid"))
     y<-dev.off()

plot(x=xx,y=myData$Sub_metering_1,ylab="Energy sub meering", xlab="",type="l",col="black")
lines(x=xx,y=myData$Sub_metering_2,ylab="Energy sub meering", xlab="",type="l",col="red")
lines(x=xx,y=myData$Sub_metering_3,ylab="Energy sub meering", xlab="",type="l",col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))