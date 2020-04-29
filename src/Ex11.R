library(plyr) 
library(randomForest) 
data <- iris 
k = 5 
data$id <- sample(1:k, nrow(data), replace = TRUE) # 1부터 5까지 의 인덱스를 관측치 개수만큼 샘플링 
list <- 1:k 
prediction <- data.frame()
testing_data_copy <- data.frame() 

for (i in 1:k){
  training_data <- subset(data, id %in% list[-i]) 
  testing_data <- subset(data, id %in% c(i)) 
  mymodel <- randomForest(training_data$Sepal.Length ~ ., data = training_data, ntree = 100) 
  temp <- as.data.frame(predict(mymodel, testing_data[,-1])) 
  prediction <- rbind(prediction, temp) 
  testing_data_copy <- rbind(testing_data_copy, as.data.frame (testing_data[,1])) 
}

colnames(prediction)  =  "p"
colnames(testing_data_copy) = "t" 

MAE_result  = mean(abs(prediction$p - testing_data_copy$t)) 
MSE_result  = mean((prediction$p - testing_data_copy$t)^2) 
MAPE_result = mean(abs(prediction$p - testing_data_copy$t) / testing_data_copy$t)*100

MAE_result
MSE_result
MAPE_result

