library("tidyverse")
library("plotly")


## Scatter Plot
scatter_data <- read_csv("data/scatter_data.csv") %>%
  mutate(color = plyr::mapvalues(
    type,
    from = c("Concordant", "Discordant"),
    to = c("#1b9e77", "#fc8d62")
  ))

plot(
  rep(1, 2),
  col = c("#1b9e77", "#fc8d62"),
  pch = 19,
  cex = 3
)

scatter_data %>%
  plot_ly() %>%
  add_trace(
    x = ~ x,
    y = ~ y,
    color = ~ type,
    colors = ~ color,
    type = 'scatter',
    mode = "markers",
    opacity = 0.8
  )

## Using factors for scatter plot

scatter_data %>%
  mutate(new.column = recode(type, "Concordant" = "Green", "Discordant" = "Orange")) %>%
  # mutate(new.column = factor(new.column, levels = c("Green", "Orange"))) %>%
  plot_ly() %>%
  add_trace(
    x = ~ x,
    y = ~ y,
    color = ~ new.column,
    text = ~ type,
    colors = c("#1b9e77", "#fc8d62"),
    type = 'scatter',
    mode = "markers",
    opacity = 0.8
  )

## Line Charts

lines_data <- read_csv("data/lines_data.csv")

lines_data %>%
  mutate(new.column = plyr::mapvalues(
    trace,
    from = c(
      "[MQ 16] Local",
      "[MQ 16] Thesaurus",
      "[MQ 1] Local",
      "[MQ 1] Thesaurus",
      "Mutect"
    ),
    to = c("light blue",
           "dark blue",
           "light green",
           "dark green",
           "pink")
  )) %>%
  plot_ly() %>%
  add_trace(
    x = ~ x,
    y = ~ y,
    color = ~ new.column,
    text = ~ trace,
    colors = c("#a6cee3", "#1f78b4", "#b2df8a", "#33a02c", "#fb9a99"),
    type = 'scatter',
    mode = "lines+markers",
    opacity = 0.8
  ) %>%
  layout(yaxis = list(type = "log"))
