USE db_hotels;

CREATE TABLE restaurants(
	restaurant_id SMALLINT UNSIGNED AUTO_INCREMENT,
    nom VARCHAR(50),
    estrella_mich TINYINT UNSIGNED,
    puntuacio TINYINT UNSIGNED,
    tipus CHAR(1),
    descripcio VARCHAR(60),
    adreca VARCHAR(150),
    poblacio_id SMALLINT UNSIGNED,
    geocalitzacio POINT,
    web VARCHAR(30),
    CONSTRAINT PK_restaurants PRIMARY KEY (restaurant_id),
    CONSTRAINT FK_restaurants_poblacions FOREIGN KEY (poblacio_id)
		REFERENCES poblacions (poblacio_id));
        
CREATE TABLE provincies(
	
    provincia_id SMALLINT UNSIGNED AUTO_INCREMENT,
    nom VARCHAR(50),
    CONSTRAINT PK_provincies PRIMARY KEY (provincia_id));
    
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
            
ALTER TABLE poblacions

	ADD COLUMN provincia_id SMALLINT UNSIGNED
			AFTER poblacio_id,
    ADD CONSTRAINT FK_poblacions_provincies FOREIGN KEY (provincia_id)
			REFERENCES provincies (provincia_id);
            
INSERT INTO provincies (provincia_id,nom)
	VALUE (1,'Barcelona'),(2,'Girona'),(3,'Tarragona'),(4,'Lleida');