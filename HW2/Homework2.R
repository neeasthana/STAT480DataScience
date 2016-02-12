##CS 480 Homework 2
##Neeraj Asthana (nasthan2)

library(biganalytics)
library(foreach)

#Create database connection
setwd("/home/student/container-data/RDataScience/AirlineDelays")

##Q8
#Which is the best day of the week to fly?
#minimize average delay by day of the week
y <- attach.big.matrix("air0708.desc")

#Get mean arrival delays for each day
totalDayDelays <- foreach(i = 1:7, .combine=c) %do% {
  mean(y[y[,"DayOfWeek"]==i, "ArrDelay"], na.rm=TRUE)
}
totalDayDelays

##Q9
#Which is the best day of the month to fly?
#Get mean departure delays for each day
totalMonthDayDelays <- foreach(i = 1:31, .combine=c) %do% {
  mean(y[y[,"DayofMonth"]==i, "ArrDelay"], na.rm=TRUE)
}
totalMonthDayDelays

##Q14
#How much do weather delays contribute to arrival delay?
weatherDelays <- biglm.big.matrix( ArrDelay ~ WeatherDelay, data = y )
summary(weatherDelays)

#I will calculate the percentage of each arrival delays that is caused by weather delays where an arrival delay exists
arrDelayExists <- y[,"ArrDelay"] > 0
weatherDelays <- y[arrDelayExists,"WeatherDelay"]
arrDelays <- y[arrDelayExists,"ArrDelay"]
percentWeatherContrib <- mean (weatherDelays/ arrDelays, na.rm=TRUE)
percentWeatherContrib

##Q15
#Along with age, which other variables in the airline delay data set contribute to arrival delays?
#TaxiIn, TaxiOut, Distance, Diverted, CarrierDelay, NASDelay, SecurityDelay, LateAircraftDelay
taxiIn <- y[arrDelayExists,"TaxiIn"]
taxiOut <- y[arrDelayExists,"TaxiOut"]
Distance <- y[arrDelayExists,"Distance"]
Diverted <- y[arrDelayExists,"Diverted"]
CarrierDelay <- y[arrDelayExists,"CarrierDelay"]
NASDelay <- y[arrDelayExists,"NASDelay"]
SecurityDelay <- y[arrDelayExists,"SecurityDelay"]
LateAircraftDelay <- y[arrDelayExists,"LateAircraftDelay"]

blm <- biglm.big.matrix( ArrDelay ~ TaxiIn+TaxiOut+Distance+Diverted+CarrierDelay+NASDelay+SecurityDelay+LateAircraftDelay, data = y)
summary(blm)

percentCarrierContrib <- mean (CarrierDelay/ arrDelays, na.rm=TRUE)
