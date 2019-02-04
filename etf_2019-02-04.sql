# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: localhost (MySQL 5.6.38)
# Database: etf
# Generation Time: 2019-02-04 09:40:14 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table activity_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `activity_log`;

CREATE TABLE `activity_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `log_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject_id` int(11) DEFAULT NULL,
  `subject_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `causer_id` int(11) DEFAULT NULL,
  `causer_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `properties` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `activity_log_log_name_index` (`log_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `activity_log` WRITE;
/*!40000 ALTER TABLE `activity_log` DISABLE KEYS */;

INSERT INTO `activity_log` (`id`, `log_name`, `description`, `subject_id`, `subject_type`, `causer_id`, `causer_type`, `properties`, `created_at`, `updated_at`)
VALUES
	(98,'default','DGT : SPDR® Global Dow ETF',33,'App\\Models\\ETF',3,'App\\User','{\"IP\":\"127.0.0.1\"}','2019-02-04 13:17:09','2019-02-04 13:17:09'),
	(99,'default','XLB : Materials Select Sector SPDR® Fund',67,'App\\Models\\ETF',3,'App\\User','{\"IP\":\"127.0.0.1\"}','2019-02-04 13:17:24','2019-02-04 13:17:24'),
	(100,'default','XLU : Utilities Select Sector SPDR® Fund',70,'App\\Models\\ETF',3,'App\\User','{\"IP\":\"127.0.0.1\"}','2019-02-04 13:18:05','2019-02-04 13:18:05'),
	(101,'default','XLU : Utilities Select Sector SPDR® Fund',70,'App\\Models\\ETF',3,'App\\User','{\"IP\":\"127.0.0.1\"}','2019-02-04 13:18:13','2019-02-04 13:18:13'),
	(102,'default','XKCP : SPDR® Kensho Clean Power ETF',71,'App\\Models\\ETF',3,'App\\User','{\"IP\":\"127.0.0.1\"}','2019-02-04 13:18:26','2019-02-04 13:18:26'),
	(103,'default','XKCP : SPDR® Kensho Clean Power ETF',71,'App\\Models\\ETF',3,'App\\User','{\"IP\":\"127.0.0.1\"}','2019-02-04 13:18:39','2019-02-04 13:18:39');

/*!40000 ALTER TABLE `activity_log` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table etf_country_weights
# ------------------------------------------------------------

DROP TABLE IF EXISTS `etf_country_weights`;

CREATE TABLE `etf_country_weights` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `weight` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `etf_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `etf_country_weights_etf_id_foreign` (`etf_id`),
  CONSTRAINT `etf_country_weights_etf_id_foreign` FOREIGN KEY (`etf_id`) REFERENCES `etfs` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `etf_country_weights` WRITE;
/*!40000 ALTER TABLE `etf_country_weights` DISABLE KEYS */;

INSERT INTO `etf_country_weights` (`id`, `name`, `weight`, `etf_id`, `created_at`, `updated_at`)
VALUES
	(1,'United States','46.59',33,'2019-02-04 13:17:12','2019-02-04 13:17:12'),
	(2,'Japan','9.90',33,'2019-02-04 13:17:12','2019-02-04 13:17:12'),
	(3,'United Kingdom','7.66',33,'2019-02-04 13:17:12','2019-02-04 13:17:12'),
	(4,'France','6.29',33,'2019-02-04 13:17:12','2019-02-04 13:17:12'),
	(5,'China','4.89',33,'2019-02-04 13:17:12','2019-02-04 13:17:12'),
	(6,'Germany','4.35',33,'2019-02-04 13:17:12','2019-02-04 13:17:12'),
	(7,'Switzerland','3.88',33,'2019-02-04 13:17:12','2019-02-04 13:17:12'),
	(8,'Spain','2.08',33,'2019-02-04 13:17:12','2019-02-04 13:17:12'),
	(9,'South Africa','1.73',33,'2019-02-04 13:17:12','2019-02-04 13:17:12'),
	(10,'India','1.42',33,'2019-02-04 13:17:12','2019-02-04 13:17:12'),
	(11,'Australia','1.40',33,'2019-02-04 13:17:12','2019-02-04 13:17:12'),
	(12,'Canada','1.32',33,'2019-02-04 13:17:12','2019-02-04 13:17:12'),
	(13,'Italy','1.21',33,'2019-02-04 13:17:12','2019-02-04 13:17:12'),
	(14,'Brazil','1.10',33,'2019-02-04 13:17:12','2019-02-04 13:17:12'),
	(15,'Denmark','0.88',33,'2019-02-04 13:17:12','2019-02-04 13:17:12'),
	(16,'Russia','0.76',33,'2019-02-04 13:17:12','2019-02-04 13:17:12'),
	(17,'Sweden','0.72',33,'2019-02-04 13:17:12','2019-02-04 13:17:12'),
	(18,'South Korea','0.70',33,'2019-02-04 13:17:12','2019-02-04 13:17:12'),
	(19,'Hong Kong','0.67',33,'2019-02-04 13:17:12','2019-02-04 13:17:12'),
	(20,'Mexico','0.67',33,'2019-02-04 13:17:12','2019-02-04 13:17:12'),
	(21,'Finland','0.62',33,'2019-02-04 13:17:12','2019-02-04 13:17:12'),
	(22,'Belgium','0.59',33,'2019-02-04 13:17:12','2019-02-04 13:17:12'),
	(23,'Taiwan','0.59',33,'2019-02-04 13:17:12','2019-02-04 13:17:12'),
	(24,'DowDuPont Inc.','20.36 ',67,'2019-02-04 13:17:27','2019-02-04 13:17:27'),
	(25,'Linde plc','14.82 ',67,'2019-02-04 13:17:27','2019-02-04 13:17:27'),
	(26,'Ecolab Inc.','6.63 ',67,'2019-02-04 13:17:27','2019-02-04 13:17:27'),
	(27,'Air Products and Chemicals Inc.','5.95 ',67,'2019-02-04 13:17:27','2019-02-04 13:17:27'),
	(28,'Sherwin-Williams Company','4.61 ',67,'2019-02-04 13:17:27','2019-02-04 13:17:27'),
	(29,'LyondellBasell Industries NV','4.46 ',67,'2019-02-04 13:17:27','2019-02-04 13:17:27'),
	(30,'PPG Industries Inc.','4.29 ',67,'2019-02-04 13:17:27','2019-02-04 13:17:27'),
	(31,'International Paper Company','3.26 ',67,'2019-02-04 13:17:27','2019-02-04 13:17:27'),
	(32,'Nucor Corporation','3.26 ',67,'2019-02-04 13:17:27','2019-02-04 13:17:27'),
	(33,'Newmont Mining Corporation','3.08 ',67,'2019-02-04 13:17:27','2019-02-04 13:17:27'),
	(34,'NextEra Energy Inc.','11.83 ',70,'2019-02-04 13:18:08','2019-02-04 13:18:08'),
	(35,'Duke Energy Corporation','8.65 ',70,'2019-02-04 13:18:08','2019-02-04 13:18:08'),
	(36,'Dominion Energy Inc','7.42 ',70,'2019-02-04 13:18:08','2019-02-04 13:18:08'),
	(37,'Southern Company','6.92 ',70,'2019-02-04 13:18:08','2019-02-04 13:18:08'),
	(38,'Exelon Corporation','6.39 ',70,'2019-02-04 13:18:08','2019-02-04 13:18:08'),
	(39,'American Electric Power Company Inc.','5.40 ',70,'2019-02-04 13:18:08','2019-02-04 13:18:08'),
	(40,'Sempra Energy','4.43 ',70,'2019-02-04 13:18:08','2019-02-04 13:18:08'),
	(41,'Public Service Enterprise Group Inc','3.81 ',70,'2019-02-04 13:18:08','2019-02-04 13:18:08'),
	(42,'Xcel Energy Inc.','3.72 ',70,'2019-02-04 13:18:08','2019-02-04 13:18:08'),
	(43,'Consolidated Edison Inc.','3.35 ',70,'2019-02-04 13:18:08','2019-02-04 13:18:08'),
	(44,'General Electric Company','4.94 ',71,'2019-02-04 13:18:30','2019-02-04 13:18:30'),
	(45,'First Solar Inc.','4.05 ',71,'2019-02-04 13:18:30','2019-02-04 13:18:30'),
	(46,'SolarEdge Technologies Inc.','3.93 ',71,'2019-02-04 13:18:30','2019-02-04 13:18:30'),
	(47,'Enbridge Inc.','3.91 ',71,'2019-02-04 13:18:30','2019-02-04 13:18:30'),
	(48,'Arcosa Inc','3.81 ',71,'2019-02-04 13:18:30','2019-02-04 13:18:30'),
	(49,'AES Corporation','3.60 ',71,'2019-02-04 13:18:30','2019-02-04 13:18:30'),
	(50,'Sempra Energy','3.44 ',71,'2019-02-04 13:18:30','2019-02-04 13:18:30'),
	(51,'Pattern Energy Group Inc. Class A','3.43 ',71,'2019-02-04 13:18:30','2019-02-04 13:18:30'),
	(52,'Canadian Solar Inc.','3.40 ',71,'2019-02-04 13:18:30','2019-02-04 13:18:30'),
	(53,'Enel Americas S.A. Sponsored ADR','3.39 ',71,'2019-02-04 13:18:30','2019-02-04 13:18:30');

