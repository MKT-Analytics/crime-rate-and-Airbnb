DATA = ../../data

data/dataset1/dataset1.csv data/dataset2/dataset2.csv: src/data-preparation/download_data.R 
	Rscript src/data-preparation/download_data.R

crime-rate-and-Airbnb/src/data-preparation: clean_data.R 
	R --vanilla < clean_data.R
	
crime-rate-and-Airbnb/src/data-preparation: download_data.R
	R --vanilla < download_data.R
	
crime-rate-and-Airbnb/src/data-preparation: load_data.R 
	R --vanilla < load_data.R
