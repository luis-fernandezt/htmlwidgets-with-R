library("visNetwork")
library("tidyverse")
library("shiny")

## Data sources from https://www.kaggle.com/mylesoneill/game-of-thrones and manipulated by hand by https://shiring.github.io/

got_nodes <- read_csv("data/GoT_nodes.csv")
got_edges <- read_csv("data/GoT_edges.csv")


shinyServer(function(input, output, session) {
  output$remove_superculture_UI <- renderUI({
    selectInput(
      "remove_superculture",
      "Remove supercultures",
      choices = unique(got_nodes$superculture),
      multiple = TRUE,
      width = "100%"
    )
  })
  
  output$got_network <- renderVisNetwork({
    visNetwork(got_nodes, got_edges) %>%
      visIgraphLayout()
    
  })
  
  
})