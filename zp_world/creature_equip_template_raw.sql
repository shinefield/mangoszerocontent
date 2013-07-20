-- MySQL dump 10.13  Distrib 5.5.29, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: zp_world
-- ------------------------------------------------------
-- Server version	5.5.29-0ubuntu0.12.10.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `creature_equip_template_raw`
--

DROP TABLE IF EXISTS `creature_equip_template_raw`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `creature_equip_template_raw` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Unique entry',
  `equipmodel1` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `equipmodel2` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `equipmodel3` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `equipinfo1` int(10) unsigned NOT NULL DEFAULT '0',
  `equipinfo2` int(10) unsigned NOT NULL DEFAULT '0',
  `equipinfo3` int(10) unsigned NOT NULL DEFAULT '0',
  `equipslot1` int(11) NOT NULL DEFAULT '0',
  `equipslot2` int(11) NOT NULL DEFAULT '0',
  `equipslot3` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Creature System (Equipment)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `creature_equip_template_raw`
--

LOCK TABLES `creature_equip_template_raw` WRITE;
/*!40000 ALTER TABLE `creature_equip_template_raw` DISABLE KEYS */;
/*!40000 ALTER TABLE `creature_equip_template_raw` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed
