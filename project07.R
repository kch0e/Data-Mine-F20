#Kevin Choe
#Project 7

#1
books <- read.csv("/class/datamine/data/goodreads/csv/goodreads_books.csv")
authors <- read.csv("/class/datamine/data/goodreads/csv/goodreads_book_authors.csv")
#Shows number of rows and columns
dim(books)
dim(authors)

#2
#Breaks books into 4 Categories
book_size <- cut(books$num_pages, breaks=c(0,250,500,1000,Inf), labels = c("small","medium","large","huge"), include.lowest = T)
table(book_size)

#3
#Caclualtes the mean of each Category
tapply(books$publication_year, book_size, mean, na.rm=T)
tapply(books$average_rating, book_size, mean, na.rm=T)
tapply(books$text_reviews_count, book_size, mean, na.rm=T)
#The results did actually suprise me because there was not much of a difference between each category.

#4
#Created list of 4 dataframes
booksubset <- books[,c("publication_year","average_rating","text_reviews_count")]
books_by_size <- split(booksubset,book_size)
#Apply column means to each of new dataframe
lapply(books_by_size, colMeans, na.rm=T)

#5
#Creates an equivalent data frame of my own, by using the subset function
res <- subset(books, subset=language_code %in% c("en-US", "en-CA", "en-GB", "eng", "en", "en-IN") & publication_year > 2000, select=c("author_id", "book_id", "average_rating", "description", "title", "ratings_count", "language_code", "publication_year"))
en_books <- books[books$language_code %in% c("en-US", "en-CA", "en-GB", "eng", "en", "en-IN") & books$publication_year > 2000, c("author_id", "book_id", "average_rating", "description", "title", "ratings_count", "language_code", "publication_year")]
dim(en_books)
dim(res)
#The differnece is that the subset function removes the NA rows while the other one does not.

#6
#Combines res and authors in a way which appends all information from author when there is a match in res
mymergedDF <- merge(res, authors, by="author_id")
dim(mymergedDF)

#7
#Prints authors and looks into author's highest rated book after declaring an author
table(mymergedDF$name)
abigail <- mymergedDF[mymergedDF$name == "Abigail Thomas",]
abigail[which.max(abigail$ratings_count.x),"title"]
#I agree the book to be the highest rated book from the author because I personally have read that book and enjoyed it very much. I also looked up reviews on Google as well.
