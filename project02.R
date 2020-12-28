#Kevin Choe
#Project 2

#1 
myDF <- read.csv("/class/datamine/data/disney/metadata.csv")
head(myDF)

#2
our_vec <- myDF$WDWMAXTEMP
our_vec[1]
our_vec[50]
typeof(our_vec)

#3
first50 <- head(our_vec,n=50)
last50 <- tail(our_vec,n=50)
mymix = first50 + last50

#4
hot <- myDF$WDWMAXTEMP[myDF$WDWMAXTEMP>=80]
length(hot)
mymix = hot + first50
##R sums up the vectors by recycling the elements in the shorter one until it is long enough to match it

#5
barplot(our_vec)

#6 I like the Average temperature range because it is visually appealing and simple to understand. It gets the message across well without too many distractions. This could be improved my adding colors relating to the seasons. For example white for colder months and yellow for warmer months. One interesting observation is that there is is a space around the plot area to indicate the highs and lows range around the average temperature of eachmonth.  
