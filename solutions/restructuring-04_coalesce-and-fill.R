## %######################################################%##
#                                                          #
####           Coalesce and Fill - Your Turn            ####
#                                                          #
## %######################################################%##

# Load the fish landings data 'fish-landings.csv'
# Fill the 'Fish' and 'Lake' columns
# Reorder the numeric variables ('Comission reported total' first)
# create a new column, coalescing the three numeric variables

# load packages -----------------------------------------------------------
library(readr)
library(dplyr)
library(tidyr)

# import data -------------------------------------------------------------
fishlandings <- read_csv("data/fish-landings.csv")

# fill and coalesce
fishlandings %>%
  fill(Fish, Lake) %>%
  select(Fish, Lake, Month, `Commission reported total`, `Official total`, `Previous year total`) %>%
  mutate(new_total = coalesce(`Commission reported total`, `Official total`, `Previous year total`))
