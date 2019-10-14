#------ Plotting
library(tidyverse)
library(RColorBrewer)

#------ ggplot

#[PDF pg. 124 of 520]
ggplot(data = mpg) +
  geom_boxplot(
    mapping = aes(
      x = reorder(class, hwy, FUN = median),
      y = hwy
    )
  ) +
  coord_flip() #flip graph 90 degrees 

#[PDF pg. 126 of 520]
hm.palette <- colorRampPalette(rev(brewer.pal(9, 'YlOrRd')), space='Lab')
diamonds %>%
  count(color, cut) %>%
  ggplot(mapping = aes(x = color, y = cut)) +
  geom_tile(mapping = aes(fill = n)) + 
  scale_fill_gradientn(colours = hm.palette(100)) #two categorical heatmap



