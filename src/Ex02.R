#######################
# 분포의 비대칭성 확인

install.packages("fBasics")

library(fBasics)

skewness(EuStockMarkets[,'DAX'])

kurtosis(EuStockMarkets[,'DAX'])

hist(EuStockMarkets[,'DAX'])

boxplot(EuStockMarkets[,'DAX'])

plot(EuStockMarkets[,'DAX'], EuStockMarkets[,'SMI'])

plot(EuStockMarkets)

cor(EuStockMarkets[,'DAX'], EuStockMarkets[,'SMI'])

cor(EuStockMarkets)
