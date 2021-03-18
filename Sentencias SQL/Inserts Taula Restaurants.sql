USE db_hotels;

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
