## %######################################################%##
#                                                          #
####               Letter case - your turn                ####
#                                                          #
## %######################################################%##


# Import the Marine Protected Areas dataset (MPAS-your.csv)
# Summarize the number of Marine Protected Areas by country (Country full).

# load packages -----------------------------------------------------------
library(readr)
library(stringr)
library(dplyr)
library(unheadr)
library(janitor)
library(snakecase)

# import data -------------------------------------------------------------
MPAs <- read_csv("data/MPAS-your.csv") %>%
  mash_colnames(1) %>%
  clean_names()

# clean strings and summarize ---------------------------------------------
MPAs %>%
  mutate(country_full = to_title_case(country_full, parsing_option = 0)) %>%
  count(country_full, name = "number_of_MPAS", sort = TRUE) %>%
  na.omit()
