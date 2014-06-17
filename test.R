setwd("E:/documents/progr/letterFreq")

library(plyr)
library(ggplot2)

##steps
#get input
#sanitize input
#find relative frequency
#map to complete alphabet
#plot current relative frequency vs one of several options:
#   oxford dictionary: http://www.oxforddictionaries.com/us/words/what-is-the-frequency-of-the-letters-of-the-alphabet-in-english
#   twitter users or something?
#   classics: http://www.data-compression.com/english.html
#   most popular english first names

#display first 100-500 chars of processed text

#have option to sort plot by descending freq

str <- "This is an example input <> %6 alkdasf;i420asd ' '';'l jk \n"
str <- "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
str <- "a c ddd"

newstr <- gsub("[^[:alpha:]]", "", str)
newstr <- tolower(newstr)
chars <- strsplit(newstr, NULL)[[1]]
freqs <- summary(factor(chars))
rfreqs <- freqs / sum(freqs)


#make 0-count vector
alphabet <- rep(1,26)
names(alphabet) <- letters

alphabet_filled <- sapply(1:26, function(x) {rfreqs[names(alphabet)[x]]})

alphabet_filled[is.na(alphabet_filled)] <- 0

names(alphabet_filled) <- letters
alphabet_filled <- as.data.frame(alphabet_filled)
names(alphabet_filled) <- "rfreqs"


# 
# plot(rep(0.0,26),xaxt="n",col=0)
# points(alphabet_filled,col=2)
# axis(1, at=1:26, labels=letters)
# 


ggplot(data=alphabet_filled, aes(x=seq(1:26),y=rfreqs)) + geom_bar(stat="identity",aes(fill=rfreqs)) + 
    scale_x_discrete(breaks = c(1:26), labels=letters) +
    labs(title="Letter Frequency", x = "letter", y="frequency")






#http://rosettacode.org/wiki/Letter_frequency#R
