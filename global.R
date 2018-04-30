
library(tidyverse)
library(DT)

gg <- xgb.load("gg.model")
load("ggInfo.rda")

genPreds <- function(Sepal.Length=6.8,Sepal.Width = 2.6, Petal.Length = 4.9,Petal.Width =2.0){

  testDF <- data.frame( Sepal.Length=Sepal.Length,Sepal.Width=Sepal.Width, Petal.Length=Petal.Length,Petal.Width=Petal.Width)

  preds <- predict(gg, as.matrix(testDF))


  data.frame(
    Spicies = var.levels
    ,preds
  ) %>%
    arrange(desc(preds))
}
