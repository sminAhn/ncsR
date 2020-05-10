library(caret) 
set.seed(105) 
# createDataPartition 훈련데이터 세트와 검증 데이터 세트를 준비
index4training <- createDataPartition(y=iris$Species, p=0.7, list=FALSE) 

training <- iris[index4training,]
testing <- iris[-index4training,] 

# scale 함수를 사용하여 iris데이터를 표준화
training.data <- as.data.frame(scale(training[-5]))


iris.kmeans <- kmeans(training.data[,-5], centers = 3, iter.max = 10000)
training$cluster <- as.factor(iris.kmeans$cluster)

qplot(Petal.Width, Petal.Length, colours=cluster, data=training)



# 검증 데이터 세트를 통한 모델 정확성 확인
library("rpart") 
fitted <- train(x=training.data[,-5], y=training.data$Sepal.Length, method="rpart")

testClusters <- predict(fitted, testing.data)
plot(testClusters)

# 내부 평가방법을 이용한 모델성능 평가
install.packages("clValid")
library("clValid") 
dunn(,testClusters, testing.data) # 코드 오류


#### 오류로 인한 코드 대체
data(mouse)
express <- mouse[1:25,c("M1","M2","M3","NC1","NC2","NC3")]
rownames(express) <- mouse$ID[1:25]
## hierarchical clustering
Dist <- dist(express,method="euclidean")
clusterObj <- hclust(Dist, method="average")
nc <- 2 ## number of clusters
cluster <- cutree(clusterObj,nc)
dunn(Dist, cluster) # dunn 지수값 확인
