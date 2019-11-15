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

# --- Question 7: What was the average number of seats and engines on the planes that left from NYC on July 4? 
flights %>% left_join(planes, by = "tailnum") %>% select(seats, engines, month, day) %>% 
  filter(month == 7, day == 4) %>% 
  mutate(avg_seats = mean(seats, na.rm = TRUE), avg_engine = mean(engines, na.rm = TRUE))

# --- Question 8: How many airlines do not have the word "air" somewhere in their name?
airlines %>% select(name) %>% filter(!str_detect(name, fixed("air", ignore_case = TRUE)))

# --- Question 9: What was the most common plane model to fly out of NYC in October?
planes %>% left_join(flights, by = "tailnum") %>% select(model, month) %>% filter(month == 10) %>%
  count(model) %>% arrange(-n)

# --- Question 10: How many planes (tailnum) only flew one route (flight) but flew that route more than 10 times?
flights %>% select(tailnum, flight) %>% group_by(tailnum) %>%
  summarize(num_routes = n_distinct(flight), n = n()) %>%
  filter(num_routes == 1, n > 10)

# --- Question 11: Which scheduled departure hour had the largest proportion of flights delayed (dep_delay) longer than 5 min?
flights %>% select(hour, dep_delay) %>% group_by(hour) %>%
  summarize(percent_delay = mean(dep_delay > 5, na.rm = TRUE)) %>% 
  top_n(1, percent_delay)

# --- Question 12: Which flight(s) had the greatest scheduled length (time between scheduled departure and arrival)?





