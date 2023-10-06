-- MySQL dump 10.19  Distrib 10.3.34-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: papedins_db
-- ------------------------------------------------------
-- Server version	10.3.34-MariaDB-0+deb10u1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `tokens_nas_frases`
--

DROP TABLE IF EXISTS `tokens_nas_frases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tokens_nas_frases` (
  `id_chave_token_na_frase` int(11) NOT NULL AUTO_INCREMENT,
  `nome_token_na_frase` varchar(200) DEFAULT NULL,
  `id_frase` int(11) DEFAULT NULL,
  `id_token` int(11) DEFAULT NULL,
  `ordem` int(11) DEFAULT NULL,
  `time_stamp` timestamp(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  PRIMARY KEY (`id_chave_token_na_frase`),
  UNIQUE KEY `id_frase` (`id_frase`,`id_token`,`ordem`),
  KEY `id_token` (`id_token`),
  CONSTRAINT `tokens_nas_frases_ibfk_1` FOREIGN KEY (`id_frase`) REFERENCES `frases` (`id_chave_frase`),
  CONSTRAINT `tokens_nas_frases_ibfk_2` FOREIGN KEY (`id_token`) REFERENCES `tokens` (`id_chave_token`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tokens_nas_frases`
--

LOCK TABLES `tokens_nas_frases` WRITE;
/*!40000 ALTER TABLE `tokens_nas_frases` DISABLE KEYS */;
INSERT INTO `tokens_nas_frases` VALUES (12,'apresentar',66,8,0,'2023-09-30 12:31:01.798459'),(13,'o',66,290,1,'2023-09-30 12:31:01.802716'),(14,'artigo',66,194,2,'2023-09-30 12:31:01.810245'),(15,'didático',66,292,3,'2023-09-30 12:31:01.840156'),(16,'para',66,274,4,'2023-09-30 12:31:01.842642'),(17,'a',66,412,5,'2023-09-30 12:31:01.846138'),(18,'conferência',66,248,6,'2023-09-30 12:31:01.848649'),(19,'livre',66,310,7,'2023-09-30 12:31:01.850081'),(20,'o',67,290,0,'2023-09-30 12:32:54.506978'),(21,'servidor',67,86,1,'2023-09-30 12:32:54.556251'),(22,'elaborar',67,1,2,'2023-09-30 12:32:54.561131'),(23,'o',67,290,3,'2023-09-30 12:32:54.565320'),(24,'artigo',67,194,4,'2023-09-30 12:32:54.597759'),(25,'científico',67,295,5,'2023-09-30 12:32:54.603871'),(26,'para',67,274,6,'2023-09-30 12:32:54.607991'),(27,'o',67,290,7,'2023-09-30 12:32:54.611924'),(28,'congresso',67,210,8,'2023-09-30 12:32:54.615805'),(29,'didático',67,292,9,'2023-09-30 12:32:54.619165'),(30,'analisar',68,42,0,'2023-09-30 14:03:43.387345'),(31,'artigo',68,194,2,'2023-09-30 14:03:43.390521'),(32,'didático',68,292,3,'2023-09-30 14:03:43.394856'),(33,'para',68,274,4,'2023-09-30 14:03:43.399050'),(34,'o',68,290,5,'2023-09-30 14:03:43.402521'),(35,'congresso',68,210,6,'2023-09-30 14:03:43.435128'),(36,'científico',68,295,7,'2023-09-30 14:03:43.438091'),(37,'apostilamento',69,107,0,'2023-09-30 17:40:39.854392'),(38,'para',69,274,1,'2023-09-30 17:40:39.870108'),(39,'análise',69,103,2,'2023-09-30 17:40:39.895508'),(40,'bibliográfica',69,346,3,'2023-09-30 17:40:39.909785'),(41,'da',69,418,4,'2023-09-30 17:40:39.918677'),(42,'compra',69,77,5,'2023-09-30 17:40:39.932165'),(43,'pública',69,382,6,'2023-09-30 17:40:39.938215'),(44,'apresentar',70,8,0,'2023-09-30 18:14:07.769394'),(45,'o',70,290,1,'2023-09-30 18:14:07.979565'),(46,'congresso',70,210,2,'2023-09-30 18:14:08.671822'),(47,'científico',70,295,3,'2023-09-30 18:14:08.824381'),(48,'para',70,274,4,'2023-09-30 18:14:08.854369'),(49,'a',70,412,5,'2023-09-30 18:14:08.888660'),(50,'participação',70,53,6,'2023-09-30 18:14:08.981522'),(51,'pública',70,382,7,'2023-09-30 18:14:08.989879'),(52,'apoiar',71,11,0,'2023-09-30 18:24:46.177102'),(53,'o',71,290,1,'2023-09-30 18:24:46.210976'),(54,'artigo',71,194,2,'2023-09-30 18:24:46.231593'),(55,'científico',71,295,3,'2023-09-30 18:24:46.247244'),(56,'para',71,274,4,'2023-09-30 18:24:46.273897'),(57,'o',71,290,5,'2023-09-30 18:24:46.279303'),(58,'congresso',71,210,6,'2023-09-30 18:24:46.283582'),(59,'científico',71,295,7,'2023-09-30 18:24:46.288397'),(60,'o',72,290,0,'2023-09-30 18:26:35.896768'),(61,'aplicativo',72,270,1,'2023-09-30 18:26:35.900765'),(62,'apoiado',72,163,2,'2023-09-30 18:26:35.962809'),(63,'visitante',72,240,4,'2023-09-30 18:26:35.984178'),(64,'científico',72,295,5,'2023-09-30 18:26:36.004819'),(65,'para',72,274,6,'2023-09-30 18:26:36.020878'),(66,'a',72,412,7,'2023-09-30 18:26:36.038548'),(67,'demanda',72,252,8,'2023-09-30 18:26:36.438377'),(68,'didática',72,367,9,'2023-09-30 18:26:36.510077'),(69,'participação',73,53,0,'2023-09-30 18:37:45.977951'),(70,'em',73,272,1,'2023-09-30 18:37:45.999479'),(71,'congresso',73,210,2,'2023-09-30 18:37:46.016849'),(72,'contábil',73,319,3,'2023-09-30 18:37:46.031916'),(73,'de',73,275,4,'2023-09-30 18:37:46.048928'),(74,'interesse',73,99,5,'2023-09-30 18:37:46.392884'),(75,'público',73,306,6,'2023-09-30 18:37:46.415671');
/*!40000 ALTER TABLE `tokens_nas_frases` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-03 15:42:10
