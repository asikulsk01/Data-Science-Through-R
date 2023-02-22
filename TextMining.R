getwd()
#Text Mining.
text_file <- readLines("https://cityclerk.lacity.org/election/Archives/Archives2003/General/svc0503.txt")
print(text_file)
text_file1 <- readLines("C:\\Users\\Asikul\\Documents\\TextMining\\svc0503.txt")
print(text_file1)

#Package to be installed.
install.packages("NLP")
install.packages("tm")
install.packages("RColorBrewer")
install.packages("wordcloud")
install.packages("wordcloud2")
install.packages("SnowballC")

#Importing packages.
library(NLP)
library(tm)
library(RColorBrewer)
library(wordcloud)
library(wordcloud2)
library(SnowballC)

conn=file("C:\\Users\\Asikul\\Documents\\TextMining\\svc0503.txt",open="r")
text=readLines(conn)
print(text)

doc=Corpus(VectorSource(text))
print(doc)
inspect(doc)

#Clean Punctuation
doc1=tm_map(doc,removePunctuation)
print(doc1)
inspect(doc1)

#Remove the number
doc2=tm_map(doc1,removeNumbers)
print(doc2)
inspect(doc2)

#Convert to lower case
doc3=tm_map(doc2,tolower)
inspect(doc3)

#Remove stopwords
doc4=tm_map(doc3,removeWords,stopwords("english"))
inspect(doc4)

#Remove Whitespace
doc5=tm_map(doc4,stripWhitespace)
inspect(doc5)


#create a stemDocument
doc6=tm_map(doc5,stemDocument)
inspect(doc6)

dtm=DocumentTermMatrix(doc6)
print(dtm)
inspect(dtm)

frequency=colSums(as.matrix(dtm))
ord=order(frequency,decreasing=TRUE)

frequency[head(ord)]

names(frequency)

#exploring frequency terms & association.
findFreqTerms(dtm,lowfreq=5)
findAssocs(dtm,term="dist",corlimit=0.3)
findAssocs(dtm,term="dist",corlimit=0.9)
findAssocs(dtm,term="dist",corlimit=0.4)
findAssocs(dtm,term="dist",corlimit=0.4)

wordcloud(words=names(frequency),frequency,min.freq=5,max.words=100,random.order=FALSE,rot.per=0.8,colors=brewer.pal(8,'Dark2'))

#barplot.
barplot(head(ord),las=2,names.arg=names(frequency [head(ord)]),col='lightblue',main='Most frequent word',xlab='word',ylab='frequency of words')

barplot(ord,las=1,horiz=TRUE,names.arg=names(frequency[ord]),col='lightblue',main='Most frequent word',xlab='word',ylab='frequency of words')

barplot(ord,las=0,names.arg=names(frequency[ord]),col='lightblue',main='All word frequencies',xlab='word',ylab='frequency of words')
