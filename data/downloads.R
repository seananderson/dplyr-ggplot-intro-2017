# library(devtools)
# install_github("metacran/cranlogs")
library(cranlogs)
d <- cran_top_downloads("last-month", count = 20)

d <- cran_downloads(packages = "ggplot2", from = "2007-01-01", to = "last-day")

ggplot(d, aes(date, count)) + geom_point()

d <- cran_downloads(packages = c("dplyr", "plyr"), from = "2007-01-01", to = "last-day")
ggplot(d, aes(date, count)) + geom_point() + 
  facet_wrap(~package)
