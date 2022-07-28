# Première version de l'annuaire
Cet annuaire a pour but de répertorier et afficher plusieurs entreprises proposant de l'aide ou de l'emploi aux freelances. Elle est composée d'une section "Recherche rapide", "Recherche détaillée" et "Annuaire Complet".

La section "Recherche rapide" fait le tri des entreprises selon leur domaine d'expertise uniquement.

La section "Recherche détaillée" fait le tri des entreprises selon leur domaine d'expertise et selon leur nombre de freelance actifs et leur TJM.
## Attention
Les entreprises n'ayant pas renseigné leur nombre de freelance actifs ou leur TJM n'apparaissent pas en résulat de la "Recherche détaillée".

La section "Annuaire Complet" affiche l'intégralité des entreprises ayant partage leurs données. Les lignes où les informations n'ont pas été entrées sont supprimées.

## Dans le cas de modification des données d'une ou plusieurs entreprises
Il faut mettre à jour les données dans la table 'Société'. Si le lieu d'activité vient à être modifié, il faut aussi mettre la table Societe_zonesGeographiques à jour.
La table Societe_zonesGeographiques permet de savoir dans quels lieux exerce une entreprise.

## Dans le cas de l'ajout d'une ou plusieurs entreprises
Il faut ajouter les données dans la table 'Société'. Une nouvelle ligne par entreprise. Pour les lieus d'activité, il faut les ajouter à la table Societe_zonesGeographiques.
La première valeur correspond à l'ID de la Société crée. La seconde valeur correspond à un lieu d'activité (1 pour l'Île de France, 2 pour Régions, 3 pour International (cf. table zonesGeographiques)).
Il faut donc ajouter autant de valeurs qu'il y a de lieux d'activités différents pour une entreprise créée.

## Pour la mise en ligne du serveur Web sur AWS
La fonctionnalité RDS de AWS permet la création de Bases de Données. Je n'ai pas trouvé de moyen d'importer facilement de fichier .sql dans la base de données.
Dans le fichier .php, il faut quatre valeurs pour se connecter à une base de donnée : 
- l'adresse IP de la base de données
- le nom d'utilisateur pour se connecter à la base de données
- le mot de passe pour se connecter à la base de données
- le nom de la base de données
Ces quatre informations une fois obtenues sont à mettre à jour dans le fichier .php (lignes 104, 143 et 205). Il est aussi possible de créer des variables pour éviter les répétitions, ce que j'ai décidé de ne pas faire.

(Information non sûre : L'IP se trouve dans l'onglet VPC de la console RDS)
(Pour l'admit, il faut aller dans l'onglet configuration de la console RDS)
(Pour le mot de passe, il faudrait demander un nouveau mot de passe pour la base de données : https://aws.amazon.com/fr/premiumsupport/knowledge-center/reset-master-user-password-rds/, https://serverfault.com/questions/950963/how-to-see-what-is-my-amazon-rds-password)

En cas de questionnement sur le fonctionnement d'une fonction ou d'une option, merci de me contacter à l'adresse mail suivante : karim.filali@etu.u-paris.fr

Merci