Maxlife<-function(data,treatments,lifespan,percentile=0.90,p_adjust ="BH"){
  library(quantreg)
  library(exact2x2)
  library(utils)
  print("Loading packages")

  aa<-with(data,get(treatments))
  if(!is.factor(aa)){stop("Only factors allowed in treatments variable")}
  meth<-c("holm", "hochberg", "hommel", "bonferroni", "BH", "BY",
          "fdr", "none")
  if(all(!meth%in% p_adjust)){stop("P_adjust not valid. Only holm, hochberg, hommel, bonferroni, BH, BY, fdr, or none")}
  treatm<-with(data,levels(get(treatments)))
  CC<-combn(treatm,2)
  len<-dim(CC)[2]
  A<-paste0("P",percentile*100,"th_lifespan_both", sep="")
  tableA<-data.frame(Comparisson =rep(0,len),
                     B = rep(0,len),
                     Mice_above_Treatment_1 = rep(0,len),
                     Mice_bellow_Treatment_1 = rep(0,len),
                     Mice_above_Treatment_2 = rep(0,len),
                     Mice_bellow_Treatment_2 = rep(0,len),
                     Prop_Treatment_1=rep(0,len),
                     Prop_Treatment_2=rep(0,len),
                     pvalue=rep(0,len),
                     p_adj=rep(0,len))
  pb <- txtProgressBar(0, length(len), style = 3)
  colnames(tableA)[2]<-A
  print("Assigning groups")
  for (i in 1:len){
    dfset<-data[data[,treatments]==CC[1,i]| data[,treatments]==CC[2,i],]
    df1<-dfset[dfset[,treatments]==CC[1,i],]
    df2<-dfset[dfset[,treatments]==CC[2,i],]
    lfspan<-with(dfset,get(lifespan))
    AAA<-rq(get(lifespan) ~ 1, tau=percentile, data = dfset)
    threshold<-AAA$coefficients[1]
    tableA[i,1]<-paste0(CC[1,i],"__vs__", CC[2,i],sep="")
    tableA[i,2]<- threshold
    tableA[i,3]<-table(df1[,lifespan]>=threshold)[2]
    tableA[i,4]<-table(df1[,lifespan]>=threshold)[1]
    tableA[i,5]<-table(df2[,lifespan]>=threshold)[2]
    tableA[i,6]<-table(df2[,lifespan]>=threshold)[1]
    tableA[i,7]<-round(tableA[i,3]/dim(df1)[1],digit=2)
    tableA[i,8]<-round(tableA[i,5]/dim(df2)[1],digit=2)
    A1<-ifelse(is.na(tableA[i,3]),0.01,tableA[i,3])
    A2<-ifelse(is.na(tableA[i,5]),0.01,tableA[i,5])
    xxx<-boschloo(A1,dim(df1)[1],A2,dim(df2)[1])
    tableA[i,9]<-round(xxx$p.value,digit=4)
    setTxtProgressBar(pb, i)
  }
  tableA[is.na(tableA)] = 0
  tableA$p_adj<-round(p.adjust(tableA$pvalue, method = p_adjust),digit=4)
  colnames(tableA)[10]<-paste0("p_adj_",p_adjust)
  close(pb)
  print("Formatting dataframe")
  return(tableA)
}
