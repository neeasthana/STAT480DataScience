library(dplyr)
library(ggplot2movies)
library(treemap)

newdata<-ggplot2movies::movies
newdata["rating"]<-round(newdata["rating"])

newdata %>%
  group_by(rating, mpaa) %>%
  tally %>%
  ungroup -> mpaaratings

##Problem 1
treemap(mpaaratings,
        index=c("mpaa"),
        vSize="n",
        vColor = "n",
        type="value")

treemap(mpaaratings,
        index=c("rating"),
        vSize="n",
        vColor = "n",
        type="value")

treemap(mpaaratings,
        index=c("rating", "mpaa"),
        vSize="n",
        vColor = "n",
        type="value")

treemap(mpaaratings,
        index=c("mpaa", "rating"),
        vSize="n",
        vColor = "n",
        type="value")


##Problem 2


##Problem 3