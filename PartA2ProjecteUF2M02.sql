USE db_hotels_examen;

-- 1
SELECT nom AS 'poblacio'
	FROM poblacions
WHERE nom LIKE 'A%' OR nom LIKE 'E%' OR nom LIKE'I%' OR nom LIKE 'O%' OR nom LIKE 'U%'
ORDER BY nom ASC;

-- 2
SELECT nom AS 'poblacio'
	FROM poblacions
WHERE SUBSTR(nom,1,1) IN ('A','E','I','O','U','a','e','i','o','u','À','É','È','Í','Ó','Ò','Ú','à','é','è','í','ó','ò','ú')
ORDER BY nom ASC;

-- 3
SELECT COUNT(h1.hab_id) AS 'quantitat'
	FROM hotels h
	INNER JOIN habitacions h1 ON h1.hotel_id = h.hotel_id
WHERE h.hotel_id = 10;

-- 4 
SELECT nom,cognom1,data_naix
	FROM clients 
WHERE DAY(data_naix) = MONTH(data_naix)
ORDER BY client_id;

-- 5 
SELECT h.nom,h.adreca
	FROM hotels h
WHERE h.categoria > 4
ORDER BY h.hotel_id;

-- 6
SELECT h.nom AS hotel,p.nom AS 'poblacio'
	FROM hotels h
	INNER JOIN poblacions p ON p.poblacio_id = h.poblacio_id 
WHERE h.habitacions = (SELECT h1.habitacions
								FROM hotels h1
						WHERE h1.nom = '987 Barcelona') AND h.nom != '987 Barcelona'
ORDER BY h.nom ASC;

-- 7
SELECT ROUND(AVG(DATEDIFF(r.data_fi,r.data_inici)),2) AS nits
	FROM reserves r
	INNER JOIN habitacions h ON h.hab_id = r.hab_id
	INNER JOIN hotels h1 ON h1.hotel_id = h.hotel_id
	INNER JOIN poblacions p ON p.poblacio_id = h1.poblacio_id
WHERE p.nom = 'Lloret de Mar' AND h1.nom = 'HTOP Royal Star';
	
-- 8 
SELECT 	p.nom
		,COUNT(r.reserva_id) AS 'num_reserves'
	FROM reserves r 
	INNER JOIN clients c ON r.client_id = c.client_id
	INNER JOIN paisos p ON p.pais_id = c.pais_origen_id
	WHERE YEAR(r.data_inici) = 2016
	GROUP BY p.nom
	ORDER BY num_reserves DESC
	LIMIT 5;

-- 9
SELECT 	YEAR(data_inici) AS 'any'
		,ROUND(AVG(DATEDIFF(r.data_fi,r.data_inici)),2) AS nits
	FROM reserves r
	INNER JOIN habitacions h ON h.hab_id = r.hab_id
	INNER JOIN hotels h1 ON h1.hotel_id = h.hotel_id
	INNER JOIN poblacions p ON p.poblacio_id = h1.poblacio_id
WHERE p.nom = 'Lloret de Mar' AND h1.nom = 'HTOP Royal Star'
GROUP BY YEAR(data_inici);


/* 10 */ 
SELECT 	p.nom AS 'poblacio'
		,COUNT(h.hotel_id) AS 'quantitat'
	FROM poblacions p
	INNER JOIN hotels h ON p.poblacio_id = h.poblacio_id
	GROUP BY p.nom
ORDER BY quantitat DESC, poblacio ASC;

/* 11 */ 
SELECT COUNT(h.hotel_id) AS 'quantitat'
	FROM hotels h
	WHERE h.categoria = 4 AND h.habitacions IN (SELECT h1.habitacions
												FROM hotels h1 
												WHERE h1.categoria = 4);
	
/* 12 */ 
SELECT DISTINCT c.client_id,c.nom,c.cognom1 
            FROM reserves r
            INNER JOIN clients c ON c.client_id = r.client_id
            WHERE r.client_id IN (SELECT DISTINCT r.client_id 
            FROM reserves r
            WHERE r.data_inici BETWEEN '2014-01-01' AND '2014-12-31') AND r.client_id IN 
            (SELECT DISTINCT r.client_id 
            FROM reserves r
            WHERE r.data_inici BETWEEN '2015-01-01' AND '2015-12-31') AND r.client_id IN 
            (SELECT DISTINCT r.client_id 
            FROM reserves r
            WHERE r.data_inici BETWEEN '2016-01-01' AND '2016-12-31')
            ORDER BY c.client_id;

/* 13 */ 
SELECT DISTINCT MONTH(r.data_inici) AS mes
				,DAY(LAST_DAY(r.data_inici))*qt AS nits
	FROM (SELECT count(h1.hab_id) AS qt
			FROM hotels h
			INNER JOIN habitacions h1 ON h.hotel_id = h1.hotel_id
			WHERE h.nom = 'Catalonia Ramblas'
			ORDER BY h.nom) AS num_hab
			,reserves r
WHERE YEAR(r.data_inici) = 2016
ORDER BY mes ASC;

