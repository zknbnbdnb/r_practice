library("Rglpk")
library("languageserver")
obj <- c(2, 4, 3)
mat <- matrix(c(3, 2, 1, 4, 1, 3, 2, 2, 2), nrow = 3)
dir <- c("<=", "<=", "<=")
rhs <- c(60, 40, 80)
max <- TRUE
types <- c("I", "I", "I")

print(Rglpk_solve_LP(obj, mat, dir, rhs, types = types, max = max))

h <- c(1, 2, 3, 4, 5, 6)
m <- c("A", "B", "C", "D", "E", "F")
barplot(h,
    names.arg = M, xlab = "X", ylab = "Y",
    col = "#00cec9", main = "Chart", border = "#fdcb6e"
)
