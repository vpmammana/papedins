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
-- Table structure for table `cargos_comissionados`
--

DROP TABLE IF EXISTS `cargos_comissionados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cargos_comissionados` (
  `id_chave_cargo_comissionado` int(11) NOT NULL AUTO_INCREMENT,
  `nome_cargo_comissionado` varchar(300) DEFAULT NULL,
  `valor` float DEFAULT NULL,
  `cce_equivalente` float DEFAULT NULL,
  PRIMARY KEY (`id_chave_cargo_comissionado`),
  UNIQUE KEY `nome_cargo_comissionado` (`nome_cargo_comissionado`)
) ENGINE=InnoDB AUTO_INCREMENT=116 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cargos_comissionados`
--

LOCK TABLES `cargos_comissionados` WRITE;
/*!40000 ALTER TABLE `cargos_comissionados` DISABLE KEYS */;
INSERT INTO `cargos_comissionados` VALUES (1,'CCE_1.18',1887.14,6.41),(2,'CCE_1.17',1469.94,6.27),(3,'CCE_1.16',1100.92,5.81),(4,'CCE_1.15',1849.5,5.04),(5,'CCE_1.14',1701.64,4.31),(6,'CCE_1.13',11306.9,3.84),(7,'CCE_1.12',9137.66,3.1),(8,'CCE_1.11',7286.14,2.47),(9,'CCE_1.10',6250.69,2.12),(10,'CCE_1.09',4907.65,1.67),(11,'CCE_1.08',4706.98,1.6),(12,'CCE_1.07',4080.23,1.39),(13,'CCE_1.06',3455.09,1.17),(14,'CCE_1.05',2944.59,1),(15,'CCE_1.04',1307.74,0.44),(16,'CCE_1.03',1089.5,0.37),(17,'CCE_1.02',609.36,0.21),(18,'CCE_1.01',360.56,0.12),(19,'CCE_2.17',18469.9,6.27),(20,'CCE_2.16',17100.9,5.81),(21,'CCE_2.15',14849.5,5.04),(22,'CCE_2.14',12701.6,4.31),(23,'CCE_2.13',11306.9,3.84),(24,'CCE_2.12',9137.66,3.1),(25,'CCE_2.11',7286.14,2.47),(26,'CCE_2.10',6250.69,2.12),(27,'CCE_2.09',4907.65,1.67),(28,'CCE_2.08',4706.98,1.6),(29,'CCE_2.07',4080.23,1.39),(30,'CCE_2.06',3455.09,1.17),(31,'CCE_2.05',2944.59,1),(32,'CCE_2.04',1307.74,0.44),(33,'CCE_2.03',1089.5,0.37),(34,'CCE_2.02',609.36,0.21),(35,'CCE_2.01',360.56,0.12),(36,'CCE_3.16',17100.9,5.81),(37,'CCE_3.15',14849.5,5.04),(38,'CCE_3.14',12701.6,4.31),(39,'CCE_3.13',11306.9,3.84),(40,'CCE_3.12',9137.66,3.1),(41,'CCE_3.11',7286.14,2.47),(42,'CCE_3.10',6250.69,2.12),(43,'CCE_3.09',4907.65,1.67),(44,'CCE_3.08',4706.98,1.6),(45,'CCE_3.07',4080.23,1.39),(46,'CCE_3.06',3455.09,1.17),(47,'CCE_3.05',2944.59,1),(48,'CCE_3.04',1307.74,0.44),(49,'CCE_3.03',1089.5,0.37),(50,'CCE_3.02',609.36,0.21),(51,'CCE_3.01',360.56,0.12),(52,'FCE_1.17',11082,3.76),(53,'FCE_1.16',10260.5,3.48),(54,'FCE_1.15',8909.69,3.03),(55,'FCE_1.14',7620.99,2.59),(56,'FCE_1.13',6784.14,2.3),(57,'FCE_1.12',5482.59,1.86),(58,'FCE_1.11',4371.68,1.48),(59,'FCE_1.10',3750.42,1.27),(60,'FCE_1.09',2944.59,1),(61,'FCE_1.08',2824.69,0.96),(62,'FCE_1.07',2448.14,0.83),(63,'FCE_1.06',2073.06,0.7),(64,'FCE_1.05',1766.76,0.6),(65,'FCE_1.04',1307.74,0.44),(66,'FCE_1.03',1089.5,0.37),(67,'FCE_1.02',609.36,0.21),(68,'FCE_1.01',360.56,0.12),(69,'FCE_2.17',11082,3.76),(70,'FCE_2.16',10260.5,3.48),(71,'FCE_2.15',8909.69,3.03),(72,'FCE_2.14',7620.99,2.59),(73,'FCE_2.13',6784.14,2.3),(74,'FCE_2.12',5482.59,1.86),(75,'FCE_2.11',4371.68,1.48),(76,'FCE_2.10',3750.42,1.27),(77,'FCE_2.09',2944.59,1),(78,'FCE_2.08',2824.69,0.96),(79,'FCE_2.07',2448.14,0.83),(80,'FCE_2.06',2073.06,0.7),(81,'FCE_2.05',1766.76,0.6),(82,'FCE_2.04',1307.74,0.44),(83,'FCE_2.03',1089.5,0.37),(84,'FCE_2.02',609.36,0.21),(85,'FCE_2.01',360.56,0.12),(86,'FCE_3.16',10260.5,3.48),(87,'FCE_3.15',8909.69,3.03),(88,'FCE_3.14',7620.99,2.59),(89,'FCE_3.13',6784.14,2.3),(90,'FCE_3.12',5482.59,1.86),(91,'FCE_3.11',4371.68,1.48),(92,'FCE_3.10',3750.42,1.27),(93,'FCE_3.09',2944.59,1),(94,'FCE_3.08',2824.69,0.96),(95,'FCE_3.07',2448.14,0.83),(96,'FCE_3.06',2073.06,0.7),(97,'FCE_3.05',1766.76,0.6),(98,'FCE_3.04',1307.74,0.44),(99,'FCE_3.03',1089.5,0.37),(100,'FCE_3.02',609.36,0.21),(101,'FCE_3.01',360.56,0.12),(102,'FCE_4.13',6784.14,2.3),(103,'FCE_4.12',5482.59,1.86),(104,'FCE_4.11',4371.68,1.48),(105,'FCE_4.10',3750.42,1.27),(106,'FCE_4.09',2944.59,1),(107,'FCE_4.08',2824.69,0.96),(108,'FCE_4.07',2448.14,0.83),(109,'FCE_4.06',2073.06,0.7),(110,'FCE_4.05',1766.76,0.6),(111,'FCE_4.04',1307.74,0.44),(112,'FCE_4.03',1089.5,0.37),(113,'FCE_4.02',609.36,0.21),(114,'FCE_4.01',360.56,0.12),(115,'Preencher',0,0);
/*!40000 ALTER TABLE `cargos_comissionados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cargos_da_carreira`
--

DROP TABLE IF EXISTS `cargos_da_carreira`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cargos_da_carreira` (
  `id_chave_cargo_da_carreira` int(11) NOT NULL AUTO_INCREMENT,
  `nome_cargo_da_carreira` varchar(100) DEFAULT NULL,
  `nome_carreira` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_chave_cargo_da_carreira`),
  UNIQUE KEY `nome_cargo_da_carreira` (`nome_cargo_da_carreira`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cargos_da_carreira`
--

LOCK TABLES `cargos_da_carreira` WRITE;
/*!40000 ALTER TABLE `cargos_da_carreira` DISABLE KEYS */;
INSERT INTO `cargos_da_carreira` VALUES (1,'Analista','Gestão, Planejamento e Infraestrutura'),(2,'Assistente','Gestão, Planejamento e Infraestrutura'),(3,'Auxiliar','Gestão, Planejamento e Infraestrutura'),(4,'Pesquisador(a)','Pesquisa'),(5,'Técnico(a)','Desenvolvimento Tecnológco'),(6,'Tecnologista','Desenvolvimento Tecnológco');
/*!40000 ALTER TABLE `cargos_da_carreira` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contabilizar_para_registrados`
--

DROP TABLE IF EXISTS `contabilizar_para_registrados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contabilizar_para_registrados` (
  `id_chave_contabilizar_para_registrado` int(11) NOT NULL AUTO_INCREMENT,
  `nome_contabilizar_para_registrado` varchar(100) DEFAULT NULL,
  `id_registrado` int(11) DEFAULT NULL,
  `id_quesito` int(11) DEFAULT NULL,
  `contabilizar` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_chave_contabilizar_para_registrado`),
  UNIQUE KEY `id_registrado` (`id_registrado`,`id_quesito`),
  UNIQUE KEY `nome_contabilizar_para_registrado` (`nome_contabilizar_para_registrado`),
  KEY `id_quesito` (`id_quesito`),
  CONSTRAINT `contabilizar_para_registrados_ibfk_1` FOREIGN KEY (`id_registrado`) REFERENCES `registrados` (`id_chave_registrado`),
  CONSTRAINT `contabilizar_para_registrados_ibfk_2` FOREIGN KEY (`id_quesito`) REFERENCES `quesitos` (`id_chave_quesito`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contabilizar_para_registrados`
--

LOCK TABLES `contabilizar_para_registrados` WRITE;
/*!40000 ALTER TABLE `contabilizar_para_registrados` DISABLE KEYS */;
/*!40000 ALTER TABLE `contabilizar_para_registrados` ENABLE KEYS */;
UNLOCK TABLES;

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

--
-- Table structure for table `grupos`
--

DROP TABLE IF EXISTS `grupos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grupos` (
  `id_chave_grupo` int(11) NOT NULL AUTO_INCREMENT,
  `nome_grupo` varchar(200) DEFAULT NULL,
  `n_max` int(11) DEFAULT NULL COMMENT 'numero maximo de contabilizacoes. negativo significa sem limite',
  `descricao` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`id_chave_grupo`),
  UNIQUE KEY `nome_grupo` (`nome_grupo`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grupos`
--

LOCK TABLES `grupos` WRITE;
/*!40000 ALTER TABLE `grupos` DISABLE KEYS */;
INSERT INTO `grupos` VALUES (1,'GERAL',-1,'Não tem restricao no número de contabilizações de pontuação'),(2,'EXPERIÊNCIA',3,'Máximo de 2 quesitos são contabilizados');
/*!40000 ALTER TABLE `grupos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guarda_ids_da_lixeira`
--

DROP TABLE IF EXISTS `guarda_ids_da_lixeira`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `guarda_ids_da_lixeira` (
  `id_chave_guarda_id_da_lixeira` int(11) NOT NULL AUTO_INCREMENT,
  `id_da_secao_da_lixeira` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_chave_guarda_id_da_lixeira`),
  KEY `id_da_secao_da_lixeira` (`id_da_secao_da_lixeira`),
  CONSTRAINT `guarda_ids_da_lixeira_ibfk_1` FOREIGN KEY (`id_da_secao_da_lixeira`) REFERENCES `secoes` (`id_chave_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=502 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guarda_ids_da_lixeira`
--

LOCK TABLES `guarda_ids_da_lixeira` WRITE;
/*!40000 ALTER TABLE `guarda_ids_da_lixeira` DISABLE KEYS */;
INSERT INTO `guarda_ids_da_lixeira` VALUES (499,100),(500,101),(501,102);
/*!40000 ALTER TABLE `guarda_ids_da_lixeira` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ids_de_referencia`
--

DROP TABLE IF EXISTS `ids_de_referencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ids_de_referencia` (
  `id_chave_id_de_referencia` int(11) NOT NULL AUTO_INCREMENT,
  `nome_id_de_referencia` varchar(300) DEFAULT NULL,
  `id_secao_do_identificador` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_chave_id_de_referencia`),
  UNIQUE KEY `nome_id_de_referencia` (`nome_id_de_referencia`),
  UNIQUE KEY `id_secao_do_identificador` (`id_secao_do_identificador`),
  CONSTRAINT `ids_de_referencia_ibfk_1` FOREIGN KEY (`id_secao_do_identificador`) REFERENCES `secoes` (`id_chave_categoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ids_de_referencia`
--

LOCK TABLES `ids_de_referencia` WRITE;
/*!40000 ALTER TABLE `ids_de_referencia` DISABLE KEYS */;
/*!40000 ALTER TABLE `ids_de_referencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instancias_propriedades`
--

DROP TABLE IF EXISTS `instancias_propriedades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `instancias_propriedades` (
  `id_chave_instancia_propriedade` int(11) NOT NULL AUTO_INCREMENT,
  `valor_continuo` varchar(50) DEFAULT NULL,
  `id_propriedade` int(11) DEFAULT NULL,
  `id_valor_discreto` int(11) DEFAULT NULL,
  `id_nested_tipo_secao` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_chave_instancia_propriedade`),
  UNIQUE KEY `id_propriedade` (`id_propriedade`,`id_nested_tipo_secao`),
  KEY `id_valor_discreto` (`id_valor_discreto`),
  KEY `id_nested_tipo_secao` (`id_nested_tipo_secao`),
  CONSTRAINT `instancias_propriedades_ibfk_1` FOREIGN KEY (`id_propriedade`) REFERENCES `propriedades` (`id_chave_propriedade`),
  CONSTRAINT `instancias_propriedades_ibfk_2` FOREIGN KEY (`id_valor_discreto`) REFERENCES `valores_discretos` (`id_chave_valor_discreto`),
  CONSTRAINT `instancias_propriedades_ibfk_3` FOREIGN KEY (`id_nested_tipo_secao`) REFERENCES `nested_tipos_secoes` (`id_chave_nested_tipo_secao`)
) ENGINE=InnoDB AUTO_INCREMENT=347 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instancias_propriedades`
--

LOCK TABLES `instancias_propriedades` WRITE;
/*!40000 ALTER TABLE `instancias_propriedades` DISABLE KEYS */;
INSERT INTO `instancias_propriedades` VALUES (1,'',9,70,NULL),(2,'',10,72,NULL),(3,'',4,8,NULL),(4,'',5,12,NULL),(5,'',6,1,NULL),(6,'',2,41,NULL),(7,'',3,52,NULL),(8,'',1,56,NULL),(9,'',9,70,2),(10,'',10,71,2),(11,'',11,76,2),(12,'',13,83,2),(13,'',12,90,2),(14,'',4,8,2),(15,'',5,12,2),(16,'',6,3,2),(17,'',2,41,2),(18,'',3,52,2),(19,'',1,56,2),(20,'',9,70,17),(21,'',10,72,17),(22,'',4,8,17),(23,'',5,12,17),(24,'',6,3,17),(25,'',2,41,17),(26,'',3,52,17),(27,'',1,56,17),(28,'',9,70,26),(29,'',10,72,26),(30,'',4,8,26),(31,'',5,12,26),(32,'',6,3,26),(33,'',2,41,26),(34,'',3,52,26),(35,'',1,56,26),(36,'',9,70,31),(37,'',10,72,31),(38,'',4,8,31),(39,'',5,12,31),(40,'',6,3,31),(41,'',2,41,31),(42,'',3,52,31),(43,'',1,56,31),(44,'',9,69,3),(45,'',10,72,3),(46,'',4,8,3),(47,'',5,12,3),(48,'',6,1,3),(49,'',2,41,3),(50,'',3,52,3),(51,'',1,56,3),(52,'',9,69,18),(53,'',10,72,18),(54,'',4,8,18),(55,'',5,12,18),(56,'',6,1,18),(57,'',2,41,18),(58,'',3,52,18),(59,'',1,56,18),(60,'',9,69,27),(61,'',10,72,27),(62,'',4,8,27),(63,'',5,12,27),(64,'',6,1,27),(65,'',2,41,27),(66,'',3,52,27),(67,'',1,56,27),(68,'',9,69,32),(69,'',10,72,32),(70,'',4,8,32),(71,'',5,12,32),(72,'',6,1,32),(73,'',2,41,32),(74,'',3,52,32),(75,'',1,56,32),(76,'',9,69,37),(77,'',10,72,37),(78,'',4,8,37),(79,'',5,12,37),(80,'',6,1,37),(81,'',2,41,37),(82,'',3,52,37),(83,'',1,56,37),(84,'',9,69,19),(85,'',10,72,19),(86,'',4,8,19),(87,'',5,12,19),(88,'',6,1,19),(89,'',2,42,19),(90,'',3,51,19),(91,'',1,55,19),(92,'',14,66,19),(93,'',9,69,28),(94,'',10,72,28),(95,'',4,8,28),(96,'',5,12,28),(97,'',6,1,28),(98,'',2,42,28),(99,'',3,51,28),(100,'',1,55,28),(101,'',14,66,28),(102,'',9,69,33),(103,'',10,72,33),(104,'',4,8,33),(105,'',5,12,33),(106,'',6,1,33),(107,'',2,42,33),(108,'',3,51,33),(109,'',1,55,33),(110,'',14,66,33),(111,'',9,69,38),(112,'',10,72,38),(113,'',4,8,38),(114,'',5,12,38),(115,'',6,1,38),(116,'',2,42,38),(117,'',3,51,38),(118,'',1,55,38),(119,'',14,66,38),(120,'',9,69,NULL),(121,'',10,72,NULL),(122,'',4,8,NULL),(123,'',5,12,NULL),(124,'',6,1,NULL),(125,'',2,42,NULL),(126,'',3,51,NULL),(127,'',1,55,NULL),(128,'',14,66,NULL),(129,'',9,69,NULL),(130,'',10,72,NULL),(131,'',4,8,NULL),(132,'',5,12,NULL),(133,'',6,1,NULL),(134,'',2,46,NULL),(135,'',3,51,NULL),(136,'',1,55,NULL),(137,'',14,66,NULL),(138,'',9,69,NULL),(139,'',10,71,NULL),(140,'',11,78,NULL),(141,'',13,85,NULL),(142,'',12,92,NULL),(143,'',4,8,NULL),(144,'',5,12,NULL),(145,'',6,1,NULL),(146,'',2,43,NULL),(147,'',3,51,NULL),(148,'',1,55,NULL),(149,'',14,66,NULL),(150,'',9,69,4),(151,'',10,71,4),(152,'',4,8,4),(153,'',5,12,4),(154,'',6,1,4),(155,'',2,39,4),(156,'',3,51,4),(157,'',1,55,4),(158,'',14,66,4),(159,'',9,69,5),(160,'',10,71,5),(161,'',11,75,5),(162,'',13,82,5),(163,'',12,89,5),(164,'',4,8,5),(165,'',5,12,5),(166,'',6,1,5),(167,'',2,39,5),(168,'',3,51,5),(169,'',1,55,5),(170,'',14,66,5),(171,'',9,69,9),(172,'',10,71,9),(173,'',11,73,9),(174,'',13,80,9),(175,'',12,87,9),(176,'',4,8,9),(177,'',5,12,9),(178,'',6,1,9),(179,'',2,38,9),(180,'',3,51,9),(181,'',1,55,9),(182,'',14,66,9),(183,'',9,69,8),(184,'',10,71,8),(185,'',4,8,8),(186,'',5,12,8),(187,'',6,1,8),(188,'',2,40,8),(189,'',3,51,8),(190,'',1,55,8),(191,'',14,66,8),(192,'',9,69,10),(193,'',10,71,10),(194,'',4,8,10),(195,'',5,12,10),(196,'',6,1,10),(197,'',2,48,10),(198,'',3,52,10),(199,'',1,55,10),(200,'',14,66,10),(201,'',9,69,12),(202,'',10,71,12),(203,'',4,8,12),(204,'',5,12,12),(205,'',6,1,12),(206,'',2,44,12),(207,'',3,52,12),(208,'',1,55,12),(209,'',14,66,12),(210,'',9,69,6),(211,'',10,71,6),(212,'',4,8,6),(213,'',5,12,6),(214,'',6,1,6),(215,'',2,49,6),(216,'',3,52,6),(217,'',1,55,6),(218,'',14,66,6),(219,'',9,69,7),(220,'',10,71,7),(221,'',11,75,7),(222,'',13,82,7),(223,'',12,89,7),(224,'',4,8,7),(225,'',5,12,7),(226,'',6,1,7),(227,'',2,49,7),(228,'',3,52,7),(229,'',1,55,7),(230,'',14,66,7),(231,'',9,69,NULL),(232,'',10,71,NULL),(233,'',11,77,NULL),(234,'',13,84,NULL),(235,'',12,91,NULL),(236,'',4,8,NULL),(237,'',5,12,NULL),(238,'',6,1,NULL),(239,'',2,39,NULL),(240,'',3,51,NULL),(241,'',1,55,NULL),(242,'',14,66,NULL),(243,'',9,69,NULL),(244,'',10,72,NULL),(245,'',4,8,NULL),(246,'',5,12,NULL),(247,'',6,1,NULL),(248,'',2,39,NULL),(249,'',3,51,NULL),(250,'',1,55,NULL),(251,'',14,66,NULL),(252,'',9,69,22),(253,'',10,72,22),(254,'',4,8,22),(255,'',5,12,22),(256,'',6,1,22),(257,'',2,39,22),(258,'',3,51,22),(259,'',1,55,22),(260,'',14,66,22),(261,'',9,69,NULL),(262,'',10,72,NULL),(263,'',4,8,NULL),(264,'',5,12,NULL),(265,'',6,1,NULL),(266,'',2,39,NULL),(267,'',3,51,NULL),(268,'',1,55,NULL),(269,'',14,66,NULL),(270,'',9,69,23),(271,'',10,72,23),(272,'',4,8,23),(273,'',5,12,23),(274,'',6,1,23),(275,'',2,39,23),(276,'',3,51,23),(277,'',1,55,23),(278,'',14,66,23),(279,'',9,69,24),(280,'',10,72,24),(281,'',4,8,24),(282,'',5,12,24),(283,'',6,1,24),(284,'',2,39,24),(285,'',3,51,24),(286,'',1,55,24),(287,'',14,66,24),(288,'',9,69,25),(289,'',10,72,25),(290,'',4,8,25),(291,'',5,12,25),(292,'',6,1,25),(293,'',2,39,25),(294,'',3,51,25),(295,'',1,55,25),(296,'',14,66,25),(297,'',9,69,NULL),(298,'',10,72,NULL),(299,'',4,7,NULL),(300,'',5,9,NULL),(301,'',6,3,NULL),(302,'',2,41,NULL),(303,'',3,52,NULL),(304,'',1,56,NULL),(305,'',9,70,20),(306,'',10,72,20),(307,'',4,7,20),(308,'',2,41,20),(309,'',3,52,20),(310,'',1,56,20),(311,'',9,70,29),(312,'',10,72,29),(313,'',4,7,29),(314,'',2,41,29),(315,'',3,52,29),(316,'',1,56,29),(317,'',9,70,34),(318,'',10,72,34),(319,'',4,7,34),(320,'',2,41,34),(321,'',3,52,34),(322,'',1,56,34),(323,'',9,70,39),(324,'',10,72,39),(325,'',4,7,39),(326,'',2,41,39),(327,'',3,52,39),(328,'',1,56,39),(329,'',9,70,NULL),(330,'',10,72,NULL),(331,'',4,7,NULL),(332,'',2,41,NULL),(333,'',3,52,NULL),(334,'',1,56,NULL),(335,'',9,70,NULL),(336,'',10,72,NULL),(337,'',4,7,NULL),(338,'',2,41,NULL),(339,'',3,52,NULL),(340,'',1,56,NULL),(341,'',9,70,NULL),(342,'',10,72,NULL),(343,'',4,7,NULL),(344,'',2,41,NULL),(345,'',3,52,NULL),(346,'',1,56,NULL);
/*!40000 ALTER TABLE `instancias_propriedades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nested_tipos_secoes`
--

DROP TABLE IF EXISTS `nested_tipos_secoes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nested_tipos_secoes` (
  `id_chave_nested_tipo_secao` int(11) NOT NULL AUTO_INCREMENT,
  `nome_nested_tipo_secao` varchar(200) NOT NULL,
  `id_tipo_token` int(11) DEFAULT NULL,
  `descricao` varchar(10000) DEFAULT NULL,
  `lft` int(11) NOT NULL,
  `rgt` int(11) NOT NULL,
  PRIMARY KEY (`id_chave_nested_tipo_secao`),
  KEY `id_tipo_token` (`id_tipo_token`),
  CONSTRAINT `nested_tipos_secoes_ibfk_1` FOREIGN KEY (`id_tipo_token`) REFERENCES `tipos_tokens` (`id_chave_tipo_token`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nested_tipos_secoes`
--

LOCK TABLES `nested_tipos_secoes` WRITE;
/*!40000 ALTER TABLE `nested_tipos_secoes` DISABLE KEYS */;
INSERT INTO `nested_tipos_secoes` VALUES (1,'raiz',NULL,'Rais dos Tipos de Secao',1,80),(2,'estrutura',NULL,'Tópicos ou Seções incluindo capítulos',2,31),(3,'paragrafo',NULL,'Parágrafos dos tópicos ou das sessões',3,4),(4,'verbo',1,'verbo',5,6),(5,'verbo_flexao_definida',1,'verbo com flexão definida',7,8),(6,'substantivo',3,'substantivo',9,10),(7,'substantivo_flexao_definida',3,'substantivo com flexão definida',11,12),(8,'preposicao',5,'preposição',13,14),(9,'preposicao_fixa',5,'preposição instanciada num valor fixo',15,16),(10,'adjetivo',7,'adjetivo',17,18),(11,'pronome',8,'pronome',19,20),(12,'artigo',9,'artigo',21,22),(13,'conjuncao',10,'conjunção',23,24),(14,'interjeicao',11,'interjeição',25,26),(15,'numeral',12,'numeral',27,28),(16,'adverbio',13,'advérbio',29,30),(17,'colegiado',NULL,'Índice',32,49),(18,'paragrafo_colegiado',NULL,'Parágrafo explicativo sobre o colegiado',33,34),(19,'sustentacao_colegiado',NULL,'Sustentação normativa do colegiado',35,36),(20,'imagem_colegiado',NULL,'Imagens pertinentes ao universo dos colegiados',37,38),(21,'pdf_colegiado',NULL,'Arquivos PDF pertinentes ao colegiado',39,40),(22,'titular_colegiado',NULL,'Titular de um colegiado',41,42),(23,'suplente_colegiado',NULL,'Suplente de um colegiado',43,44),(24,'lotacao_titular',NULL,'Divisão da Fundacentro em que o Titular está lotado',45,46),(25,'instituicao_coordenadora',NULL,'Instituição que coordena o grupo',47,48),(26,'programa',NULL,'Índice',50,59),(27,'paragrafo_programa',NULL,'Parágrafo explicativo sobre o programa',51,52),(28,'sustentacao_programa',NULL,'Sustentação normativa do programa',53,54),(29,'imagem_programa',NULL,'Imagens pertinentes ao universo dos programas',55,56),(30,'pdf_programa',NULL,'Arquivos PDF pertinentes ao programa',57,58),(31,'projeto',NULL,'Índice',60,69),(32,'paragrafo_projeto',NULL,'Parágrafo explicativo sobre o projeto',61,62),(33,'sustentacao_projeto',NULL,'Sustentação normativa do projeto',63,64),(34,'imagem_projeto',NULL,'Imagens pertinentes ao universo dos projetos',65,66),(35,'pdf_projeto',NULL,'Arquivos PDF pertinentes ao programa',67,68),(36,'processo',NULL,'Índice',70,79),(37,'paragrafo_processo',NULL,'Parágrafo explicativo sobre o processo',71,72),(38,'sustentacao_processo',NULL,'Sustentação normativa do processo',73,74),(39,'imagem_processo',NULL,'Imagens pertinentes ao universo dos processos',75,76),(40,'pdf_processo',NULL,'Arquivos PDF pertinentes ao programa',77,78);
/*!40000 ALTER TABLE `nested_tipos_secoes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opcoes`
--

DROP TABLE IF EXISTS `opcoes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opcoes` (
  `id_chave_opcao` int(11) NOT NULL AUTO_INCREMENT,
  `nome_opcao` varchar(200) DEFAULT NULL,
  `descricao` varchar(2000) DEFAULT NULL,
  `id_quesito` int(11) DEFAULT NULL,
  `pontuacao` int(11) DEFAULT NULL,
  `tipo` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id_chave_opcao`),
  UNIQUE KEY `nome_opcao` (`nome_opcao`,`id_quesito`),
  KEY `id_quesito` (`id_quesito`),
  CONSTRAINT `opcoes_ibfk_1` FOREIGN KEY (`id_quesito`) REFERENCES `quesitos` (`id_chave_quesito`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opcoes`
--

LOCK TABLES `opcoes` WRITE;
/*!40000 ALTER TABLE `opcoes` DISABLE KEYS */;
INSERT INTO `opcoes` VALUES (1,'Doutorado','',1,20,'DISCRETO'),(2,'Mestrado','',1,16,'DISCRETO'),(3,'Especialização','',1,14,'DISCRETO'),(4,'Graduação','',1,12,'DISCRETO'),(5,'Não declarado','',1,0,'DISCRETO'),(6,'Acima de 10 anos','',2,20,'DISCRETO'),(7,'Entre 5 e 9 anos','',2,16,'DISCRETO'),(8,'Entre 3 e 4 anos','',2,12,'DISCRETO'),(9,'Entre 1 e 2 anos','',2,6,'DISCRETO'),(10,'Não declarado','',2,0,'DISCRETO'),(11,'Acima de 10 anos','',3,30,'DISCRETO'),(12,'Entre 5 e 9 anos','',3,24,'DISCRETO'),(13,'Entre 3 e 4 anos','',3,18,'DISCRETO'),(14,'Entre 1 e 2 anos','',3,9,'DISCRETO'),(15,'Não declarado','',3,0,'DISCRETO'),(16,'Acima de 10 anos','',4,30,'DISCRETO'),(17,'Entre 5 e 9 anos','',4,24,'DISCRETO'),(18,'Entre 3 e 4 anos','',4,18,'DISCRETO'),(19,'Entre 1 e 2 anos','',4,9,'DISCRETO'),(20,'Não declarado','',4,0,'DISCRETO'),(21,'Acima de 10 anos','',5,30,'DISCRETO'),(22,'Entre 5 e 9 anos','',5,24,'DISCRETO'),(23,'Entre 3 e 4 anos','',5,18,'DISCRETO'),(24,'Entre 1 e 2 anos','',5,9,'DISCRETO'),(25,'Não declarado','',5,0,'DISCRETO'),(26,'Acima de 10 anos','',6,20,'DISCRETO'),(27,'Entre 5 e 9 anos','',6,16,'DISCRETO'),(28,'Entre 3 e 4 anos','',6,12,'DISCRETO'),(29,'Entre 1 e 2 anos','',6,6,'DISCRETO'),(30,'Não declarado','',6,0,'DISCRETO'),(31,'acima de 100 audiovisuais','',7,60,'DISCRETO'),(32,'de 21 a 40 audiovisuais','',7,40,'DISCRETO'),(33,'de 11 a 20 audiovisuais','',7,20,'DISCRETO'),(34,'de 1 a 10 audiovisuais','',7,10,'DISCRETO'),(35,'Não declarado','',7,0,'DISCRETO'),(36,'acima de 100 projetos','',8,120,'DISCRETO'),(37,'de 41 a 100 projetos','',8,70,'DISCRETO'),(38,'de 21 a 40 projetos','',8,30,'DISCRETO'),(39,'de 11 a 20 projetos','',8,15,'DISCRETO'),(40,'de 1 a 10 projetos','',8,5,'DISCRETO'),(41,'Não declarado','',8,0,'DISCRETO'),(42,'acima de 100 oficinas','',9,300,'DISCRETO'),(43,'de 41 a 100 oficinas','',9,140,'DISCRETO'),(44,'de 11 a 40 oficinas','',9,60,'DISCRETO'),(45,'de 1 a 10 oficinas','',9,20,'DISCRETO'),(46,'Não declarado','',9,0,'DISCRETO'),(47,'acima de 100 orientações','',10,300,'DISCRETO'),(48,'de 41 a 100 orientações','',10,140,'DISCRETO'),(49,'de 11 a 40 orientações','',10,60,'DISCRETO'),(50,'de 1 a 10 orientações','',10,20,'DISCRETO'),(51,'Não declarado','',10,0,'DISCRETO'),(52,'Acima de 100 pessoas','',11,300,'DISCRETO'),(53,'Entre 50 e 99 pessoas','',11,100,'DISCRETO'),(54,'Entre 20 e 49 pessoas','',11,45,'DISCRETO'),(55,'Entre 1 e 19 pessoas','',11,20,'DISCRETO'),(56,'Não declarado','',11,0,'DISCRETO'),(57,'Acima de 10 anos','',12,80,'DISCRETO'),(58,'Entre 5 e 9 anos','',12,60,'DISCRETO'),(59,'Entre 3 e 4 anos','',12,40,'DISCRETO'),(60,'Entre 1 e 2 anos','',12,20,'DISCRETO'),(61,'Não declarado','',12,0,'DISCRETO');
/*!40000 ALTER TABLE `opcoes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pessoas`
--

DROP TABLE IF EXISTS `pessoas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pessoas` (
  `id_chave_pessoa` int(11) NOT NULL AUTO_INCREMENT,
  `nome_pessoa` varchar(100) DEFAULT NULL,
  `senha` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id_chave_pessoa`),
  UNIQUE KEY `nome_pessoa` (`nome_pessoa`)
) ENGINE=InnoDB AUTO_INCREMENT=172 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pessoas`
--

LOCK TABLES `pessoas` WRITE;
/*!40000 ALTER TABLE `pessoas` DISABLE KEYS */;
INSERT INTO `pessoas` VALUES (1,'ADIR DE SOUZA',NULL),(2,'ADRIANA CUNHA BELASCO',NULL),(3,'ADRIANO MYOTIN',NULL),(4,'ADRIANO ROGERIO CHINELLATO CAMARDELLA',NULL),(5,'AIRTON TAVARES DE ALMEIDA JUNIOR',NULL),(6,'ALEXANDRA RINALDI',NULL),(7,'ALEXANDRE CABRAL TINET DOS SANTOS',NULL),(8,'ANA LUCIA BENTO DA SILVA',NULL),(9,'ANA RUBIA WOLF GOMES',NULL),(10,'ANDRE LUIS SANTIAGO MAIA',NULL),(11,'ANGELA SALETE GENARO',NULL),(12,'ANGELA TANIESKA SCARLATO',NULL),(13,'ANTONIO LINCOLN COLUCCI',NULL),(14,'ARTUR CARLOS DA SILVA MOREIRA',NULL),(15,'AUGUSTO ANTONIO BARROSO MADRUGA',NULL),(16,'BENEDITO SILVA GUIMARÃES FILHO',NULL),(17,'CARLOS ALBERTO DE FRANÇA',NULL),(18,'CELBE FERREIRA LOPES',NULL),(19,'CELSO AMORIM SALIM',NULL),(20,'CEZAR AKIYOSHI SAITO',NULL),(21,'CLAUDIA CECÍLIA MARCHIANO',NULL),(22,'CLEITON FARIA LIMA',NULL),(23,'CLODOALDO CAETITÉ DE NOVAES',NULL),(24,'CRISTIANE MARIA GALVÃO BARBOSA',NULL),(25,'CRISTIANE OLIVEIRA REIMBERG',NULL),(26,'CRISTIANE PAIM DA CUNHA',NULL),(27,'DALTON TRIA CUSCIANO',NULL),(28,'DANIELA SANCHES TAVARES',NULL),(29,'DANIEL DE FREITAS BERTOLINO',NULL),(30,'DANIEL MARTINS DA SILVA JUNIOR',NULL),(31,'DANIEL PIRES BITENCOURT',NULL),(32,'DÉBORA MARIA DOS SANTOS',NULL),(33,'DELMA FRANCISCO BATISTA',NULL),(34,'DENILSON JOSÉ DA SILVA',NULL),(35,'DENISE BERTASI',NULL),(36,'DIEGO FERNANDO FERREIRA DE OLIVEIRA',NULL),(37,'DIEGO RICARDI DOS ANJOS',NULL),(38,'DIOGO TADEU RUBIO',NULL),(39,'DORACY MORAES DE SOUZA',NULL),(40,'EDUARDO GARCIA GARCIA',NULL),(41,'ELISA KAYO SHIBUYA',NULL),(42,'ELISEU BAPTISTA FILHO',NULL),(43,'ELIZABETH DA SILVA FIGUEIREDO',NULL),(44,'ELIZABETI YURIKO MUTO',NULL),(45,'EMERSON JOSE ALMEIDA DA FONSECA',NULL),(46,'EMERSON MORAES TEIXEIRA',NULL),(47,'ERALDO ARRUDA LIMA',NULL),(48,'ERICA LUI REINHARDT',NULL),(49,'ERIKA ALVES DOS SANTOS',NULL),(50,'ERIKA MACHADO MELO ALVES',NULL),(51,'EUCLIDES MANOEL DA PAZ',NULL),(52,'EUGENIO PACELI HATEM DINIZ',NULL),(53,'EVANDRO TAMAITI',NULL),(54,'EZEQUIAS DE SOUZA LIMA',NULL),(55,'FABIO AKIO SHIOMI IHA',NULL),(56,'FABIO SPERDUTI',NULL),(57,'FELIPE AUGUSTO CASCALES',NULL),(58,'FELIPE MORAIS SANTOS',NULL),(59,'FERNANDA DE FREITAS VENTURA',NULL),(60,'FERNANDO BARBOSA DA SILVA',NULL),(61,'FERNANDO JOSÉ SMECELATO',NULL),(62,'FERNANDO TIMOTEO FERNANDES',NULL),(63,'FLÁVIO BARBOSA GALVÃO',NULL),(64,'FLÁVIO MALDONADO BENTES',NULL),(65,'GILCEMAR ANTONIO PEREIRA ENDLICH',NULL),(66,'GILMAR DA CUNHA TRIVELATO',NULL),(67,'GLAUCIA DE MENEZES FERNANDES',NULL),(68,'GLÁUCIA NASCIMENTO DE SOUZA VELOSO',NULL),(69,'GUILHERME MASAAKI KOREEDA',NULL),(70,'GUSTAVO BRAGA SENRA',NULL),(71,'GUSTAVO DOS SANTOS HENSCHEL',NULL),(72,'GUSTAVO HOLZBACH HAIBARA',NULL),(73,'HORACY HIROKI TAKADA',NULL),(74,'HUMBERTO MOREIRA DA SILVA',NULL),(75,'JEFFERSON PEIXOTO DA SILVA',NULL),(76,'JOÃO LUIZ MARTINS',NULL),(77,'JORGE MARQUES PONTES',NULL),(78,'JOSÉ DAMASIO DE AQUINO',NULL),(79,'JOSE LEONARDO PADILHA',NULL),(80,'JOSÉ MARÇAL JACKSON FILHO',NULL),(81,'JOSÉ MÁRIO MATRICARDI',NULL),(82,'JOSÉ RENATO ALVES SCHMIDT',NULL),(83,'JOSILDO MARCELO MURICY SILVA',NULL),(84,'JOSUÉ AMADOR DA SILVA',NULL),(85,'JUAN GOMES PEREIRA',NULL),(86,'JULIANA ANDRADE OLIVEIRA',NULL),(87,'JULIO CESAR LOPARDO ALVES',NULL),(88,'KARINA PENARIOL SANCHES',NULL),(89,'LAURA SOARES MARTINS NOGUEIRA',NULL),(90,'LÊNIO SÉRVIO AMARAL',NULL),(91,'LEONICE LIMA SILVA',NULL),(92,'LEONIDAS RAMOS PANDAGGIS',NULL),(93,'LÉO VINÍCIUS MAIA LIBERATO',NULL),(94,'LUCIA SILVA DA ROCHA',NULL),(95,'LUIS CARLOS SOARES',NULL),(96,'LUÍS RENATO BALBÃO ANDRADE',NULL),(97,'LUIZ ANTONIO DE MELO',NULL),(98,'LUIZ FERNANDO DE SENA',NULL),(99,'MÁCIA MEDEIROS DOS SANTOS TEIXEIRA',NULL),(100,'MANUEL PEREIRA TEIXEIRA',NULL),(101,'MARCELA GERARDO RIBEIRO',NULL),(102,'MARCELA SARTO ALVARES OTERO PONTES',NULL),(103,'MARCELO ALEXANDRE DE VASCONCELOS',NULL),(104,'MARCELO RAMOS',NULL),(105,'MARCO ANTONIO BUSSACOS',NULL),(106,'MARCOS FRAGA',NULL),(107,'MARIA ANGELA PIZZANI CRUZ',NULL),(108,'MARIA APARECIDA CHRIST',NULL),(109,'MARIA CELESTE MAIELLO',NULL),(110,'MARIA CHRISTINA FELIX',NULL),(111,'MARIA CRISTINA AGUIAR CAMPOS',NULL),(112,'MARIA DE FÁTIMA TORRES FARIA VIEGAS',NULL),(113,'MARIA MAENO',NULL),(114,'MARIANA SOUZA GOMES FURST',NULL),(115,'MARTA KATSUE HATANO TSUJINO',NULL),(116,'MAURO MAIA LARUCCIA',NULL),(117,'MILDA JODELIS',NULL),(118,'MOACILDO PAIVA DA SILVA',NULL),(119,'NELSON JORGE GOMES',NULL),(120,'NORISVALDO FERRAZ JUNIOR',NULL),(121,'PATRÍCIA MOURA DIAS',NULL),(122,'PAULA PEIXOTO MONTEIRO NASSAR',NULL),(123,'RAQUEL ORLANDO DE ALMEIDA',NULL),(124,'RENATA LUIZA FERNANDES CALDAS',NULL),(125,'RENATA SCHNEIDER VIARO',NULL),(126,'RICARDO LUIZ LORENZI',NULL),(127,'RITA DE CÁSSIA BRISIGHELLO',NULL),(128,'ROBERTA GRANJA GONZAGA',NULL),(129,'ROBERTO CUNHA DANTAS',NULL),(130,'ROBSON RODRIGUES DA SILVA',NULL),(131,'ROBSON SPINELLI GOMES',NULL),(132,'RODRIGO CAUDURO ROSCANI',NULL),(133,'RONILDO BARROS ORFAO',NULL),(134,'ROSANA GONZAGA FRANCO MELO MASSA',NULL),(135,'ROSECLAIR RODRIGUES DE CAMPOS',NULL),(136,'SANDRA MARQUES DA SILVA',NULL),(137,'SERGIO ANTONIO DOS SANTOS',NULL),(138,'SÉRGIO LUIZ PEREIRA',NULL),(139,'SERGIO ROBERTO COSMANO',NULL),(140,'SILVANA CUTRUPI GONÇALVES',NULL),(141,'SILVIA HELENA DE ARAUJO NICOLAI',NULL),(142,'SILVIA RODRIGUES MAKIYA',NULL),(143,'SÍLVIA SILVA',NULL),(144,'SOLANGE REGINA SCHAFFER',NULL),(145,'SOLANGE SILVA NASCIMENTO',NULL),(146,'SORAYA WINGESTER VASCONCELOS',NULL),(147,'SUSANA ELISABETH DOCE MACHADO',NULL),(148,'TARSILA BAPTISTA PONCE',NULL),(149,'TATIANA GONCALVES',NULL),(150,'TEREZA LUIZA FERREIRA DOS SANTOS',NULL),(151,'THAIS HELENA DE CARVALHO BARREIRA',NULL),(152,'THAIS MARIA SANTIAGO DE MORAES BARROS',NULL),(153,'THAIS MONTEIRO ANDRADE DA SILVA',NULL),(154,'TIAGO BORGES PEDROSO DO AMARAL',NULL),(155,'VALDIR RODRIGUES SOARES',NULL),(156,'VALÉRIA RAMOS SOARES PINTO',NULL),(157,'VANIA GAEBLER',NULL),(158,'VIVIANE MACIEL TREVISAN',NULL),(159,'WALTER DOS REIS PEDREIRA FILHO',NULL),(160,'PEDRO TOURINHO DE SIQUEIRA',NULL),(161,'VICTOR PELLEGRINI MAMMANA',NULL),(162,'VITOR ARAÚJO FILGUEIRAS',NULL),(163,'RAFAEL MÔNICO SILVA',NULL),(164,'JOSÉ CLOVES DA SILVA',NULL),(165,'ESTEFÂNIA MEDEIROS CASTRO',NULL),(166,'VAGO',NULL),(167,'REMIGIO TODESCHINI',NULL),(168,'KARINA NUNES FIGUEIREDO',NULL),(169,'ROGÉRIO BEZERRA DA SILVA',NULL),(170,'PREENCHER',NULL),(171,'MÁRIO AUGUSTO SILVA PINTO',NULL);
/*!40000 ALTER TABLE `pessoas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `propriedades`
--

DROP TABLE IF EXISTS `propriedades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `propriedades` (
  `id_chave_propriedade` int(11) NOT NULL AUTO_INCREMENT,
  `nome_propriedade` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_chave_propriedade`),
  UNIQUE KEY `nome_propriedade` (`nome_propriedade`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `propriedades`
--

LOCK TABLES `propriedades` WRITE;
/*!40000 ALTER TABLE `propriedades` DISABLE KEYS */;
INSERT INTO `propriedades` VALUES (4,'alinhamento'),(13,'campo_externo'),(3,'cor_da_fonte'),(2,'cor_de_fundo'),(10,'eh_foreign_key'),(9,'eh_paragrafo'),(12,'id_chave_externa'),(14,'margem_simetrica'),(7,'posicao_vert'),(1,'rotulo'),(11,'tabela_externa'),(5,'tamanho_fonte'),(6,'tipo_fonte'),(8,'tipo_numeracao');
/*!40000 ALTER TABLE `propriedades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quesitos`
--

DROP TABLE IF EXISTS `quesitos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quesitos` (
  `id_chave_quesito` int(11) NOT NULL AUTO_INCREMENT,
  `nome_quesito` varchar(200) DEFAULT NULL,
  `sigla` varchar(2) DEFAULT NULL,
  `id_grupo` int(11) DEFAULT NULL,
  `descricao` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`id_chave_quesito`),
  UNIQUE KEY `nome_quesito` (`nome_quesito`),
  UNIQUE KEY `sigla` (`sigla`),
  KEY `id_grupo` (`id_grupo`),
  CONSTRAINT `quesitos_ibfk_1` FOREIGN KEY (`id_grupo`) REFERENCES `grupos` (`id_chave_grupo`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quesitos`
--

LOCK TABLES `quesitos` WRITE;
/*!40000 ALTER TABLE `quesitos` DISABLE KEYS */;
INSERT INTO `quesitos` VALUES (1,'Titulação','A',1,'Títulos Acadêmicos'),(2,'Experiência Profissional','B',1,'Número de anos'),(3,'Experiência com Educação','C',1,'Número de anos'),(4,'Experiência com STEAM','D',2,''),(5,'Experiência com Desenvolvimento WEB','E',2,''),(6,'Experiência com Produção Audiovisual','F',2,''),(7,'Audiovisuais produzidos','G',2,''),(8,'Experiência com Linguagens de Programação Pedagógicas','H',2,''),(9,'Participação em Oficinas STEM-STEAM','I',2,''),(10,'Orientações (IC, TCC, Mestrado ou Doutorado)','J',2,''),(11,'Experiência com Gestão de Projetos ou Equipes','K',2,''),(12,'Experiência com Projetos Culturais','L',2,'');
/*!40000 ALTER TABLE `quesitos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registrados`
--

DROP TABLE IF EXISTS `registrados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `registrados` (
  `id_chave_registrado` int(11) NOT NULL AUTO_INCREMENT,
  `nome_registrado` varchar(200) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `cpf` varchar(20) DEFAULT NULL,
  `hash` varchar(100) DEFAULT NULL,
  `time_stamp` timestamp(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  PRIMARY KEY (`id_chave_registrado`),
  UNIQUE KEY `nome_registrado` (`nome_registrado`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `cpf` (`cpf`),
  UNIQUE KEY `hash` (`hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registrados`
--

LOCK TABLES `registrados` WRITE;
/*!40000 ALTER TABLE `registrados` DISABLE KEYS */;
/*!40000 ALTER TABLE `registrados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `secoes`
--

DROP TABLE IF EXISTS `secoes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `secoes` (
  `id_chave_categoria` int(11) NOT NULL AUTO_INCREMENT,
  `nome_categoria` varchar(100) NOT NULL,
  `descricao` varchar(3500) DEFAULT NULL,
  `lnk` varchar(300) DEFAULT NULL,
  `lft` int(11) NOT NULL,
  `rgt` int(11) NOT NULL,
  `id_tipo_secao` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_chave_categoria`),
  UNIQUE KEY `nome_categoria` (`nome_categoria`),
  KEY `id_tipo_secao` (`id_tipo_secao`),
  CONSTRAINT `secoes_ibfk_1` FOREIGN KEY (`id_tipo_secao`) REFERENCES `nested_tipos_secoes` (`id_chave_nested_tipo_secao`)
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `secoes`
--

LOCK TABLES `secoes` WRITE;
/*!40000 ALTER TABLE `secoes` DISABLE KEYS */;
INSERT INTO `secoes` VALUES (1,'corpo_tese','raiz','',1,104,1),(61,'descricao_das_sentencas','A lista abaixo traz todas as estruturas de sentenças para avaliação de atividades da Fundacentro','',2,3,3),(62,'sentenca_1','1','',4,37,2),(63,'auto_2023-09-17_19:36:56.826','Sentença com predicado, objeto direto e objeto indireto.','',5,6,3),(64,'auto_2023-09-18_15:58:01.442','Exemplo: \"Elaborar projeto completo para órgão fomentador\"','',7,8,3),(65,'auto_2023-09-17_10:14:49.595','7','',9,36,2),(66,'auto_2023-09-17_10:21:42.239665','Exemplo: \"Publicar artigo científico em revista indexada\"','',10,11,3),(67,'auto_2023-09-17_19:35:31.913','11','',12,13,5),(68,'auto_2023-09-17_19:39:17.835','10','',14,23,2),(69,'auto_2023-09-17_19:42:40.326822','Exemplo: \"um resumo estendido\"','',15,16,3),(70,'auto_2023-09-17_19:47:18.988','artigo do objeto direto','',17,18,12),(71,'auto_2023-09-17_20:03:05.260','substantivo do objeto direto','',19,20,6),(72,'auto_2023-09-18_15:35:27.566','adjetivo do objeto direto','',21,22,10),(73,'auto_2023-09-17_19:42:24.007','11','',24,35,2),(74,'auto_2023-09-17_19:43:01.420619','Exemplo: \"para um congresso científico\"','',25,26,3),(75,'auto_2023-09-18_15:46:42.999','preposição do objeto indireto','',27,28,8),(76,'auto_2023-09-18_15:48:29.633','artigo do objeto indireto','',29,30,12),(77,'auto_2023-09-18_15:48:58.704','substantivo do objeto indireto','',31,32,6),(78,'auto_2023-09-18_15:49:21.558','adjetivo do objeto indireto','',33,34,10),(79,'sentenca_2','2','',38,79,2),(80,'descricao','Sentença com sujeito, verbo, objeto direto e objeto indireto.','',39,40,3),(81,'auto_2023-09-18_15:59:02.191','Exemplo: \"Servidor elaborou projeto completo para órgão fomentador\"','',41,42,3),(82,'auto_2023-09-18_15:51:30.359','3','',43,50,2),(83,'auto_2023-09-18_15:52:03.760860','Exemplo \"Um pesquisador\"','',44,45,3),(84,'auto_2023-09-18_15:59:43.046','artigo do sujeito','',46,47,12),(85,'auto_2023-09-18_15:59:55.815','substantivo do sujeito','',48,49,6),(86,'auto_2023-09-18_15:51:50.630','7','',51,78,2),(87,'auto_2023-09-18_15:52:52.853099','Exemplo: \"apresentou trabalho resumido em congresso científico\"','',52,53,3),(88,'auto_2023-09-24_11:25:08.846','verbo no predicado','',54,55,4),(89,'auto_2023-09-17_19:39:17.835_clone','10','',56,65,2),(90,'auto_2023-09-17_19:42:40.326822_clone','Exemplo: \"um resumo estendido\"','',57,58,3),(91,'auto_2023-09-17_19:47:18.988_clone','artigo do objeto direto','',59,60,12),(92,'auto_2023-09-17_20:03:05.260_clone','substantivo do objeto direto','',61,62,6),(93,'auto_2023-09-18_15:35:27.566_clone','adjetivo do objeto direto','',63,64,10),(94,'auto_2023-09-17_19:42:24.007_clone','11','',66,77,2),(95,'auto_2023-09-17_19:43:01.420619_clone','Exemplo: \"para um congresso científico\"','',67,68,3),(96,'auto_2023-09-18_15:46:42.999_clone','preposição do objeto indireto','',69,70,8),(97,'auto_2023-09-18_15:48:29.633_clone','artigo do objeto indireto','',71,72,12),(98,'auto_2023-09-18_15:48:58.704_clone','substantivo do objeto indireto','',73,74,6),(99,'auto_2023-09-18_15:49:21.558_clone','adjetivo do objeto indireto','',75,76,10),(100,'lixeira','12','',98,103,2),(101,'auto_2023-09-17_19:35:31.913_clone','11','',99,100,5),(102,'auto_2023-09-17_19:34:45.654','teste','',101,102,3),(103,'auto_2023-09-26_17:04:34.201','13','',80,97,2),(104,'auto_2023-09-26_17:04:45.116536','entrega com substantivação','',81,82,3),(105,'auto_2023-09-26_17:17:48.880','8','',83,84,7),(106,'auto_2023-09-26_17:29:31.463','preposição, mais frequentemente de','',85,86,8),(107,'auto_2023-09-26_17:30:08.108','substantivos','',87,88,6),(108,'auto_2023-09-26_17:30:47.028','preposição, mais frequentemente me','',91,92,8),(109,'auto_2023-09-26_17:31:21.171','substantivos','',93,94,6),(110,'auto_2023-09-26_17:33:06.292','adjetivo','',95,96,10),(111,'auto_2023-09-26_17:33:29.989','adjetivo','',89,90,10);
/*!40000 ALTER TABLE `secoes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `setores`
--

DROP TABLE IF EXISTS `setores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `setores` (
  `id_chave_setor` int(11) NOT NULL AUTO_INCREMENT,
  `nome_setor` varchar(300) DEFAULT NULL,
  `sigla` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id_chave_setor`),
  UNIQUE KEY `nome_setor` (`nome_setor`),
  UNIQUE KEY `sigla` (`sigla`)
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `setores`
--

LOCK TABLES `setores` WRITE;
/*!40000 ALTER TABLE `setores` DISABLE KEYS */;
INSERT INTO `setores` VALUES (1,'Controle Interno','CI'),(2,'Auditoria Interna','AI'),(3,'Assistente Técnico da Auditoria Interna','ATAI'),(4,'Procuradoria Federal','PF'),(5,'Assistente Técnico da Procuradoria Federal','ATPF'),(6,'Assessores','ASS'),(7,'Assessor I','ASI'),(8,'Assessor II','ASII'),(9,'Gerentes de Projetos','GERE'),(10,'Gerente de Projeto I','GPP1'),(11,'Gerente de Projeto II','GPP2'),(12,'Gabinete','GAB'),(13,'Seção de Apoio ao Gabinete','SAG'),(14,'Coordenação de Apoio à Pesquisa','CAP'),(15,'Coordenação de Difusão de Conhecimento e Educação','CCE'),(16,'Coordenação Geral de Gestão Corporativa','CGGC'),(17,'Setor de Apoio à Gestão Corporativa I','SAGCI'),(18,'Setor de Apoio à Gestão Corporativa II','SAGCII'),(19,'Coordenação de Gestão de Pessoas','CGP'),(20,'Coordenação de Inovação e Parcerias','CIP'),(21,'Coordenação de Orçamento e Finanças','COF'),(22,'Corregedoria','CORR'),(23,'Coordenação de Planejamento Estratégico','CPE'),(24,'Coordenação de Tecnologia da Informação e Comunicação','CTIC'),(25,'Diretoria de Administração e Finanças','DAF'),(26,'Assessor Técnico Diretoria de Administração e Finanças','ATDAF'),(27,'Setor de Apoio à Diretoria de Administração e Finanças I','SADAF1'),(28,'Setor de Apoio à Diretoria de Administração e Finanças II','SADAF2'),(29,'Setor de Apoio à Diretoria de Administração e Finanças III','SADAF3'),(30,'Diretoria de Pesquisa Aplicada','DPA'),(31,'Assessor Técnico da Diretoria de Pesquisa Aplicada','ATDPA'),(32,'Gerente de Projeto da Diretoria de Pesquisa Aplicada I','GPDPA1'),(33,'Gerente de Projeto da Diretoria de Pesquisa Aplicada II','GPDPA2'),(34,'Coordenador de Projeto da Diretoria de Pesquisa Aplicada I','CPDPA1'),(35,'Coordenador de Projeto da Diretoria de Pesquisa Aplicada II','CPDPA2'),(36,'Coordenador de Projeto da Diretoria de Pesquisa Aplicada III','CPDPA3'),(37,'Coordenador de Projeto da Diretoria de Pesquisa Aplicada IV','CPDPA4'),(38,'Coordenador de Projeto da Diretoria de Pesquisa Aplicada V','CPDPA5'),(39,'Coordenador de Projeto da Diretoria de Pesquisa Aplicada VI','CPDPA6'),(40,'Setor de Apoio à Gestão no Estado da Bahia','SEEABA'),(41,'Setor de Apoio à Gestão no Estado no Distrito Federal','SEEADF'),(42,'Setor de Apoio à Gestão no Estado de Espírito Santo','SEEAES'),(43,'Setor de Apoio à Gestão no Estado de Minas Gerais','SEEAMG'),(44,'Setor de Apoio à Gestão no Estado do Pará','SEEAPA'),(45,'Setor de Apoio à Gestão no Estado de Pernambuco','SEEAPE'),(46,'Setor de Apoio à Gestão no Estado do Paraná','SEEAPR'),(47,'Setor de Apoio à Gestão no Estado do Rio de Janeiro','SEEARJ'),(48,'Setor de Apoio à Gestão no Estado do Rio Grande do Sul','SEEARS'),(49,'Setor de Apoio à Gestão no Estado de Santa Catarina','SEEASC'),(50,'Ouvidoria','OUV'),(51,'Presidência','PRES'),(52,'Serviço de Administração de Pessoas','SAP'),(53,'Serviço de Apoio Técnico e Pesquisa','SATP'),(54,'Serviço de Cursos e Eventos','SCE'),(55,'Serviço de Comunicação Institucional','SCI'),(56,'Setor de Apoio à Comunicação Institucional','SACI'),(57,'Serviço de Contabilidade','SCO'),(58,'Serviço de Compras','SCP'),(59,'Serviço de Biblioteca e Documentação','SDB'),(60,'Serviço de Desenvolvimento de Pessoas','SDP'),(61,'Serviço de Epidemiologia e Estatística','SEE'),(62,'Serviço de Execução Orçamentária e Financeira','SEF'),(63,'Serviço de Gestão de Contratos','SGC'),(64,'Serviço de Laboratórios de Apoio à Pesquisa','SLAP'),(65,'Serviço de Laboratório de EPI','SLEP'),(66,'Serviço de Logística','SLO'),(67,'Serviço de Material e Patrimônio','SMP'),(68,'Serviço de Publicação e RBSO','SPR'),(69,'Serviço de Tecnologia - Desenvolvimento de Negócios','STDN'),(70,'Serviço de Tecnologia - Infraestrutura e Operações','STIO'),(71,'Setor de Apoio à Gestão da Unidade em Extinção da Baixada Santista','UDEBS'),(72,'Setor de Apoio à Gestão da Unidade em Extinção de Campinas','UDECA'),(73,'Diretoria de Conhecimento e Tecnologia','DCT'),(74,'Setor de Apoio à DCT','SADCT'),(75,'Unidades Descentralizadas','UD'),(76,'Escritórios Avançados','EA'),(77,'Unidades Descentralizadas em Extinção','UDE'),(78,'Escritório Avançado do Estado de Pernambuco','EAPE'),(79,'Escritório Avançado do Distrito Federal','EADF'),(80,'Escritório Avançado do Estado de Minas Gerais','EAMG'),(81,'Escritório Avançado do Estado do Rio de Janeiro','EARJ'),(82,'Escritório Avançado do Estado de Santa Catarina','EASC'),(83,'Escritório Avançado do Estado do Pará','EAPA'),(84,'Escritório Avançado do Estado da Bahia ','EABA'),(85,'Escritório Avançado do Estado do Espírito Santo','EAES'),(86,'Escritório Avançado do Estado do Paraná','EAPR'),(87,'Escritório Avançado do Estado do Rio Grande do Sul','EARS'),(88,'Unidade Descentralizada em Extinção de Campinas','EACA'),(89,'Unidade Descentralizada em Extinção da Baixada Santista','EABS'),(90,'Coordenação de Administração','CAD'),(91,'Setor de Apoio à Diretoria de Pesquisa Aplicada','SADPA'),(92,'Coordenação Geral de Projetos','CGPRO');
/*!40000 ALTER TABLE `setores` ENABLE KEYS */;
UNLOCK TABLES;

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

--
-- Table structure for table `tipos_flexoes`
--

DROP TABLE IF EXISTS `tipos_flexoes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipos_flexoes` (
  `id_chave_tipo_flexao` int(11) NOT NULL AUTO_INCREMENT,
  `nome_tipo_flexao` varchar(200) DEFAULT NULL,
  `acentuada` varchar(200) DEFAULT NULL,
  `time_stamp` timestamp(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  PRIMARY KEY (`id_chave_tipo_flexao`),
  UNIQUE KEY `nome_tipo_flexao` (`nome_tipo_flexao`),
  UNIQUE KEY `acentuada` (`acentuada`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipos_flexoes`
--

LOCK TABLES `tipos_flexoes` WRITE;
/*!40000 ALTER TABLE `tipos_flexoes` DISABLE KEYS */;
INSERT INTO `tipos_flexoes` VALUES (1,'radical','radical','2023-09-26 16:33:08.869222'),(2,'singular_feminino','singular_feminino','2023-09-26 16:33:08.870405'),(3,'singular_masculino','singular_masculino','2023-09-26 16:33:08.871826'),(4,'singular_neutro','singular_neutro','2023-09-26 16:33:08.873180'),(5,'plural_feminino','plural_feminino','2023-09-26 16:33:08.874001'),(6,'plural_masculino','plural_masculino','2023-09-26 16:33:08.876468'),(7,'plural_neutro','plural_neutro','2023-09-26 16:33:08.877485'),(8,'substantivacao','substantivação','2023-09-26 16:33:08.877947'),(9,'agentivacao','agentivação','2023-09-26 16:33:08.880070'),(10,'nominalizacao','nominalização','2023-09-26 16:33:08.881401'),(11,'infinitivo','infinitivo','2023-09-26 16:33:08.881893'),(12,'passado','passado','2023-09-26 16:33:08.883167'),(13,'presente','presente','2023-09-26 16:33:08.883737'),(14,'participio','particípio','2023-09-26 16:33:08.884248');
/*!40000 ALTER TABLE `tipos_flexoes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipos_flexoes_tipos_tokens`
--

DROP TABLE IF EXISTS `tipos_flexoes_tipos_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipos_flexoes_tipos_tokens` (
  `id_chave_tipo_flexao_tipo_token` int(11) NOT NULL AUTO_INCREMENT,
  `nome_tipo_flexao_tipo_token` varchar(200) DEFAULT NULL,
  `id_tipo_token` int(11) DEFAULT NULL,
  `id_tipo_flexao` int(11) DEFAULT NULL,
  `time_stamp` timestamp(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  PRIMARY KEY (`id_chave_tipo_flexao_tipo_token`),
  UNIQUE KEY `nome_tipo_flexao_tipo_token` (`nome_tipo_flexao_tipo_token`),
  UNIQUE KEY `id_tipo_token` (`id_tipo_token`,`id_tipo_flexao`),
  KEY `id_tipo_flexao` (`id_tipo_flexao`),
  CONSTRAINT `tipos_flexoes_tipos_tokens_ibfk_1` FOREIGN KEY (`id_tipo_token`) REFERENCES `tipos_tokens` (`id_chave_tipo_token`),
  CONSTRAINT `tipos_flexoes_tipos_tokens_ibfk_2` FOREIGN KEY (`id_tipo_flexao`) REFERENCES `tipos_flexoes` (`id_chave_tipo_flexao`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipos_flexoes_tipos_tokens`
--

LOCK TABLES `tipos_flexoes_tipos_tokens` WRITE;
/*!40000 ALTER TABLE `tipos_flexoes_tipos_tokens` DISABLE KEYS */;
INSERT INTO `tipos_flexoes_tipos_tokens` VALUES (1,'verbo_infinitivo',1,11,'2023-09-26 16:33:08.972282'),(2,'verbo_passado',1,12,'2023-09-26 16:33:08.973400'),(3,'verbo_presente',1,13,'2023-09-26 16:33:08.974070'),(4,'verbo_participio',1,14,'2023-09-26 16:33:08.977163'),(5,'verbo_flexao_definida_infinitivo',2,11,'2023-09-26 16:33:08.977746'),(6,'verbo_flexao_definida_passado',2,12,'2023-09-26 16:33:08.992818'),(7,'verbo_flexao_definida_presente',2,13,'2023-09-26 16:33:08.994478'),(8,'verbo_flexao_definida_participio',2,14,'2023-09-26 16:33:08.995901'),(9,'substantivo_singular_neutro',3,4,'2023-09-26 16:33:08.996436'),(10,'substantivo_singular_masculino',3,3,'2023-09-26 16:33:08.996990'),(11,'substantivo_singular_feminino',3,2,'2023-09-26 16:33:08.997557'),(12,'substantivo_plural_neutro',3,7,'2023-09-26 16:33:08.999002'),(13,'substantivo_plural_masculino',3,6,'2023-09-26 16:33:09.000168'),(14,'substantivo_plural_feminino',3,5,'2023-09-26 16:33:09.000819'),(15,'substantivo_substantivacao',3,8,'2023-09-26 16:33:09.001381'),(16,'substantivo_agentivacao',3,9,'2023-09-26 16:33:09.001936'),(17,'substantivo_nominalizacao',3,10,'2023-09-26 16:33:09.003296'),(18,'substantivo_flexao_definida_singular_neutro',4,4,'2023-09-26 16:33:09.003870'),(19,'substantivo_flexao_definida_singular_masculino',4,3,'2023-09-26 16:33:09.004432'),(20,'substantivo_flexao_definida_singular_feminino',4,2,'2023-09-26 16:33:09.005007'),(21,'substantivo_flexao_definida_plural_neutro',4,7,'2023-09-26 16:33:09.006054'),(22,'substantivo_flexao_definida_plural_masculino',4,6,'2023-09-26 16:33:09.007693'),(23,'substantivo_flexao_definida_plural_feminino',4,5,'2023-09-26 16:33:09.008351'),(24,'substantivo_flexao_definida_substantivacao',4,8,'2023-09-26 16:33:09.009716'),(25,'substantivo_flexao_definida_agentivacao',4,9,'2023-09-26 16:33:09.011189'),(26,'substantivo_flexao_definida_nominalizacao',4,10,'2023-09-26 16:33:09.011862'),(27,'adjetivo_singular_neutro',7,4,'2023-09-26 16:33:09.013347'),(28,'adjetivo_singular_masculino',7,3,'2023-09-26 16:33:09.015233'),(29,'adjetivo_singular_feminino',7,2,'2023-09-26 16:33:09.015999'),(30,'adjetivo_plural_neutro',7,7,'2023-09-26 16:33:09.016615'),(31,'adjetivo_plural_masculino',7,6,'2023-09-26 16:33:09.017365'),(32,'adjetivo_plural_feminino',7,5,'2023-09-26 16:33:09.018167'),(33,'preposicao_singular_neutro',5,4,'2023-09-26 16:33:09.019719'),(34,'preposicao_singular_masculino',5,3,'2023-09-26 16:33:09.020353'),(35,'preposicao_singular_feminino',5,2,'2023-09-26 16:33:09.020989'),(36,'preposicao_plural_neutro',5,7,'2023-09-26 16:33:09.021585'),(37,'preposicao_plural_masculino',5,6,'2023-09-26 16:33:09.023074'),(38,'preposicao_plural_feminino',5,5,'2023-09-26 16:33:09.023695'),(39,'artigo_singular_neutro',9,4,'2023-09-26 16:33:09.024312'),(40,'artigo_singular_masculino',9,3,'2023-09-26 16:33:09.024940'),(41,'artigo_singular_feminino',9,2,'2023-09-26 16:33:09.025542'),(42,'artigo_plural_neutro',9,7,'2023-09-26 16:33:09.027434'),(43,'artigo_plural_masculino',9,6,'2023-09-26 16:33:09.028080'),(44,'artigo_plural_feminino',9,5,'2023-09-26 16:33:09.028715');
/*!40000 ALTER TABLE `tipos_flexoes_tipos_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipos_secoes_visiveis`
--

DROP TABLE IF EXISTS `tipos_secoes_visiveis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipos_secoes_visiveis` (
  `id_chave_tipo_secao_visivel` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) DEFAULT NULL,
  `id_nested_tipo_secao` int(11) DEFAULT NULL,
  `visivel` varchar(100) DEFAULT NULL,
  `time_stamp` timestamp(6) NOT NULL DEFAULT current_timestamp(6),
  PRIMARY KEY (`id_chave_tipo_secao_visivel`),
  UNIQUE KEY `id_user` (`id_user`,`id_nested_tipo_secao`),
  KEY `id_nested_tipo_secao` (`id_nested_tipo_secao`),
  CONSTRAINT `tipos_secoes_visiveis_ibfk_1` FOREIGN KEY (`id_nested_tipo_secao`) REFERENCES `nested_tipos_secoes` (`id_chave_nested_tipo_secao`),
  CONSTRAINT `tipos_secoes_visiveis_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_chave_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipos_secoes_visiveis`
--

LOCK TABLES `tipos_secoes_visiveis` WRITE;
/*!40000 ALTER TABLE `tipos_secoes_visiveis` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipos_secoes_visiveis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipos_tokens`
--

DROP TABLE IF EXISTS `tipos_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipos_tokens` (
  `id_chave_tipo_token` int(11) NOT NULL AUTO_INCREMENT,
  `nome_tipo_token` varchar(200) DEFAULT NULL,
  `acentuada` varchar(200) DEFAULT NULL,
  `classe` varchar(200) DEFAULT NULL,
  `time_stamp` timestamp(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  PRIMARY KEY (`id_chave_tipo_token`),
  UNIQUE KEY `nome_tipo_token` (`nome_tipo_token`),
  KEY `classe` (`classe`),
  CONSTRAINT `tipos_tokens_ibfk_1` FOREIGN KEY (`classe`) REFERENCES `tipos_tokens` (`nome_tipo_token`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipos_tokens`
--

LOCK TABLES `tipos_tokens` WRITE;
/*!40000 ALTER TABLE `tipos_tokens` DISABLE KEYS */;
INSERT INTO `tipos_tokens` VALUES (1,'verbo','verbo','verbo','2023-09-26 16:33:08.907911'),(2,'verbo_flexao_definida','verbo com flexão definida','verbo','2023-09-26 16:33:08.907911'),(3,'substantivo','substantivo','substantivo','2023-09-26 16:33:08.908800'),(4,'substantivo_flexao_definida','substantivo com flexão definida','substantivo','2023-09-26 16:33:08.908800'),(5,'preposicao','preposição','preposicao','2023-09-26 16:33:08.909412'),(6,'preposicao_fixa','preposição instanciada num valor fixo','preposicao','2023-09-26 16:33:08.909412'),(7,'adjetivo','adjetivo','adjetivo','2023-09-26 16:33:08.910161'),(8,'pronome','pronome','pronome','2023-09-26 16:33:08.911513'),(9,'artigo','artigo','artigo','2023-09-26 16:33:08.912101'),(10,'conjuncao','conjunção','conjuncao','2023-09-26 16:33:08.912635'),(11,'interjeicao','interjeição','interjeicao','2023-09-26 16:33:08.913240'),(12,'numeral','numeral','numeral','2023-09-26 16:33:08.913841'),(13,'adverbio','advérbio','adverbio','2023-09-26 16:33:08.916052');
/*!40000 ALTER TABLE `tipos_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tokens`
--

DROP TABLE IF EXISTS `tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tokens` (
  `id_chave_token` int(11) NOT NULL AUTO_INCREMENT,
  `nome_token` varchar(200) DEFAULT NULL,
  `id_tipo_token` int(11) DEFAULT NULL,
  `id_raiz` int(11) DEFAULT NULL,
  `id_tipo_flexao` int(11) DEFAULT NULL,
  `time_stamp` timestamp(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  PRIMARY KEY (`id_chave_token`),
  UNIQUE KEY `nome_token` (`nome_token`,`id_tipo_token`),
  KEY `id_tipo_token` (`id_tipo_token`),
  KEY `id_raiz` (`id_raiz`),
  KEY `id_tipo_flexao` (`id_tipo_flexao`),
  CONSTRAINT `tokens_ibfk_1` FOREIGN KEY (`id_tipo_token`) REFERENCES `tipos_tokens` (`id_chave_tipo_token`),
  CONSTRAINT `tokens_ibfk_2` FOREIGN KEY (`id_raiz`) REFERENCES `tokens` (`id_chave_token`),
  CONSTRAINT `tokens_ibfk_3` FOREIGN KEY (`id_tipo_flexao`) REFERENCES `tipos_flexoes` (`id_chave_tipo_flexao`)
) ENGINE=InnoDB AUTO_INCREMENT=426 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tokens`
--

LOCK TABLES `tokens` WRITE;
/*!40000 ALTER TABLE `tokens` DISABLE KEYS */;
INSERT INTO `tokens` VALUES (1,'elaborar',1,NULL,11,'2023-09-26 16:33:10.600767'),(2,'publicar',1,NULL,11,'2023-09-26 16:33:10.601752'),(3,'avaliar',1,NULL,11,'2023-09-26 16:33:10.603202'),(4,'revisar',1,NULL,11,'2023-09-26 16:33:10.640874'),(5,'planejar',1,NULL,11,'2023-09-26 16:33:10.641724'),(6,'gerir',1,NULL,11,'2023-09-26 16:33:10.643595'),(7,'participar',1,NULL,11,'2023-09-26 16:33:10.644233'),(8,'apresentar',1,NULL,11,'2023-09-26 16:33:10.644944'),(9,'estabelecer',1,NULL,11,'2023-09-26 16:33:10.645707'),(10,'credenciar',1,NULL,11,'2023-09-26 16:33:10.647317'),(11,'apoiar',1,NULL,11,'2023-09-26 16:33:10.648160'),(12,'realizar',1,NULL,11,'2023-09-26 16:33:10.648830'),(13,'desenvolver',1,NULL,11,'2023-09-26 16:33:10.649595'),(14,'atuar',1,NULL,11,'2023-09-26 16:33:10.651156'),(15,'supervisionar',1,NULL,11,'2023-09-26 16:33:10.651833'),(16,'especificar',1,NULL,11,'2023-09-26 16:33:10.652510'),(17,'informar',1,NULL,11,'2023-09-26 16:33:10.653269'),(18,'proceder',1,NULL,11,'2023-09-26 16:33:10.653940'),(19,'contratar',1,NULL,11,'2023-09-26 16:33:10.655801'),(20,'relatar',1,NULL,11,'2023-09-26 16:33:10.656548'),(21,'propor',1,NULL,11,'2023-09-26 16:33:10.657196'),(22,'indexar',1,NULL,11,'2023-09-26 16:33:10.657837'),(23,'debater',1,NULL,11,'2023-09-26 16:33:10.659298'),(24,'reunir',1,NULL,11,'2023-09-26 16:33:10.659961'),(25,'fomentar',1,NULL,11,'2023-09-26 16:33:10.660725'),(26,'trabalhar',1,NULL,11,'2023-09-26 16:33:10.661470'),(27,'comprar',1,NULL,11,'2023-09-26 16:33:10.663115'),(28,'processar',1,NULL,11,'2023-09-26 16:33:10.663896'),(29,'entregar',1,NULL,11,'2023-09-26 16:33:10.664608'),(30,'pesquisar',1,NULL,11,'2023-09-26 16:33:10.665314'),(31,'projetar',1,NULL,11,'2023-09-26 16:33:10.666008'),(32,'servir',1,NULL,11,'2023-09-26 16:33:10.667523'),(33,'colaborar',1,NULL,11,'2023-09-26 16:33:10.668237'),(34,'graduar',1,NULL,11,'2023-09-26 16:33:10.668855'),(35,'pós-graduar',1,NULL,11,'2023-09-26 16:33:10.669502'),(36,'organizar',1,NULL,11,'2023-09-26 16:33:10.671070'),(37,'ensinar',1,NULL,11,'2023-09-26 16:33:10.672386'),(38,'palestrar',1,NULL,11,'2023-09-26 16:33:10.673128'),(39,'proteger',1,NULL,11,'2023-09-26 16:33:10.673816'),(40,'interessar',1,NULL,11,'2023-09-26 16:33:10.675259'),(41,'coletar',1,NULL,11,'2023-09-26 16:33:10.675935'),(42,'analisar',1,NULL,11,'2023-09-26 16:33:10.676575'),(43,'controlar',1,NULL,11,'2023-09-26 16:33:10.677203'),(44,'apostilar',1,NULL,11,'2023-09-26 16:33:10.677922'),(45,'elaboração',3,1,8,'2023-09-26 16:33:10.683083'),(46,'publicação',3,2,8,'2023-09-26 16:33:10.684826'),(47,'avaliação',3,3,8,'2023-09-26 16:33:10.685687'),(48,'revisão',3,4,8,'2023-09-26 16:33:10.687344'),(49,'revisor',3,4,9,'2023-09-26 16:33:10.688142'),(50,'planejamento',3,5,8,'2023-09-26 16:33:10.689070'),(51,'plano',3,5,10,'2023-09-26 16:33:10.689823'),(52,'gestão',3,6,8,'2023-09-26 16:33:10.691331'),(53,'participação',3,7,8,'2023-09-26 16:33:10.692072'),(54,'apresentação',3,8,8,'2023-09-26 16:33:10.693089'),(55,'estabelecimento',3,9,8,'2023-09-26 16:33:10.693801'),(56,'credenciamento',3,10,8,'2023-09-26 16:33:10.695339'),(57,'credencial',3,10,10,'2023-09-26 16:33:10.696042'),(58,'apoio',3,11,8,'2023-09-26 16:33:10.696727'),(59,'realização',3,12,8,'2023-09-26 16:33:10.697429'),(60,'desenvolvimento',3,13,8,'2023-09-26 16:33:10.699045'),(61,'atuação',3,14,8,'2023-09-26 16:33:10.699723'),(62,'supervisão',3,15,8,'2023-09-26 16:33:10.700423'),(63,'supervisor',3,15,9,'2023-09-26 16:33:10.701148'),(64,'especificação',3,16,8,'2023-09-26 16:33:10.701852'),(65,'informação',3,17,8,'2023-09-26 16:33:10.703331'),(66,'procedimento',3,18,8,'2023-09-26 16:33:10.703998'),(67,'contratação',3,19,8,'2023-09-26 16:33:10.704672'),(68,'contrato',3,19,10,'2023-09-26 16:33:10.705382'),(69,'relato',3,20,8,'2023-09-26 16:33:10.707400'),(70,'relator',3,20,9,'2023-09-26 16:33:10.708405'),(71,'proposição',3,21,8,'2023-09-26 16:33:10.709345'),(72,'indexação',3,22,8,'2023-09-26 16:33:10.711018'),(73,'debate',3,23,8,'2023-09-26 16:33:10.711963'),(74,'reunião',3,24,8,'2023-09-26 16:33:10.712943'),(75,'fomento',3,25,8,'2023-09-26 16:33:10.713911'),(76,'trabalho',3,26,8,'2023-09-26 16:33:10.715531'),(77,'compra',3,27,8,'2023-09-26 16:33:10.716575'),(78,'processamento',3,28,8,'2023-09-26 16:33:10.717617'),(79,'processo',3,28,10,'2023-09-26 16:33:10.719473'),(80,'entrega',3,29,8,'2023-09-26 16:33:10.720417'),(81,'pesquisa',3,30,8,'2023-09-26 16:33:10.721334'),(82,'projeção',3,31,8,'2023-09-26 16:33:10.723068'),(83,'projeto',3,31,10,'2023-09-26 16:33:10.724012'),(84,'projetista',3,31,9,'2023-09-26 16:33:10.724961'),(85,'serviço',3,32,10,'2023-09-26 16:33:10.725906'),(86,'servidor',3,32,9,'2023-09-26 16:33:10.727508'),(87,'colaboração',3,33,8,'2023-09-26 16:33:10.728348'),(88,'colaborador',3,33,9,'2023-09-26 16:33:10.729161'),(89,'graduação',3,34,8,'2023-09-26 16:33:10.734153'),(90,'graduado',3,34,9,'2023-09-26 16:33:10.735917'),(91,'pós-graduação',3,35,8,'2023-09-26 16:33:10.736775'),(92,'pós-graduado',3,35,9,'2023-09-26 16:33:10.737625'),(93,'organização',3,36,8,'2023-09-26 16:33:10.739179'),(94,'organizador',3,36,9,'2023-09-26 16:33:10.739961'),(95,'ensino',3,37,8,'2023-09-26 16:33:10.740764'),(96,'palestra',3,38,8,'2023-09-26 16:33:10.741943'),(97,'proteção',3,39,8,'2023-09-26 16:33:10.743668'),(98,'protetor',3,39,9,'2023-09-26 16:33:10.744519'),(99,'interesse',3,40,8,'2023-09-26 16:33:10.745368'),(100,'interessado',3,40,9,'2023-09-26 16:33:10.746973'),(101,'coleta',3,41,8,'2023-09-26 16:33:10.747820'),(102,'coletor',3,41,9,'2023-09-26 16:33:10.748662'),(103,'análise',3,42,8,'2023-09-26 16:33:10.749482'),(104,'analista',3,42,9,'2023-09-26 16:33:10.751361'),(105,'controle',3,43,8,'2023-09-26 16:33:10.752197'),(106,'controlador',3,43,9,'2023-09-26 16:33:10.753078'),(107,'apostilamento',3,44,8,'2023-09-26 16:33:10.753951'),(108,'apostila',3,44,10,'2023-09-26 16:33:10.755681'),(109,'elaborei',1,1,12,'2023-09-26 16:33:10.756498'),(110,'publiquei',1,2,12,'2023-09-26 16:33:10.757346'),(111,'avaliei',1,3,12,'2023-09-26 16:33:10.759048'),(112,'revisei',1,4,12,'2023-09-26 16:33:10.759930'),(113,'planejei',1,5,12,'2023-09-26 16:33:10.760753'),(114,'geri',1,6,12,'2023-09-26 16:33:10.761569'),(115,'participei',1,7,12,'2023-09-26 16:33:10.763200'),(116,'apresentei',1,8,12,'2023-09-26 16:33:10.764160'),(117,'estabeleci',1,9,12,'2023-09-26 16:33:10.764906'),(118,'credenciei',1,10,12,'2023-09-26 16:33:10.765766'),(119,'apoiei',1,11,12,'2023-09-26 16:33:10.767321'),(120,'realizei',1,12,12,'2023-09-26 16:33:10.768169'),(121,'desenvolvi',1,13,12,'2023-09-26 16:33:10.768930'),(122,'atuei',1,14,12,'2023-09-26 16:33:10.769927'),(123,'supervisionei',1,15,12,'2023-09-26 16:33:10.771402'),(124,'especifiquei',1,16,12,'2023-09-26 16:33:10.772146'),(125,'informei',1,17,12,'2023-09-26 16:33:10.772866'),(126,'procedi',1,18,12,'2023-09-26 16:33:10.773625'),(127,'contratei',1,19,12,'2023-09-26 16:33:10.775639'),(128,'relatei',1,20,12,'2023-09-26 16:33:10.776597'),(129,'propús',1,21,12,'2023-09-26 16:33:10.777492'),(130,'indexei',1,22,12,'2023-09-26 16:33:10.779148'),(131,'reuní',1,24,12,'2023-09-26 16:33:10.779940'),(132,'fomentei',1,25,12,'2023-09-26 16:33:10.780752'),(133,'trabalhei',1,26,12,'2023-09-26 16:33:10.781497'),(134,'processei',1,28,12,'2023-09-26 16:33:10.783057'),(135,'entreguei',1,29,12,'2023-09-26 16:33:10.783797'),(136,'pesquisei',1,30,12,'2023-09-26 16:33:10.784503'),(137,'projetei',1,31,12,'2023-09-26 16:33:10.785210'),(138,'servi',1,32,12,'2023-09-26 16:33:10.785935'),(139,'colaborei',1,33,12,'2023-09-26 16:33:10.788459'),(140,'graduei',1,34,12,'2023-09-26 16:33:10.789208'),(141,'pós-graduei',1,35,12,'2023-09-26 16:33:10.789939'),(142,'organizei',1,36,12,'2023-09-26 16:33:10.791464'),(143,'ensinei',1,37,12,'2023-09-26 16:33:10.792222'),(144,'palestrei',1,38,12,'2023-09-26 16:33:10.792957'),(145,'protegi',1,39,12,'2023-09-26 16:33:10.793698'),(146,'interessei',1,40,12,'2023-09-26 16:33:10.795147'),(147,'coletei',1,41,12,'2023-09-26 16:33:10.795934'),(148,'analisei',1,42,12,'2023-09-26 16:33:10.796689'),(149,'controlei',1,43,12,'2023-09-26 16:33:10.797452'),(150,'comprei',1,27,12,'2023-09-26 16:33:10.799089'),(151,'debatí',1,23,12,'2023-09-26 16:33:10.799856'),(152,'apostilei',1,44,12,'2023-09-26 16:33:10.800584'),(153,'elaborado',1,1,14,'2023-09-26 16:33:10.801418'),(154,'publicado',1,2,14,'2023-09-26 16:33:10.803053'),(155,'avaliado',1,3,14,'2023-09-26 16:33:10.803964'),(156,'revisado',1,4,14,'2023-09-26 16:33:10.804769'),(157,'planejado',1,5,14,'2023-09-26 16:33:10.805855'),(158,'gerido',1,6,14,'2023-09-26 16:33:10.807386'),(159,'participado',1,7,14,'2023-09-26 16:33:10.808213'),(160,'apresentado',1,8,14,'2023-09-26 16:33:10.808978'),(161,'estabelecido',1,9,14,'2023-09-26 16:33:10.809775'),(162,'credenciado',1,10,14,'2023-09-26 16:33:10.811300'),(163,'apoiado',1,11,14,'2023-09-26 16:33:10.812064'),(164,'realizado',1,12,14,'2023-09-26 16:33:10.812829'),(165,'desenvolvido',1,13,14,'2023-09-26 16:33:10.813607'),(166,'atuado',1,14,14,'2023-09-26 16:33:10.815111'),(167,'supervisionado',1,15,14,'2023-09-26 16:33:10.815892'),(168,'especificado',1,16,14,'2023-09-26 16:33:10.816649'),(169,'informado',1,17,14,'2023-09-26 16:33:10.817413'),(170,'procedido',1,18,14,'2023-09-26 16:33:10.818973'),(171,'contratado',1,19,14,'2023-09-26 16:33:10.819726'),(172,'relatado',1,20,14,'2023-09-26 16:33:10.820486'),(173,'proposto',1,21,14,'2023-09-26 16:33:10.821225'),(174,'indexado',1,22,14,'2023-09-26 16:33:10.822153'),(175,'reunido',1,24,14,'2023-09-26 16:33:10.824350'),(176,'fomentado',1,25,14,'2023-09-26 16:33:10.825580'),(177,'trabalhado',1,26,14,'2023-09-26 16:33:10.827212'),(178,'processado',1,28,14,'2023-09-26 16:33:10.828278'),(179,'entregue',1,29,14,'2023-09-26 16:33:10.829514'),(180,'projetado',1,31,14,'2023-09-26 16:33:10.831289'),(181,'servido',1,32,14,'2023-09-26 16:33:10.832087'),(182,'colaborado',1,33,14,'2023-09-26 16:33:10.833093'),(183,'organizado',1,36,14,'2023-09-26 16:33:10.833815'),(184,'ensinado',1,37,14,'2023-09-26 16:33:10.835376'),(185,'palestrado',1,38,14,'2023-09-26 16:33:10.836154'),(186,'protegido',1,39,14,'2023-09-26 16:33:10.836900'),(187,'coletado',1,41,14,'2023-09-26 16:33:10.837652'),(188,'analisado',1,42,14,'2023-09-26 16:33:10.839656'),(189,'controlado',1,43,14,'2023-09-26 16:33:10.840592'),(190,'comprado',1,27,14,'2023-09-26 16:33:10.841565'),(191,'debatido',1,23,14,'2023-09-26 16:33:10.852139'),(192,'pesquisado',1,30,14,'2023-09-26 16:33:10.854243'),(193,'apostilado',1,44,14,'2023-09-26 16:33:10.856032'),(194,'artigo',3,NULL,1,'2023-09-26 16:33:10.857012'),(195,'livro',3,NULL,1,'2023-09-26 16:33:10.857935'),(196,'capítulo',3,NULL,1,'2023-09-26 16:33:10.859674'),(197,'cartilha',3,NULL,1,'2023-09-26 16:33:10.860458'),(198,'material',3,NULL,1,'2023-09-26 16:33:10.861214'),(199,'relatório',3,20,10,'2023-09-26 16:33:10.862006'),(200,'peça',3,NULL,1,'2023-09-26 16:33:10.863714'),(201,'conteúdo',3,NULL,1,'2023-09-26 16:33:10.864523'),(202,'proposta',3,21,10,'2023-09-26 16:33:10.865284'),(203,'proponente',3,21,9,'2023-09-26 16:33:10.866222'),(204,'periódico',3,NULL,1,'2023-09-26 16:33:10.867798'),(205,'órgão',3,NULL,1,'2023-09-26 16:33:10.868505'),(206,'parecer',3,NULL,1,'2023-09-26 16:33:10.869229'),(207,'comunidade',3,NULL,1,'2023-09-26 16:33:10.869940'),(208,'meio',3,NULL,1,'2023-09-26 16:33:10.871563'),(209,'Fundacentro',3,NULL,1,'2023-09-26 16:33:10.872322'),(210,'congresso',3,NULL,1,'2023-09-26 16:33:10.873076'),(211,'seminário',3,NULL,1,'2023-09-26 16:33:10.874081'),(212,'oficina',3,NULL,1,'2023-09-26 16:33:10.875565'),(213,'convenção',3,NULL,1,'2023-09-26 16:33:10.876270'),(214,'CNPq',3,NULL,1,'2023-09-26 16:33:10.876964'),(215,'FAPESP',3,NULL,1,'2023-09-26 16:33:10.877671'),(216,'FINEP',3,NULL,1,'2023-09-26 16:33:10.879119'),(217,'saúde',3,NULL,1,'2023-09-26 16:33:10.879894'),(218,'segurança',3,NULL,1,'2023-09-26 16:33:10.880596'),(219,'comissão',3,NULL,1,'2023-09-26 16:33:10.881307'),(220,'evento',3,NULL,9,'2023-09-26 16:33:10.882000'),(221,'trabalhador',3,26,9,'2023-09-26 16:33:10.885083'),(222,'infraestrutura',3,NULL,1,'2023-09-26 16:33:10.886093'),(223,'laboratório',3,NULL,1,'2023-09-26 16:33:10.887863'),(224,'parceiro',3,NULL,1,'2023-09-26 16:33:10.888774'),(225,'equipamento',3,NULL,1,'2023-09-26 16:33:10.889563'),(226,'grupo',3,NULL,1,'2023-09-26 16:33:10.893766'),(227,'rede',3,NULL,1,'2023-09-26 16:33:10.895214'),(228,'pesquisador',3,30,9,'2023-09-26 16:33:10.895862'),(229,'curso',3,NULL,1,'2023-09-26 16:33:10.896575'),(230,'disciplina',3,NULL,1,'2023-09-26 16:33:10.897213'),(231,'modalidade',3,NULL,1,'2023-09-26 16:33:10.897849'),(232,'finalidade',3,NULL,1,'2023-09-26 16:33:10.899403'),(233,'programa',3,NULL,1,'2023-09-26 16:33:10.900144'),(234,'bolsista',3,NULL,1,'2023-09-26 16:33:10.900809'),(235,'nível',3,NULL,1,'2023-09-26 16:33:10.901433'),(236,'iniciação',3,NULL,1,'2023-09-26 16:33:10.902132'),(237,'mestrado',3,NULL,1,'2023-09-26 16:33:10.903563'),(238,'doutorado',3,NULL,1,'2023-09-26 16:33:10.904229'),(239,'extensão',3,NULL,1,'2023-09-26 16:33:10.904849'),(240,'visitante',3,NULL,1,'2023-09-26 16:33:10.905477'),(241,'banca',3,NULL,1,'2023-09-26 16:33:10.906012'),(242,'examinador',3,NULL,1,'2023-09-26 16:33:10.907403'),(243,'conselho',3,NULL,1,'2023-09-26 16:33:10.908019'),(244,'universidade',3,NULL,1,'2023-09-26 16:33:10.908634'),(245,'tema',3,NULL,1,'2023-09-26 16:33:10.909268'),(246,'norma',3,NULL,1,'2023-09-26 16:33:10.910320'),(247,'diretriz',3,NULL,1,'2023-09-26 16:33:10.911704'),(248,'conferência',3,NULL,1,'2023-09-26 16:33:10.912364'),(249,'método',3,NULL,1,'2023-09-26 16:33:10.913022'),(250,'forma',3,NULL,1,'2023-09-26 16:33:10.913661'),(251,'conhecimento',3,NULL,1,'2023-09-26 16:33:10.915105'),(252,'demanda',3,NULL,1,'2023-09-26 16:33:10.915745'),(253,'sociedade',3,NULL,1,'2023-09-26 16:33:10.916388'),(254,'caráter',3,NULL,1,'2023-09-26 16:33:10.917052'),(255,'instrumento',3,NULL,1,'2023-09-26 16:33:10.917764'),(256,'banco',3,NULL,1,'2023-09-26 16:33:10.919185'),(257,'dado',3,NULL,1,'2023-09-26 16:33:10.919800'),(258,'história',3,NULL,1,'2023-09-26 16:33:10.920439'),(259,'atividade',3,NULL,1,'2023-09-26 16:33:10.921001'),(260,'autoridade',3,NULL,1,'2023-09-26 16:33:10.921578'),(261,'competência',3,NULL,1,'2023-09-26 16:33:10.922974'),(262,'ministério',3,NULL,1,'2023-09-26 16:33:10.923597'),(263,'judiciário',3,NULL,1,'2023-09-26 16:33:10.924158'),(264,'união',3,NULL,1,'2023-09-26 16:33:10.925058'),(265,'procurador',3,NULL,1,'2023-09-26 16:33:10.925661'),(266,'polícia',3,NULL,1,'2023-09-26 16:33:10.927031'),(267,'EPI',3,NULL,1,'2023-09-26 16:33:10.927622'),(268,'software',3,NULL,1,'2023-09-26 16:33:10.928205'),(269,'EPC',3,NULL,1,'2023-09-26 16:33:10.928856'),(270,'aplicativo',3,NULL,1,'2023-09-26 16:33:10.929428'),(271,'fórum',3,NULL,1,'2023-09-26 16:33:10.929968'),(272,'em',5,NULL,1,'2023-09-26 16:33:10.931273'),(273,'a',5,NULL,1,'2023-09-26 16:33:10.931899'),(274,'para',5,NULL,1,'2023-09-26 16:33:10.932488'),(275,'de',5,NULL,1,'2023-09-26 16:33:10.933088'),(276,'antes',5,NULL,1,'2023-09-26 16:33:10.933703'),(277,'após',5,NULL,1,'2023-09-26 16:33:10.935086'),(278,'até',5,NULL,1,'2023-09-26 16:33:10.935685'),(279,'com',5,NULL,1,'2023-09-26 16:33:10.936573'),(280,'contra',5,NULL,1,'2023-09-26 16:33:10.937146'),(281,'desde',5,NULL,1,'2023-09-26 16:33:10.937722'),(282,'entre',5,NULL,1,'2023-09-26 16:33:10.939085'),(283,'per',5,NULL,1,'2023-09-26 16:33:10.939722'),(284,'perante',5,NULL,1,'2023-09-26 16:33:10.940318'),(285,'por',5,NULL,1,'2023-09-26 16:33:10.940917'),(286,'sem',5,NULL,1,'2023-09-26 16:33:10.941491'),(287,'sob',5,NULL,1,'2023-09-26 16:33:10.943745'),(288,'sobre',5,NULL,1,'2023-09-26 16:33:10.944526'),(289,'trás',5,NULL,1,'2023-09-26 16:33:10.945210'),(290,'o',9,NULL,1,'2023-09-26 16:33:10.945976'),(291,'um',9,NULL,1,'2023-09-26 16:33:10.947544'),(292,'didático',7,NULL,1,'2023-09-26 16:33:10.948271'),(293,'estratégico',7,NULL,1,'2023-09-26 16:33:10.948980'),(294,'tecnológico',7,NULL,1,'2023-09-26 16:33:10.949690'),(295,'científico',7,NULL,1,'2023-09-26 16:33:10.951154'),(296,'estendido',7,NULL,1,'2023-09-26 16:33:10.951813'),(297,'completo',7,NULL,1,'2023-09-26 16:33:10.959578'),(298,'diverso',7,NULL,1,'2023-09-26 16:33:10.961179'),(299,'indexado',7,NULL,1,'2023-09-26 16:33:10.961823'),(300,'interno',7,NULL,1,'2023-09-26 16:33:10.963433'),(301,'formal',7,NULL,1,'2023-09-26 16:33:10.964172'),(302,'institucional',7,NULL,1,'2023-09-26 16:33:10.964798'),(303,'reconhecido',7,NULL,1,'2023-09-26 16:33:10.965412'),(304,'correlato',7,NULL,1,'2023-09-26 16:33:10.965969'),(305,'superior',7,NULL,1,'2023-09-26 16:33:10.967395'),(306,'público',7,NULL,1,'2023-09-26 16:33:10.969227'),(307,'relacionado',7,NULL,1,'2023-09-26 16:33:10.969825'),(308,'relativo',7,NULL,1,'2023-09-26 16:33:10.971243'),(309,'pertinente',7,NULL,1,'2023-09-26 16:33:10.971875'),(310,'livre',7,NULL,1,'2023-09-26 16:33:10.972716'),(311,'inovador',7,NULL,1,'2023-09-26 16:33:10.973400'),(312,'externo',7,NULL,1,'2023-09-26 16:33:10.974379'),(313,'vinculado',7,NULL,1,'2023-09-26 16:33:10.975909'),(314,'disciplinar',7,NULL,5,'2023-09-26 16:33:10.976780'),(315,'correicional',7,NULL,5,'2023-09-26 16:33:10.977905'),(316,'social',7,NULL,5,'2023-09-26 16:33:10.979541'),(317,'judicial',7,NULL,5,'2023-09-26 16:33:10.980283'),(318,'funcional',7,NULL,5,'2023-09-26 16:33:10.981050'),(319,'contábil',7,NULL,5,'2023-09-26 16:33:10.981767'),(320,'predial',7,NULL,5,'2023-09-26 16:33:10.983332'),(321,'jornalístico',7,NULL,5,'2023-09-26 16:33:10.984138'),(322,'contratual',7,NULL,5,'2023-09-26 16:33:10.984838'),(323,'operacional',7,NULL,5,'2023-09-26 16:33:10.985561'),(324,'firmado',7,NULL,5,'2023-09-26 16:33:10.987183'),(325,'típico',7,NULL,5,'2023-09-26 16:33:10.987920'),(326,'bibliográfico',7,NULL,5,'2023-09-26 16:33:10.988641'),(327,'remoto',7,NULL,5,'2023-09-26 16:33:10.989355'),(328,'similar',7,NULL,5,'2023-09-26 16:33:10.990045'),(329,'sociais',7,316,6,'2023-09-26 16:33:11.005400'),(330,'funcionais',7,318,6,'2023-09-26 16:33:11.007446'),(331,'judiciais',7,317,6,'2023-09-26 16:33:11.017674'),(332,'similares',7,328,6,'2023-09-26 16:33:11.019510'),(333,'contábeis',7,319,6,'2023-09-26 16:33:11.020360'),(334,'operacionais',7,323,6,'2023-09-26 16:33:11.021190'),(335,'prediais',7,320,6,'2023-09-26 16:33:11.021987'),(336,'contratuais',7,322,6,'2023-09-26 16:33:11.024072'),(337,'correicionais',7,315,6,'2023-09-26 16:33:11.024946'),(338,'formais',7,301,6,'2023-09-26 16:33:11.025749'),(339,'institucionais',7,302,6,'2023-09-26 16:33:11.027338'),(340,'pertinentes',7,309,6,'2023-09-26 16:33:11.028300'),(341,'livres',7,310,6,'2023-09-26 16:33:11.029213'),(342,'típicos',7,325,6,'2023-09-26 16:33:11.030140'),(343,'típica',7,325,2,'2023-09-26 16:33:11.031754'),(344,'típicas',7,325,5,'2023-09-26 16:33:11.032861'),(345,'bibliográficos',7,326,6,'2023-09-26 16:33:11.033719'),(346,'bibliográfica',7,326,2,'2023-09-26 16:33:11.035344'),(347,'bibliográficas',7,326,5,'2023-09-26 16:33:11.036249'),(348,'externos',7,312,6,'2023-09-26 16:33:11.037146'),(349,'externa',7,312,2,'2023-09-26 16:33:11.037971'),(350,'externas',7,312,5,'2023-09-26 16:33:11.039897'),(351,'remotos',7,327,6,'2023-09-26 16:33:11.040697'),(352,'remota',7,327,2,'2023-09-26 16:33:11.041487'),(353,'remotas',7,327,5,'2023-09-26 16:33:11.043052'),(354,'firmados',7,324,6,'2023-09-26 16:33:11.043843'),(355,'firmada',7,324,2,'2023-09-26 16:33:11.044693'),(356,'firmadas',7,324,5,'2023-09-26 16:33:11.045470'),(357,'jornalísticos',7,321,6,'2023-09-26 16:33:11.047106'),(358,'jornalística',7,321,2,'2023-09-26 16:33:11.047922'),(359,'jornalísticas',7,321,5,'2023-09-26 16:33:11.049093'),(360,'vinculados',7,313,6,'2023-09-26 16:33:11.049982'),(361,'vinculada',7,313,2,'2023-09-26 16:33:11.051645'),(362,'vinculadas',7,313,5,'2023-09-26 16:33:11.052619'),(363,'estratégicos',7,293,6,'2023-09-26 16:33:11.053490'),(364,'estratégica',7,293,2,'2023-09-26 16:33:11.055506'),(365,'estratégicas',7,293,5,'2023-09-26 16:33:11.056335'),(366,'didáticos',7,292,6,'2023-09-26 16:33:11.057146'),(367,'didática',7,292,2,'2023-09-26 16:33:11.057932'),(368,'didáticas',7,292,5,'2023-09-26 16:33:11.059538'),(369,'reconhecidos',7,303,6,'2023-09-26 16:33:11.060324'),(370,'reconhecida',7,303,2,'2023-09-26 16:33:11.061109'),(371,'reconhecidas',7,303,5,'2023-09-26 16:33:11.061890'),(372,'correlatos',7,304,6,'2023-09-26 16:33:11.063430'),(373,'correlata',7,304,2,'2023-09-26 16:33:11.064200'),(374,'correlatas',7,304,5,'2023-09-26 16:33:11.065066'),(375,'relacionados',7,307,6,'2023-09-26 16:33:11.065927'),(376,'relacionada',7,307,2,'2023-09-26 16:33:11.067608'),(377,'relacionadas',7,307,5,'2023-09-26 16:33:11.068457'),(378,'relativos',7,308,6,'2023-09-26 16:33:11.069281'),(379,'relativa',7,308,2,'2023-09-26 16:33:11.070101'),(380,'relativas',7,308,5,'2023-09-26 16:33:11.071676'),(381,'públicos',7,306,6,'2023-09-26 16:33:11.072474'),(382,'pública',7,306,2,'2023-09-26 16:33:11.073306'),(383,'públicas',7,306,5,'2023-09-26 16:33:11.074107'),(384,'disciplinares',7,314,6,'2023-09-26 16:33:11.075997'),(385,'superiores',7,305,6,'2023-09-26 16:33:11.076778'),(386,'superiora',7,305,2,'2023-09-26 16:33:11.077603'),(387,'superioras',7,305,5,'2023-09-26 16:33:11.079173'),(388,'inovadores',7,311,6,'2023-09-26 16:33:11.079974'),(389,'inovadora',7,311,2,'2023-09-26 16:33:11.080795'),(390,'inovadoras',7,311,5,'2023-09-26 16:33:11.081826'),(391,'tecnológicos',7,294,6,'2023-09-26 16:33:11.083379'),(392,'tecnológica',7,294,2,'2023-09-26 16:33:11.084288'),(393,'tecnológicas',7,294,5,'2023-09-26 16:33:11.085618'),(394,'científicos',7,295,6,'2023-09-26 16:33:11.087917'),(395,'científica',7,295,2,'2023-09-26 16:33:11.088772'),(396,'científicas',7,295,5,'2023-09-26 16:33:11.089941'),(397,'estendidos',7,296,6,'2023-09-26 16:33:11.092751'),(398,'estendida',7,296,2,'2023-09-26 16:33:11.094051'),(399,'estendidas',7,296,5,'2023-09-26 16:33:11.095712'),(400,'completos',7,297,6,'2023-09-26 16:33:11.096593'),(401,'completa',7,297,2,'2023-09-26 16:33:11.097410'),(402,'completas',7,297,5,'2023-09-26 16:33:11.099071'),(403,'diversos',7,298,6,'2023-09-26 16:33:11.099896'),(404,'diversa',7,298,2,'2023-09-26 16:33:11.100693'),(405,'diversas',7,298,5,'2023-09-26 16:33:11.101509'),(406,'indexados',7,299,6,'2023-09-26 16:33:11.103179'),(407,'indexada',7,299,2,'2023-09-26 16:33:11.104247'),(408,'indexadas',7,299,5,'2023-09-26 16:33:11.105191'),(409,'internos',7,300,6,'2023-09-26 16:33:11.106037'),(410,'interna',7,300,2,'2023-09-26 16:33:11.107664'),(411,'internas',7,300,5,'2023-09-26 16:33:11.108426'),(412,'a',9,290,2,'2023-09-26 16:33:11.109189'),(413,'os',9,290,6,'2023-09-26 16:33:11.109941'),(414,'uns',9,291,6,'2023-09-26 16:33:11.111470'),(415,'uma',9,291,2,'2023-09-26 16:33:11.112267'),(416,'umas',9,NULL,5,'2023-09-26 16:33:11.113007'),(417,'as',9,1,5,'2023-09-26 16:33:11.113799'),(418,'da',5,275,2,'2023-09-26 16:33:11.116021'),(419,'do',5,275,3,'2023-09-26 16:33:11.116811'),(420,'das',5,275,5,'2023-09-26 16:33:11.117593'),(421,'dos',5,275,6,'2023-09-26 16:33:11.119158'),(422,'na',5,272,2,'2023-09-26 16:33:11.119918'),(423,'no',5,272,3,'2023-09-26 16:33:11.120709'),(424,'nas',5,272,5,'2023-09-26 16:33:11.121497'),(425,'nos',5,272,6,'2023-09-26 16:33:11.123105');
/*!40000 ALTER TABLE `tokens` ENABLE KEYS */;
UNLOCK TABLES;

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

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id_chave_user` int(11) NOT NULL AUTO_INCREMENT,
  `nome_user` varchar(100) DEFAULT NULL,
  `senha` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id_chave_user`),
  UNIQUE KEY `nome_user` (`nome_user`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'pedro','$2y$10$EECgzrOjZDADL35JU9kLaOmiOtSNuPP1FP9rlQlmheGuLpyr7qHRu'),(2,'victor','$2y$10$EECgzrOjZDADL35JU9kLaOmiOtSNuPP1FP9rlQlmheGuLpyr7qHRu');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `valores`
--

DROP TABLE IF EXISTS `valores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `valores` (
  `id_chave_valores` int(11) NOT NULL AUTO_INCREMENT,
  `nome_valor` varchar(200) DEFAULT NULL,
  `id_registrado` int(11) DEFAULT NULL,
  `id_quesito` int(11) DEFAULT NULL,
  `id_opcao` int(11) DEFAULT NULL,
  `valor` float DEFAULT NULL,
  `time_stamp` timestamp(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  PRIMARY KEY (`id_chave_valores`),
  UNIQUE KEY `id_registrado` (`id_registrado`,`id_quesito`),
  KEY `id_quesito` (`id_quesito`),
  KEY `id_opcao` (`id_opcao`),
  CONSTRAINT `valores_ibfk_1` FOREIGN KEY (`id_registrado`) REFERENCES `registrados` (`id_chave_registrado`),
  CONSTRAINT `valores_ibfk_2` FOREIGN KEY (`id_quesito`) REFERENCES `quesitos` (`id_chave_quesito`),
  CONSTRAINT `valores_ibfk_3` FOREIGN KEY (`id_opcao`) REFERENCES `opcoes` (`id_chave_opcao`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `valores`
--

LOCK TABLES `valores` WRITE;
/*!40000 ALTER TABLE `valores` DISABLE KEYS */;
/*!40000 ALTER TABLE `valores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `valores_discretos`
--

DROP TABLE IF EXISTS `valores_discretos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `valores_discretos` (
  `id_chave_valor_discreto` int(11) NOT NULL AUTO_INCREMENT,
  `nome_valor_discreto` varchar(100) DEFAULT NULL,
  `id_propriedade` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_chave_valor_discreto`),
  KEY `id_propriedade` (`id_propriedade`),
  CONSTRAINT `valores_discretos_ibfk_1` FOREIGN KEY (`id_propriedade`) REFERENCES `propriedades` (`id_chave_propriedade`)
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `valores_discretos`
--

LOCK TABLES `valores_discretos` WRITE;
/*!40000 ALTER TABLE `valores_discretos` DISABLE KEYS */;
INSERT INTO `valores_discretos` VALUES (1,'normal',6),(2,'italico',6),(3,'bold',6),(4,'sublinhado',6),(5,'direita',4),(6,'esquerda',4),(7,'centro',4),(8,'justificado',4),(9,'0.7',5),(10,'0.8',5),(11,'0.9',5),(12,'1.0',5),(13,'1.1',5),(14,'1.2',5),(15,'1.3',5),(16,'1.4',5),(17,'1.5',5),(18,'1.6',5),(19,'1.7',5),(20,'1.8',5),(21,'1.9',5),(22,'2.0',5),(23,'2.1',5),(24,'2.2',5),(25,'2.3',5),(26,'2.4',5),(27,'2.5',5),(28,'2.6',5),(29,'2.7',5),(30,'2.8',5),(31,'2.9',5),(32,'3.0',5),(33,'3.1',5),(34,'3.2',5),(35,'3.3',5),(36,'3.4',5),(37,'3.5',5),(38,'#AA0000',2),(39,'#0035cc',2),(40,'red',2),(41,'cor_original',2),(42,'#003588',2),(43,'#0035bb',2),(44,'#ddf542',2),(45,'#000000',2),(46,'#0035aa',2),(47,'orange',2),(48,'green',2),(49,'white',2),(50,'black',2),(51,'white',3),(52,'black',3),(53,'yellow',3),(54,'blue',3),(55,'sim',1),(56,'nao',1),(57,'cima',7),(58,'baixo',7),(59,'centro',7),(60,'letra_i',8),(61,'letra_a',8),(62,'letra_I',8),(63,'romana',8),(64,'algarismo',8),(65,'10%',14),(66,'15%',14),(67,'20%',14),(68,'25%',14),(69,'sim',9),(70,'nao',9),(71,'sim',10),(72,'nao',10),(73,'tokens',11),(74,'tipos_tokens',11),(75,'tipos_flexoes',11),(76,'tipos_elementos_sintaticos',11),(77,'pessoas',11),(78,'cargos_comissionados',11),(79,'setores',11),(80,'nome_token',13),(81,'nome_tipo_token',13),(82,'nome_tipo_flexao',13),(83,'nome_tipo_elemento_sintatico',13),(84,'nome_pessoa',13),(85,'nome_cargo_comissionado',13),(86,'nome_setor',13),(87,'id_chave_token',12),(88,'id_chave_tipo_token',12),(89,'id_chave_tipo_flexao',12),(90,'id_chave_tipo_elemento_sintatico',12),(91,'id_chave_pessoa',12),(92,'id_chave_cargo_comissionado',12),(93,'id_chave_setor',12);
/*!40000 ALTER TABLE `valores_discretos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `versoes`
--

DROP TABLE IF EXISTS `versoes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `versoes` (
  `id_chave_versao` int(11) NOT NULL AUTO_INCREMENT,
  `nome_versao` timestamp(6) NOT NULL DEFAULT current_timestamp(6),
  `id_secao` int(11) DEFAULT NULL,
  `trecho` varchar(3500) DEFAULT NULL,
  PRIMARY KEY (`id_chave_versao`),
  UNIQUE KEY `id_secao` (`id_secao`,`nome_versao`),
  CONSTRAINT `versoes_ibfk_1` FOREIGN KEY (`id_secao`) REFERENCES `secoes` (`id_chave_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=166 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `versoes`
--

LOCK TABLES `versoes` WRITE;
/*!40000 ALTER TABLE `versoes` DISABLE KEYS */;
INSERT INTO `versoes` VALUES (92,'2023-09-26 20:04:02.455485',1,'raiz'),(93,'2023-09-26 20:04:02.455485',61,'A lista abaixo traz todas as estruturas de sentenças para avaliação de atividades da Fundacentro'),(94,'2023-09-26 20:04:02.455485',62,'1'),(95,'2023-09-26 20:04:02.455485',63,'Sentença com predicado, objeto direto e objeto indireto.'),(96,'2023-09-26 20:04:02.455485',64,'Exemplo: \"Elaborar projeto completo para órgão fomentador\"'),(97,'2023-09-26 20:04:02.455485',65,'7'),(98,'2023-09-26 20:04:02.455485',66,'Exemplo: \"Publicar artigo científico em revista indexada\"'),(99,'2023-09-26 20:04:02.455485',67,'11'),(100,'2023-09-26 20:04:02.455485',68,'10'),(101,'2023-09-26 20:04:02.455485',69,'Exemplo: \"um resumo estendido\"'),(102,'2023-09-26 20:04:02.455485',70,'artigo do objeto direto'),(103,'2023-09-26 20:04:02.455485',71,'substantivo do objeto direto'),(104,'2023-09-26 20:04:02.455485',72,'adjetivo do objeto direto'),(105,'2023-09-26 20:04:02.455485',73,'11'),(106,'2023-09-26 20:04:02.455485',74,'Exemplo: \"para um congresso científico\"'),(107,'2023-09-26 20:04:02.455485',75,'preposição do objeto indireto'),(108,'2023-09-26 20:04:02.455485',76,'artigo do objeto indireto'),(109,'2023-09-26 20:04:02.455485',77,'substantivo do objeto indireto'),(110,'2023-09-26 20:04:02.455485',78,'adjetivo do objeto indireto'),(111,'2023-09-26 20:04:02.455485',79,'2'),(112,'2023-09-26 20:04:02.455485',80,'Sentença com sujeito, verbo, objeto direto e objeto indireto.'),(113,'2023-09-26 20:04:02.455485',81,'Exemplo: \"Servidor elaborou projeto completo para órgão fomentador\"'),(114,'2023-09-26 20:04:02.455485',82,'3'),(115,'2023-09-26 20:04:02.455485',83,'Exemplo \"Um pesquisador\"'),(116,'2023-09-26 20:04:02.455485',84,'artigo do sujeito'),(117,'2023-09-26 20:04:02.455485',85,'substantivo do sujeito'),(118,'2023-09-26 20:04:02.455485',86,'7'),(119,'2023-09-26 20:04:02.455485',87,'Exemplo: \"apresentou trabalho resumido em congresso científico\"'),(120,'2023-09-26 20:04:02.455485',88,'verbo no predicado'),(121,'2023-09-26 20:04:02.455485',89,'10'),(122,'2023-09-26 20:04:02.455485',90,'Exemplo: \"um resumo estendido\"'),(123,'2023-09-26 20:04:02.455485',91,'artigo do objeto direto'),(124,'2023-09-26 20:04:02.455485',92,'substantivo do objeto direto'),(125,'2023-09-26 20:04:02.455485',93,'adjetivo do objeto direto'),(126,'2023-09-26 20:04:02.455485',94,'11'),(127,'2023-09-26 20:04:02.455485',95,'Exemplo: \"para um congresso científico\"'),(128,'2023-09-26 20:04:02.455485',96,'preposição do objeto indireto'),(129,'2023-09-26 20:04:02.455485',97,'artigo do objeto indireto'),(130,'2023-09-26 20:04:02.455485',98,'substantivo do objeto indireto'),(131,'2023-09-26 20:04:02.455485',99,'adjetivo do objeto indireto'),(132,'2023-09-26 20:04:02.455485',100,'12'),(133,'2023-09-26 20:04:02.455485',101,'11'),(134,'2023-09-26 20:04:02.455485',102,'teste'),(155,'2023-09-26 20:04:34.205238',103,'13'),(156,'2023-09-26 20:04:45.153813',104,'entrega com substantivação'),(157,'2023-09-26 20:06:26.345464',104,'Expressão nominal, sem verbos'),(158,'2023-09-26 20:06:42.663150',104,'Expressão nominal, sem verbos, baseada numa substantivação da ação'),(159,'2023-09-26 20:17:48.885569',105,'8'),(160,'2023-09-26 20:29:31.468744',106,'preposição, mais frequentemente de'),(161,'2023-09-26 20:30:08.112688',107,'substantivos'),(162,'2023-09-26 20:30:47.032613',108,'preposição, mais frequentemente me'),(163,'2023-09-26 20:31:21.175505',109,'substantivos'),(164,'2023-09-26 20:33:06.296731',110,'adjetivo'),(165,'2023-09-26 20:33:29.997255',111,'adjetivo');
/*!40000 ALTER TABLE `versoes` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER grava_id_de_referencia
BEFORE INSERT ON versoes
FOR EACH ROW
BEGIN
	DECLARE c varchar(26) DEFAULT "abcdefghijklmnopqrstuvwxyz";
	DECLARE conta INT DEFAULT 0;
	DECLARE conta2 INT DEFAULT 0;
	DECLARE identificador varchar(200) DEFAULT "";
	DECLARE velho_identificador varchar(200) DEFAULT "";
	DECLARE TEMP varchar(200) DEFAULT "";	
	IF  NEW.id_secao IN (SELECT id_chave_categoria from secoes where id_tipo_secao = (SELECT id_chave_nested_tipo_secao FROM nested_tipos_secoes WHERE nome_nested_tipo_secao = "item_de_referencia")) THEN
    DELETE FROM ids_de_referencia WHERE id_secao_do_identificador = NEW.id_secao; 
	SET identificador =  SUBSTRING(NEW.trecho, position("[" IN NEW.trecho)+1, position("]" IN NEW.trecho) - position("[" IN NEW.trecho) -1);
	SET velho_identificador = identificador;
	SET temp = identificador;
	WHILE temp IN (SELECT nome_id_de_referencia from ids_de_referencia) DO
	 IF conta > 26 THEN
	 	SET conta2 = conta2 + 1;
	 	SET identificador = CONCAT(identificador, SUBSTR(c, conta2, 1));
		SET conta=0;
	 END IF;
	 SET conta = conta + 1;
	 SET temp = CONCAT(identificador, SUBSTR(c,conta,1));
	 IF conta2>26 THEN
	 	SET conta2=0;
	 END IF;
	END WHILE;
	SET identificador = temp;
	INSERT INTO ids_de_referencia (nome_id_de_referencia, id_secao_do_identificador) VALUES 
			(
				(
				CASE 	
					WHEN identificador = "" THEN NULL
					ELSE identificador 
			 	END
				)
			,
			NEW.id_secao
			)  
			ON DUPLICATE KEY 
			UPDATE nome_id_de_referencia = 
			CASE 	
				WHEN identificador = "" THEN NULL
				ELSE identificador 
		 	END
			,
			id_secao_do_identificador = NEW.id_secao;
  	SET NEW.trecho = REPLACE(NEW.trecho, CONCAT("[",velho_identificador,"]"), CONCAT("[",identificador,"]"));
	END IF;
	END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-03 15:43:02
