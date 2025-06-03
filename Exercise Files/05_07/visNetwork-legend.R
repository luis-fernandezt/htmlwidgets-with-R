library("tidyverse")
library("visNetwork")

# ====== Clustering
## Data from https://www.kaggle.com/mylesoneill/game-of-thrones and manipulated by hand by https://shiring.github.io/

got_nodes <- read_csv("data/GoT_nodes.csv")
got_edges <- read_csv("data/GoT_edges.csv")

got_nodes <- got_nodes %>%
  mutate(group = superculture)