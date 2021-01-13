## %######################################################%##
#                                                          #
####            Parsing numbers - your turn             ####
#                                                          #
## %######################################################%##

# Import the Marine Protected Areas dataset (MPAS-mine.csv)
# Subset to keep only the MPA names and columns with extent data
# Make the columns that hold the MPA extent into usable numeric variables
# Watch out for decimals

# load packages -----------------------------------------------------------
library(readr)
library(dplyr)
library(unheadr)
library(janitor)
library(stringr)

# import data ---------------------------------------------------------------
MPAs <- read_csv("data/MPAS-your.csv") %>% mash_colnames(1)

# subset and parse --------------------------------------------------------
MPAs_ext <- MPAs %>%
  select(`Protected Area NAME`, matches("^extent", ignore.case = TRUE)) %>%
  remove_empty("rows")

# standardize decimal symbol and parse
MPAs_ext_parsed <- MPAs_ext %>%
  mutate(across(starts_with("Extent"), str_replace, ",", ".")) %>%
  mutate(across(starts_with("Extent"), parse_number))
# check rounding
print(MPAs_ext_parsed$Extent_sqmi, digits = 10)
