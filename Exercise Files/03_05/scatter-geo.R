library("tidyverse")
library("oidnChaRts")

data_scatter_geo <- data_scatter_geo %>%
  separate(location.name, sep = ",", into = c("country", "city"), 
           extra = "merge")