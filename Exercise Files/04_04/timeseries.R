library("tidyverse")
library("lubridate")

online_labour_index <- read_csv("data/online_labour_index.csv")

online_labour_index <- online_labour_index %>%
  mutate(date = dmy(date))