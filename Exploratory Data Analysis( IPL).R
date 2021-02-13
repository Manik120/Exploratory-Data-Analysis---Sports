#Clean the Environment
rm(list = ls(all.names = TRUE))
#Install the required library
install.packages("readr")
install.packages("dplyr")
install.packages("tidyverse")
install.packages("ggplot2")
#Load the library
library(readr)
library(dplyr)
library(tidyverse)
library(ggplot2)

#load the data set
Deliver<-read.csv("D:\\INTERNSHIP\\eth IPL\\Indian Premier League\\deliveries.csv")
Matche<-read.csv("D:\\INTERNSHIP\\eth IPL\\Indian Premier League\\matches.csv")
View(Deliver)
View(Matche)

#view stracture and statical summary of data
str(Deliver)
str(Matche)
summary(Deliver)
summary(Matche)

#Finding the null value
sum(is.na(Deliver))
sum(is.na(Matche))

#TOtal matches played  per session
Matches_Per_Session<-Matche%>%select(season,id)%>%group_by(season)%>%summarize(match_session=0+n())
View(Matches_Per_Session)
write.csv(Matches_Per_Session,"D:\\INTERNSHIP\\eth IPL\\Indian Premier League\\match per session.csv")


#Total run Score by each crickter
Batsman_run<-Deliver%>%select(batsman,total_runs)%>%group_by(batsman)%>%summarize(Runs=0+n())
view(Batsman_run)
write.csv(Batsman_run,"D:\\INTERNSHIP\\eth IPL\\Indian Premier League\\Batsman Runs.csv")

#Total toss won by each team
Toss_win<-count(Matche,toss_winner)
view(Toss_win)
write.csv(Toss_win,"D:\\INTERNSHIP\\eth IPL\\Indian Premier League\\Toral toss win.csv")

#Total match won by each team
Match_winner<-count(Matche,winner)
view(Match_winner)
write.csv(Match_winner,"D:\\INTERNSHIP\\eth IPL\\Indian Premier League\\Toral match win.csv")

#Total match won by each team
Man_of_the_match<-count(Matche,player_of_match)
view(Man_of_the_match)
write.csv(Man_of_the_match,"D:\\INTERNSHIP\\eth IPL\\Indian Premier League\\Man of the match.csv")

# City wise session
City_Session<-Matche%>%select(season,city)%>%group_by(city)%>%summarize(City_session=0+n())
View(City_Session)
write.csv(City_Session,"D:\\INTERNSHIP\\eth IPL\\Indian Premier League\\City wise session.csv")


#Top 10 match winer
Toss_win<-top_n(Toss_win, n=10)

#Top 5 session played most match
Top_Matches_Per_Session<-top_n(Matches_Per_Session, n=10)

#Finding top 10 playerby run
Top_Batsman_run<-top_n(Batsman_run, n=10,)
