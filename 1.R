library("ggplot2")
library("dplyr")
library("mvstats")
data0 = data.frame(read.csv("健康的.csv", header = FALSE))

tt = as.matrix(data0)
names(data0) = tt[1,]
data0 = data0[-c(0:1),]

data0 = data0[ , c("scientific name ",
                   "mean relative abundance ")]
data0 = data0[order(data0$`scientific name `), ]
names(data0) = c("scientific.name",
                 "mean relative abundance")

data1 = data.frame(read.csv("帕金森.csv"))

data1 = data1[ , c("scientific.name",
                   "mean.relative.abundance.of.parkinson")]
data1 = data1[order(data1$scientific.name), ]

dt = merge(data0, data1)


for (i in seq_len(nrow(dt))) {
  dt$deta[i] = as.double(dt$`mean relative abundance`[i]) - as.double(dt$mean.relative.abundance.of.parkinson[i])
}

dt = dt[0: 100, ]

p = ggplot(data = dt, mapping = aes(
  x = scientific.name, y = dt$mean.relative.abundance.of.parkinson
))

p1 = ggplot(data = dt, mapping = aes(
  x = scientific.name, y = dt$`mean relative abundance`
))

p2 = ggplot(data = dt, mapping = aes(
  x = scientific.name, y = dt$deta
))

p + geom_col() + 
  labs(y = "MRA") +
  theme(
    axis.text.x = element_text(angle = 45, vjust = 1, hjust = 1)
  )

p1 + geom_col() + 
  labs(y = "MRA") +
  theme(
    axis.text.x = element_text(angle = 45, vjust = 1, hjust = 1)
  )

p2 + geom_col() + 
  labs(y = "MRA") +
  theme(
    axis.text.x = element_text(angle = 45, vjust = 1, hjust = 1)
  )
