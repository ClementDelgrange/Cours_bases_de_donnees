CREATE TABLE client2
(
  id integer NOT NULL,
  nom character varying(25) NOT NULL,
  adresse character varying(25),
  tel character varying(10),
  CONSTRAINT client2_pkey PRIMARY KEY (id)
);

INSERT INTO client2 (id, nom, adresse, tel) VALUES
(1,'Georges','PARIS','06'),
(4,'Toto','PARIS','06'),
(10,'Pere Noel','LOIN','366566565'),
(66,'Fort','CLERMONT-FERRAND','07');