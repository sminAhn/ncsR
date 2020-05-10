getwd()

install.packages("forecast")
library(forecast)
# 미세먼지 측정자료 1000건을 불러온다.
ex_data = read.csv("dust.csv", header=TRUE) 
plot(ex_data)

# 총 1000건의 데이터 중 처음 800건을 훈련데이터 세트로 설정
training_data = ex_data[1:800, 2] 
training_data

# 나머지 199건의 데이터를 검증데이터 세트로 설정
testing_data = ex_data[801:999, 2] 
testing_data

# 각각의 데이터 세트를 시계열 형식으로 변환
training_timeseries = ts(training_data, frequency = 1) 
testing_timeseries = ts(testing_data, frequency = 1) 

# 여러개의 그래프 출력을 위한 라이브러리 로딩
library("ggplot2")
par(mfrow=c(1,2)) # 출력 행렬 세팅
# 시계열 데이터로 변환된 훈련 데이터에 대한 플롯
plot.ts(training_timeseries, breaks=50)
plot.ts(testing_timeseries, breaks=50)

# 훈련 데이터 세트를 바탕으로 ARIMA 예측모델을 생성하고 Akaike 정보척도를 이용하여 
# 최선의 ARIMA 모델을 선택
max_p = 5  # 최대 ARIMA p 값
max_q = 5  # 최대 ARIMA q 값

# 각 p, q 값별로 AIC 값을 계산
AIC_set = matrix(0, nrow = (max_p+1), ncol = (max_q+1)) 

for (p in 0:max_p) {
  for(q in 0:max_q){
    
    model = arima(training_timeseries,
                  order = c(p , 1 , q), 
                  method = "ML")
    AIC_set[(p+1), (q+1)] = model$aic 
  }
}

# AIC 값을 최소화 하는 p 와 q값을 선택
which(AIC_set == min(AIC_set), arr.ind = TRUE) 

model = arima(training_timeseries, order = c(6,1,3))


# 199개 데이터에 대한 예측
forecasted = forecast(model, h=199) 

MAE_result = mean(abs(testing_data - forecasted$mean))
MSE_result = mean((testing_data - forecasted$mean)^2) 
MAPE_result = mean(abs(testing_data - forecasted$mean) /  testing_data)*100 

MAE_result  # MAE
MSE_result  # MSE
MAPE_result # MAPE

forecasted
par(mfrow=c(1,1)) # 출력 행렬 세팅
plot(forecasted)  # 예측된 결과물 출력

