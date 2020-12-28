#Kevin Choe
#Project 10

#1
#Load up data
users <- read.csv("/class/datamine/data/okcupid/filtered/users.csv", sep = ",")
head(users)
questions <- read.csv("/class/datamine/data/okcupid/filtered/questions.csv", sep = ";")
head(questions)
#One file is data from users on OkCupid and the other file is questions                 

#2
#Finds a question that references "google"
head(questions$text)
grep("date", questions$text, ignore.case = T)
questions$text[909]
questions[909, ]

grep("google", questions$text, ignore.case = T, value = T)
#The question is "Do you Google someone before a first date?"

#3
#Finds the proportion of users that google in the first date.
questions [2672,]
prop.table(table(users$q170849,useNA="always"))
tapply(users$q170849,users$gender2,function(x) {prop.table(table(x, useNA="always"))})
tapply(users$q170849,users$gender_orientation,function(x) {prop.table(table(x, useNA="always"))})     
#The percetnage of users that Google someone before the first date is around 20%. This proportion does not really change by gender. Even for gender_orientation it does not really change.

#4
#Modified Count Words function with number of words in each row
count_words <- function(my_text) {
  my_split_text <- unlist(strsplit(my_text, " "))
  
  return(length(my_split_text[my_split_text!=""]))
}

questions$question_length <- sapply(questions$text, count_words)
str(questions)

#5
questions <- read.csv("/class/datamine/data/okcupid/filtered/questions.csv", sep=";")
number_of_options <- function(myDF) {
  table(apply(as.matrix(myDF[ ,3:6]), 1, function(x) {sum(!(x==""))}))
}                      

number_of_options(head(questions))
number_of_options(questions)
#break data frame into 7 parts
table(questions$Keywords)
mylist <- split(questions, questions$Keywords)
class(mylist)
length(mylist)
class(mylist[[1]])
class(mylist[[7]])

#dimensions of 7 data frames
sapply(mylist, dim)
dim(questions)
#foreachofthe7dataframes, we found the number of options
sapply( mylist, number_of_options)

#6
grep("glove", questions$text, ignore.case = T)
questions$text[645]
questions[645, ]
prop.table(table(users$q14835, useNA = "always"))
tapply(users$q14835, users$gender2, function(x) {prop.table(table(x, useNA = "always"))})
tapply(users$q14835, users$gender_orientation, function(x) {prop.table(table(x, useNA = "always"))})

t <- (prop.table(table(users$q14835, useNA = "always")))
library(RColorBrewer)
coul <- brewer.pal(5, "Set2")
barplot(t, col = coul, las = 2)
#Makes a barplot of the glove question data with left and right hand data. I thought I would find what I have now and it printed what I wanted to find.
