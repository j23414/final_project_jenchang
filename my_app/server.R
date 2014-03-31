library(shiny)

shinyServer(function(input,output){
  
  output$distPlot<-renderPlot({
    x <- faithful[,2] # Old faithful Geyser data
    bins<-seq(min(x),max(x),length.out=input$bins+1)
    hist(x,breaks=bins,col='darkgray',border='white')
  })
  
})