
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
# 
# http://www.rstudio.com/shiny/
#

library(shiny)

shinyUI(pageWithSidebar(
  
  # Application title
  headerPanel("Hypothesis Testing"),
  
  # Sidebar with a slider input for number of observations!
  sidebarPanel(
    selectInput("hyp_test","Test Type:",c("mean","median","wilcox")),
    fileInput("file1", "File data", multiple=FALSE),
    fileInput("file2", "File data", multiple=FALSE),
    tags$hr(),
    checkboxInput('header', 'Header', TRUE),
    radioButtons('sep', 'Separator',
                 c(Comma=',',
                   Semicolon=';',
                   Tab='\t'),
                 'Comma'),
    radioButtons('quote', 'Quote',
                 c(None='',
                   'Double Quote'='"',
                   'Single Quote'="'"),
                 'Double Quote')
  ),
  
  # Show a plot of the generated distribution
  mainPanel(
    tableOutput("filetable1"),
    tableOutput("filetable2"),
    h4("Summary"),
    verbatimTextOutput("stat_output"),
    verbatimTextOutput("summary")
  )
))
