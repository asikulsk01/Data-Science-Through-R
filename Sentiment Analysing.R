install.packages("SentimentAnalysis")
install.packages("zeallot")

#Importing packages.
library(SentimentAnalysis)
library(zeallot)
library(NLP)
library(tm)
library(RColorBrewer)
library(wordcloud)
library(wordcloud2)
library(SnowballC)
library(tibble)
library(dplyr)
library(udpipe)


c(4,9,16,25) %>% Map(sqrt,.) %>% Reduce(sum,.)

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

#Analysing Sentiment.
sent <- analyzeSentiment(fbdtm,language="english")
#sent <- sent[,1:4]
sent <- as.data.frame(sent)
print(sent)

#Getting Summary of the dataframe.
summary(sent$SentimentGI)