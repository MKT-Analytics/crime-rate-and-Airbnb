dir.create('../../data')

# Download dataset 1 - 	Detailed Calendar Data for listings in New York City
dir.create('./data/dataset1')
download.file('http://data.insideairbnb.com/united-states/ny/new-york-city/2021-12-04/data/calendar.csv.gz','./data/dataset1/dataset1.csv')

# Download dataset 2 - 	Summary information and metrics for listings in New York City
dir.create('./data/dataset2')
download.file('http://data.insideairbnb.com/united-states/ny/new-york-city/2021-12-04/visualisations/listings.csv','./data/dataset2/dataset2.csv')


# Download dataset 3 - 	Neighbourhood list for geo filter. Sourced from city or open source GIS files.
dir.create('./data/dataset3')
download.file('http://data.insideairbnb.com/united-states/ny/new-york-city/2021-12-04/visualisations/neighbourhoods.csv','./data/dataset3/dataset3.csv')


# Download dataset 4 - 	NYPD Complaint Data Historic
dir.create('./data/dataset4')
download.file('https://data.cityofnewyork.us/api/views/qgea-i56i/rows.csv?accessType=DOWNLOAD','./data/dataset4/dataset4.csv')
