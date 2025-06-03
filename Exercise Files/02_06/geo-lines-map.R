library("tidyverse")
library("leaflet")
library("sf")
library("geosphere")

geolines_data <- read_csv("data/geolines-data.csv")


leaflet() %>% 
  addTiles() %>%
  addPolylines(data = the_great_circles)