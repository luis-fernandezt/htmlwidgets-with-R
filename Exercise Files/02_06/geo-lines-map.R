library("tidyverse")
library("leaflet")
library("sf")
library("sp")
library("geosphere")

geolines_data <- read_csv("Exercise Files/02_06/data/geolines-data.csv")

geolines_data |> view()

start_locs <-  geolines_data |> select(start.longitude, start.latitude)

end_locs <-  geolines_data |> select(end.longitude, end.latitude)


the_great_circles <- gcIntermediate(p1 = start_locs,
                                    p2 = end_locs,
                                    n = 50,
                                    addStartEnd = T,
                                    sp = T) |> 
  SpatialLinesDataFrame(data = geolines_data) |> 
  st_as_sf()

  
# preparando data

class(the_great_circles)

the_great_circles <- SpatialLinesDataFrame(the_great_circles,
                                           data = geolines_data)

class(the_great_circles)

the_great_circles <-  st_as_sf(the_great_circles)

# running map

leaflet() |>
  addTiles() |>
  addPolylines(data = the_great_circles,
               weight = 2,
               label = ~paste("Start", start.location, "End", end.location)) |>
    addCircleMarkers(data = end_locs,
                   lat = ~end.latitude,
                   lng = ~end.longitude,
                   color = "red",
                   radius = 2)

library("oidnChaRts")
geo_lines_plot(data=geolines_data)
