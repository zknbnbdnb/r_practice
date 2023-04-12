library("ggplot2")
library("dplyr")
library("data.table")
library("reshape2")

getwd()
data = read.csv("lollypop-data.csv")

data$City = factor(data$City, levels = data$City[order(data$Male)])

data_y = melt(data,id.vars = "City") #长数据换成宽数据更容易画图

yalin = ggplot(data_y, aes(x = value,  y = City)) + geom_line(aes(group = City)) + 
  geom_point(aes(color = variable, size = value))

yalin

data = read.csv("lollypop-data.csv")

data$Sum = rowSums(data[, 2: 3])
data$City = factor(data$City, levels = data$City[order(data$Sum)])

bbt = ggplot(data, aes(Sum, City)) + geom_segment(aes(x = 0, xend = Sum, y = City, 
                                                      yend = City)) + geom_point()

bbt
                                                    