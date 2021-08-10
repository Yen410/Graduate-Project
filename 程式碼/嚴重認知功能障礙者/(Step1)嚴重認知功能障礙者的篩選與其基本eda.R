#資料匯入輸出
d1_period<- read.table("/Users/yanting/health/project/d1/d1_period.csv",header = TRUE, sep = ",",fileEncoding='big5')
drink<- read.table("/Users/yanting/health/project/Pe101.csv",header = TRUE, sep = ",",fileEncoding='big5')
write.table(d1,file="", sep=",",row.names=F,fileEncoding='big5')

#合併pd與各spi,並將na值取代為0
pd1<- merge(pd1,spi94,by="sys_no",all.x = T)
pd1$SPI_year_94<-str_replace_all(pd1$SPI_year_94,"NA","0")



#篩出為d1之患者
d1_all<-filter(pd_time,Obstaclekind=="失智症")
na0<- data.frame(sys_no=pd1$sys_no,
                 Obstaclegrade=pd1$Obstaclegrade)
d1_all<- merge(d1_all,na0,by="sys_no",all.x = T)

#篩掉任一年錯誤題數小於3之患者(評估有待商榷)
e<-filter(d1,t1<3&
            t2<3&
            t3<3&
            t4<3&
            t5<3&
            t6<3&
            t7<3)

#分男女
d1_women<-filter(d1_all,Sex=="女")
d1_all[duplicated(d1_all$sys_no),]


#choice沒有拒絕調查者
names(d1_men)
d1_men_100<-filter(d1_men,SPI_Refuse_100=="0")
d1_women_95<-filter(d1_women,SPI_Refuse_95=="0")
#summary後的值填入下#字號的dataframe中
summary(d1_women_95$SPI_TotalWrong_95)

#繪成論文圖十一之錯誤題數趨勢圖(d1,重度失智患者)
d1_w <- data.frame(time= c("t1","t2","t3","t4","t5","t6","t7","t1","t2","t3","t4","t5","t6","t7"),
                   wrongcount = c(1.56, 2.62, 2.64, 2.39, 4.62, 3.94, 5.64,2.84, 2.47, 3.19, 4.23, 5.31, 5.78, 5.5), 
                   gender = c("men","men","men","men","men","men","men","women","women","women","women","women","women","women"))
hchart(d1_w,"line",hcaes(x ="time",y = "wrongcount",group ="gender")) %>%hc_title(text="???????????????????????????????????????(n=85)")%>%hc_plotOptions(line= list(dataLabels = list(enabled =TRUE)))

#(繪成論文圖十歷年年齡分佈,使用d_age.ipynb檔)
d1_men_94$age<-c(2005-d1_men_94$Birth_Year)
mean(as.numeric(d1_men_94$age))
d1_age <- data.frame(time= c("t1","t2","t3","t4","t5","t6","t7"),
                   men = c(77.22, 78.92, 79.45, 80, 81.9, 81.89, 80.9), 
                   women = c(76.25, 76.97, 78.81, 80.54, 81.17, 81.02, 81.76))

#轉置d1,以便繪成個人的歷年錯誤折線圖
library(tidyr)
d1<- data.frame(sys_no=d1_all$sys_no,
                t1=d1_all$SPI_TotalWrong_94,
                t2=d1_all$SPI_TotalWrong_95,
                t3=d1_all$SPI_TotalWrong_96,
                t4=d1_all$SPI_TotalWrong_97,
                t5=d1_all$SPI_TotalWrong_98,
                t6=d1_all$SPI_TotalWrong_99,
                t7=d1_all$SPI_TotalWrong_100)
sd1time<- gather(d1_period, key = "time", value = "wrongcount", t1, t2,t3,t4,t5,t6,t7)
#要先匯出csv,看各欄位名稱是否正確(因轉置會造成名稱上的錯誤,所以為sd1time2)
ggplot(sd1time2,aes(x=time,y=wrongcount,group=sys_no)) +   
  geom_line()+labs(title="n=85(line)",x="time",y="wrongcount")


#beat model(看分成幾類比較好)
a<-cbind(t1=t1+1,t2=t2+1,t3=t3+1,t4=t4+1,t5=t5+1,t6=t6+1,t7=t7+1) ~ 1
max_II <- -100000
min_bic <- 100000
for(i in 2:5){
  lc <- poLCA(a, d1, nclass=i, maxiter=1000,  na.rm=T,nrep=1)
  if(lc$bic < min_bic){
    min_bic <- lc$bic
    LCA_best_model<-lc
  }
}    	
LCA_best_model

d1_lca_3<-poLCA(a,graphs=TRUE,maxiter=1000, nclass=3, nrep=1, data=d1,na.rm =T)


rm(temp_data)
m04a$timeinterval <- m04a$timeinterval %>% as.POSIXct()

#poLCA(潛在類別分析,將d1分成兩類)
library(poLCA)
b<-cbind(t1=t1+1,t2=t2+1,t3=t3+1,t4=t4+1,t5=t5+1,t6=t6+1,t7=t7+1) ~ 1
lca_d1<-poLCA(b,maxiter=1000, nclass=2, nrep=1, data=d1_period,na.rm=F)

d1_class<- as.data.frame(lca_d1[["predclass"]])
colnames(d1_class) <- c("class")
d1_period$class<-d1_class$class
d1_class1<-filter(d1_period,class=="1")
d1_class2<-filter(d1_period,class=="2")

#lavaan(依想要取的時間區間看兩類的人數值分佈,再使用下面#繪圖)
library(lavaan)
model <- 'i =~ 1*t1+1*t2+1*t3
  s =~ 0*t1+1*t2+2*t3'
fit_d1 <- growth(model, data=d1_class1)
summary(fit_d1)

fit2_d1 <- growth(model, data=d1_class2)
summary(fit2_d1)


#graph(此為取至t5的圖)
plot(c(1,7), c(0,8), type = "n", xlab = "time", ylab = "wrong",main ="d1_class_t5(n=85->51)")
abline(a = 2.69, b = 0.683, col="red",lty=1)
abline(a = 2.643, b = -0.112, col="blue",lty=3)
legend(3,8, c("class1(n=24)","class2(n=27)"), 
       lty=c(1,3), lwd=1,cex=0.6,col="black")
