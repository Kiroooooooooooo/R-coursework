library(lattice)
png(file = "C:\\Users\\MarsR\\Desktop\\R语言\\Iris数据集\\iris.png")
xyplot(Petal.Length ~ Petal.Width, data = iris, groups = Species, auto.key=list(corner=c(1,0))) 
dev.off()

library(e1071)

subdata <- iris[iris$Species != 'virginica',]#l两分类方法
subdata$Species <- factor(subdata$Species) #将类别变为有序因子
model1 <- svm(Species ~ Petal.Length + Petal.Width, data = subdata)#花瓣长度与宽度做分类 formula:label ~ x + y
png(file = "C:\\Users\\MarsR\\Desktop\\R语言\\Iris数据集\\svm1.png")
plot(model1, subdata, Petal.Length ~ Petal.Width)
dev.off()

summary(model1)

# kmeans对iris进行聚类分析 

iris2<-iris[,1:4]
iris.kmeans<-kmeans(iris2,3)
iris.kmeans

#用table函数查看分类结果情况
table(iris$Species,iris.kmeans$cluster)


#下边我们将分类以及中心点打印出来

plot(iris2$Sepal.Length,iris2$Sepal.Width,col=iris.kmeans$cluster,pch="*")

points(iris.kmeans$centers,pch="X",cex=1.5,col=4)

#-----使用K-mediods方法来进行聚类分析
#k-mediods中包含pam、clara、pamk三种算法，我们通过iris数据集来看看三者表现

install.packages("cluster")
library(cluster)

iris2.pam<-pam(iris2,3)
table(iris$Species,iris2.pam$clustering)

#             1  2  3
# setosa     50  0  0
# versicolor  0 48  2
# virginica   0 14 36

layout(matrix(c(1,2),1,2)) #每页显示两个图
plot(iris2.pam)
layout(matrix(1))

install.packages("fpc")
library(fpc)
iris2.pamk<-pamk(iris2)
table(iris2.pamk$pamobject$clustering,iris$Species)

iris2.clara<-clara(iris2,3)
table(iris$Species,iris2.clara$clustering)

#             1  2  3
# setosa     50  0  0
# versicolor  0 48  2
# virginica   0 13 37

layout(matrix(c(1,2),1,2)) #每页显示两个图
plot(iris2.clara)
layout(matrix(1))

layout(matrix(c(1,2),1,2)) #每页显示两个图
plot(iris2.pamk$pamobject)
layout(matrix(1))

#     setosa versicolor virginica
# 1     50          1         0
# 2      0         49        50

#通过上述分类结果可以看到，pam和calra算法分类结果基本类似，但是pamk将三类分为了两类。。
iris2.clara<-clara(iris2,3)
table(iris$Species,iris2.clara$clustering)

#             1  2  3
# setosa     50  0  0
# versicolor  0 48  2
# virginica   0 13 37

layout(matrix(c(1,2),1,2)) #每页显示两个图
plot(iris2.clara)
layout(matrix(1))

#---层次聚类 
dim(iris)#返回行列数

idx<-sample(1:dim(iris)[1],40)
iris3<-iris[idx,-5]
iris3
hc<-hclust(dist(iris3),method = "ave")  #注意hcluster里边传入的是dist返回值对象

plot(hc,hang=-1,labels=iris$Species[idx])  #这里的hang=-1使得树的节点在下方对齐
#将树分为3块
rect.hclust(hc,k=3)  
groups<-cutree(hc,k=3)   

#---基于密度的聚类分析
library(fpc)
iris2<-iris[-5]
ds<-dbscan(iris2,eps=0.42,MinPts = 5)
table(ds$cluster,iris$Species)

#打印出ds和iris2的聚类散点图
plot(ds,iris2)

#打印出iris第一列和第四列为坐标轴的聚类结果
plot(ds,iris2[,c(1,4)])

#另一个表示聚类结果的函数，plotcluster
plotcluster(iris2,ds$cluster)