/*!40000 ALTER TABLE `etf_country_weights` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table etf_holdings
# ------------------------------------------------------------

DROP TABLE IF EXISTS `etf_holdings`;

CREATE TABLE `etf_holdings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `weight` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `etf_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `etf_holdings_etf_id_foreign` (`etf_id`),
  CONSTRAINT `etf_holdings_etf_id_foreign` FOREIGN KEY (`etf_id`) REFERENCES `etfs` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `etf_holdings` WRITE;
/*!40000 ALTER TABLE `etf_holdings` DISABLE KEYS */;

INSERT INTO `etf_holdings` (`id`, `name`, `weight`, `etf_id`, `created_at`, `updated_at`)
VALUES
	(1,'Petroleo Brasileiro SA Sponsored ADR Pfd','1.07 ',33,'2019-02-04 13:17:12','2019-02-04 13:17:12'),
	(2,'MTN Group Limited','0.97 ',33,'2019-02-04 13:17:12','2019-02-04 13:17:12'),
	(3,'Anglo American plc','0.87 ',33,'2019-02-04 13:17:12','2019-02-04 13:17:12'),
	(4,'Starbucks Corporation','0.87 ',33,'2019-02-04 13:17:12','2019-02-04 13:17:12'),
	(5,'Vestas Wind Systems A/S','0.87 ',33,'2019-02-04 13:17:12','2019-02-04 13:17:12'),
	(6,'Procter & Gamble Company','0.81 ',33,'2019-02-04 13:17:12','2019-02-04 13:17:12'),
	(7,'Rio Tinto plc','0.81 ',33,'2019-02-04 13:17:12','2019-02-04 13:17:12'),
	(8,'BHP Group Ltd','0.77 ',33,'2019-02-04 13:17:12','2019-02-04 13:17:12'),
	(9,'ENGIE SA','0.77 ',33,'2019-02-04 13:17:12','2019-02-04 13:17:12'),
	(10,'McDonald\'s Corporation','0.77 ',33,'2019-02-04 13:17:12','2019-02-04 13:17:12'),
	(11,'DowDuPont Inc.','20.33 ',67,'2019-02-04 13:17:27','2019-02-04 13:17:27'),
	(12,'Linde plc','14.79 ',67,'2019-02-04 13:17:27','2019-02-04 13:17:27'),
	(13,'Ecolab Inc.','6.62 ',67,'2019-02-04 13:17:27','2019-02-04 13:17:27'),
	(14,'Air Products and Chemicals Inc.','5.94 ',67,'2019-02-04 13:17:27','2019-02-04 13:17:27'),
	(15,'Sherwin-Williams Company','4.60 ',67,'2019-02-04 13:17:27','2019-02-04 13:17:27'),
	(16,'LyondellBasell Industries NV','4.45 ',67,'2019-02-04 13:17:27','2019-02-04 13:17:27'),
	(17,'PPG Industries Inc.','4.28 ',67,'2019-02-04 13:17:27','2019-02-04 13:17:27'),
	(18,'Nucor Corporation','3.26 ',67,'2019-02-04 13:17:27','2019-02-04 13:17:27'),
	(19,'International Paper Company','3.25 ',67,'2019-02-04 13:17:27','2019-02-04 13:17:27'),
	(20,'Newmont Mining Corporation','3.08 ',67,'2019-02-04 13:17:27','2019-02-04 13:17:27'),
	(21,'NextEra Energy Inc.','11.82 ',70,'2019-02-04 13:18:08','2019-02-04 13:18:08'),
	(22,'Duke Energy Corporation','8.65 ',70,'2019-02-04 13:18:08','2019-02-04 13:18:08'),
	(23,'Dominion Energy Inc','7.41 ',70,'2019-02-04 13:18:08','2019-02-04 13:18:08'),
	(24,'Southern Company','6.91 ',70,'2019-02-04 13:18:08','2019-02-04 13:18:08'),
	(25,'Exelon Corporation','6.38 ',70,'2019-02-04 13:18:08','2019-02-04 13:18:08'),
	(26,'American Electric Power Company Inc.','5.39 ',70,'2019-02-04 13:18:08','2019-02-04 13:18:08'),
	(27,'Sempra Energy','4.42 ',70,'2019-02-04 13:18:08','2019-02-04 13:18:08'),
	(28,'Public Service Enterprise Group Inc','3.81 ',70,'2019-02-04 13:18:08','2019-02-04 13:18:08'),
	(29,'Xcel Energy Inc.','3.72 ',70,'2019-02-04 13:18:08','2019-02-04 13:18:08'),
	(30,'Consolidated Edison Inc.','3.34 ',70,'2019-02-04 13:18:08','2019-02-04 13:18:08'),
	(31,'General Electric Company','4.93 ',71,'2019-02-04 13:18:30','2019-02-04 13:18:30'),
	(32,'First Solar Inc.','4.04 ',71,'2019-02-04 13:18:30','2019-02-04 13:18:30'),
	(33,'SolarEdge Technologies Inc.','3.92 ',71,'2019-02-04 13:18:30','2019-02-04 13:18:30'),
	(34,'Enbridge Inc.','3.90 ',71,'2019-02-04 13:18:30','2019-02-04 13:18:30'),
	(35,'Arcosa Inc','3.80 ',71,'2019-02-04 13:18:30','2019-02-04 13:18:30'),
	(36,'AES Corporation','3.59 ',71,'2019-02-04 13:18:30','2019-02-04 13:18:30'),
	(37,'Sempra Energy','3.43 ',71,'2019-02-04 13:18:30','2019-02-04 13:18:30'),
	(38,'Pattern Energy Group Inc. Class A','3.42 ',71,'2019-02-04 13:18:30','2019-02-04 13:18:30'),
	(39,'Canadian Solar Inc.','3.40 ',71,'2019-02-04 13:18:30','2019-02-04 13:18:30'),
	(40,'Enel Americas S.A. Sponsored ADR','3.38 ',71,'2019-02-04 13:18:30','2019-02-04 13:18:30');

