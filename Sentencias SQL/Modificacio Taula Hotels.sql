USE db_hotels;

ALTER TABLE hotels
	
    ADD COLUMN puntuacio TINYINT
		AFTER categoria,
	ADD COLUMN geocalitzacio POINT
		AFTER adreca,
	ADD COLUMN tipus CHAR(1)
		AFTER puntuacio,
    ADD COLUMN descripcio VARCHAR(60)
		AFTER tipus,
	ADD COLUMN web VARCHAR(70);