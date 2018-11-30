#                       Rafael Azcona
#          ~Milestone 8 for Statistical Inference Project.
# The following r code reads the csv datafile and computes Regression analysis
#                 from the dataset googleplystore.csv.

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

googlePlayStore.lm <- lm(Rating~Installs, data = final_data)
coef(googlePlayStore.lm)

# The above code computes the regression line for Rating and Installs Rating being the dependant 
# variable and Installs being the independant variable

plot(Rating~Installs, data = final_data, xlab = "Number of Installs per App", ylab = "App Ratings", main= "Regression analysis of Rating~Installs", ylim = c(0, 5))
abline(coef(googlePlayStore.lm), col = "red")

#The above code makes a scatterplot of the rating vs installs and plots the regression line

hist(residuals(googlePlayStore.lm), col = "blue", main = "Residuals for Google Play Store Dataset", xlab = "Residuals")

#The above code plots a histogram of the residuals of the regression analasis. 

predict(googlePlayStore.lm, newdata = data.frame(Installs = c(1000000, 10000000, 100000000)))

#The above code predicts the rating depending number of installs based on the regression model.