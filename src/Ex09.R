## 앙상블 기법들을 활용하여 분석모델을 확장
install.packages("randomForest")

data(iris)
# 훈련 데이터세트(1)과 검증 데이터 세트(2) 구분을 위해 7:3의 비율로 무작위 샘플링 수행 
index <- sample(2,nrow(iris),replace=TRUE,prob=c(0.7,0.3)) 
training_data <- iris[index==1,]
training_data <- iris[index==2,]

library(randomForest) # 랜덤 포레스트를 위한 R 패키지 로딩
rf_iris <- randomForest(Species~., data=training_data, ntree=100,proximity=TRUE) 
rf_iris

# 랜덤포레스트 모델을 이용하여 testing_data를 예측
predicted_iris <- predict(rf_iris, newdata=training_data) 
predicted_iris

# 정오분류표 그래프화
library(ggplot2)
test <- iris[-index,]
# 예측된 분류 입력하기
test$pred <- predict(rf_iris, iris[-index,])

ggplot(test, aes(Species, pred, color=Species )) + 
  geom_jitter(width = 0.2, height = 0.1, size =2) + 
  labs(title="Confusion Matrix",
       subTitle ="Predicted",
       y = "Predicted",
       x = "Truth")
