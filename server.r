
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
# 
# http://www.rstudio.com/shiny/
#

library(shiny)

mn<-function(item="b"){
  mean(item)
}

md<-function(item="a"){
  median(item)
}

shinyServer(function(input, output) {
  
  # Return the requested dataset
  stat_function <- reactive({
    switch(input$hyp_test,
           "mean" = mn,
           "median" = md)
    
    
  })
  
  table1 <- function(){
    inFile <- input$file1
    if (is.null(inFile))
      return(NULL)
      
    return (read.csv(inFile$datapath, header=input$header, sep=input$sep, quote=input$quote))
    

    
  }
  
  table2<- function() {
    inFile <- input$file2
    
    if (is.null(inFile))
      return(NULL)
    
    return (read.csv(inFile$datapath, header=input$header, sep=input$sep, quote=input$quote))
  }
  
  # Generate a summary of the dataset
  output$stat_output <- renderPrint({
    fn<-stat_function()
    
    test<-table1()
    fn(test$gpa)
  })
  
})
