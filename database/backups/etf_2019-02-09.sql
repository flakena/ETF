# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: localhost (MySQL 5.6.38)
# Database: etf
# Generation Time: 2019-02-09 16:37:30 +0000
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
	(1,'default','Successfully logged in.',NULL,NULL,1,'App\\User','{\"IP\":\"127.0.0.1\"}','2019-02-09 20:02:42','2019-02-09 20:02:42'),
	(2,'default','DOMDocument::loadHTML(): Tag header invalid in Entity, line: 28',NULL,NULL,1,'App\\User','{\"code\":0}','2019-02-09 20:15:29','2019-02-09 20:15:29'),
	(3,'default','DOMDocument::loadHTML() expects parameter 1 to be string, object given',NULL,NULL,1,'App\\User','{\"code\":0}','2019-02-09 20:15:29','2019-02-09 20:15:29'),
	(4,'default','DOMDocument::loadHTML(): Tag header invalid in Entity, line: 28',NULL,NULL,1,'App\\User','{\"code\":0}','2019-02-09 20:16:02','2019-02-09 20:16:02'),
	(5,'default','DOMDocument::loadHTML() expects parameter 1 to be string, object given',NULL,NULL,1,'App\\User','{\"code\":0}','2019-02-09 20:16:02','2019-02-09 20:16:02'),
	(6,'default','DOMDocument::loadHTML(): Tag header invalid in Entity, line: 28',NULL,NULL,1,'App\\User','{\"code\":0}','2019-02-09 20:16:21','2019-02-09 20:16:21'),
	(7,'default','DOMDocument::loadHTML() expects parameter 1 to be string, object given',NULL,NULL,1,'App\\User','{\"code\":0}','2019-02-09 20:16:23','2019-02-09 20:16:23'),
	(8,'default','DOMDocument::loadHTML(): Tag header invalid in Entity, line: 28',NULL,NULL,1,'App\\User','{\"code\":0}','2019-02-09 20:17:40','2019-02-09 20:17:40'),
	(9,'default','DOMDocument::loadHTML(): Tag header invalid in Entity, line: 28',NULL,NULL,1,'App\\User','{\"code\":0}','2019-02-09 20:18:25','2019-02-09 20:18:25'),
	(10,'default','DOMDocument::loadHTML(): Tag header invalid in Entity, line: 28',NULL,NULL,1,'App\\User','{\"code\":0}','2019-02-09 20:18:55','2019-02-09 20:18:55'),
	(11,'default','DOMDocument::loadHTML(): Tag header invalid in Entity, line: 28',NULL,NULL,1,'App\\User','{\"code\":0}','2019-02-09 20:20:50','2019-02-09 20:20:50'),
	(12,'default','DOMDocument::loadHTML(): Tag header invalid in Entity, line: 28',NULL,NULL,1,'App\\User','{\"code\":0}','2019-02-09 20:21:14','2019-02-09 20:21:14'),
	(13,'default','DOMDocument::loadHTML(): Tag header invalid in Entity, line: 28',NULL,NULL,1,'App\\User','{\"code\":0}','2019-02-09 20:22:23','2019-02-09 20:22:23'),
	(14,'default','DGT : SPDR® Global Dow ETF',33,'App\\Models\\Etf',1,'App\\User','{\"IP\":\"127.0.0.1\"}','2019-02-09 20:22:27','2019-02-09 20:22:27'),
	(15,'default','DOMDocument::loadHTML(): Tag header invalid in Entity, line: 25',NULL,NULL,1,'App\\User','{\"code\":0}','2019-02-09 20:22:29','2019-02-09 20:22:29'),
	(16,'default','DOMDocument::loadHTML(): Tag header invalid in Entity, line: 26',NULL,NULL,1,'App\\User','{\"code\":0}','2019-02-09 20:22:29','2019-02-09 20:22:29'),
	(17,'default','DOMDocument::loadHTML(): Tag header invalid in Entity, line: 28',NULL,NULL,1,'App\\User','{\"code\":0}','2019-02-09 20:23:27','2019-02-09 20:23:27'),
	(18,'default','DGT : SPDR® Global Dow ETF',33,'App\\Models\\Etf',1,'App\\User','{\"IP\":\"127.0.0.1\"}','2019-02-09 20:23:33','2019-02-09 20:23:33'),
	(19,'default','DOMDocument::loadHTML(): Tag header invalid in Entity, line: 25',NULL,NULL,1,'App\\User','{\"code\":0}','2019-02-09 20:23:35','2019-02-09 20:23:35'),
	(20,'default','DOMDocument::loadHTML(): Tag header invalid in Entity, line: 26',NULL,NULL,1,'App\\User','{\"code\":0}','2019-02-09 20:23:35','2019-02-09 20:23:35'),
	(21,'default','DGT : SPDR® Global Dow ETF',33,'App\\Models\\Etf',1,'App\\User','{\"IP\":\"127.0.0.1\"}','2019-02-09 20:23:40','2019-02-09 20:23:40'),
	(22,'default','DOMDocument::loadHTML(): Tag header invalid in Entity, line: 28',NULL,NULL,1,'App\\User','{\"code\":0}','2019-02-09 20:24:12','2019-02-09 20:24:12'),
	(23,'default','DGT : SPDR® Global Dow ETF',33,'App\\Models\\Etf',1,'App\\User','{\"IP\":\"127.0.0.1\"}','2019-02-09 20:24:15','2019-02-09 20:24:15'),
	(24,'default','DOMDocument::loadHTML(): Tag header invalid in Entity, line: 25',NULL,NULL,1,'App\\User','{\"code\":0}','2019-02-09 20:24:17','2019-02-09 20:24:17'),
	(25,'default','DOMDocument::loadHTML(): Tag header invalid in Entity, line: 26',NULL,NULL,1,'App\\User','{\"code\":0}','2019-02-09 20:24:17','2019-02-09 20:24:17'),
	(26,'default','XRT : SPDR® S&P® Retail ETF',93,'App\\Models\\Etf',1,'App\\User','{\"IP\":\"127.0.0.1\"}','2019-02-09 20:24:22','2019-02-09 20:24:22'),
	(27,'default','DOMDocument::loadHTML(): Tag header invalid in Entity, line: 25',NULL,NULL,1,'App\\User','{\"code\":0}','2019-02-09 20:24:24','2019-02-09 20:24:24'),
	(28,'default','DOMDocument::loadHTML(): Tag header invalid in Entity, line: 26',NULL,NULL,1,'App\\User','{\"code\":0}','2019-02-09 20:24:24','2019-02-09 20:24:24');

