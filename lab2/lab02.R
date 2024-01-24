# length of a vector
x <- c(1,2,3)
print(sqrt(sum(x *x)))

# create a matix
X <- matrix(c(1,2,3,4,5,6), nrow = 2, ncol = 3)
X

Y <- matrix(c(1,2,3,4,5,6), nrow = 2)
Y

Z <- matrix(c(1,2,3,4,5,6), nrow = 2, byrow = TRUE)
Z # 横着排列

# Diagonal matrix
D <- diag(c(1,2,3))
D


E <- diag(c(1,2,3), nrow = 5)
E

# Identity matrix
I <- diag(1, nrow = 5)
I

# transpose
t(X)

# inverse
Y <- matrix(c(1,2,3,4), nrow = 2)
Y_inv <- solve(Y)
Y_inv
Y %*% Y_inv