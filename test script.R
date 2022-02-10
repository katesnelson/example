
#Cleaning KS_BEA data and EDA

library(tidyverse)

bea <- read.csv("KS_BEA.csv")
  glimpse(bea)
  head(bea)
  tail(bea)

bea <- bea %>%
  slice(1:3604)

tail(bea)

bea_tidy <- bea %>%
  pivot_longer(cols = X2001:X2019,
               names_to = "Year",
               values_to = "Value")
glimpse(bea_tidy)
