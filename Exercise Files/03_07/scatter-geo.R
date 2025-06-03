library("tidyverse")
library("oidnChaRts")
library("plotly")

data_scatter_geo <- data_scatter_geo %>%
  separate(location.name, sep = ",", into = c("country", "city"), 
           extra = "merge")

data_scatter_geo %>%
  plot_geo() %>%
  add_trace(x = ~longitude,
            y = ~latitude,
            colors = "Paired",
            color = ~country,
            size = ~count,
            opacity = 0.9) %>%
  layout(geo = list(
    showlakes = TRUE,
    showrivers = TRUE,
    showcountries = TRUE,
    projection = list(type = 'Mercator')
  ))
