#------R FOR DATA SCIENCE------
library(tidyverse)
library(nycflights13)

#--- dplyr Basics [PDF pg. 71 of 520]
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


