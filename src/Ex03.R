install.packages("corrplot")

library(corrplot)

CorrEuStockMarkets <- cor(EuStockMarkets)

corrplot(CorrEuStockMarkets, method="ellipse")


data("iris")

iris.pca <- prcomp(iris[,1:4])

iris.pca

summary(iris.pca)

iris.predict <- predict(iris.pca)

iris.predict[,1:2]

biplot(iris.pca)
