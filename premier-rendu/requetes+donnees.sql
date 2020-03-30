ALTER TABLE `Commentaires` AUTO_INCREMENT=1;

INSERT INTO `Utilisateurs`(`Pseudo`, `Email`, `Password`, `Photo`)
VALUES ("dejuilletanovembre",  "jason.chrosrova@etu.univ-tlse2.fr",  "o2%)3Y2^g)dhf4KXoX#p", NULL),
       ("somerandomuser123",   "throwaway@yopmail.com",              "vjqSb$)CBlXCPHgxGO7$", NULL),
       ("lambda-mu",           "another.throwaway@yopmail.com",      "BL)K*0(moHNGIYN!Mp3.", "cool-cat.jpg");

INSERT INTO `Plats` (`Nom`, `Photo`, `Prix`, `Auteur`, `Recette`)
VALUES ("Hot-dog végan", NULL, 20,
       (SELECT  `Identifiant`
        FROM    `Utilisateurs`
        WHERE   `Pseudo` = "somerandomuser123"),
"Ouvrez le sachet de ramen et versez son contenu dans de l'eau bouillante.
");

INSERT INTO `Commentaires`(`Auteur`, `Date`, `Contenu`)
VALUES ((SELECT `Identifiant`
         FROM   `Utilisateurs`
         WHERE  `Pseudo` = "dejuilletanovembre"),
         NOW(),
         "Ce plat m'a fait vomir la première fois que je l'ai préparé.  Je ne souhaiterais pas cette recette à mon pire ennemi.  10/10 À refaire."),
       ((SELECT `Identifiant`
         FROM   `Utilisateurs`
         WHERE  `Pseudo` = "somerandomuser123"),
        NOW(),
        "Content de voir que cette recette te plaît, dejuilletanovembre! :)");

INSERT INTO `Réponses`(`Réponse`, `Parent`)
VALUES (2, 1);

INSERT INTO `Réactions`(`Utilisateur`, `Plat`, `Réaction`)
VALUES ((SELECT `Identifiant`
         FROM   `Utilisateurs`
         WHERE  `Pseudo` = "dejuilletanovembre"),
        (SELECT `Identifiant`
         FROM    `Plats`
         WHERE   `Nom` = "Hot-dog végan"),
        1),
       ((SELECT `Identifiant`
         FROM   `Utilisateurs`
         WHERE  `Pseudo` = "lambda-mu"),
        (SELECT `Identifiant`
         FROM    `Plats`
         WHERE   `Nom` = "Hot-dog végan"),
        2);

INSERT INTO `Ingrédients`(`Nom`)
VALUES ("Ramen"), ("Pain hot-dog");

INSERT INTO `IngrédientsPlats`(`Plat`, `Ingrédient`, `Quantité`, `Unité`)
VALUES ((SELECT `Identifiant`
         FROM   `Plats`
         WHERE  `Nom` = "Hot-dog végan"),
        "Ramen", 1, "sachet"),
       ((SELECT `Identifiant`
         FROM   `Plats`
         WHERE  `Nom` = "Hot-dog végan"),
        "Pain hot-dog", 1, "pain");

INSERT INTO `Likes`(`Commentaire`, `Utilisateur`, `Like`)
VALUES (1,
        (SELECT `Identifiant`
         FROM   `Utilisateurs`
         WHERE  `Pseudo` = "lambda-mu"),
       TRUE),
       (1,
        (SELECT `Identifiant`
         FROM   `Utilisateurs`
         WHERE  `Pseudo` = "somerandomuser123"),
       TRUE),
       (2,
        (SELECT `Identifiant`
         FROM   `Utilisateurs`
         WHERE  `Pseudo` = "dejuilletanovembre"),
       TRUE);

-- Liste des commentaires de haut niveau
SELECT `Commentaires`.`Identifiant` AS "ID Commentaire"
FROM   `Commentaires`, `Réponses`
WHERE  `Commentaires`.`Identifiant` != `Réponses`.`Réponse`;

-- Liste des réactions sur une recette par utilisateur
SELECT `Utilisateurs`.`Pseudo`, `Plats`.`Nom`, `Réactions`.`Réaction`
FROM   `Utilisateurs`, `Plats`, `Réactions`
WHERE  `Réactions`.`Utilisateur` = `Utilisateurs`.`Identifiant`
AND    `Réactions`.`Plat`        = `Plats`.`Identifiant`;

-- Nombre d'utilisateurs ayant une photo de profil dans la base de données
SELECT COUNT(*)
FROM   `Utilisateurs`
WHERE  `Photo` IS NOT NULL;

-- Anonymiser un utilisateur
UPDATE `Utilisateurs`
SET    `Pseudo` = NULL,
       `Email` = "",
       `Password` = ""
WHERE  `Pseudo` = "dejuilletanovembre";

-- Remetre à zéro les réactions d'un utilisateur sur une recette
DELETE FROM `Réactions`
WHERE       `Plat`        = (SELECT `Identifiant`
                             FROM   `Plats`
                             WHERE  `Nom` = "Hot-dog végan")
AND         `Utilisateur` = (SELECT `Identifiant`
                             FROM   `Utilisateurs`
                             WHERE  `Pseudo` = "lambda-mu");
