#實驗選出分成幾類最恰當，在此謹以輕度認知功能障礙者之資料做呈現
#Loglinear independence model.
lc2<-poLCA(b, data=d0, nclass=2, na.rm = T, nrep=1, maxiter=1000)
lc3<-poLCA(b, data=d0, nclass=3, na.rm = T, nrep=1, maxiter=1000)
lc4<-poLCA(b, data=d0, nclass=4, na.rm = T, nrep=1, maxiter=1000) 
lc5<-poLCA(b, data=d0, nclass=5, na.rm = T, nrep=1, maxiter=1000)
# generate dataframe with fit-values
results <- data.frame(Modell=c("Modell 2"),
                      log_likelihood=lc2$llik,
                      df = lc2$resid.df,
                      BIC=lc2$bic,
                      ABIC=  (-2*lc2$llik) + ((log((lc2$N + 2)/24)) * lc2$npar),
                      CAIC = (-2*lc2$llik) + lc2$npar * (1 + log(lc2$N)), 
                      likelihood_ratio=lc2$Gsq,
                      stringsAsFactors=FALSE)
#results$Modell<-as.integer(results$Modell)
#results[2,1]<-c("Modell 2")
results[2,1]<-c("Modell 3")
results[3,1]<-c("Modell 4")
results[4,1]<-c("Modell 5")

#results[2,2]<-lc2$llik
results[2,2]<-lc3$llik
results[3,2]<-lc4$llik
results[4,2]<-lc5$llik

#results[2,3]<-lc2$resid.df
results[2,3]<-lc3$resid.df
results[3,3]<-lc4$resid.df
results[4,3]<-lc5$resid.df

#results[2,4]<-lc2$bic
results[2,4]<-lc3$bic
results[3,4]<-lc4$bic
results[4,4]<-lc5$bic

#results[2,5]<-(-2*lc2$llik) + ((log((lc2$N + 2)/24)) * lc2$npar) #abic
results[2,5]<-(-2*lc3$llik) + ((log((lc3$N + 2)/24)) * lc3$npar)
results[3,5]<-(-2*lc4$llik) + ((log((lc4$N + 2)/24)) * lc4$npar)
results[4,5]<-(-2*lc5$llik) + ((log((lc5$N + 2)/24)) * lc5$npar)

#results[2,6]<- (-2*lc2$llik) + lc2$npar * (1 + log(lc2$N)) #caic
results[2,6]<- (-2*lc3$llik) + lc3$npar * (1 + log(lc3$N))
results[3,6]<- (-2*lc4$llik) + lc4$npar * (1 + log(lc4$N))
results[4,6]<- (-2*lc5$llik) + lc5$npar * (1 + log(lc5$N))

#results[2,7]<-lc2$Gsq
results[2,7]<-lc3$Gsq
results[3,7]<-lc4$Gsq
results[4,7]<-lc5$Gsq

write.table(results,file="/Users/yanting/health/project/results_d0.csv", sep=",",row.names=F,fileEncoding='big5')
