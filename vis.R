# Caitlin Ruhland
# caitlinruhland@arizona.edu
# Created: 05/24/2023
# Purpose: intro ggplot2


# Libraries: --------------------------------------------------------------

library(ggplot2)
library(dplyr)
library(tidyr)
library(gapminder)
library(emoGG)

# Making a Visualization: -------------------------------------------------

ggplot(data = gapminder,
       mapping = aes(x = gdpPercap, y = lifeExp)) + 
#  geom_emoji(emoji = "1f436")
  geom_point(alpha = 0.5, color = "purple") +
  scale_x_log10() +
  geom_smooth(method = "lm", linewidth = 3)

ggplot(gapminder, 
       aes(x = year, y = lifeExp, group = country)) +
  geom_point() +
  geom_line(aes(color = continent))

# Visualize only the Americas

americas <- gapminder %>% 
  filter(continent == "Americas")

# Plot Americas

ggplot(americas, 
       aes(x = year, y = lifeExp, group = country)) +
  geom_point() +
  geom_line() +
  facet_wrap(~country) +
  labs(x = "Year",
       y = "Life Expectancy",
       title = "Title")
