SELECT
	d.year,
	s.city,
	s.station_id,
	AVG(f.waste_collected) AS AverageWasteCollected
FROM FactTrips f
INNER JOIN 
	DimStation s ON f.station_id = s.station_id
INNER JOIN 
	DimDate d ON f.date_id = d.date_id
GROUP BY CUBE (
	d.year,
	s.city,
	s.station_id
);