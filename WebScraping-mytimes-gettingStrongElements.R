getwd()
library(rvest)
url = "https://technoindiauniversity.ac.in/"
webpage = read_html(url)

strong_in_html = webpage %>% html_nodes(".single-skill")
print(strong_in_html)

strong_in_html1 = strong_in_html[3]
print(strong_in_html1)

content_strong = strong_in_html1 %>% html_nodes("strong") %>% html_text(trim=TRUE) 
print(content_strong)