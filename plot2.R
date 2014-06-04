plot2 <- function()
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
  png(file="plot2.png",height=480,width=480)
  datetime <- as.POSIXct(paste(reqdata$date, reqdata$time), format="%Y-%m-%d %H:%M:%S")
  plot(y=as.numeric(as.character(reqdata[,3])),x=datetime,type="l")
  dev.off()
}