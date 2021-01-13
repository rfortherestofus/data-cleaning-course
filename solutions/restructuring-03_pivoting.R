## %######################################################%##
#                                                          #
####             Pivoting Data - Your Turn              ####
#                                                          #
## %######################################################%##

# Load the dog ranks data ("dogranks_your.csv")
# Pivot the data (wide to long and back to wide)

# load packages -----------------------------------------------------------
library(readr)
library(tidyr)

# import data -------------------------------------------------------------
dogranks <- read_csv("data/dogranks-your.csv")

# pivoting ----------------------------------------------------------------
# longer
dogranks_long <- dogranks %>% pivot_longer(
  cols = -c(Breed, Size),
  names_to = "Year",
  values_to = "Popularity.Rank"
)

# back to wide
dogranks_wide <- dogranks_long %>%
  pivot_wider(names_from = "Year", values_from = "Popularity.Rank")
