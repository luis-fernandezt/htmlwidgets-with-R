library("tidyverse")
library("visNetwork")

# ======= Basic network

map_nodes <- read_csv("data/nodes.csv")
map_edges <- read_csv("data/edges.csv")

map_nodes <- map_nodes %>%
  mutate(id = row_number()) %>%
  mutate(title = location,
         label = city) %>%
  select(id, everything())

map_edges <- map_edges %>%
  mutate(
    from = plyr::mapvalues(send.location, from = map_nodes$location, to = map_nodes$id),
    to = plyr::mapvalues(receive.location, from = map_nodes$location, to = map_nodes$id)
  ) %>%
  select(from, to, everything())

visNetwork(map_nodes,
           map_edges)

letters_igraph <- graph.data.frame(map_edges, vertices = map_nodes)