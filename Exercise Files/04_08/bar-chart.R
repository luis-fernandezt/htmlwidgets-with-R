library("tidyverse")
library("highcharter")

gig_economy_data <- read_csv("data/gig-economy-data.csv")

## Bar chart
gig_economy_data %>%
  group_by(country_group) %>%
  summarise(jobs.in.country = n()) %>%
  mutate(percentage.of.jobs = 100 * jobs.in.country / sum(jobs.in.country)) %>%
  hchart(type = "bar",
         hcaes(
           x = country_group,
           y = percentage.of.jobs
         ))
