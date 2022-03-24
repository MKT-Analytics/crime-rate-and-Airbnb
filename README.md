# Neighborhood crime influence on AirBnB listings

Investigating the influence of crime rate in New York City on the number of AirBnB listings per neighberhood.

## Research motivation
The growth in popularity of peer-to-peer rental platforms such as AirBnB in recent years has brough several benefits but also concerns to the neighbourhoods. One of the major concerns is the crime rate in the neighbourhoods around AirBnB rental properties. Not only the people living in these areas get affected in terms of their safety, but also crime has to be shown to have a negative effect on property values and businesses (Lens and Meltzer, 2016). Thefore, it is important to investigate how the growth of AirBnB affects the crime rate. For the purpose of this study, an example of in New York City will be used. The data on AirBnB listings in NY City is available on Inside AirBnB and the complaint data reported to the New York City Police is available on NYC Open Data.

## Methodology
In order to properly investigate the influence of neighboorhood crime on the number of AirBnB listings, the dataset of AirBnB listings and a dataset of neighboorhood crime in New York City need to be combined. The listings and crimes are grouped per neighboorhood. As regarding the listings, the listing id's and date are used with their first and last available date in order to see when aparticular was removed. The data from the neighboorhood crime dataset is also cleaned. A selection of relevant variables is made. Our chosen statistical method for this assignment is a multiple linear regression. Linear regression analysis is the process of using various of statistical methods that are used to approximately calculate the relationships between dependent and independent variables. Using a multiple linear regression analyis, we aim to estimate to what extent the independent variables CMPLNT_NUM,ADDR_PCT_CD,BORO,CMPLNT_FR_DT,CMPLNT_TO_DT,CRM_ATPT_CPTD_CD,KY_CD,LAW_CAT_CD,OFNS_DESC,RPT_DT,Latitude,Longitude,RPT_DT influences the dependent variable, number of listings of an AirBnb. The descriptions of the aforementioned independent variables can be found in the Rmarkdown file. The output of the regression provides   insights into to what extent neighbourhood crime influences Airbnb listings in New York City. 



 




 
Regression analysis.

*First, introduce and motivate your chosen method, and explain how it contributes to solving the research question/business problem. 
The investigated time span is from X till X. 
All data is daily/monthly etc. 


 
*-total amount of listings per neighborhood (crime and listings) 
-looked at the type of crime 
-look into the effect of different type of crime on the listings

*Possible Sub-questions to investigate:
Investigating the cost/benifit analysis of growing number of Airbnb listings
Are the owners of Airbnb listings actual residents of the neighborhoods they list? 
Are they outsiders to whom profits are siphoned out of the community?
Do the dollars generated by users of Airbnbs outweigh any possible expenses that may come with a possible greater vulnerability to crime?

## Conclusion
Second, summarize your results concisely. Make use of subheaders where appropriate.* 

## Repository overview
├── README.md
├── data
├── gen
│   ├── data-preparation
│   └── paper
└── src
    ├── analysis
    ├── data-preparation
    └── paper
<img width="300" alt="2022-03-23 (2)" src="https://user-images.githubusercontent.com/99139820/159773215-3593c249-a3f0-439d-868b-647ddd749f69.png">




## Running instructions
*Explain to potential users how to run/replicate your workflow. If necessary, touch upon the required input data, which secret credentials are required (and how to obtain them), which software tools are needed to run the workflow (including links to the installation instructions), and how to run the workflow.*



## Sources
Lens, M. C. and Meltzer, R. (2016). Is crime bad for business? crime and commercial property values in new york city. Journal of Regional Science, 56(3):442-470.

Related article: https://thecrimereport.org/2021/08/06/is-there-a-link-between-airbnb-and-neighborhood-crime-rates/#:~:text=An%20earlier%20study%20of%20Airbnb,types%2C%20rather%20than%20entire%20homes.


## About
This projet was done for the course 'Data Preparation and Workflow Management' at Tilburg University on the datasets of ´Inside Airbnb´.
