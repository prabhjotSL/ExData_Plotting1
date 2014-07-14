plot2<-function(){
  
  datatable<-read.table("household_power_consumption.txt", dec = ".",sep=";",header=TRUE,na.strings = "?")
  data_sub<-subset(datatable, Date == "1/2/2007" | Date == "2/2/2007")
  png(filename = "plot2.png", width = 480, height = 480)
  plot(data_sub$Global_active_power,type="l",yaxt="n",xaxt="n",xlab="",ylab="Global Active Power (kilowatts)")
  box()
  axis(2, c(0,2,4,6))
  mid=median(c(0,length(data_sub$Global_active_power)))
  maxim=length(data_sub$Global_active_power)
  axis(1,at=c(0,mid,maxim),c("Thu","Fri","Sat"))
  
  dev.off()
  
}