library('datasets')
# 1
data('iris')
df.iris<-iris
x<-split(df.iris,df.iris$Species)
x.virginica<-x$virginica
sapply(x.virginica[,1:4],mean)

# 2
y<-apply(iris[, 1:4], 2, mean)
is.vector(y)

# 3
data(mtcars)
tapply(mtcars$mpg, mtcars$cyl, mean)

# 4
z<-tapply(mtcars$hp, mtcars$cyl, mean)
z[3]-z[1]
