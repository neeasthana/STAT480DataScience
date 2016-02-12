##CS 480 Homework 1
##Neeraj Asthana (nasthan2)

library(RSQLite)
library(biganalytics)
library(foreach)

#Create database connection
setwd("/home/student/container-data/RDataScience/AirlineDelays")
delay.con <- dbConnect(RSQLite::SQLite(), dbname = "AirlineDelay.sqlite3")


##Q3
#flights per day of the week
dbGetQuery(delay.con, 
           "SELECT DayOfWeek, COUNT(DayOfWeek) FROM AirlineDelay WHERE DayOfWeek <> 0 GROUP BY DayOfWeek")


##Q4
#flights per day of the week for each week 
dbGetQuery(delay.con, "SELECT Year,DayOfWeek, COUNT(DayOfWeek) FROM AirlineDelay WHERE DayOfWeek <> 0 GROUP BY Year,DayOfWeek")


##Q5
#TailNum
dbGetQuery(delay.con, "SELECT Year, COUNT(*) FROM AirlineDelay WHERE TailNum = 'NA' GROUP BY Year")


##Q7
#minimize average delay by day of the week
y <- attach.big.matrix("airline.desc")

#Get mean departure delays for each day
totalDayDelays <- foreach(i = 1:7, .combine=c) %do% {
  mean(y[y[,"DayOfWeek"]==i, "DepDelay"], na.rm=TRUE)
}

#Therefore, Tuesday is the best day to minimize delays as it has the least average departure delay time
totalDayDelays


#Get mean departure delays for each hour
totalHourDelays <- foreach(i = 0:24, .combine=c) %do% {
  mean(y[floor(y[,"CRSDepTime"]/100)==i, "DepDelay"], na.rm=TRUE)
}
#Midnight 0 and 24 are the same thing and must be treated as such
#Take the mean of all CRSDepTimes that evaluate to 0 or 24 and store in the first index of totalHourDelays
#I will not include index 25 in my final results (corresponds to only 24 value)
midnight <- c(y[floor(y[,"CRSDepTime"]/100)==0, "DepDelay"], y[floor(y[,"CRSDepTime"]/100)==24, "DepDelay"])
totalHourDelays[1] <- mean(midnight, na.rm=TRUE)

#Therefore, 5:00AM is the best hour to minimize departure delays (1.532 min in delays)
totalHourDelays[1:24]

#disconnect from the database
dbDisconnect(delay.con)