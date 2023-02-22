#install.packages("dplyr")
#Import packages.
library(rvest)
library(dplyr)

#Getting Web Sites content.
path="E:\\Rprogram\\tiu.html"
webpage=read_html(path)

#select all school names.
school_names = webpage %>% html_nodes(".single-content a") %>% html_text()
#Select All School Descriptions.
school_desc = webpage %>% html_nodes(".single-content p") %>% html_text()

#Storing the School name and School Description into a data frare.
school_dframe = data.frame(school_names,school_desc)


setwd("./DataScience")
#Storing the data frame data into csv file.
write.csv(school_dframe , "School_description.csv")
print("School Names and their description are writen successfuly in csv file: \n")
data = read.csv("School_description.csv")
print(data)
