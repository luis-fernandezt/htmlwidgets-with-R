## https://colorbrewer2.org/

lifeExp_quantile_palette <- colorQuantile("YlOrRd", gapminder_world$lifeExp)

lifeExp_bin_palette <-  colorBin("YlOrRd", domain = gapminder_world$lifeExp, bins = 5)

gapminder_world |>
  leaflet() |>
  addPolygons(weight = 1,
              label = ~name,
              popup = ~paste("Country", name, "<br/", pop),
              color = ~lifeExp_bin_palette(lifeExp))

gapminder_world |>
  leaflet() |>
  addPolygons(weight = 1,
              label = ~name,
              popup = ~paste("Country", name, "<br/", pop),
              color = ~lifeExp_quantile_palette(lifeExp))
