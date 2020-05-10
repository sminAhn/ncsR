## 앙상블 기법들을 활용하여 분석모델을 확장
# 부스팅(Boosting)
install.packages("adabag")

data(iris)
# 총 150개 iris 데이터 중 임의로 2개의 데이터 세트로 나눈다.
train_index <- c(sample(1:50, 25), sample(51:100, 25), sample(101:150,25))

library(adabag)

boosting_iris <- boosting(Species ~ ., data = iris[train_index, ], mfinal = 10, control = rpart.control(maxdepth = 1)) 
boosting_iris

predict_boosting_iris <- predict.boosting(boosting_iris, newdata = iris[-train_index, ]) 
predict_boosting_iris

# 의사결정 트리확인을 위한 패키지 설치
install.packages("rpart.plot")
library(rpart)
library(rpart.plot)

# boosting 모델을 구성하는 의사결정 트리 확인 그래프
# Run 동작마다 다르게 출력됨
for(i in 1:10){
  rpart.plot(boosting_iris$trees[[i]])
}




# 정오분류표 그래프화
library(ggplot2)
test <- iris[-train_index,]
# 예측된 분류 입력하기
test$pred <- predict(boosting_iris, iris[-train_index,])$class

ggplot(test, aes(Species, pred, color=Species )) + 
  geom_jitter(width = 0.2, height = 0.1, size =2) + 
  labs(title="Confusion Matrix",
       subTitle ="Predicted",
       y = "Predicted",
       x = "Truth")
