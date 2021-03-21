USE db_hotels;

CREATE TABLE clients(

	client_id SMALLINT UNSIGNED AUTO_INCREMENT,
    pais_origen_id TINYINT UNSIGNED,
    nom VARCHAR(30),
	cognom1 VARCHAR(35),
	sexe CHAR(1),
	data_naixement DATE,
    CONSTRAINT PK_clients PRIMARY KEY (client_id),
    CONSTRAINT FK_clients_paisos FOREIGN KEY (pais_origen_id)
			REFERENCES paisos (pais_id));