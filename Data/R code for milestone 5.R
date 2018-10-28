#                       Rafael Azcona
#          ~Milestone 5 for Statistical Inference Project.
# The following r code reads the csv datafile and creates a pareto chart 
# for the qualitative columns of the dataset googleplystore.csv.

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

#     Installed the GCC package in R in order to use the pareto.chart() function
pareto.chart(table(final_data$Category), ylab="Frequency", main="Pareto Chart for the App Category in Google Play Store")

# The above line of code creates a pareto chart for the 'Category' column

pareto.chart(table(final_data$Content.Rating), ylab="Frequency", main="Pareto Chart for the App Content Rating in Google Play Store")

# The above line of code creates a pareto chart for the 'Content Rating' column

pareto.chart(table(final_data$Type), ylab="Frequency", main="Pareto Chart for App Type (Free or Paid) in Google Play Store")

# The above line of code creates a pareto chart for the "Type" column