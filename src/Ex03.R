#  주성분 분석

data(iris) # iris 데이터를 사용하기 위한 코드

iris.pca <- prcomp(iris[,1:4]) # iris데이터 중 1~4칼럼의 데이터로 PCA수행
iris.pca # 주성분분석 결과 출력
summary(iris.pca) # PCA 결과 요약

iris.predict <- predict(iris.pca) # 주성분 점수 계산
iris.predict[, 1:2] # 주성분 1과 주성분 2의 점수 출력
biplot(iris.pca)    # 주성분 1과 주성분 2를 이용한 산점도 출력