/*!40000 ALTER TABLE `etf_holdings` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table etf_sector_weights
# ------------------------------------------------------------

DROP TABLE IF EXISTS `etf_sector_weights`;

CREATE TABLE `etf_sector_weights` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `label` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `weight` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` tinyint(4) NOT NULL,
  `etf_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `etf_sector_weights_etf_id_foreign` (`etf_id`),
  CONSTRAINT `etf_sector_weights_etf_id_foreign` FOREIGN KEY (`etf_id`) REFERENCES `etfs` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `etf_sector_weights` WRITE;
/*!40000 ALTER TABLE `etf_sector_weights` DISABLE KEYS */;

INSERT INTO `etf_sector_weights` (`id`, `label`, `weight`, `order`, `etf_id`, `created_at`, `updated_at`)
VALUES
	(1,'Financials','17.15',1,33,'2019-02-04 13:17:12','2019-02-04 13:17:12'),
	(2,'Industrials','13.51',2,33,'2019-02-04 13:17:12','2019-02-04 13:17:12'),
	(3,'Consumer Discretionary','10.92',3,33,'2019-02-04 13:17:12','2019-02-04 13:17:12'),
	(4,'Communication Services','10.68',4,33,'2019-02-04 13:17:12','2019-02-04 13:17:12'),
	(5,'Health Care','10.36',5,33,'2019-02-04 13:17:12','2019-02-04 13:17:12'),
	(6,'Information Technology','9.56',6,33,'2019-02-04 13:17:12','2019-02-04 13:17:12'),
	(7,'Energy','8.82',7,33,'2019-02-04 13:17:12','2019-02-04 13:17:12'),
	(8,'Consumer Staples','7.76',8,33,'2019-02-04 13:17:12','2019-02-04 13:17:12'),
	(9,'Materials','6.13',9,33,'2019-02-04 13:17:12','2019-02-04 13:17:12'),
	(10,'Utilities','4.42',10,33,'2019-02-04 13:17:12','2019-02-04 13:17:12'),
	(11,'Real Estate','0.7',11,33,'2019-02-04 13:17:12','2019-02-04 13:17:12'),
	(12,'Chemicals','74.52',1,67,'2019-02-04 13:17:27','2019-02-04 13:17:27'),
	(13,'Containers & Packaging','12.12',2,67,'2019-02-04 13:17:27','2019-02-04 13:17:27'),
	(14,'Metals & Mining','9.21',3,67,'2019-02-04 13:17:27','2019-02-04 13:17:27'),
	(15,'Construction Materials','4.16',4,67,'2019-02-04 13:17:27','2019-02-04 13:17:27'),
	(16,'Electric Utilities','61.41',1,70,'2019-02-04 13:18:08','2019-02-04 13:18:08'),
	(17,'Multi-Utilities','33.05',2,70,'2019-02-04 13:18:08','2019-02-04 13:18:08'),
	(18,'Independent Power and Renewable Electricity Producers','3.14',3,70,'2019-02-04 13:18:08','2019-02-04 13:18:08'),
	(19,'Water Utilities','2.39',4,70,'2019-02-04 13:18:08','2019-02-04 13:18:08'),
	(20,'Electric Utilities','14.81',1,71,'2019-02-04 13:18:30','2019-02-04 13:18:30'),
	(21,'Semiconductors','12.29',2,71,'2019-02-04 13:18:30','2019-02-04 13:18:30'),
	(22,'Electrical Components & Equipment','10.88',3,71,'2019-02-04 13:18:30','2019-02-04 13:18:30'),
	(23,'Renewable Electricity','9.2',4,71,'2019-02-04 13:18:30','2019-02-04 13:18:30'),
	(24,'Semiconductor Equipment','8.77',5,71,'2019-02-04 13:18:30','2019-02-04 13:18:30'),
	(25,'Multi-Utilities','7.12',6,71,'2019-02-04 13:18:30','2019-02-04 13:18:30'),
	(26,'Construction & Engineering','5.75',7,71,'2019-02-04 13:18:30','2019-02-04 13:18:30'),
	(27,'Independent Power Producers & Energy Traders','5.38',8,71,'2019-02-04 13:18:30','2019-02-04 13:18:30'),
	(28,'Industrial Conglomerates','4.94',9,71,'2019-02-04 13:18:30','2019-02-04 13:18:30'),
	(29,'Oil & Gas Storage & Transportation','3.91',10,71,'2019-02-04 13:18:30','2019-02-04 13:18:30'),
	(30,'Diversified Chemicals','3.89',11,71,'2019-02-04 13:18:30','2019-02-04 13:18:30'),
	(31,'Gas Utilities','3.32',12,71,'2019-02-04 13:18:30','2019-02-04 13:18:30'),
	(32,'Automobile Manufacturers','2.92',13,71,'2019-02-04 13:18:30','2019-02-04 13:18:30'),
	(33,'Heavy Electrical Equipment','2.33',14,71,'2019-02-04 13:18:30','2019-02-04 13:18:30'),
	(34,'Electronic Equipment & Instruments','1.87',15,71,'2019-02-04 13:18:30','2019-02-04 13:18:30'),
	(35,'Integrated Telecommunication Services','1.23',16,71,'2019-02-04 13:18:30','2019-02-04 13:18:30'),
	(36,'Industrial Machinery','0.78',17,71,'2019-02-04 13:18:30','2019-02-04 13:18:30'),
	(37,'Electronic Components','0.62',18,71,'2019-02-04 13:18:30','2019-02-04 13:18:30');

/*!40000 ALTER TABLE `etf_sector_weights` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table etfs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `etfs`;

CREATE TABLE `etfs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `symbol` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `etfs_symbol_unique` (`symbol`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `etfs` WRITE;
/*!40000 ALTER TABLE `etfs` DISABLE KEYS */;

