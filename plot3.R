plot3<-function(){
  
  datatable<-read.table("household_power_consumption.txt", dec = ".",sep=";",header=TRUE,na.strings = "?")
  data_sub<-subset(datatable, Date == "1/2/2007" | Date == "2/2/2007")
  png(filename = "plot3.png", width = 480, height = 480)
  plot(data_sub$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="",xaxt="n",col="black")
  lines(data_sub$Sub_metering_2,type="l",yaxt="n",xaxt="n",col="red")
  lines(data_sub$Sub_metering_3,type="l",yaxt="n",xaxt="n",col="blue")
  box()
  mid=median(c(0,length(data_sub$Sub_metering_1)))
  maxim=length(data_sub$Sub_metering_1)
  axis(1,at=c(0,mid,maxim),c("Thu","Fri","Sat"))
  legend("topright", lty=1, col=c("black","red","blue"), 
         legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  
  dev.off()
  
}
