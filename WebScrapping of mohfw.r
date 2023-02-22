getwd()
library(rvest)
library(dplyr)
url = "C:\\Users\\Asikul\\Documents\\mohfw\\mohfw.html"
webpage = read_html(url)
tables = webpage %>% html_table()
COVID_19 = data.frame(tables)
COVID_19 = select(COVID_19,-6,-7,-8)
write.csv(COVID_19,"COVID19_Rnew.csv")
print("Covid Data are successfully scrapped under the table ")
