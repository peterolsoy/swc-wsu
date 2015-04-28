# functions for SWC at WSU

# convert fahrenheit to celsius
f2c <-
function(fahr) {
  return( (fahr - 32) * 5/9  ) 
}

#convert celsius to fahrenheit
c2f <-
  function(cels) {
    cels*(9/5) + 32
  }

#plot gdpPercat vs lifeExp for one year
plot_year <-
  function(year, data=gapminder) {
    the_year <- year
    
    library(ggplot2)
    library(dplyr)
    
    data %>%
      filter(year == the_year) %>%
      ggplot(aes(x=gdpPercap, y=lifeExp, color=continent)) +
      geom_point() + scale_x_log10()
  }

plot_country <-
  function(country, data=gapminder) {
    the_country <- country
    
    library(ggplot2)
    library(dplyr)
    
    data %>%
      filter(country %in% the_country)  %>% 
               ggplot(aes(x=gdpPercap, y=lifeExp, group=country)) +
      geom_line(aes(color=country)) + geom_point()
  }