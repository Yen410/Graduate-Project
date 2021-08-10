write.table(a,file="/Users/yanting/health/project/d/a.csv", sep=",",row.names=F,fileEncoding='big5')
result_d_m<- read.table("/Users/yanting/health/project/d/result_d_m.csv",header = TRUE, sep = ",",fileEncoding='big5')

#d(有顯著變項的)_m
d_nod1d0_t1t2t3_v$class<-factor(d_nod1d0_t1t2t3_v$class)
d_nod1d0_t1t2t3_v$class <- relevel(d_nod1d0_t1t2t3_v$class,ref="2")
d_nod1d0_t1t2t3_v$Drink<-factor(d_nod1d0_t1t2t3_v$Drink)
d_nod1d0_t1t2t3_v$ExerciseState<-factor(d_nod1d0_t1t2t3_v$ExerciseState)
contrasts(d_nod1d0_t1t2t3_v$Drink)<-contr.treatment(3, base=1)
contrasts(d_nod1d0_t1t2t3_v$ExerciseState)<-contr.treatment(3, base=1)
model_d_m<-multinom(class~Marriage+edu_level+Drink+ExerciseState+Sex+
               TakeMed+Traffic+DrinkMilk+AC+TCHO+Alb+GL+Pus_cell+Protein+sugar+ur_blood+Crea+BUN+Xray+EKG+RBC+WBC+
               HCT+MCV+MCH+HB, data=d_nod1d0_t1t2t3_v, na.action=na.exclude)
result_d_m<-tidy(model_d_m, conf.int = TRUE, conf.level = 0.95)
xtable(result_d_m,digits=3)

#d(有顯著變項的)_u(有p值)
model_d_nod1d0_Marriage<-multinom(class~Marriage, data=d_nod1d0_t1t2t3_v, na.action=na.exclude)
# model model_d_nod1d0_Marriage的coefficient plot
result_d_nod1d0_Marriage<-tidy(model_d_nod1d0_Marriage, conf.int = TRUE, conf.level = 0.95)
xtable(result_d_nod1d0_Marriage,digits=3)

model_d_nod1d0_edu<-multinom(class~edu_level, data=d_nod1d0_t1t2t3_v, na.action=na.exclude)
result_d_nod1d0_edu<-tidy(model_d_nod1d0_edu, conf.int = TRUE, conf.level = 0.95)
xtable(result_d_nod1d0_edu,digits=3)

model_d_nod1d0_Drink<-multinom(class~Drink, data=d_nod1d0_t1t2t3_v, na.action=na.exclude)
result_d_nod1d0_Drink<-tidy(model_d_nod1d0_Drink, conf.int = TRUE, conf.level = 0.95)
xtable(result_d_nod1d0_Drink,digits=3)

model_d_nod1d0_ExerciseState<-multinom(class~ ExerciseState, data=d_nod1d0_t1t2t3_v, na.action=na.exclude)
result_d_nod1d0_ExerciseState<-tidy(model_d_nod1d0_ExerciseState, conf.int = TRUE, conf.level = 0.95)
xtable(result_d_nod1d0_ExerciseState,digits=3)

model_d_nod1d0_Sex<-multinom(class~Sex, data=d_nod1d0_t1t2t3_v, na.action=na.exclude)
result_d_nod1d0_Sex<-tidy(model_d_nod1d0_Sex, conf.int = TRUE, conf.level = 0.95)
xtable(result_d_nod1d0_Sex,digits=3)

model_d_nod1d0_TakeMed<-multinom(class~TakeMed, data=d_nod1d0_t1t2t3_v, na.action=na.exclude)
result_d_nod1d0_TakeMed<-tidy(model_d_nod1d0_TakeMed, conf.int = TRUE, conf.level = 0.95)
xtable(result_d_nod1d0_TakeMed,digits=3)

model_d_nod1d0_Traffic<-multinom(class~Traffic, data=d_nod1d0_t1t2t3_v, na.action=na.exclude)
result_d_nod1d0_Traffic<-tidy(model_d_nod1d0_Traffic, conf.int = TRUE, conf.level = 0.95)
xtable(result_d_nod1d0_Traffic,digits=3)

model_d_nod1d0_DrinkMilk<-multinom(class~DrinkMilk, data=d_nod1d0_t1t2t3_v, na.action=na.exclude)
result_d_nod1d0_DrinkMilk<-tidy(model_d_nod1d0_DrinkMilk, conf.int = TRUE, conf.level = 0.95)
xtable(result_d_nod1d0_DrinkMilk,digits=3)