/*!40000 ALTER TABLE `activity_log` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table country_weights
# ------------------------------------------------------------

DROP TABLE IF EXISTS `country_weights`;

CREATE TABLE `country_weights` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `weight` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `etf_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `country_weights_etf_id_foreign` (`etf_id`),
  CONSTRAINT `country_weights_etf_id_foreign` FOREIGN KEY (`etf_id`) REFERENCES `etfs` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `country_weights` WRITE;
/*!40000 ALTER TABLE `country_weights` DISABLE KEYS */;

INSERT INTO `country_weights` (`id`, `name`, `weight`, `etf_id`, `created_at`, `updated_at`)
VALUES
	(47,'United States','46.92',33,'2019-02-09 20:24:17','2019-02-09 20:24:17'),
	(48,'Japan','9.76',33,'2019-02-09 20:24:17','2019-02-09 20:24:17'),
	(49,'United Kingdom','7.75',33,'2019-02-09 20:24:17','2019-02-09 20:24:17'),
	(50,'France','6.23',33,'2019-02-09 20:24:17','2019-02-09 20:24:17'),
	(51,'China','4.90',33,'2019-02-09 20:24:17','2019-02-09 20:24:17'),
	(52,'Germany','4.23',33,'2019-02-09 20:24:17','2019-02-09 20:24:17'),
	(53,'Switzerland','3.89',33,'2019-02-09 20:24:17','2019-02-09 20:24:17'),
	(54,'Spain','2.03',33,'2019-02-09 20:24:17','2019-02-09 20:24:17'),
	(55,'South Africa','1.68',33,'2019-02-09 20:24:17','2019-02-09 20:24:17'),
	(56,'India','1.47',33,'2019-02-09 20:24:17','2019-02-09 20:24:17'),
	(57,'Australia','1.42',33,'2019-02-09 20:24:17','2019-02-09 20:24:17'),
	(58,'Canada','1.33',33,'2019-02-09 20:24:17','2019-02-09 20:24:17'),
	(59,'Italy','1.19',33,'2019-02-09 20:24:17','2019-02-09 20:24:17'),
	(60,'Brazil','1.05',33,'2019-02-09 20:24:17','2019-02-09 20:24:17'),
	(61,'Denmark','0.82',33,'2019-02-09 20:24:17','2019-02-09 20:24:17'),
	(62,'Russia','0.74',33,'2019-02-09 20:24:17','2019-02-09 20:24:17'),
	(63,'Sweden','0.70',33,'2019-02-09 20:24:17','2019-02-09 20:24:17'),
	(64,'South Korea','0.69',33,'2019-02-09 20:24:17','2019-02-09 20:24:17'),
	(65,'Hong Kong','0.67',33,'2019-02-09 20:24:17','2019-02-09 20:24:17'),
	(66,'Mexico','0.67',33,'2019-02-09 20:24:17','2019-02-09 20:24:17'),
	(67,'Finland','0.65',33,'2019-02-09 20:24:17','2019-02-09 20:24:17'),
	(68,'Belgium','0.60',33,'2019-02-09 20:24:17','2019-02-09 20:24:17'),
	(69,'Taiwan','0.60',33,'2019-02-09 20:24:17','2019-02-09 20:24:17');

/*!40000 ALTER TABLE `country_weights` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table etfs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `etfs`;

CREATE TABLE `etfs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `symbol` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `etfs_symbol_unique` (`symbol`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `etfs` WRITE;
/*!40000 ALTER TABLE `etfs` DISABLE KEYS */;

