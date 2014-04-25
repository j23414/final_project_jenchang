library(shiny)
library(datasets)
library(wordcloud)
library(tm)

g_c_d<-read.csv("../data/gen_cluster_des.txt", header=TRUE, stringsAsFactors=FALSE)

shinyServer(function(input,output){
  output$out2<-renderText({
    input$in2
  })
  
  output$outplot<-renderPlot(function(){
    #x<-rnorm(100,mean=50,sd=40)
    #hist(x,breaks=input$in4,col='darkgray',border='white')
    
    # blue, turquoise, yellow, black, green, brown, red, pink, magenta, grey
    input$in3="grey"
    wc.mod<-subset(g_c_d,cluster=input$in3)
    wc.text<-paste(wc.mod$gene_description,collapse="")
    words<-Corpus(VectorSource(wc.text))
    words <- tm_map(words,stripWhitespace)
    words <- tm_map(words,tolower)
    words <- tm_map(words,removeWords,stopwords("english"))
    par(mar=rep(2,4))
    wordcloud(words,scale=c(5,0.5),max.words=100,random.order=FALSE,rot.per=0.35,use.r.layout=FALSE,colors=brewer.pal(8,"Dark2"))
  })
  
  output$summary<-renderPrint({
    summary(mtcars)
  })
  
  output$view<-renderTable({
    head(mtcars,n=input$in4)
  })
})