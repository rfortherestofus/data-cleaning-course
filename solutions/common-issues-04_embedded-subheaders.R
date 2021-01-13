## %######################################################%##
#                                                          #
####          Missing, implicit, or misplaced           ####
####           grouping variables - your turn           ####
#                                                          #
## %######################################################%##

# Load the `primates2017` dataset bundled with 📦 `unheadr`
# Create a new column that groups the different species by taxonomic family.
# In biology, taxonomic families all end in the suffix "_DAE_"
# How many different ways can you identify the embedded subheaders in these data?


# load packages -----------------------------------------------------------
library(unheadr)
library(dplyr)
library(stringr)

# load data ---------------------------------------------------------------
data("primates2017")

# untangle subheaders to new column ---------------------------------------
primates2017 %>%
  untangle2(regex = "DAE$", orig = scientific_name, new = family)

# How many different ways can you identify the embedded subheaders in these data?
# 2, because families are also the only strings in all upper case
primates2017 %>%
  untangle2(regex = "^[A-Z]+$", orig = scientific_name, new = family) %>%
  mutate(family = str_to_title(family)) # change to title case
