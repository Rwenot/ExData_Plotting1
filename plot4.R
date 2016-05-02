##Exploratory Data Analysis week 1 project
##Plot 4 of 4

##Get the data, format date, and subset two days of interest
plot4 <- function() {
    x<-read.table("household_power_consumption.txt",stringsAsFactors=FALSE,sep=";",header=TRUE,
        na.strings = "?",colClasses=c("character","character","numeric","numeric","numeric",
        "numeric","numeric","numeric","numeric"))
    x$Date<-as.Date(x$Date,"%d/%m/%Y")
    x<-x[x$Date >= "2007-02-01" & x$Date <= "2007-02-02",]
  
##open png device
    png(filename = "plot4.png", width = 480, height = 480, pointsize = 10)
    
##set up four-plots layout    
    par(mfcol=c(2,2))
    
##upper left plot    
    plot(x$Global_active_power,x$date,type="l",xlab="",xaxt="n",ylab="Global Active Power")
    axis(1,at=c(1,1440,2880),labels=c("Thu","Fri","Sat"))
    
##lower left plot    
    plot(x$Sub_metering_1,x$date,type="l",xlim=c(1,2880),ylim=c(0,40),xlab="",xaxt="n",
        ylab="Energy sub metering")
    par(new=TRUE)
    plot(x$Sub_metering_2,x$date,type="l",xlim=c(1,2880),ylim=c(0,40),xlab="",ylab="",
        axes=FALSE,col="Red")
    par(new=TRUE)
    plot(x$Sub_metering_3,x$date,type="l",xlim=c(1,2880),ylim=c(0,40),xlab="",ylab="",
        axes=FALSE,col="Blue")
    axis(1,at=c(1,1440,2880),labels=c("Thu","Fri","Sat"))
    legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
        lty=c(1,1,1),col=c("Black","Red","Blue"))    
    
##upper right plot
    plot(x$Voltage,x$date,type="l",xlab="datetime",xaxt="n",ylab="Voltage")
    axis(1,at=c(1,1440,2880),labels=c("Thu","Fri","Sat")) 
    
##lower right plot
    plot(x$Global_reactive_power,x$date,type="l",xlab="datetime",xaxt="n",ylab="Global_reactive_power")
    axis(1,at=c(1,1440,2880),labels=c("Thu","Fri","Sat"))
    
##close png device    
    dev.off()
    par(new=FALSE)
    return(NULL)
}
