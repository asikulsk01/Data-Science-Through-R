#Installing packages.
install.packages("DescTools")
install.packages("psych")
install.packages("modeest")

#Importing packages.
library(DescTools)
library(psychi)
library(modeest)

#Defining data frames.
x <- c(10,20,25,28,30,35,40)
y <- c(10.5,12.4,18.6,25.2,28.9,35.6)

#Calculate means and medians.
mean(x)
mean(y)
median(x)
median(y)

#Function to get mode of x.
getmode <- function(x) {
   uniqv <- unique(x)
   uniqv[which.max(tabulate(match(x, uniqv)))]
}

#Store the result into a variable.
result <- getmode(x)
print(result)

#Function to get mode of y.
getmode <- function(y) {
   uniqv <- unique(y)
   uniqv[which.max(tabulate(match(y, uniqv)))]
}
result <- getmode(y)
print(result)