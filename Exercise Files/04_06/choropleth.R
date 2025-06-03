library("tidyverse")
library("sf")
library("geojsonio")

world_as_sf <- read_sf("data/world-shape-files/")
world_as_geojsn <- geojson_list(world_as_sf)


library("gapminder")

gapminder_most_recent <- gapminder %>%
  filter(year == max(year))