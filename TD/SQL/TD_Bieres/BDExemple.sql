-- Script de création des relations

CREATE TABLE bars
(
 nom     varchar(25),
 ville   varchar(25) NOT NULL,
 rue  	 varchar(25) NOT NULL,
 CONSTRAINT "pk_bars" PRIMARY KEY (nom)
);

CREATE TABLE bieres
(
 nom     	varchar(25),
 type   	varchar(25) NOT NULL,
 degre 		real,
 CONSTRAINT "pk_biere" PRIMARY KEY (nom)
);

CREATE TABLE buveurs
(
 nom    	 varchar(25),
 prenom 	 varchar(25) NOT NULL,
 favorite 	 varchar(25) NOT NULL,
 CONSTRAINT 	"pk_buveurs" PRIMARY KEY (nom),
 CONSTRAINT 	"fk_favorite" FOREIGN KEY (favorite) REFERENCES bieres(nom)
);

CREATE TABLE servir
(
 biere  varchar(25),
 bar  	varchar(25) NOT NULL,
 CONSTRAINT 	"pk_biere_bar" PRIMARY KEY (biere,bar),
 CONSTRAINT 	"fk_biere" FOREIGN KEY (biere) REFERENCES bieres(nom),
 CONSTRAINT 	"fk_bar" FOREIGN KEY (bar) REFERENCES bars(nom)
);

CREATE TABLE frequenter
(
 bar    	varchar(25),
 buveur   	varchar(25) NOT NULL,
 CONSTRAINT 	"pk_bar_buveur" PRIMARY KEY (bar,buveur),
 CONSTRAINT 	"fk_bar" FOREIGN KEY (bar) REFERENCES bars(nom),
 CONSTRAINT 	"fk_buveur" FOREIGN KEY (buveur) REFERENCES buveurs(nom)
);


CREATE TABLE aimer
(
 biere     	varchar(25),
 buveur  	varchar(25) NOT NULL,
 CONSTRAINT 	"pk_biere_buveur" PRIMARY KEY (biere,buveur),
 CONSTRAINT 	"fk_biere" FOREIGN KEY (biere) REFERENCES bieres(nom),
 CONSTRAINT 	"fk_buveur" FOREIGN KEY (buveur) REFERENCES buveurs(nom)
);