# I missed the first 30 min or so

# Data
getwd()
list.files()

gapminder <- read.csv("data/gapminder.csv")
head(gapminder)
class(gapminder)
str(gapminder)
summary(gapminder)

# Challenge 1
# Countries = 1704, rows=1704, cols=6

gapminder[1,1] #first row, first col
gapminder[1,3] #first row, third col
gapminder[500, 5:6] #500 row, 5th and 6th col

gapminder$pop
#equivalent to:
gapminder[, 5]
gapminder[, "pop"]

gapminder[gapminder$country == "Finland", ] #rows with country=Finland, keep all cols
gapminder[gapminder$pop <= 100000, c("country", "year")] #specify both 

gapminder[gapminder$lifeExp > 80, "country"]
min(gapminder$lifeExp) #Rwanda
gapminder[gapminder$lifeExp < 30, ]

library(dplyr)

select(gapminder, country, year, pop) #select columns
filter(gapminder, country == "Finland") #select rows

#pipe data frame through steps with %>%
gapminder_sml <- gapminder %>%
  filter(pop <= 100000) %>%
  select(country, year)
#order can matter, in the last example you can't flip filter and select since 'pop' col
#will not be in the new data frame
#or if you create a new col and then want to filter based on that

gapminder_challenge <- gapminder %>%
  filter(gdpPercap >= 35000) %>%
  select(country, year, gdpPercap)

gapminder %>%
  mutate(totalgdp = gdpPercap * pop) %>%
  head

gapminder %>%
  mutate(totalgdp = gdpPercap * pop) %>%
  group_by(continent) %>%
  summarize(meangdp = mean(totalgdp))

gapminder %>%
  mutate(totalgdp = gdpPercap * pop) %>%
  group_by(continent, year) %>%
  summarize(meangdp = mean(totalgdp))

gapminder %>%
  mutate(totalgdp = gdpPercap * pop) %>%
  group_by(continent, year) %>%
  summarize(meangdp = mean(totalgdp), 
            mingpd = min(totalgdp))

#max life expectancy by continent
gapminder %>%
  group_by(continent) %>%
  summarize(maxLifeExp = max(lifeExp))

#mean, min, and max life exp by year
gapminder %>%
  group_by(year) %>%
  summarize(meanLifeExp = mean(lifeExp),
            minLifeExp = min(lifeExp),
            maxLifeExp = max(lifeExp))

norway82 <- gapminder %>%
  filter(country == "Norway", year < 1982) %>%
  select(country, year, pop)

library(ggplot2)
