library("visNetwork")

shinyUI(fluidPage(
  uiOutput("remove_superculture_UI"),
  "Below is information about the last selected node:",
  visNetworkOutput("got_network")
))