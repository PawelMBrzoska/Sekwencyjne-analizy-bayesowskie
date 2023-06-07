#install.packages("BayesFactor")
library(BayesFactor)

# Podstawowe rzeczy
{
set.seed(123)
M <- 50  # Średnia
SD <- 10  # SD

}

N <- 100 # Liczba osób
d <- 0.30  # Cohen's d effect size

# Generowanie danych i zrobienie testu
{mean_diff <- d * sd
  data <- data.frame(
    participant_id = 1:N,  # Participant IDs
    group = sample(c(1, 2), N, replace = TRUE),
    dependent_variable = NA
  )
data$dependent_variable[data$group == 1] <- rnorm(sum(data$group == 1), mu, sd)
data$dependent_variable[data$group == 2] <- rnorm(sum(data$group == 2), mu - mean_diff, sd)
ttest <- ttestBF(x = data$dependent_variable[data$group == 1], y = data$dependent_variable[data$group == 2])
bf <- extractBF(ttest)$bf
cat("BF10 = ", bf,
    "\nBF01 = ", 1/bf)
}



library(haven)
write_sav(data, "Dane1.sav")

#######################################
#     Jak to wygląda w praktyce       #
#######################################


data <- read_sav("Dane3.sav")

{
  ttest <- ttestBF(x = data$dependent_variable[data$group == 0], y = data$dependent_variable[data$group == 1])
  bf <- extractBF(ttest)$bf # extract BF
}
print(ttest)
cat("BF10 = ", bf,
    "\nBF01 = ", 1/bf)
