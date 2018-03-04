DROP TABLE hotel2;

CREATE TABLE public.hotel2
(
  id SERIAL,
  nom character varying(50),
  categorie integer,
  region character varying(50),
  CONSTRAINT hotel2_pkey PRIMARY KEY (id)
);

INSERT INTO hotel2 (nom, categorie, region) VALUES
('Bellevue de Courchevel', 3, 'Haute-Savoie'),
('Grand Hôtel des Alpes', 5, 'Haute-Savoie'),
('Hotel Mont-Blanc', 4, 'Haute-Savoie'),
('Hotel Chalet d''(Antoine', 2, 'Haute-Savoie'),
('Hôtel Vaillant', 3, 'Alsace');

Select * from hotel2