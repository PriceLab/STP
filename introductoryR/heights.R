tbl <- read.table("heights.tsv", sep = "\t", header = TRUE)
tbl

h2y <- tbl$twoYears
h2y

ha <- tbl$adult
ha

cor(ha, h2y)
cov(ha, h2y)
plot(h2y, ha)

plot(h2y, ha, main = "Predicting adult height from youth",
     xlab = "Height at 2 years of age", ylab = "Height at adulthood", pch = 16)

#if i was 37" at 2 years, what is my projected adult height
#how confident are you?

model <- lm(ha ~ h2y)
summary(model)
abline(model)

test = data.frame(h2y=37)
predict(model, newdata = test)

predict(model, newdata = test, interval = "pred")
#pred is conf int for single observation

predict(model, newdata = test, interval = "confidence")
#confidence is conf int for mean of all observations

