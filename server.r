
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
# 
# http://www.rstudio.com/shiny/
#

library(shiny)

mean<-function(item="a"){
  paste("I'm so mean",item)
}

median<-function(item="b"){
  "I'm in the middle"
}

shinyServer(function(input, output) {
  
  # Return the requested dataset
  stat_function <- reactive({
    switch(input$hyp_test,
           "mean" = mean,
           "median" = median)
  })
  
  output$filetable1 <- renderTable(function() {
    if (is.null(input$files1)) {
      # User has not uploaded a file yet
      return(NULL)
    }
    
    file1<-input$files1
    
    input$files1
  })
  
  output$filetable2 <- renderTable(function() {
    if (is.null(input$files2)) {
      # User has not uploaded a file yet
      return(NULL)
    }
    input$files2
  })
  
  # Generate a summary of the dataset
  output$stat_output <- renderPrint({
    fn<-stat_function()
    fn("test")
  })
  
})
