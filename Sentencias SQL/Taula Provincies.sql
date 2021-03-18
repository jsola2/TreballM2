USE db_hotels;

CREATE TABLE provincies(
	
    provincia_id SMALLINT UNSIGNED AUTO_INCREMENT,
    nom VARCHAR(50),
    CONSTRAINT PK_provincies PRIMARY KEY (provincia_id));