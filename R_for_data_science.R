#------R FOR DATA SCIENCE------
library(tidyverse)
library(nycflights13)

#------ dplyr Basics [PDF pg. 71 of 520]
#filter() = pick observations by their values
filter(flights, month == 11 | month == 12)
filter(flights, month %in% c(11,12))

#arrange() = reorder the rows
arrange(flights, year, month, day)
arrange(flights, desc(arr_delay))

#select() = pick variables by their names
select(flights, year, month, day)
select(flights, year:day)
select(flights, -(year:day))

select(flights, time_hour, air_time, everything()) #move time_hour and air_time to start of df

#rename() = renames variables, keeps all variables that aren't mentioned
rename(flights, tail_num = tailnum)

#mutate() = create new variables with functions of existing variables
flights_sml <- select(flights,
                      year:day,
                      ends_with("delay"),
                      distance,
                      air_time
) #create smaller dataframe for this example
mutate(flights_sml,
       gain = arr_delay - dep_delay,
       speed = distance / air_time * 60
)

#summarize() = collapse many values down to a single summary
daily <- group_by(flights, year, month, day)
(per_day <- summarize(daily, flights = n()))
(per_month <- summarize(per_day, flights = sum(flights)))
(per_year <- summarize(per_month, flights = sum(flights)))

#count()

#------ Replace unusual values with NA; overwrite original column [PDF pg. 117 of 520]
diamonds2 <- diamonds %>% 
  mutate(y = ifelse(y < 4 | y > 20, NA, y))

#------ tribble()
tribble(
  ~x, ~y, ~z,
  #--|--|----
  "a", 2, 3.6,
  "b", 1, 8.5
) #this is an easy way to make a small tibble

#------ View all columns with print
nycflights13::flights %>%
  print(n = 10, width = Inf)

#------ read_csv() [PDF pg. 152 of 520]
read_csv("a,b,c
1,2,3
4,5,6")
#> # A tibble: 2 × 3
#> a b c
#> <int> <int> <int>
#> 1 1 2 3
#> 2 4 5 6

#-- skip n lines of metadata at the top of the file [PDF pg. 153 of 520]
read_csv("The first line of metadata
The second line of metadata
x,y,z
1,2,3", skip = 2)
#> # A tibble: 1 × 3
#> x y z
#> <int> <int> <int>
#> 1 1 2 3

read_csv("# A comment I want to skip
x,y,z
1,2,3", comment = "#")
#> # A tibble: 1 × 3
#> x y z
#> <int> <int> <int>
#> 1 1 2 3

################################################Start 153 of 520 pdf
