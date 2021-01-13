## %######################################################%##
#                                                          #
####               Whitespace - your turn               ####
#                                                          #
## %######################################################%##

# - Import the Marine Protected Areas data (MPAS-your.csv) from the previous lesson
# - check the Country variable for leading or trailing whitespace
# - Remove it if necessary.

# load packages -----------------------------------------------------------
library(readr)
library(stringr)
library(dplyr)

# import data -------------------------------------------------------------
MPAs <- read_csv("data/MPAS-your.csv", trim_ws = FALSE)


# check for whitespace ----------------------------------------------------
MPAs %>%
  mutate(
    leading_ws = str_detect(Country, "^ "),
    trailing_ws = str_detect(Country, " $")
  ) %>%
  select(Country, leading_ws, trailing_ws)

# remove whitespace -------------------------------------------------------
MPAs <- MPAs %>% mutate(Country = str_squish(Country))

# check if whitespace was removed
MPAs %>%
  mutate(
    leading_ws = str_detect(Country, "^ "),
    trailing_ws = str_detect(Country, " $")
  ) %>%
  select(Country, leading_ws, trailing_ws)
