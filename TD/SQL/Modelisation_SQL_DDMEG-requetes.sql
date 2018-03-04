--Table Buveur--
--Nettoyage
DROP TABLE IF EXISTS Buveur CASCADE;

--Création
CREATE TABLE Buveur (id serial PRIMARY KEY, nom varchar(50), prenom varchar(50), naissance integer, ville varchar(50));

--Insertions
INSERT INTO Buveur (nom, prenom, naissance, ville) VALUES ('Mir', 'Abel', 1990, 'Bordeaux');
INSERT INTO Buveur (nom, prenom, naissance, ville) VALUES ('Bonneau', 'Jean', 1995, 'Paris');
INSERT INTO Buveur (nom, prenom, naissance, ville) VALUES ('Fonfec', 'Sophie', 1989, 'Lille');
INSERT INTO Buveur (nom, prenom, naissance, ville) VALUES ('Deuf', 'John', 1993, 'Toulouse');
INSERT INTO Buveur (nom, prenom, naissance, ville) VALUES ('Covers', 'Harry', 1992, 'Ajaccio');
INSERT INTO Buveur (nom, prenom, naissance, ville) VALUES ('Mousse', 'Emma', 1995, 'Paris');
INSERT INTO Buveur (nom, prenom, naissance, ville) VALUES ('Mir', 'Jade', 1996, 'Bordeaux');



--Table Cepage--
--Nettoyage
DROP TABLE IF EXISTS Cepage CASCADE;

--Création
CREATE TABLE Cepage (id integer PRIMARY KEY, nom varchar(50));

--Insertions
INSERT INTO Cepage (id, nom) VALUES (1, 'Pinot noir');
INSERT INTO Cepage (id, nom) VALUES (2, 'Gamay');
INSERT INTO Cepage (id, nom) VALUES (3, 'Cabernet sauvignon');
INSERT INTO Cepage (id, nom) VALUES (4, 'Merlot');
INSERT INTO Cepage (id, nom) VALUES (5, 'Malbec');
INSERT INTO Cepage (id, nom) VALUES (6, 'Syrah');

--Modification structure
ALTER TABLE Cepage DROP COLUMN id;
ALTER TABLE Cepage ADD COLUMN id serial PRIMARY KEY;



--Table Vin--
--Nettoyage
DROP TABLE IF EXISTS Vin;

--Création
CREATE TABLE Vin (id serial PRIMARY KEY, appelation varchar(100) NOT NULL, millesime integer CHECK(millesime < 2015), degres float, id_cepage integer REFERENCES Cepage(id));

--Insertions
INSERT INTO Vin (appelation, millesime, degres, id_cepage) VALUES ('Haute Côte de Nuit', 2006, 11.8, 1);
INSERT INTO Vin (appelation, millesime, degres, id_cepage) VALUES ('Saint Aubun', 2013, 12, 1);
INSERT INTO Vin (appelation, millesime, degres, id_cepage) VALUES ('Julienas', 2010, 11.8, 2);
INSERT INTO Vin (appelation, millesime, degres, id_cepage) VALUES ('Julienas', 2009, 11.8, 2);
INSERT INTO Vin (appelation, millesime, degres, id_cepage) VALUES ('Saint Julien', 2008, 12.2, 3);
INSERT INTO Vin (appelation, millesime, degres, id_cepage) VALUES ('Saint Julien', 2006, 12.4, 3);
INSERT INTO Vin (appelation, millesime, degres, id_cepage) VALUES ('Saint Emilion', 1998, 12.4, 4);
INSERT INTO Vin (appelation, millesime, degres, id_cepage) VALUES ('Pomerol', 2010, 12.4, 4);
INSERT INTO Vin (appelation, millesime, degres, id_cepage) VALUES ('Cahors', 2009, 12.3, 5);
INSERT INTO Vin (appelation, millesime, degres, id_cepage) VALUES ('Cahors', 2010, 12, 5);
INSERT INTO Vin (appelation, millesime, degres, id_cepage) VALUES ('Cahors', 2011, 12.4, 5);
INSERT INTO Vin (appelation, millesime, degres, id_cepage) VALUES ('Saint Joseph', 2006, 13, 6);
INSERT INTO Vin (appelation, millesime, degres, id_cepage) VALUES ('Côte Rôtie', 2004, 13.4, 6);
INSERT INTO Vin (appelation, millesime, degres, id_cepage) VALUES ('Crozes-Hermitage', 2003, 13.2, 6);
INSERT INTO Vin (appelation, millesime, degres, id_cepage) VALUES ('Cornas', 2003, 13, 6);


