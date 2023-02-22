####
x=c(.02,.07,.11,.15)
y=c(242,237,231,201)
lm(y~x)

Cars_model=lm(dist~speed,data=cars)
print(Cars_model)

summary(Cars_model)

####
predict(Cars_model,newdata=data.frame(speed=10))
predict(Cars_model,newdata=data.frame(speed=c(10,25,45)))
fitted(Cars_model)
predict(Cars_model)

plot(dist, speed, data = cars,xlab = "Speed (in Miles Per Hour)",ylab = "Stopping Distance (in Feet)",main = " Scatter plot of Stopping Distance vs Speed",pch = 20,cex = 2,col = "green")
abline(Cars_model, lwd = 3, col = "darkred")

