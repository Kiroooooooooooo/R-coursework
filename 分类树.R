library(rpart)      # 决策树算法实现
library(rpart.plot) # 图视化决策树
#build the initial tree
tree <- rpart(survived~pclass+sex+age, data=ptitanic, control=rpart.control(cp=.0001))

#view results
printcp(tree)


# 识别最佳CP值
best <- tree$cptable[which.min(tree$cptable[,"xerror"]),"CP"]

# 基于最佳cp值进行剪枝
pruned_tree <- prune(tree, cp=best)

# 画出剪枝后的模型树
prp(pruned_tree,
    faclen=0,   # 使用完整标签名称
    extra=1,    # 显示每个终端节点数量
    roundint=F, # 输出数值不近似为整数
    digits=5)   # 输出显示小数位数5位 
