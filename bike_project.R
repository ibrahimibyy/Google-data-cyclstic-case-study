# install packages
install.packages("tidyverse")
install.packages("skimr")
install.packages("janitor")
install.packages("hms")
install.packages("dplyr")
install.packages("haven")


#load packages
library(readr)
library(tidyverse)
library(skimr)
library(janitor)
library(dplyr)
library(lubridate)
library(hms)
library(data.table)
library(haven)
library(purrr)

# load the data
library(readr)
jan_1 <- read_csv("files/202201-divvy-tripdata.csv")
feb_1 <- read_csv("files/202202-divvy-tripdata.csv")
mar_1 <- read_csv("files/202203-divvy-tripdata.csv")
April_1 <- read_csv("files/202204-divvy-tripdata.csv")
May_1 <- read_csv("files/202205-divvy-tripdata.csv")
june_1 <- read_csv("files/202206-divvy-tripdata.csv")
july_1 <- read_csv("files/202207-divvy-tripdata.csv")
aug_1 <- read_csv("files/202208-divvy-tripdata.csv")
sep_1 <- read_csv("files/202209-divvy-publictripdata.csv")
oct_1 <- read_csv("files/202210-divvy-tripdata.csv")
nov_1 <- read_csv("files/202211-divvy-tripdata.csv")
dec_1 <- read_csv("files/202212-divvy-tripdata.csv")

#merge data

bike_data_12 <- rbind(jan_1,feb_1,mar_1,April_1,May_1,june_1,july_1,aug_1,sep_1,oct_1,nov_1,dec_1)

#drop form enviroment
remove(jan_1,feb_1,mar_1,April_1,May_1,june_1,july_1,aug_1,sep_1,oct_1,nov_1,dec_1)

# copy of data
data_12_months_2 <- bike_data_12

#create column ride_length in minutes

data_12_months_2$ride_length <- difftime(data_12_months_2$ended_at, data_12_months_2$started_at, units = "mins")
#create column day_of_week in text

data_12_months_2$day_of_week <- wday(data_12_months_2$started_at)

#create numeric columns for the day of week, date, month, day, year

data_12_months_2$date <- as.Date(data_12_months_2$started_at)

data_12_months_2$day_of_week <- format(as.Date(data_12_months_2$date), "%A")

data_12_months_2$month <- format(as.Date(data_12_months_2$date), "%m") 

data_12_months_2$day <- format(as.Date(data_12_months_2$date), "%d")

data_12_months_2$year <- format(as.Date(data_12_months_2$date), "%Y")

#create a column for ride season classification

data_12_months_2 <- data_12_months_2 %>% mutate(season =case_when(month == "03" ~ "Spring",month == "04" ~ "Spring",month == "05" ~ "Spring",month == "06" ~ "Summer",month == "07" ~ "Summer",month == "08" ~ "Summer",month == "09" ~ "Fall",
                                                                  month == "10" ~ "Fall",
                                                                  month == "11" ~ "Fall",
                                                                  month == "12" ~ "Winter",
                                                                  month == "01" ~ "Winter",
                                                                  month == "02" ~ "Winter")
)
#remove duplicate rows

data_12_months_2 <- distinct(data_12_months_2)

#remove rows with null values

data_12_months_2 <- na.omit(data_12_months_2)

#remove rows where ride_length is <= to zero

data_12_months_2 <- data_12_months_2[!(data_12_months_2$ride_length <=0),]

#remove unneeded columns

data_12_months_2 <- data_12_months_2 %>%  
  select(-c(ride_id, start_station_id, end_station_id, start_lat, start_lng, end_lat, end_lng))

#rename member_casual to member_type

data_12_months_2 <- data_12_months_2 %>% 
  rename(member_type = member_casual)
#convert ride_length to numeric

data_12_months_2$ride_length <- as.numeric(as.character(data_12_months_2$ride_length))
is.numeric(data_12_months_2$ride_length)

#view final df
View(data_12_months_2)


#converts values from scientific notation 
options(scipen = 999)

#total number of rides
nrow(data_12_months_2)

#total number of rides rounded
round(nrow(data_12_months_2), digits = -4)

#count member types
data_12_months_2 %>% count(member_type)

#total rides by bike type
data_12_months_2 %>%
  group_by(rideable_type) %>% 
  count(rideable_type)

#plot bicycle type by number of rides
data_12_months_2 %>%
  group_by(rideable_type, member_type) %>%
  dplyr::summarize(count_trips = n()) %>%  
  ggplot(aes(x=rideable_type, y=count_trips, fill=member_type, colour=member_type,)) +
  geom_bar(stat='identity', position='dodge') +
  theme_bw()+
  labs(title="Number of Trips by Bicycle Type", x="Bicycle Type", y="Number of Rides",colours())

#total rides by bike type by member type 
data_12_months_2 %>%
  group_by(member_type, rideable_type) %>% 
  count(rideable_type)

#min, max, median, mean length of ride
summary(data_12_months_2$ride_length)

#arrange days of the week in order
data_12_months_2$day_of_week <- ordered(data_12_months_2$day_of_week, levels=c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"))

#plot number of rides by day of week

data_12_months_2 %>% 
  group_by(member_type, day_of_week) %>%
  dplyr::summarize(count_trips = n()) %>%  
  ggplot(aes(x= day_of_week, y=count_trips, fill=member_type, color=member_type)) +
  geom_bar(stat='identity', position = 'dodge') +
  theme_bw()+
  labs(title ="Number of Rides by Day of Week", x = "Day of Week", y = "Number of Rides")

#arranges months in order
data_12_months_2$month <- ordered(data_12_months_2$month, levels=c("01", "02", "03", "04", "05", "06", "07","08","09","10","11","12"))
#plot number of rides per month
data_12_months_2 %>%
  group_by(member_type, month) %>%
  dplyr::summarize(count_trips = n()) %>%  
  ggplot(aes(x= month, y=count_trips, fill=member_type, color=member_type)) +
  geom_bar(stat='identity', position = 'dodge') +
  theme_bw() +
  labs(title ="Number of Rides per Month", x = "Month", y = "Number of Trips")

#total rides by member type
data_12_months_2 %>%
  group_by(season, member_type) %>% 
  count(season)

#total rides

data_12_months_2 %>%
  group_by(season) %>% 
  count(season)
#Bike use by the hour, by day of the week

ggplot(data = data_12_months_2) +
  aes(x = started_at, fill = member_type) +
  facet_wrap(~day_of_week) +
  geom_bar() +
  labs(x = 'Start Hour', y = 'Number of Rides', fill = 'Member Type', title = 'Bike Use By Hour, By Day') +
  theme(axis.text = element_text(size = 5))

#Find popular start station for casual riders
data_12_months_2 %>%
  group_by(member_type, start_station_name) %>%
  dplyr::summarise(number_of_ride = n()) %>%
  filter(start_station_name != "", "casual"== member_type) %>%
  arrange(-number_of_ride) %>%
  head(n=5) %>%
  select(-member_type)

#Find popular start station for member riders

data_12_months_2 %>%
  group_by(member_type,start_station_name) %>%
  dplyr::summarise(number_of_ride = n()) %>%
  filter(start_station_name != "", "member" == member_type) %>%
  arrange(-number_of_ride) %>%
  head(n=5) %>%
  select(-member_type)


View(data_12_months_2)
