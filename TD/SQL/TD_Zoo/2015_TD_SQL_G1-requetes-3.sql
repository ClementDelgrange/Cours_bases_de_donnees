SELECT "A"."nom" AS "aliment origine", "A2"."nom" AS "aliment remplacement", "S"."taux"
FROM "ALI_SUBSTITUTION" AS "S" 
INNER JOIN "ALIMENT" AS "A" 
	ON "A"."code_aliment" = "S"."code_aliment"
INNER JOIN "ALIMENT" AS "A2"
	ON "A2"."code_aliment" = "S"."code_substitution";



SELECT "AN"."nom" AS "Nom animal", "AL"."nom" AS "Aliment", "AL"."stock" AS "Stock", "EA"."quantite" AS "Quantité"
FROM "ANIMAL" AS "AN"
LEFT JOIN "ESP_ALI" AS "EA"
	ON "AN"."code_espece" = "EA"."code_espece"
LEFT JOIN "ALIMENT" AS "AL"
	ON "EA"."code_aliment" = "AL"."code_aliment"
WHERE "AL"."stock" < "EA"."quantite";



SELECT "AL"."nom" AS "Aliment", min("AL"."stock") AS "Stock", sum("EA"."quantite") AS "Quantité totale", count(*)
FROM "ANIMAL" AS "AN"
LEFT JOIN "ESP_ALI" AS "EA"
	ON "AN"."code_espece" = "EA"."code_espece"
LEFT JOIN "ALIMENT" AS "AL"
	ON "EA"."code_aliment" = "AL"."code_aliment"
GROUP BY "AL"."nom";



CREATE VIEW "ALI_STOCK_CONSO" AS
SELECT "AL"."nom" AS "Aliment", min("AL"."stock") AS "Stock", sum("EA"."quantite") AS "Quantité totale"
FROM "ANIMAL" AS "AN"
LEFT JOIN "ESP_ALI" AS "EA"
	ON "AN"."code_espece" = "EA"."code_espece"
LEFT JOIN "ALIMENT" AS "AL"
	ON "EA"."code_aliment" = "AL"."code_aliment"
GROUP BY "AL"."nom";

SELECT * FROM "ALI_STOCK_CONSO" WHERE "Stock" < "Quantité totale";



SELECT "AN"."nom" AS "Animal", "AL"."nom" AS "Aliment", "EA"."quantite" AS "Quantité"
FROM "ANIMAL" AS "AN"
INNER JOIN "ESP_ALI" AS "EA"
	ON "AN"."code_espece" = "EA"."code_espece"
INNER JOIN "ALIMENT" AS "AL"
	ON "EA"."code_aliment" = "AL"."code_aliment"
INNER JOIN "ENCLOS" AS "E"
	ON "E"."code_enclos" = "AN"."code_enclos"
WHERE "E"."code_enclos" = 2;


SELECT "AL"."nom" AS "Aliment", sum("EA"."quantite") AS "Quantité totale"
FROM "ANIMAL" AS "AN"
INNER JOIN "ESP_ALI" AS "EA"
	ON "AN"."code_espece" = "EA"."code_espece"
INNER JOIN "ALIMENT" AS "AL"
	ON "EA"."code_aliment" = "AL"."code_aliment"
INNER JOIN "ENCLOS" AS "E"
	ON "E"."code_enclos" = "AN"."code_enclos"
WHERE "E"."code_enclos" = 2
GROUP BY "AL"."nom";



SELECT * 
FROM "ESPECE"
WHERE "code_espece" IN (SELECT "code_espece" FROM "ANIMAL" WHERE "ESPECE"."code_espece" = "ANIMAL"."code_espece");

SELECT * 
FROM "ESPECE" 
WHERE EXISTS (SELECT * FROM "ANIMAL" WHERE "ESPECE"."code_espece" = "ANIMAL"."code_espece");



INSERT INTO "ENCLOS" ("code_enclos", "situation") VALUES (7, 'Allée principale - n°3');

UPDATE "ANIMAL"
SET "code_enclos" = (
	SELECT "code_enclos" FROM "ENCLOS" WHERE "situation" = 'Allée principale - n°3'
)
WHERE "code_enclos" = (
	SELECT "code_enclos" FROM "ENCLOS" WHERE "situation" = 'Allée principale - n°4'
);

DELETE FROM "ENCLOS" WHERE "situation" = 'Allée principale - n°4';
