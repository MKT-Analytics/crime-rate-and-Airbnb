calendar <- read.csv("../../data/Inside-Airbnb/calendar.csv")
listings <- read.csv("../../data/Inside-Airbnb/listings.csv")
listings_2 <- read.csv("../../data/Inside-Airbnb/listings_2.csv")
neighbourhoods <- read.csv("../../data/Inside-Airbnb/neighbourhoods.csv")
crime_data <- read.csv("../../data/NYC-OpenData/NYPD-complaint.csv")


# Save data
dir.create('../../gen/data-preparation/temp/')
save(calendar,file="../../gen/data-preparation/temp/calendar.RData")
save(listings,file="../../gen/data-preparation/temp/listings.RData")
save(listings_2,file="../../gen/data-preparation/temp/listings_2.RData")
save(neighbourhoods,file="../../gen/data-preparation/temp/neighbourhoods.RData")
save(crime_data,file="../../gen/data-preparation/temp/NYPD-complaint.RData")