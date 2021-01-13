## %######################################################%##
#                                                          #
####   Working with columns with 'across' - Your Turn   ####
#                                                          #
## %######################################################%##

# Load the midwest data bundled with ggplot2
# Keep only rows for Ohio (OH)
# Subset the 'county' column and all columns that match the string 'pop' (hint: use a selection helper)
# Square-root transform all numeric variables

# load packages -----------------------------------------------------------
library(ggplot2)
library(dplyr)

# load data ---------------------------------------------------------------
data("midwest")

# subset rows and columns -------------------------------------------------
midwest %>%
  filter(state == "OH") %>%
  select(county, matches("pop"))

# transform multiple variables --------------------------------------------
midwest %>%
  filter(state == "OH") %>%
  select(county, matches("pop")) %>%
  mutate(across(where(is.numeric), sqrt))
