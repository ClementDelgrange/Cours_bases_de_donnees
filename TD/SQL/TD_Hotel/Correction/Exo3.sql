-- 1. Les noms des clients de l’hôtel « Bellevue de Courchevel »
SELECT client.nom AS Client_Hotel_Bellevue
FROM client, resa, hotel
WHERE client.id = resa.id_client
AND hotel.id = resa.id_hotel
AND hotel.nom LIKE 'Bellevue de Courchevel'
GROUP BY client.nom;

OU DISTINCT

-- 2. Pour chaque hôtel de Haute-Savoie, le nombre de lits en catégorie 3 étoiles
SELECT nom AS hotel, sum(chambre.nb_lits) AS Nombre_lits_3_etoiles
FROM chambre, hotel
WHERE chambre.id_hotel = hotel.id
AND categorie = 3
GROUP BY hotel.nom;

-- 3. Pour chaque hôtel de Haute-Savoie, le nombre de chambres réservés pour le 11/11/2015
SELECT 	nom AS Hotel, 
	SUM(CASE WHEN date_deb < '2015-11-11' AND date_fin > '2015-11-11' THEN 1 ELSE 0 END) as nbre_chambres_le_11nov2015
FROM hotel
LEFT JOIN resa ON hotel.id = resa.id_hotel
WHERE hotel.region = 'Haute-Savoie'
group by nom;

OU 

SELECT 	nom AS Hotel, COUNT(*) as nbre_chambres_le_11nov2015
FROM hotel
LEFT JOIN resa ON hotel.id = resa.id_hotel
WHERE hotel.region = 'Haute-Savoie'
AND date_deb < '2015-11-11' 
AND date_fin > '2015-11-11'
group by nom;


-- 4. Combien y a-t-il d’hôtels en Alsace
SELECT 	count(nom) AS Hotels_en_Alsace 
FROM hotel
WHERE hotel.region = 'Alsace';

-- 5. Les clients qui sont allés dans tout les hôtels du Jura
SELECT *
FROM client 
WHERE NOT EXISTS(
	SELECT *
	FROM hotel
	WHERE id NOT IN(
		SELECT id_hotel
		FROM resa
		WHERE id_client = client.id
	)
	AND hotel.region ILIKE 'jura'
)
-- 6. Les clients qui sont allés au moins 2 fois dans l’hôtel « Bellevue de Courchevel »
SELECT client.nom, COUNT(*) as nb_resa
FROM resa, hotel, client
WHERE resa.id_hotel = hotel.id
AND client.id = resa.id_client
AND hotel.nom ILIKE 'Bellevue de Courchevel'
GROUP BY client.id,client.nom
HAVING COUNT(*) >= 2

-- 7. L’hôtel ayant le plus grand nombre de lits

CREATE TEMP VIEW lits as
	SELECT id_hotel, SUM (nb_lits) as nb_lits
	FROM chambre
	GROUP BY id_hotel;



SELECT * 
FROM lits
WHERE nb_lits = (
	 SELECT MAX(nb_lits)
	 FROM lits)

OU 


SELECT id_hotel, SUM (nb_lits)
FROM chambre
GROUP BY id_hotel
ORDER BY SUM (nb_lits) DESC
LIMIT 1;

-- 8. La région comprenant le plus grand nombre d’hôtels 5 étoiles
SELECT region, COUNT (*)
FROM hotel
WHERE categorie = 5
GROUP BY region
ORDER BY COUNT (*) DESC
LIMIT 1;


OU 

SELECT region
FROM hotel
WHERE categorie = 5
GROUP BY region
HAVING COUNT(*) = 
(
	SELECT MAX(nb_hotels)
	FROM (
		SELECT region, COUNT(*) as nb_hotels
		FROM hotel
		WHERE categorie = 5
		GROUP BY region
		) as region_5_etoiles
	
)

-- 9. Les clients qui ont réservé une chambre numéro 666

SELECT DISTINCT client.nom
FROM resa, client
WHERE resa.id_client = client.id
AND resa.num_chambre = 666












