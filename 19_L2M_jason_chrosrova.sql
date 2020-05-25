-- phpMyAdmin SQL Dump
-- version 4.4.15.10
-- https://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 25, 2020 at 05:51 AM
-- Server version: 10.3.22-MariaDB
-- PHP Version: 5.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `19_L2M_jason_chrosrova`
--

-- --------------------------------------------------------

--
-- Table structure for table `Commentaires`
--

CREATE TABLE IF NOT EXISTS `Commentaires` (
  `Identifiant` int(11) NOT NULL,
  `Auteur` int(11) NOT NULL,
  `Date` datetime NOT NULL DEFAULT current_timestamp(),
  `Contenu` text NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Commentaires`
--

INSERT INTO `Commentaires` (`Identifiant`, `Auteur`, `Date`, `Contenu`) VALUES
(1, 5, '2020-03-30 22:42:59', 'Ce plat m''a fait vomir la première fois que je l''ai préparé.  Je ne souhaiterais pas cette recette à mon pire ennemi.  10/10 À refaire.'),
(2, 2, '2020-03-30 22:44:09', 'Content de voir que cette recette te plaît, dejuilletanovembre! :)');

-- --------------------------------------------------------

--
-- Table structure for table `Ingrédients`
--

CREATE TABLE IF NOT EXISTS `Ingrédients` (
  `Nom` varchar(48) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `IngrédientsPlats`
--

CREATE TABLE IF NOT EXISTS `IngrédientsPlats` (
  `Plat` int(11) NOT NULL,
  `Ingrédient` varchar(48) NOT NULL,
  `Quantité` int(11) NOT NULL,
  `Unité` varchar(48) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Likes`
--

CREATE TABLE IF NOT EXISTS `Likes` (
  `Commentaire` int(11) NOT NULL,
  `Utilisateur` int(11) NOT NULL,
  `Like` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Likes`
--

INSERT INTO `Likes` (`Commentaire`, `Utilisateur`, `Like`) VALUES
(1, 2, 1),
(1, 3, 1),
(2, 5, 1);

-- --------------------------------------------------------

--
-- Table structure for table `Plats`
--

CREATE TABLE IF NOT EXISTS `Plats` (
  `Identifiant` int(11) NOT NULL,
  `Nom` varchar(48) NOT NULL,
  `Photo` text DEFAULT NULL,
  `Prix` int(11) DEFAULT NULL,
  `Recette` text NOT NULL,
  `Auteur` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Plats`
--

INSERT INTO `Plats` (`Identifiant`, `Nom`, `Photo`, `Prix`, `Recette`, `Auteur`) VALUES
(1, 'Hot-dog végan', NULL, 20, '', 2);

-- --------------------------------------------------------

--
-- Table structure for table `Réactions`
--

CREATE TABLE IF NOT EXISTS `Réactions` (
  `Utilisateur` int(11) NOT NULL,
  `Plat` int(11) NOT NULL,
  `Réaction` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Réactions`
--

INSERT INTO `Réactions` (`Utilisateur`, `Plat`, `Réaction`) VALUES
(5, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `Réponses`
--

CREATE TABLE IF NOT EXISTS `Réponses` (
  `Réponse` int(11) NOT NULL,
  `Parent` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Réponses`
--

INSERT INTO `Réponses` (`Réponse`, `Parent`) VALUES
(2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `Utilisateurs`
--

CREATE TABLE IF NOT EXISTS `Utilisateurs` (
  `Identifiant` int(11) NOT NULL,
  `Pseudo` varchar(48) DEFAULT NULL,
  `Email` varchar(254) NOT NULL,
  `Password` text NOT NULL,
  `Photo` text DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Utilisateurs`
--

INSERT INTO `Utilisateurs` (`Identifiant`, `Pseudo`, `Email`, `Password`, `Photo`) VALUES
(2, 'somerandomuser123', 'throwaway@yopmail.com', 'vjqSb$)CBlXCPHgxGO7$', NULL),
(3, 'lambda-mu', 'another.throwaway@yopmail.com', 'BL)K*0(moHNGIYN!Mp3.', 'cool-cat.jpg'),
(5, 'dejuilletanovembre', 'jason.chrosrova@etu.univ-tlse2.fr', 'o2%)3Y2^g)dhf4KXoX#p', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Commentaires`
--
ALTER TABLE `Commentaires`
  ADD PRIMARY KEY (`Identifiant`),
  ADD KEY `Auteur` (`Auteur`);

--
-- Indexes for table `Ingrédients`
--
ALTER TABLE `Ingrédients`
  ADD PRIMARY KEY (`Nom`);

--
-- Indexes for table `IngrédientsPlats`
--
ALTER TABLE `IngrédientsPlats`
  ADD PRIMARY KEY (`Plat`,`Ingrédient`),
  ADD KEY `Ingrédient` (`Ingrédient`);

--
-- Indexes for table `Likes`
--
ALTER TABLE `Likes`
  ADD PRIMARY KEY (`Commentaire`,`Utilisateur`),
  ADD KEY `Utilisateur` (`Utilisateur`);

--
-- Indexes for table `Plats`
--
ALTER TABLE `Plats`
  ADD PRIMARY KEY (`Identifiant`),
  ADD KEY `Auteur` (`Auteur`);

--
-- Indexes for table `Réactions`
--
ALTER TABLE `Réactions`
  ADD PRIMARY KEY (`Utilisateur`,`Plat`,`Réaction`),
  ADD KEY `Plat` (`Plat`);

--
-- Indexes for table `Réponses`
--
ALTER TABLE `Réponses`
  ADD PRIMARY KEY (`Réponse`,`Parent`),
  ADD KEY `Parent` (`Parent`);

--
-- Indexes for table `Utilisateurs`
--
ALTER TABLE `Utilisateurs`
  ADD PRIMARY KEY (`Identifiant`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Commentaires`
--
ALTER TABLE `Commentaires`
  MODIFY `Identifiant` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `Plats`
--
ALTER TABLE `Plats`
  MODIFY `Identifiant` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `Utilisateurs`
--
ALTER TABLE `Utilisateurs`
  MODIFY `Identifiant` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `Commentaires`
--
ALTER TABLE `Commentaires`
  ADD CONSTRAINT `Commentaires_ibfk_1` FOREIGN KEY (`Auteur`) REFERENCES `Utilisateurs` (`Identifiant`);

--
-- Constraints for table `IngrédientsPlats`
--
ALTER TABLE `IngrédientsPlats`
  ADD CONSTRAINT `IngrédientsPlats_ibfk_1` FOREIGN KEY (`Plat`) REFERENCES `Plats` (`Identifiant`),
  ADD CONSTRAINT `IngrédientsPlats_ibfk_2` FOREIGN KEY (`Ingrédient`) REFERENCES `Ingrédients` (`Nom`);

--
-- Constraints for table `Likes`
--
ALTER TABLE `Likes`
  ADD CONSTRAINT `Likes_ibfk_1` FOREIGN KEY (`Commentaire`) REFERENCES `Commentaires` (`Identifiant`),
  ADD CONSTRAINT `Likes_ibfk_2` FOREIGN KEY (`Utilisateur`) REFERENCES `Utilisateurs` (`Identifiant`);

--
-- Constraints for table `Plats`
--
ALTER TABLE `Plats`
  ADD CONSTRAINT `Plats_ibfk_1` FOREIGN KEY (`Auteur`) REFERENCES `Utilisateurs` (`Identifiant`);

--
-- Constraints for table `Réactions`
--
ALTER TABLE `Réactions`
  ADD CONSTRAINT `Réactions_ibfk_1` FOREIGN KEY (`Utilisateur`) REFERENCES `Utilisateurs` (`Identifiant`),
  ADD CONSTRAINT `Réactions_ibfk_2` FOREIGN KEY (`Plat`) REFERENCES `Plats` (`Identifiant`);

--
-- Constraints for table `Réponses`
--
ALTER TABLE `Réponses`
  ADD CONSTRAINT `Réponses_ibfk_1` FOREIGN KEY (`Réponse`) REFERENCES `Commentaires` (`Identifiant`),
  ADD CONSTRAINT `Réponses_ibfk_2` FOREIGN KEY (`Parent`) REFERENCES `Commentaires` (`Identifiant`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
