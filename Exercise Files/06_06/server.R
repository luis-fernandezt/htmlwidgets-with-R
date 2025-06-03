library("DT")
library("shiny")
library("tidyverse")

transport_data <- read_csv("data/transport_data.csv")

transport_sample_data <- transport_data %>%
  sample_n(8)

shinyServer(function(input, output, session) {
  output$transport_table <- DT::renderDataTable({
    transport_sample_data
  }, rownames = FALSE,
  server = FALSE, ## Required for addRow to work
  extensions = c("Responsive", "Buttons"),
  options = list(dom = 'Bfrtip', buttons = c('colvis', "csv")))
  
})