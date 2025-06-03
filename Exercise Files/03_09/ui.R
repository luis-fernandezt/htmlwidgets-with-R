library("plotly")

shinyUI(
  fluidPage(
    "Clicked marker coordinates:",
    plotlyOutput("british_weather_facet_wrap")
  )
)