--Table Degustation--
--Nettoyage
DROP TABLE IF EXISTS Degustation;

--Création
CREATE TABLE Degustation (id_b integer REFERENCES Buveur(id), id_v integer REFERENCES Vin(id), date_degust date, note integer, quantite float, PRIMARY KEY (id_b, id_v, date_degust));

--Insertions
INSERT INTO Degustation (id_b, id_v, date_degust, note, quantite) VALUES (2, 1, '12/03/2016', 2, 10);
INSERT INTO Degustation (id_b, id_v, date_degust, note, quantite) VALUES (4, 1, '12/03/2016', 3, 10);
INSERT INTO Degustation (id_b, id_v, date_degust, note, quantite) VALUES (5, 1, '12/03/2016', 3, 10);
INSERT INTO Degustation (id_b, id_v, date_degust, note, quantite) VALUES (7, 1, '12/03/2016', 1, 10);

INSERT INTO Degustation (id_b, id_v, date_degust, note, quantite) VALUES (7, 9, '04/05/2016', 3, 7);
INSERT INTO Degustation (id_b, id_v, date_degust, note, quantite) VALUES (6, 9, '04/05/2016', 2, 7);
INSERT INTO Degustation (id_b, id_v, date_degust, note, quantite) VALUES (2, 9, '04/05/2016', 2, 7);
INSERT INTO Degustation (id_b, id_v, date_degust, note, quantite) VALUES (7, 12, '04/05/2016', 4, 7);
INSERT INTO Degustation (id_b, id_v, date_degust, note, quantite) VALUES (6, 12, '04/05/2016', 3, 7);
INSERT INTO Degustation (id_b, id_v, date_degust, note, quantite) VALUES (2, 12, '04/05/2016', 5, 14);
INSERT INTO Degustation (id_b, id_v, date_degust, note, quantite) VALUES (7, 14, '04/05/2016', 4, 7);
INSERT INTO Degustation (id_b, id_v, date_degust, note, quantite) VALUES (6, 14, '04/05/2016', 1, 3);
INSERT INTO Degustation (id_b, id_v, date_degust, note, quantite) VALUES (7, 15, '04/05/2016', 5, 14);
INSERT INTO Degustation (id_b, id_v, date_degust, note, quantite) VALUES (6, 15, '04/05/2016', 4, 10);

INSERT INTO Degustation (id_b, id_v, date_degust, note, quantite) VALUES (4, 1, '10/05/2016', 1, 4);
INSERT INTO Degustation (id_b, id_v, date_degust, note, quantite) VALUES (5, 1, '10/05/2016', 3, 4);
INSERT INTO Degustation (id_b, id_v, date_degust, note, quantite) VALUES (4, 2, '10/05/2016', 3, 5);
INSERT INTO Degustation (id_b, id_v, date_degust, note, quantite) VALUES (5, 2, '10/05/2016', 2, 4);
INSERT INTO Degustation (id_b, id_v, date_degust, note, quantite) VALUES (4, 3, '10/05/2016', 2, 3);
INSERT INTO Degustation (id_b, id_v, date_degust, note, quantite) VALUES (5, 3, '10/05/2016', 3, 6);
INSERT INTO Degustation (id_b, id_v, date_degust, note, quantite) VALUES (4, 4, '10/05/2016', 3, 5);
INSERT INTO Degustation (id_b, id_v, date_degust, note, quantite) VALUES (5, 4, '10/05/2016', 2, 6);

INSERT INTO Degustation (id_b, id_v, date_degust, note, quantite) VALUES (2, 6, '20/05/2016', 4, 18);
INSERT INTO Degustation (id_b, id_v, date_degust, note, quantite) VALUES (5, 5, '20/05/2016', 5, 18);

INSERT INTO Degustation (id_b, id_v, date_degust, note, quantite) VALUES (7, 8, '05/06/2016', 4, 10);
INSERT INTO Degustation (id_b, id_v, date_degust, note, quantite) VALUES (4, 8, '05/06/2016', 3, 14);

INSERT INTO Degustation (id_b, id_v, date_degust, note, quantite) VALUES (2, 5, '21/07/2016', 4, 5);
INSERT INTO Degustation (id_b, id_v, date_degust, note, quantite) VALUES (2, 6, '21/07/2016', 4, 12);
INSERT INTO Degustation (id_b, id_v, date_degust, note, quantite) VALUES (2, 7, '21/07/2016', 2, 5);
INSERT INTO Degustation (id_b, id_v, date_degust, note, quantite) VALUES (5, 7, '21/07/2016', 5, 20);








