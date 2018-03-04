INSERT INTO Aliment (nom, stock) VALUES ('Blé', 100);
INSERT INTO Aliment (nom, stock) VALUES ('Foin', 75);
INSERT INTO Aliment (nom, stock) VALUES ('Herbe', 450);
INSERT INTO Aliment (nom, stock) VALUES ('Poisson', 47);
INSERT INTO Aliment (nom, stock) VALUES ('Bambou', 79);
INSERT INTO Aliment (nom, stock) VALUES ('Insecte', 13);
INSERT INTO Aliment (nom, stock) VALUES ('Viande', 27);
INSERT INTO Aliment (nom, stock) VALUES ('Carcasse animale', 50);
INSERT INTO Aliment (nom, stock) VALUES ('Carotte', 30);
INSERT INTO Aliment (nom, stock) VALUES ('Baies', 0);
INSERT INTO Aliment (nom, stock) VALUES ('Banane', 0);

INSERT INTO Enclos ( localisation, agencement) VALUES ( 'Allée principale - n°1', 'Cage');
INSERT INTO Enclos ( localisation, agencement) VALUES ('Allée principale - n°2', 'Cage');
INSERT INTO Enclos ( localisation, agencement) VALUES ( 'Allée principale - n°4', 'Cage');
INSERT INTO Enclos ( localisation, agencement) VALUES ( 'Allée est-ouest - Au fond du parc', 'Prairie');
INSERT INTO Enclos ( localisation, agencement) VALUES ( 'Allée est-ouest - Partie centrale', 'Aquarium');

INSERT INTO Espece (nom_scientifique, nom) VALUES ('Crocodylus niloticus', 'Crocodile');
INSERT INTO Espece (nom_scientifique, nom) VALUES ('Loxodonta africana', 'Elephant');
INSERT INTO Espece (nom_scientifique, nom) VALUES ('Phoenicopterus ruber', 'Flamant rose');
INSERT INTO Espece (nom_scientifique, nom) VALUES ('Giraffa camelopardalis', 'Girafe');
INSERT INTO Espece (nom_scientifique, nom) VALUES ('Panthera tigris', 'Tigre');
INSERT INTO Espece (nom_scientifique, nom) VALUES ('Ailuropoda melanoleuca', 'Panda');
INSERT INTO Espece (nom_scientifique, nom) VALUES ('Panthera Leo', 'Lion');

INSERT INTO Substitution (id_aliment, id_substitution, taux) VALUES ('Blé', 'Foin', 1);
INSERT INTO Substitution (id_aliment, id_substitution, taux) VALUES ('Foin', 'Foin', 1);
INSERT INTO Substitution (id_aliment, id_substitution, taux) VALUES ('Herbe', 'Foin', 0.5);
INSERT INTO Substitution (id_aliment, id_substitution, taux) VALUES ('Bambou', 'Baies', 5);
INSERT INTO Substitution (id_aliment, id_substitution, taux) VALUES ('Insecte', 'Blé', 4);
INSERT INTO Substitution (id_aliment, id_substitution, taux) VALUES ('Viande', 'Carcasse animale', 3.5);
INSERT INTO Substitution (id_aliment, id_substitution, taux) VALUES ('Carcasse animale', 'Viande', 0.5);
INSERT INTO Substitution (id_aliment, id_substitution, taux) VALUES ('Banane', 'Baies', 1);
INSERT INTO Substitution (id_aliment, id_substitution, taux) VALUES ('Baies', 'Carotte', 0.5);

INSERT INTO Animal (nom, sexe, date_naissance, date_arrivee, id_e, id_enclos) VALUES ('Balou', 'M', '2010-01-01', '2010-10-10', 'Panthera tigris', 2);
INSERT INTO Animal (nom, sexe, date_naissance, date_arrivee, id_e, id_enclos) VALUES ('Zira', 'F', '2000-01-01', '2005-03-04', 'Giraffa camelopardalis', 4);
INSERT INTO Animal (nom, sexe, date_naissance, date_arrivee, id_e, id_enclos) VALUES ('Java', 'F', '2005-05-04', '2015-06-12', 'Panthera tigris', 4);
INSERT INTO Animal (nom, sexe, date_naissance, date_arrivee, id_e, id_enclos) VALUES ('Croci', 'F', '2000-08-20', '2009-09-26', 'Crocodylus niloticus', 1);
INSERT INTO Animal (nom, sexe, date_naissance, date_arrivee, id_e, id_enclos) VALUES ('Croco', 'M', '1997-01-01', '2012-05-20', 'Crocodylus niloticus', 1);
INSERT INTO Animal (nom, sexe, date_naissance, date_arrivee, id_e, id_enclos) VALUES ('Grandepate', 'F', '1990-01-01', '2002-01-10', 'Giraffa camelopardalis', 4);
INSERT INTO Animal (nom, sexe, date_naissance, date_arrivee, id_e, id_enclos) VALUES ('Grancou', 'M', '1994-07-04', '2004-12-14', 'Giraffa camelopardalis', 4);
INSERT INTO Animal (nom, sexe, date_naissance, date_arrivee, id_e, id_enclos) VALUES ('Charly', 'M', '1997-04-18', '2008-08-10', 'Panthera tigris', 2);
INSERT INTO Animal (nom, sexe, date_naissance, date_arrivee, id_e, id_enclos) VALUES ('Charlo', 'M', '1997-04-18', '2008-08-10', 'Panthera tigris', 2);
INSERT INTO Animal (nom, sexe, date_naissance, date_arrivee, id_e, id_enclos) VALUES ('Tintin', 'M', '2000-10-25', '2003-01-03', 'Panthera tigris', 2);
INSERT INTO Animal (nom, sexe, date_naissance, date_arrivee, id_e, id_enclos) VALUES ('Milou', 'M', '2005-04-04', '2004-03-18', 'Panthera tigris', 2);
INSERT INTO Animal (nom, sexe, date_naissance, date_arrivee, id_e, id_enclos) VALUES ('Charlotte', 'F', '2008-09-05', '2010-09-10', 'Phoenicopterus ruber', 3);
INSERT INTO Animal (nom, sexe, date_naissance, date_arrivee, id_e, id_enclos) VALUES ('Rosa', 'F', '2007-12-02', '2010-09-10', 'Phoenicopterus ruber', 3);

INSERT INTO Habitat (description, pays) VALUES ('Marais Poitevin', 'France');
INSERT INTO Habitat (description, pays) VALUES ('Hauts plateaux du Tibet', 'Chine');
INSERT INTO Habitat (description, pays) VALUES ('Parc National de Kazinranga', 'Inde');
INSERT INTO Habitat (description, pays) VALUES ('Savane africaine, dans le parc national de Manyara, dans la vallée du Rift', 'Tanzanie');