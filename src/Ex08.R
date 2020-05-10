## 앙상블 기법들을 활용하여 분석모델을 확장
# bagging(Bootstrap aggregating)
data("iris")
# 총 150개 iris 데이터 중 임의로 2개의 데이터 세트로 나눈다.
train_index <- c(sample(1:50, 25), sample(51:100, 25), sample(101:150,25))

install.packages("adabag")
library(adabag) #배깅을 위한 R 패키지 로딩

# 10개의 트리로 구성된 배깅 모델을 구축
bagging_iris <- bagging(Species ~ ., 
                        data = iris[train_index, ], 
                        mfinal = 10, 
                        control = rpart.control(maxdepth = 1))
bagging_iris # 결과 출력
# 부스팅 결과물을 출력하게 되며 생성된 10개 모델의 세부 내용이 출력

# 생성된 배깅모델을 활용하여 새로운 데이터에 대한 예측 수행
predict_bagging_iris <- predict.bagging(bagging_iris, newdata = iris[-train_index, ]) 
predict_bagging_iris$class

bagging_iris$trees # 배깅에 사용된 10개의 트리모델 정보 확인 

bagging_iris$importance # 변수들의 중요도 확인


# 의사결정 트리확인을 위한 패키지 설치
install.packages("rpart.plot")
library(rpart)
library(rpart.plot)

# bagging 모델을 구성하는 의사결정 트리 확인 그래프
for(i in 1:10){
  rpart.plot(bagging_iris$trees[[i]])
}




# 정오분류표 그래프화
library(ggplot2)
test <- iris[-train_index,]
# 예측된 분류 입력하기
test$pred <- predict(bagging_iris, iris[-train_index,])$class

ggplot(test, aes(Species, pred, color=Species )) + 
  geom_jitter(width = 0.2, height = 0.1, size =2) + 
  labs(title="Confusion Matrix",
       subTitle ="Predicted",
       y = "Predicted",
       x = "Truth")



hist(bagging_iris$votes)
bagging_iris$votes
hist(bagging_iris$prob)
hist(bagging_iris$importance)
