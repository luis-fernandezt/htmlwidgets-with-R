library("leaflet")

## Traditional syntax
addCircleMarkers(map = addTiles(map = leaflet()),
                 data = quakes)

## Pipe Syntax

leaflet() %>%
  addTiles() %>%
  addCircleMarkers(data = quakes)

# or

leaflet() |>
  addTiles() |>
  addCircleMarkers(data = quakes)