INSERT INTO `etfs` (`id`, `name`, `description`, `symbol`, `created_at`, `updated_at`)
VALUES
	(1,'SPDR® Portfolio Large Cap ETF',NULL,'SPLG','2019-02-09 20:24:12','2019-02-09 20:24:12'),
	(2,'SPDR® Portfolio Mid Cap ETF',NULL,'SPMD','2019-02-09 20:24:12','2019-02-09 20:24:12'),
	(3,'SPDR® Portfolio S&P 500® Growth ETF',NULL,'SPYG','2019-02-09 20:24:12','2019-02-09 20:24:12'),
	(4,'SPDR® Portfolio S&P 500® High Dividend ETF',NULL,'SPYD','2019-02-09 20:24:12','2019-02-09 20:24:12'),
	(5,'SPDR® Portfolio S&P 500® Value ETF',NULL,'SPYV','2019-02-09 20:24:12','2019-02-09 20:24:12'),
	(6,'SPDR® Portfolio Small Cap ETF',NULL,'SPSM','2019-02-09 20:24:12','2019-02-09 20:24:12'),
	(7,'SPDR® Portfolio Total Stock Market ETF',NULL,'SPTM','2019-02-09 20:24:12','2019-02-09 20:24:12'),
	(8,'SPDR® Portfolio Developed World ex-US ETF',NULL,'SPDW','2019-02-09 20:24:12','2019-02-09 20:24:12'),
	(9,'SPDR® Portfolio Emerging Markets ETF',NULL,'SPEM','2019-02-09 20:24:12','2019-02-09 20:24:12'),
	(10,'SPDR® Portfolio Aggregate Bond ETF',NULL,'SPAB','2019-02-09 20:24:12','2019-02-09 20:24:12'),
	(11,'SPDR® Portfolio Intermediate Term Corporate Bond ETF',NULL,'SPIB','2019-02-09 20:24:12','2019-02-09 20:24:12'),
	(12,'SPDR® Portfolio Long Term Corporate Bond ETF',NULL,'SPLB','2019-02-09 20:24:12','2019-02-09 20:24:12'),
	(13,'SPDR® Portfolio Long Term Treasury ETF',NULL,'SPTL','2019-02-09 20:24:12','2019-02-09 20:24:12'),
	(14,'SPDR® Portfolio Short Term Corporate Bond ETF',NULL,'SPSB','2019-02-09 20:24:12','2019-02-09 20:24:12'),
	(15,'SPDR® Portfolio Short Term Treasury ETF',NULL,'SPTS','2019-02-09 20:24:12','2019-02-09 20:24:12'),
	(16,'SPDR® S&P® Dividend ETF',NULL,'SDY','2019-02-09 20:24:12','2019-02-09 20:24:12'),
	(17,'SPDR® S&P Emerging Markets Dividend ETF',NULL,'EDIV','2019-02-09 20:24:12','2019-02-09 20:24:12'),
	(18,'SPDR® S&P® Global Dividend ETF',NULL,'WDIV','2019-02-09 20:24:12','2019-02-09 20:24:12'),
	(19,'SPDR® S&P® International Dividend ETF',NULL,'DWX','2019-02-09 20:24:12','2019-02-09 20:24:12'),
	(20,'SPDR® MSCI EAFE StrategicFactorsSM ETF',NULL,'QEFA','2019-02-09 20:24:12','2019-02-09 20:24:12'),
	(21,'SPDR® MSCI Emerging Markets StrategicFactorsSM ETF',NULL,'QEMM','2019-02-09 20:24:12','2019-02-09 20:24:12'),
	(22,'SPDR® MSCI USA StrategicFactorsSM ETF',NULL,'QUS','2019-02-09 20:24:12','2019-02-09 20:24:12'),
	(23,'SPDR® MSCI World StrategicFactorsSM ETF',NULL,'QWLD','2019-02-09 20:24:12','2019-02-09 20:24:12'),
	(24,'SPDR® Russell 1000 Low Volatility Focus ETF',NULL,'ONEV','2019-02-09 20:24:12','2019-02-09 20:24:12'),
	(25,'SPDR® Russell 1000 Momentum Focus ETF',NULL,'ONEO','2019-02-09 20:24:12','2019-02-09 20:24:12'),
	(26,'SPDR® Russell 1000 Yield Focus ETF',NULL,'ONEY','2019-02-09 20:24:12','2019-02-09 20:24:12'),
	(27,'SPDR® S&P® 1500 Momentum Tilt ETF',NULL,'MMTM','2019-02-09 20:24:12','2019-02-09 20:24:12'),
	(28,'SPDR® S&P® 1500 Value Tilt ETF',NULL,'VLU','2019-02-09 20:24:12','2019-02-09 20:24:12'),
	(29,'SPDR® S&P® 500 Buyback ETF',NULL,'SPYB','2019-02-09 20:24:12','2019-02-09 20:24:12'),
	(30,'SPDR SSGA US Large Cap Low Volatility Index ETF',NULL,'LGLV','2019-02-09 20:24:12','2019-02-09 20:24:12'),
	(31,'SPDR SSGA US Small Cap Low Volatility Index ETF',NULL,'SMLV','2019-02-09 20:24:12','2019-02-09 20:24:12'),
	(32,'SPDR® Dorsey Wright® Fixed Income Allocation ETF',NULL,'DWFI','2019-02-09 20:24:12','2019-02-09 20:24:12'),
	(33,'SPDR® Global Dow ETF','The SPDR® Global Dow ETF seeks to provide investment results that, before fees and expenses, correspond generally to the total return performance of the Global Dow Index (the \"Index\")The Global Dow Index is made up of 150 constituents from around the world selected by an Averages Committee comprised of the managing editor of the Wall Street Journal, the head of Dow Jones Indexes research and the head of CME Group researchThe 150 companies are selected not just based on size and reputation, but also on their promise of future growth. The Index has been designed to cover both developed and emerging countries.\n        ','DGT','2019-02-09 20:24:12','2019-02-09 20:24:17'),
	(34,'SPDR® MSCI ACWI ex-US ETF',NULL,'CWI','2019-02-09 20:24:12','2019-02-09 20:24:12'),
	(35,'SPDR® MSCI ACWI IMI ETF',NULL,'ACIM','2019-02-09 20:24:12','2019-02-09 20:24:12'),
	(36,'SPDR® S&P® International Small Cap ETF',NULL,'GWX','2019-02-09 20:24:12','2019-02-09 20:24:12'),
	(37,'SPDR® EURO STOXX 50® ETF',NULL,'FEZ','2019-02-09 20:24:12','2019-02-09 20:24:12'),
	(38,'SPDR® EURO STOXX® Small Cap ETF',NULL,'SMEZ','2019-02-09 20:24:12','2019-02-09 20:24:12'),
	(39,'SPDR® Solactive Canada ETF',NULL,'ZCAN','2019-02-09 20:24:12','2019-02-09 20:24:12'),
	(40,'SPDR® Solactive Germany ETF',NULL,'ZDEU','2019-02-09 20:24:12','2019-02-09 20:24:12'),
	(41,'SPDR® Solactive Hong Kong ETF',NULL,'ZHOK','2019-02-09 20:24:12','2019-02-09 20:24:12'),
	(42,'SPDR® Solactive Japan ETF',NULL,'ZJPN','2019-02-09 20:24:12','2019-02-09 20:24:12'),
	(43,'SPDR® Solactive United Kingdom ETF',NULL,'ZGBR','2019-02-09 20:24:12','2019-02-09 20:24:12'),
	(44,'SPDR® STOXX® Europe 50 ETF',NULL,'FEU','2019-02-09 20:24:12','2019-02-09 20:24:12'),
	(45,'SPDR® MSCI China A Shares IMI ETF',NULL,'XINA','2019-02-09 20:24:12','2019-02-09 20:24:12'),
	(46,'SPDR® S&P® China ETF',NULL,'GXC','2019-02-09 20:24:12','2019-02-09 20:24:12'),
	(47,'SPDR® S&P® Emerging Asia Pacific ETF',NULL,'GMF','2019-02-09 20:24:12','2019-02-09 20:24:12'),
	(48,'SPDR® S&P® Emerging Markets Small Cap ETF',NULL,'EWX','2019-02-09 20:24:12','2019-02-09 20:24:12'),
	(49,'SPDR® Dow Jones® Industrial Average ETF',NULL,'DIA','2019-02-09 20:24:12','2019-02-09 20:24:12'),
	(50,'SPDR® MFS Systematic Core Equity ETF',NULL,'SYE','2019-02-09 20:24:12','2019-02-09 20:24:12'),
	(51,'SPDR® S&P 500® ETF',NULL,'SPY','2019-02-09 20:24:12','2019-02-09 20:24:12'),
	(52,'SPDR® S&P® 600 Small Cap ETF',NULL,'SLY','2019-02-09 20:24:12','2019-02-09 20:24:12'),
	(53,'SPDR® S&P MIDCAP 400® ETF',NULL,'MDY','2019-02-09 20:24:12','2019-02-09 20:24:12'),
	(54,'SPDR® MFS Systematic Growth Equity ETF',NULL,'SYG','2019-02-09 20:24:12','2019-02-09 20:24:12'),
	(55,'SPDR® MFS Systematic Value Equity ETF',NULL,'SYV','2019-02-09 20:24:12','2019-02-09 20:24:12'),
	(56,'SPDR® S&P® 400 Mid Cap Growth ETF',NULL,'MDYG','2019-02-09 20:24:12','2019-02-09 20:24:12'),
	(57,'SPDR® S&P® 400 Mid Cap Value ETF',NULL,'MDYV','2019-02-09 20:24:12','2019-02-09 20:24:12'),
	(58,'SPDR® S&P® 600 Small Cap Growth ETF',NULL,'SLYG','2019-02-09 20:24:12','2019-02-09 20:24:12'),
	(59,'SPDR® S&P® 600 Small Cap Value ETF',NULL,'SLYV','2019-02-09 20:24:12','2019-02-09 20:24:12'),
	(60,'Communication Services Select Sector SPDR® Fund',NULL,'XLC','2019-02-09 20:24:12','2019-02-09 20:24:12'),
	(61,'Consumer Discretionary Select Sector SPDR® Fund',NULL,'XLY','2019-02-09 20:24:12','2019-02-09 20:24:12'),
	(62,'Consumer Staples Select Sector SPDR® Fund',NULL,'XLP','2019-02-09 20:24:12','2019-02-09 20:24:12'),
	(63,'Energy Select Sector SPDR® Fund',NULL,'XLE','2019-02-09 20:24:12','2019-02-09 20:24:12'),
	(64,'Financial Select Sector SPDR® Fund',NULL,'XLF','2019-02-09 20:24:12','2019-02-09 20:24:12'),
	(65,'Health Care Select Sector SPDR® Fund',NULL,'XLV','2019-02-09 20:24:12','2019-02-09 20:24:12'),
	(66,'Industrial Select Sector SPDR® Fund',NULL,'XLI','2019-02-09 20:24:12','2019-02-09 20:24:12'),
	(67,'Materials Select Sector SPDR® Fund',NULL,'XLB','2019-02-09 20:24:12','2019-02-09 20:24:12'),
	(68,'Real Estate Select Sector SPDR® Fund',NULL,'XLRE','2019-02-09 20:24:12','2019-02-09 20:24:12'),
	(69,'Technology Select Sector SPDR® Fund',NULL,'XLK','2019-02-09 20:24:12','2019-02-09 20:24:12'),
	(70,'Utilities Select Sector SPDR® Fund',NULL,'XLU','2019-02-09 20:24:12','2019-02-09 20:24:12'),
	(71,'SPDR® Kensho Clean Power ETF',NULL,'XKCP','2019-02-09 20:24:12','2019-02-09 20:24:12'),
	(72,'SPDR® Kensho Final Frontiers ETF',NULL,'XKFF','2019-02-09 20:24:12','2019-02-09 20:24:12'),
	(73,'SPDR® Kensho Future Security ETF',NULL,'XKFS','2019-02-09 20:24:12','2019-02-09 20:24:12'),
	(74,'SPDR® Kensho Intelligent Structures ETF',NULL,'XKII','2019-02-09 20:24:12','2019-02-09 20:24:12'),
	(75,'SPDR® Kensho New Economies Composite ETF',NULL,'KOMP','2019-02-09 20:24:12','2019-02-09 20:24:12'),
	(76,'SPDR® Kensho Smart Mobility ETF',NULL,'XKST','2019-02-09 20:24:12','2019-02-09 20:24:12'),
	(77,'SPDR® FactSet Innovative Technology ETF',NULL,'XITK','2019-02-09 20:24:12','2019-02-09 20:24:12'),
	(78,'SPDR® NYSE Technology ETF',NULL,'XNTK','2019-02-09 20:24:12','2019-02-09 20:24:12'),
	(79,'SPDR® S&P® Aerospace & Defense ETF',NULL,'XAR','2019-02-09 20:24:12','2019-02-09 20:24:12'),
	(80,'SPDR® S&P® Bank ETF',NULL,'KBE','2019-02-09 20:24:12','2019-02-09 20:24:12'),
	(81,'SPDR® S&P® Biotech ETF',NULL,'XBI','2019-02-09 20:24:12','2019-02-09 20:24:12'),
	(82,'SPDR® S&P® Capital Markets ETF',NULL,'KCE','2019-02-09 20:24:12','2019-02-09 20:24:12'),
	(83,'SPDR® S&P® Health Care Equipment ETF',NULL,'XHE','2019-02-09 20:24:12','2019-02-09 20:24:12'),
	(84,'SPDR® S&P® Health Care Services ETF',NULL,'XHS','2019-02-09 20:24:12','2019-02-09 20:24:12'),
	(85,'SPDR® S&P® Homebuilders ETF',NULL,'XHB','2019-02-09 20:24:12','2019-02-09 20:24:12'),
	(86,'SPDR® S&P® Insurance ETF',NULL,'KIE','2019-02-09 20:24:12','2019-02-09 20:24:12'),
	(87,'SPDR® S&P® Internet ETF',NULL,'XWEB','2019-02-09 20:24:12','2019-02-09 20:24:12'),
	(88,'SPDR® S&P® Metals & Mining ETF',NULL,'XME','2019-02-09 20:24:12','2019-02-09 20:24:12'),
	(89,'SPDR® S&P® Oil & Gas Equipment & Services ETF',NULL,'XES','2019-02-09 20:24:12','2019-02-09 20:24:12'),
	(90,'SPDR® S&P® Oil & Gas Exploration & Production ETF',NULL,'XOP','2019-02-09 20:24:12','2019-02-09 20:24:12'),
	(91,'SPDR® S&P® Pharmaceuticals ETF',NULL,'XPH','2019-02-09 20:24:12','2019-02-09 20:24:12'),
	(92,'SPDR® S&P® Regional Banking ETF',NULL,'KRE','2019-02-09 20:24:12','2019-02-09 20:24:12'),
	(93,'SPDR® S&P® Retail ETF','The SPDR® S&P® Retail ETF seeks to provide investment results that, before fees and expenses, correspond generally to the total return performance of the S&P® Retail Select Industry® Index (the \"Index\")Seeks to provide exposure the retail segment of the S&P TMI, which comprises the following sub-industries: Apparel Retail, Automotive Retail, Computer & Electronic Retail, Department Stores, Drug Retail, Food Retailers, General Merchandise Stores, Hypermarkets & Super Centers, Internet & Direct Marketing Retail, and Specialty StoresSeeks to track a modified equal weighted index which provides the potential for unconcentrated industry exposure across large, mid and small cap stocksAllows investors to take strategic or tactical positions at a more targeted level than traditional sector based investing\n        ','XRT','2019-02-09 20:24:12','2019-02-09 20:24:24'),
	(94,'SPDR® S&P® Semiconductor ETF',NULL,'XSD','2019-02-09 20:24:12','2019-02-09 20:24:12'),
	(95,'SPDR® S&P® Software & Services ETF',NULL,'XSW','2019-02-09 20:24:12','2019-02-09 20:24:12'),
	(96,'SPDR® S&P® Technology Hardware ETF',NULL,'XTH','2019-02-09 20:24:12','2019-02-09 20:24:12'),
	(97,'SPDR® S&P® Telecom ETF',NULL,'XTL','2019-02-09 20:24:12','2019-02-09 20:24:12'),
	(98,'SPDR® S&P® Transportation ETF',NULL,'XTN','2019-02-09 20:24:12','2019-02-09 20:24:12'),
	(99,'SPDR® SSGA Global Allocation ETF',NULL,'GAL','2019-02-09 20:24:12','2019-02-09 20:24:12'),
	(100,'SPDR® SSGA Income Allocation ETF',NULL,'INKM','2019-02-09 20:24:12','2019-02-09 20:24:12'),
	(101,'SPDR® SSGA Multi-Asset Real Return ETF',NULL,'RLY','2019-02-09 20:24:12','2019-02-09 20:24:12'),
	(102,'SPDR® Bloomberg Barclays Convertible Securities ETF',NULL,'CWB','2019-02-09 20:24:12','2019-02-09 20:24:12'),
	(103,'SPDR® Wells Fargo® Preferred Stock ETF',NULL,'PSK','2019-02-09 20:24:12','2019-02-09 20:24:12'),
	(104,'SPDR® MSCI ACWI Low Carbon Target ETF',NULL,'LOWC','2019-02-09 20:24:12','2019-02-09 20:24:12'),
	(105,'SPDR® MSCI EAFE Fossil Fuel Reserves Free ETF',NULL,'EFAX','2019-02-09 20:24:12','2019-02-09 20:24:12'),
	(106,'SPDR® MSCI Emerging Markets Fossil Fuel Reserves Free ETF',NULL,'EEMX','2019-02-09 20:24:12','2019-02-09 20:24:12'),
	(107,'SPDR® S&P® 500 Fossil Fuel Reserves Free ETF',NULL,'SPYX','2019-02-09 20:24:12','2019-02-09 20:24:12'),
	(108,'SPDR® SSGA Gender Diversity Index ETF',NULL,'SHE','2019-02-09 20:24:12','2019-02-09 20:24:12'),
	(109,'SPDR® Dow Jones® Global Real Estate ETF',NULL,'RWO','2019-02-09 20:24:12','2019-02-09 20:24:12'),
	(110,'SPDR® Dow Jones® International Real Estate ETF',NULL,'RWX','2019-02-09 20:24:12','2019-02-09 20:24:12'),
	(111,'SPDR® Dow Jones® REIT ETF',NULL,'RWR','2019-02-09 20:24:12','2019-02-09 20:24:12'),
	(112,'SPDR® Gold MiniSharesSM Trust',NULL,'GLDM','2019-02-09 20:24:12','2019-02-09 20:24:12'),
	(113,'SPDR® Gold Shares',NULL,'GLD','2019-02-09 20:24:12','2019-02-09 20:24:12'),
	(114,'SPDR® Long Dollar Gold Trust',NULL,'GLDW','2019-02-09 20:24:12','2019-02-09 20:24:12'),
	(115,'SPDR® S&P® Global Infrastructure ETF',NULL,'GII','2019-02-09 20:24:12','2019-02-09 20:24:12'),
	(116,'SPDR® S&P® Global Natural Resources ETF',NULL,'GNR','2019-02-09 20:24:12','2019-02-09 20:24:12'),
	(117,'SPDR® S&P® North American Natural Resources ETF',NULL,'NANR','2019-02-09 20:24:12','2019-02-09 20:24:12'),
	(118,'SPDR® DoubleLine® Short Duration Total Return Tactical ETF',NULL,'STOT','2019-02-09 20:24:12','2019-02-09 20:24:12'),
	(119,'SPDR® DoubleLine® Total Return Tactical ETF',NULL,'TOTL','2019-02-09 20:24:12','2019-02-09 20:24:12'),
	(120,'SPDR® SSGA Ultra Short Term Bond ETF',NULL,'ULST','2019-02-09 20:24:12','2019-02-09 20:24:12'),
	(121,'SPDR® Blackstone / GSO Senior Loan ETF',NULL,'SRLN','2019-02-09 20:24:12','2019-02-09 20:24:12'),
	(122,'SPDR® Bloomberg Barclays High Yield Bond ETF',NULL,'JNK','2019-02-09 20:24:12','2019-02-09 20:24:12'),
	(123,'SPDR® Bloomberg Barclays Short Term High Yield Bond ETF',NULL,'SJNK','2019-02-09 20:24:12','2019-02-09 20:24:12'),
	(124,'SPDR® ICE BofAML Crossover Corporate Bond ETF',NULL,'CJNK','2019-02-09 20:24:12','2019-02-09 20:24:12'),
	(125,'SPDR® Bloomberg Barclays Corporate Bond ETF',NULL,'CBND','2019-02-09 20:24:12','2019-02-09 20:24:12'),
	(126,'SPDR® Bloomberg Barclays Investment Grade Floating Rate ETF',NULL,'FLRN','2019-02-09 20:24:12','2019-02-09 20:24:12'),
	(127,'SPDR® Bloomberg Barclays 1-10 Year TIPS ETF',NULL,'TIPX','2019-02-09 20:24:12','2019-02-09 20:24:12'),
	(128,'SPDR® Bloomberg Barclays 1-3 Month T-Bill ETF',NULL,'BIL','2019-02-09 20:24:12','2019-02-09 20:24:12'),
	(129,'SPDR® Bloomberg Barclays Intermediate Term Treasury ETF',NULL,'ITE','2019-02-09 20:24:12','2019-02-09 20:24:12'),
	(130,'SPDR® Bloomberg Barclays TIPS ETF',NULL,'IPE','2019-02-09 20:24:12','2019-02-09 20:24:12'),
	(131,'SPDR® Bloomberg Barclays Mortgage Backed Bond ETF',NULL,'MBG','2019-02-09 20:24:12','2019-02-09 20:24:12'),
	(132,'SPDR® Nuveen Bloomberg Barclays Municipal Bond ETF',NULL,'TFI','2019-02-09 20:24:12','2019-02-09 20:24:12'),
	(133,'SPDR® Nuveen Bloomberg Barclays Short Term Municipal Bond ETF',NULL,'SHM','2019-02-09 20:24:12','2019-02-09 20:24:12'),
	(134,'SPDR® Nuveen S&P High Yield Municipal Bond ETF',NULL,'HYMB','2019-02-09 20:24:12','2019-02-09 20:24:12'),
	(135,'SPDR® Bloomberg Barclays Emerging Markets Local Bond ETF',NULL,'EBND','2019-02-09 20:24:12','2019-02-09 20:24:12'),
	(136,'SPDR® Bloomberg Barclays International Corporate Bond ETF',NULL,'IBND','2019-02-09 20:24:12','2019-02-09 20:24:12'),
	(137,'SPDR® Bloomberg Barclays International Treasury Bond ETF',NULL,'BWX','2019-02-09 20:24:12','2019-02-09 20:24:12'),
	(138,'SPDR® Bloomberg Barclays Short Term International Treasury Bond ETF',NULL,'BWZ','2019-02-09 20:24:12','2019-02-09 20:24:12'),
	(139,'SPDR® DoubleLine® Emerging Markets Fixed Income ETF',NULL,'EMTL','2019-02-09 20:24:12','2019-02-09 20:24:12'),
	(140,'SPDR® FTSE International Government Inflation-Protected Bond ETF',NULL,'WIP','2019-02-09 20:24:12','2019-02-09 20:24:12');

