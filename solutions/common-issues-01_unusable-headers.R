## %######################################################%##
#                                                          #
####         Unusable variable names - your turn         ####
#                                                          #
## %######################################################%##

# - Import the Marine Protected Areas data (MPAS-your.csv)
# - Make the variable names usable by placing all header fragments in a single
#   header row
# - Clean the names for consistency

# load packages -----------------------------------------------------------
library(readr)
library(unheadr)
library(dplyr)
library(janitor)

# import data -------------------------------------------------------------
MPAs <- read_csv("data/MPAS-your.csv")

# fix headers -------------------------------------------------------------
MPAs <- MPAs %>% mash_colnames(1) # warning can be ignored

# clean names -------------------------------------------------------------
MPAs <- MPAs %>% clean_names()
