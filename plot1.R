plot1 <- function()
{
X <- read.table("household_power_consumption.txt",sep=";")
data <- X
data <- X[-1,]
data[,1] <- as.Date(data[,1],format="%d/%m/%Y")
temp1 <- data[which(data[,1]=="2007-02-01"),]
temp2 <- data[which(data[,1]=="2007-02-02"),]
reqdata <- rbind(temp1,temp2)
png(file="plot1.png",height=480,width=480)
hist(as.numeric(as.character(reqdata[,3])),xlab="Global Active Power (kilowatts)",ylab="Frequency",main="Global Active Power",col="red")
dev.off()
}