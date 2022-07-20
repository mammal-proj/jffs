## code to prepare `sealions` dataset


# Load libraries ------------------------------------------------------------------------------

library(data.table)

# Load dataset --------------------------------------------------------------------------------

seals <- data.table::fread("data-raw/historicos.csv", na.strings = c("", "nan", "NA"))

# Further processing --------------------------------------------------------------------------

# Non-numeric columns
ind <- seals[, names(.SD), .SDcols = !is.numeric]
lapply(
  X = seals[, ..ind],
  FUN = unique
)
seals[, (ind) := lapply(.SD, as.factor), .SDcols = ind]

# Exporting the dataset -----------------------------------------------------------------------

usethis::use_data(seals, overwrite = TRUE)
