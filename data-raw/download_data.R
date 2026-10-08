# =============================================================================
# One-time download of the online datasets used in the R Labs
# =============================================================================
#
# Chapters 9 and 13 used to download their data from Yahoo Finance and FRED
# every time the material was rendered. The results then depended on an
# internet connection and could change whenever the data sources were
# updated or revised.
#
# This script downloads the data ONCE with the same commands and sample
# periods as the original R Lab code and saves them as CSV files in the
# project folder. The chapters read these files instead.
#
# Run it from the RStudio project (msTSE.Rproj), so that the working
# directory is the project folder:
#   source("data-raw/download_data.R")
# Then check the printed summaries and commit the created CSV files.
#
# Students do not need this script: they download the CSV files from the
# course website like the other datasets.
# =============================================================================

library(quantmod)

# --- Chapter 9: NASDAQ 100 and 3-month T-bill rate (Yahoo Finance) ----------
# Same sample period as in the text and the R Lab of Chapter 9.
start_date <- "2003-01-01"
end_date   <- "2025-09-30"

# NASDAQ 100 (^NDX) and 3-Month T-Bill (^IRX) data, originally downloaded
# from Yahoo Finance with the quantmod package. Download the files
# NDX_daily.csv and IRX_daily.csv from the course website and place them
# in the same folder as this file.
NDX <- as.xts(read.zoo("NDX_daily.csv", header = TRUE, sep = ","))
IRX <- as.xts(read.zoo("IRX_daily.csv", header = TRUE, sep = ","))

# Alternatively, download the data yourself (requires an internet
# connection; the results may then differ slightly from the material):
# NDX <- getSymbols("^NDX", src = "yahoo", from = start_date, to = end_date, auto.assign = FALSE)
# IRX <- getSymbols("^IRX", src = "yahoo", from = start_date, to = end_date, auto.assign = FALSE)

write.zoo(NDX, file = "NDX_daily.csv", sep = ",")
write.zoo(IRX, file = "IRX_daily.csv", sep = ",")

# --- Chapter 13: consumption, income and population (FRED) ------------------
# PCECC96: Real Personal Consumption Expenditures (quarterly)
# DPIC96:  Real Disposable Personal Income (quarterly)
# POPTHM:  Population, thousands (monthly)
PCECC96 <- getSymbols("PCECC96", src = "FRED", auto.assign = FALSE)
DPIC96  <- getSymbols("DPIC96",  src = "FRED", auto.assign = FALSE)
POPTHM  <- getSymbols("POPTHM",  src = "FRED", auto.assign = FALSE)

# Keep the quarters where all three series are available (as in the R Lab)
# and fix the sample to 1959Q1-2025Q2, the sample used in the text.
PIH_data <- na.omit(merge(PCECC96, DPIC96, POPTHM))
PIH_data <- window(PIH_data, end = as.Date("2025-06-30"))

write.zoo(PIH_data, file = "PIH_FRED_quarterly.csv", sep = ",")

# --- Summaries to compare against the text ----------------------------------
cat("\nNDX_daily.csv:  ", nrow(NDX), "rows,",
    format(start(NDX)), "to", format(end(NDX)), "\n")
cat("IRX_daily.csv:  ", nrow(IRX), "rows,",
    format(start(IRX)), "to", format(end(IRX)), "\n")
cat("PIH_FRED_quarterly.csv:", nrow(PIH_data), "rows,",
    format(start(PIH_data)), "to", format(end(PIH_data)),
    "(the text in Chapter 13 assumes 266 rows, 1959-01-01 to 2025-04-01)\n")
cat("\nNote: FRED revises its data. If the Chapter 13 R Lab results now differ",
    "\nslightly from the numbers in the text, the reason is a data revision.\n")