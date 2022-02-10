
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
               values_to = "Value",
               names_prefix = "X")

glimpse(bea_tidy)

bea_tidier <- bea_tidy %>%
  pivot_wider(names_from = Description,
              values_from = Value)

glimpse(bea_tidier)

colSums(is.na(bea_tidier))

bea_tidier <- bea_tidy %>%
  pivot_wider(id_cols = c("GeoFIPS", "Year"),
              names_from = Description,
              values_from = Value)

glimpse(bea_tidier)

colSums(is.na(bea_tidier))


