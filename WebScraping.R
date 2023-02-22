#install.packages("dplyr")

#Import packages.
library(rvest)
library(dplyr)
getwd()

#Getting Web Sites content.
url = "https://technoindiauniversity.ac.in/"
webpage = read_html(url)

#select all school names.
school_names = webpage %>% html_nodes(".single-content a") %>% html_text()
#Select All School Descriptions.
school_desc = webpage %>% html_nodes(".single-content p") %>% html_text()

#Storing the School name and School Description into a data frame.
school_dframe = data.frame(school_names,school_desc)

#setwd("./DataScience")
#Storing the data frame data into csv file.
write.csv(school_dframe , "School_description_Rlab.csv")
print("School Names and their description are writen successfuly in csv file: \n")

#Reading the csv file data into r console.
data = read.csv("School_description_Rlab.csv")
print(data)
