##Exploratory Data Analysis week 1 project
##Plot 1 of 4

##Get the data, format date, and subset two days of interest
plot1 <- function() {
    x<-read.table("household_power_consumption.txt",stringsAsFactors=FALSE,sep=";",header=TRUE,
        na.strings = "?",colClasses=c("character","character","numeric","numeric","numeric",
        "numeric","numeric","numeric","numeric"))
    x$Date<-as.Date(x$Date,"%d/%m/%Y")
    x<-x[x$Date >= "2007-02-01" & x$Date <= "2007-02-02",]

##open png device, make the histogram, and close png device
    png(filename = "plot1.png", width = 480, height = 480, pointsize = 12)
    hist(x$Global_active_power,col = "Red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
    dev.off()
    return(NULL)
}