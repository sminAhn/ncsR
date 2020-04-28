#  분류: 로지스틱 회귀분석
data(mtcars) # mtcar datset 사용을 위한 코드
dat <- subset(mtcars, select=c(mpg, am, vs)) # mtcars 의 부분집합, mpg, am, vs 를 선택
dat # dat 출력력

log_reg <- glm(vs ~ mpg, data=dat, family="binomial") # 로지스틱 회귀분석 실행

log_reg # 회귀분석 모델 확인
summary(log_reg) # 회귀분석 모델 요약정보 확인
