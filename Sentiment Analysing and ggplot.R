#Packages
install.packages("syuzhet")

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
library(syuzhet)
library(ggplot2)

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
sent <- sent[,1:4]
sent <- as.data.frame(sent)
print(sent)

#Binging both Fb posting and Sent columns.
final = bind_cols(Facebook_Posting,sent)
print(final)

#Showing top 5 positive comments.
final %>% group_by(Comments) %>% summarize(sent = mean(SentimentGI)) %>% arrange(desc(sent)) %>% head(n=5) 

#showing only COmmets column.
Facebook_Posting$Comments

#Get rateing of each comments.
sent2 = get_nrc_sentiment(as.character(Facebook_Posting$Comments))
print(sent2)

#Convert into Data Frame
sent3 = as.data.frame(colSums(sent2))
print(sent3)

#Setting rowname.
rownames_to_column(sent3)

#Adding Reaction as a row name.
sent3 = sent3 %>% rownames_to_column("Reaction")
sent3

#Setting both emotion and count as a column name.
colnames(sent3) = c("emotion","count")
sent3

#Ploting.
ggplot(sent3,aes(x=emotion,y=count,fill=emotion))
geom_bar(stat='identity')
theme_minimal()
theme(legend.position="NONE",panel.grid.mejor=element_blank())
labs(x="emotions",y="total count")
ggtitle("sentiment of comments")
theme(plot.title=element_text(hjust=0.5))

