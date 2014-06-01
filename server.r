
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
# 
# http://www.rstudio.com/shiny/
#

library(shiny)

shinyServer(function(input, output) {
  
  
  output$filetable1 <- reactiveTable(function() {
    if (is.null(input$files1)) {
      # User has not uploaded a file yet
      return(NULL)
    }
    
    file1<-input$files1
    
    input$files1
  })
  
  output$filetable2 <- reactiveTable(function() {
    if (is.null(input$files2)) {
      # User has not uploaded a file yet
      return(NULL)
    }
    input$files2
  })
  
  output$distPlot <- renderPlot({
     
    # generate and plot an rnorm distribution with the requested
    # number of observations
    dist <- rnorm(input$obs)
    hist(dist)
    
  })
  
})
