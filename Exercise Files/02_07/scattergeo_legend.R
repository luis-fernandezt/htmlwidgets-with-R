library("tidyverse")
library("leaflet")

capital_cities <- read_csv("Exercise Files/02_07/data/capitals_with_locations.csv")

capital_cities %>%
  leaflet() %>%
  addTiles() %>%
  addCircleMarkers(lng = ~capital.longitude,
             lat = ~capital.latitude) |>
  
  addLegend(colors = "blue",
            labels = "Capital City",
            position = "bottomleft")
