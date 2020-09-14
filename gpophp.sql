-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3308
-- Généré le :  ven. 11 sep. 2020 à 18:18
-- Version du serveur :  8.0.18
-- Version de PHP :  7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `gpophp`
--

-- --------------------------------------------------------

--
-- Structure de la table `avoir`
--

DROP TABLE IF EXISTS `avoir`;
CREATE TABLE IF NOT EXISTS `avoir` (
  `ID_Question` int(11) NOT NULL,
  `ID_Type` int(11) NOT NULL,
  `numGroupe` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_Question`,`ID_Type`),
  KEY `AVOIR_Type_Formulaire0_FK` (`ID_Type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `avoir`
--

INSERT INTO `avoir` (`ID_Question`, `ID_Type`, `numGroupe`) VALUES
(1, 1, 1),
(2, 1, 1),
(4, 1, 1),
(5, 1, 1),
(6, 1, 1),
(7, 1, 2),
(8, 1, 2),
(9, 1, 2),
(10, 1, 2),
(11, 1, 2),
(12, 1, 2),
(13, 1, 3),
(14, 1, 3),
(18, 1, 4),
(19, 1, 4),
(28, 1, 1),
(29, 1, 2),
(35, 1, 3),
(38, 1, 5),
(55, 1, 2);

-- --------------------------------------------------------

--
-- Structure de la table `choix_question`
--

DROP TABLE IF EXISTS `choix_question`;
CREATE TABLE IF NOT EXISTS `choix_question` (
  `Ordre_Choix` int(11) NOT NULL,
  `Libel_Choix` varchar(50) NOT NULL,
  `ID_Question` int(11) NOT NULL,
  PRIMARY KEY (`Ordre_Choix`,`ID_Question`),
  KEY `ID_Question` (`ID_Question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `choix_question`
--

INSERT INTO `choix_question` (`Ordre_Choix`, `Libel_Choix`, `ID_Question`) VALUES
(1, 'Salon de l’Étudiant (Marseille)', 13),
(1, 'Facebook', 17),
(2, 'Forum Chevreul Blancarde – DDEC (Marseille)', 13),
(2, 'Instagram', 17),
(3, 'Forum du Lycée Sainte-Marie (Gignac-la-Nerthe)', 13),
(3, 'Twitter', 17),
(4, 'Forum Saint Jean de Garguier (Aubagne)', 13),
(5, 'Forum Sainte Elisabeth (Pennes Mirabeau)', 13),
(6, 'Forum Sainte Marie (Aubagne)', 13),
(7, 'Forum Ecole Libre des Métiers / Saint Michel Techn', 13);

-- --------------------------------------------------------

--
-- Structure de la table `etre`
--

DROP TABLE IF EXISTS `etre`;
CREATE TABLE IF NOT EXISTS `etre` (
  `Id_Reponse` int(11) NOT NULL,
  `Ordre_Choix` int(11) NOT NULL,
  PRIMARY KEY (`Id_Reponse`,`Ordre_Choix`),
  KEY `ETRE_Choix_Question0_FK` (`Ordre_Choix`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `exemplaire`
--

DROP TABLE IF EXISTS `exemplaire`;
CREATE TABLE IF NOT EXISTS `exemplaire` (
  `Id_Formulaire` int(11) NOT NULL AUTO_INCREMENT,
  `Date_Envoi` date NOT NULL,
  `Id_Utilisateur` int(11) NOT NULL,
  PRIMARY KEY (`Id_Formulaire`),
  KEY `Exemplaire_Utilisateur_FK` (`Id_Utilisateur`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `exemplaire`
--

INSERT INTO `exemplaire` (`Id_Formulaire`, `Date_Envoi`, `Id_Utilisateur`) VALUES
(2, '0000-00-00', 1);

-- --------------------------------------------------------

--
-- Structure de la table `inclure`
--

DROP TABLE IF EXISTS `inclure`;
CREATE TABLE IF NOT EXISTS `inclure` (
  `ID_Question` int(11) NOT NULL,
  `idRepDeroulant` int(11) NOT NULL,
  `questionLiee` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_Question`,`idRepDeroulant`),
  KEY `inclure_reponseDeroulant0_FK` (`idRepDeroulant`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `inclure`
--

INSERT INTO `inclure` (`ID_Question`, `idRepDeroulant`, `questionLiee`) VALUES
(7, 29, NULL),
(7, 30, NULL),
(7, 31, NULL),
(7, 32, NULL),
(7, 33, NULL),
(8, 29, NULL),
(8, 30, NULL),
(8, 31, NULL),
(8, 32, NULL),
(8, 33, NULL),
(11, 7, 29),
(11, 8, 30),
(11, 9, 31),
(11, 10, 32),
(11, 11, NULL),
(29, 1, NULL),
(29, 2, NULL),
(30, 3, NULL),
(30, 4, NULL),
(30, 5, NULL),
(30, 6, NULL),
(31, 3, NULL),
(31, 4, 0),
(31, 5, 0),
(31, 6, 0),
(32, 12, 0),
(32, 13, NULL),
(32, 14, 0),
(32, 15, NULL),
(32, 16, 0),
(32, 17, NULL),
(32, 18, 0),
(32, 19, NULL),
(32, 20, 0),
(32, 21, NULL),
(32, 22, 0),
(32, 23, NULL),
(32, 24, NULL),
(32, 25, 0),
(32, 26, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `modifier`
--

DROP TABLE IF EXISTS `modifier`;
CREATE TABLE IF NOT EXISTS `modifier` (
  `Id_Utilisateur` int(11) NOT NULL,
  `ID_Type` int(11) NOT NULL,
  PRIMARY KEY (`Id_Utilisateur`,`ID_Type`),
  KEY `Modifier_Type_Formulaire0_FK` (`ID_Type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `question`
--

DROP TABLE IF EXISTS `question`;
CREATE TABLE IF NOT EXISTS `question` (
  `ID_Question` int(11) NOT NULL AUTO_INCREMENT,
  `Libel_Question` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Type_Question` varchar(50) NOT NULL,
  `Ordre_Question` int(11) DEFAULT NULL,
  `affichage` tinyint(1) DEFAULT NULL,
  `questionLiee` varchar(50) NOT NULL,
  PRIMARY KEY (`ID_Question`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `question`
--

INSERT INTO `question` (`ID_Question`, `Libel_Question`, `Type_Question`, `Ordre_Question`, `affichage`, `questionLiee`) VALUES
(1, 'Nom', 'texte', 1, 1, ''),
(2, 'Prenom', 'texte', 2, 1, ''),
(3, 'Email', 'email', 4, 1, ''),
(4, 'Date de naissance', 'date', 5, 1, ''),
(5, 'Telephone1', 'texte', 6, 1, ''),
(6, 'Telephone2', 'texte', 7, 1, ''),
(7, 'LV1', 'deroulant', 8, 1, ''),
(8, 'LV2', 'deroulant', 9, 1, ''),
(9, 'Classe actuelle', 'deroulant', 10, 1, ''),
(10, 'Etablissement', 'texte', 11, 1, ''),
(11, 'Classe demandée', 'deroulant', 12, 1, ''),
(12, 'heure', 'number', 0, 1, ''),
(13, 'Dans quel salon ?', 'checkboxGroup', 0, 1, ''),
(14, 'Suite à la venue d\'un membre de la direction dans votre établissement', 'checkbox', 0, 1, 'Q34'),
(15, 'Des mots clés?', 'texte', 16, 1, ''),
(16, 'un site internet?', 'texte', 17, 1, ''),
(17, 'un réseau social?', 'checkboxGroup', 18, 1, ''),
(18, 'Par un Conseiller(ère) d\'Orientation?', 'checkbox', 19, 1, 'Q36-37'),
(19, 'Grâce à un encart publicitaire sur l\'ONISEP ?', 'checkbox', 20, 1, 'Q20-21'),
(20, 'Sur le site de l\'onisep.fr?', 'checkbox', 21, 1, ''),
(21, 'sur une brochure?', 'checkbox', 22, 1, 'Q22-23'),
(22, 'brochure \"apres la 3eme\" ?', 'checkbox', 23, 1, ''),
(23, 'brochure \"apres la Terminale?\"', 'checkbox', 24, 1, ''),
(24, 'Famille?', 'checkbox', 25, 1, 'Q39'),
(25, 'Amis?', 'checkbox', 26, 1, 'Q40'),
(26, 'Ancien élève?', 'checkbox', 27, 1, 'Q41'),
(27, 'Autres (précisez)', 'texte', 28, 1, ''),
(28, 'Non participant?', 'checkbox', 3, 1, ''),
(29, 'Quelle Seconde?', 'deroulant', 13, 0, 'Q11R5'),
(30, 'Quelle Première?', 'deroulant', 14, 0, 'Q11R8'),
(31, 'Quelle Terminale', 'deroulant', 15, 0, 'Q11R12'),
(32, 'Quel Post-bac?', 'deroulant', 16, 0, 'Q11R18'),
(33, 'Autre? (Précisez)', 'texte', NULL, 0, ''),
(34, 'Par qui? (Membre de la direction)', 'texte', NULL, 1, ''),
(35, 'Après une recherche sur Internet?', 'checkbox', 17, 1, 'Q15-16-17'),
(36, 'Qui? (orientation)', 'texte', NULL, 1, ''),
(37, 'Où? (orientation', 'texte', NULL, 1, ''),
(38, 'Grâce à du bouche à oreille?', 'checkbox', NULL, 1, 'Q24-25-26-27'),
(39, 'Précisez (famille)', 'texte', NULL, 1, ''),
(40, 'Précisez (amis)', 'texte', NULL, 1, ''),
(41, 'Précisez(ancien élève)', 'texte', NULL, 1, ''),
(43, 'Autre (Lv1)', 'texte', NULL, 1, 'Q7R47'),
(44, 'Autre (Lv2)', 'texte', NULL, 1, 'Q8R48'),
(45, 'Autre(Classe demandée)', 'texte', NULL, 1, 'Q9R57'),
(46, 'Classe actuelle collège', 'deroulant', NULL, 1, 'Q9R51'),
(47, 'Classe actuelle seconde', 'deroulant', NULL, 1, 'Q9R52'),
(48, 'Classe actuelle première', 'deroulant', NULL, 1, 'Q9R53'),
(49, 'Classe actuelle terminale', 'deroulant', NULL, 1, 'Q9R54'),
(50, 'Classe actuelle PostBac', 'deroulant', NULL, 1, 'Q9R55'),
(51, 'Autre(Collège)', 'texte', NULL, 1, 'Q46R60'),
(52, 'Autre(Seconde)', 'texte', NULL, NULL, 'Q47R63'),
(53, 'Autre(Première)', 'texte', NULL, 1, 'Q48R68'),
(54, 'Autre(Terminale)', 'texte', NULL, 1, 'Q49R76'),
(55, 'minutes', 'number', 0, 1, ''),
(57, 'Autre(PostBac)', 'texte', NULL, 1, 'Q50R85');

-- --------------------------------------------------------

--
-- Structure de la table `reponse`
--

DROP TABLE IF EXISTS `reponse`;
CREATE TABLE IF NOT EXISTS `reponse` (
  `Id_Reponse` int(11) NOT NULL AUTO_INCREMENT,
  `Libel_rep` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Heure` tinyint(4) NOT NULL,
  `min` tinyint(4) NOT NULL,
  `Date` date NOT NULL,
  `Id_Formulaire` int(11) NOT NULL,
  `ID_Question` int(11) NOT NULL,
  `Selected` tinyint(1) NOT NULL,
  `StringResponse` varchar(250) NOT NULL,
  `IntResponse` int(11) NOT NULL,
  `typeReponse` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Id_Reponse`),
  KEY `Reponse_Exemplaire_FK` (`Id_Formulaire`),
  KEY `Reponse_Question0_FK` (`ID_Question`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `reponse`
--

INSERT INTO `reponse` (`Id_Reponse`, `Libel_rep`, `Heure`, `min`, `Date`, `Id_Formulaire`, `ID_Question`, `Selected`, `StringResponse`, `IntResponse`, `typeReponse`) VALUES
(5, 'Seconde', 0, 0, '0000-00-00', 2, 11, 0, '0', 0, NULL),
(6, 'Seconde Générale', 0, 0, '0000-00-00', 2, 29, 0, '0', 0, NULL),
(7, 'Seconde Technologique', 0, 0, '0000-00-00', 2, 29, 0, '0', 0, NULL),
(8, 'Première', 0, 0, '0000-00-00', 2, 11, 0, '0', 0, NULL),
(9, 'Première ES', 0, 0, '0000-00-00', 2, 30, 0, '0', 0, NULL),
(10, 'Première S', 0, 0, '0000-00-00', 2, 30, 0, '0', 0, NULL),
(11, 'Première L', 0, 0, '0000-00-00', 2, 30, 0, '0', 0, NULL),
(12, 'Terminale', 0, 0, '0000-00-00', 2, 11, 0, '0', 0, NULL),
(13, 'Terminale ES', 0, 0, '0000-00-00', 2, 31, 0, '0', 0, NULL),
(14, 'Terminale S', 0, 0, '0000-00-00', 2, 31, 0, '0', 0, NULL),
(15, 'Terminale L', 0, 0, '0000-00-00', 2, 31, 0, '0', 0, NULL),
(16, 'Première STMG', 0, 0, '0000-00-00', 2, 30, 0, '0', 0, NULL),
(17, 'Terminale STMG', 0, 0, '0000-00-00', 2, 31, 0, '0', 0, NULL),
(18, 'Post-Bac', 0, 0, '0000-00-00', 2, 11, 0, '0', 0, NULL),
(19, '1ère BTS AM', 0, 0, '0000-00-00', 2, 32, 0, '0', 0, NULL),
(20, '2ème BTS AM', 0, 0, '0000-00-00', 2, 32, 0, '0', 0, NULL),
(21, '1ère BTS Tourisme', 0, 0, '0000-00-00', 2, 32, 0, '0', 0, NULL),
(22, '2ème BTS Tourisme', 0, 0, '0000-00-00', 2, 32, 0, '0', 0, NULL),
(23, '1ère BTS Banque', 0, 0, '0000-00-00', 2, 32, 0, '0', 0, NULL),
(24, '2ème BTS Banque', 0, 0, '0000-00-00', 2, 32, 0, '0', 0, NULL),
(25, '1ère BTS NDRC', 0, 0, '0000-00-00', 2, 32, 0, '0', 0, NULL),
(26, '2ème BTS NDRC', 0, 0, '0000-00-00', 2, 32, 0, '0', 0, NULL),
(27, '1ère BTS SIO', 0, 0, '0000-00-00', 2, 32, 0, '0', 0, NULL),
(28, '2ème BTS SIO', 0, 0, '0000-00-00', 2, 32, 0, '0', 0, NULL),
(29, '1ère DCG', 0, 0, '0000-00-00', 2, 32, 0, '0', 0, NULL),
(30, '2ème DCG', 0, 0, '0000-00-00', 2, 32, 0, '0', 0, NULL),
(31, '3ème DCG', 0, 0, '0000-00-00', 2, 32, 0, '0', 0, NULL),
(32, '1ère DSCG', 0, 0, '0000-00-00', 2, 32, 0, '0', 0, NULL),
(33, '2ème DSCG', 0, 0, '0000-00-00', 2, 32, 0, '0', 0, NULL),
(34, 'Mention Acceuil-réception', 0, 0, '0000-00-00', 2, 32, 0, '0', 0, NULL),
(35, 'Spécialisation secrétariat médical', 0, 0, '0000-00-00', 2, 32, 0, '0', 0, NULL),
(36, 'Anglais', 0, 0, '0000-00-00', 2, 7, 0, '0', 0, NULL),
(37, 'Espagnol', 0, 0, '0000-00-00', 2, 7, 0, '0', 0, NULL),
(38, 'Italien', 0, 0, '0000-00-00', 2, 7, 0, '0', 0, NULL),
(39, 'Allemand', 0, 0, '0000-00-00', 2, 7, 0, '0', 0, NULL),
(40, 'Chinois', 0, 0, '0000-00-00', 2, 7, 0, '0', 0, NULL),
(41, 'Anglais', 0, 0, '0000-00-00', 2, 8, 0, '0', 0, NULL),
(42, 'Espagnol', 0, 0, '0000-00-00', 2, 8, 0, '0', 0, NULL),
(43, 'Italien', 0, 0, '0000-00-00', 2, 8, 0, '0', 0, NULL),
(44, 'Allemand', 0, 0, '0000-00-00', 2, 8, 0, '0', 0, NULL),
(45, 'Chinois', 0, 0, '0000-00-00', 2, 8, 0, '0', 0, NULL),
(46, 'Qui?', 0, 0, '0000-00-00', 2, 34, 0, '', 0, 'texte'),
(47, 'Autre', 0, 0, '0000-00-00', 2, 7, 0, '', 0, NULL),
(48, 'Autre', 0, 0, '0000-00-00', 2, 8, 0, '', 0, 'texte'),
(49, 'Précisez', 0, 0, '0000-00-00', 2, 43, 0, '', 0, 'texte'),
(50, 'Précisez', 0, 0, '0000-00-00', 2, 44, 0, '', 0, 'texte'),
(51, 'Collège', 0, 0, '0000-00-00', 2, 9, 0, '', 0, NULL),
(52, 'Seconde', 0, 0, '0000-00-00', 2, 9, 0, '', 0, NULL),
(53, 'Première', 0, 0, '0000-00-00', 2, 9, 0, '', 0, NULL),
(54, 'Terminale', 0, 0, '0000-00-00', 2, 9, 0, '', 0, NULL),
(55, 'PostBac', 0, 0, '0000-00-00', 2, 9, 0, '', 0, NULL),
(56, 'Année Sabbatique', 0, 0, '0000-00-00', 2, 9, 0, '', 0, NULL),
(57, 'Autre', 0, 0, '0000-00-00', 2, 9, 0, '', 0, NULL),
(58, 'Précisez', 0, 0, '0000-00-00', 2, 45, 0, '', 0, NULL),
(59, 'Troisième', 0, 0, '0000-00-00', 2, 46, 0, '', 0, NULL),
(60, 'Autre', 0, 0, '0000-00-00', 2, 46, 0, '', 0, NULL),
(61, 'Seconde générale', 0, 0, '0000-00-00', 2, 47, 0, '', 0, NULL),
(62, 'Seconde Technologique', 0, 0, '0000-00-00', 2, 47, 0, '', 0, NULL),
(63, 'Autre', 0, 0, '0000-00-00', 2, 47, 0, '', 0, NULL),
(64, 'Première ES', 0, 0, '0000-00-00', 2, 48, 0, '', 0, NULL),
(65, 'Première S', 0, 0, '0000-00-00', 2, 48, 0, '', 0, NULL),
(66, 'Première L', 0, 0, '0000-00-00', 2, 48, 0, '', 0, NULL),
(67, 'Première STMG', 0, 0, '0000-00-00', 2, 48, 0, '', 0, NULL),
(68, 'Autre', 0, 0, '0000-00-00', 2, 48, 0, '', 0, NULL),
(69, 'Précisez', 0, 0, '0000-00-00', 2, 51, 0, '', 0, NULL),
(70, 'Précisez', 0, 0, '0000-00-00', 2, 52, 0, '', 0, NULL),
(71, 'Précisez', 0, 0, '0000-00-00', 2, 53, 0, '', 0, NULL),
(72, 'Terminale ES', 0, 0, '0000-00-00', 2, 49, 0, '', 0, NULL),
(73, 'Terminale S', 0, 0, '0000-00-00', 2, 49, 0, '', 0, NULL),
(74, 'Terminale L', 0, 0, '0000-00-00', 2, 49, 0, '', 0, NULL),
(75, 'Terminale STMG', 0, 0, '0000-00-00', 2, 49, 0, '', 0, NULL),
(76, 'Autre', 0, 0, '0000-00-00', 2, 49, 0, '', 0, NULL),
(77, 'Précisez', 0, 0, '0000-00-00', 2, 54, 0, '', 0, NULL),
(78, '1ere BTS SIO', 0, 0, '0000-00-00', 2, 50, 0, '', 0, NULL),
(79, '2eme BTS SIO', 0, 0, '0000-00-00', 2, 50, 0, '', 0, NULL),
(80, '1ere DCG', 0, 0, '0000-00-00', 2, 50, 0, '', 0, NULL),
(81, '2eme DCG', 0, 0, '0000-00-00', 2, 50, 0, '', 0, NULL),
(82, '3eme DCG', 0, 0, '0000-00-00', 2, 50, 0, '', 0, NULL),
(83, '1ere BTS BANQUE', 0, 0, '0000-00-00', 2, 50, 0, '', 0, NULL),
(84, '2eme BTS BANQUE', 0, 0, '0000-00-00', 2, 50, 0, '', 0, NULL),
(85, 'Autre', 0, 0, '0000-00-00', 2, 50, 0, '', 0, NULL),
(86, 'Précisez', 0, 0, '0000-00-00', 2, 57, 0, '', 0, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `reponsederoulant`
--

DROP TABLE IF EXISTS `reponsederoulant`;
CREATE TABLE IF NOT EXISTS `reponsederoulant` (
  `idRepDeroulant` int(11) NOT NULL AUTO_INCREMENT,
  `libelRepDeroulant` varchar(250) NOT NULL,
  PRIMARY KEY (`idRepDeroulant`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `reponsederoulant`
--

INSERT INTO `reponsederoulant` (`idRepDeroulant`, `libelRepDeroulant`) VALUES
(1, 'Seconde générale'),
(2, 'Seconde technologique'),
(3, 'ES'),
(4, 'S'),
(5, 'STMG'),
(6, 'L'),
(7, 'Seconde'),
(8, 'Première'),
(9, 'Terminale'),
(10, 'Post-Bac'),
(11, 'Aucun'),
(12, '1ère BTS AM'),
(13, '2ème BTS AM'),
(14, '1ère BTS Tourisme'),
(15, '2ème BTS Tourisme'),
(16, '1ère BTS Banque'),
(17, '2ème BTS Banque'),
(18, '1ère BTS NDRC'),
(19, '2ème BTS NDRC'),
(20, '1ère BTS SIO'),
(21, '2ème BTS SIO'),
(22, '1ère DCG'),
(23, '2ème DCG'),
(24, '3ème DCG'),
(25, '1ère DSCG'),
(26, '2ème DSCG'),
(27, 'Mention Acceuil-réception'),
(28, 'Spécialisation Secretariat médical'),
(29, 'Anglais'),
(30, 'Espagnol'),
(31, 'Italien'),
(32, 'Allemand'),
(33, 'Chinois');

-- --------------------------------------------------------

--
-- Structure de la table `type_formulaire`
--

DROP TABLE IF EXISTS `type_formulaire`;
CREATE TABLE IF NOT EXISTS `type_formulaire` (
  `ID_Type` int(11) NOT NULL AUTO_INCREMENT,
  `Nom_Formulaire` varchar(50) NOT NULL,
  `Date_Creation` date NOT NULL,
  `Date_Modif` date NOT NULL,
  `actif` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`ID_Type`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `type_formulaire`
--

INSERT INTO `type_formulaire` (`ID_Type`, `Nom_Formulaire`, `Date_Creation`, `Date_Modif`, `actif`) VALUES
(1, 'formulaireTest', '2020-06-06', '2020-06-06', 1);

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

DROP TABLE IF EXISTS `utilisateur`;
CREATE TABLE IF NOT EXISTS `utilisateur` (
  `Id_Utilisateur` int(11) NOT NULL AUTO_INCREMENT,
  `Identifiant` varchar(50) NOT NULL,
  `Password` varchar(50) NOT NULL,
  `Nom` varchar(50) NOT NULL,
  `Prenom` varchar(50) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Tel` varchar(50) NOT NULL,
  `Role` varchar(50) NOT NULL,
  PRIMARY KEY (`Id_Utilisateur`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
--
-- Déchargement des données de la table `utilisateur`
--

INSERT INTO `utilisateur` (`Id_Utilisateur`, `Identifiant`, `Password`, `Nom`, `Prenom`, `Email`, `Tel`, `Role`) VALUES
(1, 'latarte', 'abc', 'Latarte', 'Gérard', 'latartegerard@test.com', '0123456789', 'Referend');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `avoir`
--
ALTER TABLE `avoir`
  ADD CONSTRAINT `AVOIR_Question_FK` FOREIGN KEY (`ID_Question`) REFERENCES `question` (`ID_Question`),
  ADD CONSTRAINT `AVOIR_Type_Formulaire0_FK` FOREIGN KEY (`ID_Type`) REFERENCES `type_formulaire` (`ID_Type`);

--
-- Contraintes pour la table `choix_question`
--
ALTER TABLE `choix_question`
  ADD CONSTRAINT `choix_question_ibfk_1` FOREIGN KEY (`ID_Question`) REFERENCES `question` (`ID_Question`);

--
-- Contraintes pour la table `etre`
--
ALTER TABLE `etre`
  ADD CONSTRAINT `ETRE_Choix_Question0_FK` FOREIGN KEY (`Ordre_Choix`) REFERENCES `choix_question` (`Ordre_Choix`),
  ADD CONSTRAINT `ETRE_Reponse_FK` FOREIGN KEY (`Id_Reponse`) REFERENCES `reponse` (`Id_Reponse`);

--
-- Contraintes pour la table `exemplaire`
--
ALTER TABLE `exemplaire`
  ADD CONSTRAINT `Exemplaire_Utilisateur_FK` FOREIGN KEY (`Id_Utilisateur`) REFERENCES `utilisateur` (`Id_Utilisateur`);

--
-- Contraintes pour la table `inclure`
--
ALTER TABLE `inclure`
  ADD CONSTRAINT `inclure_Question_FK` FOREIGN KEY (`ID_Question`) REFERENCES `question` (`ID_Question`),
  ADD CONSTRAINT `inclure_reponseDeroulant0_FK` FOREIGN KEY (`idRepDeroulant`) REFERENCES `reponsederoulant` (`idRepDeroulant`);

--
-- Contraintes pour la table `modifier`
--
ALTER TABLE `modifier`
  ADD CONSTRAINT `Modifier_Type_Formulaire0_FK` FOREIGN KEY (`ID_Type`) REFERENCES `type_formulaire` (`ID_Type`),
  ADD CONSTRAINT `Modifier_Utilisateur_FK` FOREIGN KEY (`Id_Utilisateur`) REFERENCES `utilisateur` (`Id_Utilisateur`);

--
-- Contraintes pour la table `reponse`
--
ALTER TABLE `reponse`
  ADD CONSTRAINT `Reponse_Exemplaire_FK` FOREIGN KEY (`Id_Formulaire`) REFERENCES `exemplaire` (`Id_Formulaire`),
  ADD CONSTRAINT `Reponse_Question0_FK` FOREIGN KEY (`ID_Question`) REFERENCES `question` (`ID_Question`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
