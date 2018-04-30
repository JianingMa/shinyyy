
library(tidyverse)
library(DT)

ui <- fluidPage(
  titlePanel("Predicting Iris Species"),
  verticalLayout(
    
    
    sidebarLayout(
      sidebarPanel(
        sliderInput("Sepal.Length",label = "Sepal.Length:", value = 200
                    , min = 4.3, max = 7.9, step = .1)
        , sliderInput("Sepal.Width", "Sepal.Width:", value = 200
                      , min = 2, max = 4.4, step = .1)
        ,sliderInput("Petal.Length", "Petal.Length:", value = 200,
                     min = 1, max = 6.9, step = .1)
        ,sliderInput("Petal.Width", "Petal.Width:", value = 200,
                     min = 2, max = 6.9, step = .1)
        
        
      ),
      mainPanel(
        tabPanel("plot1",plotOutput("plot1")),
        tabPanel("plot2",plotOutput("plot2")),
        tabPanel("plot3",plotOutput("plot3")),
        tabPanel("plot4",plotOutput("plot4")),
        tabPanel("plot5",plotOutput("plot5")),
        dataTableOutput("pred_table")
        
      ))
  )
)
