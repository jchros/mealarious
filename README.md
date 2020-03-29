# mealarious

## Checklist

| Tâche                                | État        |
| ------------------------------------ | ----------- |
| Description du projet                | **Terminé** |
| Code SQL de la stucture de données   | **Terminé** |
| Jeu de données                       | *À tester*  |
| Requête SQL sans jointure            | *À tester*  |
| Requête SQL avec jointure            | *À tester*  |
| Requêtes de manipulation des données | *À tester*  |
| Captures d'écran des résultats       | À faire     |




## Pour se connecter à la base de données mariaDB

Créer un fichier `credentials.php` sur le dossier
se situant au dessus du dossier index.html.

Ce fichier doit contenir ces lignes
(remplacer les commentaires par les valeurs correspondantes):

```php
<?php
define('LOGIN', /*nom d'utilisateur*/);
define('PASSWRD', /*mot de passe pour se connecter à SQL*/);
define('SERVER', /*adresse du serveur*/);
define('DB', /*nom de la base de données*/);
?>
```
