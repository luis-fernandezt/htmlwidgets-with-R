library("tidyverse")
library("DT")

transport_data <- read_csv("data/transport_data.csv")

## =========== Basic table
datatable(transport_data)

## =========== Column Filters
datatable(transport_data, 
          rownames = FALSE,
          filter = list(position = "top"))

## =========== Fixed Columns
## Fixed columns
datatable(
  transport_data,
  extensions = c("FixedColumns"),
  rownames = FALSE,
  options = list(
    dom = 't',
    scrollX = TRUE,
    fixedColumns = list(leftColumns = 2)
  )
)

## =========== Add/remove columns
datatable(
  transport_data,
  rownames = FALSE,
  extensions = 'Buttons',
  options = list(dom = 'Bfrtip', buttons = I('colvis'))
)

## =========== Responsive
## https://rstudio.github.io/DT/extensions.html

datatable(transport_data,
          rownames = FALSE,
          extensions = c("Responsive"))
