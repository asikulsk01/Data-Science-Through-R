getwd()
#Installing Packages.
install.packages("textclean")
install.packages("emojifont")

#Importing packages.
library(textclean)
library(emojifont)


x =c(paste("text from:", "http://www.webopedia.com/quick_ref/textmessageabbreviations_02.asp" ),"... understanding what different characters used in smiley faces mean:", "The close bracket represents a sideways smile )", "Add in the colon and you have sideways eyes :", "Put them together to make a smiley face :)", "Use the dash -to add a nose :-)",paste("Change the colon to a semi-colon ;","and you have a winking face wink with a nose wink"),paste("Put a zero 0 (halo) on top and now you have a winking,", "smiling angel 0;) with a nose 0;-)" ), "Use the letter 8 in place of the colon for sunglasses 8-)", "Use the open bracket ( to turn the smile into a frown :-(" )
 
replace_emoticon(x)

path <- "C:\\Users\\Asikul\\Documents\\text_with_emoji.txt"
conn <- file(path,open="r")
lines <- readLines(conn)

for(i in 1:length(lines)){
	print(lines[i])
}

close(conn)

lines <- gsub("[^\x01-\x7F]","",lines)

print(lines)

search_emoji('heart')
emoji(search_emoji('heart'))

set.seed(125) 
x =rnorm(20) 
set.seed(327) 
y = rnorm(20) 
plot(x, y, cex=0) 
text(x, y, labels=emoji('heart'), cex=1.5, col='red', family='EmojiOne')










