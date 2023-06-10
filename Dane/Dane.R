#install.packages("BayesFactor")
library(BayesFactor)

# Podstawowe rzeczy
{
set.seed(123)
M <- 50  # Średnia
SD <- 10  # SD

}

N <- 420 # Liczba osób
d <- 0.20  # Cohen's d effect size

# Generowanie danych i zrobienie testu
{mean_diff <- d * SD
  data <- data.frame(
    participant_id = 1:N,  # Participant IDs
    group = sample(c(1, 2), N, replace = TRUE),
    dependent_variable = NA
  )
data$dependent_variable[data$group == 1] <- rnorm(sum(data$group == 1), M, SD)
data$dependent_variable[data$group == 2] <- rnorm(sum(data$group == 2), M - mean_diff, SD)
ttest <- ttestBF(x = data$dependent_variable[data$group == 1], y = data$dependent_variable[data$group == 2])
bf <- extractBF(ttest)$bf
cat("BF10 = ", bf,
    "\nBF01 = ", 1/bf)
}

#######################################
#     Jak to wygląda w praktyce       #
#######################################

#install.packages("haven")
library(haven)

data <- read_sav("Dane1.sav")

{
  ttest <- ttestBF(x = data$dependent_variable[data$group == 1], y = data$dependent_variable[data$group == 2])
  bf <- extractBF(ttest)$bf
  cat("N = ", nrow(data),
      "\nBF10 = ", bf,
      "\nBF01 = ", 1/bf)
}
  
