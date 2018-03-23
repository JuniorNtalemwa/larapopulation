-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Oct 22, 2017 at 12:07 PM
-- Server version: 5.7.19
-- PHP Version: 7.0.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bd_etatcivil`
--

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `t_accoucheurs`
--

DROP TABLE IF EXISTS `t_accoucheurs`;
CREATE TABLE IF NOT EXISTS `t_accoucheurs` (
  `nnid` varchar(14) NOT NULL,
  `qualite` varchar(100) NOT NULL,
  PRIMARY KEY (`nnid`),
  KEY `nnid` (`nnid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_accoucheurs`
--

INSERT INTO `t_accoucheurs` (`nnid`, `qualite`) VALUES
('19880730VD513', 'Medecin');

-- --------------------------------------------------------

--
-- Table structure for table `t_adresses`
--

DROP TABLE IF EXISTS `t_adresses`;
CREATE TABLE IF NOT EXISTS `t_adresses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code_adresse` int(5) NOT NULL,
  `avenue` varchar(50) NOT NULL,
  `quartier` varchar(50) NOT NULL,
  `commune` varchar(50) NOT NULL,
  `codeVille` int(5) NOT NULL,
  PRIMARY KEY (`code_adresse`),
  KEY `id` (`id`),
  KEY `codequartier` (`quartier`),
  KEY `codeVille` (`codeVille`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_adresses`
--

INSERT INTO `t_adresses` (`id`, `code_adresse`, `avenue`, `quartier`, `commune`, `codeVille`) VALUES
(2, 1, 'Matadi', 'Mobutu', 'Kintambo', 1),
(3, 2, 'Kasai', 'Mobutu', 'Kintambo', 1);

-- --------------------------------------------------------

--
-- Table structure for table `t_adultes`
--

