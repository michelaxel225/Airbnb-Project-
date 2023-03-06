
-- import the csv
-- drop table if exists

DROP TABLE ident ;
DROP TABLE room;
DROP TABLE state;
DROP TABLE weather;
DROP TABLE usairbnb2020;
DROP TABLE crime;
DROP TABLE osmr;
DROP TABLE cities;

cities
-- create the table
-- dataset1: ID 
CREATE TABLE ident(
	id INT NOT NULL UNIQUE,
	id_name VARCHAR  NOT NULL,
	host_id INT NOT NULL,
	host_name VARCHAR  NOT NULL,
	PRIMARY KEY(id)
);

-- dataset2: room
CREATE TABLE room(
	id INT NOT NULL UNIQUE,
	room_type VARCHAR(50)  NOT NULL,
	price INT,
	minimum_nights INT,
	availability_365 INT,
	number_of_reviews INT,
	reviews_per_month DECIMAL(5,2),
	PRIMARY KEY(id),
	FOREIGN KEY (id) REFERENCES ident(id)
);

-- dataset 3: weather
CREATE TABLE weather(
	city VARCHAR(50) NOT NULL,
	lat DECIMAL(5,2),
	lng DECIMAL(5,2),
	temputature DECIMAL(5,2),
	humidity INT,
	cloudiness INT,
	wind_speed DECIMAL(5,2),
	PRIMARY KEY (city)	
);




-- dataset 4: usairbnb2020
CREATE TABLE usairbnb2020(
	year INT, 
	id INT NOT NULL UNIQUE,
	host_id INT NOT NULL,
	city VARCHAR(50) NOT NULL,
	State VARCHAR(50)  NOT NULL,
	latitude DECIMAL(5,2),
	longitude DECIMAL(5,2),
	room_type VARCHAR(50),
	price INT, 
	minimum_nights INT,
	availability INT,
	number_of_reviews INT,
	last_review VARCHAR(50),
	reviews_per_month DECIMAL(5,2),
	calculated_host_listings_count INT,
	availability_365 INT,
	PRIMARY KEY (id),
	FOREIGN KEY (id) REFERENCES ident(id),
	FOREIGN KEY (city) REFERENCES weather(city)
);

-- dataset 5: crime
CREATE TABLE crime(
	state_abbrevation VARCHAR(50) NOT NULL UNIQUE,
	state VARCHAR(50) NOT NULL UNIQUE,
	popultion INT,
	robbery_rate DECIMAL(5,2),
	homicide_rate DECIMAL(5,2),
	burglary_rate DECIMAL(5,2),
	motor_vehicle_theft_rate DECIMAL(5,2),
	PRIMARY KEY (state_abbrevation, state)
);


-- dataset 6: OSMR
CREATE TABLE osmr(
	sample_id INT UNIQUE,
	city VARCHAR(50) NOT NULL,
	duration_min DECIMAL,
	distance_m DECIMAL,
	PRIMARY KEY (sample_id),
	FOREIGN KEY (city) REFERENCES weather(city)
);


-- dataset 7: cities_pd

CREATE TABLE cities(
	city VARCHAR(50) NOT NULL UNIQUE,
	state VARCHAR(50) NOT NULL,
	lat DECIMAL(5,2),
	lng DECIMAL(5,2),
	airport_name VARCHAR(50),
	airport_address VARCHAR(50),
	airport_ratng DECIMAL(5,2),
	PRIMARY KEY (city),
	FOREIGN KEY (city) REFERENCES weather(city),
	FOREIGN KEY (state) REFERENCES crime(state)
);








-- add foreign key
ALTER TABLE usairbnb2020
ADD FOREIGN KEY (state) REFERENCES crime(state);






-- read all of the data 
SELECT * FROM ident;
SELECT * FROM room;
SELECT * FROM state;
SELECT * FROM weather;
SELECT * FROM usairbnb2020;
SELECT * FROM crime;
SELECT * FROM osmr;
SELECT * FROM cities;