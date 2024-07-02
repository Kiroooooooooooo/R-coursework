a<-(1:120)
dim1<-c("row1","row2","row3")
dim2<-c("col1","col2","col3","col4","col5","col6","col7","col8","col9","col10")
dim3<-c("high1","high2","high3","high4")
a=array(a,c(3,10,4),dimnames = list(dim1,dim2,dim3))
is.array(a)

a



MatA<-(1:42)
myMat<-matrix(MatA,nrow = 6,ncol = 7,byrow = FALSE)
is.matrix(myMat)

str(myMat)

myMat[1, ]

print(myMat)



myMatb<-matrix(nrow=5,ncol=2)
lista<-c(1:10)
listb<-myMatb
listb[ ,1]=seq(from=6,to=30,by=6)
listb[ ,2]=seq(from=20,to=0,by=-5)
listc<-array(1:20,c(2,5,2))
myList<-list(L1=lista,L2=listb,L3=listc)
names(myList)

is.list(myList)

str(myList)




library("XML")
library("RODBC")

sr1<-'http://cba.sports.sina.com.cn/cba/stats/teamrank/'
data1<-readHTMLTable(sr1)
print(data1)

is.list(data1)

is.array(data1)

grades<-data1[[1]]$胜
grades<-grades[-1]
grades<-as.integer(grades)
grades

bubblesort=function(grades){
  n=length(grades)
  for(i in 1:(n-1)){
    for(j in (i+1):n){
      if(grades[i]<=grades[j]){
        t<-grades[i]
        grades[i]<-grades[j]
        grades[j]<-t
      }
    }
  }
  return(grades)
}
bubblesort(grades)



