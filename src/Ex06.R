# 군집화: K 평균 군집화
install.packages("cluster") 
library(cluster) 

data(iris) 

nc2=pam(iris, 2)      # 데이터를 2개로 군집화 시행
si2 = silhouette(nc2) # 실루엣값 계산
summary(si2)          
# Average silhouette width : 0.68

plot(si2) # 실루엣 계산 결과 출력

nc3=pam(iris, 3)     # 데이터를 3개로 군집화 시행
si3=silhouette(nc3)  # 실루엣값 계산
summary(si3)
# Average silhouette width : 0.57
plot(si3) # 실루엣 계산 결과 출력, 군집을 2로 했을때보다 낮은 값이 출력된다.


##  K 평균 군집화 모델 생성
iris.kc = kmeans(iris[, 1:4], 2) # 군집수 2로 시행
iris.kc # K=2일때의 결과 출력

# K=3인 경우 군집화 시행
iris.kc = kmeans(iris[, 1:4], 3) # 군집수 3으로 시행
iris.kc # K=3일때의 결과 출력
