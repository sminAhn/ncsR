# 상관분석
## R의 corr 함수를 통해 상관계수를 파악하고 그래프를 통해 독립변수 간의 상관관계 분석을 수행한다.

cor(EuStockMarkets[,'DAX'], EuStockMarkets[,'SMI']) # ‘DAX’데이터와 ‘SMI’데이터간의 상관계수를 계산
cor(EuStockMarkets)  # 'DAX'데이터의 상관계수들의 상관관계를 행렬로 표현한다.

# 상관계수 행렬 plot
## 상관관계행렬 plot 내장함수 설치
install.packages("corrplot")  

library(corrplot)  # 상관계수 행렬 라이브러리 로드드

CorrEuStockMarkets <- cor(EuStockMarkets) # 상관계수 행렬 계산

# 상관계수 행렬 plot하는 함수
corrplot(CorrEuStockMarkets, method="ellipse") 


