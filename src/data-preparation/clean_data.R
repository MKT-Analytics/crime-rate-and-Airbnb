# Loading packages
library(plyr)
library(dplyr)
library(tidyverse)
library(ggplot2)
library(readr)
library(data.table)

# Import raw data
load("../../gen/data-preparation/temp/calendar.RData")
load("../../gen/data-preparation/temp/listings.RData")
load("../../gen/data-preparation/temp/listings_2.RData")
load("../../gen/data-preparation/temp/neighbourhoods.RData")
load("../../gen/data-preparation/temp/NYPD-complaint.RData")


#Data exploration
#Airbnb data
head(listings)
head(listings_2)

unique(listings$neighbourhood_group) 
neighbourhood_count <- listings %>% group_by(neighbourhood_group) %>% summarize(count=n())
percentages <- round(neighbourhood_count$count/sum(neighbourhood_count$count)*100, 2)
percentages <- paste0(percentages, "%")
neighbourhood_count$neighbourhood_group <- paste0(neighbourhood_count$neighbourhood_group, percentages )
pie(neighbourhood_count$count,neighbourhood_count$neighbourhood_group, main= "listings per neighbourhood")


#Crime data 
head(crime_data)

crime_data<- crime_data[,c('CMPLNT_NUM', 'ADDR_PCT_CD', 'BORO_NM','CMPLNT_FR_DT','CMPLNT_TO_DT','CRM_ATPT_CPTD_CD','KY_CD','LAW_CAT_CD','OFNS_DESC','RPT_DT','Latitude','Longitude')]
head(crime_data)

crime_data$CMPLNT_FR_DT = as.Date(crime_data$CMPLNT_FR_DT, format = "%m/%d/%Y")
crime_data$CMPLNT_TO_DT = as.Date(crime_data$CMPLNT_TO_DT, format = "%m/%d/%Y")
crime_data$RPT_DT = as.Date(crime_data$RPT_DT, format = "%m/%d/%Y")

boxplot(crime_data$CMPLNT_FR_DT, main = "Date of occurence for the reported event",
        xlab = "years",
        ylab = "date",
        horizontal = TRUE,
        notch = TRUE
)
boxplot(crime_data$CMPLNT_TO_DT, main = "Ending Date of occurence for the reported event",
        xlab = "years",
        ylab = "date",
        horizontal = TRUE,
        notch = TRUE
)
boxplot(crime_data$RPT_DT, main = "Date event was reported to police",
        xlab = "years",
        ylab = "date",
        horizontal = TRUE,
        notch = TRUE
)


crimes_per_neighbourhood <- crime_data %>% group_by(BORO_NM) %>% summarize(count=n())
percentages <- round(crimes_per_neighbourhood$count/sum(crimes_per_neighbourhood$count)*100, 2)
percentages <- paste0(percentages, "%")
crimes_per_neighbourhood$BORO_NM <- paste0(crimes_per_neighbourhood$BORO_NM, percentages )
pie(crimes_per_neighbourhood$count,crimes_per_neighbourhood$BORO_NM, main= "crimes per neighbourhood")

crime_cat <- crime_data %>% 
  group_by(BORO_NM, LAW_CAT_CD) %>% 
  summarize(count = n())
ggplot(crime_cat,                                     
       aes(x = BORO_NM,
           y = count,
           fill = LAW_CAT_CD)) +
  geom_bar(stat = "identity",
           position = "dodge")+ ggtitle("Crime categories per neighbourhood") +
  xlab("neighbourhood") + ylab("Count") +labs(fill="Category")


#Data Cleaning
#number of missing neighbourhoods
crime_cat
sum(filter(crime_cat, BORO_NM=="")[3])
crime_data_cleaned <-crime_data[!(crime_data$BORO_NM ==''),]


#store the cleaned data
dir.create('../../gen/data-preparation/output/')
save(df_cleaned,file="../../gen/data-preparation/output/data_cleaned.RData")
