library("tidyverse")
library("leaflet")

capital_cities <- read_csv("Exercise Files/02_03/data/capitals_with_locations.csv")

# Additional map tiles: http://leaflet-extras.github.io/leaflet-providers/preview/index.html

capital_cities %>% 
leaflet() %>%
  addTiles() %>%
  addMarkers(lng = ~capital.longitude,
             lat = ~capital.latitude)
