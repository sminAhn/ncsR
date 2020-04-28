## 앙상블 기법들을 활용하여 분석모델을 확장
data("iris")

train_index <- c(sample(1:50, 25), sample(51:100, 25), sample(101:150,25))

install.packages("adabag")

library(adabag)

bagging_iris <- bagging(Species ~ ., data = iris[train_index, ], mfinal = 10, control = rpart.control(maxdepth = 1)) 

bagging_iris

predict_bagging_iris <- predict.bagging(bagging_iris, newdata = iris[-train_index, ]) 

predict_bagging_iris
