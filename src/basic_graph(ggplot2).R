# CSV読み込み
body.data <- read.csv("../data/body_sample.csv", header = T, stringsAsFactors = F)
head(body.data)

# いろんな方法で列選択
body.data[, 2]
body.data[, c(1,3)]
body.data[, "weight"]
body.data$weight
body.data[c("height", "weight")]

# 抽出条件を指定
body.data[body.data$gender=="F",]

# ソート
body.data[order(body.data$height),]
body.data[order(body.data$height, decreasing = T),]

# 数値要約
summary(body.data)

# 標準偏差
sd(body.data$height)
# 分散
var(body.data$weight)

# ヒストグラム
library(ggplot2)
ggplot(body.data, aes(x=height)) +
  geom_histogram() +
  theme_bw(16) +
  ylab("count")

# ヒストグラム(性別で色分け)
ggplot(body.data, aes(x=height, fill = gender)) +
  geom_histogram() +
  theme_bw(16) +
  ylab("count")

# 箱ひげ図
ggplot(body.data, aes(x=gender, y=height, fill=gender)) +
  geom_boxplot() +
  theme_bw(16)

# 散布図
ggplot(body.data, aes(x=height, y=weight)) +
  geom_point() +
  theme_bw(16)

# 散布図(回帰直線)
ggplot(body.data, aes(x=height, y=weight)) +
  geom_point() +
  theme_bw(16) +
  geom_smooth(method = "lm")

# 散布図(男女で色分け)
ggplot(body.data, aes(x=height, y=weight, col = gender)) +
  geom_point() +
  theme_bw(16) +
  geom_smooth(method = "lm")

# 相関
## 全体
cor(body.data$height, body.data$weight)

## 男性のみ
body.data.m <- body.data[body.data$gender == "M",]
cor(body.data.m$height, body.data.m$weight)

## 女性のみ
body.data.f <- body.data[body.data$gender == "F",]
cor(body.data.f$height, body.data.f$weight)
