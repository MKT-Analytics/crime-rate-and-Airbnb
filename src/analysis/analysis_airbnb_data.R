library(data.table)
library(dplyr)
df_cleaned <- data.frame(fread('../../gen/input/crime_data_cleaned.csv'))
listings_2 <- data.frame(fread("../../gen/data-preparation/temp/listings_2.RData"))

years <- c(2016,2017,2018,2019,2020)
number_listings <- listings_2 %>% 
  group_by(neighbourhood_group) %>% 
  summarise(count = n())
names(number_listings)[names(number_listings) == 'count'] <- 'number_of_listings'

for (year in years){
  crime_count <- df_cleaned %>% 
    group_by(BORO_NM) %>% filter(year(CMPLNT_FR_DT) == year) %>%
    summarise(count = n()) 
  number_listings <- cbind(number_listings, crime_count[2])
  names(number_listings)[names(number_listings) == 'count'] <- paste('crime_count_',year)
  number_listings<- cbind(number_listings, crime_count[2]/number_listings$number_of_listings)
  names(number_listings)[names(number_listings) == 'count'] <- paste('crimes_per_listings_',year)
}

View(number_listings)