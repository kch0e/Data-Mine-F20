#Kevin Choe
#Project 9

#1
library(imager)

books <- read.csv("/class/datamine/data/goodreads/csv/goodreads_books.csv")
authors <- read.csv("/class/datamine/data/goodreads/csv/goodreads_book_authors.csv")

get_author_name <- function(my_authors_dataset, my_author_id){
  return(my_authors_dataset[my_authors_dataset$author_id==my_author_id,'name'])
}

fun_plot <- function(my_authors_dataset, my_books_dataset, my_book_id, display_cover=T) {
  book_info <- my_books_dataset[my_books_dataset$book_id==my_book_id,]
  all_books_by_author <- my_books_dataset[my_books_dataset$author_id==book_info$author_id,]
  author_name <- get_author_name(my_authors_dataset, book_info$author_id)
  
  img <- load.image(book_info$image_url)
  
  if(display_cover){
    par(mfrow=c(1,2))
    plot(img, axes=FALSE)
  }
  
  plot(all_books_by_author$num_pages, all_books_by_author$average_rating, 
       ylim=c(0,5.1), pch=21, bg='grey80',
       xlab='Number of pages', ylab='Average rating', 
       main=paste('Books by', author_name))
  
  points(book_info$num_pages, book_info$average_rating,pch=21, bg='orange', cex=1.5)
}
fun_plot(authors, books,17332218)
fun_plot(authors, books, 157993)
#3 Argumetns, my books dataset, my booksID, and my authors dataset.
#the function prints the title and plot of the books versus others by page number and 

#2
library(imager)

books <- read.csv("/class/datamine/data/goodreads/csv/goodreads_books.csv")
authors <- read.csv("/class/datamine/data/goodreads/csv/goodreads_book_authors.csv")

get_author_name <- function(my_authors_dataset, my_author_id){
  return(my_authors_dataset[my_authors_dataset$author_id==my_author_id,'name'])
}

fun_plot <- function(my_authors_dataset, my_books_dataset, my_book_id, display_cover=T) {
  if (0==sum(my_authors_dataset$author_id==my_author_id))
  {
    stop("Book ID not found.")
  }
  book_info <- my_books_dataset[my_books_dataset$book_id==my_book_id,]
  all_books_by_author <- my_books_dataset[my_books_dataset$author_id==book_info$author_id,]
  author_name <- get_author_name(my_authors_dataset, book_info$author_id)
  
  img <- load.image(book_info$image_url)
  
  if(display_cover){
    par(mfrow=c(1,2))
    plot(img, axes=FALSE)
  }
  
  plot(all_books_by_author$num_pages, all_books_by_author$average_rating, 
       ylim=c(0,5.1), pch=21, bg='grey80',
       xlab='Number of pages', ylab='Average rating', 
       main=paste('Books by', author_name))
  
  points(book_info$num_pages, book_info$average_rating,pch=21, bg='orange', cex=1.5)
}
fun_plot(authors, books, 123, T)
fun_plot(authors, books, 19063, T)

#3
get_author_id <- function(my_authors_dataset, my_author_name)
{
  return(my_authors_dataset$author_id[my_authors_dataset$name==my_author_name])
}
authors <- read.csv("/class/datamine/data/goodreads/csv/goodreads_book_authors.csv")
get_author_id(authors, "Brandon Sanderson") # 38550
get_author_id(authors, "J.K. Rowling") # 1077326

#4
search_books_for_word <- function(word, my_books_dataset) {
  return(my_books_dataset[grepl(word, my_books_dataset$description, fixed=T),]$title)
}

search_books_for_word("dog",books)
#5
search_title <- function(word, my_books_dataset) {
  return(my_books_dataset[grepl(word, my_books_dataset$title, fixed=T),]$title)
}

search_title(" Cow ",books)


