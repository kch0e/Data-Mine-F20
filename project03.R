#Kevin Choe
#Project 3

#1
splash_mountain <- read.csv("/class/datamine/data/disney/splash_mountain.csv")
str (splash_mountain)
dim (splash_mountain)
#There are 223,936 rows and and 4 columns in the dataset

#2
mean (splash_mountain$SPOSTMIN,na.rm=T)
sqrt (var (splash_mountain$SPOSTMIN,na.rm=T))
#The results do not make sense becasue time is negative. I am getting a negative answer because the value is indicated that the ride as being closed.

#3
mean (splash_mountain$SPOSTMIN,na.rm=T)
mean(splash_mountain$SPOSTMIN [which (splash_mountain$SPOSTMIN>-999)],na.rm=T)
sqrt (var (splash_mountain$SPOSTMIN,na.rm=T))
sqrt (var (splash_mountain$SPOSTMIN [which (splash_mountain$SPOSTMIN>-999)],na.rm=T))
#The value looks reasonable now and seems to have fixed our problem.

#4
names(splash_mountain)
which(names(splash_mountain) == "SACTMIN")
names(splash_mountain)[3] <- "actual_wait_time"

names(splash_mountain)
which(names(splash_mountain) == "SPOSTMIN")
names(splash_mountain)[4] <- "posted_min_wait_time"

#5
?as.Date
as.Date(head(splash_mountain$date),"%m/%d/%Y")

myresults <- cut(as.Date(splash_mountain$date, "%m/%d/%Y"), "quarter")
nlevels(myresults)

levels(myresults) <- paste0("q",1:nlevels(myresults))
head(myresults)

splash_mountain$quarters <- myresults
head(splash_mountain)
tail(splash_mountain)
                          
#6 I acknowledge that the STAT 19000/29000/39000 1-credit Data Mine seminar will be recorded and posted on Piazza, for participants in this course.
