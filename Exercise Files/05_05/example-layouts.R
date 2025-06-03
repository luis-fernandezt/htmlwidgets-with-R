library("tidyverse")
library("visNetwork")
library("igraph")

## Data sources: https://www.kaggle.com/mylesoneill/game-of-thrones and manipulated by hand by https://shiring.github.io/

got_nodes <- read_csv("data/GoT_nodes.csv")
got_edges <- read_csv("data/GoT_edges.csv")

visNetwork(got_nodes, got_edges)

visNetwork(got_nodes, got_edges) %>%
  visIgraphLayout()

visNetwork(got_nodes, got_edges) %>%
  visIgraphLayout(layout = "layout.star")

visNetwork(got_nodes, got_edges) %>%
  visIgraphLayout(layout = "layout_on_grid")

visNetwork(got_nodes, got_edges) %>%
  visIgraphLayout(layout = "layout_on_sphere")


