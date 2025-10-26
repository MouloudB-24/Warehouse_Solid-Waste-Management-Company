CREATE TABLE IF NOT EXISTS MyDimDate (
	date_id INT PRIMARY KEY,
	year INT NOT NULL,
	quarter INT NOT NULL,
	quater_name VARCHAR(2) NOT NULL,
	month INT NOT NULL,
	month_name VARCHAR(20) NOT NULL,
	week_day INT NOT NULL,
	weekday_name VARCHAR(20) NOT NULL,
	day INT NOT NULL
);


CREATE TABLE IF NOT EXISTS MyDimWaste (
	waste_id INT PRIMARY KEY,
	waste_type VARCHAR(255) NOT NULL
);


CREATE TABLE IF NOT EXISTS MyDimZone (
	zone_id INT PRIMARY KEY,
	collection_zone VARCHAR(255) NOT NULL,
	city VARCHAR(255) NOT NULL
);


CREATE TABLE IF NOT EXISTS MyFactTrips (
	trip_id INT PRIMARY KEY,
	date_id INT NOT NULL,
	Waste_id INT NOT NULL,
	zone_id INT NOT NULL,
	waste_collection_in_tons DECIMAL(10, 2) NOT NULL,
	FOREIGN KEY (date_id) REFERENCES MyDimDate(date_id),
	FOREIGN KEY (waste_id) REFERENCES MyDimWaste(waste_id),
	FOREIGN KEY (zone_id) REFERENCES MyDimZone(zone_id)
);

