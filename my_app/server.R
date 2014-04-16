library(shiny)
library(datasets)

shinyServer(function(input,output){
  output$out2<-renderText({
    input$in2
  })
  
  output$outplot<-renderPlot({
    x<-rnorm(100,mean=50,sd=40)
    hist(x,breaks=input$in4,col='darkgray',border='white')
  })
  
  output$summary<-renderPrint({
    summary(mtcars)
  })
  
  output$view<-renderTable({
    head(mtcars,n=input$in4)
  })
})