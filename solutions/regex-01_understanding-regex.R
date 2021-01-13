## %######################################################%##
#                                                          #
####   Understanding a regular expression - your turn   ####
#                                                          #
## %######################################################%##

# Write regular expressions to match:
# Test with stringr, regexplain, or a web-based regex tester

# "cute, cuuute, cuuuuuute, and cuuuuuuuuute"
# strings ending in a period
# lowercase strings
# exactly four digits
# strings without the letter s


# load packages -----------------------------------------------------------
library(stringr)
library(regexplain)


# regular expressions -----------------------------------------------------

# "cute, cuuute, cuuuuuute, and cuuuuuuuuute"
str_view(
  string = c("cute", "cuuute", "cuuuuuute", "cuuuuuuuuute"),
  pattern = "cu+te"
)

view_regex(
  text = c("cute", "cuuute", "cuuuuuute", "cuuuuuuuuute"),
  pattern = "cu+te"
)

# strings ending in a period
str_view(
  string = c("toy", "duck", "Small house", "This is cold.", "1998"),
  pattern = ".+\\.$"
)

# lowercase strings
str_view(
  string = c("toy", "WALRUS", "Small house", "This is cold.", "1998"),
  pattern = "^[a-z]+$"
)

# exactly four digits
str_view(
  string = c("toy", "10990", "34", "Small house", "This is cold.", "1998"),
  pattern = "^[0-9]{4}$"
)

# strings without the letter s
str_view(
  string = c("toy", "10990", "34", "Small house", "This is cold.", "1998"),
  pattern = "^[^s]+$"
)
