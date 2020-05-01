library(caret) 
set.seed(105) 
index4training <- createDataPartition(y=iris$Species, p=0.7, list=FALSE) 
index4training

training_data <- iris[index4training,] 
summary(training_data)
plot(training_data)

testing_data <- iris[-index4training,] 
summary(testing_data)
plot(testing_data)


training.data <- scale(training_data[-5]) 
summary(training.data)
plot(training.data)


kmeans_iris <- kmeans(training.data[,-5], centers=3, iter.max=10000)


kmeans_iris

summary(kmeans_iris$cluster)

plot(kmeans_iris$cluster)



library("rpart") 

fitted <- train(x=training.data[,-5], y=training_data$Sepal.Width, method="rpart")

summary(training.data[,-5])

summary(fitted)

plot(fitted)


testing.data <- as.data.frame(scale(testing_data[-5])) 

plot(testing.data)

testClusters <- predict(fitted, testing.data)

plot(testClusters)


install.packages("clValid")
library("clValid") 

dunn(,testClusters, testing.data) 
