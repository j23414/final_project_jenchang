library(shiny)

shinyUI(fluidPage(
  
  titlePanel("Gene Description Word Cloud"),
  
  sidebarLayout(
    
    sidebarPanel(
      
      #sliderInput("in1", "SliderName:",min=1,max=100,value=50),
      #textInput("in2","TextName:","default text"),
      selectInput("in3","Select Gene Cluster:",choices=c("magenta","blue","turquoise","green","pink","red","black","brown","grey"), "magenta"),
      numericInput("in4","NumericName:",10),
      #radioButtons("in5","RadioName:",c("choice 1","choice2","choice3"),"choice2"),
      #checkboxInput("in6","CheckName:",TRUE),
      #br(), # extra empty line
      tags$hr(), # horizontal line
      submitButton("Update") # wait for update button
      
    ),
    
    mainPanel(
      tabsetPanel(type="tabs",
                  tabPanel("TabOne",
                           #checkboxInput("in7","CheckName:",TRUE),
                           h3(textOutput("out2")), # from in2
                           plotOutput("outplot"),
                           tableOutput("view")
                           #verbatimTextOutput("summary")
                  ),
                  tabPanel("TabTwo"
                           # Empty
                  )
      )
    )
    
  )
  
))