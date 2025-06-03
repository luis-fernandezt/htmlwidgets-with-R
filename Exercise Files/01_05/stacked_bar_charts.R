## devtools::install_github("ox-it/oidnChaRts", build_vignettes = TRUE)
library("tidyverse")
library("oidnChaRts")

data_to_plot <- data_stacked_bar_chart %>%
  group_by(country_group, occupation) %>%
  summarise(total = sum(count)) %>%
  ungroup()

library("highcharter")
data_to_plot %>%
  stacked_bar_chart(
    library = "highcharter",
    categories.column = ~ country_group,
    subcategories.column = ~ occupation,
    value.column = ~ total
  )

library("plotly")
data_to_plot %>%
  stacked_bar_chart(
    library = "plotly",
    categories.column = ~ country_group,
    subcategories.column = ~ occupation,
    value.column = ~ total
  ) %>%
  layout(margin = list(l = 150),
         yaxis = list(title = ""))
