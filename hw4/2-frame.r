# init the data frame
x <- 1:10
y <- c("M", "F", "F", "M", "F", "M", "M", "M", "F", "M")
z <- c(23, 57, 39, 20, 10, 5, 8, 1, 24, 40)
df <- data.frame(x, y, z)

# set the random seed and sample 80% of the rows
set.seed(0)
ind <- sample(1:nrow(df), 0.8 * nrow(df))

# generate the training set by indexing the data frame
train_df <- df[ind, ]
test_df <- df[-ind, ]