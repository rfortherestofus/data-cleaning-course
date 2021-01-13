## %######################################################%##
#                                                          #
####         Empty rows and columns - your turn         ####
#                                                          #
## %######################################################%##


# Import the Marine Protected Areas dataset (MPAS-your.csv)
# Identify the empty rows and columns, and create a new object with only the empty rows and columns
#  Remove the empty rows and columns

# load packages -----------------------------------------------------------
library(readr)
library(tibble)
library(dplyr)
library(naniar)
library(janitor)
library(unheadr)

# import data ---------------------------------------------------------------
MPAs <- read_csv("data/MPAS-your.csv")

# identify empty rows and columns -----------------------------------------
# empty row ids
empty_rows <- MPAs %>%
  rowid_to_column() %>%
  filter(across(c(-rowid, -`Rank (by extent)`), is.na)) %>%
  pull(rowid)
# empty column names
empty_cols <- MPAs %>%
  select(where(all_na)) %>%
  names()

# object with only empty rows and columns
MPAs %>%
  rowid_to_column() %>%
  select(rowid, empty_cols) %>%
  slice(empty_rows)


# remove empty ------------------------------------------------------------
MPAs %>% remove_empty(which = c("rows", "cols")) # still too many empty rows

MPAs %>%
  remove_empty(which = c("rows", "cols")) %>%
  mash_colnames(1) %>%
  filter(!across(-`Rank (by extent)`, is.na)) # negate the row selection
