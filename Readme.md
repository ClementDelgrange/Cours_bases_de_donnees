Cours d'introduction aux bases de données : modélisation et langage SQL.

1. Installation de pandoc : <http://pandoc.org/installing.html>

2. Commandes à exécuter depuis le la racine du dépot pour générer les différents supports de cours :
	* Présentations sur la partie généralités sur les bases de données et modélisation :
    
    pandoc -s -t html5 --template=template\ign-ensg-revealjs.html --section-divs -o Presentation_BDD.html Presentation_BDD.md

    * Présentations sur le langage SQL :

    pandoc -s -t html5 --template=template\ign-ensg-revealjs.html --section-divs -o Presentation_BDD.html Presentation_BDD.md

	* Le support de cours :

    pandoc -s -N --listings --template=template\template.latex -o Cours_BDD.pdf Cours_BDD.md
    