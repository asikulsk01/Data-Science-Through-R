getwd()
#install.packages("lubridate")
library(lubridate)
library(rvest)

url = "https://www.nytimes.com/2021/04/23/travel/battle-of-the-seas-cruise-lines-vs-the-cdc.html"
webpage = read_html(url)
time_in_html = webpage %>% html_nodes(".css-1hdytw")
content_time = time_in_html %>% html_nodes("time") %>% html_text(trim=TRUE) 
print(content_time)
date = mdy(content_time)
print(date)