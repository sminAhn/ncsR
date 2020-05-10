# 교차 유효성 검사를 통한 예측모델 성능 평가
library(plyr) 
library(randomForest) 
data <- iris 

k = 5 
# 1부터 5까지 의 인덱스를 관측치 개수만큼 샘플링 
data$id <- sample(1:k, nrow(data), replace = TRUE) 
list <- 1:k 
prediction <- data.frame()
testing_data_copy <- data.frame() 

for (i in 1:k){
  # id가 i인 데이터를 제외한 나머지 데이터들을 훈련데이터 세트로 구성
  training_data <- subset(data, id %in% list[-i]) 
  # id가 i인 데이터를 검증 데이터 세트로 설정
  testing_data <- subset(data, id %in% c(i)) 
  
  # 랜덤 포레스트 모델을 수행
  mymodel <- randomForest(training_data$Sepal.Length ~ ., data = training_data, ntree = 100) 
  
  # 열 1에 해당하는 Sepal.Length를 제거
  temp <- as.data.frame(predict(mymodel, testing_data[,-1])) 
  
  # 현 반복단계에서의 예측값을 prediction 값에 덧붙임
  prediction <- rbind(prediction, temp) 
  testing_data_copy <- rbind(testing_data_copy, as.data.frame (testing_data[,1])) 
}

colnames(prediction)  =  "p"
colnames(testing_data_copy) = "t" 

MAE_result  = mean(abs(prediction$p - testing_data_copy$t)) 
MSE_result  = mean((prediction$p - testing_data_copy$t)^2) 
MAPE_result = mean(abs(prediction$p - testing_data_copy$t) / testing_data_copy$t)*100

# 예측오차 기준으로 예측성능 평가
MAE_result
MSE_result
MAPE_result

plot(training_data)
plot(testing_data)
