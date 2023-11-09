# set cwd
setwd("/Users/mike/math3550/project3")

# task 1
csv <- read.csv("./Advertising.csv", header = TRUE)
df <- data.frame(csv)

# task 2
df$X <- NULL
df <- na.omit(df)

# task 3
data_summary <- summary(df)
print("Data Summary:")
print(data_summary)

par(mfrow = c(2,2))
hist(df$TV, main = "TV", xlab = "TV")
hist(df$radio, main = "Radio", xlab = "Radio")
hist(df$newspaper, main = "Newspaper", xlab = "Newspaper")
hist(df$sales, main = "Sales", xlab = "Sales")

first_ten <- head(df, n = 10)
print("First Ten Rows:")
print(first_ten)

# task 4
library(caret)
set.seed(0)

partition <- createDataPartition(df$sales, p = .8, list = FALSE)
training <- df[partition,]
testing <- df[-partition,]

# task 5
model1 <- lm(sales ~ TV + radio + newspaper, data = training)
model2 <- lm(sales ~ TV + radio + TV*radio, data = training)
model3 <- lm(sales ~ TV + radio + TV*radio + I(TV^2), data = training)

# task 6
# run predictions
model1_predictions <- predict(model1, testing)
model2_predictions <- predict(model2, testing)
model3_predictions <- predict(model3, testing)

# compute rmse
model1_rmse <- sqrt(mean((testing$sales - model1_predictions)^2))
model2_rmse <- sqrt(mean((testing$sales - model2_predictions)^2))
model3_rmse <- sqrt(mean((testing$sales - model3_predictions)^2))

# find min and report which one is the best fit
min_rmse <- min(model1_rmse, model2_rmse, model3_rmse)
if (min_rmse == model1_rmse) {
  print("Model 1 has the best prediction accuracy on the testing dataset.")
} else if (min_rmse == model2_rmse) {
  print("Model 2 has the best prediction accuracy on the testing dataset.")
} else {
  print("Model 3 has the best prediction accuracy on the testing dataset.")
}