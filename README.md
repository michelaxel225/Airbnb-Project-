# Team1_Project2

## Project Proposal
How would you like to have a travel tool or guide that provides all relevant information when booking an Airbnb  through one database? Using data from Kaggle and web-scraping on Airbnb, we were able to obtain information about many current Airbnb bookings available on the website in a variety of cities. With the combined data information from crime, weather, state, osrm, and google nearby API’s, makes the data more detailed. The data was loaded using SQL and MongoDB which created a relationship and non-relational databases containing all important information. The database allows for a quick search and more efficient booking. Customers can use it to find an ideal Airbnb location. The database will provide a fast and smooth process to access relevant information. Customers will be satisfied with the experience from the start of their Airbnb experience 

## Extraction Process:
1. The extract process includes the original data sources and how the data were formatted at a professional level. Sources such as csv files, APIs, and web scraping were used in order to get the data.
2. First, an Airbnb csv file from kaggle.com was used and uploaded to pandas for it to read and put it in a dataframe. The file was cleaned. Any null and duplicate values were removed. The cleaned dataset was named “usairbnb2020.csv”.
3. The usaairbnb2020 data provided two variables that could be used as keys – city of the Airbnb location and the customer ID of that Airbnb location.
4. To enrich this data, APIs were used to get more information on the cities.<br />
    &nbsp;&nbsp;&nbsp;a. Weather API to show max temperatures, humidity, cloudiness, and wind speed in order to show people what the weather would look like at their possible destination (weather.csv).<br />
    &nbsp;&nbsp;&nbsp;b. Crime API to show the crime rates so people can know how safe the places people might be considering traveling to are (crime.csv).<br />
    &nbsp;&nbsp;&nbsp;c. Osrm API to calculate the distance from the Airbnb to the city center (OSRM_df.csv).<br />
    &nbsp;&nbsp;&nbsp;d. Google API to show people the airport they would probably want to fly into along with ratings of the airport (cities_pd.csv).<br />
    &nbsp;&nbsp;&nbsp;e. State API to get state information in order to be able to relate all our data (state.csv).<br />
5. Additionally, in the extraction process, the web scraping was done from the Airbnb website after the API.

## Transform Process:
1. The transform process explains what data clearing or transforming was required at a professional level. 
2. To transform the data, all of the data was put into a csv file and pandas was used to do some simple cleaning of our data.
3. The data from Kaggle, usairbnb2020.csv, was very large. It was split into three different datasets.<br />
    &nbsp;&nbsp;&nbsp;a. The first, ID.csv, had the customer ID and name and the Airbnb ID and host name. We deleted all missing and duplicated rows.<br />
    &nbsp;&nbsp;&nbsp;b. The second, room.csv, had the customer ID, room type, room price, minimum nights per booking, the availability of the room out of the entire year, the total number of reviews, and the number of reviews per month.<br />
    &nbsp;&nbsp;&nbsp;c. The third, which retained the original name of usairbnb2020.csv, had information on the location of the Airbnb and the reviews, plus some additional information from the state API.<br />
4. The next dataset was weather.csv, it provided the information from the weather API on the cities of the Airbnb locations.
5. Another dataset, crime.csv, provided the total robbery, homicide, burglary, and theft cases from the crime API.<br />
    &nbsp;&nbsp;&nbsp;a. However, since the crime API only gave information for each state, the state information was used instead of the city information.<br />
    &nbsp;&nbsp;&nbsp;b. Additionally, these total cases were changed into rates divided by the state population, obtained by the state API.<br />
6. The osrm API, whose information was put into OSRM_df.csv, was very slow.<br />
    &nbsp;&nbsp;&nbsp;a. It was only used for a small number of locations, randomly sampled, from the usairbnb2020 data.<br />
    &nbsp;&nbsp;&nbsp;b. The number of minutes and distance from the city’s center was only kept from this dataset.<br />
7. The cities_df.csv data, obtained from Google’s nearby search API, contains city, state, location of the Airbnb, location and address of the nearest airport, and the airport’s rating.
8. The last dataset was the airbnb2022.csv data, from web scraping on the Airbnb website. We didn’t really need to alter this data, since we only web scraped what we needed. In the end, we reduced the columns to only the ones that were needed and renamed our columns to make them easier to load into our databases. 


## Loading Process:
1. The loading process explains the final database, tables/collections, and why the topic was chosen at a professional level. 
2. After the transformation of the data, we created the schema.
3. It  has 7 datatables in total, and  each one has its own primary key. 
4. The ident table (ID.csv), had the ID of the customer as the primary key. This key was used as a foreign key for the room table (room.csv), the usairbnb2020 table (usairbnb2020.csv), 
5. The weather table (weather.csv) had “city” as its primary key. This is the foreign key for the osrm table (OSRM_df.csv) and usairbnb2020 table. The osrm table has its own primary key, the sample ID, which is just the index of the sample. 
6. The crime table (crime.csv) had a compound primary key of both the state abbreviation and the state. These are used as the foreign keys for the cities table and usairbnb2020 table. 
7. The usairbnb2020 table had customer ID as its own primary key, and had all the geographical information on the airbnb locations. 
8. Lastly, the cities table (cities_df.csv) has the city as its primary key, and has the city and airport information. 
9. This was all saved as a SQL database, and a diagram was made using quickdatabasediagrams.com, shown below. The web scraping data was saved into a MongoDB database, also shown below.

![SQL database](https://user-images.githubusercontent.com/105513598/196310412-1f6d46ec-aa66-4344-91d6-734dbb9aca7c.png)


![MongoDB](https://user-images.githubusercontent.com/105513598/196310435-bcc54a6f-8601-46fe-935c-ebbec7ea8137.png)






## References 
https://www.kaggle.com/datasets/kritikseth/us-airbnb-open-data <br />
https://openweathermap.org/api <br />
https://www.airbnb.com <br />
https://crime-data-explorer.fr.cloud.gov/pages/docApi <br />
https://project-osrm.org/docs/v5.24.0/api/#route-service <br />
https://developers.google.com/maps/documentation/places/web-service/search-nearby#PlaceSearchRequests <br />
https://nominatim.org/release-docs/develop/api/Overview/

