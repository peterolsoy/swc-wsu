# analyze some gapminder stuff with my own functions

# load data
gapminder <- read.csv("data/gapminder.csv")

# load my functions
source("R/func.R")

plot_year(1952)
plot_year(1962)
plot_year(1972)
plot_year(1982)
plot_year(1992)
plot_year(2002)

plot_country("United States")
plot_country(c("Egypt", "Nigeria", "Kenya", "Algeria"))
plot_country(c("Norway","Sweden","Finland","Denmark","Iceland","United States"))
