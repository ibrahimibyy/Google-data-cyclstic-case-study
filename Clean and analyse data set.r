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
