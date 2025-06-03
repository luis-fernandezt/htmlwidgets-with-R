library("tidyverse")
library("gapminder")
library("plotly")

gapminder_continents <- gapminder %>%
  mutate_if(is.integer, as.numeric) %>%
  group_by(continent, year) %>%
  mutate(continent.pop = sum(pop),
         continent.gdpPercap = mean(gdpPercap),
         continent.lifeExp = mean(lifeExp)) %>%
  select(-country, -pop, -lifeExp, -gdpPercap) %>%
  unique()

## == Single Chart
plot_ly(
  gapminder_continents
) %>%
  add_trace(x = ~year, 
            color = ~continent,
            y = as.formula(paste0("~", "continent.pop")),
            type = "scatter",
            mode = "line+markers") %>%
  layout(yaxis = list(
    title = "continent.pop"
  ))


## == Programmatically generate charts

gapminder_vars <- c("continent.pop", "continent.lifeExp", "continent.gdpPercap")
gap_plots <- lapply(gapminder_vars, function(var) {
  plot_ly(
    gapminder_continents
  ) %>%
    add_trace(x = ~year, 
              color = ~continent,
              y = as.formula(paste0("~", var)),
              type = "scatter",
              mode = "line+markers") %>%
    layout(yaxis = list(
      title = var
    ))
})
