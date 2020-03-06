library(skimr) #skim()
library(naniar) #miss_var_summary()

df %>% skim()
df %>% miss_var_summary()