--Requêtes d'exemple--
DELETE FROM Buveur WHERE id = 1;
UPDATE Buveur SET naissance = 2000 WHERE id = 3;




--Requêtes exercice 3--
SELECT prenom, naissance FROM Buveur;
SELECT nom FROM Cepage;
SELECT * FROM Buveur WHERE nom = 'Mir';
SELECT * FROM Buveur WHERE naissance > 1992;
SELECT * FROM Cepage WHERE nom like 'M%';
SELECT prenom FROM Buveur WHERE ville = 'Paris';


--Requêtes exercice 4--
--1
DROP TABLE Cepage -- doit retourner une erreur à cause de la clé étrangère dans Vin
--2
UPDATE Buveur SET ville = 'Dijon' WHERE nom = 'Deuf' AND prenom = 'John';
--3
ALTER TABLE Buveur ADD CONSTRAINT est_majeur CHECK (naissance <= 1998); -- ne fonctionne pas la première fois
DELETE FROM Buveur WHERE naissance > 1998;
ALTER TABLE Buveur ADD CONSTRAINT est_majeur CHECK (naissance <= 1998);
--4
SELECT prenom FROM Buveur;  -- affiche Jean, Harry, Emma, Jade, John
--5
INSERT INTO Buveur (nom, prenom, naissance, ville) VALUES ('Perret', 'Ines', 2000, 'Marseille'); -- doit retourner une erreur à cause de la contrainte est_majeur
--6
UPDATE Buveur SET naissance = 2003 WHERE ville like 'P%'; -- doit retourner une erreur à cause de la contrainte est_majeur


--Requêtes exercice 6--
UPDATE Degustation SET quantite = 15 WHERE id_b = 4 AND id_v = 1 AND date_degust = '12/03/2016';


--Requêtes exercice 7--
SELECT * FROM Vin JOIN Cepage ON Vin.id_cepage = Cepage.id WHERE Cepage.nom = 'Syrah';
SELECT Vin.appelation FROM Vin JOIN Cepage ON Vin.id_cepage = Cepage.id WHERE Cepage.nom = 'Merlot';
SELECT Vin.appelation, Cepage.nom FROM Vin JOIN Cepage ON Vin.id_cepage = Cepage.id WHERE Vin.appelation = 'Saint Aubun' OR Vin.appelation = 'Cahors';
SELECT Buveur.nom FROM Buveur JOIN Degustation ON Buveur.id = Degustation.id_b WHERE Degustation.date_degust = '12/03/2016';


--Requêtes exercice 8--
--1
SELECT Cepage.nom, count(*) FROM Cepage JOIN Vin ON Cepage.id = Vin.id_cepage GROUP BY Cepage.nom;
--2
SELECT Vin.appelation, ROUND(AVG(Degustation.note),2) AS note_moy, MIN(Degustation.note) AS note_min, MAX(Degustation.note) AS note_max
FROM Degustation JOIN Vin ON Degustation.id_v = Vin.id
GROUP BY Vin.appelation;
--3
SELECT Cepage.nom, ROUND(AVG(Degustation.note),2) AS note_moy, MIN(Degustation.note) AS note_min, MAX(Degustation.note) AS note_max
FROM Degustation JOIN Vin ON Degustation.id_v = Vin.id JOIN Cepage ON Vin.id_cepage = Cepage.id
GROUP BY Cepage.nom;
--4
SELECT Buveur.prenom, SUM(Degustation.quantite) AS quantite_totale, COUNT(*) AS nb_degustations
FROM Buveur JOIN Degustation ON Buveur.id = Degustation.id_b 
GROUP BY Buveur.prenom 
ORDER BY quantite_totale DESC;
--5
SELECT Vin.millesime 
FROM Vin JOIN Degustation ON Vin.id = Degustation.id_v 
WHERE Vin.appelation = 'Saint Julien' 
GROUP BY (Vin.millesime) 
ORDER BY AVG(Degustation.note) DESC 
LIMIT 1;


--Requêtes exercice 9--
CREATE VIEW gros_buveurs AS (
	SELECT Buveur.prenom, Degustation.date_degust, SUM(Degustation.quantite) AS quantite_totale, COUNT(*) AS nb_verres
	FROM Buveur JOIN Degustation ON Buveur.id = Degustation.id_b
	GROUP BY Buveur.prenom, Degustation.date_degust
	ORDER BY SUM(Degustation.quantite) DESC
	LIMIT 3;
);
