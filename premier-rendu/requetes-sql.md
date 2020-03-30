# Requêtes SQL

## Liste des commentaires de haut niveau

```mariadb
SELECT `Commentaires`.`Identifiant` AS "ID Commentaire"
FROM   `Commentaires`, `Réponses`
WHERE  `Commentaires`.`Identifiant` != `Réponses`.`Réponse`;
```

### Résultat

![liste-commentaires-premier-niveau](/Users/chrosrovajason/Developer/mealarious/premier-rendu/requetes-sql.assets/liste-commentaires-premier-niveau.png)

## Liste des réactions sur une recette par utilisateur

```mariadb
SELECT `Utilisateurs`.`Pseudo`, `Plats`.`Nom`, `Réactions`.`Réaction`
FROM   `Utilisateurs`, `Plats`, `Réactions`
WHERE  `Réactions`.`Utilisateur` = `Utilisateurs`.`Identifiant`
AND    `Réactions`.`Plat`        = `Plats`.`Identifiant`;
```

### Résultat

![before-reactions](/Users/chrosrovajason/Developer/mealarious/premier-rendu/requetes-sql.assets/before-reactions.png)

## Nombre d'utilisateurs ayant une photo de profil dans la base de données

```mariadb
SELECT COUNT(*)
FROM   `Utilisateurs`
WHERE  `Photo` IS NOT NULL;
```

### Résultat

![list-usrs-with-profile-pic](/Users/chrosrovajason/Developer/mealarious/premier-rendu/requetes-sql.assets/list-usrs-with-profile-pic.png)

## Anonymiser un utilisateur

```mariadb
UPDATE `Utilisateurs`
SET    `Pseudo` = NULL,
       `Email` = "",
       `Password` = ""
WHERE  `Pseudo` = "dejuilletanovembre";
```

### Résultat

#### Avant

![before-anonymizing](/Users/chrosrovajason/Developer/mealarious/premier-rendu/requetes-sql.assets/before-anonymizing.png)

#### Après

![after-reactions](/Users/chrosrovajason/Developer/mealarious/premier-rendu/requetes-sql.assets/after-reactions.png)

## Remettre à zéro les réactions d'un utilisateur sur une recette

```mariadb
DELETE FROM `Réactions`
WHERE       `Plat`        = (SELECT `Identifiant`
                             FROM   `Plats`
                             WHERE  `Nom` = "Hot-dog végan")
AND         `Utilisateur` = (SELECT `Identifiant`
                             FROM   `Utilisateurs`
                             WHERE  `Pseudo` = "lambda-mu");
```

### Résultats

#### Avant

![before-reactions](/Users/chrosrovajason/Developer/mealarious/premier-rendu/requetes-sql.assets/before-reactions-5603521.png)

#### Après

![after-reactions](/Users/chrosrovajason/Developer/mealarious/premier-rendu/requetes-sql.assets/after-reactions-5603515.png)
