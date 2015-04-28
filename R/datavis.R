library(ggplot2)
gapminder <- read.csv("data/gapminder.csv")

# scatterplot of lieExp vs gdpPercap
ggplot(gapminder, 
       aes(x=gdpPercap, y=lifeExp)) +
  geom_point()

p <- ggplot(gapminder, 
            aes(x=gdpPercap, y=lifeExp))
p + geom_point()
p2 <- p + geom_point()
p2   # or: print(p2)

p3 <- p2 + scale_x_log10()
p3

#Challenge 1
ggplot(gapminder[gapminder$country == "China",], aes(x=gdpPercap, y=lifeExp)) +
  geom_point() #+ scale_x_log10()

library(dplyr)
ggplot(gapminder %>% filter(country == "China"), aes(x=gdpPercap, y=lifeExp)) +
  geom_point() #+ scale_x_log10()

(p_china <- gapminder %>%
  filter(country == "China") %>%
  ggplot(aes(x=gdpPercap, y=lifeExp)) +
  geom_point())

# Challenge 2 - mess with aes variables
p <- ggplot(gapminder, aes(x=gdpPercap, y=lifeExp))
p2 <- p + geom_point() + scale_x_log10()
p2 + aes(size=pop)
p2 + aes(color=pop)
p2 + aes(shape=continent)
p2 + aes(color=as.factor(year), alpha=0.5, shape=continent, size=4)
p2 + aes(color=log(pop))

p_china + geom_point(color="lightblue", size=5) + geom_line(color="violetred")

#Challenge 3
gapminder %>%
  filter(country == "China" | country == "India") %>%
  ggplot(aes(x=gdpPercap, y=lifeExp, group=country)) +
  geom_line() +
  geom_point(aes(color=country), size=4)

#histogram
gapminder %>%
  filter(year == 2007) %>%
  ggplot(aes(x=lifeExp, fill=continent)) + 
  geom_histogram(binwidth=2.5, color="black")

#boxplot
gapminder %>%
  filter(year == 2007) %>%
  ggplot(aes(y=lifeExp, x=continent)) + 
  geom_boxplot()

#back to points, with jitter
gapminder %>%
  filter(year == 2007) %>%
  ggplot(aes(y=lifeExp, x=continent)) +
  geom_point(position=position_jitter(width=0.1, height=0))

#or both points and boxplots
gapminder %>%
  filter(year == 2007) %>%
  ggplot(aes(y=lifeExp, x=continent)) +
  geom_boxplot() +
  geom_point(position=position_jitter(width=0.1, height=0))
    #he said as homework you could try to remove just the last boxplot

#faceting
ggplot(gapminder,
       aes(x=gdpPercap, y=lifeExp)) +
  geom_point() + scale_x_log10() +
  facet_grid(~ continent) #split horizontally

ggplot(gapminder,
       aes(x=gdpPercap, y=lifeExp)) +
  geom_point() + scale_x_log10() +
  facet_grid(continent ~ .) #split vertically

ggplot(gapminder,
       aes(x=gdpPercap, y=lifeExp)) +
  geom_point() + scale_x_log10() +
  facet_grid(continent ~ year) #grid

ggplot(gapminder,
       aes(x=gdpPercap, y=lifeExp)) +
  geom_point() + scale_x_log10() +
  facet_wrap(~ continent) #split horizontally

ggplot(gapminder,
       aes(x=gdpPercap, y=lifeExp, color=continent)) +
  geom_point() + scale_x_log10() +
  facet_wrap(~ year) #split horizontally

p <- gapminder %>%
  filter(country %in% c("Norway","Sweden","Finland","Denmark","Iceland","United States")) %>%
  ggplot(aes(x=gdpPercap, y=lifeExp)) +
  geom_line(aes(color="lightblue", guide="none"), size=1) + 
  geom_point(aes(color="red", guide="none"), size=3) + 
  facet_wrap(~ country) + ylab("Life Expectancy (years)") + 
  xlab("GDP per capita") + theme(legend.position="none")

#can also do the filter with:
#filter(country == "Norway" | country == "Sweden" | country == "Finland" | 
#country == "Denmark" | country == "Iceland")

library(ggthemes)
p + theme_wsj()
#you can save your own themes too

ggsave("test2.png", p, height=7, width=10)
