SELECT
	s.station_id,
	t.truck_type,
	SUM(f.waste_collected) AS TotalWasteCollected
FROM FactTrips f
INNER JOIN 
	DimStation s ON f.station_id = s.station_id
INNER JOIN 
	DimTruck t ON f.truck_id = t.truck_id
GROUP BY GROUPING SETS (
	(s.station_id, t.truck_type),
	(s.station_id),
	(t.truck_type),
	()
)
ORDER BY
s.station_id,
t.truck_type;