x <- 1:100 
y <- 0.029*x + rnorm(100)
pdf("sample.pdf", 7, 5)
plot(x, y, pch=19, col=rgb(0.5, 0.5, 0.5, 0.5), cex=1.5)