INSERT INTO `etfs` (`id`, `name`, `description`, `content`, `symbol`, `created_at`, `updated_at`)
VALUES
	(1,'SPDR® Portfolio Large Cap ETF','The SPDR® Portfolio Large Cap ETF seeks to provide investment results that, before fees and expenses, correspond generally to the total return performance of the SSGA Large Cap Index (the \"Index\")One of the low cost core SPDR Portfolio ETFs, a suite of portfolio building blocks designed to provide broad, diversified exposure to core asset classesA low cost ETF that seeks to offer precise, comprehensive exposure to the US large cap market segmentThe Index represents approximately 90% of the US market\n        ',NULL,'SPLG','2019-02-03 14:29:22','2019-02-03 16:59:51'),
	(2,'SPDR® Portfolio Mid Cap ETF','The SPDR® Portfolio Mid Cap ETF seeks to provide investment results that, before fees and expenses, correspond generally to the total return performance of the S&P 1000® Index (the \"Index\")One of the low cost core SPDR Portfolio ETFs, a suite of portfolio building blocks designed to provide broad, diversified exposure to core asset classesA low cost ETF that seeks to offer precise, comprehensive exposure to small and mid cap US equities with market capitalizations generally between $450 million and $6.8 billionThe Index is market cap weighted\n        ',NULL,'SPMD','2019-02-03 14:29:22','2019-02-04 00:42:11'),
	(3,'SPDR® Portfolio S&P 500® Growth ETF',NULL,NULL,'SPYG','2019-02-03 14:29:22','2019-02-03 14:29:22'),
	(4,'SPDR® Portfolio S&P 500® High Dividend ETF',NULL,NULL,'SPYD','2019-02-03 14:29:22','2019-02-03 14:29:22'),
	(5,'SPDR® Portfolio S&P 500® Value ETF','The SPDR® Portfolio S&P 500® Value ETF seeks to provide investment results that, before fees and expenses, correspond generally to the total return performance of the S&P® 500 Value Index (the \"Index\")One of the low cost core SPDR Portfolio ETFs, a suite of portfolio building blocks designed to provide broad, diversified exposure to core asset classesA low cost ETF that seeks to offer exposure to S&P 500 companies that could be undervalued relative to the broader marketThe Index contains stocks that exhibit the strongest value characteristics based on: book value to price ratio; earnings to price ratio; and sales to price ratio\n        ',NULL,'SPYV','2019-02-03 14:29:22','2019-02-04 12:53:28'),
	(6,'SPDR® Portfolio Small Cap ETF',NULL,NULL,'SPSM','2019-02-03 14:29:22','2019-02-03 14:29:22'),
	(7,'SPDR® Portfolio Total Stock Market ETF',NULL,NULL,'SPTM','2019-02-03 14:29:22','2019-02-03 14:29:22'),
	(8,'SPDR® Portfolio Developed World ex-US ETF',NULL,NULL,'SPDW','2019-02-03 14:29:22','2019-02-03 14:29:22'),
	(9,'SPDR® Portfolio Emerging Markets ETF',NULL,NULL,'SPEM','2019-02-03 14:29:22','2019-02-03 14:29:22'),
	(10,'SPDR® Portfolio Aggregate Bond ETF',NULL,NULL,'SPAB','2019-02-03 14:29:22','2019-02-03 14:29:22'),
	(11,'SPDR® Portfolio Intermediate Term Corporate Bond ETF',NULL,NULL,'SPIB','2019-02-03 14:29:22','2019-02-03 14:29:22'),
	(12,'SPDR® Portfolio Long Term Corporate Bond ETF',NULL,NULL,'SPLB','2019-02-03 14:29:22','2019-02-03 14:29:22'),
	(13,'SPDR® Portfolio Long Term Treasury ETF',NULL,NULL,'SPTL','2019-02-03 14:29:22','2019-02-03 14:29:22'),
	(14,'SPDR® Portfolio Short Term Corporate Bond ETF',NULL,NULL,'SPSB','2019-02-03 14:29:22','2019-02-03 14:29:22'),
	(15,'SPDR® Portfolio Short Term Treasury ETF',NULL,NULL,'SPTS','2019-02-03 14:29:22','2019-02-03 14:29:22'),
	(16,'SPDR® S&P® Dividend ETF','The SPDR® S&P® Dividend ETF seeks to provide investment results that, before fees and expenses, correspond generally to the total return performance of the S&P® High Yield Dividend AristocratsTM Index (the \"Index\")The Index screens for companies that have consistently increased their dividend for at least 20 consecutive years, and weights the stocks by yieldDue to the index screen for 20 years of consecutively raising dividends, stocks included in the Index have both capital growth and dividend income characteristics, as opposed to stocks that are pure yield\n        ',NULL,'SDY','2019-02-03 14:29:22','2019-02-04 12:51:09'),
	(17,'SPDR® S&P Emerging Markets Dividend ETF',NULL,NULL,'EDIV','2019-02-03 14:29:22','2019-02-03 14:29:22'),
	(18,'SPDR® S&P® Global Dividend ETF',NULL,NULL,'WDIV','2019-02-03 14:29:22','2019-02-03 14:29:22'),
	(19,'SPDR® S&P® International Dividend ETF',NULL,NULL,'DWX','2019-02-03 14:29:22','2019-02-03 14:29:22'),
	(20,'SPDR® MSCI EAFE StrategicFactorsSM ETF',NULL,NULL,'QEFA','2019-02-03 14:29:22','2019-02-03 14:29:22'),
	(21,'SPDR® MSCI Emerging Markets StrategicFactorsSM ETF',NULL,NULL,'QEMM','2019-02-03 14:29:22','2019-02-03 14:29:22'),
	(22,'SPDR® MSCI USA StrategicFactorsSM ETF',NULL,NULL,'QUS','2019-02-03 14:29:22','2019-02-03 14:29:22'),
	(23,'SPDR® MSCI World StrategicFactorsSM ETF',NULL,NULL,'QWLD','2019-02-03 14:29:22','2019-02-03 14:29:22'),
	(24,'SPDR® Russell 1000 Low Volatility Focus ETF',NULL,NULL,'ONEV','2019-02-03 14:29:22','2019-02-03 14:29:22'),
	(25,'SPDR® Russell 1000 Momentum Focus ETF',NULL,NULL,'ONEO','2019-02-03 14:29:22','2019-02-03 14:29:22'),
	(26,'SPDR® Russell 1000 Yield Focus ETF',NULL,NULL,'ONEY','2019-02-03 14:29:22','2019-02-03 14:29:22'),
	(27,'SPDR® S&P® 1500 Momentum Tilt ETF',NULL,NULL,'MMTM','2019-02-03 14:29:22','2019-02-03 14:29:22'),
	(28,'SPDR® S&P® 1500 Value Tilt ETF',NULL,NULL,'VLU','2019-02-03 14:29:22','2019-02-03 14:29:22'),
	(29,'SPDR® S&P® 500 Buyback ETF',NULL,NULL,'SPYB','2019-02-03 14:29:22','2019-02-03 14:29:22'),
	(30,'SPDR SSGA US Large Cap Low Volatility Index ETF',NULL,NULL,'LGLV','2019-02-03 14:29:22','2019-02-03 14:29:22'),
	(31,'SPDR SSGA US Small Cap Low Volatility Index ETF',NULL,NULL,'SMLV','2019-02-03 14:29:22','2019-02-03 14:29:22'),
	(32,'SPDR® Dorsey Wright® Fixed Income Allocation ETF',NULL,NULL,'DWFI','2019-02-03 14:29:22','2019-02-03 14:29:22'),
	(33,'SPDR® Global Dow ETF','The SPDR® Global Dow ETF seeks to provide investment results that, before fees and expenses, correspond generally to the total return performance of the Global Dow Index (the \"Index\")The Global Dow Index is made up of 150 constituents from around the world selected by an Averages Committee comprised of the managing editor of the Wall Street Journal, the head of Dow Jones Indexes research and the head of CME Group researchThe 150 companies are selected not just based on size and reputation, but also on their promise of future growth. The Index has been designed to cover both developed and emerging countries.',NULL,'DGT','2019-02-03 14:29:22','2019-02-03 16:05:34'),
	(34,'SPDR® MSCI ACWI ex-US ETF','The SPDR® MSCI ACWI ex-US ETF seeks to provide investment results that, before fees and expenses, correspond generally to the total return performance of the MSCI ACWI ex USA Index (the \"Index\")Seeks to provide access to virtually all developed and emerging market countries outside of the USThe Index provides a broad measure of stock performance covering approximately 85% of the global equity opportunity set outside the USSeeks to provide large and mid cap security exposure using a market-cap weighted index methodology\n        ',NULL,'CWI','2019-02-03 14:29:22','2019-02-03 16:48:33'),
	(35,'SPDR® MSCI ACWI IMI ETF',NULL,NULL,'ACIM','2019-02-03 14:29:22','2019-02-03 14:29:22'),
	(36,'SPDR® S&P® International Small Cap ETF','The SPDR® S&P® International Small Cap ETF seeks to provide investment results that, before fees and expenses, correspond generally to the total return performance of the S&P® Developed Ex-U.S. Under USD2 Billion Index (the \"Index\")Seeks to provide transparent access to developed small cap global markets outside the United StatesTo be included in the Index, a publicly listed company must have a total market capitalization between $100 million and $2 billion, and be located in a country that meets the BMI Developed World Series criteria\n        ',NULL,'GWX','2019-02-03 14:29:22','2019-02-03 18:46:35'),
	(37,'SPDR® EURO STOXX 50® ETF','The SPDR® EURO STOXX 50® ETF seeks to provide investment results that, before fees and expenses, correspond generally to the total return performance of the EURO STOXX 50® Index (the \"Index\")The EURO STOXX 50® Index is designed to represent the performance of some of the largest companies across components of the 19 EURO STOXX Supersector IndexesThe Index captures approximately 60% of the free-float market capitalization of the EURO STOXX Total Market Index, which in turn covers approximately 95% of the free float market capitalization of the represented countries\n        ',NULL,'FEZ','2019-02-03 14:29:22','2019-02-04 00:36:09'),
	(38,'SPDR® EURO STOXX® Small Cap ETF','SPDR® EURO STOXX® Small Cap ETF seeks to provide investment results that, before fees and expenses, correspond generally to the total return performance of the EURO STOXX® Small Index (the \"Index\")The EURO STOXX Small Index is designed to provide a representation of small companies across the Eurozone. The Eurozone consists of European Union countries that have adopted the Euro as their currency.The Index consists of the Eurozone stocks included in the STOXX Europe Small 200 Index\n        ',NULL,'SMEZ','2019-02-03 14:29:22','2019-02-04 00:37:17'),
	(39,'SPDR® Solactive Canada ETF','The SPDR® Solactive Canada ETF seeks to provide investment results that, before fees and expenses, correspond generally to the total return performance of the Solactive GBS Canada Large & Mid Cap USD Index NTR (the \"Index\")Seeks to track a free float market cap weighted index with coverage targets of 85% of free float market cap coverage with an 80-90% bufferDesigned to offer broad based exposure to the equity market of Canada including Common stock, preferred stock, REITs, Stapled Security, ADRs and other comparable DRs, Tracking Stock, Royalty Trust, Units\n        ',NULL,'ZCAN','2019-02-03 14:29:22','2019-02-04 00:37:42'),
	(40,'SPDR® Solactive Germany ETF','The SPDR® Solactive Germany ETF seeks to provide investment results that, before fees and expenses, correspond generally to the total return performance of the Solactive GBS Germany Large & Mid Cap USD Index NTR (the \"Index\")Seeks to track a free float market cap weighted index with coverage targets of 85% of free float market cap coverage with an 80-90% bufferDesigned to offer broad based exposure to the equity market of Germany including Common stock, preferred stock, REITs, Stapled Security, ADRs and other comparable DRs, Tracking Stock, Royalty Trust, Units\n        ',NULL,'ZDEU','2019-02-03 14:29:22','2019-02-04 00:40:43'),
	(41,'SPDR® Solactive Hong Kong ETF','The SPDR® Solcative Hong Kong ETF seeks to provide investment results that, before fees and expenses, correspond generally to the total return performance of the Solactive GBS Hong Kong Large & Mid Cap USD Index NTR (the \"Index\")Seeks to track a free float market cap weighted index with coverage targets of 85% of free float market cap coverage with an 80-90% bufferDesigned to offer broad based exposure to the equity market of Hong Kong including Common stock, preferred stock, REITs, Stapled Security, ADRs and other comparable DRs, Tracking Stock, Royalty Trust, Units\n        ',NULL,'ZHOK','2019-02-03 14:29:22','2019-02-03 17:02:24'),
	(42,'SPDR® Solactive Japan ETF','The SPDR® Solactive Japan ETF seeks to provide investment results that, before fees and expenses, correspond generally to the total return performance of the Solactive GBS Japan Large & Mid Cap USD Index NTR (the \"Index\")Seeks to track a free float market cap weighted index with coverage targets of 85% of free float market cap coverage with an 80-90% bufferDesigned to offer broad based exposure to the equity market of Japan including Common stock, preferred stock, REITs, Stapled Security, ADRs and other comparable DRs, Tracking Stock, Royalty Trust, Units\n        ',NULL,'ZJPN','2019-02-03 14:29:22','2019-02-04 12:51:51'),
	(43,'SPDR® Solactive United Kingdom ETF','The SPDR® Solactive United Kingdom ETF seeks to provide investment results that, before fees and expenses, correspond generally to the total return performance of the Solactive GBS United Kingdom Large & Mid Cap USD Index NTR (the \"Index\")Seeks to track a free float market cap weighted index with coverage targets of 85% of free float market cap coverage with an 80-90% bufferDesigned to offer broad based exposure to the equity market of the United Kingdom  including Common stock, preferred stock, REITs, Stapled Security, ADRs and other comparable DRs, Tracking Stock, Royalty Trust, Units\n        ',NULL,'ZGBR','2019-02-03 14:29:22','2019-02-03 19:27:40'),
	(44,'SPDR® STOXX® Europe 50 ETF',NULL,NULL,'FEU','2019-02-03 14:29:22','2019-02-03 14:29:22'),
	(45,'SPDR® MSCI China A Shares IMI ETF',NULL,NULL,'XINA','2019-02-03 14:29:22','2019-02-03 14:29:22'),
	(46,'SPDR® S&P® China ETF',NULL,NULL,'GXC','2019-02-03 14:29:22','2019-02-03 14:29:22'),
	(47,'SPDR® S&P® Emerging Asia Pacific ETF',NULL,NULL,'GMF','2019-02-03 14:29:22','2019-02-03 14:29:22'),
	(48,'SPDR® S&P® Emerging Markets Small Cap ETF',NULL,NULL,'EWX','2019-02-03 14:29:22','2019-02-03 14:29:22'),
	(49,'SPDR® Dow Jones® Industrial Average ETF','The SPDR® Dow Jones® Industrial AverageSM ETF Trust seeks to provide investment results that, before expenses, correspond generally to the price and yield performance of the Dow Jones Industrial AverageSM (the \"Index\")The Dow Jones Industrial AverageSM (DJIA) is composed of 30 \"blue-chip\" U.S. stocksThe DJIA is the oldest continuous barometer of the U.S. stock market, and the most widely quoted indicator of U.S. stock market activityThe DJIA is a price weighted index of 30 component common stocks\n        ',NULL,'DIA','2019-02-03 14:29:22','2019-02-04 00:42:47'),
	(50,'SPDR® MFS Systematic Core Equity ETF','The SPDR® MFS Systematic Core Equity ETF investment objective is to seek capital appreciationSeeks to offer the relatively low cost, intraday trading capability and transparency of a SPDR ETF combined with active stock selection by MFS Investment Management - a widely recognized investment researcher and portfolio managerStrives for capital appreciation by applying a consistent, disciplined bottom-up stock selection and portfolio construction process with the goal of generating consistent, long-term risk-adjusted performanceSeeks to outperform the S&P 500, selecting a combination of growth and value stocks for the core portion of portfolios\n        ',NULL,'SYE','2019-02-03 14:29:22','2019-02-04 00:45:45'),
	(51,'SPDR® S&P 500® ETF',NULL,NULL,'SPY','2019-02-03 14:29:22','2019-02-03 14:29:22'),
	(52,'SPDR® S&P® 600 Small Cap ETF','The SPDR® S&P® 600 Small Cap ETF seeks to provide investment results that, before fees and expenses, correspond generally to the total return performance of the S&P® SmallCap 600 IndexSM (the \"Index\")The selection universe for the S&P SmallCap 600 Index includes all U.S. common equities with market capitalizations generally between $450 million and $2.1 billion at the time of inclusionThe Index is float-adjusted and market capitalization weighted\n        ',NULL,'SLY','2019-02-03 14:29:22','2019-02-04 02:42:29'),
	(53,'SPDR® S&P MIDCAP 400® ETF','The SPDR® S&P MIDCAP 400® ETF seeks to provide investment results that, before expenses, correspond generally to the price and yield performance of the S&P® MidCap 400® IndexTM (the \"Index\")Seeks to provide exposure to companies with a market cap in the range of US$1 billion to US$8 billionExisting Index constituents are removed at the quarterly rebalancing effective date if either their float-adjusted market capitalization falls below $300 million or their float-adjusted liquidity ratio falls below 50%\n        ',NULL,'MDY','2019-02-03 14:29:22','2019-02-04 02:44:29'),
	(54,'SPDR® MFS Systematic Growth Equity ETF','The SPDR® MFS Systematic Growth Equity ETF investment objective is to seek capital appreciationSeeks to offer the relatively low cost, intraday trading capability and transparency of a SPDR ETF combined with active stock selection by MFS Investment Management - a widely recognized investment researcher and portfolio managerStrives for capital appreciation by applying a consistent, disciplined bottom-up stock selection and portfolio construction process with the goal of generating consistent, long-term risk-adjusted performanceSeeks to outperform the Russell 1000 Growth Index - which is comprised of large-cap growth stocks\n        ',NULL,'SYG','2019-02-03 14:29:22','2019-02-04 02:46:18'),
	(55,'SPDR® MFS Systematic Value Equity ETF','The SPDR® MFS Systematic Value Equity ETF investment objective is to seek capital appreciationSeeks to offer the relatively low cost, intraday trading capability and transparency of a SPDR ETF combined with active stock selection by MFS Investment Management - a widely recognized investment researcher and portfolio managerStrives for capital appreciation by applying a consistent, disciplined bottom-up stock selection and portfolio construction process with the goal of generating consistent, long-term risk-adjusted performanceSeeks to outperform the Russell 1000 Value Index - which is comprised of large-cap value stocks\n        ',NULL,'SYV','2019-02-03 14:29:22','2019-02-04 13:10:57'),
	(56,'SPDR® S&P® 400 Mid Cap Growth ETF',NULL,NULL,'MDYG','2019-02-03 14:29:22','2019-02-03 14:29:22'),
	(57,'SPDR® S&P® 400 Mid Cap Value ETF',NULL,NULL,'MDYV','2019-02-03 14:29:22','2019-02-03 14:29:22'),
	(58,'SPDR® S&P® 600 Small Cap Growth ETF','The SPDR® S&P® 600 Small Cap Growth ETF seeks to provide investment results that, before fees and expenses, correspond generally to the total return performance of the S&P® SmallCap 600 Growth IndexSM (the \"Index\")The selection universe for the S&P SmallCap 600 Index includes all U.S. common equities with market capitalizations generally between $450 million and $2.1 billion at the time of inclusionThe Index includes stocks that exhibit the strongest growth characteristics based on: sales growth; earnings change to price; and momentum\n        ',NULL,'SLYG','2019-02-03 14:29:22','2019-02-04 02:43:51'),
	(59,'SPDR® S&P® 600 Small Cap Value ETF',NULL,NULL,'SLYV','2019-02-03 14:29:22','2019-02-03 14:29:22'),
	(60,'Communication Services Select Sector SPDR® Fund','The Communication Services Select Sector SPDR® Fund seeks to provide investment results that, before expenses, correspond generally to the price and yield performance of the Communication Services Select Sector Index (the \"Index\")The Index seeks to provide an effective representation of the communication services sector of the S&P 500 IndexSeeks to provide precise exposure to companies from the media, retailing, and software & services industries in the U.S.Allows investors to take strategic or tactical positions at a more targeted level than traditional style based investing\n        ',NULL,'XLC','2019-02-03 14:29:22','2019-02-04 13:12:11'),
	(61,'Consumer Discretionary Select Sector SPDR® Fund',NULL,NULL,'XLY','2019-02-03 14:29:22','2019-02-03 14:29:22'),
	(62,'Consumer Staples Select Sector SPDR® Fund',NULL,NULL,'XLP','2019-02-03 14:29:22','2019-02-03 14:29:22'),
	(63,'Energy Select Sector SPDR® Fund',NULL,NULL,'XLE','2019-02-03 14:29:22','2019-02-03 14:29:22'),
	(64,'Financial Select Sector SPDR® Fund',NULL,NULL,'XLF','2019-02-03 14:29:22','2019-02-03 14:29:22'),
	(65,'Health Care Select Sector SPDR® Fund',NULL,NULL,'XLV','2019-02-03 14:29:22','2019-02-03 14:29:22'),
	(66,'Industrial Select Sector SPDR® Fund',NULL,NULL,'XLI','2019-02-03 14:29:22','2019-02-03 14:29:22'),
	(67,'Materials Select Sector SPDR® Fund','The Materials Select Sector SPDR® Fund seeks to provide investment results that, before expenses, correspond generally to the price and yield performance of the Materials Select Sector Index (the \"Index\")The Index seeks to provide an effective representation of the materials sector of the S&P 500 IndexSeeks to provide precise exposure to companies in the chemical, construction material, containers and packaging, metals and mining, and paper and forest products industriesAllows investors to take strategic or tactical positions at a more targeted level than traditional style based investing\n        ',NULL,'XLB','2019-02-03 14:29:22','2019-02-04 13:17:27'),
	(68,'Real Estate Select Sector SPDR® Fund','The Real Estate Select Sector SPDR® Fund seeks to provide investment results that, before expenses, correspond generally to the price and yield performance of the Real Estate Select Sector Index (the \"Index\")The Index seeks to provide an effective representation of the real estate sector of the S&P 500 IndexSeeks to provide precise exposure to companies from real estate management and development and REITs, excluding mortgage REITsAllows investors to take strategic or tactical positions at a more targeted level than traditional style based investing\n        ',NULL,'XLRE','2019-02-03 14:29:22','2019-02-04 13:16:06'),
	(69,'Technology Select Sector SPDR® Fund',NULL,NULL,'XLK','2019-02-03 14:29:22','2019-02-03 14:29:22'),
	(70,'Utilities Select Sector SPDR® Fund','The Utilities Select Sector SPDR® Fund seeks to provide investment results that, before expenses, correspond generally to the price and yield performance of the Utilities Select Sector Index (the \"Index\")The Index seeks to provide an effective representation of the Utilities sector of the S&P 500 IndexSeeks to provide precise exposure to companies from the electric utility, gas utility, multi-utility, and independent power producer and energy trader industriesAllows investors to take strategic or tactical positions at a more targeted level than traditional style based investing\n        ',NULL,'XLU','2019-02-03 14:29:22','2019-02-04 13:18:08'),
	(71,'SPDR® Kensho Clean Power ETF','The SPDR Kensho Clean Power ETF seeks to provide investment results that, before fees and expenses, correspond generally to the total return performance of the S&P Kensho Clean Power Index (the \"Index\")Seeks to track an index utilizing artificial intelligence and a quantitative weighting methodology to capture companies whose products and services are driving innovation behind the clean energy sector, which includes the areas of solar, wind, geothermal, and hydroelectric powerMay provide an effective way to pursue long-term growth potential by investing in a portfolio of companies involved in the transition to lower emission generating power supply\n        ',NULL,'XKCP','2019-02-03 14:29:22','2019-02-04 13:18:30'),
	(72,'SPDR® Kensho Final Frontiers ETF',NULL,NULL,'XKFF','2019-02-03 14:29:22','2019-02-03 14:29:22'),
	(73,'SPDR® Kensho Future Security ETF',NULL,NULL,'XKFS','2019-02-03 14:29:22','2019-02-03 14:29:22'),
	(74,'SPDR® Kensho Intelligent Structures ETF',NULL,NULL,'XKII','2019-02-03 14:29:22','2019-02-03 14:29:22'),
	(75,'SPDR® Kensho New Economies Composite ETF',NULL,NULL,'KOMP','2019-02-03 14:29:22','2019-02-03 14:29:22'),
	(76,'SPDR® Kensho Smart Mobility ETF',NULL,NULL,'XKST','2019-02-03 14:29:22','2019-02-03 14:29:22'),
	(77,'SPDR® FactSet Innovative Technology ETF',NULL,NULL,'XITK','2019-02-03 14:29:22','2019-02-03 14:29:22'),
	(78,'SPDR® NYSE Technology ETF',NULL,NULL,'XNTK','2019-02-03 14:29:22','2019-02-03 14:29:22'),
	(79,'SPDR® S&P® Aerospace & Defense ETF',NULL,NULL,'XAR','2019-02-03 14:29:22','2019-02-03 14:29:22'),
	(80,'SPDR® S&P® Bank ETF',NULL,NULL,'KBE','2019-02-03 14:29:22','2019-02-03 14:29:22'),
	(81,'SPDR® S&P® Biotech ETF',NULL,NULL,'XBI','2019-02-03 14:29:22','2019-02-03 14:29:22'),
	(82,'SPDR® S&P® Capital Markets ETF',NULL,NULL,'KCE','2019-02-03 14:29:22','2019-02-03 14:29:22'),
	(83,'SPDR® S&P® Health Care Equipment ETF',NULL,NULL,'XHE','2019-02-03 14:29:22','2019-02-03 14:29:22'),
	(84,'SPDR® S&P® Health Care Services ETF',NULL,NULL,'XHS','2019-02-03 14:29:22','2019-02-03 14:29:22'),
	(85,'SPDR® S&P® Homebuilders ETF',NULL,NULL,'XHB','2019-02-03 14:29:22','2019-02-03 14:29:22'),
	(86,'SPDR® S&P® Insurance ETF',NULL,NULL,'KIE','2019-02-03 14:29:22','2019-02-03 14:29:22'),
	(87,'SPDR® S&P® Internet ETF',NULL,NULL,'XWEB','2019-02-03 14:29:22','2019-02-03 14:29:22'),
	(88,'SPDR® S&P® Metals & Mining ETF',NULL,NULL,'XME','2019-02-03 14:29:22','2019-02-03 14:29:22'),
	(89,'SPDR® S&P® Oil & Gas Equipment & Services ETF',NULL,NULL,'XES','2019-02-03 14:29:22','2019-02-03 14:29:22'),
	(90,'SPDR® S&P® Oil & Gas Exploration & Production ETF',NULL,NULL,'XOP','2019-02-03 14:29:22','2019-02-03 14:29:22'),
	(91,'SPDR® S&P® Pharmaceuticals ETF',NULL,NULL,'XPH','2019-02-03 14:29:22','2019-02-03 14:29:22'),
	(92,'SPDR® S&P® Regional Banking ETF',NULL,NULL,'KRE','2019-02-03 14:29:22','2019-02-03 14:29:22'),
	(93,'SPDR® S&P® Retail ETF',NULL,NULL,'XRT','2019-02-03 14:29:22','2019-02-03 14:29:22'),
	(94,'SPDR® S&P® Semiconductor ETF',NULL,NULL,'XSD','2019-02-03 14:29:22','2019-02-03 14:29:22'),
	(95,'SPDR® S&P® Software & Services ETF',NULL,NULL,'XSW','2019-02-03 14:29:22','2019-02-03 14:29:22'),
	(96,'SPDR® S&P® Technology Hardware ETF',NULL,NULL,'XTH','2019-02-03 14:29:22','2019-02-03 14:29:22'),
	(97,'SPDR® S&P® Telecom ETF',NULL,NULL,'XTL','2019-02-03 14:29:22','2019-02-03 14:29:22'),
	(98,'SPDR® S&P® Transportation ETF',NULL,NULL,'XTN','2019-02-03 14:29:22','2019-02-03 14:29:22'),
	(99,'SPDR® SSGA Global Allocation ETF','The SPDR® SSGA Global Allocation ETF seeks to provide capital appreciation. The Fund invests in exchange traded funds registered under the Investment Company Act of 1940, as amended, that seek to track the performance of a market index; exchange traded commodity trusts; and exchange traded notes. The Portfolio may invest in certain ETFs that pay fees to the Adviser and its affiliates for management, marketing or other services.The portfolio will invest in asset classes that consist of a diversified mix of asset class exposuresThe portfolio will generally invest at least 30% of its assets in securities of issuers economically tied to countries other than the U.S.The portfolio will typically allocate 60% of its assets to equity securities, though this percentage can vary based on the Adviser\'s tactical decisions\n        ',NULL,'GAL','2019-02-03 14:29:22','2019-02-03 19:53:18'),
	(100,'SPDR® SSGA Income Allocation ETF',NULL,NULL,'INKM','2019-02-03 14:29:22','2019-02-03 14:29:22'),
	(101,'SPDR® SSGA Multi-Asset Real Return ETF',NULL,NULL,'RLY','2019-02-03 14:29:22','2019-02-03 14:29:22'),
	(102,'SPDR® Bloomberg Barclays Convertible Securities ETF',NULL,NULL,'CWB','2019-02-03 14:29:22','2019-02-03 14:29:22'),
	(103,'SPDR® Wells Fargo® Preferred Stock ETF',NULL,NULL,'PSK','2019-02-03 14:29:22','2019-02-03 14:29:22'),
	(104,'SPDR® MSCI ACWI Low Carbon Target ETF',NULL,NULL,'LOWC','2019-02-03 14:29:22','2019-02-03 14:29:22'),
	(105,'SPDR® MSCI EAFE Fossil Fuel Reserves Free ETF',NULL,NULL,'EFAX','2019-02-03 14:29:22','2019-02-03 14:29:22'),
	(106,'SPDR® MSCI Emerging Markets Fossil Fuel Reserves Free ETF',NULL,NULL,'EEMX','2019-02-03 14:29:22','2019-02-03 14:29:22'),
	(107,'SPDR® S&P® 500 Fossil Fuel Reserves Free ETF',NULL,NULL,'SPYX','2019-02-03 14:29:22','2019-02-03 14:29:22'),
	(108,'SPDR® SSGA Gender Diversity Index ETF',NULL,NULL,'SHE','2019-02-03 14:29:22','2019-02-03 14:29:22'),
	(109,'SPDR® Dow Jones® Global Real Estate ETF',NULL,NULL,'RWO','2019-02-03 14:29:22','2019-02-03 14:29:22'),
	(110,'SPDR® Dow Jones® International Real Estate ETF',NULL,NULL,'RWX','2019-02-03 14:29:22','2019-02-03 14:29:22'),
	(111,'SPDR® Dow Jones® REIT ETF',NULL,NULL,'RWR','2019-02-03 14:29:22','2019-02-03 14:29:22'),
	(112,'SPDR® Gold MiniSharesSM Trust',NULL,NULL,'GLDM','2019-02-03 14:29:22','2019-02-03 14:29:22'),
	(113,'SPDR® Gold Shares',NULL,NULL,'GLD','2019-02-03 14:29:22','2019-02-03 14:29:22'),
	(114,'SPDR® Long Dollar Gold Trust',NULL,NULL,'GLDW','2019-02-03 14:29:22','2019-02-03 14:29:22'),
	(115,'SPDR® S&P® Global Infrastructure ETF',NULL,NULL,'GII','2019-02-03 14:29:22','2019-02-03 14:29:22'),
	(116,'SPDR® S&P® Global Natural Resources ETF',NULL,NULL,'GNR','2019-02-03 14:29:22','2019-02-03 14:29:22'),
	(117,'SPDR® S&P® North American Natural Resources ETF',NULL,NULL,'NANR','2019-02-03 14:29:22','2019-02-03 14:29:22'),
	(118,'SPDR® DoubleLine® Short Duration Total Return Tactical ETF',NULL,NULL,'STOT','2019-02-03 14:29:22','2019-02-03 14:29:22'),
	(119,'SPDR® DoubleLine® Total Return Tactical ETF',NULL,NULL,'TOTL','2019-02-03 14:29:22','2019-02-03 14:29:22'),
	(120,'SPDR® SSGA Ultra Short Term Bond ETF',NULL,NULL,'ULST','2019-02-03 14:29:22','2019-02-03 14:29:22'),
	(121,'SPDR® Blackstone / GSO Senior Loan ETF',NULL,NULL,'SRLN','2019-02-03 14:29:22','2019-02-03 14:29:22'),
	(122,'SPDR® Bloomberg Barclays High Yield Bond ETF',NULL,NULL,'JNK','2019-02-03 14:29:22','2019-02-03 14:29:22'),
	(123,'SPDR® Bloomberg Barclays Short Term High Yield Bond ETF',NULL,NULL,'SJNK','2019-02-03 14:29:22','2019-02-03 14:29:22'),
	(124,'SPDR® ICE BofAML Crossover Corporate Bond ETF',NULL,NULL,'CJNK','2019-02-03 14:29:22','2019-02-03 14:29:22'),
	(125,'SPDR® Bloomberg Barclays Corporate Bond ETF',NULL,NULL,'CBND','2019-02-03 14:29:22','2019-02-03 14:29:22'),
	(126,'SPDR® Bloomberg Barclays Investment Grade Floating Rate ETF',NULL,NULL,'FLRN','2019-02-03 14:29:22','2019-02-03 14:29:22'),
	(127,'SPDR® Bloomberg Barclays 1-10 Year TIPS ETF',NULL,NULL,'TIPX','2019-02-03 14:29:22','2019-02-03 14:29:22'),
	(128,'SPDR® Bloomberg Barclays 1-3 Month T-Bill ETF',NULL,NULL,'BIL','2019-02-03 14:29:22','2019-02-03 14:29:22'),
	(129,'SPDR® Bloomberg Barclays Intermediate Term Treasury ETF',NULL,NULL,'ITE','2019-02-03 14:29:22','2019-02-03 14:29:22'),
	(130,'SPDR® Bloomberg Barclays TIPS ETF',NULL,NULL,'IPE','2019-02-03 14:29:22','2019-02-03 14:29:22'),
	(131,'SPDR® Bloomberg Barclays Mortgage Backed Bond ETF',NULL,NULL,'MBG','2019-02-03 14:29:22','2019-02-03 14:29:22'),
	(132,'SPDR® Nuveen Bloomberg Barclays Municipal Bond ETF',NULL,NULL,'TFI','2019-02-03 14:29:22','2019-02-03 14:29:22'),
	(133,'SPDR® Nuveen Bloomberg Barclays Short Term Municipal Bond ETF',NULL,NULL,'SHM','2019-02-03 14:29:22','2019-02-03 14:29:22'),
	(134,'SPDR® Nuveen S&P High Yield Municipal Bond ETF',NULL,NULL,'HYMB','2019-02-03 14:29:22','2019-02-03 14:29:22'),
	(135,'SPDR® Bloomberg Barclays Emerging Markets Local Bond ETF',NULL,NULL,'EBND','2019-02-03 14:29:22','2019-02-03 14:29:22'),
	(136,'SPDR® Bloomberg Barclays International Corporate Bond ETF',NULL,NULL,'IBND','2019-02-03 14:29:22','2019-02-03 14:29:22'),
	(137,'SPDR® Bloomberg Barclays International Treasury Bond ETF',NULL,NULL,'BWX','2019-02-03 14:29:22','2019-02-03 14:29:22'),
	(138,'SPDR® Bloomberg Barclays Short Term International Treasury Bond ETF',NULL,NULL,'BWZ','2019-02-03 14:29:22','2019-02-03 14:29:22'),
	(139,'SPDR® DoubleLine® Emerging Markets Fixed Income ETF',NULL,NULL,'EMTL','2019-02-03 14:29:22','2019-02-03 14:29:22'),
	(140,'SPDR® FTSE International Government Inflation-Protected Bond ETF','The SPDR® FTSE International Government Inflation-Protected Bond ETF seeks to provide investment results that, before fees and expenses, correspond generally to the price and yield performance of FTSE International Inflation-Linked Securities Select Index (the \"Index\")Seeks to provide exposure to inflation-linked bonds of developed and emerging market countries outside of the USSeek to hedge against the erosion of purchasing power due to inflation outside of the U.S.Rebalanced on the last business day of the month\n        ',NULL,'WIP','2019-02-03 14:29:22','2019-02-03 17:16:59');

/*!40000 ALTER TABLE `etfs` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table migrations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;

INSERT INTO `migrations` (`id`, `migration`, `batch`)
VALUES
	(1,'2014_10_12_000000_create_users_table',1),
	(2,'2014_10_12_100000_create_password_resets_table',1),
	(3,'2019_01_30_201313_create_activity_log_table',2),
	(10,'2019_02_01_115158_e_t_f_table',3),
	(11,'2019_02_01_115510_e_t_f_holdings_table',3),
	(12,'2019_02_02_125007_e_t_f_sector_weights_table',3),
	(13,'2019_02_02_135857_e_t_f_country_weights_table',3);

/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table password_resets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `password_resets`;

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`id`, `name`, `username`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`)
VALUES
	(3,'giorgi grdzelidze','grdzelo','grdzelog@gmail.com',NULL,'$2y$10$okjOBPBtSf99OID3s3Xg9./kkvNOE13Ity9b4Y7ldq.J0C3uiRtem','p0yzCCl9V7i44Lmf93bYsrdHTmbTBxsvaA9SLFfbrirAjO1rY4hC0vi2kRKf','2019-01-30 20:51:39','2019-01-30 20:51:39');

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
