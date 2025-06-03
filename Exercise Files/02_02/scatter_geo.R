library("tidyverse")

africa_data_points <- tibble(
  lat = rnorm(26, mean = 6.9, sd = 10),
  lng = rnorm(26, mean = 17.7, sd = 10),
  size = runif(26, 5, 10),
  label = letters
)


capital_cities <- read_csv("data/capitals_with_locations.csv")