model_d_nod1d0_AC<-multinom(class~AC, data=d_nod1d0_t1t2t3_v, na.action=na.exclude)
result_d_nod1d0_AC<-tidy(model_d_nod1d0_AC, conf.int = TRUE, conf.level = 0.95)
xtable(result_d_nod1d0_AC,digits=3)

model_d_nod1d0_TCHO<-multinom(class~TCHO, data=d_nod1d0_t1t2t3_v, na.action=na.exclude)
result_d_nod1d0_TCHO<-tidy(model_d_nod1d0_TCHO, conf.int = TRUE, conf.level = 0.95)
xtable(result_d_nod1d0_TCHO,digits=3)

model_d_nod1d0_Alb<-multinom(class~Alb, data=d_nod1d0_t1t2t3_v, na.action=na.exclude)
result_d_nod1d0_Alb<-tidy(model_d_nod1d0_Alb, conf.int = TRUE, conf.level = 0.95)
xtable(result_d_nod1d0_Alb,digits=3)

model_d_nod1d0_GL<-multinom(class~GL, data=d_nod1d0_t1t2t3_v, na.action=na.exclude)
result_d_nod1d0_GL<-tidy(model_d_nod1d0_GL, conf.int = TRUE, conf.level = 0.95)
xtable(result_d_nod1d0_GL,digits=3)

model_d_nod1d0_RBC<-multinom(class~RBC, data=d_nod1d0_t1t2t3_v, na.action=na.exclude)
result_d_nod1d0_RBC<-tidy(model_d_nod1d0_RBC, conf.int = TRUE, conf.level = 0.95)
xtable(result_d_nod1d0_RBC,digits=3)

model_d_nod1d0_WBC<-multinom(class~WBC, data=d_nod1d0_t1t2t3_v, na.action=na.exclude)
result_d_nod1d0_WBC<-tidy(model_d_nod1d0_WBC, conf.int = TRUE, conf.level = 0.95)
xtable(result_d_nod1d0_WBC,digits=3)

model_d_nod1d0_HB<-multinom(class~HB, data=d_nod1d0_t1t2t3_v, na.action=na.exclude)
result_d_nod1d0_HB<-tidy(model_d_nod1d0_HB, conf.int = TRUE, conf.level = 0.95)
xtable(result_d_nod1d0_HB,digits=3)

model_d_nod1d0_Pus_cell<-multinom(class~Pus_cell, data=d_nod1d0_t1t2t3_v, na.action=na.exclude)
result_d_nod1d0_Pus_cell<-tidy(model_d_nod1d0_Pus_cell, conf.int = TRUE, conf.level = 0.95)
xtable(result_d_nod1d0_Pus_cell,digits=3)

model_d_nod1d0_Protein<-multinom(class~Protein, data=d_nod1d0_t1t2t3_v, na.action=na.exclude)
result_d_nod1d0_Protein<-tidy(model_d_nod1d0_Protein, conf.int = TRUE, conf.level = 0.95)
xtable(result_d_nod1d0_Protein,digits=3)

model_d_nod1d0_sugar<-multinom(class~sugar, data=d_nod1d0_t1t2t3_v, na.action=na.exclude)
result_d_nod1d0_sugar<-tidy(model_d_nod1d0_sugar, conf.int = TRUE, conf.level = 0.95)
xtable(result_d_nod1d0_sugar,digits=3)

model_d_nod1d0_ur_blood<-multinom(class~ur_blood, data=d_nod1d0_t1t2t3_v, na.action=na.exclude)
result_d_nod1d0_ur_blood<-tidy(model_d_nod1d0_ur_blood, conf.int = TRUE, conf.level = 0.95)
xtable(result_d_nod1d0_ur_blood,digits=3)

model_d_nod1d0_Crea<-multinom(class~Crea, data=d_nod1d0_t1t2t3_v, na.action=na.exclude)
result_d_nod1d0_Crea<-tidy(model_d_nod1d0_Crea, conf.int = TRUE, conf.level = 0.95)
xtable(result_d_nod1d0_Crea,digits=3)

model_d_nod1d0_BUN<-multinom(class~BUN, data=d_nod1d0_t1t2t3_v, na.action=na.exclude)
result_d_nod1d0_BUN<-tidy(model_d_nod1d0_BUN, conf.int = TRUE, conf.level = 0.95)
xtable(result_d_nod1d0_BUN,digits=3)

