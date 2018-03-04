/*
   Commandes de création de la base Films,  testé avec MySQL et PostgreSQL.
   Pour Oracle, il suffit de remplacer le type TEXT par le type LONG dans 
   la table Film.
   Philippe Rigaux, 2004
*/

/* Destruction eventuelle des tables existantes */

DROP TABLE  Notation;  
DROP TABLE  Role;  
DROP TABLE  Film;  
DROP TABLE Artiste;  
DROP TABLE  Internaute;  
DROP TABLE  Pays;  
DROP TABLE  Genre;  

/* Creation des tables                           */   

CREATE TABLE Internaute (email VARCHAR (40) NOT NULL, 
                         nom VARCHAR (30) NOT NULL ,
                         prenom VARCHAR (30) NOT NULL,
                         region VARCHAR (30),
                         CONSTRAINT PKInternaute PRIMARY KEY (email));
 
CREATE TABLE Pays (code    VARCHAR(4) NOT NULL,
                   nom  VARCHAR (30) DEFAULT 'Inconnu' NOT NULL,
                   langue VARCHAR (30) NOT NULL,
                   CONSTRAINT PKPays PRIMARY KEY (code));

CREATE TABLE Artiste  (idArtiste INTEGER NOT NULL,
                       nom VARCHAR (30) NOT NULL,
                       prenom VARCHAR (30) NOT NULL,
                       anneeNaiss INTEGER,
                       CONSTRAINT PKArtiste PRIMARY KEY (idArtiste),
                       CONSTRAINT UniqueNomArtiste UNIQUE (nom, prenom));

CREATE TABLE Film  (idFilm INTEGER NOT NULL,
                    titre    VARCHAR (50) NOT NULL,
                    annee    INTEGER NOT NULL,
                    idMES    INTEGER,
                    genre VARCHAR (20) NOT NULL,
                    /* Remplacer TEXT par LONG pour ORACLE */
                    resume      TEXT,
                    codePays    VARCHAR (4),
                    CONSTRAINT PKFilm PRIMARY KEY (idFilm),
                    FOREIGN KEY (idMES) REFERENCES Artiste,
                    FOREIGN KEY (codePays) REFERENCES Pays);

CREATE TABLE Notation (idFilm INTEGER NOT NULL,
                       email  VARCHAR (40) NOT NULL,
                       note  INTEGER NOT NULL,
                       CONSTRAINT PKNotation PRIMARY KEY (idFilm, email));
					   /*deux colonnes sont utilisées comme clés primaires, 
					   idfilm et email */
CREATE TABLE Role (idFilm  INTEGER NOT NULL,
                   idActeur INTEGER NOT NULL,
                   nomRole  VARCHAR(30), 
                   CONSTRAINT PKRole PRIMARY KEY (idActeur,idFilm),
                   FOREIGN KEY (idFilm) REFERENCES Film,
                   FOREIGN KEY (idActeur) REFERENCES Artiste);

CREATE TABLE Genre (code    VARCHAR (20) NOT NULL,
                    CONSTRAINT PKGenre PRIMARY KEY (code));
