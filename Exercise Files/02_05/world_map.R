library("sf")
library("gapminder")
library("tidyverse")
library("leaflet")

world_shapefiles <- read_sf(dsn = "Exercise Files/02_05/data-raw/world-shape-files/")

gapminder_most_recent <- gapminder %>%
  mutate_if(is.factor, as.character) %>%
  filter(year == max(year)) %>%
  select(-continent, -year) %>%
  rename(name = country)

gapminder_world <- world_shapefiles %>%
  left_join(gapminder_most_recent)

gapminder_world |>
  leaflet() |>
  addPolygons(weight = 1,
               label = ~name,
               popup = ~paste("Country", name, "<br/", pop))

names(gapminder_world)
