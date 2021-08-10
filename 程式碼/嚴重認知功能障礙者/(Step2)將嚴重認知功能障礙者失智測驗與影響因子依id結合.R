Urine94<- read.table("/Users/yanting/health/project/Urine94_c.csv",header = TRUE, sep = ",",fileEncoding='big5')
Urine95<- read.table("/Users/yanting/health/project/Urine95_c.csv",header = TRUE, sep = ",",fileEncoding='big5')
Urine96<- read.table("/Users/yanting/health/project/Urine96_c.csv",header = TRUE, sep = ",",fileEncoding='big5')
Urine97<- read.table("/Users/yanting/health/project/Urine97_c.csv",header = TRUE, sep = ",",fileEncoding='big5')
Urine98<- read.table("/Users/yanting/health/project/Urine98_c.csv",header = TRUE, sep = ",",fileEncoding='big5')

#只取到t3
d1_t1t2t3<-filter(d1_period,t1>=0&t2>=0&t3>=0)

#d1no year_98
colnames(d1_t1t2t3) <- c("sys_no", "t1",'t2','t3','t4','t5','t6','t7','start_time','class')
d1_t1t2t3_94<-filter(d1_t1t2t3,start_time==94)
d1_t1t2t3_95<-filter(d1_t1t2t3,start_time==95)
d1_t1t2t3_96<-filter(d1_t1t2t3,start_time==96)
d1_t1t2t3_97<-filter(d1_t1t2t3,start_time==97)
d1_t1t2t3_98<-filter(d1_t1t2t3,start_time==98)

#跟各年pd合併
d1_t1t2t3_94<-merge(d1_t1t2t3_94, pd_94, by = "sys_no", all.x = T)
d1_t1t2t3_95<-merge(d1_t1t2t3_95, pd_95, by = "sys_no", all.x = T)
d1_t1t2t3_96<-merge(d1_t1t2t3_96, pd_96, by = "sys_no", all.x = T)
d1_t1t2t3_97<-merge(d1_t1t2t3_97, pd_97, by = "sys_no", all.x = T)

#pe
d1_t1t2t3_94<-merge(d1_t1t2t3_94, pe94_c, by = "sys_no", all.x = T)
d1_t1t2t3_95<-merge(d1_t1t2t3_95, pe95_c, by = "sys_no", all.x = T)
d1_t1t2t3_96<-merge(d1_t1t2t3_96, pe96_c, by = "sys_no", all.x = T)
d1_t1t2t3_97<-merge(d1_t1t2t3_97, pe97_c, by = "sys_no", all.x = T)

#biochemistry
d1_t1t2t3_94<-merge(d1_t1t2t3_94, biochemistry94, by = "sys_no", all.x = T)
d1_t1t2t3_95<-merge(d1_t1t2t3_95, biochemistry95, by = "sys_no", all.x = T)
d1_t1t2t3_96<-merge(d1_t1t2t3_96, biochemistry96, by = "sys_no", all.x = T)
d1_t1t2t3_97<-merge(d1_t1t2t3_97, biochemistry97, by = "sys_no", all.x = T)

#Otherex
d1_t1t2t3_94<-merge(d1_t1t2t3_94, Otherex94, by = "sys_no", all.x = T)
d1_t1t2t3_95<-merge(d1_t1t2t3_95, Otherex95, by = "sys_no", all.x = T)
d1_t1t2t3_96<-merge(d1_t1t2t3_96, Otherex96, by = "sys_no", all.x = T)
d1_t1t2t3_97<-merge(d1_t1t2t3_97, Otherex97, by = "sys_no", all.x = T)

#blood
d1_t1t2t3_94<-merge(d1_t1t2t3_94, Blood94_status, by = "sys_no", all.x = T)
d1_t1t2t3_95<-merge(d1_t1t2t3_95, Blood95_status, by = "sys_no", all.x = T)
d1_t1t2t3_96<-merge(d1_t1t2t3_96, Blood96_status, by = "sys_no", all.x = T)
d1_t1t2t3_97<-merge(d1_t1t2t3_97, Blood97_status, by = "sys_no", all.x = T)

#urine
d1_t1t2t3_94<-merge(d1_t1t2t3_94, Urine94, by = "sys_no", all.x = T)
d1_t1t2t3_95<-merge(d1_t1t2t3_95, Urine95, by = "sys_no", all.x = T)
d1_t1t2t3_96<-merge(d1_t1t2t3_96, Urine96, by = "sys_no", all.x = T)
d1_t1t2t3_97<-merge(d1_t1t2t3_97, Urine97, by = "sys_no", all.x = T)

d1_t1t2t3<-rbind(d1_t1t2t3_94, d1_t1t2t3_95,d1_t1t2t3_96,d1_t1t2t3_97)

#pe_e
d1_t1t2t3<-merge(d1_t1t2t3, pe_e, by = "sys_no", all.x = T)
