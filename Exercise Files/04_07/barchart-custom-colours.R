library("tidyverse")
library("highcharter")
library("RColorBrewer")

gig_economy_data <- read_csv("data/gig-economy-data.csv")

## Use tidyverse to add colours
gig_economy_data <- gig_economy_data %>%
  mutate(
    country.group.color = plyr::mapvalues(
      country_group,
      from = c(
        "all Africa",
        "Australia",
        "Canada",
        "India",
        "other Americas",
        "other Asia and Oceania",
        "other Europe",
        "United Kingdom",
        "United States"
      ),
      to = brewer.pal(9, "Paired")
    ),
    occupation.color = plyr::mapvalues(
      occupation,
      from = unique(gig_economy_data$occupation),
      to = brewer.pal(length(unique(
        gig_economy_data$occupation
      )), "Paired")
    )
  )


## Bar chart
gig_economy_data %>%
  group_by(country_group) %>%
  summarise(jobs.in.country = n()) %>%
  hchart(type = "bar",
         hcaes(
           x = country_group,
           y = jobs.in.country
         ))

## Grouped bar chart
gig_economy_data %>%
  group_by(country_group, occupation) %>%
  summarise(jobs.in.occupation = n()) %>%
  hchart(type = "bar",
         hcaes(
           x = country_group,
           y = jobs.in.occupation,
           group = occupation
         ))



