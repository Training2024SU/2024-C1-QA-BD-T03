-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: libreriajm
-- ------------------------------------------------------
-- Server version	8.0.36

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `autor`
--

DROP TABLE IF EXISTS `autor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `autor` (
  `codigo_autor` varchar(20) NOT NULL,
  `Nombre_autor` varchar(100) DEFAULT NULL,
  `Fecha_nacimiento` date DEFAULT NULL,
  PRIMARY KEY (`codigo_autor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autor`
--

LOCK TABLES `autor` WRITE;
/*!40000 ALTER TABLE `autor` DISABLE KEYS */;
INSERT INTO `autor` VALUES ('A001','Gabriel Garcia Marquez','1927-03-06'),('A002','J.K. Rowling','1965-07-31'),('A003','Stephen King','1947-09-21');
/*!40000 ALTER TABLE `autor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria_literaria`
--

DROP TABLE IF EXISTS `categoria_literaria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria_literaria` (
  `ISBN` varchar(40) DEFAULT NULL,
  `nombre_categoria` varchar(30) DEFAULT NULL,
  KEY `ISBN` (`ISBN`),
  CONSTRAINT `categoria_literaria_ibfk_1` FOREIGN KEY (`ISBN`) REFERENCES `libro` (`ISBN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria_literaria`
--

LOCK TABLES `categoria_literaria` WRITE;
/*!40000 ALTER TABLE `categoria_literaria` DISABLE KEYS */;
INSERT INTO `categoria_literaria` VALUES ('9788408103035','Realismo mágico'),('9780545010221','Fantasía'),('9781982110567','Terror');
/*!40000 ALTER TABLE `categoria_literaria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `Id_cliente` varchar(20) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`Id_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES ('C001','Maria Perez','maria.perez@example.com'),('C002','Juan Rodriguez','juan.rodriguez@example.com'),('C003','Ana Martinez','ana.martinez@example.com');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compra`
--

