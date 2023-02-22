#import package.
library(psych)

#Health centre recorded.
Data=data.frame(Instructor=c('A','B','C','D','E','F','G','H','I','J','K','L','M','N','O'), Grade=c(55,54,56,49,48,47,48,49,52,53,54,56,59,44,49),weight=c(44,45,46,48,39,47, 49,48,47,44,55,52,43,47,51),Calories=c(1234,2345,2133,3456,1456,1899,1478,1879,1788,1765,1543,1432,1447,1677,1588),Sodium=c(1567,1478,1678,1389,1567,1267,1654,1632,1479,1577,1699,1788,1688,1489,1567),Score=c(66,69,78,65,66,63,62,67,68,72,79,81,82,78,79))
Data$Instructor = factor(Data$Instructor,levels=unique(Data$Instructor))
print(Data)

#Showes only first and last four rows of data together.
headTail(Data)

#Shows the string form of data on all the attributes of the data frame.
str(Data)

#Shows all Min,1st Qut,Meadian,Mean,3rd Qut,Max. 
summary(Data) 

#The pairs function can plot multiple numeric or integer variables on a single plot to look for correlations among the variables.
pairs(data=Data,~Grade + weight + Calories + Sodium + Score)

#Shows the correlations among the various numeric data items.
cor(Data[2:6])

#shows the relationship of Grade with other attributes.
cor(Data$Grade,Data[3:6])
