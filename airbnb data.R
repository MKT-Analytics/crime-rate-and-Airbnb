setwd("/Users/saadanwar/Documents/uvt/dprep")
library(data.table)
library(dplyr)
calendar <- read.csv("calendar.csv")
#calendar; dates of listings with availability, price, min and max nights
calendar$date =as.Date(calendar$date, format = "%Y-%m-%d")


#per listing first and last availability date
unique_listings <- unique(calendar$listing_id)
first_availabilty_listings <- aggregate(date ~ listing_id, calendar, function(x) min(x))
last_availabilty_listings <- aggregate(date ~ listing_id, calendar, function(x) max(x))


listings <- read.csv("listings.csv") 
listings2 <- read.csv("listings-2.csv")
#same data as listings, but only most relevant variables
neighbourhoods <- read.csv("neighbourhoods.csv")
#which neighbourhoods belongs to which neighbourhood group
reviews<- read.csv("reviews.csv")
#only listing id's and a date
reviews2 <-read.csv("reviews-2.csv")
# note that id here is not the same as id in the listings sheet
# id in listings is the same as id_listings in reviews2

#read in crime data
crime <- read.csv("NYPD_Complaint_Data_Historic.csv")
#select the relevant columns and place in a new dataframe
crime_sub <- crime[,c('CMPLNT_NUM', 'ADDR_PCT_CD', 'BORO_NM','CMPLNT_FR_DT','CMPLNT_TO_DT','CRM_ATPT_CPTD_CD','KY_CD','LAW_CAT_CD','OFNS_DESC','RPT_DT','Latitude','Longitude')]

#Crimes where the location is not defined neither is a latitude or longitude given
temp <- crime_sub[crime_sub$BORO_NM =='' & (is.na(crime_sub$Latitude) | is.na(crime_sub$Longitude)),]
#delete those from the data
crime_sub <- crime_sub[-c(as.numeric(row.names(temp))),]


#Change dates from characters to Date object
crime_sub$CMPLNT_FR_DT = as.Date(crime_sub$CMPLNT_FR_DT, format = "%m/%d/%Y")
crime_sub$CMPLNT_TO_DT = as.Date(crime_sub$CMPLNT_TO_DT, format = "%m/%d/%Y")
crime_sub$RPT_DT = as.Date(crime_sub$RPT_DT, format = "%m/%d/%Y")


#look for outliers in the dates
boxplot(crime_sub$CMPLNT_FR_DT, main = "Date of occurence for the reported event",
        xlab = "years",
        ylab = "date",
        horizontal = TRUE,
        notch = TRUE
)
boxplot(crime_sub$CMPLNT_TO_DT, main = "Ending Date of occurence for the reported event",
        xlab = "years",
        ylab = "date",
        horizontal = TRUE,
        notch = TRUE
)
boxplot(crime_sub$RPT_DT, main = "Date event was reported to police",
        xlab = "years",
        ylab = "date",
        horizontal = TRUE,
        notch = TRUE
)


#to compute:
#number of listings per neighbourhood (crime data and airbnb listing)

#check for correlation between different type of crimes and the number of listings in NY
#correlation between listings rates and crimes

