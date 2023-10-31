# fib(n) = fib(n - 1) + fib(n - 2), n >= 3; fib(1) = fib(2) = 1
fib <- function(n) {
  # if n is less than 2, return n
  if (n < 2) {
    return(n)
  }

  # otherwise, return the sum of the previous two numbers
  return(fib(n - 1) + fib(n - 2))
}

f10 <- fib(10)
print(paste("fib(10) =", f10))

f15 <- fib(15)
print(paste("fib(15) =", f15))