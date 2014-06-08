
plot4 <- function(){
      data <- read.table("household_power_consumption.txt", header=TRUE, sep = ';',na.strings='?')
      data$Date <-  as.Date((paste(as.Date(data$Date, format="%d/%m/%Y"), data$Time)), format="%Y-%m-%d %H:%M:%S")
      data <- subset(data, data$Date %in% as.Date(c('1/2/2007','2/2/2007'), format="%d/%m/%Y"))
      data$Date <-  strptime((paste(as.Date(data$Date, format="%d/%m/%Y"), data$Time)), format="%Y-%m-%d %H:%M:%S")

      par(mfrow=c(2,2), mar=c(4,4,1,1))
      with(data,{
            plot(data$Date,data$Global_active_power, main='', xlab='',ylab='Global Active Power', type='l')
      
            plot(data$Date,data$Voltage, main='', xlab='datetime',ylab='Voltage', type='l')
      
            with(data, plot(data$Date,data$Sub_metering_1, main='', xlab='',ylab='Energy sub metering', type='n'))
            with(data, points(Date, Sub_metering_1, type='l'))
            with(data, points(Date, Sub_metering_2, type='l', col='red'))
            with(data, points(Date, Sub_metering_3, type='l', col='blue'))
            legend("topright",col=c('black','red','blue'), legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'), pch='_', bty='n')
      
            plot(data$Date,data$Global_reactive_power, main='', xlab='datetime',ylab='Global_reactive_power', type='l')
      })
      dev.copy(png, file='plot4.png')
      dev.off()
}
      