# ROC 곡선 기법을 통한 분류모델 성능 평가
install.packages("ROCR")
library(ROCR)

data(ROCR.simple)
ROCR.simple

predict_simple <- prediction( ROCR.simple$predictions, ROCR.simple$labels) 

perf_simple <- performance(predict_simple,"tpr","fpr") 

plot(perf_simple) 
abline(a=0, b=1) # 북동쪽 코너에서 남서쪽 코너를 잇는 직선을 표시

auc_simple <- performance(predict_simple,"auc")

