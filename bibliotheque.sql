-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Apr 03, 2023 at 12:12 PM
-- Server version: 8.0.27
-- PHP Version: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bibliotheque`
--
CREATE DATABASE IF NOT EXISTS `bibliotheque` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `bibliotheque`;

-- --------------------------------------------------------

--
-- Table structure for table `adherants`
--

DROP TABLE IF EXISTS `adherants`;
CREATE TABLE IF NOT EXISTS `adherants` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(76) COLLATE utf8mb4_general_ci NOT NULL,
  `prenom` varchar(76) COLLATE utf8mb4_general_ci NOT NULL,
  `adresse` varchar(250) COLLATE utf8mb4_general_ci NOT NULL,
  `telephone` varchar(13) COLLATE utf8mb4_general_ci NOT NULL,
  `nombre_emprunts` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `adherants`
--

INSERT INTO `adherants` (`id`, `nom`, `prenom`, `adresse`, `telephone`, `nombre_emprunts`) VALUES
(1, 'DARWIN', 'Jacob', '23 Rue Grégoire Fradis 69000 LYON', '0656575757', NULL),
(2, 'MOLIÈRE', 'Maurice', '43 Rue George Brassin 73000 CHAMBÉRY', '0606070707', NULL),
(3, 'FREUD', 'Kelly', '49 Rue St Ferréol 57050 METZ', '0611324094', NULL),
(4, 'ROUSSEAU', 'Jessica', '17 rue Bonneterie 13140 MIRAMAS', '0620995234', NULL),
(5, 'DESCARTES', 'Harrisson', '40 cours Franklin Roosevelt 13008 MARSEILLE', '0691583496', NULL),
(6, 'PLATON', 'George', '50 boulevard Amiral Courbet 01100 OYONNAX', '0618490549', NULL),
(7, 'SARTE', 'Pauline', '28 avenue Jean Portalis 10000 TROYES', '0687559391', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `emprunts`
--

DROP TABLE IF EXISTS `emprunts`;
CREATE TABLE IF NOT EXISTS `emprunts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_livre` int NOT NULL,
  `id_adherant` int NOT NULL,
  `date_emprunt` date NOT NULL,
  `date_retour` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_livre` (`id_livre`),
  KEY `fk_adherants` (`id_adherant`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `emprunts`
--

INSERT INTO `emprunts` (`id`, `id_livre`, `id_adherant`, `date_emprunt`, `date_retour`) VALUES
(1, 1, 1, '2023-04-03', '2023-05-03'),
(2, 2, 2, '2023-01-03', '2023-02-03'),
(3, 3, 3, '2023-02-03', '2023-03-03');

-- --------------------------------------------------------

--
-- Table structure for table `livres`
--

DROP TABLE IF EXISTS `livres`;
CREATE TABLE IF NOT EXISTS `livres` (
  `id` int NOT NULL AUTO_INCREMENT,
  `titre` varchar(75) COLLATE utf8mb4_general_ci NOT NULL,
  `auteur` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `annee_publication` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `livres`
--

INSERT INTO `livres` (`id`, `titre`, `auteur`, `annee_publication`) VALUES
(1, 'seigneur des anneaux', 'J.R.R Tolkien', '1955-01-01'),
(2, 'Le Crime de l Orient-Express', 'Agatha Christie', '1934-01-01'),
(3, 'La Planète des singes', 'Pierre Boulle', '1963-01-01'),
(4, 'seigneur des anneaux', 'J.R.R Tolkien', '1955-01-01'),
(5, 'Le Crime de l Orient-Express', 'Agatha Christie', '1934-01-01'),
(6, 'La Planète des singes', 'Pierre Boulle', '1963-01-01');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `emprunts`
--
ALTER TABLE `emprunts`
  ADD CONSTRAINT `fk_adherants` FOREIGN KEY (`id_adherant`) REFERENCES `adherants` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `fk_livre` FOREIGN KEY (`id_livre`) REFERENCES `livres` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
