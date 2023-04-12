#install.packages("networkD3")
library("networkD3")

# 网络数据和节点属性数据以类似格式存入文本文件即可
# 网络文件有3列组成，第一列为
network <- "Src;Target;Value
Bioinfo;Biology;4
Bioinfo;Math;4
Bioinfo;Program;4
Bioinfo;NGS;4
Program;Linux;1
Program;Python;1
Program;R;1
NGS;RNAseq;1
NGS;ChIPseq;3
NGS;16Sseq;3
NGS;Metagenome;1
NGS;SingeCellSeq;3
NGS;DNAmethylseq;1
NGS;lncRNA;3
NGS;Exomeseq;1
NGS;TCGA;1
"

attribute <- "name;group;size
Bioinfo;Class;4
Biology;Class;4
Math;Class;4
Program;Class;4
NGS;Class;4
Linux;On;2
Python;Off;2
R;Off;2
RNAseq;Off;1
ChIPseq;On;1
16Sseq;On;1
Metagenome;On;1
SingeCellSeq;InPrepare;1
DNAmethylseq;InPrepare;1
lncRNA;InPrepare;1
Exomeseq;InPrepare;1
TCGA;InPrepare;1"

network <- read.table(text=network, sep=";", header=T, row.names=NULL, quote="", comment="")

network <- network[,1:3]
colnames(network) <- c("Src", "Target", "Value")

nodes <- unique(c(network$Src, network$Target))
factor_list <- sort(unique(c(levels(network$Src), levels(network$Target))))
num_list <- 0:(length(factor_list)-1)
levels(network$Src) <- num_list[factor_list %in% levels(network$Src)]
levels(network$Target) <- num_list[factor_list %in% levels(network$Target)]

attribute <- read.table(text=attribute, sep=";", header=T, row.names=NULL, quote="", comment="")
attribute <- attribute[match(factor_list, attribute$name),]



forceNetwork(Links = network, Nodes = attribute,
             width = 600, height=400,
             Source = "Src", Target = "Target",
             Value = "Value", NodeID = "name",
             Group = "group", opacity = 1,
             legend = T, zoom = T, Nodesize = "size",
             bounded = T, opacityNoHover = 1, fontSize = 15)





#install.packages("networkD3")
library("networkD3")

data2 = read.csv('D:\R_code\a.csv')

simpleNetwork(data2,
              fontFamily = "宋体", 
              fontSize = 20,
              linkColour = "black",
              nodeColour = "blue",
              charge = -500,
              opacity = 0.9,
              zoom = TRUE)
