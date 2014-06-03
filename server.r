
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
# 
# http://www.rstudio.com/shiny/
#

library(shiny)


shinyServer(function(input, output) {
  
  # Return the requested dataset
  switch_function <- reactive({
    switch(input$hyp_test,
           "mean" = mean,
           "median" = median,
           "wilcox"=wilcox.test)
    
    
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
    fn<-switch_function()
    
    test1<-table1()
    test2<-table2()
    fn(test1$gpa, test2$gpa)

  })
  # Generate a summary of the dataset
  output$summary <- renderPrint({

    summary(table1())
  })
  
  
})
