DROP TABLE "ENCLOS";

CREATE TABLE "ENCLOS" (
	"type" character(50),
	"situation" text,
	"noEnclos" serial NOT NULL,
	CONSTRAINT "noEnclosClePrimaire" PRIMARY KEY ("noEnclos")
);


DROP TABLE "ESP_SIT";

CREATE TABLE "ESP_SIT" (
	"nomEspece" character(50),
	"pays" character(50),
	"effectif" integer,
	CONSTRAINT "espSitClePrimaire" PRIMARY KEY ("nomEspece", "pays"),
	CONSTRAINT "nomEspeceCleEtrangere" FOREIGN KEY ("nomEspece")
		REFERENCES "ESPECE" ("nomEspece") MATCH SIMPLE
		ON UPDATE NO ACTION ON DELETE NO ACTION,
	CONSTRAINT "paysCleEtrangere" FOREIGN KEY ("pays")
		REFERENCES "SITUATION_GEOGRAPHIQUE" ("pays") MATCH SIMPLE
		ON UPDATE NO ACTION ON DELETE NO ACTION
);

DROP TABLE "ESP_ALIM";

CREATE TABLE "ESP_ALIM" (
	"nomEspece" character(50),
	"type" character(50),
	"quantite" integer,
	CONSTRAINT "espAlimClePrimaire" PRIMARY KEY ("nomEspece", "type"),
	CONSTRAINT "nomEspeceCleEtrangere" FOREIGN KEY ("nomEspece")
		REFERENCES "ESPECE" ("nomEspece") MATCH SIMPLE
		ON UPDATE NO ACTION ON DELETE NO ACTION,
	CONSTRAINT "typeAlimCleEtrangere" FOREIGN KEY ("type")
		REFERENCES "ALIMENT" ("type") MATCH SIMPLE
		ON UPDATE NO ACTION ON DELETE NO ACTION
);


CREATE TABLE "ANIMAL" (
	"nomScientifique" character(50) NOT NULL,
	"nom" character(50),
	"popEstimee" integer,
	"dateNaissance" date,
	"dateArrivee" date,
	"remarques" text,
	"sexe" char,
	"noEnclos" integer,
	"nomEspece" character(50),
	CONSTRAINT "nomScientifiqueClePrimaire" PRIMARY KEY ("nomScientifique"),
	CONSTRAINT "nomEspeceCleEtrangere" FOREIGN KEY ("nomEspece")
		REFERENCES "ESPECE" ("nomEspece") MATCH SIMPLE
		ON UPDATE NO ACTION ON DELETE NO ACTION,
	CONSTRAINT "noEnclosCleEtrangere" FOREIGN KEY ("noEnclos")
		REFERENCES "ENCLOS" ("noEnclos") MATCH SIMPLE
		ON UPDATE NO ACTION ON DELETE NO ACTION
);





ALTER TABLE "SUBSTITUTION" DROP COLUMN "quantite";

ALTER TABLE "SUBSTITUTION" ADD COLUMN "taux" real NOT NULL;

ALTER TABLE "SUBSTITUTION" ALTER COLUMN "taux" SET NOT NULL;



ALTER TABLE "ANIMAL" ALTER COLUMN "dateArrivee" SET NOT NULL;

ALTER TABLE "ANIMAL" DROP COLUMN "dateNaissance";
ALTER TABLE "ANIMAL" ADD COLUMN "dateNaissance" date CHECK("dateNaissance" < "dateArrivee");

ALTER TABLE "ANIMAL" ALTER COLUMN "noEnclos" SET DEFAULT 1;



INSERT INTO "ALIMENT" ("type", "stock") VALUES ('bananes', 1000);
INSERT INTO "ALIMENT" ("stock", "type") VALUES (10000, 'cacahuetes');
INSERT INTO "ALIMENT" VALUES (10, 'blé');


INSERT INTO "ENCLOS" ("type", "situation") VALUES ('prairie', 'quelque par dans le zoo');
INSERT INTO "ENCLOS" VALUES ('prairie', 'quelque par dans le zoo');