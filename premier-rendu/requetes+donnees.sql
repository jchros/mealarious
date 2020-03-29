ALTER TABLE `Commentaires` AUTO_INCREMENT=1;

INSERT INTO `Utilisateurs`(`Pseudo`, `Email`, `Password`, `Photo`)
VALUES   ("dejuilletanovembre",  "jason.chrosrova@etu.univ-tlse2.fr",  "o2%)3Y2^g)dhf4KXoX#p", NULL),
         ("somerandomuser123",   "throwaway@yopmail.com",              "vjqSb$)CBlXCPHgxGO7$", NULL);

INSERT INTO `Plats` (`Nom`, `Photo`, `Prix`, `Auteur`, `Recette`)
VALUES   ("Hot-dog végan", NULL, 20,
         (SELECT  `Identifiant`
          FROM    `Utilisateurs`
          WHERE   `Pseudo` = "somerandomuser123"),
         "");

INSERT INTO `Commentaires`(`Auteur`, `Date`, `Contenu`)
VALUES   ((SELECT `Identifiant`
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
VALUES   (1, 2);

INSERT INTO `Réactions`(`Utilisateur`, `Plat`, `Réaction`)
VALUES   ((SELECT `Identifiant`
           FROM   `Utilisateurs`
           WHERE  `Pseudo` = "dejuilletanovembre"),
          (SELECT `Identifiant`
           FROM    `Plats`
           WHERE   `Nom` = "Hot-dog végan"),
          1);

-- Liste des commentaires de haut niveau
SELECT   `Commentaires`.`Identifiant` AS "ID Commentaire"
FROM     `Commentaires`,  `Réponses`
WHERE    `Commentaires`.`Identifiant` != `Réponses`.`Réponse`;

-- Nombre de likes par commentaire
SELECT   `Commentaires`.`Identifiant` AS "Identifiant",
         COUNT(* WHERE `Like`)        AS "Likes",
         COUNT(* WHERE NOT `Like`)    AS "Dislike"
FROM     `Commentaires`, `Likes`
WHERE    `Commentaires`.`Identifiant` = `Likes`.`Commentaire`;

-- Nombre d'utilisateurs ayant une photo de profil dans la base de données
SELECT   COUNT(*)
FROM     `Utilisateurs`
WHERE    `Photo` IS NOT NULL;

-- Retirer un utilisateur et toutes ses mentions de la base de données
UPDATE   `Plats`
SET      `Auteur` = NULL
WHERE    `Auteur` = "dejuilletanovembre";

UPDATE   `Commentaires`
SET      `Auteur` = NULL
WHERE    `Auteur` = "dejuilletanovembre";

UPDATE   `Utilisateurs`
SET      `Pseudo` = NULL,
         `Email` = "",
         `Password` = ""
WHERE    `Pseudo` = "dejuilletanovembre";

-- Remmetre à zéro les réactions d'un utilisateur sur une recette
DELETE FROM `Réactions`
WHERE       `Plat` = <#Identifiant du plat#>
AND         `Utilisateur` = "dejuilletanovembre";
