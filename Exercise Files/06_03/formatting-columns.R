library("tidyverse")
library("DT")
library("lubridate")
library("stringr")

my_dates <- ymd(c("2010-01-01",
                  "2011-02-05",
                  "2012-04-20",
                  "2014-05-10"))

my_data <- tibble(
  transaction.date = my_dates,
  amount.in.dollars = 100:103,
  amount.in.pounds = rnorm(4, mean = 100, sd = 15)
)

my_data <- my_data %>%
  mutate(conversion = 100 * amount.in.dollars / amount.in.pounds)

pretty_headers <- gsub("[.]", " ", colnames(my_data)) %>%
  str_to_title()

my_data %>%
  datatable(
    rownames = FALSE,
    colnames = pretty_headers,
    filter = list(position = "top"),
    options = list(language = list(sSearch = "Filter:"))
  )
