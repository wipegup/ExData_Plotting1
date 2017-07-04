##Read in Power data from data folder in working dir
energy<-read.table("./data/household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors = FALSE,na.strings="",check.names=FALSE, comment.char="", quote='\"')

#subset by desired dats
energy<-subset(energy,Date %in% c("1/2/2007","2/2/2007"))

#create single datetime variable then name it
energy<- cbind(strptime(paste(energy$Date,energy$Time),
                        "%d/%m/%Y %H:%M:%S"), energy[,3:9])
nm<-names(energy)
nm[1]<-"dateTime"
names(energy)<-nm

## convert characters to numeric
for(i in 2:7){
    energy[,i]<-as.numeric(energy[,i])
}

## create plot 2 and output
plot(energy$Global_active_power~energy$dateTime,type="l",ylab="Global Active Power (kilowatts)",xlab="")
dev.copy(png, file="plot2.png", width=480, height=480)
dev.off()
