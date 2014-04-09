library(shiny)

shinyUI(fluidPage(

  titlePanel("E coli Stress Effects"),
  
  sidebarLayout(

    sidebarPanel(
      sliderInput("bins","Number of bins:", min=1,max=50,value=30),
      textInput("caption","Caption","Data Summary"),
      
      selectInput("dataset", "Choose a dataset:",choices=c("rock","pressure","cars")),
      numericInput("obs","Number of observations to view:",10),
      
      submitButton("Update View"),
      
      selectInput("variable","Variable:",c("Cylinders"="cyl","Transmission"="am","Gears"="gear")),
      checkboxInput("outliers","Show outliers",FALSE),
      
      sliderInput("integer","Integer:",min=0,max=1000,value=500),
      sliderInput("decimal","Decimal:",min=0,max=1,value=0.5,step=0.1),
      sliderInput("range","Range:",min=1,max=1000,value=c(200,500)),
      sliderInput("format","Custom Format:",min=0,max=10000,value=0,step=2500,format="$#,##0",locale="us",animate=TRUE),
      sliderInput("animation","LoopingAnimation:",1,2000,1,step=10,
                  animate=animationOptions(interval=300,loop=TRUE)),
      
      radioButtons("dist","Distribution type:",
                   c("Normal"="norm","Uniform"="unif","Log-normal"="lnorm","Exponential"="exp")),
      br(),
      sliderInput("n","Number of Observations",value=500,min=1,max=1000),
      
      fileInput('file1','Choose CSV File',
                accept=c('text/csv','text/comma-separated-values,text/plain','.csv')),
      tags$hr(),
      checkboxInput('header',"Header",TRUE),
      radioButtons('sep','Separator',
                   c(Comma=',',Semicolon=';',Tab='\t'),
                   ','),
      radioButtons('quote','Quote',
                   c(None='','Double Quote'='"','Single Quote'="'"),
                   '"')
    ),
    
    mainPanel(
      tabsetPanel(type="tabs",
        tabPanel("Main",
                 plotOutput("distPlot"),
                 h3(textOutput("caption",container=span)),
                 
                 h4("Summary"),
                 verbatimTextOutput("summary"),
                 h4("Observations"),
                 tableOutput("view"),
                 
                 h3(textOutput("caption_2")),
                 plotOutput("mpgPlot"),
                 
                 tableOutput("values")
        ),
        tabPanel("Plot",plotOutput("plot")),
        tabPanel("Summary",verbatimTextOutput("summary_2")),
        tabPanel("Table",tableOutput("table")),
        tabPanel("Uploaded File",tableOutput('contents'))
        
      )
    )
    
  )
))