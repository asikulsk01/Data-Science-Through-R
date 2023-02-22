install.packages("qdapTools") 
install.packages("qdap")
install.packages("qdapRegex")

library(qdapTools)
library(qdap)
library(qdapRegex)
library(ggplot2)
library(NLP)
library(tm)
library(RColorBrewer)
library(wordcloud)
library(wordcloud2)
library(SnowballC)

txt = read_docx("genofcomp.docx")
print(txt)

txt = rm_non_ascii(txt)
print(txt)

D = Corpus(VectorSource(txt))
inspect(D)

doc = tm_map(D, removePunctuation)
doc = tm_map(doc, removeNumbers)
doc = tm_map(doc, tolower)
doc = tm_map(doc, removeWords, stopwords("english"))
doc= tm_map(doc, stripWhitespace)
doc = tm_map(doc, stemDocument)
dtm=DocumentTermMatrix(doc)
dtm
freq = colSums(as.matrix(dtm))
ord = order(freq,decreasing=TRUE)
freq[head(ord)]
names(freq)
