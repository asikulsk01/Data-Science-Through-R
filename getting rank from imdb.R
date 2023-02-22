Code: 1
url='http://www.imdb.com/search/title?count=100&release_date=2016,2016title,type=feature'
webpage = read_html(url)
print(webpage)

Code:2 
html_rank_data=html_nodes(webpage,".text-primary")
rank_data=html_text(html_rank_data)
print(rank_data)

Code 3:
head(rank_data)
rank_data=as.numeric(rank_data)
head(rank_data)

Code 4:
html_data_title=html_nodes(webpage,'.lister-item-header a')
title_data=html_text(html_data_title)
print(title_data)

CODE 5:
getwd()
genre_data=html_nodes(webpage,'.genre')
genre_data_text=html_text(genre_data)
print(genre_data_text)

CODE:6 WITHOUT SPACE
#Remove extra spaces:
genre_data_text1=gsub(' ','',genre_data_text)
print(genre_data_text1)

CODE: 7 
#First genre of each movie:
genre_data_text2 = gsub(",.*","",genre_data_text1)
print(genre_data_text2)

CODE 8:
metascore_data_html = html_nodes(webpage,'.metascore')
metascore_data_text = html_text(metascore_data_html)
print(metascore_data_text)

CODE: 9
#To remove space:
metascore_data_text1 = gsub(" ","",metascore_data_text)
print(metascore_data_text1)

#CODE: 10
#To check length:
length(metascore_data_text1)

CODE:11
#To put NA for movies not available:
for (i in c(29,37,76,93)){
	x = metascore_data_text1[1:(i-1)]
	y = metascore_data_text1[i:length(metascore_data_text1)]
	metascore_data_text1 = append(x,list("NA"))
	metascore_data_text1 = append(metascore_data_text1,y)
}
print(metascore_data_text1)