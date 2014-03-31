library(shiny)
library(datasets)

shinyServer(function(input,output){
  
  output$distPlot<-renderPlot({
    x <- faithful[,2] # Old faithful Geyser data
    bins<-seq(min(x),max(x),length.out=input$bins+1)
    hist(x,breaks=bins,col='darkgray',border='white')
  })
  
  datasetInput<-reactive({
    switch(input$dataset,
           "rock"=rock,
           "pressure"=pressure,
           "cars"=cars)
  })
  
  output$summary<-renderPrint({
    dataset<-datasetInput()
    summary(dataset)
  })
  
  output$view<-renderTable({
    head(datasetInput(),n=input$obs)
  })
  
  output$caption<-renderText({
    input$caption
  })
  
})