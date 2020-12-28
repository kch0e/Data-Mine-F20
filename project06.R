#Kevin Choe
#Project 6

#1
dat <- read.csv("/class/datamine/data/fars/7581.csv")

#Calculates mean number of motorists
tapply(dat$PERSON, dat$DRUNK_DR, mean)

# Read in data that maps state codes to state names
state_names <- read.csv("/class/datamine/data/fars/states.csv")

# Create a vector of state names called v
v <- state_names$state

# Set the names of the new vector to the codes
names(v) <- state_names$code

# Create a new column in the dat dataframe with the actual names of the states
dat$mystates <- v[as.character(dat$STATE)]

#I prefer to use the tapply function because it is easier and simpler to write.

#2

#Sorts states by highest average number of drunk drivers per accident

tapply(dat$DRUNK_DR, dat$mystates, mean)
sort(tapply(dat$DRUNK_DR, dat$mystates, mean), decreasing = TRUE)

#New Hampshire has the highest average number of drunk drivers per accident.

#3

#Sorts toal number of fatalities for each day of the week.

sort(tapply(dat$FATALS, dat$DAY_WEEK, sum), decreasing = TRUE)

#The numbers are supring to me because Sundays, Saturdays, and Fridays have the highest number of fatalities compared to other days.

#Sorts proportion of fatalities over the total number of people in the accidents

sort(tapply(dat$FATALS, dat$DAY_WEEK, sum), decreasing = TRUE)/sort(tapply(dat$PERSONS, dat$DAY_WEEK, sum), decreasing = TRUE)

#I was expecting a smaller proportion for the days with higher number of fatalities. I was expecting a high proportion on day 5.

#4

#Sorts average number of crashes involving drunk drivers that occur on straight, curvy, and unknown roads.

sort(tapply(dat$DRUNK_DR, dat$ALIGNMNT, mean), decreasing = TRUE)

#The average for straight roads is 0.31 and the average for curvy roads is 0.47.

#5

#Finds the total number of fatalities in time interval

tapply ( dat$FATALS, cut(dat$HOUR, breaks=c(0,6,12,18,24,99), include.lowest=T), sum )

#Finds the average number of fatalities in time interval

tapply ( dat$FATALS, cut(dat$HOUR, breaks=c(0,6,12,18,24,99), include.lowest=T), mean)
