# 예측: ARIMA 모델
data(AirPassengers) # AirPassengers 모델 로드
AirPassengers       # AirPassengers 출력

plot(AirPassengers) # plot 그래프 그리기

# 계절성(seasonality), 추세 (trend), 불확실성 (random) 요소로 분해해서 그래프를 확인할 수 있다.
plot(stl(AirPassengers, s.window='periodic')) 

install.packages("tseries") # tseries 라이브러리 설치
library(tseries)            # tseries 라리브러리 로드
difflogAirPassengers <- diff(log(AirPassengers))
plot(difflogAirPassengers)

# 변환한 결과물이 안정적인 시계열 데이터인지 확인
adf.test(difflogAirPassengers, alternative="stationary",k=0) 


# 예측모델 생성
install.packages("forecast")

library(forecast)
auto.arima(difflogAirPassengers) # p, d, q 를 자동으로 구하는 auto arima

# 위에서 구한 파라미터를 기준으로 log(AirPassengers) 
# 데이터 세트를 대상으로 하는 ARIMA 모델을 생성한다. 
fitted <- arima(log(AirPassengers), c(1, 0, 1), seasonal = list(order = c(0, 1, 1), period = 12))
fitted 

# ARIMA 모델을 생성한 뒤 향후 10년(120개월)간의 데이터를 예측해본 후 (predicted 변
# 수에 저장됨), 기존 데이터 (AirPassengers)와 예측치를 이어서 그래프로 표현한다. 
predicted <- predict(fitted, n.ahead = 120)
# predicted$pred 항목에 log(AirPassengers)의 예측치 값이 저장
ts.plot(AirPassengers, exp(predicted$pred), lty = c(1,2)) 

