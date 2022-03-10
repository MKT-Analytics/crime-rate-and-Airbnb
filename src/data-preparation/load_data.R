calendar <- read.csv("./gen/data-preparation/input/dataset1.csv")
listings <- read.csv("./gen/data-preparation/input/dataset2.csv")
neighbourhoods <- read.csv("./gen/data-preparation/input/dataset3.csv")
crime_data <- read.csv("./gen/data-preparation/input/dataset4.csv")


# Save data
save(calendar,file="./gen/data-preparation/temp/dataset1.RData")
save(listings,file="./gen/data-preparation/temp/dataset2.RData")
save(neighbourhoods,file="./gen/data-preparation/temp/dataset3.RData")
save(crime_data,file="./gen/data-preparation/temp/dataset4.RData")