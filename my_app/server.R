library(shiny)
library(datasets)

mpgData<-mtcars
mpgData$am<-factor(mpgData$am,labels=c("Automatic","Manual"))

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
  
  formulaText<-reactive({
    paste("mpg ~",input$variable)
  })
  
  output$caption_2<-renderText({
    formulaText()
  })
  
  output$mpgPlot<-renderPlot({
    boxplot(as.formula(formulaText()),
            data=mpgData,
            outline=input$outliers)
  })
  
  sliderValues<-reactive({
    data.frame(
      Name=c("Integer","Decimal","Range","Custom Format","Animation"),
      Value=as.character(c(input$integer,input$decimal,paste(input$range,collapse=' '),
                           input$format,input$animation)),
      stringsAsFactors=FALSE)
  })
  
  output$values<-renderTable({
    sliderValues()
  })
  
  data<-reactive({
    dist<-switch(input$dist,norm=rnorm,unif=runif,lnorm=rlnorm,exp=rexp,rnorm)
    
    dist(input$n)
  })
  
  output$plot<-renderPlot({
    dist<-input$dist
    n<-input$n
    
    hist(data(),
         main=paste('r',dist,'(',n,')',sep=''))
  })
  
  output$summary_2<-renderPrint({
    summary(data())
  })
  
  output$table<-renderTable({
    data.frame(x=data())
  })
  
  output$contents<-renderTable({
    inFile<-input$file1
    
    if(is.null(inFile))
      return(NULL)
    
    read.csv(inFile$datapath,header=input$header,sep=input$sep,quote=input$quote)
  })
  
})