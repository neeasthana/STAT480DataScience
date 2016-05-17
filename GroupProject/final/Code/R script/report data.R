setwd("/home/student/container-data/project")
load("alldatadelay.RDdata")
alldata$Delay = ifelse(alldata$ArrDelay > 15, 1, 0)
alldata$ActDelay = ifelse(alldata$ArrDelay > 0, 1, 0)
save(alldata, file = "new.RDdata")
alldata[which(alldata$city == "Lafayette" & alldata$Year == 1999 & alldata$Delay == 1),]

alldata[which(alldata$city == "New York"&
                     alldata$ Year == 1999 &alldata$ArrDelay > 720),]
nrow(alldata[which(alldata$UniqueCarrier == "AS"& alldata$ FlightNum == 77),])
