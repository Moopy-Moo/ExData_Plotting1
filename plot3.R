# Please change the work directory to the appropriate folder on your laptop
setwd("C:/Users/jwang/Desktop/coursera/data science/Assignment4")
# Optional testing for system running time and memory used to read the file
# system.time(read.table("household_power_consumption.txt"))
# memory.size(read.table("household_power_consumption.txt"))
data<-read.table("household_power_consumption.txt",
                 sep = ";",
                 na.strings = "?",
                 header = TRUE,
                 nrows=2075260)
# Convert Date into character for easier strptime read
data$Date<-as.character(data$Date)
data_sub1<-subset(data,Date == c("1/2/2007"))
data_sub2<-subset(data,Date == c("2/2/2007"))
data_sub<-rbind(data_sub1,data_sub2)
data_sub$Time<-as.character(data_sub$Time)
data_sub$Date<-gsub("1/2/","01/02/",data_sub$Date)
data_sub$Date<-gsub("2/2/","02/02/",data_sub$Date)
data_sub$Time<-paste(data_sub$Date,data_sub$Time,sep=" ")
data_sub$Time<-as.POSIXlt(data_sub$Time,tz="",format("%d/%m/%Y %H:%M:%S"))
plot(data_sub$Time,data_sub[,7],
     xlab="",
     ylab="Energy sub metering",
     type="l",
     ylim=c(0,max(data_sub[,7:9]))
     )
par(new=TRUE)
plot(data_sub$Time,data_sub[,8],
     type="l",
     xlab="",
     ylab="",
     ylim=c(0,max(data_sub[,7:9])),
     xaxt="n",
     yaxt="n",
     col="red")
par(new=TRUE)
plot(data_sub$Time,data_sub[,9],
     type="l",
     xlab="",
     ylab="",
     ylim=c(0,max(data_sub[,7:9])),
     xaxt="n",
     yaxt="n",
     col="blue")
par(new=TRUE)
legend("topright",col=c("black","red","blue"),lty=1,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.copy(png,file="plot3.png",
         width=480,
         height=480)
dev.off()