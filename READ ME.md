# Google Data Analytics Professional Certificate

## Overview

The [Google Data Analytics Professional Certificate](https://www.coursera.org/professional-certificates/google-data-analytics?utm_source=google&utm_medium=institutions&utm_campaign=gwgsite-gDigital-emprohpp-certs-launch) is an all-inclusive online program aimed at equipping individuals with the necessary skills to excel as data analysts. Created by Google, this program imparts essential abilities and tools crucial for a successful data analysis career, such as data cleaning, problem-solving, and data visualization.

## Background
### Cyclistic
A bike-share program that features more than 5,800 bicycles and 600 docking stations. Cyclistic sets itself apart by also offering reclining bikes, hand tricycles, and cargo bikes, making bike-share more inclusive to people with disabilities and riders who can’t use a standard two-wheeled bike. The majority of riders opt for traditional bikes; about 8% of riders use the assistive options. Cyclistic users are more likely to ride for leisure, but about 30% use them to commute to work each day.   
  
Until now, Cyclistic’s marketing strategy relied on building general awareness and appealing to broad consumer segments. One approach that helped make these things possible was the flexibility of its pricing plans: single-ride passes, full-day passes, and annual memberships. Customers who purchase single-ride or full-day passes are referred to as casual riders. Customers who purchase annual memberships are Cyclistic members.  
  
Cyclistic’s finance analysts have concluded that annual members are much more profitable than casual riders. Although the pricing flexibility helps Cyclistic attract more customers, Moreno (the director of marketing and my manager) believes that maximizing the number of annual members will be key to future growth. Rather than creating a marketing campaign that targets all-new customers, Moreno believes there is a very good chance to convert casual riders into members. She notes that casual riders are already aware of the Cyclistic program and have chosen Cyclistic for their mobility needs.  

Moreno has set a clear goal: Design marketing strategies aimed at converting casual riders into annual members. In order to do that, however, the marketing analyst team needs to better understand how annual members and casual riders differ, why casual riders would buy a membership, and how digital media could affect their marketing tactics. Moreno and her team are interested in analyzing the Cyclistic historical bike trip data to identify trends.  

### Scenario
I am assuming to be a junior data analyst working in the marketing analyst team at Cyclistic, a bike-share company in Chicago. The director of marketing believes the company’s future success depends on maximizing the number of annual memberships. Therefore, my team wants to understand how casual riders and annual members use Cyclistic bikes differently. From these insights, my team will design a new marketing strategy to convert casual riders into annual members. But first, Cyclistic executives must approve our recommendations, so they must be backed up with compelling data insights and professional data visualizations.

## Ask
### Business Task
Devise marketing strategies to convert casual riders to members.
### Analysis Questions
Three questions will guide the future marketing program:  
1. How do annual members and casual riders use Cyclistic bikes differently?  
2. Why would casual riders buy Cyclistic annual memberships?  
3. How can Cyclistic use digital media to influence casual riders to become members?  

Moreno has assigned me the first question to answer: How do annual members and casual riders use Cyclistic bikes differently?
## Prepare
### Data Source
I will use Cyclistic’s historical trip data to analyze and identify trends from Jan 2022 to Dec 2022 which can be downloaded from [divvy_tripdata](https://divvy-tripdata.s3.amazonaws.com/index.html). The data has been made available by Motivate International Inc. under this [license](https://www.divvybikes.com/data-license-agreement).  
  
This is public data that can be used to explore how different customer types are using Cyclistic bikes. But note that data-privacy issues prohibit from using riders’ personally identifiable information. This means that we won’t be able to connect pass purchases to credit card numbers to determine if casual riders live in the Cyclistic service area or if they have purchased multiple single passes.
### Data Organization
There are 12 files with naming convention of YYYYMM-divvy-trip data and each file includes information for one month, such as the ride id, bike type, start time, end time, start station, end station, start location, end location, and whether the rider is a member or not. The corresponding column names are ride_id, rideable_type, started_at, ended_at, start_station_name, start_station_id, end_station_name, end_station_id, start_lat, start_lng, end_lat, end_lng and member_casual.

## Process
R is used to combine the various datasets into one dataset and clean it.    
Reason:  
A worksheet can only have 1,048,576 rows in Microsoft Excel because of its inability to manage large amounts of data. Because the Cyclistic dataset has more than 5.6 million rows, it is essential to use a platform like BigQuery that supports huge volumes of data.
### Combining the Data
R Query: load data and combine data set .r
12 CSV files are uploaded as tables in the dataset '2022_tripdata'. Another table named "combined_data" is created, containing 5,667,717 rows of data for the entire year. 
### Data Exploration
R Query: Clean and analyse data set.r
Before cleaning the data, I am familiarizing myself with the data to find the inconsistencies.  

### Data Cleaning
R Query: Clean and analyse data set.r
1. All the rows having missing values are deleted.  
2. 3 more columns ride_length for duration of the trip, day_of_week and month are added.  
3. Trips with duration of less than a minute and longer than a day are excluded.
4. A total of 1,375,912 rows are removed in this step.

## Analyze and Share
![image](https://github.com/ibrahimibyy/Google-data-cyclstic-case-study/assets/138511688/96170b23-422e-4a1e-8e4a-d8c65ff62ecd)



I created a chart that shows the number of bike rides taken each month, separated by the type of rider (member or casual). I found that casual riders tend to take more bike rides during the summer months, particularly in July and August. On the other hand, members tend to take more bike rides than casual riders from September to May. Additionally, member usage remained fairly consistent from May to October, while casual riders' usage varied a lot during that same time period.


![image](https://github.com/ibrahimibyy/Google-data-cyclstic-case-study/assets/138511688/057cdc06-55cd-4500-b8d1-ffe720096e4a)



Refining the data based on seasons offers a broader perspective. Summer emerges as the peak season with the highest usage among all users, accounting for 2,353,948 rides. Following this, fall records 1,745,818 rides, trailed by spring with 1,288,747 rides, and winter with 466,581 rides.



![image](https://github.com/ibrahimibyy/Google-data-cyclstic-case-study/assets/138511688/9b718ac0-aadc-416a-ae11-9beeae333d23)


Casual riders utilized all three types of bikes, with 1,233,228 rides on classic bicycles, 273,550 on docked bicycles, and 1,048,653 on electric-assisted bicycles. Among members, there were 1,980,105 rides on classic bicycles and 1,319,558 rides on electric-assisted bicycles. There is no available data indicating the use of docked bicycles by members.



## summary and act 

Here are the refined recommendations:


Casual riders prefer biking leisurely throughout the day, especially on weekends during the warmer seasons like summer and spring. They tend to embark on longer rides but less frequently compared to members, often starting and ending near recreational spots.

To convert casual riders into members, marketing strategies could focus on targeting them at popular tourist and recreational locations during spring and summer. Additionally, offering seasonal or weekend-only memberships tailored to their peak activity times may attract them. Discounts for longer rides could also serve as an incentive for casual riders and encourage members to extend their ride durations.
1. Strategically design riding packages that coincide with recreational activities, weekend contests, and summer events. Introduce exclusive discounts and promotional offers during these occasions to entice casual riders towards acquiring annual memberships.

2. Implement a structured approach by introducing seasonal membership packages tailored to accommodate the preferences of casual riders. This initiative allows for flexibility and encourages participation by offering membership options for specific durations, thereby catering to individuals who may be hesitant to commit to an annual subscription.

3. Optimize promotional efforts by strategically targeting casual riders during peak activity periods and at key stations:

   - Focus promotional activities predominantly on weekends.
   - Identify high-traffic months such as February, June, and July for intensified promotional campaigns.
   - Concentrate promotional materials and campaigns at strategic stations including Streeter Dr & Grand Ave, Lake Shore Dr & Monroe St, and Millennium Park.
