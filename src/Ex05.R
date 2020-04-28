# 예측: ARIMA 모델
data(AirPassengers) # AirPassengers 모델 로드
AirPassengers       # AirPassengers 출력

plot(AirPassengers) # plot 그래프 그리기

# 계절성(seasonality), 추세 (trend), 불확실성 (random) 요소로 분해해서 그래프를 확인할 수 있다.
plot(stl(AirPassengers, s.window='periodic')) 

install.packages("tseries") # tseries 라이브러리 설치

library(tseries)            # tseries 라리브러리 로드드

difflogAirPassengers <- diff(log(AirPassengers))

plot(difflogAirPassengers)

adf.test(difflogAirPassengers, alternative="stationary",k=0)


# 예측모델 생성
install.packages("forecast")

library(forecast)
auto.arima(difflogAirPassengers)

fitted <- arima(log(AirPassengers), c(1, 0, 1), seasonal = list(order = c(0, 1, 1), period = 12))
fitted

predicted <- predict(fitted, n.ahead = 120)
ts.plot(AirPassengers, exp(predicted$pred), lty = c(1,2)) # predicted$pred 항목에 log(AirPassengers)의 예측치 값이 저장
