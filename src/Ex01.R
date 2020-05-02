## 기술 통계 분석

data(EuStockMarkets) # 데이터 세트를 사용하기 위한 명령어
dim(EuStockMarkets)  # 데이터 세트의 구조를 파악 (row, column)

EuStockMarkets       # 데이터 세트를 입력하면 해당 데이터를 출력한다.

# ‘DAX’에 해당하는 데이터만 출력하기 위함. 
# 데이터 세트[행, 열] 형식으로 입력하며, 입력칸을 비우면 전체선택을 의미
EuStockMarkets[,'DAX'] 

summary(EuStockMarkets) # 데이터 세트를 요약하여 출력 (각 칼럼별 요약데이터) 출력


# 분포 및 중심화 경향 확인
mean(EuStockMarkets[,'DAX'])    # ‘DAX’데이터의 평균
median(EuStockMarkets[,'DAX'])  # ‘DAX’데이터의 중앙값
range(EuStockMarkets[,'DAX'])   # ‘DAX’데이터의 범위

summary(EuStockMarkets[,'DAX']) # 중심화 경향 및 분포 파악

# 퍼짐정도 확인
var(EuStockMarkets[,'DAX']) # ‘DAX’데이터의 분산 계산
sd(EuStockMarkets[,'DAX'])  # ‘DAX’데이터의 표준편차 계산

# 분포의 비대칭성 확인 
# 왜도 및 첨도를 위한 내장함수를 포함한 패키지 fBasic 설치
install.packages("fBasics")

library(fBasics) # 라이브러리 로드

skewness(EuStockMarkets[,'DAX'])  # 왜도
kurtosis(EuStockMarkets[,'DAX'])  # 첨도 

hist(EuStockMarkets[,'DAX'])      # 히스토그램 그리기
boxplot(EuStockMarkets[,'DAX'])   # boxplot 그리기
plot(EuStockMarkets[,'DAX'], EuStockMarkets[,'SMI']) # 두 변수 간의 산점도 출력
plot(EuStockMarkets)   # 시계열 데이터 출력


library("ggplot2")

par(mfrow=c(2,2))
hist(EuStockMarkets[,'DAX'], breaks = 50)      # 히스토그램 그리기
boxplot(EuStockMarkets[,'DAX'], breaks = 50)   # boxplot 그리기
plot(EuStockMarkets[,'DAX'], EuStockMarkets[,'SMI'], breaks = 50) # 두 변수 간의 산점도 출력


