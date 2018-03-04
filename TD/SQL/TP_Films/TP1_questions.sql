/*Exercice sur les sélections */
SELECT titre FROM film 
SELECT nom,prenom FROM internaute WHERE region='Auvergne'
SELECT titre,annee FROM film WHERE genre LIKE 'Drame' ORDER BY annee desc
SELECT nom,anneenaiss FROM artiste WHERE anneenaiss<1950
SELECT titre, annee FROM film WHERE annee<=1980 AND annee>=1960
SELECT titre, annee FROM film WHERE annee BETWEEN '1960' AND '1980'
SELECT DISTINCT genre FROM film
SELECT titre,genre,resume FROM film WHERE genre IN ('Drame', 'Western') AND resume LIKE '%vie%'
SELECT nom FROM artiste WHERE nom LIKE 'H%'
SELECT nom,prenom FROM artiste WHERE anneenaiss IS NULL
SELECT nom, prenom, 2015-anneenaiss FROM artiste AS age 
SELECT nom, prenom, 2015-anneenaiss AS age FROM artiste 
/*Ajouter une colonne pour créer l'âge */
ALTER TABLE artiste
	ADD age INTEGER
	UPDATE artiste 
	SET age = 2015-anneenaiss
	ALTER TABLE artiste
	DROP age

/*Exercice sur les jointures */
SELECT nom, prenom FROM artiste INNER JOIN role ON artiste.idartiste = role.idacteur WHERE nomrole LIKE 'Morpheus'
SELECT nom, prenom FROM artiste INNER JOIN film ON artiste.idartiste = film.idmes WHERE titre LIKE 'Alien'
SELECT nom,prenom,titre FROM internaute INNER JOIN notation ON internaute.email=notation.email INNER JOIN film on notation.idfilm=film.idfilm WHERE notation.note=4
SELECT nom,prenom,nomrole FROM artiste INNER JOIN role ON artiste.idartiste = role.idacteur INNER JOIN film ON role.idfilm = film.idfilm WHERE titre LIKE 'Vertigo'
SELECT titre,nomrole FROM artiste INNER JOIN role ON artiste.idartiste = role.idacteur WHERE nom LIKE 'Willis' AND prenom LIKE 'Bruce' 
/*Question 6.6*/
SELECT titre
FROM film
INNER JOIN artiste AS realisateur ON film.idmes=realisateur.idartiste
INNER JOIN role ON film.idfilm = role.idfilm
INNER JOIN artiste ON role.idacteur = artiste.idartiste
WHERE realisateur.nom LIKE 'Burton' and artiste.nom LIKE 'Depp'
/*question 6.7*/
SELECT titre,nomrole,realisateur.nom,realisateur.prenom
FROM film
INNER JOIN artiste AS realisateur ON film.idmes=realisateur.idartiste
INNER JOIN role ON film.idfilm = role.idfilm
INNER JOIN artiste ON role.idacteur = artiste.idartiste
WHERE realisateur.idartiste=role.idacteur
/*question 6.8*/
SELECT titre,realisateur.nom,artiste.nom
FROM film
INNER JOIN artiste AS realisateur ON film.idmes=realisateur.idartiste
INNER JOIN role ON film.idfilm = role.idfilm
INNER JOIN artiste ON role.idacteur = artiste.idartiste
WHERE realisateur.idartiste!=role.idacteur AND realisateur.prenom = artiste.prenom
/*exercice 7*/
SELECT titre,annee
FROM film
WHERE genre IN (SELECT genre FROM film WHERE titre='Matrix')

SELECT nom,prenom
FROM artiste 
WHERE idartiste IN(SELECT idmes FROM film WHERE artiste.idartiste=film.idmes)
AND idartiste IN(SELECT idacteur FROM role WHERE role.idacteur=artiste.idartiste)
/*on pouvait aussi enlever ces WHERE qui ne servent à rien */
SELECT nom,prenom
FROM artiste 
WHERE idartiste IN(SELECT idmes FROM film)
AND idartiste IN(SELECT idacteur FROM role)
/*pour afficher les titres des films aussi*/
SELECT artiste.nom,artiste.prenom, film.titre 
FROM artiste, film 
WHERE idartiste IN(SELECT idmes FROM film)
AND idartiste IN(SELECT idacteur FROM role)
AND idartiste=film.idmes
ORDER BY nom asc
/*exercice 8*/
SELECT titre
FROM film 
WHERE idfilm NOT IN (SELECT idfilm FROM role)

SELECT nom, prenom
FROM artiste
WHERE idartiste NOT IN (SELECT idmes FROM film)

/*exercice 9*/
SELECT COUNT(*), AVG (note), MAX (note), MIN (note)
FROM notation
WHERE email LIKE 'rigaux@cnam.fr' 

