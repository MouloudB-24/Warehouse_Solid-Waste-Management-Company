CREATE TABLE IF NOT EXISTS DimDate (
	date_id INT PRIMARY KEY,
	date VARCHAR(12),
	year INT NOT NULL,
	quarter INT NOT NULL,
	quater_name VARCHAR(2) NOT NULL,
	month INT NOT NULL,
	month_name VARCHAR(20) NOT NULL,
	day INT NOT NULL,
	week_day INT NOT NULL,
	weekday_name VARCHAR(20) NOT NULL
);

CREATE TABLE IF NOT EXISTS DimTruck (
	truck_id INT PRIMARY KEY,
	truck_type VARCHAR(255) NOT NULL
);


CREATE TABLE IF NOT EXISTS DimStation (
	station_id INT PRIMARY KEY,
	city VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS FactTrips (
	trip_id INT PRIMARY KEY,
	date_id INT NOT NULL,
	station_id INT NOT NULL,
	truck_id INT NOT NULL,
	waste_collected DECIMAL(10, 2) NOT NULL,
	FOREIGN KEY (date_id) REFERENCES DimDate(date_id),
	FOREIGN KEY (station_id) REFERENCES DimStation(station_id),
	FOREIGN KEY (truck_id) REFERENCES DimTruck(truck_id)
);
