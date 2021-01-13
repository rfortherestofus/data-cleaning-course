## %######################################################%##
#                                                          #
####             Broken values - your turn              ####
#                                                          #
## %######################################################%##

# Load the raw Age of Empires units dataset from csv (aoe_raw.csv)
# Identify the broken values in both the 'Type' and 'Name' columns and unbreak them
# Clean up any separator-related issues arising from the 'unbreaking'

# load packages -----------------------------------------------------------
library(dplyr)
library(unheadr)
library(readr)
library(stringr)

# load data ---------------------------------------------------------------
aoe_raw <- read_csv("data/aoe_raw.csv")

# unbreak -----------------------------------------------------------------
aoe_ub <- aoe_raw %>%
  unbreak_vals("^\\(", ogcol = Name, newcol = Name_ub) %>% # trailing half of broken values
  unbreak_rows("-$", ogcol = Type) # leading half

# cleanup -----------------------------------------------------------------
aoe_ub <- aoe_ub %>% mutate(Type = str_replace(
  string = Type,
  pattern = "- ",
  replacement = " "
))
