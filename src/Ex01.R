# 데이터 세트를 사용하기 위한 명령어
data(EuStockMarkets)

dim(EuStockMarkets)

EuStockMarkets

EuStockMarkets[,'DAX']

summary(EuStockMarkets) # 데이터 세트를 요약하여 출력

mean(EuStockMarkets[,'DAX'])

median(EuStockMarkets[,'DAX'])

range(EuStockMarkets[,'DAX'])

summary(EuStockMarkets[,'DAX'])

var(EuStockMarkets[,'DAX'])

sd(EuStockMarkets[,'DAX'])
