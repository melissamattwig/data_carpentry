#downloaded raw data from the internet into the data_raw folder in this projects directory
download.file(url="https://ndownloader.figshare.com/files/2292169",
              destfile = "data_raw/portal_data_joined.csv")
#loaded the raw data file and named it "surveys"
surveys <- read.csv("data_raw/portal_data_joined.csv")
#can also load via read.table since read.csv is a subfunction of the overall read.table function
#surveys <- read.table(file="data_raw/portal_data_joined.csv", sep=",", header=TRUE)
# head() shows the first 6 lines of the dataset
head(surveys)
# View() opens a window with a nice table. Also capital V.
#specify data frames using []
#Singles out the 200th column of the data set as the object "surveys_200"
surveys_200 <- surveys[200, ]
#factors represent categorical data as integers and each type is called a level
#changing a factor to a character vector is as.character(x)
#this represents a factor vector. levels are male and female, each represented in R as an integer
sex <- factor(c("male", "female", "female", "male"))
#convert factors to characters then to numbers, as converting straight to numbers can change the numbers
year_fct <- factor(c(1990, 1983, 1977, 1998, 1990))
as.numeric(as.character(year_fct))
#better way, converts factor levels to numeric values, then accesses those numeric values using the underlying integers
as.numeric(levels(year_fct))[year_fct]
#str(as.numeric(levels(year_fct))[year_fct]) and str(as.numeric(as.character(year_fct))) yield the same result
#plot factors
plot(surveys$sex)
#take out data on sex so we don't mess up working dataframe, relabel it
sex <- surveys$sex
#levels show that there is an category with missing info
levels(sex)
#rename empty space to undetermined
levels(sex)[1] <- "Undetermined"
#rename M  to Male and F to Female
levels(sex)[2] <- "Female"
levels(sex)[3] <- "Male"
#or together levels(sex)[2:3] <- c("Female", "Male")
#change order to Female, Male, Undetermined
sex <- factor(sex, levels = c("Female", "Male", "Undetermined"))
#best to import data as characters rather than the default factors, only change data to factors when needed
#surveys <- read.csv("data_raw/portal_data_joined.csv", stringsAsFactors = FALSE)

#practice: fix what's weird to get the most accurate data type
country_climate <- data.frame(
  country = c("Canada", "Panama", "South Africa", "Australia"),
  climate = c("cold", "hot", "temperate", "hot/temperate"),
  temperature = c(10, 30, 18, "15"),
  northern_hemisphere = c(TRUE, TRUE, FALSE, "FALSE"),
  has_kangaroo = c(FALSE, FALSE, FALSE, 1))
str(country_climate)

#removed "" so log and numeric vectors are not recognized as characters
#added stringsAsFactors = FALSE
country_climate <- data.frame(
  country = c("Canada", "Panama", "South Africa", "Australia"),
  climate = c("cold", "hot", "temperate", "hot/temperate"),
  temperature = c(10, 30, 18, 15),
  northern_hemisphere = c(TRUE, TRUE, FALSE, FALSE),
  has_kangaroo = c(FALSE, FALSE, FALSE, TRUE), stringsAsFactors = FALSE)

#run str() to see what the classes are
str(country_climate)


#be careful about dates and time; make sure it's in a variable type applicable to the analysis
#ymd() takes a vector representing year, month, and day, and converts it to a date vector
#for example,
my_date <- ymd("2015-01-01")
str(my_date)
#tis a character vector

#put together year, month, and date into one respective vector
paste(surveys$year, surveys$month, surveys$day, sep = "-")
#make is a date
ymd(paste(surveys$year, surveys$month, surveys$day, sep = "-"))
#add to the surveys dataset as it's own column
surveys$date <- ymd(paste(surveys$year, surveys$month, surveys$day, sep = "-"))

#inspect using summary()
summary(surveys$date)
#there are some NAs, so subset na in the dates as missing_dates
missing_dates <- surveys[is.na(surveys$date), c("year", "month", "day")]
#head function shows us the first couple rows in that data
head(missing_dates)
