USE db_hotels;

INSERT INTO hotels (hotel_id,nom,categoria,puntuacio,tipus,descripcio,adreca,poblacio_id,geocalitzacio,web)
	VALUE(340,'Can Setmanes',2,3,'H','Lloc céntric a Blanes',"Carrer de l'Antiga, 26",48,POINT(41.67514333813768, 2.788883747706718),'www.sapalomera.cat')
			,(341,'Hotel GEM Wellness & Spa',3,3,'H','Hotel modern a la cala de Fenals','Carrer de Josep Maria Sert, 16',49,POINT(41.69828580847444, 2.8376742487237956),'www.sapalomera.cat')
			,(342,'Hotel GHT Oasis Park & SPA',4,3,'H','Hotel turistic a la cala de Fenals','Actor Pere Codina i Mont, 23',49,POINT(41.69921286644889, 2.8327149616919436),'www.sapalomera.cat')
			,(343,'Hostal los Maños',2,3,'H','Lloc familiar, a hon es descansa bé','Av. Joan Carles I, 113',48,POINT(41.684675405523, 2.794312747994083),'www.sapalomera.cat')
			,(344,'Hotel htop Alexis',3,4,'H','Hotel situat a 5 minuts de la platja','Carrer de Marina, 59',49,POINT(41.70319874818448, 2.8545049626828045),'www.sapalomera.cat');
