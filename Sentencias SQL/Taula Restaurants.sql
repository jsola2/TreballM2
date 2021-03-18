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