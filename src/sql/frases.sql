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
-- Table structure for table `frases`
--

DROP TABLE IF EXISTS `frases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `frases` (
  `id_chave_frase` int(11) NOT NULL AUTO_INCREMENT,
  `nome_frase` varchar(200) DEFAULT NULL,
  `id_tipo_elemento_sintatico` int(11) DEFAULT NULL,
  `time_stamp` timestamp(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  PRIMARY KEY (`id_chave_frase`),
  UNIQUE KEY `nome_frase` (`nome_frase`),
  KEY `id_tipo_elemento_sintatico` (`id_tipo_elemento_sintatico`),
  CONSTRAINT `frases_ibfk_1` FOREIGN KEY (`id_tipo_elemento_sintatico`) REFERENCES `tipos_elementos_sintaticos` (`id_chave_tipo_elemento_sintatico`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `frases`
--

LOCK TABLES `frases` WRITE;
/*!40000 ALTER TABLE `frases` DISABLE KEYS */;
INSERT INTO `frases` VALUES (66,'apresentar o artigo didático para a conferência livre',1,'2023-09-30 12:31:01.470340'),(67,'o servidor elaborar o artigo científico para o congresso didático',2,'2023-09-30 12:32:54.475106'),(68,'analisar  artigo didático para o congresso científico',1,'2023-09-30 14:03:43.149060'),(69,'apostilamento para análise bibliográfica da compra pública',13,'2023-09-30 17:40:39.822883'),(70,'apresentar o congresso científico para a participação pública',1,'2023-09-30 18:14:07.671821'),(71,'apoiar o artigo científico para o congresso científico',1,'2023-09-30 18:24:46.121228'),(72,'o aplicativo apoiado  visitante científico para a demanda didática',2,'2023-09-30 18:26:35.883381'),(73,'participação em congresso contábil de interesse público',13,'2023-09-30 18:37:45.657398');
/*!40000 ALTER TABLE `frases` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-03 15:41:45