/*!40000 ALTER TABLE `etfs` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table holdings
# ------------------------------------------------------------

DROP TABLE IF EXISTS `holdings`;

CREATE TABLE `holdings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `weight` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `etf_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `holdings_etf_id_foreign` (`etf_id`),
  CONSTRAINT `holdings_etf_id_foreign` FOREIGN KEY (`etf_id`) REFERENCES `etfs` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `holdings` WRITE;
/*!40000 ALTER TABLE `holdings` DISABLE KEYS */;

INSERT INTO `holdings` (`id`, `name`, `weight`, `etf_id`, `created_at`, `updated_at`)
VALUES
	(21,'Petroleo Brasileiro SA Sponsored ADR Pfd','1.02 ',33,'2019-02-09 20:24:17','2019-02-09 20:24:17'),
	(22,'MTN Group Limited','0.93 ',33,'2019-02-09 20:24:17','2019-02-09 20:24:17'),
	(23,'Starbucks Corporation','0.89 ',33,'2019-02-09 20:24:17','2019-02-09 20:24:17'),
	(24,'Anglo American plc','0.87 ',33,'2019-02-09 20:24:17','2019-02-09 20:24:17'),
	(25,'Procter & Gamble Company','0.82 ',33,'2019-02-09 20:24:17','2019-02-09 20:24:17'),
	(26,'Rio Tinto plc','0.82 ',33,'2019-02-09 20:24:17','2019-02-09 20:24:17'),
	(27,'Vestas Wind Systems A/S','0.82 ',33,'2019-02-09 20:24:17','2019-02-09 20:24:17'),
	(28,'Boeing Company','0.79 ',33,'2019-02-09 20:24:17','2019-02-09 20:24:17'),
	(29,'BHP Group Ltd','0.78 ',33,'2019-02-09 20:24:17','2019-02-09 20:24:17'),
	(30,'Twenty-First Century Fox Inc. Class A','0.78 ',33,'2019-02-09 20:24:17','2019-02-09 20:24:17'),
	(31,'Boot Barn Holdings Inc.','1.58 ',93,'2019-02-09 20:24:24','2019-02-09 20:24:24'),
	(32,'Five Below Inc.','1.34 ',93,'2019-02-09 20:24:24','2019-02-09 20:24:24'),
	(33,'Ollie\'s Bargain Outlet Holdings Inc','1.32 ',93,'2019-02-09 20:24:24','2019-02-09 20:24:24'),
	(34,'Lithia Motors Inc. Class A','1.32 ',93,'2019-02-09 20:24:24','2019-02-09 20:24:24'),
	(35,'eBay Inc.','1.30 ',93,'2019-02-09 20:24:24','2019-02-09 20:24:24'),
	(36,'Ulta Beauty Inc','1.27 ',93,'2019-02-09 20:24:24','2019-02-09 20:24:24'),
	(37,'American Eagle Outfitters Inc.','1.26 ',93,'2019-02-09 20:24:24','2019-02-09 20:24:24'),
	(38,'BJ\'s Wholesale Club Holdings Inc.','1.26 ',93,'2019-02-09 20:24:24','2019-02-09 20:24:24'),
	(39,'Stamps.com Inc.','1.26 ',93,'2019-02-09 20:24:24','2019-02-09 20:24:24'),
	(40,'Party City Holdco Inc.','1.26 ',93,'2019-02-09 20:24:24','2019-02-09 20:24:24');

