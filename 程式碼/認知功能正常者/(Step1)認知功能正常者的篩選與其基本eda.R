library(readr)
library(dplyr)
library(ggplot2)
library(stringr)
library(nlme)

d_nod1d0_period<- read.table("/Users/yanting/health/project/d/d_nod1d0_period.csv",header = TRUE, sep = ",",fileEncoding='big5')
write.table(d_nod1d0_period,file="/Users/yanting/health/project/d/d_nod1d0_period.csv", sep=",",row.names=F,fileEncoding='big5')
c<-filter(d_period,sys_no=="C403100484398240Y0H3642327759")


#篩出為d之患者(任一年有接受調查者),共為108702人
d_all<-filter(pd_time,SPI_TotalWrong_94>=0|
                 SPI_TotalWrong_95>=0|
                 SPI_TotalWrong_96>=0|
                 SPI_TotalWrong_97>=0|
                 SPI_TotalWrong_98>=0|
                 SPI_TotalWrong_99>=0|
                 SPI_TotalWrong_100>=0)
#d_all需要再將d0、d1的人篩掉(最後為101373人)

#檢查是否有重複值
a<-d0_all[duplicated(d0_all$sys_no),]

#分男女
d_men<-filter(d_all,Sex=="男")
d_women<-filter(d_all,Sex=="女")


#choice沒有拒絕調查者
names(d0_men)
d_men_100<-filter(d_men,SPI_Refuse_100=="0")
d_women_94<-filter(d_women,SPI_Refuse_94=="0")
#summary後的值填入下#字號的dataframe中
summary(d_women_97$SPI_TotalWrong_97)

#繪成論文圖十五之錯誤題數趨勢圖,女性平均錯誤題數=該波女性所有錯誤題數之加總/該波所有女性有資料的人數
#男性平均錯誤題數=該波男性所有錯誤題數之加總/該波所有男性有資料的人數
d_w <- data.frame(time= c("t1","t2","t3","t4","t5","t6","t7","t1","t2","t3","t4","t5","t6","t7"),
                   wrongcount = c(0.1279, 0.1535, 0.1111, 0.1126, 0.1052, 0.0946, 0.0965, 0.1843, 0.1943, 0.1659, 0.1644, 0.1428, 0.1215, 0.1289), 
                   gender = c("men","men","men","men","men","men","men","women","women","women","women","women","women","women"))
hchart(d_w,"line",hcaes(x ="time",y = "wrongcount",group ="gender")) %>%hc_title(text="???????????????????????????????????????(n=101373)")%>%hc_plotOptions(line= list(dataLabels = list(enabled =TRUE)))

#(繪成論文圖十四歷年年齡分佈,使用d_age.ipynb檔)
d_women_96$age<-c(2007-d_women_96$Birth_Year)
mean(as.numeric(d_women_96$age))
d_age <- data.frame(time= c("t1","t2","t3","t4","t5","t6","t7"),
                     men = c(75.47, 75.46, 75.47, 75.71, 76.02, 76.13, 76.4), 
                     women = c(72.77, 72.64, 72.66, 72.82, 72.98, 73.13, 73.46))


#poLCA(潛在類別分析,將d_all分成兩類)
library(poLCA)
b<-cbind(t1=t1+1,t2=t2+1,t3=t3+1,t4=t4+1,t5=t5+1,t6=t6+1,t7=t7+1) ~ 1
lca_d<-poLCA(b,maxiter=1000, nclass=2, nrep=1, data=d_nod1d0_period,na.rm=F)

d_class<- as.data.frame(lca_d[["predclass"]])
colnames(d_class) <- c("class")
d_nod1d0_period$class<-d_class$class
d_class1<-filter(d_nod1d0_period,class=="1")
d_class2<-filter(d_nod1d0_period,class=="2")

#lavaan(依想要取的時間區間看兩類的人數值分佈,再使用下面#繪圖)
model <- 'i =~ 1*t1+1*t2+1*t3
          s =~ 0*t1+1*t2+2*t3'
fit_d <- growth(model, data=d_class1)
summary(fit_d)

fit2_d <- growth(model, data=d_class2)
summary(fit2_d)


#graph(需再換一下數值)
plot(c(1,7), c(0,8), type = "n", xlab = "time", ylab = "wrong",main ="d_class3_t3(n=101373->51458)")
abline(a = 0.074, b = -0.014, col="red",lty=1)
abline(a = 0.802, b = 0.012, col="blue",lty=3)
abline(a = 2.975, b = 0.195, col="dark green",lty=6)
legend(1,8, c("class1(n=6307)","class2(n=45151)"), 
       lty=c(1,3), lwd=1,cex=0.6,ncol=2,col="black")

