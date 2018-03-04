INSERT INTO bars VALUES ('La Fine Mousse','PARIS','Saint-Maur');
INSERT INTO bars VALUES ('Les Trois 8','PARIS','Ménilmontant');
INSERT INTO bars VALUES ('The Bottle Shop','PARIS','Bastille');
INSERT INTO bars VALUES ('Mémé dans les orties','STRASBOURG','Rue Munch');

INSERT INTO bieres VALUES ('Leffe','brune',5);
INSERT INTO bieres VALUES ('Hoegaarden','blanche',4);
INSERT INTO bieres VALUES ('Guinness','noire',4.2);
INSERT INTO bieres VALUES ('Kwak','brune',8.4);

INSERT INTO buveurs VALUES ('LEPONGE','Bob','Hoegaarden');
INSERT INTO buveurs VALUES ('DUPONT','Mathilde','Guinness');
INSERT INTO buveurs VALUES ('SUNG','Sam','Kwak');
INSERT INTO buveurs VALUES ('DOE','Jhon','Guinness');

INSERT INTO frequenter VALUES ('La Fine Mousse','SUNG');
INSERT INTO frequenter VALUES ('La Fine Mousse','LEPONGE');
INSERT INTO frequenter VALUES ('La Fine Mousse','DOE');
INSERT INTO frequenter VALUES ('La Fine Mousse','DUPONT');
INSERT INTO frequenter VALUES ('Les Trois 8','DOE');
INSERT INTO frequenter VALUES ('Les Trois 8','DUPONT');
INSERT INTO frequenter VALUES ('Mémé dans les orties','LEPONGE');
INSERT INTO frequenter VALUES ('Mémé dans les orties','DOE');
INSERT INTO frequenter VALUES ('Mémé dans les orties','DUPONT');
INSERT INTO frequenter VALUES ('The Bottle Shop','DUPONT');

INSERT INTO aimer VALUES ('Guinness','SUNG');
INSERT INTO aimer VALUES ('Guinness','LEPONGE');
INSERT INTO aimer VALUES ('Guinness','DOE');
INSERT INTO aimer VALUES ('Guinness','DUPONT');
INSERT INTO aimer VALUES ('Hoegaarden','LEPONGE');
INSERT INTO aimer VALUES ('Hoegaarden','DUPONT');
INSERT INTO aimer VALUES ('Kwak','LEPONGE');
INSERT INTO aimer VALUES ('Kwak','SUNG');
INSERT INTO aimer VALUES ('Kwak','DUPONT');
INSERT INTO aimer VALUES ('Leffe','DUPONT');

INSERT INTO servir VALUES ('Leffe','Mémé dans les orties');
INSERT INTO servir VALUES ('Leffe','Les Trois 8');
INSERT INTO servir VALUES ('Leffe','The Bottle Shop');
INSERT INTO servir VALUES ('Leffe','La Fine Mousse');
INSERT INTO servir VALUES ('Hoegaarden','Les Trois 8');
INSERT INTO servir VALUES ('Hoegaarden','La Fine Mousse');
INSERT INTO servir VALUES ('Kwak','Mémé dans les orties');
INSERT INTO servir VALUES ('Guinness','Mémé dans les orties');
INSERT INTO servir VALUES ('Guinness','Les Trois 8');
INSERT INTO servir VALUES ('Guinness','The Bottle Shop');
