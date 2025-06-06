library("sf")
library("gapminder")
library("tidyverse")
library("leaflet")

# Obtained maps from http://www.naturalearthdata.com/downloads/50m-cultural-vectors/

download.file(url = "https://www.naturalearthdata.com/http//www.naturalearthdata.com/download/50m/cultural/50m_cultural.zip", destfile = "Exercise Files/02_04/data/world-shape-files.zip")

unzip("data-raw/world-shape-files.zip", exdir = "Exercise Files/data-raw/world-shape-files")

world_shapefiles <- read_sf(dsn = "Exercise Files/02_04/data-raw/world-shape-files/")


gapminder_most_recent <- gapminder %>%
  mutate_if(is.factor, as.character) %>%
  filter(year == max(year)) %>%
  select(-continent, -year) %>%
  rename(name = country)

gapminder_world <- world_shapefiles %>%
  left_join(gapminder_most_recent)


qpal <- colorNumeric("Blues", gapminder_world$lifeExp, na.color = "#808080")

gapminder_world %>%
  leaflet() %>%
  addTiles() %>%
  addPolygons(
    stroke = FALSE,
    smoothFactor = 0.2,
    fillOpacity = 1,
    color = ~ qpal(lifeExp),
    label = ~ name,
    popup = ~ paste("Country:", name, "<br/>", "Life Expectancy:", lifeExp)
  ) %>%
  addLegend(pal = qpal, values = ~lifeExp, opacity = 1,
            title = paste0("Life Expectancy <br/>(Gapminder in ",max(gapminder$year, na.rm = TRUE), ")"))
