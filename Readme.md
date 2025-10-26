# Data Warehouse - Entreprise de Gestion des Déchets Solides au Brésil
**Scénario du monde réel :** Conception d'un Data Warehouse pour aider une entreprise de gestion des déchets solides présente au Brésil, à gérer et analyser leurs données de collecte des déchets solides. Elle collecte et recycle les déchets dans les grandes villes du pays. Ils exploitent des camions de différents types pour collecter et transporter des déchets solides. l'entreprise souhaite créer un **Data Warehouse** afin de pouvoir créer des rapports tels que :
- Déchets totaux collectés par an et par ville,
- Déchets totaux collectés par mois et par ville,
- Déchets totaux collectés par trimestre et par ville,
- Déchets totaux collectés par an et par type de camion,
- Déchets totaux collectés par type de camion et par ville,
- Déchets totaux collectés par type de camion et par station et par ville.


**Exemple de données transmit par l'entreprise :**
![Data Company](<images/data-company.png>)

## Etapes du projet
- Création d'un **star schema** pour le *Data Warehouse*
- Chargement des données
- Ecriture des requêtes **SQL complexes** pour l'agrégation des données
- Création des **materialized views** pour optimisation des requêtes

## Logiciel utilisé
- **PostgreSQL** : un SGBDR conçu pour stocker, manipuler et récupérer les données de manière efficace.