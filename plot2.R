
plot2 <- function(){
      data <- read.table("household_power_consumption.txt", header=TRUE, sep = ';',na.strings='?')
      data$Date <-  as.Date((paste(as.Date(data$Date, format="%d/%m/%Y"), data$Time)), format="%Y-%m-%d %H:%M:%S")
      data <- subset(data, data$Date %in% as.Date(c('1/2/2007','2/2/2007'), format="%d/%m/%Y"))
      data$Date <-  strptime((paste(as.Date(data$Date, format="%d/%m/%Y"), data$Time)), format="%Y-%m-%d %H:%M:%S")
      plot(data$Date,data$Global_active_power, main='', xlab='',ylab='Global Active Power (kilowatts)', type='l')
      dev.copy(png, file='plot2.png')
      dev.off()
}
      