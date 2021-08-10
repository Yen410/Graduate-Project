d_nod1d0_t1t2t3<-filter(d_nod1d0_period,t1>=0&t2>=0&t3>=0)

#d0_nod1no year_98
d_nod1d0_t1t2t3_94<-filter(d_nod1d0_t1t2t3,start_time==94)
d_nod1d0_t1t2t3_95<-filter(d_nod1d0_t1t2t3,start_time==95)
d_nod1d0_t1t2t3_96<-filter(d_nod1d0_t1t2t3,start_time==96)
d_nod1d0_t1t2t3_97<-filter(d_nod1d0_t1t2t3,start_time==97)
d_nod1d0_t1t2t3_98<-filter(d_nod1d0_t1t2t3,start_time==98)
#pd
d_nod1d0_t1t2t3_94<-merge(d_nod1d0_t1t2t3_94, pd_94, by = "sys_no", all.x = T)
d_nod1d0_t1t2t3_95<-merge(d_nod1d0_t1t2t3_95, pd_95, by = "sys_no", all.x = T)
d_nod1d0_t1t2t3_96<-merge(d_nod1d0_t1t2t3_96, pd_96, by = "sys_no", all.x = T)
d_nod1d0_t1t2t3_97<-merge(d_nod1d0_t1t2t3_97, pd_97, by = "sys_no", all.x = T)
d_nod1d0_t1t2t3_98<-merge(d_nod1d0_t1t2t3_98, pd_98, by = "sys_no", all.x = T)
#pe
d_nod1d0_t1t2t3_94<-merge(d_nod1d0_t1t2t3_94, pe94_c, by = "sys_no", all.x = T)
d_nod1d0_t1t2t3_95<-merge(d_nod1d0_t1t2t3_95, pe95_c, by = "sys_no", all.x = T)
d_nod1d0_t1t2t3_96<-merge(d_nod1d0_t1t2t3_96, pe96_c, by = "sys_no", all.x = T)
d_nod1d0_t1t2t3_97<-merge(d_nod1d0_t1t2t3_97, pe97_c, by = "sys_no", all.x = T)
d_nod1d0_t1t2t3_98<-merge(d_nod1d0_t1t2t3_98, pe98_c, by = "sys_no", all.x = T)
#biochemistry
d_nod1d0_t1t2t3_94<-merge(d_nod1d0_t1t2t3_94, biochemistry94, by = "sys_no", all.x = T)
d_nod1d0_t1t2t3_95<-merge(d_nod1d0_t1t2t3_95, biochemistry95, by = "sys_no", all.x = T)
d_nod1d0_t1t2t3_96<-merge(d_nod1d0_t1t2t3_96, biochemistry96, by = "sys_no", all.x = T)
d_nod1d0_t1t2t3_97<-merge(d_nod1d0_t1t2t3_97, biochemistry97, by = "sys_no", all.x = T)
d_nod1d0_t1t2t3_98<-merge(d_nod1d0_t1t2t3_98, biochemistry98, by = "sys_no", all.x = T)
#Otherex
d_nod1d0_t1t2t3_94<-merge(d_nod1d0_t1t2t3_94, Otherex94, by = "sys_no", all.x = T)
d_nod1d0_t1t2t3_95<-merge(d_nod1d0_t1t2t3_95, Otherex95, by = "sys_no", all.x = T)
d_nod1d0_t1t2t3_96<-merge(d_nod1d0_t1t2t3_96, Otherex96, by = "sys_no", all.x = T)
d_nod1d0_t1t2t3_97<-merge(d_nod1d0_t1t2t3_97, Otherex97, by = "sys_no", all.x = T)
d_nod1d0_t1t2t3_98<-merge(d_nod1d0_t1t2t3_98, Otherex98, by = "sys_no", all.x = T)
#blood
d_nod1d0_t1t2t3_94<-merge(d_nod1d0_t1t2t3_94, Blood94_status, by = "sys_no", all.x = T)
d_nod1d0_t1t2t3_95<-merge(d_nod1d0_t1t2t3_95, Blood95_status, by = "sys_no", all.x = T)
d_nod1d0_t1t2t3_96<-merge(d_nod1d0_t1t2t3_96, Blood96_status, by = "sys_no", all.x = T)
d_nod1d0_t1t2t3_97<-merge(d_nod1d0_t1t2t3_97, Blood97_status, by = "sys_no", all.x = T)
d_nod1d0_t1t2t3_98<-merge(d_nod1d0_t1t2t3_98, Blood98_status, by = "sys_no", all.x = T)
#urine
d_nod1d0_t1t2t3_94<-merge(d_nod1d0_t1t2t3_94, Urine94, by = "sys_no", all.x = T)
d_nod1d0_t1t2t3_95<-merge(d_nod1d0_t1t2t3_95, Urine95, by = "sys_no", all.x = T)
d_nod1d0_t1t2t3_96<-merge(d_nod1d0_t1t2t3_96, Urine96, by = "sys_no", all.x = T)
d_nod1d0_t1t2t3_97<-merge(d_nod1d0_t1t2t3_97, Urine97, by = "sys_no", all.x = T)
d_nod1d0_t1t2t3_98<-merge(d_nod1d0_t1t2t3_98, Urine98, by = "sys_no", all.x = T)

d_nod1d0_t1t2t3<-rbind(d_nod1d0_t1t2t3_94,d_nod1d0_t1t2t3_95,d_nod1d0_t1t2t3_96,d_nod1d0_t1t2t3_97,d_nod1d0_t1t2t3_98)
#pe_e
d_nod1d0_t1t2t3<-merge(d_nod1d0_t1t2t3, pe_e, by = "sys_no", all.x = T)
d_nod1d0_t1t2t3<-d_nod1d0_t1t2t3[!duplicated(d_nod1d0_t1t2t3$sys_no),]
