# Python_ENSG_Geomatique

Cours d'initiation aux bases de données initialement conçu pour des étudiants de divers cycles de l'[ENSG Géomatique](http://www.ensg.eu).


## Pré-requis

A priori aucun, si ce n'est l'envie d'apprendre ;-)


## Ce que ce cours contient

Ce cours est constituée d'un support de cours général et de deux présentations : une première centrée sur la partie modélisation et une seconde sur la partie SQL. Des exercices accompagnent ces supports de cours.


## Regénérer les slides et pdf par vous même
Les supports de cours sont rédigés en markdown. La génération des documents finaux (cours et TP en pdf, présentations en HTML) fait appel à l'utilitaire [pandoc](https://pandoc.org/). Pour les présentations la libraire [reveal.js](https://revealjs.com/#/) doit avoir été téléchargée pour bénéficier de la mise en page correcte.

Les lignes de commande permettant de générer les documents à partir des sources sont listées ci-dessous :

* Le support de cours général :
```
pandoc -s -N --listings --template=template/template.latex -o Cours_BDD.pdf Cours_BDD.md
```

* Les présentations :
```
pandoc -s -t html5 --template=template/ign-ensg-revealjs.html --section-divs -o Presentation_BDD.html Presentation_BDD.md

pandoc -s -t html5 --template=template/ign-ensg-revealjs.html --section-divs -o Presentation_SQL.html Presentation_SQL.md
```

* Les exercices :
```
pandoc -s -N --listings --template=template/template_tp.latex -o Exercices/Exercices_modelisation.pdf Exercices/Exercices_modelisation.md
```
