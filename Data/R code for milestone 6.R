#                       Rafael Azcona
#          ~Milestone 6 for Statistical Inference Project.
# The following r code reads the csv datafile and computes the
# Confidence Intervals of the numerical columns of the dataset googleplystore.csv.

googlePlayStore <- read.csv("~/Documents/data/googleplaystore.csv", stringsAsFactors = FALSE)
num_data <- data.frame(data.matrix(googlePlayStore))
numeric_columns <- sapply(num_data,function(x){mean(as.numeric(is.na(x)))<0.5})
final_data <- data.frame(num_data[,numeric_columns], googlePlayStorep[,!numeric_columns])

# In the above code, due to issues with certain numerical columns being
# read as strings in R when reading the csv file, i had to write the above 
# code which does the following:
# ~ Imports the data as character columns
# ~ Creates an instance of the data as numeric columns
# ~ Identifies which columns from the data are numeric
# ~ Merges the numeric and character columns into a final dataset

mu_hat1 <- mean(final_data$Price, na.rm = TRUE)
mu_hat2 <- mean(final_data$Rating, na.rm = TRUE)
mu_hat3 <- mean(final_data$Installs, na.rm = TRUE)

# The above 3 lines of code computes the mean of the 3 columns and stores
# each one in a variable.

sigma_hat1 <- sd(final_data$Price, na.rm = TRUE)
sigma_hat2 <- sd(final_data$Rating, na.rm = TRUE)
sigma_hat3 <- sd(final_data$Installs, na.rm = TRUE)

# The above 3 lines of code computes the sigma(standard deviation) of the 3
# numerical columns and stores them in a variable.

n <- nrow(final_data)

# This line of code counts the sample size and stores it in variable n

alpha <- 0.05
# This code sets my alpha to 0.05 (95% confidence level)

critical_value <- qt(alpha/2, n-1)
# Computes the zα/2 and stores it in variable critical_value

upperB1 <- mu_hat1 + critical_value * sigma_hat1/sqrt(n)
lowerB1 <- mu_hat1 - critical_value * sigma_hat1/sqrt(n)
upperB2 <- mu_hat2 + critical_value * sigma_hat2/sqrt(n)
lowerB2 <- mu_hat2 - critical_value * sigma_hat2/sqrt(n)
upperB3 <- mu_hat3 + critical_value * sigma_hat3/sqrt(n)
lowerB3 <- mu_hat3 - critical_value * sigma_hat3/sqrt(n)

# Above 6 lines of code computes the confidence intervals of each column 
# and stores them in a variable denoted by upperB and LowerB which refers
# to the upper and lower bounds of the intervals.
