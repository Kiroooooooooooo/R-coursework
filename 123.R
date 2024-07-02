#导入鸢尾花数据集
dat<-read.csv(file="C:/Users/MarsR/Desktop/R语言/实验二/iris.csv",header=TRUE)
dat#查看数据
#导入画图的各种包
library(ggplot2)
library(gridExtra)
library(GGally)
library(paletteer)
library(RColorBrewer)
#对不同种类的鸢尾花用不同颜色绘制散点图
ggplot(data=iris, aes(x=Sepal.Length, y=Sepal.Width, colour=Species, shape=Species)) + geom_point()+scale_color_paletteer_d("ggsci::nrc_npg")
ggplot(data=iris, aes(x=Petal.Length, y=Petal.Width, colour=Species, shape=Species)) + geom_point()+scale_color_paletteer_d("ggsci::nrc_npg")
#对不同种类的鸢尾花的petal.length绘制箱线图
ggplot(iris, aes(Species, Petal.Length, fill=Species)) + geom_boxplot()
ggplot(iris, aes(Species, Sepal.Length, fill=Species)) + geom_boxplot()
ggplot(iris, aes(Species, Sepal.Width, fill=Species)) + geom_boxplot()
ggplot(iris, aes(Species, Petal.Width, fill=Species)) + geom_boxplot()
#对不同种类的鸢尾花用不同颜色绘制饼状图
pie(table(iris$Species))
#对不同种类的鸢尾花用不同颜色绘制Density密度图
plot(density(iris$Petal.Length))
hist(iris$Petal.Length,prob=T)
lines(density(iris$Petal.Length),lwd=4)

#可视化样本之间的相关性
ggpairs(data = iris[1:4],title = "数据相关性")

#导入包
library(class)
ind<-sample(1:150,50)#准备工作

#构建测试集
iris_test<-dat[ind,1:4]
test_label<-dat[ind,5]
#构建训练集
iris_train<-dat[-ind,1:4]
train_label<-dat[-ind,5]
#利用knn进行训练
iris_pred<-knn(train=iris_train,test=iris_test,cl=train_label,k=3)
#查看多分类问题的混淆矩阵
table(test_label,iris_pred)

