## Welcome to the page for the Statistical Inference Project

You can view the [Dataset](https://github.com/razcona/Statistical-Inference-Project/tree/master/Data) CSV files for the project in the Data folder.


### Google Play Store App Dataset

The Dataset that I have chosen to perform a statistical analysis for the project is one that contains details on a long list of Apps that are uploaded on the Android market's Google Play Store. There are 13 features that describe a given app.
```markdown

### The features/columns are as follows:

-App: Application name
-Category: Category the app belongs to
-Rating: Overall user rating of the app (as when scraped)
-Reviews: Number of user reviews for the app (as when scraped)
-Size: Size of the app (as when scraped)
-Installs: Number of user downloads/installs for the app (as when scraped)
-Type: Paid or Free
-Price: Price of the app (as when scraped)
-Content: RatingAge group the app is targeted at - Children / Mature 21+ / Adult
-Genres: An app can belong to multiple genres (apart from its main category). For eg, a musical family game will belong to Music, Game, Family genres.
-Last Updated: Date when the app was last updated on Play Store (as when scraped)
-Current Ver: Current version of the app available on Play Store (as when scraped)
-Android Ver: Min required Android version (as when scraped)





```

For more details and the source of the Dataset visit [Kaggle's Google PlayStore Dataset](https://www.kaggle.com/lava18/google-play-store-apps/home).

### Possible predictions and analysis.

With this Dataset, I hope to answer questions such as how to increase the likelyhood of having a successful app on the Google Play Store. Questions such as would uploading my app for free or for a fee(paid) factor in reaching a wider audience or user base. Also, is success predicated on how good the ratings are for the application and would a higher raiting also mean a larger amount of downloads or installs. Lastly, does the content and genre play a huge factor in the success of the Apps.

## Update - Project Milestone 3
### Mean and Standard Deviation

Before I was able to compute simple statistical calculations such as the mean and the standard deviation, I first had to modify the googleplaystore.csv file because two of the 3 numeric columns, the Installs and Price columns were not in numeric format. The Price column was in a currency format which had a '$' character on every price greater than 0. To fix that was simple enough as selecting the entire column and changing the format from currency to numeric. The Installs column however, was a little more complicated. Every entry in the Installs attribute had the number and a '+' sign concatenated at the end of each number denoting an approximation of the number of installs and possibly exceeding that number. In order to fix that I had to use a excel function that allowed me to trim the last character and drag down the function to the rest of the column. This was not the complete solution to the problem. When importing the csv file, R was reading the Installs attribute as Strings, so I had to parse it and convert them into numeric values in R. I was then able to compute the mean and standard deviation. I chose the two mentioned columns of Price and Installs, as well as Rating which are 3 numeric columns in the google play store dataset. The Mean and Standard deviation for each attribute are as follows:

Price Column
- Mean = 1.027368
- SD   = 15.9497

Rating Column
- Mean = 4.193338
- SD   = 0.5374313

Installs Column
- Mean = 15465766
- SD   = 85033154

The updated googleplaystore.csv file and the r file where the code for the calculations are stored can be found in the [data folder](https://github.com/razcona/Statistical-Inference-Project/tree/master/Data) of this project. 
