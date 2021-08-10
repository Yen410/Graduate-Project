library(readr)
library(dplyr)
library(ggplot2)
library(stringr)
write.table(d0_nod1_period,file="/Users/yanting/health/project/d0/d0_nod1_period.csv", sep=",",row.names=F,fileEncoding='big5')
d0_nod1_period<-read.table("/Users/yanting/health/project/d0/d0_nod1_period.csv",header = TRUE, sep = ",",fileEncoding='big5')

#篩出為d0之患者(輕度失智症患者)
d0_all<-filter(pd_time,SPI_TotalWrong_94>=3|
                 SPI_TotalWrong_95>=3|
                 SPI_TotalWrong_96>=3|
                 SPI_TotalWrong_97>=3|
                 SPI_TotalWrong_98>=3|
                 SPI_TotalWrong_99>=3|
                 SPI_TotalWrong_100>=3)

#檢查是否有重複值
cc<-filter(d0_period,sys_no=="C40315837475199Y0H9877364449")
d0_all[duplicated(d0_all$sys_no),]

#分男女
d0_men<-filter(d0_all,Sex=="男")
d0_women<-filter(d0_all,Sex=="女")

#choice沒有拒絕調查者
names(d0_men)
d0_men_100<-filter(d0_men,SPI_Refuse_100=="0")
d0_women_94<-filter(d0_women,SPI_Refuse_94=="0")
#summary後的值填入下#字號的dataframe中
summary(d0_women_94$SPI_TotalWrong_94)

#繪成論文圖十三之錯誤題數趨勢圖(d0,輕度失智患者)
d0_w <- data.frame(time= c("t1","t2","t3","t4","t5","t6","t7","t1","t2","t3","t4","t5","t6","t7"),
                   wrongcount = c(3.29, 2.59, 2.73, 3.23, 3.05, 3.02, 3.43, 3.24, 2.95, 2.97, 3.28, 3.12, 2.99, 3.3), 
                   gender = c("men","men","men","men","men","men","men","women","women","women","women","women","women","women"),
                   count=c(1406,1387,1389,1424,1208,1007,902,1824,1805,1842,1947,1680,1423,1284))
hchart(d0_w,"line",hcaes(x ="time",y = "wrongcount",group ="gender")) %>%hc_title(text="???????????????????????????????????????(n=7244)")%>%hc_plotOptions(line= list(dataLabels = list(enabled =TRUE)))

#(繪成論文圖十二歷年年齡分佈,使用d_age.ipynb檔)
d0_men_94$age<-c(2005-d0_men_94$Birth_Year)
mean(as.numeric(d0_men_94$age))
d0_age <- data.frame(time= c("t1","t2","t3","t4","t5","t6","t7"),
                     men = c(79.39, 79.97, 80.65, 81.13, 81.41, 81.78, 82.26), 
                     women = c(77.37, 78.27, 78.79, 79.3, 79.95, 80.27, 80.82))

#轉置d0,以便繪成個人的歷年錯誤折線圖
d0<- data.frame(sys_no=d0_all$sys_no,
                t1=d0_all$SPI_TotalWrong_94,
                t2=d0_all$SPI_TotalWrong_95,
                t3=d0_all$SPI_TotalWrong_96,
                t4=d0_all$SPI_TotalWrong_97,
                t5=d0_all$SPI_TotalWrong_98,
                t6=d0_all$SPI_TotalWrong_99,
                t7=d0_all$SPI_TotalWrong_100)
sd0time2<- gather(d0, key = "time", value = "wrongcount", t1, t2,t3,t4,t5,t6,t7)
#要先匯出csv,看各欄位名稱是否正確(因轉置會造成名稱上的錯誤,所以為sd0time2)
ggplot(sd0time2,aes(x=time,y=wrongcount,group=sys_no)) +   
  geom_line()+labs(title="n=7244(line)",x="time",y="wrongcount")

#poLCA(潛在類別分析,將d0分成三類)
library(poLCA)
b<-cbind(t1=t1+1,t2=t2+1,t3=t3+1,t4=t4+1,t5=t5+1,t6=t6+1,t7=t7+1) ~ 1
lca_d0<-poLCA(b,maxiter=1000, nclass=3, nrep=1, data=d0_nod1_period,na.rm=F)

d0_class<- as.data.frame(lca_d0[["predclass"]])
colnames(d0_class) <- c("class")
d0_nod1_period$class<-d0_class$class
d0_class1<-filter(d0_nod1_period,class=="1")
d0_class2<-filter(d0_nod1_period,class=="2")
d0_class3<-filter(d0_nod1_period,class=="3")

#lavaan(依想要取的時間區間看兩類的人數值分佈,再使用下面#繪圖)
model <- 'i =~ 1*t1+1*t2+1*t3
          s =~ 0*t1+1*t2+2*t3'
fit_d0 <- growth(model, data=d0_class1)
summary(fit_d0)

fit2_d0<- growth(model, data=d0_class2)
summary(fit2_d0)

fit3_d0 <- growth(model, data=d0_class3)
summary(fit3_d0)

#graph(此為取至t4的圖)
plot(c(1,7), c(0,8), type = "n", xlab = "time", ylab = "wrong",main ="d0_class_t4(n=7329->3170)")
abline(a = 1.286, b = -0.153, col="red",lty=1)
abline(a = 4.957, b = 0.301, col="blue",lty=3)
abline(a = 1.830, b = 0.18, col="dark green",lty=6)
legend(1,8, c("class1(n=1474)","class2(n=560)","class3(n=1503)"), 
       lty=c(1,3,6), lwd=1,cex=0.6,ncol=3,col="black")



