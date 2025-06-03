library("tidyverse")

## Scatter Plot
scatter_data <- read_csv("data/scatter_data.csv")

## Line Charts

lines_data <- read_csv("data/lines_data.csv")

## Bubble Chart

library("gapminder")
gapminder_oldest <- gapminder %>%
  filter(year == min(year))