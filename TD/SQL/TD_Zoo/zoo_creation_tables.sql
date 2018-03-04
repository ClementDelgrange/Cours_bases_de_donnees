CREATE TABLE Enclos (id serial PRIMARY KEY, 
		     localisation varchar(100), 
		     agencement varchar(100));
		     
CREATE TABLE Espece (nom varchar(50), 
		     nom_scientifique varchar(100) PRIMARY KEY);
		     
CREATE TABLE Animal (id serial PRIMARY KEY, 
		     nom varchar(50), 
		     sexe varchar(1) CHECK(sexe = 'M' OR sexe = 'F'), 
		     date_naissance date, 
		     date_arrivee date, 
		     id_e varchar(100) REFERENCES Espece(nom_scientifique),
		     id_enclos integer REFERENCES Enclos(id),
		     CHECK (sexe='M' OR sexe='F'),
		     CHECK (date_naissance < date_arrivee));
		     
CREATE TABLE Habitat (id serial PRIMARY KEY,
		      pays varchar(50),
		      description varchar(200));

CREATE TABLE Aliment (nom varchar(30) PRIMARY KEY,
		      stock integer NOT NULL);

CREATE TABLE Substitution (taux float NOT NULL,
			   id_aliment varchar(30) REFERENCES Aliment(nom),
			   id_substitution varchar(30) REFERENCES Aliment(nom),
			   PRIMARY KEY (id_aliment),
			   CHECK (id_aliment <> id_substitution));

CREATE TABLE Esp_ali (id_e varchar(100) REFERENCES Espece(nom_scientifique),
		      id_a varchar(30) REFERENCES Aliment(nom),
		      quantite integer NOT NULL,
		      PRIMARY KEY (id_e, id_a));

CREATE TABLE Esp_hab (id_e varchar(100) REFERENCES Espece(nom_scientifique),
		      id_h integer REFERENCES Habitat(id),
		      population integer,
		      PRIMARY KEY (id_e, id_h));