
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(tidyverse)
library(DT)
library(shiny)


server <- function(input, output){
  
  output$pred_table <- DT::renderDataTable({
    
    genPreds(
      Petal.Width = input$Petal.Width
      ,Sepal.Width = input$Sepal.Width
      ,Sepal.Length = input$Sepal.Length
      ,Petal.Length = input$Petal.Length
    ) %>%
      datatable() %>%
      formatPercentage(columns = "preds", digits =2)
    
  })
  
  output$plot1<- renderPlot({
    scatter <- ggplot(data=iris, aes(x = Sepal.Length, y = Sepal.Width))
    scatter + geom_point(aes(color=Species)) +
      xlab("Sepal Length") +  ylab("Sepal Width") +
      ggtitle("Sepal Length-Width")
  })
  output$plot2<- renderPlot({
    density <- ggplot(data=iris, aes(x=Sepal.Length, fill=Species))
    density + geom_density(stat="density", alpha=I(0.2)) +
      xlab("Sepal Length") +  ylab("Density") + ggtitle("Histogram & Density Curve of Sepal Length")
  })
  output$plot3<- renderPlot({
    density1 <- ggplot(data=iris, aes(x=Sepal.Width, fill=Species))
    density1 + geom_density(stat="density", alpha=I(0.2)) +
      xlab("Sepal Width") +  ylab("Density") + ggtitle("Histogram & Density Curve of Sepal Width")
  })
  output$plot4<- renderPlot({
    density2 <- ggplot(data=iris, aes(x=Petal.Length, fill=Species))
    density2 + geom_density(stat="density", alpha=I(0.2)) +
      xlab("Petal Length") +  ylab("Density") + ggtitle("Histogram & Density Curve of Petal Length")
  })
  output$plot5<- renderPlot({
    density3 <- ggplot(data=iris, aes(x=Petal.Width, fill=Species))
    density3 + geom_density(stat="density", alpha=I(0.2)) +
      xlab("Petal Width") +  ylab("Density") + ggtitle("Histogram & Density Curve of Petal Width")
    
    
  })
}
