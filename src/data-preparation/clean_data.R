# Load merged data 
load("./gen/data-preparation/temp/data_merged.RData")

library(data.table)
library(dplyr)

#calendar; dates of listings with availability, price, min and max nights
#does "calendar" need to be changed to "data_merged"?
calendar$date =as.Date(calendar$date, format = "%Y-%m-%d")

#per listing first and last availability date
unique_listings <- unique(calendar$listing_id)
first_availabilty_listings <- aggregate(date ~ listing_id, calendar, function(x) min(x))
last_availabilty_listings <- aggregate(date ~ listing_id, calendar, function(x) max(x))

#read in crime data
#select the relevant columns and place in a new dataframe
crime_sub <- crime[,c('CMPLNT_NUM', 'ADDR_PCT_CD', 'BORO_NM','CMPLNT_FR_DT','CMPLNT_TO_DT','CRM_ATPT_CPTD_CD','KY_CD','LAW_CAT_CD','OFNS_DESC','RPT_DT','Latitude','Longitude')]

#Crimes where the location is not defined neither is a latitude or longitude given
temp <- crime_sub[crime_sub$BORO_NM =='' & (is.na(crime_sub$Latitude) | is.na(crime_sub$Longitude)),]
#delete those from the data
crime_sub <- crime_sub[-c(as.numeric(row.names(temp))),]


#retieve Longitudes and latitudes of the different neighbourhoods
neighbourhoods_coordinates <- crime_sub[,c('BORO_NM','Latitude','Longitude')]
neighbourhoods_coordinates <-na.omit(neighbourhoods_coordinates)
neighbourhoods_lonlat = neighbourhoods_coordinates %>% group_by(BORO_NM) %>% summarise(min_lat = min(Latitude), max_lat =max(Latitude), min_lon= min(Longitude), max_lon= max(Longitude))
neighbourhoods_lonlat <- neighbourhoods_lonlat[-c(1),]


#for crime_sub[crime_sub$BORO_NM =='',] in crime_sub{
#  if (as.numeric(crime_sub$Longitude) < as.numeric(neighbourhoods_lonlat$max_lon) & crime_sub$Longitude > neighbourhoods_lonlat$min_lon & crime_sub$Latitude < neighbourhoods_lonlat$max_lat & crime_sub$Latitude > neighbourhoods_lonlat$min_lat){
#    print(neighbourhoods_lonlat$BORO_NM)
#  }
#}

crime_sub_notreplaced <-crime_sub[!(crime_sub$BORO_NM ==''),]

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



# Save cleaned data
save(df_cleaned,file="./gen/data-preparation/output/data_cleaned.RData")
