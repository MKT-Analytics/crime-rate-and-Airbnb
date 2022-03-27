library(data.table)
library(dplyr)
crime_data_cleaned <- data.frame(fread('../../gen/data-preparation/output/data_cleaned.csv'))
listings_2 <- data.frame(fread('../../gen/data-preparation/temp/listings_2.RData'))


#exploring the crime types by neighbourhood
crime_data_cleaned %>% 
  group_by(BORO_NM, LAW_CAT_CD) %>% 
  summarise(count = n())

#exploring the number crimes per Airbnb listing per each year
#Note: the number of listings across the years doesn't change because that data is provided for the point in time when it was compiled (04 December, 2021) 

years <- c(2016,2017,2018,2019,2020)
number_listings <- listings_2 %>% 
  group_by(neighbourhood_group) %>% 
  summarise(count = n())
names(number_listings)[names(number_listings) == 'count'] <- 'number_of_listings'


for (year in years){
  crime_count <- crime_data_cleaned %>% 
    group_by(BORO_NM) %>% filter(year(CMPLNT_FR_DT) == year) %>%
    summarise(count = n()) 
  number_listings <- cbind(number_listings, crime_count[2])
  names(number_listings)[names(number_listings) == 'count'] <- paste('crime_count_',year)
  number_listings<- cbind(number_listings, crime_count[2]/number_listings$number_of_listings)
  names(number_listings)[names(number_listings) == 'count'] <- paste('crimes_per_listings_',year)
}

View(number_listings)



#only 2020 crime data will be used for the analysis because the Airbnb data represents the most recent listings
years <- c(2020)
number_listings2 <- listings_2 %>% 
  group_by(neighbourhood_group) %>% 
  summarise(count = n())


for (year in years){
  crime_count <- crime_data_cleaned %>% 
    group_by(BORO_NM) %>% filter(year(CMPLNT_FR_DT) == year) %>%
    summarise(count = n()) 
}

View(number_listings2)


#ranking the neighbourhood from the safest to the most dangerous
#based on the number of crimes per neighbourhood in 2020
neigbourhood_names <- c('Staten Island', 'Bronx', 'Queens', 'Brooklyn', 'Manhattan')
count_ordered <- c(353, 1104, 5323, 14716, 16781)

df_ordered <- data.frame(neigbourhood_names, count_ordered)
view(df_ordered)