model_d_nod1d0_Xray<-multinom(class~Xray, data=d_nod1d0_t1t2t3_v, na.action=na.exclude)
result_d_nod1d0_Xray<-tidy(model_d_nod1d0_Xray, conf.int = TRUE, conf.level = 0.95)
xtable(result_d_nod1d0_Xray,digits=3)

model_d_nod1d0_EKG<-multinom(class~EKG, data=d_nod1d0_t1t2t3_v, na.action=na.exclude)
result_d_nod1d0_EKG<-tidy(model_d_nod1d0_EKG, conf.int = TRUE, conf.level = 0.95)
xtable(result_d_nod1d0_EKG,digits=3)

model_d_nod1d0_RBC<-multinom(class~RBC, data=d_nod1d0_t1t2t3_v, na.action=na.exclude)
result_d_nod1d0_RBC<-tidy(model_d_nod1d0_RBC, conf.int = TRUE, conf.level = 0.95)
xtable(result_d_nod1d0_RBC,digits=3)

model_d_nod1d0_WBC<-multinom(class~WBC, data=d_nod1d0_t1t2t3_v, na.action=na.exclude)
result_d_nod1d0_WBC<-tidy(model_d_nod1d0_WBC, conf.int = TRUE, conf.level = 0.95)
xtable(result_d_nod1d0_WBC,digits=3)

model_d_nod1d0_HCT<-multinom(class~HCT, data=d_nod1d0_t1t2t3_v, na.action=na.exclude)
result_d_nod1d0_HCT<-tidy(model_d_nod1d0_HCT, conf.int = TRUE, conf.level = 0.95)
xtable(result_d_nod1d0_HCT,digits=3)

model_d_nod1d0_MCV<-multinom(class~MCV, data=d_nod1d0_t1t2t3_v, na.action=na.exclude)
result_d_nod1d0_MCV<-tidy(model_d_nod1d0_MCV, conf.int = TRUE, conf.level = 0.95)
xtable(result_d_nod1d0_MCV,digits=3)

model_d_nod1d0_MCH<-multinom(class~MCH, data=d_nod1d0_t1t2t3_v, na.action=na.exclude)
result_d_nod1d0_MCH<-tidy(model_d_nod1d0_MCH, conf.int = TRUE, conf.level = 0.95)
xtable(result_d_nod1d0_MCH,digits=3)

model_d_nod1d0_HB<-multinom(class~HB, data=d_nod1d0_t1t2t3_v, na.action=na.exclude)
result_d_nod1d0_HB<-tidy(model_d_nod1d0_HB, conf.int = TRUE, conf.level = 0.95)
xtable(result_d_nod1d0_HB,digits=3)

a<-rbind(result_d_nod1d0_Marriage,
         result_d_nod1d0_edu,
         result_d_nod1d0_Drink,
         result_d_nod1d0_ExerciseState,
         result_d_nod1d0_Sex,
         result_d_nod1d0_TakeMed,
         result_d_nod1d0_Traffic,
         result_d_nod1d0_DrinkMilk,
         result_d_nod1d0_AC,
         result_d_nod1d0_TCHO,
         result_d_nod1d0_Alb,
         result_d_nod1d0_GL,
         result_d_nod1d0_Pus_cell,
         result_d_nod1d0_Protein,
         result_d_nod1d0_sugar,
         result_d_nod1d0_ur_blood,
         result_d_nod1d0_Crea,
         result_d_nod1d0_BUN,
         result_d_nod1d0_Xray,
         result_d_nod1d0_EKG,
         result_d_nod1d0_RBC,
         result_d_nod1d0_WBC,
         result_d_nod1d0_HCT,
         result_d_nod1d0_MCV,
         result_d_nod1d0_MCH,
         result_d_nod1d0_HB
         )


#d(以d0的變項看關聯性)
model_d0_m_based0 <- multinom(class~Marriage+Sex+edu_level+Drink+ExerciseState+
                         TakeMed+Traffic+DrinkMilk+AC+TCHO+Alb+GL+RBC+WBC+HB+Pus_cell,
                       data=d_nod1d0_t1t2t3_v,na.action=na.exclude)
result_d0_m_based0<-tidy(model_d0_m_based0)
xtable(result_d0_m_based0,digits=3)
