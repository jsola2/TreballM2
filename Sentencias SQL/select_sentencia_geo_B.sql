USE db_hotels;

SELECT DISTINCT r.nom,r.puntuacio,r.adreca
	FROM restaurants r
WHERE (ST_Distance_Sphere(r.geocalitzacio,POINT(41.64497401406645,2.739888768429011))) < 15000
UNION 
SELECT h.nom,h.puntuacio,h.adreca
	FROM hotels h
WHERE (ST_Distance_Sphere(h.geocalitzacio,POINT(41.64497401406645,2.739888768429011))) < 15000; 