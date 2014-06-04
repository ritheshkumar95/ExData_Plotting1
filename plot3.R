plot3 <- function()
{
  X <- read.table("household_power_consumption.txt",sep=";")
  data <- X
  data <- X[-1,]
  data[,1] <- as.Date(data[,1],format="%d/%m/%Y")
  temp1 <- data[which(data[,1]=="2007-02-01"),]
  temp2 <- data[which(data[,1]=="2007-02-02"),]
  reqdata <- rbind(temp1,temp2)
  names(reqdata)[1] <- "date"
  names(reqdata)[2] <- "time"
  datetime <- as.POSIXct(paste(reqdata$date, reqdata$time), format="%Y-%m-%d %H:%M:%S")
  png(file="plot3.png",height=480,width=480)
  plot(y=as.numeric(as.character(reqdata[,7])),x=datetime,type="l",col="darkblue",ylab="Energy Sub Metering",xlab="")
  lines(y=as.numeric(as.character(reqdata[,8])),x=datetime,type="l",col="red")
  lines(y=as.numeric(as.character(reqdata[,9])),x=datetime,type="l",col="blue")
  legend("topright",lty=1,col=c("darkblue","red","blue"),legend=c("sub_metering_1","sub_metering_2","sub_metering_3"),cex=0.7)
  dev.off()
}