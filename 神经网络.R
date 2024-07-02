# 加载库
library(neuralnet)

# 创建示例数据
tScore <- c(20,10,30,20,80,30)
cScore <- c(90,20,40,50,50,80)
topStu <- c(1,0,0,0,1,1)

# 组合为数据框
df <- data.frame(tScore, cScore, topStu)

# 拟合神经网络模型
nn <- neuralnet(topStu ~ tScore + cScore, data=df, hidden=3, act.fct = "logistic", linear.output = FALSE)

# 画出神经网络图
plot(nn)

# 创建测试数据
tScore <- c(30, 40, 85)
cScore <- c(85, 50, 40)
test <- data.frame(tScore, cScore)

## 使用神经网络模型预测
Predict <- compute(nn, test)
Predict$net.result

# 转换输出概率为标签，阈值设置为0.5
prob <- Predict$net.result
pred <- ifelse(prob>0.5, 1, 0)
pred
