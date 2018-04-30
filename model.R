library(xgboost)
library(tidyverse)


Iris <- iris

y1 <- Iris$Species

var.levels <- levels(y1)

y = as.integer(y1) - 1

noOutcome <- Iris[,]
x = noOutcome[,c('Sepal.Length','Petal.Length', 'Petal.Width', 'Sepal.Width')]
var.names<- names(x)
x = as.matrix(x)

params <- list(
  "objective" = "multi:softprob"
  ,"eval_metric" = "mlogloss"
  ,"num_class" = length(table(y))
  ,"eta" = 0.25
  ,"max_depth" = 3
)

cv.nround = 125

bst.cv <- xgb.cv(param = params, data = x, label = y
                 , nfold = 5, nrounds = cv.nround
                 , missing = NA
                 , prediction = TRUE)

which.min(bst.cv$evaluation_log$test_mlogloss_mean)

gg<- xgboost(param = params, data = x, label  = y,
                        nrounds = cv.nround, missing  = NA)


xgb.importance(var.names, model = gg)

xgb.save(gg, "gg.model")

ggInfo<- list(
  var.names = var.names
  ,var.levels = var.levels
)

save(ggInfo, file = 'ggInfo.rda')

# Gen Predictions #

genPreds <- function(Sepal.Length=6.8,Sepal.Width = 2.6, Petal.Length = 4.9,Petal.Width =2.0){

  testDF <- data.frame( Sepal.Length=Sepal.Length,Sepal.Width=Sepal.Width, Petal.Length=Petal.Length,Petal.Width=Petal.Width)

  preds <- predict(gg, as.matrix(testDF))


 data.frame(
    Cut = var.levels
    ,preds
  ) %>%
    arrange(desc(preds))
}
