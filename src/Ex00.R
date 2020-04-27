#### "diet.csv" 파일에 있는 내용을 가져온다.
data <- read.csv("diet.csv", header=T)

attach(data) # 데이터를 R 검색 경로에 추가하여 변수명으로 바로 접근할 수 있게 한다.
names(data)  # field 명을 출력한다.

##### Before field와 After field의 차이값을 구한다.
diff <- Before - After  # diff 변수에 값을 대입 
diff                    # diff 변수 출력
boxplot(diff)           # diff 변수의 데이터를 boxplot 그래프로 출력


##### T 통계량 계산
mean_diff <- mean(diff) # diff 의 평균값 
mean_diff

sd_diff <- sd(diff)     # diff 의 표준편차
length(diff)            # diff 의 요소 갯수 

t_stat <- mean_diff / (sd_diff / sqrt(length(diff)))  
t_stat

##### 양측 검증을 수행하는 경우
t.test(Before, After, alternative = c("two.sided"), paired = TRUE, conf.level = 0.95)

##### 단측 검증을 수행하는 경우
t.test(Before, After, alternative = c("greater"), paired = TRUE, conf.level = 0.95)

##### 양측검정, 단측검정 모두 p-값이 유의수준보다 작으므로, 유의수준 5% 기준으로 
##### 귀무가설을 기각하고, 대립가설을 채택하게된다.

