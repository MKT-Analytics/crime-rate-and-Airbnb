# Download dataset 1 - 	Detailed Calendar Data for listings in New York City
download.file('http://data.insideairbnb.com/united-states/ny/new-york-city/2021-12-04/data/calendar.csv.gz','./data/dataset1/dataset1.csv')

# Download dataset 2 - 	Summary information and metrics for listings in New York City
download.file('http://data.insideairbnb.com/united-states/ny/new-york-city/2021-12-04/visualisations/listings.csv','./data/dataset1/dataset2.csv')


# Download dataset 3 - 	Neighbourhood list for geo filter. Sourced from city or open source GIS files.
dir.create('./data/dataset3')
download.file('http://data.insideairbnb.com/united-states/ny/new-york-city/2021-12-04/visualisations/neighbourhoods.csv','./data/dataset1/dataset3.csv')


# Download dataset 4 - 	NYPD Complaint Data Historic
#This dataset includes all valid felony, misdemeanor, and violation crimes reported to the New York City Police Department (NYPD) from 2006 to the end of last year (2019).
dir.create('./data/dataset4')
download.file('https://data.cityofnewyork.us/api/views/qgea-i56i/rows.csv?accessType=DOWNLOAD','./data/dataset2/dataset4.csv')

