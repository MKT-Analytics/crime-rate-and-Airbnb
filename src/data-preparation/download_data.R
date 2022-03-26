dir.create('../../data')

# Download dataset 1 - 	Detailed Calendar Data for listings in New York City
dir.create('../../data/Inside-Airbnb')
download.file('http://data.insideairbnb.com/united-states/ny/new-york-city/2021-12-04/data/calendar.csv.gz','../../data/Inside-Airbnb/calendar.csv')

# Download dataset 2 - 	Summary information and metrics for listings in New York City
download.file('http://data.insideairbnb.com/united-states/ny/new-york-city/2021-12-04/data/listings.csv.gz','../../data/Inside-Airbnb/listings.csv')

# Download dataset 3 - 	Summarized information and metrics for listings in New York City
download.file('http://data.insideairbnb.com/united-states/ny/new-york-city/2021-12-04/visualisations/listings.csv','../../data/Inside-Airbnb/listings_2.csv')

# Download dataset 4 - 	Neighbourhood list for geo filter. Sourced from city or open source GIS files.
download.file('http://data.insideairbnb.com/united-states/ny/new-york-city/2021-12-04/visualisations/neighbourhoods.csv','../../data/Inside-Airbnb/neighbourhoods.csv')

# Download dataset 5 - 	NYPD Complaint Data Historic
dir.create('../../data/NYC-OpenData')
download.file('https://data.cityofnewyork.us/api/views/qgea-i56i/rows.csv?accessType=DOWNLOAD','../../data/NYC-OpenData/NYPD-complaint.csv')

