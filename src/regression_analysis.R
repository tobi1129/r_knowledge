# 仮想データの読み込み
amount1.data <- read.csv("../data/amount1.csv")

# 上位6件を表示
head(amount1.data)

# 数値要約
summary(amount1.data)

# 散布図の描画
library(ggplot2)
ggplot(amount1.data, aes(x=invest, y=amount)) +
  geom_point() +
  theme_bw(16)

# 線形回帰モデルの構築と概要
amount1.lm1 <- lm(amount~invest, data=amount1.data)
# ~の意味は[目的変数]~[説明変数]
# こうも書ける
amount1.lm1 <- lm(amount~., data=amount1.data)
# [目的変数]~.,data=[目的変数と説明変数が格納されたデータフレーム]
summary(amount1.lm1)

## 残差のplot
plot(amount1.lm1, which = 1)

# 逓減型回帰モデルで可視化
## 参考 説明変数の対数を取る理由
## https://atarimae.biz/archives/13161
## 綺麗な比例関係とする(直線的)か、弾力性を一定にして評価するかの違いらしい
ggplot(amount1.data, aes(x = invest, y = amount)) +
  geom_point() +
  theme_bw(16) +
  geom_smooth(method = "lm", formula = y ~ log(x))

# 逓減型回帰モデルの構築
amount1.lm2 <- lm(amount~log(invest), data=amount1.data)
summary(amount1.lm2)

## 残差のplot
plot(amount1.lm2, which = 1)
