write.table(a,file="/Users/yanting/health/project/d0/a.csv", sep=",",row.names=F,fileEncoding='big5')
result_d0_m<- read.table("/Users/yanting/health/project/d0/result_d0_m.csv",header = TRUE, sep = ",",fileEncoding='big5')

##d0(有顯著變項的)_m
d0_nod1_t1t2t3_v$class<-factor(d0_nod1_t1t2t3_v$class)
d0_nod1_t1t2t3_v$Drink<-factor(d0_nod1_t1t2t3_v$Drink)
d0_nod1_t1t2t3_v$ExerciseState<-factor(d0_nod1_t1t2t3_v$ExerciseState)
d0_nod1_t1t2t3_v$class <- relevel(d0_nod1_t1t2t3_v$class,ref="3")
contrasts(d0_nod1_t1t2t3_v$Drink)<-contr.treatment(3, base=1)
contrasts(d0_nod1_t1t2t3_v$ExerciseState)<-contr.treatment(3, base=1)
model_d0_m <- multinom(class~Marriage+Sex+edu_level+Drink+ExerciseState+
                       TakeMed+Traffic+DrinkMilk+AC+TCHO+Alb+GL+RBC+WBC+HB+Pus_cell,
                     data=d0_nod1_t1t2t3_v,na.action=na.exclude)
result_d0_m<-tidy(model_d0_m, conf.int = TRUE, conf.level = 0.95)
xtable(result_d0_m,digits=3)

#d0(有顯著變項的)_u(有p值)
model_d0_nod1_Marriage<-multinom(class~Marriage, data=d0_nod1_t1t2t3_v, na.action=na.exclude)
result_d0_nod1_Marriage<-tidy(model_d0_nod1_Marriage, conf.int = TRUE, conf.level = 0.95)
xtable(result_d0_nod1_Marriage,digits=3)

model_d0_nod1_Marriage<-multinom(class~Marriage, data=d0_nod1_t1t2t3_v , na.action=na.exclude)
result_d0_nod1_Marriage<-tidy(model_d0_nod1_Marriage)
xtable(result_d0_nod1_Marriage,digits=3)


model_d0_nod1_edu<-multinom(class~edu_level, data=d0_nod1_t1t2t3_v, na.action=na.exclude)
#summary(model_d0_nod1_edu)
result_d0_nod1_edu<-tidy(model_d0_nod1_edu, conf.int = TRUE, conf.level = 0.95)
xtable(result_d0_nod1_edu,digits=3)

model_d0_nod1_Drink<-multinom(class~Drink, data=d0_nod1_t1t2t3_v, na.action=na.exclude)
#summary(model_d0_nod1_Drink)
result_d0_nod1_Drink<-tidy(model_d0_nod1_Drink, conf.int = TRUE, conf.level = 0.95)
xtable(result_d0_nod1_Drink,digits=3)

model_d0_nod1_ExerciseState<-multinom(class~ ExerciseState, data=d0_nod1_t1t2t3_v, na.action=na.exclude)
#summary(model_d0_nod1_ExerciseState)
result_d0_nod1_ExerciseState<-tidy(model_d0_nod1_ExerciseState, conf.int = TRUE, conf.level = 0.95)
xtable(result_d0_nod1_ExerciseState,digits=3)

model_d0_nod1_Sex<-multinom(class~Sex, data=d0_nod1_t1t2t3_v, na.action=na.exclude)
#summary(model_d0_nod1_Sex)
result_d0_nod1_Sex<-tidy(model_d0_nod1_Sex, conf.int = TRUE, conf.level = 0.95)
xtable(result_d0_nod1_Sex,digits=3)

model_d0_nod1_TakeMed<-multinom(class~TakeMed, data=d0_nod1_t1t2t3_v, na.action=na.exclude)
#summary(model_d0_nod1_TakeMed)
result_d0_nod1_TakeMed<-tidy(model_d0_nod1_TakeMed, conf.int = TRUE, conf.level = 0.95)
xtable(result_d0_nod1_TakeMed,digits=3)

