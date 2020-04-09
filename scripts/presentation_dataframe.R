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
