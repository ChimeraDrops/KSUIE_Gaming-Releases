-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.21-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Dumping structure for table redemrp.economy
DROP TABLE IF EXISTS `economy`;
CREATE TABLE IF NOT EXISTS `economy` (
  `identifier` varchar(50) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `multiplier` double DEFAULT NULL,
  `factor` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table redemrp.economy: ~24 rows (approximately)
/*!40000 ALTER TABLE `economy` DISABLE KEYS */;
REPLACE INTO `economy` (`identifier`, `price`, `multiplier`, `factor`) VALUES
	('biggame', 2, 1.13, 1140),
	('venison', 2, 1.13, 1140),
	('beef', 3, 1.2, 1200),
	('aligatormeat', 3, 1.2, 1205),
	('bird', 1, 1.2, 1200),
	('game', 1.5, 1.2, 1200),
	('pork', 2, 1.2, 1200),
	('fishmeat', 1.5, 1.2, 1200),
	('herptile', 1.25, 1.2, 1200),
	('stringy', 0.75, 1.2, 1200),
	('mutton', 2, 1.2, 1200),
	('blueberry', 0.15, 1.2, 1200),
	('cloth', 0.25, 1.19, 1199),
	('rope', 0.5, 1.2, 1200),
	('woodenplanks', 0.75, 1.36, 1360),
	('stones', 0.5, 1.2, 1200),
	('hitch', 5, 1.2, 1200),
	('woodenlogs', 2, 1, 1000),
	('tent', 10, 1.22, 1220),
	('stick', 0.25, 1.2, 1200),
	('emptybottle', 0.3, 1.2, 1200),
	('golden_nugget', 10, 1.2, 1200),
	('goldbar', 50, 1.19, 1195),
	('wheat', 0.15, 1.2, 1200),
	('apple', 0.25, 1.2, 1200),
	('bread', 1, 1.2, 1200),
	('water', 1, 1.2, 1209),
	('cigar', 2.5, 1.2, 1200);
/*!40000 ALTER TABLE `economy` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
