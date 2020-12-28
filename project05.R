#Kevin Choe
#Project 5

#1
#Combines accident files into one big dataset
accidents <- rbind(read.csv("/class/datamine/data/fars/1975/ACCIDENT.CSV"),
                   read.csv("/class/datamine/data/fars/1976/ACCIDENT.CSV"),
                   read.csv("/class/datamine/data/fars/1977/ACCIDENT.CSV"),
                   read.csv("/class/datamine/data/fars/1978/ACCIDENT.CSV"),
                   read.csv("/class/datamine/data/fars/1979/ACCIDENT.CSV"),
                   read.csv("/class/datamine/data/fars/1980/ACCIDENT.CSV"),
                   read.csv("/class/datamine/data/fars/1981/ACCIDENT.CSV"))
#Pasting 19 to every value in the year column
accidents$YEAR <- paste0("19", accidents$YEAR)
#Tells all unique values
unique(accidents$YEAR)

#2
#Printing values where statement is true, false and N/A, specifically looking for true values
table(accidents$DRUNK_DR >= 1&accidents$SCH_BUS >= 1, useNA= "always")
#The true value is 101

#3
#Print number of accidents involving more than 1 drunk driver 
table(accidents$YEAR[(accidents$DRUNK_DR >= 1)&(accidents$SCH_BUS >= 1)])
#1978 had the largest number of accidents

#4
#Finds the mean number of motorists in an accident and drunk drivers
for (i in 0:6) {
  print(paste0("The mean number of motorists in an accident with ", i, " drunk drivers is ", mean(accidents$PERSONS[accidents$DRUNK_DR == i],na.rm = TRUE)))
}
#Other way to get the answer
tapply(accidents$PERSONS, accidents$DRUNK_DR, mean)

#5

library(RColorBrewer)
#Creating a vector of states.
sN <- c(17, 18, 26, 39)

# Extract data from accidents only where the state code is either 17, 18, 26, or 39
mwDF <- accidents[accidents$STATE %in% sN,]

t <- table(mwDF$STATE, mwDF$MONTH)

# Using a table comparing the number of accident rows in each month for each state as data for a barplot
barplot(table(mwDF$STATE, mwDF$MONTH),
        legend=rownames(t),
        xlab="Month",
        ylab="# of Accidents",
        main="Accidents for Each State, by Month",
        col=brewer.pal(4, "Set1")
)
#The most accidents happen in month 8 followed by month 7 and month 9.
