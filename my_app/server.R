library(shiny)
library(datasets)
library(wordcloud)
library(tm)

g_c_d<-read.csv("../data/gen_cluster_des.txt", header=TRUE, stringsAsFactors=FALSE)
c_mod<-subset(g_c_d, cluster=="magenta")

# function to plot wordcloud for a module
plot_mod_wordcloud<-function(mod){
  current_mod<-subset(g_c_d, cluster==mod)
  wc.input<-paste(current_mod$desc,collapse="")
  
  path_words<-Corpus(VectorSource(wc.input))
  path_words <- tm_map(path_words,stripWhitespace)
  path_words <- tm_map(path_words,tolower)
  path_words <- tm_map(path_words,removeWords,stopwords("english"))
  #path_words <- tm_map(path_words,stemDocument)
  
  par(mar=rep(2,4))
  wordcloud(path_words,scale=c(5,0.5),max.words=100,random.order=FALSE,rot.per=0.35,use.r.layout=FALSE,colors=brewer.pal(8,"Dark2"))
}

shinyServer(function(input,output){
  output$out2<-renderText({
    input$in3
  })
  
  output$outplot<-renderPlot(function(){
    plot_mod_wordcloud(input$in3)
  })
  
  output$view<-renderTable({
    c_mod=subset(g_c_d, cluster==input$in3)
    head(c_mod,n=input$in4)
  })
  
  output$summary<-renderPrint({
    summary(mtcars)
  })
})