-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: localhost    Database: myjob
-- ------------------------------------------------------
-- Server version	5.7.11-log

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

CREATE DATABASE  IF NOT EXISTS `myjob` /*!40100 DEFAULT CHARACTER SET latin1 */;
GRANT ALL PRIVILEGES ON `myjob`.* TO 'myjob'@'localhost';
USE `myjob`;

--
-- Table structure for table `demandante`
--

DROP TABLE IF EXISTS `demandante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `demandante` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `dir_actual` varchar(255) NOT NULL,
  `dni` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `estado` int(11) DEFAULT NULL,
  `fecha_nacimiento` datetime NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `sexo` varchar(255) NOT NULL,
  `telefono` varchar(255) NOT NULL,
  `version` int(11) DEFAULT NULL,
  `perfil` bigint(20) DEFAULT NULL,
  `usuariod` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_6mnowhfkr7gqotgmci4yrry5r` (`perfil`),
  KEY `FK_rwvcl6iag01t78nasiwwtjkxr` (`usuariod`),
  CONSTRAINT `FK_6mnowhfkr7gqotgmci4yrry5r` FOREIGN KEY (`perfil`) REFERENCES `perfil` (`id`),
  CONSTRAINT `FK_rwvcl6iag01t78nasiwwtjkxr` FOREIGN KEY (`usuariod`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `demandante`
--

LOCK TABLES `demandante` WRITE;
/*!40000 ALTER TABLE `demandante` DISABLE KEYS */;
INSERT INTO `demandante` VALUES (1,'Calle Luna nº2','56743225B','pedro@hotmail.com',NULL,'2000-08-08 00:00:00','Pedro','Hombre','45634223',0,NULL,2);
/*!40000 ALTER TABLE `demandante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `direccion`
--

DROP TABLE IF EXISTS `direccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `direccion` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cp` varchar(255) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `num` varchar(255) NOT NULL,
  `pais` varchar(255) NOT NULL,
  `version` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `direccion`
--

LOCK TABLES `direccion` WRITE;
/*!40000 ALTER TABLE `direccion` DISABLE KEYS */;
/*!40000 ALTER TABLE `direccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empresa`
--

DROP TABLE IF EXISTS `empresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `empresa` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `actividad_profesional` varchar(255) DEFAULT NULL,
  `cif` varchar(9) NOT NULL,
  `email` varchar(30) DEFAULT NULL,
  `n_empleados` float DEFAULT NULL,
  `nombre` varchar(30) NOT NULL,
  `telefono` varchar(255) NOT NULL,
  `version` int(11) DEFAULT NULL,
  `direccion` bigint(20) DEFAULT NULL,
  `oferta` bigint(20) DEFAULT NULL,
  `usuario` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_834gy4iew8s54mp07vlpg76f9` (`direccion`),
  KEY `FK_g9o0gs7vrcx72jl59icel8gb1` (`oferta`),
  KEY `FK_d3nm4bkmn198h94okwmqdfh6w` (`usuario`),
  CONSTRAINT `FK_834gy4iew8s54mp07vlpg76f9` FOREIGN KEY (`direccion`) REFERENCES `direccion` (`id`),
  CONSTRAINT `FK_d3nm4bkmn198h94okwmqdfh6w` FOREIGN KEY (`usuario`) REFERENCES `usuario` (`id`),
  CONSTRAINT `FK_g9o0gs7vrcx72jl59icel8gb1` FOREIGN KEY (`oferta`) REFERENCES `oferta_trabajo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empresa`
--

LOCK TABLES `empresa` WRITE;
/*!40000 ALTER TABLE `empresa` DISABLE KEYS */;
INSERT INTO `empresa` VALUES (1,'Telecomunicaciones','456432111','telecomunicaciones@hotmail.com',50,'Telecomunicaciones S.A','898332123',0,NULL,NULL,3);
/*!40000 ALTER TABLE `empresa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inscripcion`
--

DROP TABLE IF EXISTS `inscripcion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inscripcion` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `estado` int(11) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `inscripcion` bigint(20) DEFAULT NULL,
  `oferta` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_ai1x56sy69ejx17gxbd8ae0gi` (`inscripcion`),
  KEY `FK_jtwnnskbxax0f2q8butty5yj` (`oferta`),
  CONSTRAINT `FK_ai1x56sy69ejx17gxbd8ae0gi` FOREIGN KEY (`inscripcion`) REFERENCES `demandante` (`id`),
  CONSTRAINT `FK_jtwnnskbxax0f2q8butty5yj` FOREIGN KEY (`oferta`) REFERENCES `oferta_trabajo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inscripcion`
--

LOCK TABLES `inscripcion` WRITE;
/*!40000 ALTER TABLE `inscripcion` DISABLE KEYS */;
/*!40000 ALTER TABLE `inscripcion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oferta_trabajo`
--

DROP TABLE IF EXISTS `oferta_trabajo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oferta_trabajo` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) DEFAULT NULL,
  `estado_empleo` int(11) DEFAULT NULL,
  `experiencia_previa` varchar(255) NOT NULL,
  `fecha_aprox_inic` datetime NOT NULL,
  `formacion` varchar(30) NOT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `num_vacantes` varchar(255) NOT NULL,
  `perfil` varchar(255) NOT NULL,
  `sueldo_bruto` float NOT NULL,
  `tipologia_contrato` varchar(30) NOT NULL,
  `version` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oferta_trabajo`
--

LOCK TABLES `oferta_trabajo` WRITE;
/*!40000 ALTER TABLE `oferta_trabajo` DISABLE KEYS */;
INSERT INTO `oferta_trabajo` VALUES (1,'Programador Java',0,'Ninguna','2016-06-21 00:00:00','Ingenieria Informatica','Programador Java','2','Ninguno',2000,'Tiempo Completo',0),(2,'Basurero',NULL,'3 años','2016-06-29 00:00:00','Grado Superior','Basurero','1','Ninguno',1000,'Tiempo Parcial',0);
/*!40000 ALTER TABLE `oferta_trabajo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perfil`
--

DROP TABLE IF EXISTS `perfil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perfil` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cursos_especializacion` varchar(30) DEFAULT NULL,
  `fecha_fin` datetime DEFAULT NULL,
  `fecha_inicio` datetime NOT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `idiomas` varchar(30) DEFAULT NULL,
  `lista_puesto_trabajo` varchar(30) DEFAULT NULL,
  `nombres_empresas` varchar(30) DEFAULT NULL,
  `puesto_trabajo_desempenado` varchar(30) DEFAULT NULL,
  `titulos_academicos` varchar(30) NOT NULL,
  `trayectoria` varchar(255) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perfil`
--

LOCK TABLES `perfil` WRITE;
/*!40000 ALTER TABLE `perfil` DISABLE KEYS */;
/*!40000 ALTER TABLE `perfil` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `email` varchar(30) DEFAULT NULL,
  `enabled` varchar(3) DEFAULT NULL,
  `fecha_registro` datetime NOT NULL,
  `password` varchar(30) NOT NULL,
  `rol` int(11) DEFAULT NULL,
  `username` varchar(30) NOT NULL,
  `version` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'admin@hotmail.com','1','2016-06-03 00:00:00','admin',NULL,'admin',0),(2,'demandante@hotmail.com','1','2016-06-08 20:31:04','demandante',0,'demandante',0),(3,'empresa@hotmail.com','1','2016-06-08 20:31:21','empresa',1,'empresa',0);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-06-09 13:35:56
