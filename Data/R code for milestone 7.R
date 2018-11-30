#                       Rafael Azcona
#          ~Milestone 7 for Statistical Inference Project.
# The following r code reads the csv datafile and computes 3 Hypothesis tests
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

#*****************************Hypothesis Test 1*******************************************
# In the following code we will conduct the Hypothesis test that the 
# game apps are less popular than the communication apps(whats app, we chat, gmail etc...)
# using the installs as the metric that gauges popularity.

gameApps <- subset(final_data, Category == "GAME")
communicationApps <- subset(final_data, Category == "COMMUNICATION")
t.test(gameApps$Installs, communicationApps$Installs, alternative = "less")

# The above code subsets the Game and the Communication category and uses the Installs
# to peroform a one-sided less than t-test.

#****************************Hypothesis Test 2********************************************
# In the following code, similar to the previous code, we will conduct a hypothesis test
# that will tell us whether the Social Apps are less popular than the dating apps using
# the Installs of the apps as a popularity metric

datingApps <- subset(final_data, Category == "DATING")
socialApps <- subset(final_data, Category == "SOCIAL")
t.test(socialApps$Installs, datingApps$Installs, alternative = "less")

# The above code performs a student t-test with the subset of dating apps and social apps with a
# one-sided test of x-y < 0

t.test(socialApps$Installs, datingApps$Installs, alternative = "greater")

# Since the above t-test resulted in a p-value of 1, and we failed to reject null hypothesis,
# the above test will perform a one-sided test where x-y > 0 to confirm that social apps are more
# popular 

#********************************Hypothesis Test 3*******************************************
# In the following code, we conduct a hypothesis test using a student t-test that will tell us whether
# gameApps are on average more expensive than communicationApps.

t.test(gameApps$Price, communicationApps$Price, alternative = "greater")
# above code tests alternate hypothesis is x-y > 0

t.test(gameApps$Price, communicationApps$Price, alternative = "less")
# above code tests alternate hypothesis is x-y < 0

t.test(gameApps$Price, communicationApps$Price)
#above code is default two-sided test x-y != 0

# All three tests are greater than alpha 0.05 therefore we fail to reject null hypothesis
# all three instances