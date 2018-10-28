#                       Rafael Azcona
#          ~Milestone 3 for Statistical Inference Project.
# The following r code reads the csv datafile and computes the mean and 
# Standard Deviation of atleast 3 numerical data columns. 

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

mean(final_data$Price, na.rm = TRUE)
# The above code computes the mean of the Price column and ignores
# any missing/null data values. Based off of the current datset the 
# mean value = 1.027368.

sd(final_data$Price, na.rm = TRUE)
# this code computes the standard deviation of Price which = 15.9497

mean(final_data$Rating, na.rm = TRUE)
# This code computes the mean of the Rating column which = 4.193338

sd(final_data$Rating, na.rm = TRUE)
# This code computes the standard deviation for Rating which = 0.5374313

mean(final_data$Installs, na.rm = TRUE)
# This code computes the mean of the Installs column = 15465766

sd(final_data$Installs, na.rm = TRUE)
# This code computes the standard deviation = 85033154