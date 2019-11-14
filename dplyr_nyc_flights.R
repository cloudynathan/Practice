# ---------- R Practice - dplyr and NYC Flights ----------
library(tidyverse)
library(nycflights13)

# --- Question 1: Which destination recieved most flights in June?
flights %>% select(month, dest) %>% count(month, dest) %>% filter(month == 6) %>% arrange(-n)

# --- Question 2: Which carrier had the greatest average distance per flight?
flights %>% select(carrier, distance) %>% group_by(carrier) %>% 
  summarize(avg_distance = mean(distance, na.rm = TRUE)) %>% arrange(-avg_distance)

# --- Question 3: Which flight traveled the fastest (overall miles per hour)?
flights %>% select(flight, distance, hour) %>% mutate(mph = distance/hour) %>% arrange(-mph)

# --- Question 4: What day had the largest average arrival delay for all flights? (only count positive values)
flights %>% select(month, day, arr_delay) %>% filter(arr_delay > 0) %>% group_by(month, day) %>% 
  summarize(avg_arr_delay = mean(arr_delay, na.rm = TRUE)) %>% arrange(-avg_arr_delay)

# --- Question 5: What was the total distance for all flights in January? What was the average distance per flight?
flights %>% select(distance, month) %>% filter(month == 1) %>% group_by(month) %>%
  summarize(sum_distance = sum(distance), avg_distance = mean(distance))

# --- Question 6: What day of the week saw the most flights?
flights %>% select(time_hour) %>% mutate(weekday = weekdays(time_hour)) %>% count(weekday) %>% arrange(-n)

# --- Question 7: What was the average number of seats and engines on the plains that left from NYC on July 4? 








