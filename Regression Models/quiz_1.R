##1
x <- c(0.18, -1.54, 0.42, 0.95)
w <- c(2, 1, 3, 1)
mu<-0.1471
mu<-0.0025
mu<-0.300
mu<-1.077
sum(w*(x-mu)^2)

##2
x <- c(0.8, 0.47, 0.51, 0.73, 0.36, 0.58, 0.57, 0.85, 0.44, 0.42)
y <- c(1.39, 0.72, 1.55, 0.48, 1.19, -1.59, 1.23, -0.65, 1.49, 0.05)
mod<-lm(y~x)
mod

##3
data(mtcars)
mod=lm(mpg~wt,data = mtcars)
mod

##6
x <- c(8.58, 10.46, 9.01, 9.64, 8.86)
mu<-mean(x)
sd<-sd(x)
xn<-(x-mu)/sd
xn

##7
x <- c(0.8, 0.47, 0.51, 0.73, 0.36, 0.58, 0.57, 0.85, 0.44, 0.42)
y <- c(1.39, 0.72, 1.55, 0.48, 1.19, -1.59, 1.23, -0.65, 1.49, 0.05)
mod<-lm(y~x)
mod

##9
x <- c(0.8, 0.47, 0.51, 0.73, 0.36, 0.58, 0.57, 0.85, 0.44, 0.42)
mu<-0.36
mu<-0.8
mu<-0.44
mu<-0.573
sum((x-mu)^2)