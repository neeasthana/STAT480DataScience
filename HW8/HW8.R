library(dplyr)
library(ggplot2movies)
library(treemap)
library(MASS)

#STREAM GRAPHS
inst_pkgs = load_pkgs =  c("ggplot2","ggplot2movies", "dplyr","babynames","data.table","Rcpp")
git_pkgs = git_pkgs_load = c("streamgraph","DT")
load_pkgs = c(load_pkgs, git_pkgs_load)
pkgs_loaded = lapply(load_pkgs, require, character.only=T)

newdata<-ggplot2movies::movies
newdata["rating"]<-round(newdata["rating"])

newdata %>%
  group_by(rating, mpaa) %>%
  tally %>%
  ungroup -> mpaaratings

##Exercise 1
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





##Exercise 2
newdata %>% 
  group_by(year, rating) %>% 
  tally() -> dat

streamgraph(dat, "rating", "n", "year") %>%
  sg_fill_brewer("Spectral") %>%
  sg_axis_x(tick_units = "year", tick_interval = 10, tick_format = "%Y")



newdata %>% 
  group_by(year, mpaa) %>% 
  tally -> dat2

streamgraph(dat2, "mpaa", "n", "year") %>%
  sg_fill_brewer("PuOr") %>%
  sg_axis_x(tick_units = "year", tick_interval = 10, tick_format = "%Y")









##Exercise 3
##a
kdedata <- ggplot2movies::movies[,c("length", "rating")]
kdedata <- kdedata[kdedata[,"length"] <= 180,]

##b
band<-function(x)
{
  r <- quantile(x, c(0.25, 0.75))
  h <- (r[2] - r[1])/1.34
  4 * 1.06 * min(sqrt(var(x)), h) * length(x)^(-1/5)
}

h <- c(band(kdedata$length), band(kdedata$rating))
fit = kde2d(kdedata$length, kdedata$rating, h = h)
contour(fit, col = topo.colors(10))
