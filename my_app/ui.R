library(shiny)

shinyUI(fluidPage(
  
  titlePanel("Page Title"),
  
  sidebarLayout(
    
    sidebarPanel(
      
      sliderInput("in1", "SliderName:",min=1,max=100,value=50),
      textInput("in2","TextName:","default text"),
      selectInput("in3","SelectName:",choices=c("choice 1","choice2","choice3")),
      numericInput("in4","NumericName:",10),
      radioButtons("in5","RadioName:",c("choice 1","choice2","choice3"),"choice2"),
      checkboxInput("in6","CheckName:",TRUE),
      br(), # extra empty line
      tags$hr(), # horizontal line
      submitButton("Update") # wait for update button
      
    ),
    
    mainPanel(
      tabsetPanel(type="tabs",
                  tabPanel("TabOne",
                           h3(textOutput("out2")), # from in2
                           plotOutput("outplot"),
                           verbatimTextOutput("summary"),
                           tableOutput("view")
                           
                           
                           
                  ),
                  tabPanel("TabTwo"
                           # Empty
                  )
      )
    )
    
  )
  
))