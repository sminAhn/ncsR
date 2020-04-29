install.packages("ROCR")
library(ROCR)

data(ROCR.simple)

predict_simple <- prediction( ROCR.simple$predictions, ROCR.simple$labels) 

perf_simple <- performance(predict_simple,"tpr","fpr") 

plot(perf_simple) 
abline(a=0, b=1) 

performance(predict_simple,"auc") 
