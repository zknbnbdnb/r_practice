

# 安装ggplot2
# install.packages("ggplot2")

# 载入ggplot2
library("ggplot2")


# 清除所有变量
rm(list=ls())

mpg

str(mpg)

data <- mpg

##################### ggplot() #################################################################

ggplot(mpg, aes(x = displ, y = hwy))



ggplot(mpg, aes(x = displ, y = hwy)) + 
geom_point()
#ggplot(mpg, aes(x = displ, y = cty)) + geom_point()

# x y 可以省略
# + 后可以换行
ggplot(mpg, aes(displ, hwy)) + 
geom_point()

################################################################################################




#################### color, shape, size ######################################################

# aes(displ, hwy, colour = class) 
# aes(displ, hwy, size = cyl)
# aes(displ, hwy, shape = drv)





ggplot(mpg, aes(displ, hwy, size = cyl) ) + 
  geom_point()


ggplot(mpg, aes(displ, hwy, shape = drv) ) + 
  geom_point()

ggplot(mpg, aes(displ, hwy, colour = class) ) + 
  geom_point()



ggplot(mpg, aes(displ, hwy)) + geom_point(colour = "blue")



################################################################################################



#################### facet ###############################################################
ggplot(mpg, aes(displ, hwy)) + geom_point() + facet_wrap(~class)

ggplot(mpg, aes(displ, hwy, colour = class) ) + 
  geom_point()
ggplot(mpg, aes(displ, hwy,colour = class)) + geom_point() + facet_wrap(~class)
################################################################################################




#########################拟合###############################################################


ggplot(mpg, aes(displ, hwy)) + 
geom_point() + 
geom_smooth() 




ggplot(mpg, aes(displ, hwy)) + 
  geom_point() + 
  geom_smooth(se=FALSE) 


ggplot(mpg, aes(displ, hwy)) + 
  geom_point() + 
  geom_smooth(span = 0.2) 


ggplot(mpg, aes(displ, hwy)) + 
  geom_point() + 
  geom_smooth(span = 1) 




ggplot(mpg, aes(displ, hwy)) + 
  geom_point() + 
  geom_smooth(method = "lm")

################################################################################################



########################Boxplots and Jittered Points ###########################################

ggplot(mpg, aes(drv, hwy)) + geom_point() 


ggplot(mpg, aes(drv, hwy)) + geom_jitter() 

ggplot(mpg, aes(drv, hwy)) + geom_boxplot() 

ggplot(mpg, aes(drv, hwy), color = class) + geom_violin() 


################################################################################################






########################## Histograms and Frequency Polygons ###############################


ggplot(mpg, aes(hwy)) + geom_histogram()

ggplot(mpg, aes(hwy)) + geom_freqpoly()


ggplot(mpg, aes(hwy)) + geom_freqpoly(binwidth = 2.5) 
ggplot(mpg, aes(hwy)) + geom_freqpoly(binwidth = 1) 


sort(mpg$hwy)


ggplot(mpg, aes(displ, colour = drv)) + geom_freqpoly(binwidth = 0.5) 


ggplot(mpg, aes(displ, fill = drv)) + geom_histogram(binwidth = 0.5) + facet_wrap(~drv, ncol = 1)

ggplot(mpg, aes(displ, fill = drv)) + geom_histogram(binwidth = 0.5) + facet_wrap(~drv, nrow = 1)

################################################################################################







########################## Bar chart ############################################################


ggplot(mpg, aes(manufacturer)) + geom_bar()




drugs <- data.frame(drug = c(" drug1", " drug2", " drug3"), 
                    effect = c(14.2, 19.7, 16.1) ) 

ggplot(drugs, aes(drug, effect)) + geom_bar() 


ggplot(drugs, aes(drug, effect)) + geom_bar(stat = "identity") 


################################################################################################





################################ Time Series with Line and Path Plots ################################

data.file <- "D:/R_code/disanzhou/data_tab.txt"
# COVID.2019 <- read.delim(data.file, header = T, stringsAsFactors = T)

COVID.2019 <- read.delim(data.file, header = T, stringsAsFactors = T, encoding = "UTF-8")

# 日期	
# 累计确诊
# 现有确诊（含重症）
# 现有疑似
# 现有重症
# 累计死亡
# 累计治愈
# 累计确诊+现有疑似
# 新增确诊
# 新增疑似
# 新增(疑似+确诊)
# 死亡/确诊
# 观察中
# 更新时间
# 备注

# rename the collumn names
colnames(COVID.2019) <- c(
  "Date",
  "Cumulative.confirmed",
  "Current.diagnosis.including.severe.disease",
  "Existing.suspected",
  "The.existing.severe",
  "The.cumulative.death",
  "The.cumulative.cure",
  "Cumulative.confirmed.and.suspected",
  "The.new.diagnosis",
  "New.suspected",
  "New.suspected.and.confirmed)",
  "Death.and.diagnosis",
  "Observation",
  "Update.Date",
  "note"
)


ggplot(COVID.2019, aes(as.Date(Date, format="%d/%m/%Y"), Cumulative.confirmed)) + geom_line()





ggplot(COVID.2019, aes(as.Date(Date, format = "%d/%m/%Y"), The.new.diagnosis)) + geom_line()





################################################################################################






ggplot(mpg,aes(xlab(displ),ylab(hwy)))

ggplot(mpg, aes(displ, hwy, colour = class) ) +
  geom_point() +
  xlab(1)+
  ylab(2)

#
ggplot(mpg, aes(displ, hwy)) + geom_point(colour = "blue") + xlab("A") + ylab("B")


# ggplot(mpg, aes(displ, hwy)) + 
#   geom_point() + 
#   geom_smooth(span = 0.2) +
#   xlab(1) +
#   ylab(2)

# ggplot(mpg,aes(displ,hwy,xlab="驱动",ylab="公路"))

ggplot(mpg,aes(displ,hwy,xlab="aa",ylab="bb"))+geom_point()

# ggplot(mpg, aes(displ, hwy)) + geom_point(colour = "blue")+xlab("D")+ylab("W")


ggplot(mpg, aes(displ, hwy)) + 
  geom_point() + 
  xlab("发动机排量") + ylab("油耗")


ggplot(mpg,aes(hwy,drv,xlab="hwy", ylab="drv"))+geom_boxplot()