model_d0_nod1_Traffic<-multinom(class~Traffic, data=d0_nod1_t1t2t3_v, na.action=na.exclude)
#summary(model_d0_nod1_Traffic)
result_d0_nod1_Traffic<-tidy(model_d0_nod1_Traffic, conf.int = TRUE, conf.level = 0.95)
xtable(result_d0_nod1_Traffic,digits=3)

model_d0_nod1_DrinkMilk<-multinom(class~DrinkMilk, data=d0_nod1_t1t2t3_v, na.action=na.exclude)
#summary(model_d0_nod1_DrinkMilk)
result_d0_nod1_DrinkMilk<-tidy(model_d0_nod1_DrinkMilk, conf.int = TRUE, conf.level = 0.95)
xtable(result_d0_nod1_DrinkMilk,digits=3)

model_d0_nod1_AC<-multinom(class~AC, data=d0_nod1_t1t2t3_v, na.action=na.exclude)
#summary(model_d0_nod1_AC)
result_d0_nod1_AC<-tidy(model_d0_nod1_AC, conf.int = TRUE, conf.level = 0.95)
xtable(result_d0_nod1_AC,digits=3)

model_d0_nod1_TCHO<-multinom(class~TCHO, data=d0_nod1_t1t2t3_v, na.action=na.exclude)
#summary(model_d0_nod1_TCHO)
result_d0_nod1_TCHO<-tidy(model_d0_nod1_TCHO, conf.int = TRUE, conf.level = 0.95)
xtable(result_d0_nod1_TCHO,digits=3)

model_d0_nod1_Alb<-multinom(class~Alb, data=d0_nod1_t1t2t3_v, na.action=na.exclude)
#summary(model_d0_nod1_Alb)
result_d0_nod1_Alb<-tidy(model_d0_nod1_Alb, conf.int = TRUE, conf.level = 0.95)
xtable(result_d0_nod1_Alb,digits=3)

model_d0_nod1_GL<-multinom(class~GL, data=d0_nod1_t1t2t3_v, na.action=na.exclude)
#summary(model_d0_nod1_GL)
result_d0_nod1_GL<-tidy(model_d0_nod1_GL, conf.int = TRUE, conf.level = 0.95)
xtable(result_d0_nod1_GL,digits=3)

model_d0_nod1_RBC<-multinom(class~RBC, data=d0_nod1_t1t2t3_v, na.action=na.exclude)
#summary(model_d0_nod1_RBC)
result_d0_nod1_RBC<-tidy(model_d0_nod1_RBC, conf.int = TRUE, conf.level = 0.95)
xtable(result_d0_nod1_RBC,digits=3)

model_d0_nod1_WBC<-multinom(class~WBC, data=d0_nod1_t1t2t3_v, na.action=na.exclude)
#summary(model_d0_nod1_WBC)
result_d0_nod1_WBC<-tidy(model_d0_nod1_WBC, conf.int = TRUE, conf.level = 0.95)
xtable(result_d0_nod1_WBC,digits=3)

model_d0_nod1_HB<-multinom(class~HB, data=d0_nod1_t1t2t3_v, na.action=na.exclude)
#summary(model_d0_nod1_HB)
result_d0_nod1_HB<-tidy(model_d0_nod1_HB, conf.int = TRUE, conf.level = 0.95)
xtable(result_d0_nod1_HB,digits=3)

model_d0_nod1_Pus_cell<-multinom(class~Pus_cell, data=d0_nod1_t1t2t3_v, na.action=na.exclude)
#summary(model_d0_nod1_Pus_cell)
result_d0_nod1_Pus_cell<-tidy(model_d0_nod1_Pus_cell, conf.int = TRUE, conf.level = 0.95)
xtable(result_d0_nod1_Pus_cell,digits=3)
a<-rbind(result_d0_nod1_Marriage,
         result_d0_nod1_edu,
         result_d0_nod1_Drink,
         result_d0_nod1_ExerciseState,
         result_d0_nod1_Sex,
         result_d0_nod1_TakeMed,
         result_d0_nod1_Traffic,
         result_d0_nod1_DrinkMilk,
         result_d0_nod1_AC,
         result_d0_nod1_TCHO,
         result_d0_nod1_Alb,
         result_d0_nod1_GL,
         result_d0_nod1_RBC,
         result_d0_nod1_WBC,
         result_d0_nod1_HB,
         result_d0_nod1_Pus_cell)