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
-- Table structure for table `tipos_elementos_sintaticos`
--

DROP TABLE IF EXISTS `tipos_elementos_sintaticos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipos_elementos_sintaticos` (
  `id_chave_tipo_elemento_sintatico` int(11) NOT NULL AUTO_INCREMENT,
  `nome_tipo_elemento_sintatico` varchar(200) DEFAULT NULL,
  `descricao` varchar(1000) DEFAULT NULL,
  `time_stamp` timestamp(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  PRIMARY KEY (`id_chave_tipo_elemento_sintatico`),
  UNIQUE KEY `nome_tipo_elemento_sintatico` (`nome_tipo_elemento_sintatico`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipos_elementos_sintaticos`
--

LOCK TABLES `tipos_elementos_sintaticos` WRITE;
/*!40000 ALTER TABLE `tipos_elementos_sintaticos` DISABLE KEYS */;
INSERT INTO `tipos_elementos_sintaticos` VALUES (1,'entrega infinitivo','entrega padrão constituída por um verbo que indica a ação realizada sobre um objeto. Esse tipo de sentença não tem sujeito porque o verbo está no infinitivo','2023-09-26 16:33:09.065710'),(2,'entrega com sujeito','entrega padrão constituída por um verbo que indica a ação realizada por um sujeito sobre um objeto. Esse tipo de sentença tem sujeito','2023-09-26 16:33:09.067789'),(3,'sujeito','É o sujeito a quem se refere o predicado','2023-09-26 16:33:09.068429'),(4,'determinantes_do_sujeito','Fazem parte do sujeito, são as palavras que antecedem o núcleo do sujeito, como artigo, pronomes, numerais, etc.','2023-09-26 16:33:09.068953'),(5,'nucleo_sujeito','É o núcleo do sujeito a quem se refere o predicado','2023-09-26 16:33:09.069436'),(6,'modificadores_do_sujeito','É parte do Sujeito, são palavras que suscedem o sujeito para modificá-lo como adjetivos','2023-09-26 16:33:09.069894'),(7,'predicado','É o predicado da sentença, que pode ser predicado verbal, nominal ou verbo-nominal','2023-09-26 16:33:09.071476'),(8,'verbo_do_predicado','É parte do predicado, elemento central que denota uma ação do sujeito','2023-09-26 16:33:09.072084'),(9,'objeto_do_predicado','É o predicado da sentença, que pode ser predicado verbal, nominal ou verbo-nominal','2023-09-26 16:33:09.072649'),(10,'objeto_direto','É o objeto direto do objeto','2023-09-26 16:33:09.073238'),(11,'objeto_indireto','É o objeto indireto do objeto','2023-09-26 16:33:09.073765'),(12,'Lixeira','Lixeira pardão para jogar elementos descartados.','2023-09-26 16:33:09.075311'),(13,'entrega com substantivação','entrega padrão constituída por um verbo que indica a ação realizada por um sujeito sobre um objeto. Esse tipo de sentença tem sujeito','2023-09-26 16:33:09.076316');
/*!40000 ALTER TABLE `tipos_elementos_sintaticos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-03 15:41:49
