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
-- Table structure for table `evidencias`
--

DROP TABLE IF EXISTS `evidencias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evidencias` (
  `id_chave_evidencia` int(11) NOT NULL AUTO_INCREMENT,
  `nome_evidencia` varchar(500) DEFAULT NULL,
  `id_tipo_de_evidencia` int(11) DEFAULT NULL,
  `titulo` varchar(500) DEFAULT NULL,
  `data` date DEFAULT NULL,
  `time_stamp` timestamp(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  PRIMARY KEY (`id_chave_evidencia`),
  UNIQUE KEY `nome_evidencia` (`nome_evidencia`),
  UNIQUE KEY `titulo` (`titulo`,`data`),
  KEY `id_tipo_de_evidencia` (`id_tipo_de_evidencia`),
  CONSTRAINT `evidencias_ibfk_1` FOREIGN KEY (`id_tipo_de_evidencia`) REFERENCES `tipos_de_evidencias` (`id_chave_tipo_de_evidencia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evidencias`
--

LOCK TABLES `evidencias` WRITE;
/*!40000 ALTER TABLE `evidencias` DISABLE KEYS */;
/*!40000 ALTER TABLE `evidencias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evidencias_tipos_de_identificadores`
--

DROP TABLE IF EXISTS `evidencias_tipos_de_identificadores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evidencias_tipos_de_identificadores` (
  `id_chave_evidencia_tipo_de_identificador` int(11) NOT NULL AUTO_INCREMENT,
  `nome_evidencia_tipo_de_identificador` varchar(200) DEFAULT NULL,
  `id_tipo_de_identificador` int(11) DEFAULT NULL,
  `id_evidencia` int(11) DEFAULT NULL,
  `valor` varchar(255) DEFAULT NULL,
  `time_stamp` timestamp(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  PRIMARY KEY (`id_chave_evidencia_tipo_de_identificador`),
  UNIQUE KEY `nome_evidencia_tipo_de_identificador` (`nome_evidencia_tipo_de_identificador`),
  KEY `id_tipo_de_identificador` (`id_tipo_de_identificador`),
  KEY `id_evidencia` (`id_evidencia`),
  CONSTRAINT `evidencias_tipos_de_identificadores_ibfk_1` FOREIGN KEY (`id_tipo_de_identificador`) REFERENCES `tipos_de_identificadores` (`id_chave_tipo_de_identificador`),
  CONSTRAINT `evidencias_tipos_de_identificadores_ibfk_2` FOREIGN KEY (`id_evidencia`) REFERENCES `evidencias` (`id_chave_evidencia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evidencias_tipos_de_identificadores`
--

LOCK TABLES `evidencias_tipos_de_identificadores` WRITE;
/*!40000 ALTER TABLE `evidencias_tipos_de_identificadores` DISABLE KEYS */;
/*!40000 ALTER TABLE `evidencias_tipos_de_identificadores` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `frases`
--

LOCK TABLES `frases` WRITE;
/*!40000 ALTER TABLE `frases` DISABLE KEYS */;
INSERT INTO `frases` VALUES (22,'apresentar trabalho científico em congresso científico',1,'2023-10-18 18:24:00.730077'),(23,'apresentar trabalho científico em seminário',1,'2023-10-18 18:25:19.658047'),(24,'apresentar trabalho tecnológico em convenção',1,'2023-10-18 18:26:23.620378'),(25,'publicar trabalho em periódico indexado',1,'2023-10-18 18:30:10.968937'),(26,'publicar capítulo em meio científico',1,'2023-10-18 18:33:27.005356'),(27,'publicar artigo científico',1,'2023-10-18 19:23:49.809364'),(28,'publicar artigo tecnológico de relatório diverso',1,'2023-10-18 19:28:31.209061'),(29,'publicar artigo científico de relatório diverso',1,'2023-10-18 19:47:29.151930'),(30,'publicar capítulo de livro tecnológico',1,'2023-10-18 20:19:27.984460'),(31,'elaborar conteúdo didático a Fundacentro',1,'2023-10-19 12:10:35.282277'),(33,'elaborar conteúdo didático a cartilha',1,'2023-10-19 12:12:04.409274'),(34,'elaborar conteúdo didático a apostila',1,'2023-10-19 12:12:52.349785'),(35,'revisar artigo científico em periódico',1,'2023-10-19 12:15:54.017896'),(36,'avaliar artigo científico em periódico',1,'2023-10-19 12:17:42.071718'),(37,'planejar atividade de pesquisa',1,'2023-10-19 12:51:04.085951'),(38,'elaborar proposta de projeto interno',1,'2023-10-19 13:13:23.075893'),(39,'avaliar proposta de projeto interno',1,'2023-10-19 13:15:59.387393'),(40,'elaborar projeto de fomento',1,'2023-10-19 13:51:57.691264'),(41,'elaborar proposta de fomento',1,'2023-10-19 15:30:26.608443'),(42,'elaborar conteúdo didático para livro',1,'2023-10-19 17:59:09.168101');
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
) ENGINE=InnoDB AUTO_INCREMENT=256 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guarda_ids_da_lixeira`
--

LOCK TABLES `guarda_ids_da_lixeira` WRITE;
/*!40000 ALTER TABLE `guarda_ids_da_lixeira` DISABLE KEYS */;
INSERT INTO `guarda_ids_da_lixeira` VALUES (253,40),(254,41);
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
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `secoes`
--

LOCK TABLES `secoes` WRITE;
/*!40000 ALTER TABLE `secoes` DISABLE KEYS */;
INSERT INTO `secoes` VALUES (1,'corpo_tese','raiz','',1,56,1),(15,'descricao_das_sentencas','A lista abaixo traz todas as estruturas de sentenças para avaliação de atividades da Fundacentro','',2,3,3),(16,'sentenca_1','1','',4,33,2),(17,'auto_2023-09-17_19:36:56.826','Sentença com predicado, objeto direto e objeto indireto.','',5,6,3),(18,'auto_2023-09-18_15:58:01.442','Exemplo: \"Elaborar projeto completo para órgão fomentador\"','',7,8,3),(19,'auto_2023-09-17_10:14:49.595','7','',9,32,2),(20,'auto_2023-09-17_10:21:42.239665','Exemplo: \"Publicar artigo científico em revista indexada\"','',10,11,3),(21,'auto_2023-09-17_19:35:31.913','11','',12,13,5),(22,'auto_2023-09-17_19:39:17.835','10','',14,21,2),(23,'auto_2023-09-17_19:42:40.326822','Exemplo: \"um resumo estendido\"','',15,16,3),(24,'auto_2023-09-17_20:03:05.260','substantivo do objeto direto','',17,18,6),(25,'auto_2023-09-18_15:35:27.566','adjetivo do objeto direto','',19,20,10),(26,'auto_2023-09-17_19:42:24.007','11','',22,31,2),(27,'auto_2023-09-17_19:43:01.420619','Exemplo: \"para um congresso científico\"','',23,24,3),(28,'auto_2023-09-18_15:46:42.999','preposição do objeto indireto','',25,26,8),(29,'auto_2023-09-18_15:48:58.704','substantivo do objeto indireto','',27,28,6),(30,'auto_2023-09-18_15:49:21.558','adjetivo do objeto indireto','',29,30,10),(31,'auto_2023-09-26_17:04:34.201','13','',34,51,2),(32,'auto_2023-09-26_17:04:45.116536','Expressão nominal, sem verbos, baseada numa substantivação da ação','',35,36,3),(33,'auto_2023-09-26_17:17:48.880','8','',37,38,7),(34,'auto_2023-09-26_17:29:31.463','preposição, mais frequentemente de','',39,40,8),(35,'auto_2023-09-26_17:30:08.108','substantivos','',41,42,6),(36,'auto_2023-09-26_17:33:29.989','adjetivo','',43,44,10),(37,'auto_2023-09-26_17:30:47.028','preposição, mais frequentemente me','',45,46,8),(38,'auto_2023-09-26_17:31:21.171','substantivos','',47,48,6),(39,'auto_2023-09-26_17:33:06.292','adjetivo','',49,50,10),(40,'lixeira','12','',52,55,2),(41,'auto_2023-09-17_19:34:45.654','teste','',53,54,3);
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
-- Table structure for table `tipos_de_evidencias`
--

DROP TABLE IF EXISTS `tipos_de_evidencias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipos_de_evidencias` (
  `id_chave_tipo_de_evidencia` int(11) NOT NULL AUTO_INCREMENT,
  `nome_tipo_de_evidencia` varchar(200) DEFAULT NULL,
  `descricao` varchar(500) DEFAULT NULL,
  `id_token` int(11) DEFAULT NULL,
  `time_stamp` timestamp(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  PRIMARY KEY (`id_chave_tipo_de_evidencia`),
  UNIQUE KEY `nome_tipo_de_evidencia` (`nome_tipo_de_evidencia`),
  KEY `id_token` (`id_token`),
  CONSTRAINT `tipos_de_evidencias_ibfk_1` FOREIGN KEY (`id_token`) REFERENCES `tokens` (`id_chave_token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipos_de_evidencias`
--

LOCK TABLES `tipos_de_evidencias` WRITE;
/*!40000 ALTER TABLE `tipos_de_evidencias` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipos_de_evidencias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipos_de_identificadores`
--

DROP TABLE IF EXISTS `tipos_de_identificadores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipos_de_identificadores` (
  `id_chave_tipo_de_identificador` int(11) NOT NULL AUTO_INCREMENT,
  `nome_tipo_de_identificador` varchar(200) DEFAULT NULL,
  `descricao` varchar(500) DEFAULT NULL,
  `time_stamp` timestamp(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  PRIMARY KEY (`id_chave_tipo_de_identificador`),
  UNIQUE KEY `nome_tipo_de_identificador` (`nome_tipo_de_identificador`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipos_de_identificadores`
--

LOCK TABLES `tipos_de_identificadores` WRITE;
/*!40000 ALTER TABLE `tipos_de_identificadores` DISABLE KEYS */;
INSERT INTO `tipos_de_identificadores` VALUES (1,'ISBN',NULL,'2023-10-19 18:05:38.611561'),(2,'DOI',NULL,'2023-10-19 18:05:38.614333'),(3,'ISSN',NULL,'2023-10-19 18:05:38.615153'),(4,'SEI',NULL,'2023-10-19 18:05:38.621926'),(5,'HASH_FILE',NULL,'2023-10-19 18:05:38.622718'),(6,'HASH_URL',NULL,'2023-10-19 18:05:38.623461');
/*!40000 ALTER TABLE `tipos_de_identificadores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipos_de_veiculos`
--

DROP TABLE IF EXISTS `tipos_de_veiculos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipos_de_veiculos` (
  `id_chave_tipo_de_veiculo` int(11) NOT NULL AUTO_INCREMENT,
  `nome_tipo_de_veiculo` varchar(200) DEFAULT NULL,
  `descricao` varchar(500) DEFAULT NULL,
  `id_token` int(11) DEFAULT NULL,
  `time_stamp` timestamp(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  PRIMARY KEY (`id_chave_tipo_de_veiculo`),
  UNIQUE KEY `nome_tipo_de_veiculo` (`nome_tipo_de_veiculo`),
  KEY `id_token` (`id_token`),
  CONSTRAINT `tipos_de_veiculos_ibfk_1` FOREIGN KEY (`id_token`) REFERENCES `tokens` (`id_chave_token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipos_de_veiculos`
--

LOCK TABLES `tipos_de_veiculos` WRITE;
/*!40000 ALTER TABLE `tipos_de_veiculos` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipos_de_veiculos` ENABLE KEYS */;
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
INSERT INTO `tipos_elementos_sintaticos` VALUES (1,'entrega infinitivo','entrega padrão constituída por um verbo que indica a ação realizada sobre um objeto. Esse tipo de sentença não tem sujeito porque o verbo está no infinitivo','2023-10-14 16:29:12.987213'),(2,'entrega com sujeito','entrega padrão constituída por um verbo que indica a ação realizada por um sujeito sobre um objeto. Esse tipo de sentença tem sujeito','2023-10-14 16:29:12.988577'),(3,'sujeito','É o sujeito a quem se refere o predicado','2023-10-14 16:29:12.989424'),(4,'determinantes_do_sujeito','Fazem parte do sujeito, são as palavras que antecedem o núcleo do sujeito, como artigo, pronomes, numerais, etc.','2023-10-14 16:29:12.991855'),(5,'nucleo_sujeito','É o núcleo do sujeito a quem se refere o predicado','2023-10-14 16:29:12.992627'),(6,'modificadores_do_sujeito','É parte do Sujeito, são palavras que suscedem o sujeito para modificá-lo como adjetivos','2023-10-14 16:29:12.993351'),(7,'predicado','É o predicado da sentença, que pode ser predicado verbal, nominal ou verbo-nominal','2023-10-14 16:29:12.995582'),(8,'verbo_do_predicado','É parte do predicado, elemento central que denota uma ação do sujeito','2023-10-14 16:29:12.996490'),(9,'objeto_do_predicado','É o predicado da sentença, que pode ser predicado verbal, nominal ou verbo-nominal','2023-10-14 16:29:12.997283'),(10,'objeto_direto','É o objeto direto do objeto','2023-10-14 16:29:12.999189'),(11,'objeto_indireto','É o objeto indireto do objeto','2023-10-14 16:29:12.999888'),(12,'Lixeira','Lixeira pardão para jogar elementos descartados.','2023-10-14 16:29:13.002393'),(13,'entrega com substantivação','entrega padrão constituída por um verbo que indica a ação realizada por um sujeito sobre um objeto. Esse tipo de sentença tem sujeito','2023-10-14 16:29:13.004734');
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
INSERT INTO `tipos_flexoes` VALUES (1,'radical','radical','2023-10-14 16:29:12.676664'),(2,'singular_feminino','singular_feminino','2023-10-14 16:29:12.681465'),(3,'singular_masculino','singular_masculino','2023-10-14 16:29:12.684472'),(4,'singular_neutro','singular_neutro','2023-10-14 16:29:12.685545'),(5,'plural_feminino','plural_feminino','2023-10-14 16:29:12.687783'),(6,'plural_masculino','plural_masculino','2023-10-14 16:29:12.688607'),(7,'plural_neutro','plural_neutro','2023-10-14 16:29:12.689409'),(8,'substantivacao','substantivação','2023-10-14 16:29:12.691470'),(9,'agentivacao','agentivação','2023-10-14 16:29:12.692300'),(10,'nominalizacao','nominalização','2023-10-14 16:29:12.693112'),(11,'infinitivo','infinitivo','2023-10-14 16:29:12.695291'),(12,'passado','passado','2023-10-14 16:29:12.698142'),(13,'presente','presente','2023-10-14 16:29:12.700086'),(14,'participio','particípio','2023-10-14 16:29:12.700929');
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
INSERT INTO `tipos_flexoes_tipos_tokens` VALUES (1,'verbo_infinitivo',1,11,'2023-10-14 16:29:12.838680'),(2,'verbo_passado',1,12,'2023-10-14 16:29:12.847250'),(3,'verbo_presente',1,13,'2023-10-14 16:29:12.852329'),(4,'verbo_participio',1,14,'2023-10-14 16:29:12.853367'),(5,'verbo_flexao_definida_infinitivo',2,11,'2023-10-14 16:29:12.855651'),(6,'verbo_flexao_definida_passado',2,12,'2023-10-14 16:29:12.856643'),(7,'verbo_flexao_definida_presente',2,13,'2023-10-14 16:29:12.857519'),(8,'verbo_flexao_definida_participio',2,14,'2023-10-14 16:29:12.860036'),(9,'substantivo_singular_neutro',3,4,'2023-10-14 16:29:12.863330'),(10,'substantivo_singular_masculino',3,3,'2023-10-14 16:29:12.865450'),(11,'substantivo_singular_feminino',3,2,'2023-10-14 16:29:12.867529'),(12,'substantivo_plural_neutro',3,7,'2023-10-14 16:29:12.868431'),(13,'substantivo_plural_masculino',3,6,'2023-10-14 16:29:12.869509'),(14,'substantivo_plural_feminino',3,5,'2023-10-14 16:29:12.872061'),(15,'substantivo_substantivacao',3,8,'2023-10-14 16:29:12.872978'),(16,'substantivo_agentivacao',3,9,'2023-10-14 16:29:12.875047'),(17,'substantivo_nominalizacao',3,10,'2023-10-14 16:29:12.875923'),(18,'substantivo_flexao_definida_singular_neutro',4,4,'2023-10-14 16:29:12.876844'),(19,'substantivo_flexao_definida_singular_masculino',4,3,'2023-10-14 16:29:12.879445'),(20,'substantivo_flexao_definida_singular_feminino',4,2,'2023-10-14 16:29:12.880445'),(21,'substantivo_flexao_definida_plural_neutro',4,7,'2023-10-14 16:29:12.881476'),(22,'substantivo_flexao_definida_plural_masculino',4,6,'2023-10-14 16:29:12.883511'),(23,'substantivo_flexao_definida_plural_feminino',4,5,'2023-10-14 16:29:12.884369'),(24,'substantivo_flexao_definida_substantivacao',4,8,'2023-10-14 16:29:12.885250'),(25,'substantivo_flexao_definida_agentivacao',4,9,'2023-10-14 16:29:12.890575'),(26,'substantivo_flexao_definida_nominalizacao',4,10,'2023-10-14 16:29:12.893080'),(27,'adjetivo_singular_neutro',7,4,'2023-10-14 16:29:12.896623'),(28,'adjetivo_singular_masculino',7,3,'2023-10-14 16:29:12.897542'),(29,'adjetivo_singular_feminino',7,2,'2023-10-14 16:29:12.900749'),(30,'adjetivo_plural_neutro',7,7,'2023-10-14 16:29:12.903063'),(31,'adjetivo_plural_masculino',7,6,'2023-10-14 16:29:12.903936'),(32,'adjetivo_plural_feminino',7,5,'2023-10-14 16:29:12.904724'),(33,'preposicao_singular_neutro',5,4,'2023-10-14 16:29:12.907958'),(34,'preposicao_singular_masculino',5,3,'2023-10-14 16:29:12.908982'),(35,'preposicao_singular_feminino',5,2,'2023-10-14 16:29:12.911240'),(36,'preposicao_plural_neutro',5,7,'2023-10-14 16:29:12.912542'),(37,'preposicao_plural_masculino',5,6,'2023-10-14 16:29:12.913789'),(38,'preposicao_plural_feminino',5,5,'2023-10-14 16:29:12.917017'),(39,'artigo_singular_neutro',9,4,'2023-10-14 16:29:12.920023'),(40,'artigo_singular_masculino',9,3,'2023-10-14 16:29:12.920995'),(41,'artigo_singular_feminino',9,2,'2023-10-14 16:29:12.923129'),(42,'artigo_plural_neutro',9,7,'2023-10-14 16:29:12.925493'),(43,'artigo_plural_masculino',9,6,'2023-10-14 16:29:12.928497'),(44,'artigo_plural_feminino',9,5,'2023-10-14 16:29:12.929648');
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
INSERT INTO `tipos_tokens` VALUES (1,'verbo','verbo','verbo','2023-10-14 16:29:12.763548'),(2,'verbo_flexao_definida','verbo com flexão definida','verbo','2023-10-14 16:29:12.763548'),(3,'substantivo','substantivo','substantivo','2023-10-14 16:29:12.764733'),(4,'substantivo_flexao_definida','substantivo com flexão definida','substantivo','2023-10-14 16:29:12.764733'),(5,'preposicao','preposição','preposicao','2023-10-14 16:29:12.767347'),(6,'preposicao_fixa','preposição instanciada num valor fixo','preposicao','2023-10-14 16:29:12.767347'),(7,'adjetivo','adjetivo','adjetivo','2023-10-14 16:29:12.768736'),(8,'pronome','pronome','pronome','2023-10-14 16:29:12.771171'),(9,'artigo','artigo','artigo','2023-10-14 16:29:12.772257'),(10,'conjuncao','conjunção','conjuncao','2023-10-14 16:29:12.773220'),(11,'interjeicao','interjeição','interjeicao','2023-10-14 16:29:12.775399'),(12,'numeral','numeral','numeral','2023-10-14 16:29:12.776287'),(13,'adverbio','advérbio','adverbio','2023-10-14 16:29:12.779788');
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
INSERT INTO `tokens` VALUES (1,'elaborar',1,NULL,11,'2023-10-14 16:29:16.771981'),(2,'publicar',1,NULL,11,'2023-10-14 16:29:16.773219'),(3,'avaliar',1,NULL,11,'2023-10-14 16:29:16.776875'),(4,'revisar',1,NULL,11,'2023-10-14 16:29:16.781002'),(5,'planejar',1,NULL,11,'2023-10-14 16:29:16.784083'),(6,'gerir',1,NULL,11,'2023-10-14 16:29:16.785068'),(7,'participar',1,NULL,11,'2023-10-14 16:29:16.787113'),(8,'apresentar',1,NULL,11,'2023-10-14 16:29:16.788067'),(9,'estabelecer',1,NULL,11,'2023-10-14 16:29:16.789083'),(10,'credenciar',1,NULL,11,'2023-10-14 16:29:16.792749'),(11,'apoiar',1,NULL,11,'2023-10-14 16:29:16.794809'),(12,'realizar',1,NULL,11,'2023-10-14 16:29:16.795633'),(13,'desenvolver',1,NULL,11,'2023-10-14 16:29:16.796503'),(14,'atuar',1,NULL,11,'2023-10-14 16:29:16.797345'),(15,'supervisionar',1,NULL,11,'2023-10-14 16:29:16.799366'),(16,'especificar',1,NULL,11,'2023-10-14 16:29:16.801218'),(17,'informar',1,NULL,11,'2023-10-14 16:29:16.803518'),(18,'proceder',1,NULL,11,'2023-10-14 16:29:16.804407'),(19,'contratar',1,NULL,11,'2023-10-14 16:29:16.805184'),(20,'relatar',1,NULL,11,'2023-10-14 16:29:16.807232'),(21,'propor',1,NULL,11,'2023-10-14 16:29:16.808030'),(22,'indexar',1,NULL,11,'2023-10-14 16:29:16.808824'),(23,'debater',1,NULL,11,'2023-10-14 16:29:16.811315'),(24,'reunir',1,NULL,11,'2023-10-14 16:29:16.812073'),(25,'fomentar',1,NULL,11,'2023-10-14 16:29:16.812880'),(26,'trabalhar',1,NULL,11,'2023-10-14 16:29:16.814909'),(27,'comprar',1,NULL,11,'2023-10-14 16:29:16.815740'),(28,'processar',1,NULL,11,'2023-10-14 16:29:16.816822'),(29,'entregar',1,NULL,11,'2023-10-14 16:29:16.819271'),(30,'pesquisar',1,NULL,11,'2023-10-14 16:29:16.821276'),(31,'projetar',1,NULL,11,'2023-10-14 16:29:16.823236'),(32,'servir',1,NULL,11,'2023-10-14 16:29:16.824002'),(33,'colaborar',1,NULL,11,'2023-10-14 16:29:16.824760'),(34,'graduar',1,NULL,11,'2023-10-14 16:29:16.829728'),(35,'pós-graduar',1,NULL,11,'2023-10-14 16:29:16.832453'),(36,'organizar',1,NULL,11,'2023-10-14 16:29:16.833395'),(37,'ensinar',1,NULL,11,'2023-10-14 16:29:16.835555'),(38,'palestrar',1,NULL,11,'2023-10-14 16:29:16.837054'),(39,'proteger',1,NULL,11,'2023-10-14 16:29:16.839107'),(40,'interessar',1,NULL,11,'2023-10-14 16:29:16.840417'),(41,'coletar',1,NULL,11,'2023-10-14 16:29:16.841388'),(42,'analisar',1,NULL,11,'2023-10-14 16:29:16.843695'),(43,'controlar',1,NULL,11,'2023-10-14 16:29:16.844477'),(44,'apostilar',1,NULL,11,'2023-10-14 16:29:16.845425'),(45,'elaboração',3,1,8,'2023-10-14 16:29:16.849048'),(46,'publicação',3,2,8,'2023-10-14 16:29:16.852862'),(47,'avaliação',3,3,8,'2023-10-14 16:29:16.855304'),(48,'revisão',3,4,8,'2023-10-14 16:29:16.856156'),(49,'revisor',3,4,9,'2023-10-14 16:29:16.857695'),(50,'planejamento',3,5,8,'2023-10-14 16:29:16.860282'),(51,'plano',3,5,10,'2023-10-14 16:29:16.861324'),(52,'gestão',3,6,8,'2023-10-14 16:29:16.863493'),(53,'participação',3,7,8,'2023-10-14 16:29:16.864494'),(54,'apresentação',3,8,8,'2023-10-14 16:29:16.865446'),(55,'estabelecimento',3,9,8,'2023-10-14 16:29:16.867563'),(56,'credenciamento',3,10,8,'2023-10-14 16:29:16.868709'),(57,'credencial',3,10,10,'2023-10-14 16:29:16.870875'),(58,'apoio',3,11,8,'2023-10-14 16:29:16.871754'),(59,'realização',3,12,8,'2023-10-14 16:29:16.872565'),(60,'desenvolvimento',3,13,8,'2023-10-14 16:29:16.873742'),(61,'atuação',3,14,8,'2023-10-14 16:29:16.876101'),(62,'supervisão',3,15,8,'2023-10-14 16:29:16.876944'),(63,'supervisor',3,15,9,'2023-10-14 16:29:16.878839'),(64,'especificação',3,16,8,'2023-10-14 16:29:16.880979'),(65,'informação',3,17,8,'2023-10-14 16:29:16.883712'),(66,'procedimento',3,18,8,'2023-10-14 16:29:16.884622'),(67,'contratação',3,19,8,'2023-10-14 16:29:16.885648'),(68,'contrato',3,19,10,'2023-10-14 16:29:16.887620'),(69,'relato',3,20,8,'2023-10-14 16:29:16.888464'),(70,'relator',3,20,9,'2023-10-14 16:29:16.889319'),(71,'proposição',3,21,8,'2023-10-14 16:29:16.891776'),(72,'indexação',3,22,8,'2023-10-14 16:29:16.892739'),(73,'debate',3,23,8,'2023-10-14 16:29:16.894815'),(74,'reunião',3,24,8,'2023-10-14 16:29:16.895813'),(75,'fomento',3,25,8,'2023-10-14 16:29:16.897055'),(76,'trabalho',3,26,8,'2023-10-14 16:29:16.899425'),(77,'compra',3,27,8,'2023-10-14 16:29:16.900575'),(78,'processamento',3,28,8,'2023-10-14 16:29:16.903380'),(79,'processo',3,28,10,'2023-10-14 16:29:16.904336'),(80,'entrega',3,29,8,'2023-10-14 16:29:16.905267'),(81,'pesquisa',3,30,8,'2023-10-14 16:29:16.907741'),(82,'projeção',3,31,8,'2023-10-14 16:29:16.908697'),(83,'projeto',3,31,10,'2023-10-14 16:29:16.913398'),(84,'projetista',3,31,9,'2023-10-14 16:29:16.915603'),(85,'serviço',3,32,10,'2023-10-14 16:29:16.916588'),(86,'servidor',3,32,9,'2023-10-14 16:29:16.918791'),(87,'colaboração',3,33,8,'2023-10-14 16:29:16.920987'),(88,'colaborador',3,33,9,'2023-10-14 16:29:16.924504'),(89,'graduação',3,34,8,'2023-10-14 16:29:16.926904'),(90,'graduado',3,34,9,'2023-10-14 16:29:16.928029'),(91,'pós-graduação',3,35,8,'2023-10-14 16:29:16.929567'),(92,'pós-graduado',3,35,9,'2023-10-14 16:29:16.931776'),(93,'organização',3,36,8,'2023-10-14 16:29:16.932760'),(94,'organizador',3,36,9,'2023-10-14 16:29:16.935718'),(95,'ensino',3,37,8,'2023-10-14 16:29:16.936701'),(96,'palestra',3,38,8,'2023-10-14 16:29:16.939414'),(97,'proteção',3,39,8,'2023-10-14 16:29:16.941737'),(98,'protetor',3,39,9,'2023-10-14 16:29:16.943870'),(99,'interesse',3,40,8,'2023-10-14 16:29:16.944860'),(100,'interessado',3,40,9,'2023-10-14 16:29:16.946943'),(101,'coleta',3,41,8,'2023-10-14 16:29:16.947977'),(102,'coletor',3,41,9,'2023-10-14 16:29:16.949349'),(103,'análise',3,42,8,'2023-10-14 16:29:16.951656'),(104,'analista',3,42,9,'2023-10-14 16:29:16.952715'),(105,'controle',3,43,8,'2023-10-14 16:29:16.954901'),(106,'controlador',3,43,9,'2023-10-14 16:29:16.955893'),(107,'apostilamento',3,44,8,'2023-10-14 16:29:16.956938'),(108,'apostila',3,44,10,'2023-10-14 16:29:16.962628'),(109,'elaborei',1,1,12,'2023-10-14 16:29:16.965487'),(110,'publiquei',1,2,12,'2023-10-14 16:29:16.968107'),(111,'avaliei',1,3,12,'2023-10-14 16:29:16.969263'),(112,'revisei',1,4,12,'2023-10-14 16:29:16.971842'),(113,'planejei',1,5,12,'2023-10-14 16:29:16.972905'),(114,'geri',1,6,12,'2023-10-14 16:29:16.975822'),(115,'participei',1,7,12,'2023-10-14 16:29:16.977018'),(116,'apresentei',1,8,12,'2023-10-14 16:29:17.001732'),(117,'estabeleci',1,9,12,'2023-10-14 16:29:17.004045'),(118,'credenciei',1,10,12,'2023-10-14 16:29:17.005184'),(119,'apoiei',1,11,12,'2023-10-14 16:29:17.007794'),(120,'realizei',1,12,12,'2023-10-14 16:29:17.008919'),(121,'desenvolvi',1,13,12,'2023-10-14 16:29:17.011681'),(122,'atuei',1,14,12,'2023-10-14 16:29:17.012719'),(123,'supervisionei',1,15,12,'2023-10-14 16:29:17.014885'),(124,'especifiquei',1,16,12,'2023-10-14 16:29:17.016124'),(125,'informei',1,17,12,'2023-10-14 16:29:17.017215'),(126,'procedi',1,18,12,'2023-10-14 16:29:17.019483'),(127,'contratei',1,19,12,'2023-10-14 16:29:17.020829'),(128,'relatei',1,20,12,'2023-10-14 16:29:17.023043'),(129,'propús',1,21,12,'2023-10-14 16:29:17.024306'),(130,'indexei',1,22,12,'2023-10-14 16:29:17.025436'),(131,'reuní',1,24,12,'2023-10-14 16:29:17.029015'),(132,'fomentei',1,25,12,'2023-10-14 16:29:17.032099'),(133,'trabalhei',1,26,12,'2023-10-14 16:29:17.033205'),(134,'processei',1,28,12,'2023-10-14 16:29:17.036003'),(135,'entreguei',1,29,12,'2023-10-14 16:29:17.037343'),(136,'pesquisei',1,30,12,'2023-10-14 16:29:17.040696'),(137,'projetei',1,31,12,'2023-10-14 16:29:17.043530'),(138,'servi',1,32,12,'2023-10-14 16:29:17.044974'),(139,'colaborei',1,33,12,'2023-10-14 16:29:17.050516'),(140,'graduei',1,34,12,'2023-10-14 16:29:17.052933'),(141,'pós-graduei',1,35,12,'2023-10-14 16:29:17.057761'),(142,'organizei',1,36,12,'2023-10-14 16:29:17.076822'),(143,'ensinei',1,37,12,'2023-10-14 16:29:17.081407'),(144,'palestrei',1,38,12,'2023-10-14 16:29:17.085660'),(145,'protegi',1,39,12,'2023-10-14 16:29:17.088369'),(146,'interessei',1,40,12,'2023-10-14 16:29:17.090849'),(147,'coletei',1,41,12,'2023-10-14 16:29:17.092416'),(148,'analisei',1,42,12,'2023-10-14 16:29:17.093735'),(149,'controlei',1,43,12,'2023-10-14 16:29:17.096289'),(150,'comprei',1,27,12,'2023-10-14 16:29:17.098647'),(151,'debatí',1,23,12,'2023-10-14 16:29:17.101763'),(152,'apostilei',1,44,12,'2023-10-14 16:29:17.104187'),(153,'elaborado',1,1,14,'2023-10-14 16:29:17.105400'),(154,'publicado',1,2,14,'2023-10-14 16:29:17.108128'),(155,'avaliado',1,3,14,'2023-10-14 16:29:17.109448'),(156,'revisado',1,4,14,'2023-10-14 16:29:17.112233'),(157,'planejado',1,5,14,'2023-10-14 16:29:17.113400'),(158,'gerido',1,6,14,'2023-10-14 16:29:17.115686'),(159,'participado',1,7,14,'2023-10-14 16:29:17.116734'),(160,'apresentado',1,8,14,'2023-10-14 16:29:17.118821'),(161,'estabelecido',1,9,14,'2023-10-14 16:29:17.120021'),(162,'credenciado',1,10,14,'2023-10-14 16:29:17.121203'),(163,'apoiado',1,11,14,'2023-10-14 16:29:17.123812'),(164,'realizado',1,12,14,'2023-10-14 16:29:17.124819'),(165,'desenvolvido',1,13,14,'2023-10-14 16:29:17.126934'),(166,'atuado',1,14,14,'2023-10-14 16:29:17.127948'),(167,'supervisionado',1,15,14,'2023-10-14 16:29:17.129202'),(168,'especificado',1,16,14,'2023-10-14 16:29:17.131661'),(169,'informado',1,17,14,'2023-10-14 16:29:17.134136'),(170,'procedido',1,18,14,'2023-10-14 16:29:17.136917'),(171,'contratado',1,19,14,'2023-10-14 16:29:17.139520'),(172,'relatado',1,20,14,'2023-10-14 16:29:17.140482'),(173,'proposto',1,21,14,'2023-10-14 16:29:17.143140'),(174,'indexado',1,22,14,'2023-10-14 16:29:17.144402'),(175,'reunido',1,24,14,'2023-10-14 16:29:17.145450'),(176,'fomentado',1,25,14,'2023-10-14 16:29:17.148087'),(177,'trabalhado',1,26,14,'2023-10-14 16:29:17.149114'),(178,'processado',1,28,14,'2023-10-14 16:29:17.151409'),(179,'entregue',1,29,14,'2023-10-14 16:29:17.152497'),(180,'projetado',1,31,14,'2023-10-14 16:29:17.153469'),(181,'servido',1,32,14,'2023-10-14 16:29:17.155788'),(182,'colaborado',1,33,14,'2023-10-14 16:29:17.156841'),(183,'organizado',1,36,14,'2023-10-14 16:29:17.159508'),(184,'ensinado',1,37,14,'2023-10-14 16:29:17.161841'),(185,'palestrado',1,38,14,'2023-10-14 16:29:17.164039'),(186,'protegido',1,39,14,'2023-10-14 16:29:17.164981'),(187,'coletado',1,41,14,'2023-10-14 16:29:17.167032'),(188,'analisado',1,42,14,'2023-10-14 16:29:17.168194'),(189,'controlado',1,43,14,'2023-10-14 16:29:17.169270'),(190,'comprado',1,27,14,'2023-10-14 16:29:17.171545'),(191,'debatido',1,23,14,'2023-10-14 16:29:17.172544'),(192,'pesquisado',1,30,14,'2023-10-14 16:29:17.174536'),(193,'apostilado',1,44,14,'2023-10-14 16:29:17.175668'),(194,'artigo',3,NULL,1,'2023-10-14 16:29:17.177126'),(195,'livro',3,NULL,1,'2023-10-14 16:29:17.179114'),(196,'capítulo',3,NULL,1,'2023-10-14 16:29:17.180158'),(197,'cartilha',3,NULL,1,'2023-10-14 16:29:17.181303'),(198,'material',3,NULL,1,'2023-10-14 16:29:17.183683'),(199,'relatório',3,20,10,'2023-10-14 16:29:17.185058'),(200,'peça',3,NULL,1,'2023-10-14 16:29:17.187201'),(201,'conteúdo',3,NULL,1,'2023-10-14 16:29:17.188256'),(202,'proposta',3,21,10,'2023-10-14 16:29:17.189358'),(203,'proponente',3,21,9,'2023-10-14 16:29:17.192425'),(204,'periódico',3,NULL,1,'2023-10-14 16:29:17.194809'),(205,'órgão',3,NULL,1,'2023-10-14 16:29:17.196987'),(206,'parecer',3,NULL,1,'2023-10-14 16:29:17.199963'),(207,'comunidade',3,NULL,1,'2023-10-14 16:29:17.201426'),(208,'meio',3,NULL,1,'2023-10-14 16:29:17.203760'),(209,'Fundacentro',3,NULL,1,'2023-10-14 16:29:17.205078'),(210,'congresso',3,NULL,1,'2023-10-14 16:29:17.207270'),(211,'seminário',3,NULL,1,'2023-10-14 16:29:17.208274'),(212,'oficina',3,NULL,1,'2023-10-14 16:29:17.209224'),(213,'convenção',3,NULL,1,'2023-10-14 16:29:17.211524'),(214,'CNPq',3,NULL,1,'2023-10-14 16:29:17.213159'),(215,'FAPESP',3,NULL,1,'2023-10-14 16:29:17.215651'),(216,'FINEP',3,NULL,1,'2023-10-14 16:29:17.216695'),(217,'saúde',3,NULL,1,'2023-10-14 16:29:17.219700'),(218,'segurança',3,NULL,1,'2023-10-14 16:29:17.221061'),(219,'comissão',3,NULL,1,'2023-10-14 16:29:17.224942'),(220,'evento',3,NULL,9,'2023-10-14 16:29:17.228287'),(221,'trabalhador',3,26,9,'2023-10-14 16:29:17.229294'),(222,'infraestrutura',3,NULL,1,'2023-10-14 16:29:17.231496'),(223,'laboratório',3,NULL,1,'2023-10-14 16:29:17.232431'),(224,'parceiro',3,NULL,1,'2023-10-14 16:29:17.233781'),(225,'equipamento',3,NULL,1,'2023-10-14 16:29:17.236044'),(226,'grupo',3,NULL,1,'2023-10-14 16:29:17.237520'),(227,'rede',3,NULL,1,'2023-10-14 16:29:17.239770'),(228,'pesquisador',3,30,9,'2023-10-14 16:29:17.240780'),(229,'curso',3,NULL,1,'2023-10-14 16:29:17.243196'),(230,'disciplina',3,NULL,1,'2023-10-14 16:29:17.244167'),(231,'modalidade',3,NULL,1,'2023-10-14 16:29:17.247181'),(232,'finalidade',3,NULL,1,'2023-10-14 16:29:17.248246'),(233,'programa',3,NULL,1,'2023-10-14 16:29:17.249197'),(234,'bolsista',3,NULL,1,'2023-10-14 16:29:17.251759'),(235,'nível',3,NULL,1,'2023-10-14 16:29:17.252735'),(236,'iniciação',3,NULL,1,'2023-10-14 16:29:17.255370'),(237,'mestrado',3,NULL,1,'2023-10-14 16:29:17.257566'),(238,'doutorado',3,NULL,1,'2023-10-14 16:29:17.260293'),(239,'extensão',3,NULL,1,'2023-10-14 16:29:17.261516'),(240,'visitante',3,NULL,1,'2023-10-14 16:29:17.263612'),(241,'banca',3,NULL,1,'2023-10-14 16:29:17.264646'),(242,'examinador',3,NULL,1,'2023-10-14 16:29:17.266743'),(243,'conselho',3,NULL,1,'2023-10-14 16:29:17.271059'),(244,'universidade',3,NULL,1,'2023-10-14 16:29:17.273397'),(245,'tema',3,NULL,1,'2023-10-14 16:29:17.275390'),(246,'norma',3,NULL,1,'2023-10-14 16:29:17.276481'),(247,'diretriz',3,NULL,1,'2023-10-14 16:29:17.277463'),(248,'conferência',3,NULL,1,'2023-10-14 16:29:17.279431'),(249,'método',3,NULL,1,'2023-10-14 16:29:17.280310'),(250,'forma',3,NULL,1,'2023-10-14 16:29:17.281267'),(251,'conhecimento',3,NULL,1,'2023-10-14 16:29:17.284075'),(252,'demanda',3,NULL,1,'2023-10-14 16:29:17.285100'),(253,'sociedade',3,NULL,1,'2023-10-14 16:29:17.287220'),(254,'caráter',3,NULL,1,'2023-10-14 16:29:17.288303'),(255,'instrumento',3,NULL,1,'2023-10-14 16:29:17.289200'),(256,'banco',3,NULL,1,'2023-10-14 16:29:17.291875'),(257,'dado',3,NULL,1,'2023-10-14 16:29:17.294142'),(258,'história',3,NULL,1,'2023-10-14 16:29:17.296282'),(259,'atividade',3,NULL,1,'2023-10-14 16:29:17.297196'),(260,'autoridade',3,NULL,1,'2023-10-14 16:29:17.299602'),(261,'competência',3,NULL,1,'2023-10-14 16:29:17.300655'),(262,'ministério',3,NULL,1,'2023-10-14 16:29:17.303384'),(263,'judiciário',3,NULL,1,'2023-10-14 16:29:17.304461'),(264,'união',3,NULL,1,'2023-10-14 16:29:17.305433'),(265,'procurador',3,NULL,1,'2023-10-14 16:29:17.307525'),(266,'polícia',3,NULL,1,'2023-10-14 16:29:17.308460'),(267,'EPI',3,NULL,1,'2023-10-14 16:29:17.309622'),(268,'software',3,NULL,1,'2023-10-14 16:29:17.312396'),(269,'EPC',3,NULL,1,'2023-10-14 16:29:17.313563'),(270,'aplicativo',3,NULL,1,'2023-10-14 16:29:17.316038'),(271,'fórum',3,NULL,1,'2023-10-14 16:29:17.317071'),(272,'em',5,NULL,1,'2023-10-14 16:29:17.321979'),(273,'a',5,NULL,1,'2023-10-14 16:29:17.324372'),(274,'para',5,NULL,1,'2023-10-14 16:29:17.325490'),(275,'de',5,NULL,1,'2023-10-14 16:29:17.338196'),(276,'antes',5,NULL,1,'2023-10-14 16:29:17.340441'),(277,'após',5,NULL,1,'2023-10-14 16:29:17.341462'),(278,'até',5,NULL,1,'2023-10-14 16:29:17.343845'),(279,'com',5,NULL,1,'2023-10-14 16:29:17.344800'),(280,'contra',5,NULL,1,'2023-10-14 16:29:17.347111'),(281,'desde',5,NULL,1,'2023-10-14 16:29:17.348326'),(282,'entre',5,NULL,1,'2023-10-14 16:29:17.349612'),(283,'per',5,NULL,1,'2023-10-14 16:29:17.352197'),(284,'perante',5,NULL,1,'2023-10-14 16:29:17.353319'),(285,'por',5,NULL,1,'2023-10-14 16:29:17.356164'),(286,'sem',5,NULL,1,'2023-10-14 16:29:17.357371'),(287,'sob',5,NULL,1,'2023-10-14 16:29:17.359696'),(288,'sobre',5,NULL,1,'2023-10-14 16:29:17.360670'),(289,'trás',5,NULL,1,'2023-10-14 16:29:17.362721'),(290,'o',9,NULL,1,'2023-10-14 16:29:17.363696'),(291,'um',9,NULL,1,'2023-10-14 16:29:17.366415'),(292,'didático',7,NULL,1,'2023-10-14 16:29:17.368731'),(293,'estratégico',7,NULL,1,'2023-10-14 16:29:17.370784'),(294,'tecnológico',7,NULL,1,'2023-10-14 16:29:17.371673'),(295,'científico',7,NULL,1,'2023-10-14 16:29:17.372594'),(296,'estendido',7,NULL,1,'2023-10-14 16:29:17.374134'),(297,'completo',7,NULL,1,'2023-10-14 16:29:17.376724'),(298,'diverso',7,NULL,1,'2023-10-14 16:29:17.378874'),(299,'indexado',7,NULL,1,'2023-10-14 16:29:17.379788'),(300,'interno',7,NULL,1,'2023-10-14 16:29:17.380718'),(301,'formal',7,NULL,1,'2023-10-14 16:29:17.383339'),(302,'institucional',7,NULL,1,'2023-10-14 16:29:17.384205'),(303,'reconhecido',7,NULL,1,'2023-10-14 16:29:17.385342'),(304,'correlato',7,NULL,1,'2023-10-14 16:29:17.387547'),(305,'superior',7,NULL,1,'2023-10-14 16:29:17.389774'),(306,'público',7,NULL,1,'2023-10-14 16:29:17.395126'),(307,'relacionado',7,NULL,1,'2023-10-14 16:29:17.397310'),(308,'relativo',7,NULL,1,'2023-10-14 16:29:17.399369'),(309,'pertinente',7,NULL,1,'2023-10-14 16:29:17.400261'),(310,'livre',7,NULL,1,'2023-10-14 16:29:17.401851'),(311,'inovador',7,NULL,1,'2023-10-14 16:29:17.403894'),(312,'externo',7,NULL,1,'2023-10-14 16:29:17.404760'),(313,'vinculado',7,NULL,1,'2023-10-14 16:29:17.406795'),(314,'disciplinar',7,NULL,5,'2023-10-14 16:29:17.407829'),(315,'correicional',7,NULL,5,'2023-10-14 16:29:17.408893'),(316,'social',7,NULL,5,'2023-10-14 16:29:17.411927'),(317,'judicial',7,NULL,5,'2023-10-14 16:29:17.413082'),(318,'funcional',7,NULL,5,'2023-10-14 16:29:17.415481'),(319,'contábil',7,NULL,5,'2023-10-14 16:29:17.417099'),(320,'predial',7,NULL,5,'2023-10-14 16:29:17.419709'),(321,'jornalístico',7,NULL,5,'2023-10-14 16:29:17.421043'),(322,'contratual',7,NULL,5,'2023-10-14 16:29:17.423361'),(323,'operacional',7,NULL,5,'2023-10-14 16:29:17.424475'),(324,'firmado',7,NULL,5,'2023-10-14 16:29:17.425429'),(325,'típico',7,NULL,5,'2023-10-14 16:29:17.429597'),(326,'bibliográfico',7,NULL,5,'2023-10-14 16:29:17.431858'),(327,'remoto',7,NULL,5,'2023-10-14 16:29:17.433085'),(328,'similar',7,NULL,5,'2023-10-14 16:29:17.435187'),(329,'sociais',7,316,6,'2023-10-14 16:29:17.438077'),(330,'funcionais',7,318,6,'2023-10-14 16:29:17.440509'),(331,'judiciais',7,317,6,'2023-10-14 16:29:17.442711'),(332,'similares',7,328,6,'2023-10-14 16:29:17.443764'),(333,'contábeis',7,319,6,'2023-10-14 16:29:17.444794'),(334,'operacionais',7,323,6,'2023-10-14 16:29:17.446961'),(335,'prediais',7,320,6,'2023-10-14 16:29:17.448383'),(336,'contratuais',7,322,6,'2023-10-14 16:29:17.449610'),(337,'correicionais',7,315,6,'2023-10-14 16:29:17.451973'),(338,'formais',7,301,6,'2023-10-14 16:29:17.453024'),(339,'institucionais',7,302,6,'2023-10-14 16:29:17.455282'),(340,'pertinentes',7,309,6,'2023-10-14 16:29:17.456336'),(341,'livres',7,310,6,'2023-10-14 16:29:17.457891'),(342,'típicos',7,325,6,'2023-10-14 16:29:17.464513'),(343,'típica',7,325,2,'2023-10-14 16:29:17.467712'),(344,'típicas',7,325,5,'2023-10-14 16:29:17.470396'),(345,'bibliográficos',7,326,6,'2023-10-14 16:29:17.472920'),(346,'bibliográfica',7,326,2,'2023-10-14 16:29:17.475077'),(347,'bibliográficas',7,326,5,'2023-10-14 16:29:17.476577'),(348,'externos',7,312,6,'2023-10-14 16:29:17.478970'),(349,'externa',7,312,2,'2023-10-14 16:29:17.480814'),(350,'externas',7,312,5,'2023-10-14 16:29:17.484867'),(351,'remotos',7,327,6,'2023-10-14 16:29:17.487527'),(352,'remota',7,327,2,'2023-10-14 16:29:17.488668'),(353,'remotas',7,327,5,'2023-10-14 16:29:17.491510'),(354,'firmados',7,324,6,'2023-10-14 16:29:17.492775'),(355,'firmada',7,324,2,'2023-10-14 16:29:17.496206'),(356,'firmadas',7,324,5,'2023-10-14 16:29:17.497440'),(357,'jornalísticos',7,321,6,'2023-10-14 16:29:17.499901'),(358,'jornalística',7,321,2,'2023-10-14 16:29:17.501676'),(359,'jornalísticas',7,321,5,'2023-10-14 16:29:17.506009'),(360,'vinculados',7,313,6,'2023-10-14 16:29:17.508246'),(361,'vinculada',7,313,2,'2023-10-14 16:29:17.509377'),(362,'vinculadas',7,313,5,'2023-10-14 16:29:17.511533'),(363,'estratégicos',7,293,6,'2023-10-14 16:29:17.512703'),(364,'estratégica',7,293,2,'2023-10-14 16:29:17.514942'),(365,'estratégicas',7,293,5,'2023-10-14 16:29:17.516632'),(366,'didáticos',7,292,6,'2023-10-14 16:29:17.519276'),(367,'didática',7,292,2,'2023-10-14 16:29:17.521101'),(368,'didáticas',7,292,5,'2023-10-14 16:29:17.523821'),(369,'reconhecidos',7,303,6,'2023-10-14 16:29:17.525279'),(370,'reconhecida',7,303,2,'2023-10-14 16:29:17.528422'),(371,'reconhecidas',7,303,5,'2023-10-14 16:29:17.530715'),(372,'correlatos',7,304,6,'2023-10-14 16:29:17.531839'),(373,'correlata',7,304,2,'2023-10-14 16:29:17.532923'),(374,'correlatas',7,304,5,'2023-10-14 16:29:17.542404'),(375,'relacionados',7,307,6,'2023-10-14 16:29:17.544915'),(376,'relacionada',7,307,2,'2023-10-14 16:29:17.547640'),(377,'relacionadas',7,307,5,'2023-10-14 16:29:17.564136'),(378,'relativos',7,308,6,'2023-10-14 16:29:17.566837'),(379,'relativa',7,308,2,'2023-10-14 16:29:17.567941'),(380,'relativas',7,308,5,'2023-10-14 16:29:17.569099'),(381,'públicos',7,306,6,'2023-10-14 16:29:17.572141'),(382,'pública',7,306,2,'2023-10-14 16:29:17.573280'),(383,'públicas',7,306,5,'2023-10-14 16:29:17.575712'),(384,'disciplinares',7,314,6,'2023-10-14 16:29:17.576827'),(385,'superiores',7,305,6,'2023-10-14 16:29:17.579351'),(386,'superiora',7,305,2,'2023-10-14 16:29:17.580573'),(387,'superioras',7,305,5,'2023-10-14 16:29:17.583655'),(388,'inovadores',7,311,6,'2023-10-14 16:29:17.584993'),(389,'inovadora',7,311,2,'2023-10-14 16:29:17.587383'),(390,'inovadoras',7,311,5,'2023-10-14 16:29:17.588565'),(391,'tecnológicos',7,294,6,'2023-10-14 16:29:17.603353'),(392,'tecnológica',7,294,2,'2023-10-14 16:29:17.606456'),(393,'tecnológicas',7,294,5,'2023-10-14 16:29:17.608988'),(394,'científicos',7,295,6,'2023-10-14 16:29:17.613792'),(395,'científica',7,295,2,'2023-10-14 16:29:17.616245'),(396,'científicas',7,295,5,'2023-10-14 16:29:17.617459'),(397,'estendidos',7,296,6,'2023-10-14 16:29:17.620199'),(398,'estendida',7,296,2,'2023-10-14 16:29:17.621433'),(399,'estendidas',7,296,5,'2023-10-14 16:29:17.624056'),(400,'completos',7,297,6,'2023-10-14 16:29:17.625450'),(401,'completa',7,297,2,'2023-10-14 16:29:17.627891'),(402,'completas',7,297,5,'2023-10-14 16:29:17.629004'),(403,'diversos',7,298,6,'2023-10-14 16:29:17.632466'),(404,'diversa',7,298,2,'2023-10-14 16:29:17.635155'),(405,'diversas',7,298,5,'2023-10-14 16:29:17.636235'),(406,'indexados',7,299,6,'2023-10-14 16:29:17.637355'),(407,'indexada',7,299,2,'2023-10-14 16:29:17.640185'),(408,'indexadas',7,299,5,'2023-10-14 16:29:17.641593'),(409,'internos',7,300,6,'2023-10-14 16:29:17.644105'),(410,'interna',7,300,2,'2023-10-14 16:29:17.646458'),(411,'internas',7,300,5,'2023-10-14 16:29:17.649373'),(412,'a',9,290,2,'2023-10-14 16:29:17.651645'),(413,'os',9,290,6,'2023-10-14 16:29:17.652732'),(414,'uns',9,291,6,'2023-10-14 16:29:17.655327'),(415,'uma',9,291,2,'2023-10-14 16:29:17.656390'),(416,'umas',9,NULL,5,'2023-10-14 16:29:17.657818'),(417,'as',9,1,5,'2023-10-14 16:29:17.660078'),(418,'da',5,275,2,'2023-10-14 16:29:17.661379'),(419,'do',5,275,3,'2023-10-14 16:29:17.663942'),(420,'das',5,275,5,'2023-10-14 16:29:17.665196'),(421,'dos',5,275,6,'2023-10-14 16:29:17.668136'),(422,'na',5,272,2,'2023-10-14 16:29:17.669291'),(423,'no',5,272,3,'2023-10-14 16:29:17.671795'),(424,'nas',5,272,5,'2023-10-14 16:29:17.672956'),(425,'nos',5,272,6,'2023-10-14 16:29:17.676062');
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
  `id_categoria` int(11) DEFAULT NULL,
  `time_stamp` timestamp(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  PRIMARY KEY (`id_chave_token_na_frase`),
  UNIQUE KEY `id_frase` (`id_frase`,`id_token`,`ordem`),
  KEY `id_token` (`id_token`),
  KEY `id_categoria` (`id_categoria`),
  CONSTRAINT `tokens_nas_frases_ibfk_1` FOREIGN KEY (`id_frase`) REFERENCES `frases` (`id_chave_frase`) ON DELETE CASCADE,
  CONSTRAINT `tokens_nas_frases_ibfk_2` FOREIGN KEY (`id_token`) REFERENCES `tokens` (`id_chave_token`),
  CONSTRAINT `tokens_nas_frases_ibfk_3` FOREIGN KEY (`id_categoria`) REFERENCES `secoes` (`id_chave_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=192 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tokens_nas_frases`
--

LOCK TABLES `tokens_nas_frases` WRITE;
/*!40000 ALTER TABLE `tokens_nas_frases` DISABLE KEYS */;
INSERT INTO `tokens_nas_frases` VALUES (89,'apresentar',22,8,0,21,'2023-10-18 18:24:00.796951'),(90,'trabalho',22,76,1,24,'2023-10-18 18:24:00.872547'),(91,'científico',22,295,2,25,'2023-10-18 18:24:00.877149'),(92,'em',22,272,3,28,'2023-10-18 18:24:00.903172'),(93,'congresso',22,210,4,29,'2023-10-18 18:24:00.908841'),(94,'científico',22,295,5,30,'2023-10-18 18:24:00.914326'),(95,'apresentar',23,8,0,21,'2023-10-18 18:25:19.736399'),(96,'trabalho',23,76,1,24,'2023-10-18 18:25:19.744491'),(97,'científico',23,295,2,25,'2023-10-18 18:25:19.775657'),(98,'em',23,272,3,28,'2023-10-18 18:25:19.781272'),(99,'seminário',23,211,4,29,'2023-10-18 18:25:19.786042'),(100,'apresentar',24,8,0,21,'2023-10-18 18:26:24.049612'),(101,'trabalho',24,76,1,24,'2023-10-18 18:26:24.066691'),(102,'tecnológico',24,294,2,25,'2023-10-18 18:26:24.131192'),(103,'em',24,272,3,28,'2023-10-18 18:26:24.148702'),(104,'convenção',24,213,4,29,'2023-10-18 18:26:24.153131'),(105,'publicar',25,2,0,21,'2023-10-18 18:30:11.013439'),(106,'trabalho',25,76,1,24,'2023-10-18 18:30:11.017664'),(107,'em',25,272,3,28,'2023-10-18 18:30:11.023228'),(108,'periódico',25,204,4,29,'2023-10-18 18:30:11.029309'),(109,'indexado',25,299,5,30,'2023-10-18 18:30:11.056152'),(110,'publicar',26,2,0,21,'2023-10-18 18:33:27.041873'),(111,'capítulo',26,196,1,24,'2023-10-18 18:33:27.098010'),(112,'em',26,272,3,28,'2023-10-18 18:33:27.122090'),(113,'meio',26,208,4,29,'2023-10-18 18:33:27.132388'),(114,'científico',26,295,5,30,'2023-10-18 18:33:27.137479'),(115,'publicar',27,2,0,21,'2023-10-18 19:23:49.824185'),(116,'artigo',27,194,1,24,'2023-10-18 19:23:49.826978'),(117,'científico',27,295,2,25,'2023-10-18 19:23:49.843225'),(118,'publicar',28,2,0,21,'2023-10-18 19:28:31.294268'),(119,'artigo',28,194,1,24,'2023-10-18 19:28:31.503203'),(120,'tecnológico',28,294,2,25,'2023-10-18 19:28:31.510322'),(121,'de',28,275,3,28,'2023-10-18 19:28:31.513827'),(122,'relatório',28,199,4,29,'2023-10-18 19:28:31.637113'),(123,'diverso',28,298,5,30,'2023-10-18 19:28:31.803173'),(124,'publicar',29,2,0,21,'2023-10-18 19:47:29.218064'),(125,'artigo',29,194,1,24,'2023-10-18 19:47:29.222327'),(126,'científico',29,295,2,25,'2023-10-18 19:47:29.227087'),(127,'de',29,275,3,28,'2023-10-18 19:47:29.250791'),(128,'relatório',29,199,4,29,'2023-10-18 19:47:29.253942'),(129,'diverso',29,298,5,30,'2023-10-18 19:47:29.259182'),(130,'publicar',30,2,0,21,'2023-10-18 20:19:28.011482'),(131,'capítulo',30,196,1,24,'2023-10-18 20:19:28.047499'),(132,'de',30,275,3,28,'2023-10-18 20:19:28.052602'),(133,'livro',30,195,4,29,'2023-10-18 20:19:28.079395'),(134,'tecnológico',30,294,5,30,'2023-10-18 20:19:28.080417'),(135,'elaborar',31,1,0,21,'2023-10-19 12:10:35.302494'),(136,'conteúdo',31,201,1,24,'2023-10-19 12:10:35.313092'),(137,'didático',31,292,2,25,'2023-10-19 12:10:35.319053'),(138,'a',31,273,3,28,'2023-10-19 12:10:35.324232'),(139,'Fundacentro',31,209,4,29,'2023-10-19 12:10:35.357618'),(145,'elaborar',33,1,0,21,'2023-10-19 12:12:04.478448'),(146,'conteúdo',33,201,1,24,'2023-10-19 12:12:04.645016'),(147,'didático',33,292,2,25,'2023-10-19 12:12:04.694729'),(148,'a',33,273,3,28,'2023-10-19 12:12:04.719969'),(149,'cartilha',33,197,4,29,'2023-10-19 12:12:04.744984'),(150,'elaborar',34,1,0,21,'2023-10-19 12:12:52.377406'),(151,'conteúdo',34,201,1,24,'2023-10-19 12:12:52.391960'),(152,'didático',34,292,2,25,'2023-10-19 12:12:52.397495'),(153,'a',34,273,3,28,'2023-10-19 12:12:52.404197'),(154,'apostila',34,108,4,29,'2023-10-19 12:12:52.440049'),(155,'revisar',35,4,0,21,'2023-10-19 12:15:54.076045'),(156,'artigo',35,194,1,24,'2023-10-19 12:15:54.086129'),(157,'científico',35,295,2,25,'2023-10-19 12:15:54.101701'),(158,'em',35,272,3,28,'2023-10-19 12:15:54.121279'),(159,'periódico',35,204,4,29,'2023-10-19 12:15:54.145620'),(160,'avaliar',36,3,0,21,'2023-10-19 12:17:42.099147'),(161,'artigo',36,194,1,24,'2023-10-19 12:17:42.139771'),(162,'científico',36,295,2,25,'2023-10-19 12:17:42.146079'),(163,'em',36,272,3,28,'2023-10-19 12:17:42.162753'),(164,'periódico',36,204,4,29,'2023-10-19 12:17:42.186531'),(165,'planejar',37,5,0,21,'2023-10-19 12:51:04.123552'),(166,'atividade',37,259,1,24,'2023-10-19 12:51:04.142396'),(167,'de',37,275,3,28,'2023-10-19 12:51:04.163943'),(168,'pesquisa',37,81,4,29,'2023-10-19 12:51:04.168663'),(169,'elaborar',38,1,0,21,'2023-10-19 13:13:23.281803'),(170,'proposta',38,202,1,24,'2023-10-19 13:13:23.292158'),(171,'de',38,275,3,28,'2023-10-19 13:13:23.301376'),(172,'projeto',38,83,4,29,'2023-10-19 13:13:23.368911'),(173,'interno',38,300,5,30,'2023-10-19 13:13:23.457969'),(174,'avaliar',39,3,0,21,'2023-10-19 13:15:59.570229'),(175,'proposta',39,202,1,24,'2023-10-19 13:15:59.590608'),(176,'de',39,275,3,28,'2023-10-19 13:15:59.699724'),(177,'projeto',39,83,4,29,'2023-10-19 13:15:59.763110'),(178,'interno',39,300,5,30,'2023-10-19 13:15:59.769506'),(179,'elaborar',40,1,0,21,'2023-10-19 13:51:57.722584'),(180,'projeto',40,83,1,24,'2023-10-19 13:51:57.738825'),(181,'de',40,275,3,28,'2023-10-19 13:51:57.757611'),(182,'fomento',40,75,4,29,'2023-10-19 13:51:57.786720'),(183,'elaborar',41,1,0,21,'2023-10-19 15:30:26.637244'),(184,'proposta',41,202,1,24,'2023-10-19 15:30:26.650319'),(185,'de',41,275,3,28,'2023-10-19 15:30:26.655760'),(186,'fomento',41,75,4,29,'2023-10-19 15:30:26.661239'),(187,'elaborar',42,1,0,21,'2023-10-19 17:59:09.506993'),(188,'conteúdo',42,201,1,24,'2023-10-19 17:59:09.542750'),(189,'didático',42,292,2,25,'2023-10-19 17:59:09.673600'),(190,'para',42,274,3,28,'2023-10-19 17:59:09.685948'),(191,'livro',42,195,4,29,'2023-10-19 17:59:09.743136');
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
-- Table structure for table `veiculos`
--

DROP TABLE IF EXISTS `veiculos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `veiculos` (
  `id_chave_veiculo` int(11) NOT NULL AUTO_INCREMENT,
  `nome_veiculo` varchar(200) DEFAULT NULL,
  `descricao` varchar(500) DEFAULT NULL,
  `id_tipo_de_veiculo` int(11) DEFAULT NULL,
  `time_stamp` timestamp(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  PRIMARY KEY (`id_chave_veiculo`),
  UNIQUE KEY `nome_veiculo` (`nome_veiculo`),
  KEY `id_tipo_de_veiculo` (`id_tipo_de_veiculo`),
  CONSTRAINT `veiculos_ibfk_1` FOREIGN KEY (`id_tipo_de_veiculo`) REFERENCES `tipos_de_veiculos` (`id_chave_tipo_de_veiculo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `veiculos`
--

LOCK TABLES `veiculos` WRITE;
/*!40000 ALTER TABLE `veiculos` DISABLE KEYS */;
/*!40000 ALTER TABLE `veiculos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `veiculos_tipos_de_identificadores`
--

DROP TABLE IF EXISTS `veiculos_tipos_de_identificadores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `veiculos_tipos_de_identificadores` (
  `id_chave_veiculo_tipo_de_identificador` int(11) NOT NULL AUTO_INCREMENT,
  `nome_veiculo_tipo_de_identificador` varchar(200) DEFAULT NULL,
  `id_tipo_de_identificador` int(11) DEFAULT NULL,
  `id_veiculo` int(11) DEFAULT NULL,
  `valor` varchar(255) DEFAULT NULL,
  `time_stamp` timestamp(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  PRIMARY KEY (`id_chave_veiculo_tipo_de_identificador`),
  UNIQUE KEY `nome_veiculo_tipo_de_identificador` (`nome_veiculo_tipo_de_identificador`),
  UNIQUE KEY `valor` (`valor`),
  KEY `id_tipo_de_identificador` (`id_tipo_de_identificador`),
  KEY `id_veiculo` (`id_veiculo`),
  CONSTRAINT `veiculos_tipos_de_identificadores_ibfk_1` FOREIGN KEY (`id_tipo_de_identificador`) REFERENCES `tipos_de_identificadores` (`id_chave_tipo_de_identificador`),
  CONSTRAINT `veiculos_tipos_de_identificadores_ibfk_2` FOREIGN KEY (`id_veiculo`) REFERENCES `veiculos` (`id_chave_veiculo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `veiculos_tipos_de_identificadores`
--

LOCK TABLES `veiculos_tipos_de_identificadores` WRITE;
/*!40000 ALTER TABLE `veiculos_tipos_de_identificadores` DISABLE KEYS */;
/*!40000 ALTER TABLE `veiculos_tipos_de_identificadores` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `versoes`
--

LOCK TABLES `versoes` WRITE;
/*!40000 ALTER TABLE `versoes` DISABLE KEYS */;
INSERT INTO `versoes` VALUES (23,'2023-10-14 16:29:17.806654',1,'raiz'),(24,'2023-10-14 16:29:17.806654',15,'A lista abaixo traz todas as estruturas de sentenças para avaliação de atividades da Fundacentro'),(25,'2023-10-14 16:29:17.806654',16,'1'),(26,'2023-10-14 16:29:17.806654',17,'Sentença com predicado, objeto direto e objeto indireto.'),(27,'2023-10-14 16:29:17.806654',18,'Exemplo: \"Elaborar projeto completo para órgão fomentador\"'),(28,'2023-10-14 16:29:17.806654',19,'7'),(29,'2023-10-14 16:29:17.806654',20,'Exemplo: \"Publicar artigo científico em revista indexada\"'),(30,'2023-10-14 16:29:17.806654',21,'11'),(31,'2023-10-14 16:29:17.806654',22,'10'),(32,'2023-10-14 16:29:17.806654',23,'Exemplo: \"um resumo estendido\"'),(33,'2023-10-14 16:29:17.806654',24,'substantivo do objeto direto'),(34,'2023-10-14 16:29:17.806654',25,'adjetivo do objeto direto'),(35,'2023-10-14 16:29:17.806654',26,'11'),(36,'2023-10-14 16:29:17.806654',27,'Exemplo: \"para um congresso científico\"'),(37,'2023-10-14 16:29:17.806654',28,'preposição do objeto indireto'),(38,'2023-10-14 16:29:17.806654',29,'substantivo do objeto indireto'),(39,'2023-10-14 16:29:17.806654',30,'adjetivo do objeto indireto'),(40,'2023-10-14 16:29:17.806654',31,'13'),(41,'2023-10-14 16:29:17.806654',32,'Expressão nominal, sem verbos, baseada numa substantivação da ação'),(42,'2023-10-14 16:29:17.806654',33,'8'),(43,'2023-10-14 16:29:17.806654',34,'preposição, mais frequentemente de'),(44,'2023-10-14 16:29:17.806654',35,'substantivos'),(45,'2023-10-14 16:29:17.806654',36,'adjetivo'),(46,'2023-10-14 16:29:17.806654',37,'preposição, mais frequentemente me'),(47,'2023-10-14 16:29:17.806654',38,'substantivos'),(48,'2023-10-14 16:29:17.806654',39,'adjetivo'),(49,'2023-10-14 16:29:17.806654',40,'12'),(50,'2023-10-14 16:29:17.806654',41,'teste');
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

-- Dump completed on 2023-10-19 15:38:07
