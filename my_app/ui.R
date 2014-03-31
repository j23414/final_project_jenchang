library(shiny)

shinyUI(fluidPage(

  titlePanel("E coli Stress Effects"),
  
  sidebarLayout(

    sidebarPanel(
      sliderInput("bins","Number of bins:", min=1,max=50,value=30),
      textInput("caption","Caption","Data Summary"),
      selectInput("dataset", "Choose a dataset:",choices=c("rock","pressure","cars")),
      numericInput("obs","Number of observations to view:",10)
    ),
    
    mainPanel(
      plotOutput("distPlot"),
      h3(textOutput("caption",container=span)),
      verbatimTextOutput("summary"),
      tableOutput("view")
    )
  )
))