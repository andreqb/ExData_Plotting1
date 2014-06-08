
plot1 <- function(){
      data <- read.table("household_power_consumption.txt", header=TRUE, sep = ';',na.strings='?')
      data$Date <-  as.Date((paste(as.Date(data$Date, format="%d/%m/%Y"), data$Time)), format="%Y-%m-%d %H:%M:%S")
      data <- subset(data, data$Date %in% as.Date(c('1/2/2007','2/2/2007'), format="%d/%m/%Y"))
      hist(as.numeric(data$Global_active_power), main='Global Active Power', xlab='Global Active Power (kilowatts)', col='red')
      dev.copy(png, file='plot1.png')
      dev.off()
}
      