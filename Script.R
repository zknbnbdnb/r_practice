

# 安装ggplot2
# install.packages("ggplot2")

# 载入ggplot2
library("ggplot2")


# 清除所有变量
rm(list=ls())

data_file = "D:/R_code/disanzhou/blood.data.txt"
blood_data = read.delim(data_file, header = T, stringsAsFactors = T, encoding = "UTF-8")
blood_data$sex[which(blood_data$sex == "1")] = "male"
blood_data$sex[which(blood_data$sex == "2")] = "female"

# 分析红细胞数量与年龄和性别的关系

ggplot(blood_data, aes(age, red.blood.cell.count, shape = as.factor(sex), colour = sex)) + 
  geom_point() + geom_smooth()

ggplot(blood_data, aes(age, red.blood.cell.count)) + 
  geom_point() + geom_smooth() + facet_wrap(~sex)

ggplot(blood_data, aes(age, red.blood.cell.count)) + 
  geom_boxplot() + facet_wrap(~sex)

ggplot(blood_data, aes(red.blood.cell.count)) + 
  geom_freqpoly(binwidth = 0.5) + facet_wrap(~age)

ggplot(blood_data, aes(red.blood.cell.count, colour = sex)) + 
  geom_freqpoly(binwidth = 1)

ggplot(blood_data, aes(red.blood.cell.count)) + geom_bar()

# 分析血红蛋白与年龄和性别的关系

ggplot(blood_data, aes(age, hemoglobin, shape = as.factor(sex), colour = sex)) + 
  geom_point() + geom_smooth()

ggplot(blood_data, aes(age, hemoglobin)) +  
  geom_point() + geom_smooth() + facet_wrap(~sex)

ggplot(blood_data, aes(age, hemoglobin)) + 
  geom_boxplot() + facet_wrap(~sex)

ggplot(blood_data, aes(hemoglobin)) + 
  geom_freqpoly(binwidth = 0.5) + facet_wrap(~age)

ggplot(blood_data, aes(hemoglobin, colour = sex)) + 
  geom_freqpoly(binwidth = 1)

ggplot(blood_data, aes(hemoglobin)) + geom_bar()

# 分析血红蛋白和红细胞数量的关系，男女差异和年龄差异

ggplot(blood_data, aes(hemoglobin, red.blood.cell.count, shape = sex, colour = sex)) +
  geom_point() + geom_smooth()

ggplot(blood_data, aes(hemoglobin, red.blood.cell.count)) + 
  geom_boxplot() + facet_wrap(~sex)

ggplot(blood_data, aes(hemoglobin, red.blood.cell.count, color = sex)) + 
  geom_violin() + facet_wrap(~age)

ggplot(blood_data, aes(red.blood.cell.count, hemoglobin)) + geom_bin_2d()

# 分析血细胞比容与年龄和性别的关系

ggplot(blood_data, aes(age, hematocrit, shape = as.factor(sex), colour = sex)) + 
  geom_point() + geom_smooth()

ggplot(blood_data, aes(age, hematocrit)) +  
  geom_point() + geom_smooth() + facet_wrap(~sex)

ggplot(blood_data, aes(age, hematocrit)) + 
  geom_boxplot() + facet_wrap(~sex)

ggplot(blood_data, aes(hematocrit)) + 
  geom_freqpoly(binwidth = 1) + facet_wrap(~age)

ggplot(blood_data, aes(hematocrit, colour = sex)) + 
  geom_freqpoly(binwidth = 1)

ggplot(blood_data, aes(hematocrit)) + geom_bar()

# 分析血清铁与年龄和性别的关系

ggplot(blood_data, aes(age, serum.iron, shape = as.factor(sex), colour = sex)) + 
  geom_point() + geom_smooth()

ggplot(blood_data, aes(age, serum.iron)) +  
  geom_point() + geom_smooth() + facet_wrap(~sex)

ggplot(blood_data, aes(age, serum.iron)) + 
  geom_boxplot() + facet_wrap(~sex)

ggplot(blood_data, aes(serum.iron)) + 
  geom_freqpoly(binwidth = 0.5) + facet_wrap(~age)

ggplot(blood_data, aes(serum.iron, colour = sex)) + 
  geom_freqpoly(binwidth = 1)

ggplot(blood_data, aes(serum.iron)) + geom_bar()

# It's your turn now!








