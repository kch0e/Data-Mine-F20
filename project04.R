#Kevin Choe
#Project 4

#1
splash_mountain <- read.csv("/class/datamine/data/disney/splash_mountain.csv")


total <- 0
for (i in splash_mountain$SPOSTMIN) {
total <- total + i
}
total

i!= -999
((!is.na(i)) & (i != -999))


#2
splash_mountain <- read.csv("/class/datamine/data/disney/splash_mountain.csv")

for (i in 1: nrow(splash_mountain)) {
  if(any(splash_mountain[ , c("SPOSTMIN", "SACMIN")] == -999, na.rm=T)) {
  splash_mountain[i] <- "closed"
}
  else {
    splash_mountain[i] <- "open"
    
  }
}
head(splash_mountain)
head(splash_mountain$status)
splash_mountain$status <- factor(splash_mountain$status)
head(splash_mountain)
head(splash_mountain$status)
table(splash_mountain$status)

#3

#4

splash_mountain <- read.csv("/class/datamine/data/disney/splash_mountain.csv")
head(splash_mountain)

mystatus2 <- rep("open", times=nrow(splash_mountain))
head(mystatus2)

mystatus2[(splash_mountain$SPOSTMIN == -999 | splash_mountain$SACTMIN == -999)] <- "Closed"

splash_mountain$status <- factor(mystatus2)
head(splash_mountain, n=15)

splash_mountain_open_closed_pie_chart <- pie(table(splash_mountain$status))


#5
mypiechart <- function(x) {
  myDF <- read.csv( paste0("/class/datamine/data/disney/splash_mountain.csv")
  mystate <- rep("other", times=nrow(myDF))
  mystate[myDF$STATE == "CA"] <- "California"
  mystate[myDF$STATE == "TX"] <- "Texas"
  mystate[myDF$STATE == "NY"] <- "New York"
  myDF$stateclassification <- factor(mystate)
  pie(table(myDF$stateclassification))
}

myyears <- c("1980","1984","1988","1992","1996","2000")
par(mfrow=c(2,3))
for (i in myyears) {
  mypiechart(i)
}

