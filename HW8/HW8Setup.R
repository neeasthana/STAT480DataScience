library(dplyr)
library(ggplot2movies)

newdata<-ggplot2movies::movies
newdata["rating"]<-round(newdata["rating"])

newdata %>%
  group_by(rating, mpaa) %>%
  tally %>%
  ungroup -> mpaaratings

