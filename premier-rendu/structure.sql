-- Table des Utilisateurs

CREATE TABLE IF NOT EXISTS `Utilisateurs` (
         `Identifiant` INT NOT NULL AUTO_INCREMENT,
         `Pseudo` varchar(48) NULL,
         `Email` varchar(254) NOT NULL,
         -- Le mot de passe ne devra bien sûr pas être stocké en clair
         `Password` text NOT NULL,
         -- Sur la base de données sera stocké un lien vers la
         -- photo dans notre serveur
         `Photo` text,
         PRIMARY KEY(`Identifiant`)
);

-- Table des Plats

CREATE TABLE IF NOT EXISTS `Plats` (
         `Identifiant` INT NOT NULL AUTO_INCREMENT,
         `Nom` varchar(48) NOT NULL,
         `Photo` text,
         `Prix` INT,
         `Recette` text NOT NULL,
         `Auteur` INT,
         PRIMARY KEY(`Identifiant`),
         FOREIGN KEY(`Auteur`) REFERENCES `Utilisateurs`(`Identifiant`)
);

-- Table des Ingrédients

CREATE TABLE IF NOT EXISTS `Ingrédients` (
         `Nom` varchar(48) NOT NULL,
         PRIMARY KEY(`Nom`)
);

-- Table des Commentaires

CREATE TABLE IF NOT EXISTS `Commentaires` (
         `Identifiant` INT AUTO_INCREMENT,
         `Auteur` INT NOT NULL,
         `Date` DATETIME NOT NULL DEFAULT NOW(),
         `Contenu` text NOT NULL,
         PRIMARY KEY(`Identifiant`),
         FOREIGN KEY(`Auteur`) REFERENCES `Utilisateurs`(`Identifiant`)
);

-- Table des Likes/Dislikes

CREATE TABLE IF NOT EXISTS `Likes` (
         `Commentaire` INT NOT NULL,
         `Utilisateur` INT NOT NULL,
         `Like` BOOLEAN NOT NULL,
         PRIMARY KEY(`Commentaire`, `Utilisateur`),
         FOREIGN KEY(`Commentaire`) REFERENCES `Commentaires`(`Identifiant`),
         FOREIGN KEY(`Utilisateur`) REFERENCES `Utilisateurs`(`Identifiant`)
);

-- Table des Réactions/Emojis

CREATE TABLE IF NOT EXISTS `Réactions` (
         `Utilisateur` INT NOT NULL,
         `Plat` INT NOT NULL,
         `Réaction` TINYINT NOT NULL,
         PRIMARY KEY(`Utilisateur`, `Plat`, `Réaction`),
         FOREIGN KEY(`Utilisateur`) REFERENCES `Utilisateurs`(`Identifiant`),
         FOREIGN KEY(`Plat`) REFERENCES `Plats`(`Identifiant`)
);

-- Table des Ingrédients-Plats

CREATE TABLE IF NOT EXISTS `IngrédientsPlats` (
         `Plat` INT NOT NULL,
         `Ingrédient` varchar(48) NOT NULL,
         `Quantité` INT NOT NULL,
         `Unité` varchar(48) NOT NULL,
         PRIMARY KEY(`Plat`, `Ingrédient`),
         FOREIGN KEY(`Plat`) REFERENCES `Plats`(`Identifiant`),
         FOREIGN KEY(`Ingrédient`) REFERENCES `Ingrédients`(`Nom`)
);

-- Table des Réponses

CREATE TABLE IF NOT EXISTS `Réponses` (
         `Réponse` INT NOT NULL,
         `Parent` INT NOT NULL,
         PRIMARY KEY(`Réponse`, `Parent`),
         FOREIGN KEY(`Réponse`) REFERENCES `Commentaires`(`Identifiant`),
         FOREIGN KEY(`Parent`) REFERENCES `Commentaires`(`Identifiant`)
);
