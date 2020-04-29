install.packages("forecast") 

library(forecast)
ex_data = read.csv("weather.csv", header=TRUE) 
plot(ex_data)

training_data = ex_data[1:293, 2] 
training_data

testing_data = ex_data[294:318, 2] 
testing_data

training_timeseries = ts(training_data, frequency = 1) 
training_timeseries

testing_timeseries = ts(testing_data, frequency = 1) 
testing_timeseries


plot.ts(training_timeseries)

max_p = 10
max_q = 10


AIC_set = matrix(0, nrow = (max_p+1), ncol = (max_q+1)) 
AIC_set

for (p in 0:max_p) {
  for(q in 0:max_q){
    
    model = arima(training_timeseries,
                  order = c(p , 1 , q), 
                  method = "ML")
    AIC_set[(p+1), (q+1)] = model$aic 
  }
}

which(AIC_set == min(AIC_set), arr.ind = TRUE) 

model = arima(training_timeseries, order = c(4,1,4))
model

forecasted = forecast(model, h=100) 

MAE_result = mean(abs(testing_data - forecasted$mean))

MSE_result = mean((testing_data - forecasted$mean)^2) 

MAPE_result = mean(abs(testing_data - forecasted$mean) /  testing_data)*100 

MAE_result 
MSE_result 
MAPE_result
