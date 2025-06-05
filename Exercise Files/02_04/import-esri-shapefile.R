library("sf")

world_shapefiles <- read_sf(dsn = "Exercise Files/02_04/data-raw/world-shape-files/")

class(world_shapefiles)

library("gapminder")
library("tidyverse")

gapminder_most_recent <- gapminder %>%
  mutate_if(is.factor, as.character) %>%
  filter(year == max(year)) %>%
  select(-continent, -year) %>%
  rename(name = country)

gapminder_world <- world_shapefiles %>%
  left_join(gapminder_most_recent)

gapminder_world %>%
  select(name, lifeExp)

gapminder_world$lifeExp
