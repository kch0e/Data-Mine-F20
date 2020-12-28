#Kevin Choe
#Project 8

#1
books <- read.csv("/class/datamine/data/goodreads/csv/goodreads_books.csv")
authors <- read.csv("/class/datamine/data/goodreads/csv/goodreads_book_authors.csv")


# A function that, given a string (myColumn), returns the string
# without any punctuation.
strip_punctuation <- function(myColumn) {
  # Use regular expressions to identify punctuation.
  # Replace identified punctuation with an empty string ''.
  desc_no_punc <- gsub('[[:punct:]]+', '', myColumn)
  
  # Return the result
  return(desc_no_punc)
}
books$description<- strip_punctuation(books$description)
#The name of the function is strip puncuation. There is one argument which is named myColumn.

#2
#String split by space
test_string <- "This is  a test string  with no punctuation"
strsplit("This will be   split by space.", " ")
#It would be not be an accurate counting because there are double spaces (two).

#3
#Use which to fix issue by unlisting strsplt result a
strsplit("This will be   split by space.", " ")
x <- unlist(strsplit(test_string, " "))
length(which(x!=""))


#4
# word_count is a function that accepts a sentence as an argument,
# strips punctuation and extra space, and returns the number of 
# words in the sentence.
word_count <- function(sentence) {
  # strip punctuation and save into an auxiliary variable
  aux <- gsub('[[:punct:]]+','', sentence)
  
  # split the sentence by space and remove extra spaces
  result <- sum(unlist(strsplit(aux, " ")) != "")
  return(result)
}
second <- books[2, "description"]
word_count(second)
#There are 211 words total. 

#5
#Adds together all words and titles 
title_count <- function(name) {
  aux <- gsub('[[:punct:]]+','', name$title)
  result <- sum(unlist(strsplit(aux, " ")) != "")
  return(result)
}
title_count(books) 
#Total number of words and titles combined