/*!40000 ALTER TABLE `holdings` ENABLE KEYS */;
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
	(3,'2019_01_30_201313_create_activity_log_table',1),
	(4,'2019_02_01_115158_e_t_f_table',1),
	(5,'2019_02_01_115510_e_t_f_holdings_table',1),
	(6,'2019_02_02_125007_e_t_f_sector_weights_table',1),
	(7,'2019_02_02_135857_e_t_f_country_weights_table',1);

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



# Dump of table sector_weights
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sector_weights`;

CREATE TABLE `sector_weights` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `label` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `weight` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` tinyint(4) NOT NULL,
  `etf_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sector_weights_etf_id_foreign` (`etf_id`),
  CONSTRAINT `sector_weights_etf_id_foreign` FOREIGN KEY (`etf_id`) REFERENCES `etfs` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `sector_weights` WRITE;
/*!40000 ALTER TABLE `sector_weights` DISABLE KEYS */;

INSERT INTO `sector_weights` (`id`, `label`, `weight`, `order`, `etf_id`, `created_at`, `updated_at`)
VALUES
	(23,'Financials','16.98',1,33,'2019-02-09 20:24:17','2019-02-09 20:24:17'),
	(24,'Industrials','13.49',2,33,'2019-02-09 20:24:17','2019-02-09 20:24:17'),
	(25,'Consumer Discretionary','10.74',3,33,'2019-02-09 20:24:17','2019-02-09 20:24:17'),
	(26,'Communication Services','10.71',4,33,'2019-02-09 20:24:17','2019-02-09 20:24:17'),
	(27,'Health Care','10.41',5,33,'2019-02-09 20:24:17','2019-02-09 20:24:17'),
	(28,'Information Technology','9.7',6,33,'2019-02-09 20:24:17','2019-02-09 20:24:17'),
	(29,'Energy','8.87',7,33,'2019-02-09 20:24:17','2019-02-09 20:24:17'),
	(30,'Consumer Staples','7.83',8,33,'2019-02-09 20:24:17','2019-02-09 20:24:17'),
	(31,'Materials','6.12',9,33,'2019-02-09 20:24:17','2019-02-09 20:24:17'),
	(32,'Utilities','4.43',10,33,'2019-02-09 20:24:17','2019-02-09 20:24:17'),
	(33,'Real Estate','0.72',11,33,'2019-02-09 20:24:17','2019-02-09 20:24:17'),
	(34,'Apparel Retail','24.77',1,93,'2019-02-09 20:24:24','2019-02-09 20:24:24'),
	(35,'Internet & Direct Marketing Retail','20.46',2,93,'2019-02-09 20:24:24','2019-02-09 20:24:24'),
	(36,'Automotive Retail','15.41',3,93,'2019-02-09 20:24:24','2019-02-09 20:24:24'),
	(37,'Specialty Stores','13.48',4,93,'2019-02-09 20:24:24','2019-02-09 20:24:24'),
	(38,'OTHER','6.08',5,93,'2019-02-09 20:24:24','2019-02-09 20:24:24'),
	(39,'Department Stores','5.42',6,93,'2019-02-09 20:24:24','2019-02-09 20:24:24'),
	(40,'Hypermarkets & Super Centers','4.48',7,93,'2019-02-09 20:24:24','2019-02-09 20:24:24'),
	(41,'Computer & Electronics Retail','4.32',8,93,'2019-02-09 20:24:24','2019-02-09 20:24:24'),
	(42,'Food Retail','3.68',9,93,'2019-02-09 20:24:24','2019-02-09 20:24:24'),
	(43,'Drug Retail','1.91',10,93,'2019-02-09 20:24:24','2019-02-09 20:24:24');

/*!40000 ALTER TABLE `sector_weights` ENABLE KEYS */;
UNLOCK TABLES;


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
	(1,'giorgi grdzelidze','grdzelo','grdzelog@gmail.com',NULL,'$2y$10$odsasYtU5iVfz0vrUHKsVuYY/0Gw//ch5RSM2nKYsjsAeJ9IJABlK',NULL,'2019-02-09 20:02:42','2019-02-09 20:02:42');

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
