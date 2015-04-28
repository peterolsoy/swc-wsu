#create new figure from gapminder dataset
gapminder <- read.csv("data/gapminder.csv")

library(ggplot2)
library(dplyr)

gapminder %>%
	filter(country == "United States") %>%
	ggplot(aes(x=year, y=pop)) +
	geom_line() + geom_point()
