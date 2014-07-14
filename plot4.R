plot4<-function(){
  
  datatable<-read.table("household_power_consumption.txt", dec = ".",sep=";",header=TRUE,na.strings = "?")
  
  data_sub<-subset(datatable, Date == "1/2/2007" | Date == "2/2/2007")
  png(filename = "plot4.png", width = 480, height = 480)
  par(mfrow=c(2,2))
  with(data_sub, {
    
    mid=median(c(0,length(data_sub$Sub_metering_1)))
    maxim=length(data_sub$Sub_metering_1)
    
    plot(data_sub$Global_active_power,type="l",ylab="Global Active Power",xlab="",xaxt="n",col="black")
    axis(1,at=c(0,mid,maxim),c("Thu","Fri","Sat"))
    box()
    
    plot(data_sub$Voltage,type="l",ylab="Voltage",xlab="",xaxt="n",col="black")
    axis(1,at=c(0,mid,maxim),c("Thu","Fri","Sat"))
    box()
    mtext("datetime",side=1,line=3,outer = FALSE)
    
    plot(data_sub$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="",xaxt="n",col="black")
    lines(data_sub$Sub_metering_2,type="l",yaxt="n",xaxt="n",col="red")
    lines(data_sub$Sub_metering_3,type="l",yaxt="n",xaxt="n",col="blue")
    box()
    axis(1,at=c(0,mid,maxim),c("Thu","Fri","Sat"))
    legend("topright", bty="n",lty=1, col=c("black","red","blue"), 
           legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
    
    plot(data_sub$Global_reactive_power,type="l",ylab="Global Reactive Power",xlab="",xaxt="n",col="black")
    axis(1,at=c(0,mid,maxim),c("Thu","Fri","Sat"))
    box()
    mtext("datetime",side=1,line=3,outer = FALSE)
  })
  dev.off()
  
}


