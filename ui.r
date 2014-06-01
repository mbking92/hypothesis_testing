
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
# 
# http://www.rstudio.com/shiny/
#

library(shiny)

shinyUI(pageWithSidebar(
  
  # Application title
  headerPanel("New Application"),
  
  # Sidebar with a slider input for number of observations
  sidebarPanel(
    selectInput("hyp_test","Test Type:",c("mean","median")),
    fileInput("files1", "File data", multiple=TRUE),
    fileInput("files2", "File data", multiple=TRUE)
  ),
  
  # Show a plot of the generated distribution
  mainPanel(
    tableOutput("filetable1"),
    tableOutput("filetable2"),
    h4("Summary"),
    verbatimTextOutput("stat_output")
  )
))
