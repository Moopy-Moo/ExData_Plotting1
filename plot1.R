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
data_sub$Date<-strptime(data_sub$Date,format="%d/%m/%Y")
hist(data_sub$Global_active_power,
     xlab="Global Active Power (kilowatts)",
     ylab = "Frequency",
     col="red",
     main=("Global Active Power"))
dev.copy(png,file="plot1.png",
         width=480,
         height=480)
dev.off()