DROP TABLE IF EXISTS `t_adultes`;
CREATE TABLE IF NOT EXISTS `t_adultes` (
  `nnid` varchar(14) NOT NULL,
  `lieunaissance` varchar(50) NOT NULL,
  `datenaissance` date NOT NULL,
  `telephone` varchar(15) NOT NULL,
  `email` varchar(50) NOT NULL,
  `codeorigine` int(5) NOT NULL,
  `profession` varchar(256) NOT NULL,
  `nnidDeclarantNaissance` varchar(14) DEFAULT NULL COMMENT 'Numéro national du la personne qui a déclaré l''enfant à l''état civil',
  `dateDeclarationNaissance` date DEFAULT NULL,
  `nnidReconnaissantNaissance` varchar(14) DEFAULT NULL COMMENT 'nnid de la personne ayant reconnu l''enfant comme le sien',
  `nnidTuteurNaissance` varchar(14) DEFAULT NULL COMMENT 'nnid de la personne ayant accepté adopter l''enfant',
  `numeroActeMariage` varchar(10) DEFAULT NULL COMMENT 'A mettre à jour quand la personne se mariera',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  PRIMARY KEY (`nnid`),
  KEY `codeorigine` (`codeorigine`,`nnidDeclarantNaissance`,`nnidReconnaissantNaissance`,`nnidTuteurNaissance`),
  KEY `nnidDeclarantNaissance` (`nnidDeclarantNaissance`),
  KEY `dateDeclarationNaissance` (`dateDeclarationNaissance`),
  KEY `nnidReconnaissantNaissance` (`nnidReconnaissantNaissance`),
  KEY `nnidTuteurNaissance` (`nnidTuteurNaissance`),
  KEY `codeorigine_2` (`codeorigine`),
  KEY `numeroActeMariage` (`numeroActeMariage`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_adultes`
--

INSERT INTO `t_adultes` (`nnid`, `lieunaissance`, `datenaissance`, `telephone`, `email`, `codeorigine`, `profession`, `nnidDeclarantNaissance`, `dateDeclarationNaissance`, `nnidReconnaissantNaissance`, `nnidTuteurNaissance`, `numeroActeMariage`, `created_at`, `updated_at`) VALUES
('1950080511YQ6', 'Mbandaka', '1950-08-05', '0823779198', 'quinze@17.cd', 2, '', NULL, NULL, NULL, NULL, NULL, '2017-08-15 12:18:06', '2017-08-15 12:18:06'),
('19501125M7E36', 'Buta', '1950-11-25', '0823779198', 'fx@domain.fx', 1, '', NULL, NULL, NULL, NULL, NULL, '2017-08-15 00:31:14', '2017-08-15 00:31:14'),
('1956010405I54', 'Kagenge', '1956-01-04', '0823779198', 'jo@nytha.com', 2, '', NULL, NULL, NULL, NULL, NULL, '2017-08-15 09:41:11', '2017-08-15 09:41:11'),
('19600508A6L95', 'Masisi', '1960-05-08', '0810346426', 'marie@louise.com', 1, '', NULL, NULL, NULL, NULL, NULL, '2017-08-15 09:42:07', '2017-08-15 09:42:07'),
('19600630M8V17', 'Kinshasa', '1960-06-30', '0823779198', 'nmbangala@gmail.com', 2, '', NULL, NULL, NULL, NULL, NULL, '2017-08-10 12:46:41', '2017-08-10 12:46:41'),
('19750730V145X', 'Kinshasa', '1975-07-30', '0823779198', 'jean@domaine.jean', 2, '', NULL, NULL, NULL, NULL, NULL, '2017-08-15 00:41:19', '2017-08-15 00:41:19'),
('19780205G51R7', 'Kindu', '1978-02-05', '0823779198', 'victor@kash.com', 1, '', NULL, NULL, NULL, NULL, NULL, '2017-08-15 09:39:06', '2017-08-15 09:39:06'),
('197805052A8W3', 'Kavumu', '1978-05-05', '0823779198', 'elie@domaine.elie', 1, '', NULL, NULL, NULL, NULL, NULL, '2017-08-15 00:33:50', '2017-08-15 00:33:50'),
('19800619O2754', 'Kinshasa', '1980-06-19', '0822323323', 'nadine@nadine.cd', 1, 'Informaticienne', NULL, NULL, NULL, NULL, NULL, '2017-10-22 07:37:42', '2017-10-22 07:37:42'),
('198012153Y75S', 'Kikwit', '1980-12-15', '0823779198', 'quinze@quinze.cd', 1, '', NULL, NULL, NULL, NULL, NULL, '2017-08-15 12:15:54', '2017-08-15 12:15:54'),
('19831222V3K73', 'Kinshasa', '1983-12-22', '0810346426', 'alice@nyota.com', 2, '', NULL, NULL, NULL, NULL, NULL, '2017-08-15 08:59:31', '2017-08-15 08:59:31'),
('1985020628FM3', 'Kinshasa', '1985-02-06', '0823779198', 'yves@kalume.com', 2, '', NULL, NULL, NULL, NULL, NULL, '2017-08-15 08:52:02', '2017-08-15 08:52:02'),
('1985113008BY5', 'Ngiri Ngiri', '1985-11-30', '0999941650', 'auriane@lungz.com', 2, '', NULL, NULL, NULL, NULL, NULL, '2017-08-15 11:10:53', '2017-08-15 11:10:53'),
('19851130142ON', 'Ngiri Ngiri', '1985-11-30', '0999941650', 'auriane@lungz.com', 2, '', NULL, NULL, NULL, NULL, NULL, '2017-08-15 11:10:06', '2017-08-15 11:10:06'),
('19851130167L4', 'Ngiri Ngiri', '1985-11-30', '0999941650', 'auriane@lungz.com', 2, '', NULL, NULL, NULL, NULL, NULL, '2017-08-15 11:12:01', '2017-08-15 11:12:01'),
('19880730VD513', 'Bukavu', '1988-07-30', '0823779198', 'juniorntalemwa@gmail.com', 1, '', NULL, NULL, NULL, NULL, NULL, '2017-08-10 00:04:44', '2017-08-10 00:04:44'),
('199112312F25D', 'Kinshasa', '1991-12-31', '0810346426', 'nsenselejacqueline@gmail.com', 1, '', NULL, NULL, NULL, NULL, NULL, '2017-08-10 00:46:29', '2017-08-10 00:46:29');

-- --------------------------------------------------------

--
-- Table structure for table `t_adulte_habiter_avenues`
--

DROP TABLE IF EXISTS `t_adulte_habiter_avenues`;
CREATE TABLE IF NOT EXISTS `t_adulte_habiter_avenues` (
  `nnidHabitant` varchar(14) NOT NULL,
  `code_adresse` int(5) NOT NULL,
  `numero` int(11) NOT NULL,
  `adresseActuelle` tinyint(1) NOT NULL COMMENT 'Si true, c''est cette adresse qui sera affichée comme adresse principale de l''individu',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  PRIMARY KEY (`nnidHabitant`,`code_adresse`,`numero`),
  KEY `nnidHabitant` (`nnidHabitant`),
  KEY `codeavenue` (`code_adresse`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_adulte_habiter_avenues`
--

INSERT INTO `t_adulte_habiter_avenues` (`nnidHabitant`, `code_adresse`, `numero`, `adresseActuelle`, `created_at`, `updated_at`) VALUES
('1950080511YQ6', 1, 654, 1, '2017-08-15 12:18:06', '2017-08-15 12:18:06'),
('19501125M7E36', 1, 2, 1, '2017-08-18 13:24:24', '2017-08-18 13:24:24'),
('19501125M7E36', 1, 124, 0, '2017-08-15 00:31:14', '2017-08-18 13:24:24'),
('19501125M7E36', 1, 987, 0, '2017-08-18 11:40:13', '2017-08-18 13:24:24'),
('19501125M7E36', 2, 1, 0, '2017-08-18 11:48:06', '2017-08-18 13:24:24'),
('1956010405I54', 1, 75, 1, '2017-08-15 09:41:11', '2017-08-15 09:41:11'),
('19600508A6L95', 1, 75, 1, '2017-08-15 09:42:07', '2017-08-15 09:42:07'),
('19600630M8V17', 1, 76, 1, '2017-08-10 12:46:41', '2017-08-10 12:46:41'),
('19750730V145X', 1, 32, 1, '2017-08-15 00:41:19', '2017-08-15 00:41:19'),
('19780205G51R7', 1, 23, 0, '2017-08-15 09:39:06', '2017-08-18 12:19:29'),
('19780205G51R7', 2, 98, 1, '2017-08-18 12:19:29', '2017-08-18 12:19:29'),
('197805052A8W3', 2, 12, 1, '2017-08-15 00:33:50', '2017-08-15 00:33:50'),
('19800619O2754', 2, 23, 1, '2017-10-22 07:37:42', '2017-10-22 07:37:42'),
('198012153Y75S', 1, 2, 1, '2017-08-15 12:15:54', '2017-08-15 12:15:54'),
('19831222V3K73', 1, 2, 0, '2017-08-15 08:59:31', '2017-08-18 12:05:26'),
('19831222V3K73', 2, 8, 1, '2017-08-18 12:05:26', '2017-08-18 12:05:26'),
('1985020628FM3', 2, 25, 1, '2017-08-15 08:52:02', '2017-08-15 08:52:02'),
('1985113008BY5', 1, 113, 1, '2017-08-15 11:10:53', '2017-08-15 11:10:53'),
('19851130142ON', 1, 113, 1, '2017-08-15 11:10:06', '2017-08-15 11:10:06'),
('19851130167L4', 1, 113, 1, '2017-08-15 11:12:01', '2017-08-15 11:12:01'),
('19880730VD513', 1, 42, 1, '2017-08-10 00:04:45', '2017-08-10 00:04:45'),
('199112312F25D', 1, 54, 1, '2017-08-18 16:20:17', '2017-08-18 16:20:17'),
('199112312F25D', 2, 17, 0, '2017-08-10 00:46:29', '2017-08-18 16:20:17');

-- --------------------------------------------------------

--
-- Table structure for table `t_adulte_parent_adultes`
--

DROP TABLE IF EXISTS `t_adulte_parent_adultes`;
CREATE TABLE IF NOT EXISTS `t_adulte_parent_adultes` (
  `nnid_enfant` varchar(14) NOT NULL,
  `nnid` varchar(14) NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  PRIMARY KEY (`nnid_enfant`,`nnid`),
  KEY `nnid_enfant` (`nnid_enfant`),
  KEY `nnid` (`nnid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_adulte_parent_adultes`
--

INSERT INTO `t_adulte_parent_adultes` (`nnid_enfant`, `nnid`, `created_at`, `updated_at`) VALUES
('19800619O2754', '19750730V145X', '2017-10-22 07:37:42', '2017-10-22 07:37:42'),
('19851130167L4', '1956010405I54', '2017-08-15 11:12:01', '2017-08-15 11:12:01');

-- --------------------------------------------------------

--
-- Table structure for table `t_adulte_temoigner_mariages`
--

DROP TABLE IF EXISTS `t_adulte_temoigner_mariages`;
CREATE TABLE IF NOT EXISTS `t_adulte_temoigner_mariages` (
  `numeroActeMariage` varchar(10) NOT NULL COMMENT 'le numéro de l''acte du mariage',
  `nnid` varchar(14) NOT NULL COMMENT 'nnid du témoin du mariage',
  PRIMARY KEY (`numeroActeMariage`,`nnid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `t_adulte_temoigner_naissances`
--

DROP TABLE IF EXISTS `t_adulte_temoigner_naissances`;
CREATE TABLE IF NOT EXISTS `t_adulte_temoigner_naissances` (
  `nnid_temoin` varchar(14) NOT NULL,
  `code_naissance` int(5) NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  PRIMARY KEY (`nnid_temoin`,`code_naissance`),
  KEY `nnid_temoin` (`nnid_temoin`),
  KEY `code_naissance` (`code_naissance`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_adulte_temoigner_naissances`
--

INSERT INTO `t_adulte_temoigner_naissances` (`nnid_temoin`, `code_naissance`, `created_at`, `updated_at`) VALUES
('19831222V3K73', 186940123, '2017-10-22 07:08:55', '2017-10-22 07:08:55'),
('1985020628FM3', 153956098, '2017-08-15 09:07:54', '2017-08-15 09:07:54'),
('19880730VD513', 598010127, '2017-10-21 16:35:57', '2017-10-21 16:35:57'),
('19880730VD513', 947152745, '2017-08-10 13:18:51', '2017-08-10 13:18:51');

-- --------------------------------------------------------

--
-- Table structure for table `t_autorites`
--

DROP TABLE IF EXISTS `t_autorites`;
CREATE TABLE IF NOT EXISTS `t_autorites` (
  `nnid` varchar(14) NOT NULL,
  `fonction` varchar(100) NOT NULL,
  `reference` varchar(50) NOT NULL,
  PRIMARY KEY (`nnid`),
  KEY `nnid` (`nnid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_autorites`
--

INSERT INTO `t_autorites` (`nnid`, `fonction`, `reference`) VALUES
('00000000000001', 'MINAFFET', 'MINAFFET'),
('00000000000002', 'MININTERIEUR', 'MININTERIEUR'),
('00000000000003', 'CENI', 'CENI');

-- --------------------------------------------------------

--
-- Table structure for table `t_autorites_pieces`
--

DROP TABLE IF EXISTS `t_autorites_pieces`;
CREATE TABLE IF NOT EXISTS `t_autorites_pieces` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) NOT NULL,
  `description` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `t_deces`
--

DROP TABLE IF EXISTS `t_deces`;
CREATE TABLE IF NOT EXISTS `t_deces` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `numero_certificat_deces` varchar(10) NOT NULL,
  `date_deces` date NOT NULL,
  `heure_deces` time NOT NULL,
  `lieu_deces` varchar(50) NOT NULL COMMENT 'Hopital, domicile...',
  `nnid_defunt` varchar(14) NOT NULL COMMENT 'nnid de la personne décédée',
  `nnid_declarant` varchar(14) NOT NULL COMMENT 'nnid de la personne ayant déclaré le décès',
  `nnid_signateur` varchar(14) NOT NULL COMMENT 'nnid de la personne ayant signé le certificat de décès',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  PRIMARY KEY (`numero_certificat_deces`),
  KEY `id` (`id`,`nnid_defunt`,`nnid_declarant`,`nnid_signateur`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_deces`
--

INSERT INTO `t_deces` (`id`, `numero_certificat_deces`, `date_deces`, `heure_deces`, `lieu_deces`, `nnid_defunt`, `nnid_declarant`, `nnid_signateur`, `created_at`, `updated_at`) VALUES
(2, '3882909591', '2017-08-17', '20:09:00', 'Kikwit', '198012153Y75S', '19600630M8V17', '197805052A8W3', '2017-08-18 15:33:17', '2017-08-18 15:33:17'),
(1, '9372576212', '2017-08-09', '08:00:00', 'Kinshasa', '1950080511YQ6', '19780205G51R7', '19831222V3K73', '2017-08-15 13:01:30', '2017-08-15 13:01:30');

-- --------------------------------------------------------

--
-- Table structure for table `t_individus`
--

DROP TABLE IF EXISTS `t_individus`;
CREATE TABLE IF NOT EXISTS `t_individus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nnid` varchar(14) NOT NULL COMMENT 'Numéro national d''identification',
  `prenom` varchar(50) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `postnom` varchar(50) NOT NULL,
  `sexe` int(1) NOT NULL COMMENT '0 pour masculin et 1 pour féminin',
  `etatcivil` int(1) NOT NULL COMMENT '0=Celib | 1=Marie | 2=Divorce | 3=Veuf | 4=Separe',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `added_by` int(10) NOT NULL,
  PRIMARY KEY (`nnid`),
  KEY `id` (`id`),
  KEY `nnid` (`nnid`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_individus`
--

INSERT INTO `t_individus` (`id`, `nnid`, `prenom`, `nom`, `postnom`, `sexe`, `etatcivil`, `created_at`, `updated_at`, `added_by`) VALUES
(35, '1950080511YQ6', 'DixSept', 'Quinze', 'heure', 1, 1, '2017-08-15 12:18:06', '2017-08-15 12:18:06', 1),
(19, '19501125M7E36', 'Tupime', 'Francois', 'Xavier', 0, 0, '2017-08-15 00:31:14', '2017-08-15 00:31:14', 1),
(28, '1956010405I54', 'Nytha', 'John', 'Ntalemwa', 0, 1, '2017-08-15 09:41:11', '2017-08-15 09:41:11', 1),
(29, '19600508A6L95', 'Marie France', 'Marie Louise', 'ML', 1, 1, '2017-08-15 09:42:07', '2017-08-15 09:42:07', 1),
(4, '19600630M8V17', 'Freddy', 'Nolin', 'Mbangala', 0, 1, '2017-08-10 12:46:41', '2017-08-10 12:46:41', 1),
(21, '19750730V145X', 'Lang', 'Jean', 'Jacques', 0, 0, '2017-08-15 00:41:19', '2017-08-15 00:41:19', 1),
(27, '19780205G51R7', 'Kash', 'Victor', 'Marcelin', 0, 1, '2017-08-15 09:39:06', '2017-08-15 09:39:06', 1),
(20, '197805052A8W3', 'Clemence', 'Eliane', 'Julien', 1, 1, '2017-08-15 00:33:50', '2017-08-15 00:33:50', 1),
(41, '19800619O2754', 'Nadia', 'Nadine', 'Cego', 1, 0, '2017-10-22 07:37:42', '2017-10-22 07:37:42', 1),
(34, '198012153Y75S', 'Quart', 'Quinze', 'Heure', 0, 1, '2017-08-15 12:15:54', '2017-08-15 12:15:54', 1),
(23, '19831222V3K73', 'Nyota', 'Alice', 'Nsensele', 1, 1, '2017-08-15 08:59:31', '2017-08-15 08:59:31', 1),
(22, '1985020628FM3', 'Chretien', 'Yves', 'Kalume', 0, 1, '2017-08-15 08:52:02', '2017-08-15 08:52:02', 1),
(32, '1985113008BY5', 'Lungungu', 'Auriane', 'Tunda', 1, 1, '2017-08-15 11:10:53', '2017-08-15 11:10:53', 1),
(31, '19851130142ON', 'Lungungu', 'Auriane', 'Tunda', 1, 1, '2017-08-15 11:10:06', '2017-08-15 11:10:06', 1),
(33, '19851130167L4', 'Lungungu', 'Auriane', 'Tunda', 1, 1, '2017-08-15 11:12:01', '2017-08-15 11:12:01', 1),
(30, '19851130K3Q63', 'Lungungu', 'Auriane', 'Tunda', 1, 1, '2017-08-15 11:09:23', '2017-08-15 11:09:23', 1),
(2, '19880730VD513', 'Jun', 'Ntalemwa', 'Nnaka', 0, 1, '2017-08-10 00:04:44', '2017-08-10 00:04:44', 1),
(3, '199112312F25D', 'Jaky', 'Nsensele', 'Kangondo', 1, 0, '2017-08-10 00:46:29', '2017-08-10 00:46:29', 1),
(26, '20170503R872Q', 'Ntale', 'Lenny', 'Michel', 0, 0, '2017-08-15 09:07:54', '2017-08-15 09:07:54', 1),
(25, '20170503RO255', 'Ntale', 'Lenny', 'Michel', 0, 0, '2017-08-15 09:07:04', '2017-08-15 09:07:04', 1),
(24, '20170503YF962', 'Ntale', 'Lenny', 'Mike', 0, 0, '2017-08-15 09:03:54', '2017-08-15 09:03:54', 1),
(18, '20170606260WA', 'Francis', 'Mbangala', 'Matondo', 0, 0, '2017-08-10 13:18:50', '2017-08-10 13:18:50', 1),
(16, '201706062C83X', 'Francis', 'Mbangala', 'Matondo', 0, 0, '2017-08-10 13:13:30', '2017-08-10 13:13:30', 1),
(17, '20170606Q128J', 'Francis', 'Mbangala', 'Matondo', 0, 0, '2017-08-10 13:16:40', '2017-08-10 13:16:40', 1),
(40, '20171006V86I9', 'Jackline', 'Vicky', 'Jones', 1, 0, '2017-10-22 07:08:55', '2017-10-22 07:08:55', 1),
(38, '2017101116G7A', 'Francky', 'Mugaruka', 'Ambroise', 0, 0, '2017-10-21 16:35:56', '2017-10-21 16:35:56', 1);

-- --------------------------------------------------------

--
-- Table structure for table `t_individu_nationalites`
--

DROP TABLE IF EXISTS `t_individu_nationalites`;
CREATE TABLE IF NOT EXISTS `t_individu_nationalites` (
  `nnid_individu` varchar(14) NOT NULL,
  `codepays` int(5) NOT NULL,
  `principale` tinyint(1) NOT NULL COMMENT 'true pour la nationalité principale et false pour les autres',
  PRIMARY KEY (`nnid_individu`,`codepays`),
  KEY `nnid_individu` (`nnid_individu`),
  KEY `codepays` (`codepays`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `t_mariages`
--

DROP TABLE IF EXISTS `t_mariages`;
CREATE TABLE IF NOT EXISTS `t_mariages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `numeroActe` varchar(10) NOT NULL,
  `lieu_mariage` varchar(50) NOT NULL COMMENT 'Lieu où s''est tenu le mariage (ex. Kinshasa/Limete)',
  `date_mariage` date NOT NULL,
  `regime` varchar(50) NOT NULL,
  `montant_dot` varchar(10) NOT NULL COMMENT 'Exemple : 1500 dollar',
  `nnidOfficierEtatCivil` varchar(14) NOT NULL COMMENT 'nnid de l''officier du mariage',
  `copie_acte_de_mariage` varchar(100) NOT NULL COMMENT 'Lieu vers la copie de l''acte de mariage (acte au format image scanné)',
  PRIMARY KEY (`numeroActe`),
  KEY `id` (`id`),
  KEY `nnidOfficierEtatCivil` (`nnidOfficierEtatCivil`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `t_naissances`
--

DROP TABLE IF EXISTS `t_naissances`;
CREATE TABLE IF NOT EXISTS `t_naissances` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code_naissance` int(15) NOT NULL,
  `date_naissance` date NOT NULL,
  `heure_naissance` time NOT NULL,
  `lieu_naissance` varchar(50) NOT NULL,
  `code_place_naissance` int(5) NOT NULL,
  `nnid_accoucheur` varchar(14) NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  PRIMARY KEY (`code_naissance`),
  KEY `id` (`id`),
  KEY `nnid_concerne` (`nnid_accoucheur`),
  KEY `code_place_naissance` (`code_place_naissance`),
  KEY `nnid_accoucheur` (`nnid_accoucheur`),
  KEY `code_naissance` (`code_naissance`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_naissances`
--

INSERT INTO `t_naissances` (`id`, `code_naissance`, `date_naissance`, `heure_naissance`, `lieu_naissance`, `code_place_naissance`, `nnid_accoucheur`, `created_at`, `updated_at`) VALUES
(5, 153956098, '2017-05-03', '16:17:00', 'Kinshasa', 23497, '19880730VD513', '2017-08-15 09:07:54', '2017-08-15 09:07:54'),
(8, 186940123, '2017-10-06', '09:03:00', 'Kinshasa', 23497, '19880730VD513', '2017-10-22 07:08:55', '2017-10-22 07:08:55'),
(6, 598010127, '2017-10-11', '09:03:00', 'Kinshasa', 3, '19880730VD513', '2017-10-21 16:35:56', '2017-10-21 16:35:56'),
(4, 809463033, '2017-05-03', '16:17:00', 'Kinshasa', 23497, '19880730VD513', '2017-08-15 09:07:04', '2017-08-15 09:07:04'),
(2, 909627152, '2017-06-06', '04:35:00', 'Kinshasa', 1, '19880730VD513', '2017-08-10 13:16:40', '2017-08-10 13:16:40'),
(3, 947152745, '2017-06-06', '04:35:00', 'Kinshasa', 1, '19880730VD513', '2017-08-10 13:18:51', '2017-08-10 13:18:51');

-- --------------------------------------------------------

--
-- Table structure for table `t_nouveau_nes`
--

DROP TABLE IF EXISTS `t_nouveau_nes`;
CREATE TABLE IF NOT EXISTS `t_nouveau_nes` (
  `nnid` varchar(14) NOT NULL,
  `code_naissance` int(11) NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  PRIMARY KEY (`nnid`),
  KEY `code_naissance` (`code_naissance`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_nouveau_nes`
--

INSERT INTO `t_nouveau_nes` (`nnid`, `code_naissance`, `created_at`, `updated_at`) VALUES
('20170503R872Q', 153956098, '2017-08-15 09:07:54', '2017-08-15 09:07:54'),
('20170503RO255', 809463033, '2017-08-15 09:07:04', '2017-08-15 09:07:04'),
('20170606260WA', 947152745, '2017-08-10 13:18:51', '2017-08-10 13:18:51'),
('2017100315J48', 553927468, '2017-10-22 06:21:02', '2017-10-22 06:21:02'),
('20171006V86I9', 186940123, '2017-10-22 07:08:55', '2017-10-22 07:08:55'),
('2017101116G7A', 598010127, '2017-10-21 16:35:57', '2017-10-21 16:35:57');

-- --------------------------------------------------------

--
-- Table structure for table `t_origines`
--

DROP TABLE IF EXISTS `t_origines`;
CREATE TABLE IF NOT EXISTS `t_origines` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codeorigine` int(5) NOT NULL,
  `village` varchar(50) NOT NULL,
  `groupement` varchar(50) NOT NULL,
  `secteur` varchar(50) NOT NULL,
  `territoire` varchar(50) NOT NULL,
  `codeprovince` int(5) NOT NULL,
  PRIMARY KEY (`codeorigine`),
  KEY `id` (`id`,`codeprovince`),
  KEY `codeprovince` (`codeprovince`),
  KEY `codeorigine` (`codeorigine`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_origines`
--

INSERT INTO `t_origines` (`id`, `codeorigine`, `village`, `groupement`, `secteur`, `territoire`, `codeprovince`) VALUES
(1, 1, 'Bateke', 'Bateke', 'Maluku', 'Maluku', 123),
(2, 2, 'Matadi Kibala', 'Matadi Kibala', 'Ngafula', 'Ngafula', 123);

-- --------------------------------------------------------

--
-- Table structure for table `t_parent_nouveau_nes`
--

DROP TABLE IF EXISTS `t_parent_nouveau_nes`;
CREATE TABLE IF NOT EXISTS `t_parent_nouveau_nes` (
  `nnid_nouveau_ne` varchar(14) NOT NULL,
  `nnid_parent` varchar(14) NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  PRIMARY KEY (`nnid_nouveau_ne`,`nnid_parent`),
  KEY `nnid_parent` (`nnid_parent`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_parent_nouveau_nes`
--

INSERT INTO `t_parent_nouveau_nes` (`nnid_nouveau_ne`, `nnid_parent`, `created_at`, `updated_at`) VALUES
('20171006V86I9', '199112312F25D', '2017-10-22 07:08:55', '2017-10-22 07:08:55');

-- --------------------------------------------------------

--
-- Table structure for table `t_pays`
--

DROP TABLE IF EXISTS `t_pays`;
CREATE TABLE IF NOT EXISTS `t_pays` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codepays` int(5) NOT NULL COMMENT 'généré automatique avant enregistrement (depuis l''application)',
  `nompays` varchar(50) NOT NULL,
  `codeidpays` varchar(5) NOT NULL COMMENT 'par exemple +243 pour la RDC',
  PRIMARY KEY (`codepays`),
  KEY `id` (`id`),
  KEY `codepays` (`codepays`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_pays`
--

INSERT INTO `t_pays` (`id`, `codepays`, `nompays`, `codeidpays`) VALUES
(1, 1, 'Republique Democratique du Congo', 'COD');

-- --------------------------------------------------------

--
-- Table structure for table `t_piece_identites`
--

DROP TABLE IF EXISTS `t_piece_identites`;
CREATE TABLE IF NOT EXISTS `t_piece_identites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date_delivre` date NOT NULL COMMENT 'date de délivrance de la pièce',
  `date_expiration` date NOT NULL COMMENT 'date expiration de la pièce',
  `entite_delivre` varchar(100) NOT NULL COMMENT 'Entité ayant délivré la pièce',
  `encours` tinyint(1) NOT NULL COMMENT 'ture si la pièce est en cours d''utilisation par l''individu',
  `code_type_piece` int(5) NOT NULL,
  `nnid_proprietaire_piece` varchar(14) NOT NULL,
  `nnid_autorite_piece` varchar(14) DEFAULT NULL COMMENT 'nnid de l''autorité ayant délivré la pièce',
  `numero_piece` varchar(30) NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  PRIMARY KEY (`numero_piece`),
  KEY `id` (`id`),
  KEY `numero_piece` (`numero_piece`),
  KEY `nnid_proprietaire_piece` (`nnid_proprietaire_piece`),
  KEY `nnid_autorite_piece` (`nnid_autorite_piece`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_piece_identites`
--

INSERT INTO `t_piece_identites` (`id`, `date_delivre`, `date_expiration`, `entite_delivre`, `encours`, `code_type_piece`, `nnid_proprietaire_piece`, `nnid_autorite_piece`, `numero_piece`, `created_at`, `updated_at`) VALUES
(2, '2017-08-01', '2022-08-02', 'MINAFFET', 1, 1, '19780205G51R7', NULL, '0pvv85', '2017-08-18 13:02:17', '2017-08-18 13:02:17'),
(5, '2017-10-10', '2017-11-05', 'CENI', 1, 2, '1985020628FM3', NULL, '443227788', '2017-10-18 11:23:39', '2017-10-18 11:23:39'),
(3, '2017-12-08', '2020-03-01', 'ministere affaires etrangeres', 0, 1, '1985020628FM3', NULL, '52236545', '2017-08-18 13:21:59', '2017-10-18 11:23:38'),
(6, '2017-10-03', '2022-10-02', 'MINAFFET', 1, 1, '19800619O2754', NULL, 'OB23876', '2017-10-22 07:37:43', '2017-10-22 07:37:43'),
(1, '2015-12-31', '2020-12-31', 'MINAFFET', 1, 1, '19851130167L4', NULL, 'OP23344', '2017-08-15 11:12:02', '2017-08-15 11:12:02'),
(4, '2017-08-03', '2022-08-03', 'MINAFFET', 1, 1, '199112312F25D', NULL, 'OP233449', '2017-08-18 16:23:06', '2017-08-18 16:23:06');

-- --------------------------------------------------------

--
-- Table structure for table `t_place_naissances`
--

DROP TABLE IF EXISTS `t_place_naissances`;
CREATE TABLE IF NOT EXISTS `t_place_naissances` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code_place` int(5) NOT NULL,
  `nom_place` varchar(50) DEFAULT NULL,
  `type_place` varchar(50) DEFAULT NULL,
  `numero_adresse_place` int(11) DEFAULT NULL,
  `code_adresse` int(5) NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  PRIMARY KEY (`code_place`),
  KEY `id` (`id`),
  KEY `code_place` (`code_place`),
  KEY `code_avenue` (`code_adresse`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_place_naissances`
--

INSERT INTO `t_place_naissances` (`id`, `code_place`, `nom_place`, `type_place`, `numero_adresse_place`, `code_adresse`, `created_at`, `updated_at`) VALUES
(1, 1, 'Domicile', 'Domicile', 25, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 2, 'Rue', 'Rue', NULL, 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 3, 'Dispensaire de Kintambo', 'Centre Hospitalier', 14, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(7, 18583, 'Centre Hospitalier de Kintambo', 'Centre Hospitalier', 294, 2, '2017-10-05 05:05:49', '2017-10-05 05:05:49'),
(5, 23497, 'Hopital Saint Joseph', 'Centre Hospitalier', 75, 2, '2017-08-15 08:54:27', '2017-08-15 08:54:27'),
(4, 80814, 'CMK (Centre Medical de Kintambo)', 'Centre de Santé', 32, 1, '2017-08-15 01:08:08', '2017-08-15 01:08:08'),
(6, 99842, 'Hopital Don Bosco', 'Dispensaire', 23, 1, '2017-09-30 17:28:54', '2017-09-30 17:28:54');

-- --------------------------------------------------------

--
-- Table structure for table `t_provinces`
--

DROP TABLE IF EXISTS `t_provinces`;
CREATE TABLE IF NOT EXISTS `t_provinces` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codeprovince` int(5) NOT NULL,
  `nomprovince` varchar(50) NOT NULL,
  `codepays` int(5) NOT NULL,
  PRIMARY KEY (`codeprovince`),
  KEY `id` (`id`),
  KEY `codeprovince` (`codeprovince`),
  KEY `codepays` (`codepays`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_provinces`
--

INSERT INTO `t_provinces` (`id`, `codeprovince`, `nomprovince`, `codepays`) VALUES
(7, 123, 'Kinshasa', 1);

-- --------------------------------------------------------

--
-- Table structure for table `t_type_piece_identites`
--

DROP TABLE IF EXISTS `t_type_piece_identites`;
CREATE TABLE IF NOT EXISTS `t_type_piece_identites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code_type` int(5) NOT NULL COMMENT 'généré automatique avant enregistrement (depuis l''application)',
  `type` varchar(50) NOT NULL,
  PRIMARY KEY (`code_type`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_type_piece_identites`
--

INSERT INTO `t_type_piece_identites` (`id`, `code_type`, `type`) VALUES
(1, 1, 'Passport'),
(2, 2, 'Carte d\'Electeur'),
(3, 3, 'Permis de Conduire');

-- --------------------------------------------------------

--
-- Table structure for table `t_villes`
--

DROP TABLE IF EXISTS `t_villes`;
CREATE TABLE IF NOT EXISTS `t_villes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codeville` int(5) NOT NULL,
  `nomville` varchar(50) NOT NULL,
  `codeprovince` int(5) NOT NULL,
  PRIMARY KEY (`codeville`),
  KEY `id` (`id`,`codeprovince`),
  KEY `codeville` (`codeville`),
  KEY `codeprovince` (`codeprovince`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_villes`
--

INSERT INTO `t_villes` (`id`, `codeville`, `nomville`, `codeprovince`) VALUES
(1, 1, 'Kinshasa', 123);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Junior Ntalemwa', 'juniorntalemwa@gmail.com', '$2y$10$fWd/wWVeChAgi46gcZoLAeOySL67jnddHdRYdWHn/tkGBd5TJkL4e', 'ynshW5IlSPL6oQpisN5qPt7fBX1TfYZln8cE4XY4KkkiThzJnuixJM2ZytSq', '2017-08-02 13:28:00', '2017-08-02 13:28:00');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `t_adresses`
--
ALTER TABLE `t_adresses`
  ADD CONSTRAINT `t_adresses_ibfk_1` FOREIGN KEY (`codeVille`) REFERENCES `t_villes` (`codeville`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `t_adultes`
--
ALTER TABLE `t_adultes`
  ADD CONSTRAINT `t_adultes_ibfk_1` FOREIGN KEY (`codeorigine`) REFERENCES `t_origines` (`codeorigine`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `t_adultes_ibfk_2` FOREIGN KEY (`nnidDeclarantNaissance`) REFERENCES `t_adultes` (`nnid`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `t_adultes_ibfk_3` FOREIGN KEY (`nnidReconnaissantNaissance`) REFERENCES `t_adultes` (`nnid`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `t_adultes_ibfk_4` FOREIGN KEY (`nnidTuteurNaissance`) REFERENCES `t_adultes` (`nnid`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `t_adultes_ibfk_5` FOREIGN KEY (`nnid`) REFERENCES `t_individus` (`nnid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `t_adultes_ibfk_6` FOREIGN KEY (`numeroActeMariage`) REFERENCES `t_mariages` (`numeroActe`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `t_adulte_habiter_avenues`
--
ALTER TABLE `t_adulte_habiter_avenues`
  ADD CONSTRAINT `t_adulte_habiter_avenues_ibfk_1` FOREIGN KEY (`nnidHabitant`) REFERENCES `t_adultes` (`nnid`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `t_adulte_habiter_avenues_ibfk_2` FOREIGN KEY (`code_adresse`) REFERENCES `t_adresses` (`code_adresse`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `t_adulte_parent_adultes`
--
ALTER TABLE `t_adulte_parent_adultes`
  ADD CONSTRAINT `t_adulte_parent_adultes_ibfk_1` FOREIGN KEY (`nnid_enfant`) REFERENCES `t_adultes` (`nnid`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `t_adulte_parent_adultes_ibfk_2` FOREIGN KEY (`nnid`) REFERENCES `t_adultes` (`nnid`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `t_adulte_temoigner_naissances`
--
ALTER TABLE `t_adulte_temoigner_naissances`
  ADD CONSTRAINT `t_adulte_temoigner_naissances_ibfk_1` FOREIGN KEY (`nnid_temoin`) REFERENCES `t_adultes` (`nnid`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `t_adulte_temoigner_naissances_ibfk_2` FOREIGN KEY (`code_naissance`) REFERENCES `t_naissances` (`code_naissance`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `t_individu_nationalites`
--
ALTER TABLE `t_individu_nationalites`
  ADD CONSTRAINT `t_individu_nationalites_ibfk_1` FOREIGN KEY (`nnid_individu`) REFERENCES `t_individus` (`nnid`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `t_individu_nationalites_ibfk_2` FOREIGN KEY (`codepays`) REFERENCES `t_pays` (`codepays`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `t_mariages`
--
ALTER TABLE `t_mariages`
  ADD CONSTRAINT `t_mariages_ibfk_1` FOREIGN KEY (`nnidOfficierEtatCivil`) REFERENCES `t_autorites` (`nnid`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `t_naissances`
--
ALTER TABLE `t_naissances`
  ADD CONSTRAINT `t_naissances_ibfk_1` FOREIGN KEY (`code_place_naissance`) REFERENCES `t_place_naissances` (`code_place`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `t_naissances_ibfk_2` FOREIGN KEY (`nnid_accoucheur`) REFERENCES `t_accoucheurs` (`nnid`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `t_nouveau_nes`
--
ALTER TABLE `t_nouveau_nes`
  ADD CONSTRAINT `t_nouveau_nes_ibfk_1` FOREIGN KEY (`code_naissance`) REFERENCES `t_naissances` (`code_naissance`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `t_origines`
--
ALTER TABLE `t_origines`
  ADD CONSTRAINT `t_origines_ibfk_1` FOREIGN KEY (`codeprovince`) REFERENCES `t_provinces` (`codeprovince`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `t_parent_nouveau_nes`
--
ALTER TABLE `t_parent_nouveau_nes`
  ADD CONSTRAINT `t_parent_nouveau_nes_ibfk_1` FOREIGN KEY (`nnid_nouveau_ne`) REFERENCES `t_nouveau_nes` (`nnid`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `t_parent_nouveau_nes_ibfk_2` FOREIGN KEY (`nnid_parent`) REFERENCES `t_adultes` (`nnid`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `t_piece_identites`
--
ALTER TABLE `t_piece_identites`
  ADD CONSTRAINT `t_piece_identites_ibfk_1` FOREIGN KEY (`nnid_proprietaire_piece`) REFERENCES `t_adultes` (`nnid`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `t_piece_identites_ibfk_2` FOREIGN KEY (`nnid_autorite_piece`) REFERENCES `t_autorites` (`nnid`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `t_place_naissances`
--
ALTER TABLE `t_place_naissances`
  ADD CONSTRAINT `t_place_naissances_ibfk_1` FOREIGN KEY (`code_adresse`) REFERENCES `t_adresses` (`code_adresse`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `t_provinces`
--
ALTER TABLE `t_provinces`
  ADD CONSTRAINT `t_provinces_ibfk_1` FOREIGN KEY (`codepays`) REFERENCES `t_pays` (`codepays`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `t_villes`
--
ALTER TABLE `t_villes`
  ADD CONSTRAINT `t_villes_ibfk_1` FOREIGN KEY (`codeprovince`) REFERENCES `t_provinces` (`codeprovince`) ON DELETE NO ACTION ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
