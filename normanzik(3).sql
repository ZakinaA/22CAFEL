-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3307
-- Généré le : lun. 03 oct. 2022 à 12:46
-- Version du serveur :  10.4.13-MariaDB
-- Version de PHP : 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `normanzik`
--

-- --------------------------------------------------------

--
-- Structure de la table `album`
--

DROP TABLE IF EXISTS `album`;
CREATE TABLE IF NOT EXISTS `album` (
  `alb_id` int(11) NOT NULL AUTO_INCREMENT,
  `alb_nom` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`alb_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `album`
--

INSERT INTO `album` (`alb_id`, `alb_nom`) VALUES
(5, 'Love Introspection');

-- --------------------------------------------------------

--
-- Structure de la table `concert`
--

DROP TABLE IF EXISTS `concert`;
CREATE TABLE IF NOT EXISTS `concert` (
  `con_id` int(11) NOT NULL AUTO_INCREMENT,
  `con_date` date DEFAULT NULL,
  `con_idGroupe` int(11) DEFAULT NULL,
  `con_idLieu` int(11) DEFAULT NULL,
  PRIMARY KEY (`con_id`),
  KEY `FK_CONCERT_GROUPE` (`con_idGroupe`),
  KEY `FK_CONCERT_LIEU` (`con_idLieu`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `concert`
--

INSERT INTO `concert` (`con_id`, `con_date`, `con_idGroupe`, `con_idLieu`) VALUES
(5, '2022-01-25', 1, 1),
(6, '2022-03-09', 1, 2),
(7, '2022-04-27', 1, 3),
(8, '2022-12-01', 2, 7);

-- --------------------------------------------------------

--
-- Structure de la table `dispositif`
--

DROP TABLE IF EXISTS `dispositif`;
CREATE TABLE IF NOT EXISTS `dispositif` (
  `dis_id` int(11) NOT NULL AUTO_INCREMENT,
  `dis_annee` int(11) DEFAULT NULL,
  `dis_libelle` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`dis_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `dispositif`
--

INSERT INTO `dispositif` (`dis_id`, `dis_annee`, `dis_libelle`) VALUES
(1, 2021, 'NorZik21'),
(2, 2022, 'NorZik22'),
(3, 2023, 'NorZik23'),
(5, 2024, 'NorZik24');

-- --------------------------------------------------------

--
-- Structure de la table `festival`
--

DROP TABLE IF EXISTS `festival`;
CREATE TABLE IF NOT EXISTS `festival` (
  `fest_id` int(11) NOT NULL AUTO_INCREMENT,
  `fest_nom` varchar(30) DEFAULT NULL,
  `fest_dateDebut` date DEFAULT NULL,
  `fest_dateFin` date DEFAULT NULL,
  `fest_lieu` varchar(30) NOT NULL,
  PRIMARY KEY (`fest_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `festival`
--

INSERT INTO `festival` (`fest_id`, `fest_nom`, `fest_dateDebut`, `fest_dateFin`, `fest_lieu`) VALUES
(1, 'Beauregard', '2023-07-06', '2023-07-09', 'Hérouville Saint Clair'),
(2, 'Jazz sous les pommiers', '2023-05-13', '2023-05-20', 'Coutances'),
(3, 'Papillons de nuit', '2023-05-26', '2023-05-28', 'Saint Laurent de Cuves');

-- --------------------------------------------------------

--
-- Structure de la table `festivalgroupe`
--

DROP TABLE IF EXISTS `festivalgroupe`;
CREATE TABLE IF NOT EXISTS `festivalgroupe` (
  `fest_id` int(11) NOT NULL,
  `gpe_id` int(11) NOT NULL,
  `passage_date` date NOT NULL,
  `passage_heure` time NOT NULL,
  PRIMARY KEY (`fest_id`,`gpe_id`),
  KEY `FK_FESTIVALGROUPE_GROUPE` (`gpe_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `genre`
--

DROP TABLE IF EXISTS `genre`;
CREATE TABLE IF NOT EXISTS `genre` (
  `gre_id` int(11) NOT NULL AUTO_INCREMENT,
  `gre_libelle` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`gre_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `genre`
--

INSERT INTO `genre` (`gre_id`, `gre_libelle`) VALUES
(1, 'Folk'),
(2, 'Pop'),
(3, 'Rock'),
(4, 'Reggae');

-- --------------------------------------------------------

--
-- Structure de la table `groupe`
--

DROP TABLE IF EXISTS `groupe`;
CREATE TABLE IF NOT EXISTS `groupe` (
  `gpe_id` int(11) NOT NULL AUTO_INCREMENT,
  `gpe_nom` varchar(50) DEFAULT NULL,
  `gpe_dateCreation` varchar(50) DEFAULT NULL,
  `gpe_telephone` int(11) DEFAULT NULL,
  `gpe_mel` varchar(50) DEFAULT NULL,
  `gpe_siteWeb` varchar(500) DEFAULT NULL,
  `gpe_lieuRepetition` varchar(50) DEFAULT NULL,
  `gpe_estSelectionne` int(11) DEFAULT NULL,
  `gpe_idDispositif` int(11) DEFAULT NULL,
  `gpe_idGenre` int(11) DEFAULT NULL,
  `gpe_idMembreContact` int(11) DEFAULT NULL,
  PRIMARY KEY (`gpe_id`),
  KEY `FK_GROUPE_DISPOSITIF` (`gpe_idDispositif`),
  KEY `FK_GROUPE_GENRE` (`gpe_idGenre`),
  KEY `FK_GROUPE_MEMBRECONTACT` (`gpe_idMembreContact`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `groupe`
--

INSERT INTO `groupe` (`gpe_id`, `gpe_nom`, `gpe_dateCreation`, `gpe_telephone`, `gpe_mel`, `gpe_siteWeb`, `gpe_lieuRepetition`, `gpe_estSelectionne`, `gpe_idDispositif`, `gpe_idGenre`, `gpe_idMembreContact`) VALUES
(1, 'Les Spartavies', '2011-01-01', 639980918, 'spartd@chez_ouam.fr ', 'http://chez_ouam.fr/spartavies', 'Caen', NULL, 2, 1, 5),
(2, 'Les Barnguys', '2007-05-02', 936128956, 'barnguys@gmail.com', 'https://www.youtube.com/channel/UCB4Y6NESRgH83NEAXoiqX0g', 'Granville', NULL, 1, 3, 4),
(3, 'Les Narcos', '2009-02-01', 734789065, 'narcos@gmail.com', NULL, 'Cherbourg', NULL, 2, 4, 2),
(4, 'Ramirez band', '2009-02-01', 631965045, 'banditas@gmail.com', 'https://www.madisongarbo.com/', 'Le Havre', NULL, 3, 2, 7),
(5, 'Les flashs', '2021-05-03', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `instrument`
--

DROP TABLE IF EXISTS `instrument`;
CREATE TABLE IF NOT EXISTS `instrument` (
  `instru_id` int(11) NOT NULL AUTO_INCREMENT,
  `instru_libelle` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`instru_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `instrument`
--

INSERT INTO `instrument` (`instru_id`, `instru_libelle`) VALUES
(1, 'Bouzouki'),
(2, 'Voix'),
(3, 'Percussions'),
(4, 'Basse'),
(5, 'Piano'),
(6, 'Guitare');

-- --------------------------------------------------------

--
-- Structure de la table `jouergroupe`
--

DROP TABLE IF EXISTS `jouergroupe`;
CREATE TABLE IF NOT EXISTS `jouergroupe` (
  `gpe_id` int(11) NOT NULL,
  `mem_id` int(11) NOT NULL,
  `instru_id` int(11) NOT NULL,
  PRIMARY KEY (`gpe_id`,`mem_id`,`instru_id`),
  KEY `FK_JOUERGROUPE_MEMBRE` (`mem_id`),
  KEY `FK_JOUERGROUPE_INSTRUMENT` (`instru_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `jouergroupe`
--

INSERT INTO `jouergroupe` (`gpe_id`, `mem_id`, `instru_id`) VALUES
(1, 1, 3),
(1, 3, 2),
(1, 5, 1),
(2, 1, 3),
(2, 4, 2),
(2, 10, 5),
(3, 2, 3),
(3, 6, 5),
(3, 8, 2),
(3, 9, 2),
(4, 3, 2),
(4, 6, 5),
(4, 7, 4),
(4, 10, 6);

-- --------------------------------------------------------

--
-- Structure de la table `lieu`
--

DROP TABLE IF EXISTS `lieu`;
CREATE TABLE IF NOT EXISTS `lieu` (
  `lieu_id` int(11) NOT NULL AUTO_INCREMENT,
  `lieu_nomSalle` varchar(50) DEFAULT NULL,
  `lieu_cPostale` varchar(50) DEFAULT NULL,
  `lieu_ville` varchar(50) DEFAULT NULL,
  `lieu_rue` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`lieu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `lieu`
--

INSERT INTO `lieu` (`lieu_id`, `lieu_nomSalle`, `lieu_cPostale`, `lieu_ville`, `lieu_rue`) VALUES
(1, 'Le Melies', '14400', 'Bayeux', '12 rue Genas Duhomme'),
(2, 'La Loco', '14270', 'Mezidon', 'Rue de la Futaie'),
(3, 'Le Soubock', '14770', 'Cauville', 'Rte de Saint-Lambert'),
(7, 'El Camino', '14000', 'Caen', '36 Rue de l\'Église de Vaucelles');

-- --------------------------------------------------------

--
-- Structure de la table `membre`
--

DROP TABLE IF EXISTS `membre`;
CREATE TABLE IF NOT EXISTS `membre` (
  `mem_id` int(11) NOT NULL AUTO_INCREMENT,
  `mem_nom` varchar(50) DEFAULT NULL,
  `mem_prenom` varchar(50) DEFAULT NULL,
  `mem_idInstru` int(11) DEFAULT NULL,
  `mem_idStatut` int(11) DEFAULT NULL,
  `mem_idUtilisateur` varchar(30) NOT NULL DEFAULT 'null',
  PRIMARY KEY (`mem_id`),
  KEY `FK_MEMBRE_INSTRUMENT` (`mem_idInstru`),
  KEY `FK_MEMBRE_STATUT` (`mem_idStatut`),
  KEY `FK_MEMBRE_UTILISATEUR` (`mem_idUtilisateur`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `membre`
--

INSERT INTO `membre` (`mem_id`, `mem_nom`, `mem_prenom`, `mem_idInstru`, `mem_idStatut`, `mem_idUtilisateur`) VALUES
(1, 'HERBERT', 'Henry', 3, 1, 'henryherbert'),
(2, 'BARBER', 'Tia', 3, 3, 'tiaB'),
(3, 'ZANGA', 'Nicolas', 2, 3, 'NicoZANGA'),
(4, 'RILEY', 'Billy', 6, 2, 'rileybilly'),
(5, 'SPART', 'David', 1, 2, 'davidspart'),
(6, 'DURAND', 'Charles', 5, 1, 'durcharles'),
(7, 'HERNANDEZ', 'Dominique', 4, 3, 'null'),
(8, 'KIRBY', 'Lucie', 2, 2, 'null'),
(9, 'POLLARD', 'Fred', 2, 3, 'null'),
(10, 'VICTOR', 'Olivia', 5, 1, 'null'),
(11, 'HERMAN', 'Benjamin', NULL, 1, 'null');

-- --------------------------------------------------------

--
-- Structure de la table `membregroupe`
--

DROP TABLE IF EXISTS `membregroupe`;
CREATE TABLE IF NOT EXISTS `membregroupe` (
  `gpe_id` int(11) NOT NULL,
  `mem_id` int(11) NOT NULL,
  PRIMARY KEY (`gpe_id`,`mem_id`),
  KEY `FK_MEMBREGROUPE_MEMBRE` (`mem_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `membregroupe`
--

INSERT INTO `membregroupe` (`gpe_id`, `mem_id`) VALUES
(1, 1),
(1, 3),
(1, 5),
(2, 1),
(2, 4),
(2, 10),
(3, 2),
(3, 6),
(3, 8),
(3, 9),
(4, 3),
(4, 6),
(4, 7),
(4, 10);

-- --------------------------------------------------------

--
-- Structure de la table `roleutilisateur`
--

DROP TABLE IF EXISTS `roleutilisateur`;
CREATE TABLE IF NOT EXISTS `roleutilisateur` (
  `roluti_id` int(11) NOT NULL AUTO_INCREMENT,
  `roluti_libelle` varchar(30) NOT NULL,
  PRIMARY KEY (`roluti_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `roleutilisateur`
--

INSERT INTO `roleutilisateur` (`roluti_id`, `roluti_libelle`) VALUES
(1, 'administrateur'),
(2, 'membre'),
(3, 'organisateur'),
(4, 'rien');

-- --------------------------------------------------------

--
-- Structure de la table `statut`
--

DROP TABLE IF EXISTS `statut`;
CREATE TABLE IF NOT EXISTS `statut` (
  `stat_id` int(11) NOT NULL AUTO_INCREMENT,
  `stat_libelle` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`stat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `statut`
--

INSERT INTO `statut` (`stat_id`, `stat_libelle`) VALUES
(1, 'Intermittent'),
(2, 'Salarie'),
(3, 'Demandeur d\'emploi');

-- --------------------------------------------------------

--
-- Structure de la table `titre`
--

DROP TABLE IF EXISTS `titre`;
CREATE TABLE IF NOT EXISTS `titre` (
  `tit_idGpe` int(11) NOT NULL,
  `tit_numero` int(11) NOT NULL,
  `tit_intitule` varchar(50) DEFAULT NULL,
  `tit_duree` time DEFAULT NULL,
  `tit_lienURL` varchar(500) DEFAULT NULL,
  `tit_idAlbum` int(11) DEFAULT NULL,
  PRIMARY KEY (`tit_idGpe`,`tit_numero`),
  KEY `FK_ALBUM_TITRE` (`tit_idAlbum`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `titre`
--

INSERT INTO `titre` (`tit_idGpe`, `tit_numero`, `tit_intitule`, `tit_duree`, `tit_lienURL`, `tit_idAlbum`) VALUES
(1, 1, 'Im not a player', '00:02:58', NULL, NULL),
(1, 2, 'Burn with you', '00:04:23', NULL, NULL),
(1, 3, 'Bad news', '00:04:45', NULL, NULL),
(1, 4, 'Castway of love', '00:05:58', NULL, NULL),
(1, 5, 'Im a man', '00:03:28', NULL, NULL),
(2, 1, 'My only one', '00:06:38', 'https://www.youtube.com/watch?v=M4HxVzHwYnM&list=OLAK5uy_kEae_j-AY1-r9ph5Qek73QeobAFJsFjt0&index=6', 5),
(2, 2, 'Relight the fire', '00:02:58', 'https://www.youtube.com/watch?v=IcwgoLddejQ&list=OLAK5uy_kEae_j-AY1-r9ph5Qek73QeobAFJsFjt0&index=7', 5),
(2, 3, 'Same road', '00:04:35', 'https://www.youtube.com/watch?v=PXvc3yOJ69U&list=OLAK5uy_kEae_j-AY1-r9ph5Qek73QeobAFJsFjt0&index=8', 5),
(2, 4, 'Love you mama', '00:04:09', 'https://www.youtube.com/watch?v=GPHvNERPLPY&list=OLAK5uy_kEae_j-AY1-r9ph5Qek73QeobAFJsFjt0&index=9', 5),
(3, 1, 'El Preso', '00:02:46', NULL, NULL),
(3, 2, 'Porro Bonito', '00:04:31', NULL, NULL),
(3, 3, 'La Rasquina', '00:06:22', NULL, NULL),
(3, 4, 'Tabaco Y Ron', '00:02:55', NULL, NULL),
(3, 5, 'La Pelea Con El diablo', '00:02:25', NULL, NULL),
(3, 6, 'Maldito Cabaret', '00:04:03', NULL, NULL),
(4, 1, 'Super Heros', '00:03:14', 'https://www.youtube.com/watch?v=2TXngeQKink', NULL),
(4, 2, 'City light', '00:03:57', 'https://www.youtube.com/watch?v=SuZg2Fek1hE', NULL),
(4, 3, 'Aromes et sens', '00:02:35', 'https://www.youtube.com/watch?v=Ak1AC4pyqek', NULL),
(4, 4, 'Hissez les voiles', '00:03:42', NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

DROP TABLE IF EXISTS `utilisateur`;
CREATE TABLE IF NOT EXISTS `utilisateur` (
  `uti_identifiant` varchar(30) NOT NULL,
  `uti_mdp` varchar(30) NOT NULL,
  `uti_idRole` int(11) NOT NULL,
  PRIMARY KEY (`uti_identifiant`),
  KEY `FK_UTILISATEUR_ROLE` (`uti_idRole`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `utilisateur`
--

INSERT INTO `utilisateur` (`uti_identifiant`, `uti_mdp`, `uti_idRole`) VALUES
('admin', 'CAFEL22', 1),
('davidspart', 'mpSPART', 2),
('durcharles', 'mpDURAND', 2),
('henryherbert', 'mpHERBERT', 2),
('NicoZANGA', 'mpZANGA', 2),
('null', 'null', 4),
('ramirez_catherine', 'ramirez14400', 3),
('rileybilly', 'mpRILEY', 2),
('thomMelinda', 'melThomas', 3),
('tiaB', 'mpBARBER', 2);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `concert`
--
ALTER TABLE `concert`
  ADD CONSTRAINT `FK_CONCERT_GROUPE` FOREIGN KEY (`con_idGroupe`) REFERENCES `groupe` (`gpe_id`),
  ADD CONSTRAINT `FK_CONCERT_LIEU` FOREIGN KEY (`con_idLieu`) REFERENCES `lieu` (`lieu_id`);

--
-- Contraintes pour la table `festivalgroupe`
--
ALTER TABLE `festivalgroupe`
  ADD CONSTRAINT `FK_FESTIVALGROUPE_FESTIVAL` FOREIGN KEY (`fest_id`) REFERENCES `festival` (`fest_id`),
  ADD CONSTRAINT `FK_FESTIVALGROUPE_GROUPE` FOREIGN KEY (`gpe_id`) REFERENCES `groupe` (`gpe_id`);

--
-- Contraintes pour la table `groupe`
--
ALTER TABLE `groupe`
  ADD CONSTRAINT `FK_GROUPE_DISPOSITIF` FOREIGN KEY (`gpe_idDispositif`) REFERENCES `dispositif` (`dis_id`),
  ADD CONSTRAINT `FK_GROUPE_GENRE` FOREIGN KEY (`gpe_idGenre`) REFERENCES `genre` (`gre_id`),
  ADD CONSTRAINT `FK_GROUPE_MEMBRECONTACT` FOREIGN KEY (`gpe_idMembreContact`) REFERENCES `membre` (`mem_id`);

--
-- Contraintes pour la table `jouergroupe`
--
ALTER TABLE `jouergroupe`
  ADD CONSTRAINT `FK_JOUERGROUPE_GROUPE` FOREIGN KEY (`gpe_id`) REFERENCES `groupe` (`gpe_id`),
  ADD CONSTRAINT `FK_JOUERGROUPE_INSTRUMENT` FOREIGN KEY (`instru_id`) REFERENCES `instrument` (`instru_id`),
  ADD CONSTRAINT `FK_JOUERGROUPE_MEMBRE` FOREIGN KEY (`mem_id`) REFERENCES `membre` (`mem_id`);

--
-- Contraintes pour la table `membre`
--
ALTER TABLE `membre`
  ADD CONSTRAINT `FK_MEMBRE_INSTRUMENT` FOREIGN KEY (`mem_idInstru`) REFERENCES `instrument` (`instru_id`),
  ADD CONSTRAINT `FK_MEMBRE_STATUT` FOREIGN KEY (`mem_idStatut`) REFERENCES `statut` (`stat_id`),
  ADD CONSTRAINT `FK_MEMBRE_UTILISATEUR` FOREIGN KEY (`mem_idUtilisateur`) REFERENCES `utilisateur` (`uti_identifiant`);

--
-- Contraintes pour la table `membregroupe`
--
ALTER TABLE `membregroupe`
  ADD CONSTRAINT `FK_MEMBREGROUPE_GROUPE` FOREIGN KEY (`gpe_id`) REFERENCES `groupe` (`gpe_id`),
  ADD CONSTRAINT `FK_MEMBREGROUPE_MEMBRE` FOREIGN KEY (`mem_id`) REFERENCES `membre` (`mem_id`);

--
-- Contraintes pour la table `titre`
--
ALTER TABLE `titre`
  ADD CONSTRAINT `FK_ALBUM_TITRE` FOREIGN KEY (`tit_idAlbum`) REFERENCES `album` (`alb_id`),
  ADD CONSTRAINT `FK_TITRE_GROUPE` FOREIGN KEY (`tit_idGpe`) REFERENCES `groupe` (`gpe_id`);

--
-- Contraintes pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD CONSTRAINT `FK_UTILISATEUR_ROLE` FOREIGN KEY (`uti_idRole`) REFERENCES `roleutilisateur` (`roluti_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
