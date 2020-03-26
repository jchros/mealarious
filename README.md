# mealarious

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
