## 앙상블 기법들을 활용하여 분석모델을 확장
install.packages("adabag")
install.packages("randomForest")

data(iris)
train_index <- c(sample(1:50, 25), sample(51:100, 25), sample(101:150,25))

library(adabag)

bagging_iris <- bagging(Species ~ ., data = iris[train_index, ], mfinal = 10, control = rpart.control(maxdepth = 1)) 

bagging_iris

predict_bagging_iris <- predict.bagging(bagging_iris, newdata = iris[-train_index, ]) 

predict_bagging_iris


data(iris)
train_index <- c(sample(1:50, 25), sample(51:100, 25), sample(101:150,25)) # 총 150개 iris 데이터 중 임의로 2개의 데이터 세트로 나눈다.
boosting_iris <- boosting(Species ~ ., data = iris[train_index,], mfinal = 10, control = rpart.control(maxdepth = 1)) 
boosting_iris

predict_boosting_iris <- predict.boosting(boosting_iris, newdata = iris[-train_index, ])

predict_boosting_iris


data(iris)
index <- sample(2,nrow(iris),replace=TRUE,prob=c(0.7,0.3)) # 훈련 데이터세트(1)과 검증 데이터 세트(2) 구분을 위해 7:3의 비율로 무작위 샘플링 수행 
training_data <- iris[index==1,]
training_data <- iris[index==2,]

library(randomForest) # 랜덤 포레스트를 위한 R 패키지 로딩
rf_iris <- randomForest(Species~., data=training_data, ntree=100,proximity=TRUE) 
rf_iris

predicted_iris <- predict(rf_iris, newdata=training_data) # 랜덤포레스트 모델을 이용하여 testing_data를 예측

predicted_iris
