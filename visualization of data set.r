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
