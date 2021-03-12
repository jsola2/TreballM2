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
            
CREATE TABLE clients(

	client_id SMALLINT UNSIGNED AUTO_INCREMENT,
    nom VARCHAR(30),
	cognom1 VARCHAR(35),
	sexe CHAR(1),
	data_naixement DATE,
    pais_origen_id TINYINT UNSIGNED,
	CONSTRAINT PK_clients PRIMARY KEY (client_id),
    CONSTRAINT FK_clients_paisos FOREIGN KEY (pais_origen_id)
			REFERENCES paisos (pais_id));

INSERT INTO provincies (provincia_id,nom)
	VALUE (1,'Barcelona'),(2,'Girona'),(3,'Tarragona'),(4,'Lleida');

INSERT INTO restaurants (nom,estrella_mich,puntuacio,tipus,descripcio,adreca,poblacio_id,geocalitzacio,web)
	VALUES("Restaurant 'El Dorado'",0,5,'R','Especialitat el marisc','Carrer Vilar Petit, 26',48,POINT(41.679154369927225,2.7793019414821174),'www.sapalomera.cat')
			,('Restaurant Cala Di Napoli',0,4,'R','Italià amb encant i personalitat','Av. Lloret de Mar, 10',48,POINT(41.678154369927225,2.7773019414821174),'www.sapalomera.cat')
            ,('Restaurant Can Masover',0,0,'R','Carns a la brasa i menjar casolà','Carrer del sol, 4',48,POINT(41.679954369927225,2.7794019414821174),'www.sapalomera.cat')
            ,('Restaurante Buggy',0,4,'R','Bona Cuina de plats Mediterranis','Passeig Pau Casals, 49',48,POINT(41.67489896034852, 2.794067089550163),'www.sapalomera.cat')
            ,('Restaurant Club Vela Blanes | Marisquería',0,4,'R','Cuina honesta tradicions mediterranea','Carrer Esplanada del Port, s/n',48,POINT(41.67509450525278, 2.7963317559996845),'www.sapalomera.cat')
            ,('Restaurant & Lounge Club Es Blanc',0,4,'R','Cóctels y entrepans a casa, amb terrassa acristallada',"Carrer del Mirador de s'Auguer, 26",48,POINT(41.67105584764034, 2.790178682298626),'www.sapalomera.cat')
            ,('Can Pelao',0,4,'R','Especialitats en Empanades, Chorrillanas, Pizzes i Burgers.','Passeig Pau Casals, 44',48,POINT(41.674697946209115, 2.7936871917301547),'www.sapalomera.cat')
            ,('Restaurant Sa Malica-Can Ton',0,4,'R','Restaurant de menjar tradicional','Carrer Sant Andreu de la Palomera, 2',48,POINT(41.67139453415585, 2.7906115688751405),'www.sapalomera.cat')
            ,('Massana',1,5,'R','Restaurant de cuina contemporanea europea','Carrer Bonastruc de Porta, 10',30,POINT(41.98507077067925, 2.819446924339902),'www.restaurantmassana.com')
			,('El Celler De Can Roca',3,5,'R',"Restaurant d'alta cuina",'Carrer de Can Sunyer, 48',30,POINT(41.993403440480186, 2.8082665403596474),'cellercanroca.com');

        
INSERT INTO hotels (hotel_id,nom,categoria,puntuacio,tipus,descripcio,adreca,poblacio_id,geocalitzacio,web)
	VALUE(340,'Can Setmanes',2,3,'H','Lloc céntric a Blanes',"Carrer de l'Antiga, 26",48,POINT(41.67514333813768, 2.788883747706718),'www.sapalomera.cat')
			,(341,'Hotel GEM Wellness & Spa',3,3,'H','Hotel modern a la cala de Fenals','Carrer de Josep Maria Sert, 16',49,POINT(41.69828580847444, 2.8376742487237956),'www.sapalomera.cat')
			,(342,'Hotel GHT Oasis Park & SPA',4,3,'H','Hotel turistic a la cala de Fenals','Actor Pere Codina i Mont, 23',49,POINT(41.69921286644889, 2.8327149616919436),'www.sapalomera.cat')
			,(343,'Hostal los Maños',2,3,'H','Lloc familiar, a hon es descansa bé','Av. Joan Carles I, 113',48,POINT(41.684675405523, 2.794312747994083),'www.sapalomera.cat')
			,(344,'Hotel htop Alexis',3,4,'H','Hotel situat a 5 minuts de la platja','Carrer de Marina, 59',49,POINT(41.70319874818448, 2.8545049626828045),'www.sapalomera.cat');

		
SELECT DISTINCT r.nom,r.puntuacio,r.adreca
	FROM restaurants r
WHERE (ST_Distance_Sphere(r.geocalitzacio,POINT(41.64497401406645,2.739888768429011))) < 15000
UNION 
SELECT h.nom,h.puntuacio,h.adreca
	FROM hotels h
WHERE (ST_Distance_Sphere(h.geocalitzacio,POINT(41.64497401406645,2.739888768429011))) < 15000; 

