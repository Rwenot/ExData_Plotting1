##Exploratory Data Analysis week 1 project
##Plot 2 of 4

##Get the data, format date, and subset two days of interest
plot2 <- function() {
    x<-read.table("household_power_consumption.txt",stringsAsFactors=FALSE,sep=";",header=TRUE,
        na.strings = "?",colClasses=c("character","character","numeric","numeric","numeric",
        "numeric","numeric","numeric","numeric"))
    x$Date<-as.Date(x$Date,"%d/%m/%Y")
    x<-x[x$Date >= "2007-02-01" & x$Date <= "2007-02-02",]

##open png device, make the plot, and close png device
    png(filename = "plot2.png", width = 480, height = 480, pointsize = 10)
    plot(x$Global_active_power,x$date,type="l",xlab="",xaxt="n",ylab="Global Active Power (kilowatts)")
    axis(1,at=c(1,1440,2880),labels=c("Thu","Fri","Sat"))
    dev.off()
    return(NULL)
}