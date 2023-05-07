#Loading Libabries
library(readr)
library(tidytext)
library(dplyr)
library(tokenizers)
library(corpus)
library(wordcloud)
library(magrittr)

#Reading raw data
data <- read.csv("/Users/nikhithasadanala/Desktop/Spring'23/PDS/Assignment3/rawdata/Corona_NLP_test.csv")

# Preprocessing the data
data$OriginalTweet <- gsub("http[^[:space:]]*", "", data$OriginalTweet) 
data$OriginalTweet <- gsub("@[^[:space:]]*", "", data$OriginalTweet)
data$OriginalTweet <- gsub("[^[:alnum:][:space:]']", "", data$OriginalTweet)
data$OriginalTweet <- tolower(data$OriginalTweet) 
data <- data[!is.na(data$OriginalTweet) & data$OriginalTweet != "", ] 

#writing the processed data into the file
write.csv(data, "/Users/nikhithasadanala/Desktop/Spring'23/PDS/Assignment3/cleandata/cleandata.csv")

#reading the processed data
data <- read.csv("/Users/nikhithasadanala/Desktop/Spring'23/PDS/Assignment3/cleandata/cleandata", stringsAsFactors = FALSE)

#Tokenization
tokens <- data %>%
  unnest_tokens(word, OriginalTweet)
print(tokens)
View(tokens)
write.csv(tokens, "/Users/nikhithasadanala/Desktop/Spring'23/PDS/Assignment3/results/token.csv", row.names = FALSE)

# Stopword removal
data_stopword_removal <- stop_words
tokens_removal_stopwords <- tokens %>%
  anti_join(data_stopword_removal, by = "word")
print(tokens_removal_stopwords)
write.csv(tokens_removal_stopwords, "/Users/nikhithasadanala/Desktop/Spring'23/PDS/Assignment3/results/tokens_removal_stopwords.csv", row.names = FALSE)

# Counting word frequencies
word_freq_count <- tokens_removal_stopwords %>%
  count(word, sort = TRUE)
print(word_freq_count)
write.csv(word_freq_count, "/Users/nikhithasadanala/Desktop/Spring'23/PDS/Assignment3/results/word_freq_count.csv", row.names = FALSE)

# Creating word cloud
png("/Users/nikhithasadanala/Desktop/Spring'23/PDS/Assignment3/results/wordCloud.png", width = 500, height = 500, units = "px")
wordcloud(words = word_freq_count$word, freq = word_freq_count$n, min.freq = 1,
          max.words = 100 , random.order = FALSE, rot.per = 0.35,
          colors = brewer.pal(8, "Accent"))
dev.off()
