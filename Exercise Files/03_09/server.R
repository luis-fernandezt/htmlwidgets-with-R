library("tidyverse")
library("plotly")
library("shiny")

load("data/british_weather.rdata")


shinyServer(function(input, output, session) {
  
  output$british_weather_facet_wrap <- renderPlotly({
    
    gg_facet_weather <- british_weather %>%
      mutate(tdiff = tmax - tmin) %>%
      group_by(region, mm) %>%
      dplyr::summarise(average.tdiff = mean(tdiff, na.rm = TRUE)) %>%
      group_by(region)  %>%
      ggplot(aes(
        x = mm,
        y = average.tdiff,
        group = region,
        col = region
      )) +
      geom_line() +
      geom_point() +
      labs(x = "Month", y = "Mean daily temperature difference") +
      ggtitle("Mean daily temperature difference in the UK", subtitle = "Split by region") +
      facet_wrap( ~ region)
    
    
    ggplotly(gg_facet_weather)
    
  })
  
})