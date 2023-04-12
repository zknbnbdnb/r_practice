

# 安装ggplot2
# install.packages("ggplot2")

# 载入ggplot2
library("ggplot2")


# 清除所有变量
rm(list=ls())


########## Read data ############################################################

# getwd returns an absolute filepath representing the current working directory
path <- getwd()

path <- "/Users/chenliang/Documents/写的材料/汕头大学-教学/0-数据可视化/2021PPT与教案/4-PPT/第4周-第5-6节课-20120316/scripts"

# space.file <- paste(path,"/","data_space.txt", sep=" ")
# tab.file <- paste(path,"/","data_tab.txt", sep="\t")
# csv.file <- paste(path,"/","data.csv", sep=",")


space.file <- paste(path,"/","data_space.txt", sep="")
tab.file <- paste(path,"/","data_tab.txt", sep="")
csv.file <- paste(path,"/","data.csv", sep="")

space.data <- read.delim(space.file, sep = " ", header = T)

tab.data <- read.delim(tab.file, sep = "\t", header = TRUE)
tab.data <- read.delim(tab.file, sep = "\t", header = F)
csv.data <- read.delim(csv.file, sep = ",", header = T)

colnames(csv.data) <- c("patientID", "Age","Diabetes","Status")

str(csv.data)

# 参数的顺序可以变换
csv.data <- read.delim(csv.file,  header = T, sep = ",", stringsAsFactors = T)

csv.data <- read.delim(csv.file,  sep = ",", stringsAsFactors = T, header = T)

csv.data <- read.delim( sep = ",", csv.file,  stringsAsFactors = T, header = T)


str(csv.data)
########## Read data end ############################################################




v <- c( 2,5.5,6)
t <- c(8, 3, 4)




