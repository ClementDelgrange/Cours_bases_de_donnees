-- Script de création des relations

CREATE TABLE hotel
(
	id 			integer PRIMARY KEY, 
	nom	 		varchar(50), 
	categorie 	integer, 
	region 		varchar(50)
);

CREATE TABLE chambre
(
	id_hotel  	integer,
	num   		integer,
	nb_lits 	integer NOT NULL,
	CONSTRAINT 	"pk_id_hotel_num" PRIMARY KEY (id_hotel,num),
	CONSTRAINT 	"fk_id_hotel" FOREIGN KEY (id_hotel) REFERENCES hotel(id)
);

CREATE TABLE client
(
	id 			integer PRIMARY KEY, 
	nom    	 	varchar(25) NOT NULL,
	adresse 	varchar(25),
	tel 		varchar(10)

);

CREATE TABLE resa
(
	id_client  	integer,
	id_hotel  	integer,
	num_chambre integer,
	date_deb  	date,
	date_fin  	date NOT NULL,
	nb_pers  	integer,
 CONSTRAINT 	"pk_id_client_id_hotel_num_chambre_date_deb" PRIMARY KEY (id_client,id_hotel,num_chambre,date_deb),
 CONSTRAINT 	"fk_id_client" FOREIGN KEY (id_client) REFERENCES client(id),
 CONSTRAINT 	"fk_id_hotel_num_chambre" FOREIGN KEY (id_hotel,num_chambre) REFERENCES chambre(id_hotel,num)
);