DROP TABLE IF EXISTS `compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compra` (
  `id_compra` int NOT NULL,
  `Id_cliente` varchar(20) DEFAULT NULL,
  `ISBN` varchar(40) DEFAULT NULL,
  `Fecha_compra` date DEFAULT NULL,
  `Metodo_pago` varchar(40) DEFAULT NULL,
  `cantidad` int DEFAULT NULL,
  PRIMARY KEY (`id_compra`),
  KEY `ISBN` (`ISBN`),
  KEY `Id_cliente` (`Id_cliente`),
  CONSTRAINT `compra_ibfk_1` FOREIGN KEY (`ISBN`) REFERENCES `libro` (`ISBN`),
  CONSTRAINT `compra_ibfk_2` FOREIGN KEY (`Id_cliente`) REFERENCES `cliente` (`Id_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compra`
--

LOCK TABLES `compra` WRITE;
/*!40000 ALTER TABLE `compra` DISABLE KEYS */;
INSERT INTO `compra` VALUES (1,'C001','9788408103035','2022-03-15','Tarjeta de crédito',1),(2,'C002','9780545010221','2022-04-20','Transferencia bancaria',2),(3,'C003','9781982110567','2022-05-10','Efectivo',1);
/*!40000 ALTER TABLE `compra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `editorial`
--

DROP TABLE IF EXISTS `editorial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `editorial` (
  `nombre_editorial` varchar(30) NOT NULL,
  `direccion` varchar(150) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`nombre_editorial`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `editorial`
--

LOCK TABLES `editorial` WRITE;
/*!40000 ALTER TABLE `editorial` DISABLE KEYS */;
INSERT INTO `editorial` VALUES ('Bloomsbury','Bloomsbury Publishing Plc, 50 Bedford Square, London','info@bloomsbury.com'),('Editorial Sudamericana','Av. de Mayo 300, Buenos Aires, Argentina','info@sudamericana.com'),('Viking Press','1745 Broadway, New York, NY 10019, USA','info@vikingpress.com');
/*!40000 ALTER TABLE `editorial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `libro`
--

DROP TABLE IF EXISTS `libro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `libro` (
  `ISBN` varchar(40) NOT NULL,
  `Titulo` varchar(150) DEFAULT NULL,
  `anio_publicacion` year DEFAULT NULL,
  `Numero_paginas` int DEFAULT NULL,
  `Nombre_editorial` varchar(100) DEFAULT NULL,
  `Valor` int DEFAULT NULL,
  PRIMARY KEY (`ISBN`),
  KEY `Nombre_editorial` (`Nombre_editorial`),
  CONSTRAINT `libro_ibfk_1` FOREIGN KEY (`Nombre_editorial`) REFERENCES `editorial` (`nombre_editorial`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `libro`
--

LOCK TABLES `libro` WRITE;
/*!40000 ALTER TABLE `libro` DISABLE KEYS */;
INSERT INTO `libro` VALUES ('9780545010221','Harry Potter y la piedra filosofal',1997,320,'Bloomsbury',20000),('9781982110567','It',1986,1138,'Viking Press',30000),('9788408103035','Cien años de soledad',1967,432,'Editorial Sudamericana',25000);
/*!40000 ALTER TABLE `libro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `libro_autor`
--

DROP TABLE IF EXISTS `libro_autor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `libro_autor` (
  `codigo_autor` varchar(20) DEFAULT NULL,
  `ISBN` varchar(40) DEFAULT NULL,
  KEY `ISBN` (`ISBN`),
  KEY `codigo_autor` (`codigo_autor`),
  CONSTRAINT `libro_autor_ibfk_1` FOREIGN KEY (`ISBN`) REFERENCES `libro` (`ISBN`),
  CONSTRAINT `libro_autor_ibfk_2` FOREIGN KEY (`codigo_autor`) REFERENCES `autor` (`codigo_autor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `libro_autor`
--

LOCK TABLES `libro_autor` WRITE;
/*!40000 ALTER TABLE `libro_autor` DISABLE KEYS */;
INSERT INTO `libro_autor` VALUES ('A001','9788408103035'),('A002','9780545010221'),('A003','9781982110567');
/*!40000 ALTER TABLE `libro_autor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nacionalidad`
--

DROP TABLE IF EXISTS `nacionalidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nacionalidad` (
  `codigo_autor` varchar(20) NOT NULL,
  `Nombre_nacionalidad` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`codigo_autor`),
  CONSTRAINT `nacionalidad_ibfk_1` FOREIGN KEY (`codigo_autor`) REFERENCES `autor` (`codigo_autor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nacionalidad`
--

LOCK TABLES `nacionalidad` WRITE;
/*!40000 ALTER TABLE `nacionalidad` DISABLE KEYS */;
INSERT INTO `nacionalidad` VALUES ('A001','Colombiano'),('A002','Británico'),('A003','Estadounidense');
/*!40000 ALTER TABLE `nacionalidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `telefono`
--

DROP TABLE IF EXISTS `telefono`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `telefono` (
  `nombre_editorial` varchar(100) NOT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`nombre_editorial`),
  CONSTRAINT `telefono_ibfk_1` FOREIGN KEY (`nombre_editorial`) REFERENCES `editorial` (`nombre_editorial`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `telefono`
--

LOCK TABLES `telefono` WRITE;
/*!40000 ALTER TABLE `telefono` DISABLE KEYS */;
INSERT INTO `telefono` VALUES ('Bloomsbury','+44 20 7631 5600'),('Editorial Sudamericana','+54 11 4345-3500'),('Viking Press','+1 212-782-9000');
/*!40000 ALTER TABLE `telefono` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `telefono_cliente`
--

DROP TABLE IF EXISTS `telefono_cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `telefono_cliente` (
  `id_cliente` varchar(20) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  KEY `id_cliente` (`id_cliente`),
  CONSTRAINT `telefono_cliente_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`Id_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `telefono_cliente`
--

LOCK TABLES `telefono_cliente` WRITE;
/*!40000 ALTER TABLE `telefono_cliente` DISABLE KEYS */;
INSERT INTO `telefono_cliente` VALUES ('C001','+1 123-456-7890'),('C002','+1 234-567-8901'),('C003','+1 345-678-9012');
/*!40000 ALTER TABLE `telefono_cliente` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-03 10:36:27
