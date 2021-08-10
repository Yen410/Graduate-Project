library(dplyr)
library(broom)
library(xtable)
require(foreign)
require(nnet)
require(ggplot2)
require(reshape2)
write.table(a,file="/Users/yanting/health/project/d1/a.csv", sep=",",row.names=F,fileEncoding='big5')
result_d1_m<- read.table("/Users/yanting/health/project/d1/result_d1_m.csv",header = TRUE, sep = ",",fileEncoding='big5')
#d1_u&m
d1_t1t2t3_v$class<-factor(d1_t1t2t3_v$class)
d1_t1t2t3_v$class <- relevel(d1_t1t2t3_v$class,ref="2")
model_d1_m<-multinom(class~Marriage+TG, data=d1_t1t2t3_v, na.action=na.exclude)
result_d1_m<-tidy(model_d1_m, conf.int = TRUE, conf.level = 0.95)
xtable(result_d1_m,digits=3)

model_d1_m_Marriage<-multinom(class~Marriage, data=d1_t1t2t3_v, na.action=na.exclude)
result_d1_m_Marriage<-tidy(model_d1_m_Marriage, conf.int = TRUE, conf.level = 0.95)
xtable(result_d1_m_Marriage,digits=3)

model_d1_m_TG<-multinom(class~TG, data=d1_t1t2t3_v, na.action=na.exclude)
result_d1_m_TG<-tidy(model_d1_m_TG, conf.int = TRUE, conf.level = 0.95)
xtable(result_d1_m_TG,digits=3)
a<-rbind(result_d1_m_Marriage,result_d1_m_TG)


#d1(以d0的變項看關聯性)
d1_t1t2t3_v$class <- relevel(d1_t1t2t3_v$class,ref="2")
contrasts(d1_t1t2t3_v$Drink)<-contr.treatment(3, base=1)
contrasts(d1_t1t2t3_v$ExerciseState)<-contr.treatment(3, base=1)
model_d1_m_based0 <- multinom(class~Marriage+Sex+edu_level+ExerciseState+
                         TakeMed+DrinkMilk+AC+TCHO+Alb+GL+RBC+WBC+HB+Pus_cell,
                       data=d1_t1t2t3_v,na.action=na.exclude)
result_d1_m_based0<-tidy(model_d1_m_based0)
tidy(result_d1_m_based0, conf.int = TRUE, conf.level = 0.95)
xtable(result_d1_m_based0,digits=3)
