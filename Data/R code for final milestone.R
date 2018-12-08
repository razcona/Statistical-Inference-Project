#                       Rafael Azcona
#          ~Final Milestone for Statistical Inference Project.
# The following r code reads the csv datafile and computes analysis of variance and a chi-squared test
#                 from the dataset googleplystore.csv.

googlePlayStore <- read.csv("~/Documents/data/googleplaystore.csv", stringsAsFactors = FALSE)
num_data <- data.frame(data.matrix(googlePlayStore))
numeric_columns <- sapply(num_data,function(x){mean(as.numeric(is.na(x)))<0.5})
final_data <- data.frame(num_data[,numeric_columns], googlePlayStore[,!numeric_columns])

# In the above code, due to issues with certain numerical columns being
# read as strings in R when reading the csv file, i had to write the above 
# code which does the following:
# ~ Imports the data as character columns
# ~ Creates an instance of the data as numeric columns
# ~ Identifies which columns from the data are numeric
# ~ Merges the numeric and character columns into a final dataset

gamesOnly <- subset(final_data, Category == "GAME")
gameRating.aov <- aov(Rating~Content.Rating, data = gamesOnly)
summary(gameRating.aov)

# Above code takes a subset of App Games only and creates a ANOVA table for Rating~Content.Rating

model.tables(gameRating.aov, "mean")
#above code creates a mean table for every group and grand mean

gamesRating.posthoc <- TukeyHSD(gameRating.aov)
plot(gamesRating.posthoc)
gamesRating.posthoc

# above code creates and plots a posthoc analysis to differences of pairs

#---------------------------------------------------------------------------

# Chisquared analysis

x <- xtabs(~Type + Genres, data = gamesOnly)
x
# creates a contigency table with Type and Genre in order to perform the chisquared test 
# x prints the table

chisq.test(x)
#performs chisquared test for goodness of fit



