## %######################################################%##
#                                                          #
####               Duplicates - your turn               ####
#                                                          #
## %######################################################%##

# Load the messy Age of Empires units dataset bundled with `unheadr` (AOEunits_raw)
# Keep only units of Type "Cavalry".
# Identify duplicated records across all variables.
# Remove duplicated records across all variables.


# load packages -----------------------------------------------------------
library(dplyr)
library(unheadr)
library(janitor)

# load data ---------------------------------------------------------------
data("AOEunits_raw")

# filter cavalry ----------------------------------------------------------
cavalry <- AOEunits_raw %>% filter(Type == "Cavalry")

# duplicate records -------------------------------------------------------
# identify
cavalry %>% get_dupes()
# remove
cavalry <- cavalry %>% distinct()
