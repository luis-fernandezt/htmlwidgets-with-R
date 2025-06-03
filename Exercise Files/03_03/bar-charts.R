library("tidyverse")

gig_economy_data <- read_csv("data/gig-economy-data.csv")

## Bar chart
gig_economy_data %>%
  group_by(country_group) %>%
  summarise(jobs.in.country = n())


## Grouped bar chart
stacked_bar_data <- gig_economy_data %>%
  group_by(country_group, occupation) %>%
  summarise(jobs.in.occupation = n())


## Stacked bar chart