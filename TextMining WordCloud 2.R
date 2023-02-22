getwd()

#Installing Packages.
install.packages("tibble")
install.packages("udpipe")

#Importing packages.
library(NLP)
library(tm)
library(RColorBrewer)
library(wordcloud)
library(wordcloud2)
library(SnowballC)
library(tibble)
library(dplyr)
library(udpipe)

#Creation of DataFrames.
Facebook_Posting <- data.frame(Type=c('Photo','Message','Audio_Song','Craft_Video','Video_Song','Job','Drawing','Memory_Video','Video_Cooking'),
Likes=c('Yes','No','Yes','Yes','No','Yes','No','Yes','No'),
Comments=c('Lovely','It is fake','Lovely','Worthless','Fake','Thank you Debraj for this lovely drawing','Excellent','May god bless you','It is ordinary'))

#Taking only single Column.
fbc <- SimpleCorpus(VectorSource(Facebook_Posting$Comments))
inspect(fbc)
fbc[[2]]$content

#Transform all content of fbc into lower case.
fbdoc <- tm_map(fbc,content_transformer(tolower))
inspect(fbdoc)

#Removing numbers (if any).
fbdoc <- tm_map(fbdoc,removeNumbers)
inspect(fbdoc)

#Removing all stop words.
fbdoc <- tm_map(fbdoc,removeWords,stopwords("english"))
inspect(fbdoc)

#Removing all punctuation.
fbdoc <- tm_map(fbdoc,removePunctuation)
inspect(fbdoc)

#Removing White Spaces.
fbdoc <- tm_map(fbdoc,stripWhitespace)
inspect(fbdoc)

fbdtm <- DocumentTermMatrix(fbdoc)
inspect(fbdtm)

fbfreq <- as.data.frame(colSums(as.matrix(fbdtm)))
print(fbfreq)

fbfreq <- rownames_to_column(fbfreq)
print(fbfreq)

fbfreq <- rownames_to_column(fbfreq)
print(fbfreq)

colnames(fbfreq) <- c("term","frequency")
print(fbfreq)

fbfreq <- arrange(fbfreq,desc(frequency))
print(fbfreq)

#Print the result in wordcloud.
wordcloud(words=fbfreq$term,freq=fbfreq$frequency,min.freq=1,max.words=10,random.order=FALSE,rot.per=0.35,colors=brewer.pal(11,"PiYG"))

x = "The universe (Latin: universus) is all of space and time[a] and their contents, including planets, stars, galaxies, and all other forms of matter and energy. The Big Bang theory is the prevailing cosmological description of the development of the universe. According to estimation of this theory, space and time emerged together 13.799±0.021 billion years ago, and the universe has been expanding ever since. While the spatial size of the entire universe is unknown,it is possible to measure the size of the observable universe, which is currently estimated to be 93 billion light-years in diameter."
text <- udpipe(x,object="english")
print(text)

tm::stemDocument(text$lemma)










