# 파생변수를 활용하여 분석모델을 확장
# 고객 id와 연령으로 구성된 데이터 세트를 생성한다
id <- c("c01", "c02", "c03", "c04", "c05", "c06", "c07")
age <- c(25, 45, 31, 30, 49, 53, 27)
customers <- data.frame(id, age, stringsAsFactors = F)

customers
sapply(customers, class)

# 기존 데이터 세트에 ifelse() 함수를 이용하여 고객 연령에 해당하는 
# 나잇대를 이진변수로 표시하는 파생변수들을 추가하여 분석 시 이 파생변수들을 활용할수 있다.
customers <- transform(customers, 
                       age20s = ifelse(age >= 20 & age < 30, 1, 0), 
                       age30s = ifelse(age >= 30 & age < 40, 1, 0), 
                       age40s = ifelse(age >= 40 & age < 50, 1, 0), 
                       age50s = ifelse(age > 50 & age < 60, 1, 0))

customers
