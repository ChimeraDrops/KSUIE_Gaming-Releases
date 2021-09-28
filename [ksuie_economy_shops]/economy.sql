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
  `multiplier` double DEFAULT NULL,
  `factor` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table redemrp.economy: ~23 rows (approximately)
/*!40000 ALTER TABLE `economy` DISABLE KEYS */;
REPLACE INTO `economy` (`identifier`, `multiplier`, `factor`) VALUES
	('biggame', 1.143, 1143),
	('venison', 1.16, 1160),
	('beef', 1.16, 1160),
	('aligatormeat', 1.201, 1201),
	('bird', 1.16, 1160),
	('game', 1.161, 1161),
	('pork', 1.16, 1160),
	('fishmeat', 1.16, 1160),
	('herptile', 1.16, 1160),
	('stringy', 1.16, 1160),
	('mutton', 1.16, 1160),
	('blueberry', 1.05, 1050),
	('cloth', 1.05, 1050),
	('rope', 1.05, 1050),
	('woodenplanks', 1.1, 1100),
	('stones', 1.05, 1050),
	('hitch', 1.05, 1050),
	('woodenlogs', 1, 1000),
	('tent', 1.05, 1050),
	('stick', 1.05, 1050),
	('emptybottle', 1.05, 1050),
	('golden_nugget', 1.01, 1010),
	('goldbar', 1.01, 1010);
/*!40000 ALTER TABLE `economy` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
