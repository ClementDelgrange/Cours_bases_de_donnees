# Grade des employés #

Pour le calcul de la paie, une entreprise utilise une base de données, dont le contenu est rafraîchi chaque mois : la base contient des informations concernant ses employés, leur affectation et leur grade. On connaît :

* de l'employé : un numéro de matricule, le nom et le prénom ;
* pour le grade : le numéro et le libellé du grade ;
* pour l'affectation : le numéro et le nom du service.
* 
Proposez un modèle conceptuel de données (avec entités, identifiants, attributs, relations, cardinalités). Quel est le schéma relationnel correspondant à votre modèle ? L'entreprise veut introduire dans la base de données les historiques des grades et des affectations pour ses employés. Donnez le nouveau modèle conceptuel correspondant à ce contexte et le schéma relationnel associé.



# Applications informatiques #

Une base de donnéees doit être conçue pour étudier l'utilisation des ressources informatiques d'une entreprise. L'entreprise est présente sur plusieurs sites géographiques. A partir de certains sites, les utilisateurs accèdent à des applications informatiques. Il est possible qu'un même utilisateur accède à une application à partir de sites différents (par exemple : les employés itinérants, les vendeurs sur plusieurs régions, ...). Chaque application demande un ensemble de logiciels et matériels, par exemple :

* pour une application : Oracle sur un IBM et Sybase sur un HP ;
* pour une autre application : Oracle sur un HP et Oracle sur un Digital.
* 
Les matériels sont localisés dans des sites de l'entreprise. On doit indiquer dans la base :

* des sites : le no de site et l'appellation
* des utilisateurs : le n° d'utilisateur, le profil, le nom et le prénom
* des applications : le n° d'application, le nom, le domaine (prise de commandes, suivi des ventes,...)
* des matériels informatiques : un n° de matériel qui permet de distinguer physiquement chaque matériel d'un autre, le type de matériel (micro, serveur, ...), le nom, le constructeur
* des logiciels : le nom du logiciel et l'éditeur.
* 
Proposez un modèle conceptuel et le schéma relationnel associé.



# Gares - Villes - Pays #

Ces trois relations d'une base de données touristique, représentent des gares, situées dans des villes, elles-mêmes situées dans des pays :

* Gares (nom_gare, n°ville)
* Villes (n°ville, nom_ville, nb_habitants, n°pays)
* Pays (n°pays, nom_pays)
* 
Ecrivez en algèbre relationnelle et en SQL les requêtes suivantes :

* Pour les villes avec plus de 1.000.000 d'habitants, indiquer les noms des gares.
* Donnez le nom du pays et de la ville où se trouve la "Stazione Termini".


