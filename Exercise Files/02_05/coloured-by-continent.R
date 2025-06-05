## https://colorbrewer2.org/

continent_aplette <- colorFactor("Dark2", unique(gapminder_world$continent))

gapminder_world |>
  leaflet() |>
  addPolygons(weight = 1,
              label = ~name,
              popup = ~paste("Country", name, "<br/", pop),
              color = ~continent_aplette(continent))
