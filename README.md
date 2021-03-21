# TreballM2
<h1>Grup 3</h1>
<ul>
	<li>Àlex Grabulosa Puertas 46286811R</li>
	<li>Jaime Solà Ceada 46721650W</li>
	<li>Manel Colàs Casals 458323339D</li>
</ul>

<h2>Part A.1 - Importació de clients</h2>

<p> En la part A.1 vam decidir tot el grup fer l'opció 2 que consistia en crear un petit programa amb el llenguatge que nosaltres volguéssim i que introduís directament les dades 
dels clients i la relació d'aquests amb les reserves a la base de dades. D'aquesta part es van encarregar l'Àlex i en Manel. Nosaltres vam escollir fer el programa amb java perquè és el llenguatge que més dominem. 
Els fitxers s'anomenen "trabajo" i "Random".</p>
<p>Primer de tot per poder introduir les dades dels clients a la nostra base de dades vam haver de crear la taula Clients que no estava creada i li vam afegir una clau forana
del camp pais_origen_id relacionant-lo amb la taula països. També vam haver de crear una clau forana de client_id a la taula reserves per poder relacionar els clients amb les seves reserves. 
Aquí us deixem una captura de com vam crear la taula clients.</p>

![alt text](https://github.com/jsola2/TreballM2/blob/master/Imatges%20Readme/Taula%20Clients.jpeg)

<p>El nostre primer programa primer realitza la connexió al nostre SGBD amb la IP, el nostre usuari i contrasenya. Després llegeix l'excel anomenat dades_clients-tab i introdueix cada fila en un array.
Després divideix aquest array en diferents posicions dintre del array amb les dades que ens interessa introduir client_id, nom, cognom1, sexe, data_naixement i pais_origen_id. També hem fet
un bucle per canviar la data del format DD/MM/YYYY al format YYYY/MM/DD que és el s'utilitza a les bases de dades. Després utilitzant la
sentència INSERT introduïm les dades a cada un dels camps utilitzant la seva posició en el array creat anteriorment.</p>

<p>El nostre segon programa serveix per introduir les dades del camp client_id a la taula Reserves relacionant-lo així amb una reserva. Segueix la mateixa dinàmica que el programa descrit anteriorment
però amb alguns canvis. Primer realitza la connexió al nostre SGBD amb la IP, el nostre usuari i contrasenya. Li diem el número total de reserves perquè ens posi les dades en totes i utilitzem un bucle while 
perquè que comenci per la primera reserva i acabi amb l'última reserva. Dintre del bucle tenim un random perquè relacioni cada client amb una reserva, també dintre del bucle tenim una sentència UPDATE que 
introdueix un client_id per cada reserva_id utilitzant un WHERE per les reserves.</p>

<h2>Part A.2 - Sentències SQL</h2>

<p>En la Part A.2 havíem de fer les sentències demanades en el qüestionari. D'aquesta part se'n va encarregar en Manel i en Jaime. El fitxer amb totes les sentències demanades s'anomena PartA2ProjecteUF2M02.</p>

<h2>Part B.1 – Incorporació restaurants i geocalització</h2>

<p>En la Part B.1 havím d'introduir a la nostra base de dades cinc restaurants i hotels de Catalunya guardant la seva localització i geolocalització. D'aquesta part es van encarregar en Jaime i l'Àlex.</p>
<p>Vam crear la taula Restaurants que no estava creada a la nostra base de dades i li vam afegir una clau forana de poblacio_id per poder realiconar cada restaurant amb la seva població. Vam crear també la taula
Provincies que no estava creada a la nostra base de dades i vam crear una clau forana a la taula Poblacions amb el camp provincia_id per poder relacionar cada població amb la seva pronvincia. Us deixem una captura de com vam crear la taula Provincies.</p>

![alt text](https://github.com/jsola2/TreballM2/blob/master/Imatges%20Readme/Taula%20Provincies.jpeg)

<p>En la tercera part vam realitzar les sentències SQL demanades. Vam utilitzar el JSON per introduir els restaurants i hotels al HTML. Us deixem aqui una captura.</p>

![alt text](https://github.com/jsola2/TreballM2/blob/master/Imatges%20Readme/Exemple%20JSON.jpeg)

<p>
