library(data.table)
library(dplyr)
df_cleaned <- data.frame(fread("../../gen/data-preparation/output/data_cleaned.RData"))

# TO DO: make sure to have the code working directly from the cleaned data

#to compute:
#number of listings per neighbourhood (crime data and airbnb listing)

number_listings <- listings2 %>% 
  group_by(neighbourhood_group) %>% 
  summarise(count = n())

crime_count <-  
  crime_sub_notreplaced %>% 
  group_by(BORO_NM) %>% 
  summarise(count = n())

number_listings$crime_count <- crime_count$count


#crime types by neighbourhood
crime_sub_notreplaced %>% 
  group_by(BORO_NM, LAW_CAT_CD) %>% 
  summarise(count = n())

modelDV1_m1<-lm(number_listings~ ., data=crime_sub )


#check for correlation between different type of crimes and the number of listings in NY
#correlation between listings rates and crimes


