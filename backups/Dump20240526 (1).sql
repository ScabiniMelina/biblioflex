-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: biblioflex
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
-- Table structure for table `biblioteca`
--

DROP TABLE IF EXISTS `biblioteca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `biblioteca` (
  `id_biblioteca` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `codigo_postal` varchar(20) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `capacidad_maxima` int DEFAULT NULL,
  `fecha_apertura` date DEFAULT NULL,
  PRIMARY KEY (`id_biblioteca`),
  UNIQUE KEY `id_biblioteca` (`id_biblioteca`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `biblioteca`
--

LOCK TABLES `biblioteca` WRITE;
/*!40000 ALTER TABLE `biblioteca` DISABLE KEYS */;
INSERT INTO `biblioteca` VALUES (1,'New York Public Library','476 5th Ave','10018','+1 (917) 275-6975','info@nypl.org',2000,'1895-05-23'),(2,'Library of Congress','101 Independence Ave SE','20540','+1 (202) 707-5000','info@loc.gov',5000,'1800-04-24'),(3,'British Library','96 Euston Rd','NW1 2DB','+44 (0)330 333 1144','enquiries@bl.uk',1500,'1973-11-25'),(4,'Boston Public Library','700 Boylston St','02116','+1 (617) 536-5400','ask@bpl.org',1200,'1848-03-20'),(5,'Los Angeles Public Library','630 W 5th St','90071','+1 (213) 228-7000','contactus@lapl.org',2500,'1872-06-01'),(6,'Chicago Public Library','400 S State St','60605','+1 (312) 747-4300','cpl@cpl.org',1800,'1873-01-01'),(7,'Seattle Public Library','1000 4th Ave','98104','+1 (206) 386-4636','ask@spl.org',1700,'1890-03-26'),(8,'San Francisco Public Library','100 Larkin St','94102','+1 (415) 557-4400','info@sfpl.org',1400,'1879-06-09'),(9,'Toronto Public Library','789 Yonge St','M4W 2G8','+1 (416) 393-7131','info@tpl.ca',2200,'1883-03-06'),(10,'National Library of Australia','Parkes Pl W','2600','+61 (02) 6262 1111','info@nla.gov.au',3000,'1901-01-01');
/*!40000 ALTER TABLE `biblioteca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cargo_empleado`
--

DROP TABLE IF EXISTS `cargo_empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cargo_empleado` (
  `id_cargo` int NOT NULL AUTO_INCREMENT,
  `nombre_cargo` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_cargo`),
  UNIQUE KEY `nombre_cargo` (`nombre_cargo`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cargo_empleado`
--

LOCK TABLES `cargo_empleado` WRITE;
/*!40000 ALTER TABLE `cargo_empleado` DISABLE KEYS */;
INSERT INTO `cargo_empleado` VALUES (7,'Administrador de Sistemas'),(12,'Arquitecto de Información'),(2,'Asistente de Biblioteca'),(5,'Asistente de Investigación'),(1,'Bibliotecario'),(18,'Bibliotecario de Archivos'),(19,'Bibliotecario de Museos'),(13,'Bibliotecario de Referencia'),(15,'Bibliotecario Digital'),(16,'Bibliotecario Escolar'),(14,'Bibliotecario Infantil'),(17,'Bibliotecario Universitario'),(11,'Bibliotecólogo'),(6,'Conserje'),(9,'Coordinador de Programas'),(3,'Encargado de Adquisiciones'),(10,'Especialista en Conservación'),(4,'Gerente de Biblioteca'),(8,'Técnico de Biblioteca');
/*!40000 ALTER TABLE `cargo_empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleado`
--

DROP TABLE IF EXISTS `empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleado` (
  `id_empleado` int NOT NULL AUTO_INCREMENT,
  `id_biblioteca` int NOT NULL,
  `id_persona` int NOT NULL,
  `id_cargo` int NOT NULL,
  PRIMARY KEY (`id_empleado`),
  UNIQUE KEY `id_empleado` (`id_empleado`),
  KEY `fk_id_biblioteca` (`id_biblioteca`),
  KEY `fk_id_persona_empleado` (`id_persona`),
  KEY `fk_id_cargo` (`id_cargo`),
  CONSTRAINT `fk_id_biblioteca` FOREIGN KEY (`id_biblioteca`) REFERENCES `biblioteca` (`id_biblioteca`),
  CONSTRAINT `fk_id_cargo` FOREIGN KEY (`id_cargo`) REFERENCES `cargo_empleado` (`id_cargo`),
  CONSTRAINT `fk_id_persona_empleado` FOREIGN KEY (`id_persona`) REFERENCES `persona` (`id_persona`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleado`
--

LOCK TABLES `empleado` WRITE;
/*!40000 ALTER TABLE `empleado` DISABLE KEYS */;
INSERT INTO `empleado` VALUES (1,1,1,1),(2,1,2,1),(3,1,2,1),(4,2,2,2),(5,2,3,2),(6,2,3,2),(7,2,3,3),(8,4,4,3),(9,5,5,3),(10,7,6,4),(11,1,7,4),(12,2,12,5),(13,3,13,5),(14,4,4,1),(15,5,15,1),(16,6,16,1),(17,7,17,2),(18,8,18,2),(19,9,19,1),(20,10,20,4);
/*!40000 ALTER TABLE `empleado` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_empleado_update` BEFORE INSERT ON `empleado` FOR EACH ROW BEGIN
    DECLARE v_nombre VARCHAR(255);
    DECLARE v_apellido VARCHAR(255);
    
    -- OBTIENE EL NOMBRE Y APELLIDO DE LA PERSONA CONTRATADA
    SELECT nombre, apellido INTO v_nombre, v_apellido
    FROM persona
    WHERE id_persona = NEW.id_persona;
    
    -- INSERTA LA INFORMACIÓN EN LA TABLA DE CAMBIOS DE EMPLEADOS
    INSERT INTO stg_cambios_empleados (id_empleado,id_persona, nombre, apellido, tipo_operacion)
    VALUES (NEW.id_empleado,NEW.id_persona,v_nombre, v_apellido, 'Contratación');
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_empleado_delete` AFTER DELETE ON `empleado` FOR EACH ROW BEGIN
    DECLARE v_nombre VARCHAR(255);
    DECLARE v_apellido VARCHAR(255);
    
    -- OBTIENE EL NOMBRE Y APELLIDO DE LA PERSONA DESPEDIDA
    SELECT nombre, apellido INTO v_nombre, v_apellido
    FROM persona
    WHERE id_persona = OLD.id_persona;
    
    -- INSERTA LA INFORMACIÓN EN LA TABLA DE CAMBIOS DE EMPLEADOS
	INSERT INTO stg_cambios_empleados (id_empleado,id_persona, nombre, apellido, tipo_operacion)
    VALUES (OLD.id_empleado, OLD.id_persona,v_nombre, v_apellido, 'Despido');
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `inventario_libro`
--

DROP TABLE IF EXISTS `inventario_libro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventario_libro` (
  `id_libro` int NOT NULL AUTO_INCREMENT,
  `id_biblioteca` int NOT NULL,
  `id_isbn_libro` varchar(13) NOT NULL,
  PRIMARY KEY (`id_libro`),
  UNIQUE KEY `id_libro` (`id_libro`),
  KEY `fk_id_biblioteca_inventario` (`id_biblioteca`),
  KEY `fk_id_isbn_libro_inventario` (`id_isbn_libro`),
  CONSTRAINT `fk_id_biblioteca_inventario` FOREIGN KEY (`id_biblioteca`) REFERENCES `biblioteca` (`id_biblioteca`),
  CONSTRAINT `fk_id_isbn_libro_inventario` FOREIGN KEY (`id_isbn_libro`) REFERENCES `libro` (`id_isbn_libro`)
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventario_libro`
--

LOCK TABLES `inventario_libro` WRITE;
/*!40000 ALTER TABLE `inventario_libro` DISABLE KEYS */;
INSERT INTO `inventario_libro` VALUES (1,1,'9780061120084'),(2,1,'9780143039433'),(3,1,'9780743273565'),(4,1,'9780307594002'),(5,1,'9780061120084'),(6,1,'9780143039433'),(7,1,'9780743273565'),(8,1,'9780307594002'),(9,1,'9780061120084'),(10,1,'9780143039433'),(11,1,'9780743273565'),(12,1,'9780307594002'),(13,1,'9780547928227'),(14,1,'9780618260300'),(15,1,'9780060256654'),(16,2,'9780061120084'),(17,2,'9780143039433'),(18,2,'9780743273565'),(19,2,'9780307594002'),(20,2,'9780547928227'),(21,2,'9780618260300'),(22,2,'9780060256654'),(23,3,'9780061120084'),(24,3,'9780143039433'),(25,3,'9780743273565'),(26,3,'9780307594002'),(27,3,'9780547928227'),(28,3,'9780618260300'),(29,3,'9780060256654'),(30,4,'9780061120084'),(31,4,'9780143039433'),(32,4,'9780743273565'),(33,4,'9780307594002'),(34,4,'9780547928227'),(35,4,'9780618260300'),(36,4,'9780060256654'),(37,5,'9780061120084'),(38,5,'9780143039433'),(39,5,'9780743273565'),(40,5,'9780307594002'),(41,5,'9780547928227'),(42,5,'9780618260300'),(43,5,'9780060256654'),(44,6,'9780061120084'),(45,6,'9780143039433'),(46,6,'9780743273565'),(47,6,'9780307594002'),(48,6,'9780547928227'),(49,6,'9780618260300'),(50,6,'9780060256654'),(51,7,'9780061120084'),(52,7,'9780143039433'),(53,7,'9780743273565'),(54,7,'9780307594002'),(55,7,'9780547928227'),(56,7,'9780618260300'),(57,7,'9780060256654'),(58,8,'9780061120084'),(59,8,'9780143039433'),(60,8,'9780743273565'),(61,8,'9780307594002'),(62,8,'9780547928227'),(63,8,'9780618260300'),(64,8,'9780060256654'),(65,9,'9780061120084'),(66,9,'9780143039433'),(67,9,'9780743273565'),(68,9,'9780307594002'),(69,9,'9780547928227'),(70,9,'9780618260300'),(71,9,'9780060256654'),(72,1,'9780061120084'),(73,1,'9780143039433'),(74,1,'9780743273565'),(75,1,'9780307594002'),(76,8,'9780547928227'),(77,9,'9780618260300'),(78,10,'9780060256654');
/*!40000 ALTER TABLE `inventario_libro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `libro`
--

DROP TABLE IF EXISTS `libro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `libro` (
  `id_isbn_libro` varchar(13) NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `editorial` varchar(255) NOT NULL,
  `fecha_publicacion` date DEFAULT NULL,
  PRIMARY KEY (`id_isbn_libro`),
  UNIQUE KEY `id_isbn_libro` (`id_isbn_libro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `libro`
--

LOCK TABLES `libro` WRITE;
/*!40000 ALTER TABLE `libro` DISABLE KEYS */;
INSERT INTO `libro` VALUES ('9780060256654','Where the Wild Things Are','HarperCollins Publishers','1963-04-02'),('9780061120084','To Kill a Mockingbird','HarperCollins Publishers','1960-07-11'),('9780143039433','The Great Gatsby','Penguin Books','1925-04-10'),('9780307594002','1984','Houghton Mifflin Harcourt','1949-06-08'),('9780547928227','The Hobbit','Houghton Mifflin Harcourt','1937-09-21'),('9780618260300','Pride and Prejudice','Houghton Mifflin Harcourt','1813-01-28'),('9780743273565','The Catcher in the Rye','Little, Brown and Company','1951-07-16');
/*!40000 ALTER TABLE `libro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `libro_autor`
--

DROP TABLE IF EXISTS `libro_autor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `libro_autor` (
  `id_libro_autor` int NOT NULL AUTO_INCREMENT,
  `id_persona` int NOT NULL,
  `id_isbn_libro` varchar(13) NOT NULL,
  PRIMARY KEY (`id_libro_autor`),
  KEY `fk_id_persona` (`id_persona`),
  KEY `fk_id_isbn_libro` (`id_isbn_libro`),
  CONSTRAINT `fk_id_isbn_libro` FOREIGN KEY (`id_isbn_libro`) REFERENCES `libro` (`id_isbn_libro`),
  CONSTRAINT `fk_id_persona` FOREIGN KEY (`id_persona`) REFERENCES `persona` (`id_persona`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `libro_autor`
--

LOCK TABLES `libro_autor` WRITE;
/*!40000 ALTER TABLE `libro_autor` DISABLE KEYS */;
INSERT INTO `libro_autor` VALUES (1,1,'9780061120084'),(2,9,'9780061120084'),(3,19,'9780061120084'),(4,29,'9780061120084'),(5,39,'9780061120084'),(6,2,'9780143039433'),(7,12,'9780143039433'),(8,22,'9780143039433'),(9,32,'9780143039433'),(10,42,'9780143039433'),(11,3,'9780743273565'),(12,13,'9780743273565'),(13,4,'9780307594002'),(14,5,'9780547928227'),(15,6,'9780618260300'),(16,7,'9780060256654'),(17,17,'9780060256654');
/*!40000 ALTER TABLE `libro_autor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `libro_prestado`
--

DROP TABLE IF EXISTS `libro_prestado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `libro_prestado` (
  `id_prestamo` int NOT NULL,
  `id_libro` int NOT NULL,
  `fecha_devolucion` date DEFAULT NULL,
  PRIMARY KEY (`id_prestamo`,`id_libro`),
  KEY `fk_id_libro_inventario_libro` (`id_libro`),
  CONSTRAINT `fk_id_libro_inventario_libro` FOREIGN KEY (`id_libro`) REFERENCES `inventario_libro` (`id_libro`),
  CONSTRAINT `fk_id_prestamo_libro_prestado` FOREIGN KEY (`id_prestamo`) REFERENCES `prestamo` (`id_prestamo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `libro_prestado`
--

LOCK TABLES `libro_prestado` WRITE;
/*!40000 ALTER TABLE `libro_prestado` DISABLE KEYS */;
INSERT INTO `libro_prestado` VALUES (1,1,'2024-05-01'),(1,2,'2024-05-01'),(1,3,'2024-05-01'),(2,5,'2024-04-30'),(2,16,'2024-04-30'),(3,6,'2024-12-03'),(4,7,'2024-11-03'),(4,8,'2024-11-03'),(4,9,'2024-11-03'),(5,10,NULL),(5,11,NULL),(5,12,NULL),(6,13,'2024-05-01'),(7,14,'2024-05-01'),(7,15,'2024-05-01'),(8,16,NULL),(8,17,NULL),(8,18,NULL),(8,19,NULL),(9,20,NULL),(9,21,NULL),(10,22,'2024-04-28'),(10,23,'2024-04-28'),(10,24,'2024-04-28'),(11,25,NULL),(11,26,NULL),(11,27,NULL),(12,28,NULL),(13,32,NULL),(13,33,NULL),(14,34,NULL),(14,35,NULL),(15,36,'2024-04-27'),(15,37,'2024-04-27'),(15,38,'2024-04-27'),(15,39,'2024-04-27'),(16,1,NULL),(16,2,NULL),(16,40,NULL),(17,3,NULL),(17,4,NULL),(17,5,NULL),(17,6,NULL),(18,7,NULL),(18,8,NULL),(18,9,NULL),(19,10,'2024-05-10'),(19,11,'2024-05-10'),(19,12,'2024-05-10'),(19,13,'2024-05-10'),(20,14,'2024-05-10'),(20,15,'2024-05-10'),(20,16,'2024-05-10'),(20,17,'2024-05-10'),(21,18,'2024-05-10'),(21,19,'2024-05-10'),(21,20,'2024-05-10'),(22,21,'2024-05-10'),(22,22,'2024-05-10'),(22,23,NULL),(23,24,NULL),(23,25,NULL),(24,26,'2024-06-02'),(24,27,'2024-06-02'),(25,28,'2024-06-02'),(25,29,'2024-06-02'),(25,30,'2024-06-02'),(26,31,'2024-06-02'),(26,32,NULL),(26,33,NULL),(27,34,NULL),(27,35,NULL),(27,36,NULL),(27,37,NULL);
/*!40000 ALTER TABLE `libro_prestado` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_generar_multa_por_vencimiento` BEFORE UPDATE ON `libro_prestado` FOR EACH ROW BEGIN
    DECLARE dias_vencidos INT;
    DECLARE multa_existente INT;
	IF OLD.fecha_devolucion != NEW.fecha_devolucion THEN
		SELECT DATEDIFF(NEW.fecha_devolucion, prestamo.fecha_esperada_devolucion) INTO dias_vencidos
		FROM prestamo 
		WHERE prestamo.id_prestamo = NEW.id_prestamo;
		
        SELECT COUNT(*) INTO multa_existente
		FROM multa
		WHERE id_prestamo = NEW.id_prestamo;
        
		IF dias_vencidos > 0 THEN
            IF multa_existente > 0 THEN
                UPDATE multa
                SET monto_multa = dias_vencidos * 5.00,
                    fecha_registro = CURRENT_DATE
                WHERE id_prestamo = NEW.id_prestamo;
            ELSE
                INSERT INTO multa (id_prestamo, monto_multa, fecha_registro, estado_multa)
                VALUES (NEW.id_prestamo, dias_vencidos * 5.00, CURRENT_DATE, FALSE);
            END IF;
		END IF;
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `multa`
--

DROP TABLE IF EXISTS `multa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `multa` (
  `id_multa` int NOT NULL AUTO_INCREMENT,
  `id_prestamo` int NOT NULL,
  `monto_multa` decimal(10,2) DEFAULT NULL,
  `fecha_registro` date NOT NULL DEFAULT (curdate()),
  `estado_multa` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id_multa`),
  UNIQUE KEY `id_multa` (`id_multa`),
  KEY `fk_id_prestamo_multa` (`id_prestamo`),
  CONSTRAINT `fk_id_prestamo_multa` FOREIGN KEY (`id_prestamo`) REFERENCES `prestamo` (`id_prestamo`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `multa`
--

LOCK TABLES `multa` WRITE;
/*!40000 ALTER TABLE `multa` DISABLE KEYS */;
INSERT INTO `multa` VALUES (1,1,2.00,'2024-04-30',0),(2,2,6.00,'2024-05-01',0),(3,3,1100.00,'2024-05-04',1),(4,4,945.00,'2024-05-04',1),(5,15,0.00,'2024-05-03',1),(6,26,0.00,'2024-05-04',1),(7,7,0.00,'2024-05-05',1),(8,8,2.00,'2024-04-30',0),(9,9,0.00,'2024-05-01',1),(10,10,0.00,'2024-05-08',1);
/*!40000 ALTER TABLE `multa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persona`
--

DROP TABLE IF EXISTS `persona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `persona` (
  `id_persona` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `apellido` varchar(255) NOT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `nacionalidad` varchar(100) DEFAULT NULL,
  `genero` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_persona`),
  UNIQUE KEY `id_persona` (`id_persona`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persona`
--

LOCK TABLES `persona` WRITE;
/*!40000 ALTER TABLE `persona` DISABLE KEYS */;
INSERT INTO `persona` VALUES (1,'John','Doe','1985-04-15','USA','Masculino'),(2,'Jane','Smith','1990-09-25','USA','Femenino'),(3,'David','Johnson','1980-02-28','UK','Masculino'),(4,'Emily','Brown','1977-11-10','USA','Femenino'),(5,'Michael','Wilson','1988-06-30','Canada','Masculino'),(6,'Sophia','Taylor','1983-03-20','Australia','Femenino'),(7,'Daniel','Anderson','1975-08-05','USA','Masculino'),(8,'Olivia','Martinez','1981-01-12','Spain','Femenino'),(9,'William','Garcia','1986-07-22','USA','Masculino'),(10,'Ava','Rodriguez','1979-09-03','Mexico','Femenino'),(11,'Emma','Lee','1976-04-18','UK','Femenino'),(12,'Alexander','Lopez','1984-12-08','Spain','Masculino'),(13,'Mia','Harris','1991-02-25','Canada','Femenino'),(14,'James','Miller','1980-11-28','USA','Masculino'),(15,'Charlotte','Clark','1977-07-15','Australia','Femenino'),(16,'Benjamin','Young','1989-05-05','UK','Masculino'),(17,'Amelia','Evans','1982-03-30','USA','Femenino'),(18,'Logan','Gonzalez','1978-08-20','Mexico','Masculino'),(19,'Ethan','King','1985-10-12','Canada','Masculino'),(20,'Liam','Wright','1983-09-05','Australia','Masculino'),(21,'Mary','Johnson','1981-06-12','USA','Femenino'),(22,'Christopher','Williams','1979-09-08','UK','Masculino'),(23,'Ashley','Brown','1987-03-25','USA','Femenino'),(24,'Matthew','Jones','1984-12-30','Australia','Masculino'),(25,'Jessica','Garcia','1983-07-19','Mexico','Femenino'),(26,'Daniel','Martinez','1982-02-16','Spain','Masculino'),(27,'Jennifer','Rodriguez','1978-11-10','USA','Femenino'),(28,'James','Hernandez','1980-08-05','UK','Masculino'),(29,'Emily','Lopez','1985-04-20','Canada','Femenino'),(30,'Michael','Clark','1986-01-15','Australia','Masculino'),(31,'Ava','Adams','1979-10-25','USA','Femenino'),(32,'Matthew','Wright','1982-08-28','UK','Masculino'),(33,'Olivia','King','1984-03-15','Canada','Femenino'),(34,'Noah','Evans','1986-12-10','Australia','Masculino'),(35,'Sophia','Gonzalez','1988-05-20','Mexico','Femenino'),(36,'William','Young','1980-09-28','Spain','Masculino'),(37,'Isabella','Taylor','1977-11-01','USA','Femenino'),(38,'Alexander','Miller','1983-06-15','UK','Masculino'),(39,'Sophia','Wright','1981-04-20','Canada','Femenino'),(40,'Michael','Garcia','1979-08-10','Australia','Masculino'),(41,'Emily','Johnson','1988-03-15','USA','Femenino'),(42,'Sophia','Martinez','1985-09-10','Spain','Femenino'),(43,'Daniel','Garcia','1983-12-25','Mexico','Masculino'),(44,'Olivia','Lee','1979-07-05','UK','Femenino'),(45,'William','Rodriguez','1982-11-18','Canada','Masculino'),(46,'Emma','Clark','1986-02-28','Australia','Femenino'),(47,'Alexander','Hernandez','1984-06-10','USA','Masculino'),(48,'Ava','Evans','1981-04-20','Spain','Femenino'),(49,'James','Gonzalez','1977-08-15','Mexico','Masculino'),(50,'Samantha','Johnson','1988-07-20','USA','Femenino'),(51,'William','Smith','1992-05-15','USA','Masculino'),(52,'Isabella','Martinez','1985-09-28','Spain','Femenino'),(53,'Alexander','Garcia','1979-11-10','Mexico','Masculino'),(54,'Olivia','Jones','1983-03-05','Canada','Femenino'),(55,'James','Rodriguez','1976-06-30','USA','Masculino');
/*!40000 ALTER TABLE `persona` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `validar_fecha_nacimiento` BEFORE INSERT ON `persona` FOR EACH ROW BEGIN
    DECLARE fecha_actual DATE;
    DECLARE mensaje_error VARCHAR(255);
    
    SET fecha_actual = CURDATE();   
    IF NEW.fecha_nacimiento > fecha_actual THEN       
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'ERROR: <<FECHA NACIMIENTO MAYOR FECHA ACTUAL>>';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `prestamo`
--

DROP TABLE IF EXISTS `prestamo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prestamo` (
  `id_prestamo` int NOT NULL AUTO_INCREMENT,
  `id_socio` int NOT NULL,
  `id_biblioteca` int NOT NULL,
  `fecha_prestamo` date DEFAULT (curdate()),
  `fecha_esperada_devolucion` date DEFAULT NULL,
  PRIMARY KEY (`id_prestamo`),
  UNIQUE KEY `id_prestamo` (`id_prestamo`),
  KEY `fk_id_socio_prestamo` (`id_socio`),
  KEY `fk_id_biblioteca_prestamo` (`id_biblioteca`),
  CONSTRAINT `fk_id_biblioteca_prestamo` FOREIGN KEY (`id_biblioteca`) REFERENCES `biblioteca` (`id_biblioteca`),
  CONSTRAINT `fk_id_socio_prestamo` FOREIGN KEY (`id_socio`) REFERENCES `socio` (`id_socio`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prestamo`
--

LOCK TABLES `prestamo` WRITE;
/*!40000 ALTER TABLE `prestamo` DISABLE KEYS */;
INSERT INTO `prestamo` VALUES (1,1,1,'2024-04-11','2024-04-25'),(2,1,1,'2024-04-12','2024-04-26'),(3,2,1,'2024-04-13','2024-04-27'),(4,2,3,'2024-04-14','2024-04-28'),(5,3,3,'2024-04-15','2024-04-29'),(6,4,3,'2024-04-16','2024-04-30'),(7,5,4,'2024-04-17','2024-05-01'),(8,6,4,'2024-04-18','2024-05-02'),(9,7,2,'2024-04-19','2024-05-03'),(10,8,1,'2024-04-20','2024-05-04'),(11,9,1,'2024-04-21','2024-05-05'),(12,12,2,'2024-04-22','2024-05-06'),(13,3,3,'2024-04-23','2024-05-07'),(14,10,2,'2024-04-24','2024-05-08'),(15,11,4,'2024-04-25','2024-05-09'),(16,12,4,'2024-04-26','2024-05-10'),(17,8,7,'2024-04-27','2024-05-11'),(18,13,8,'2024-04-28','2024-05-12'),(19,13,9,'2024-04-29','2024-05-13'),(20,1,10,'2024-04-30','2024-05-14'),(21,14,1,'2024-05-01','2024-05-15'),(22,1,2,'2024-05-02','2024-05-16'),(23,3,3,'2024-05-03','2024-05-17'),(24,4,4,'2024-05-04','2024-05-18'),(25,5,5,'2024-05-05','2024-05-19'),(26,6,6,'2024-05-06','2024-05-20'),(27,7,7,'2024-05-07','2024-05-21'),(28,3,8,'2024-05-08','2024-05-22'),(29,3,9,'2024-05-09','2024-05-23'),(30,4,10,'2024-05-10','2024-05-24');
/*!40000 ALTER TABLE `prestamo` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_validar_fecha_prestamo` BEFORE INSERT ON `prestamo` FOR EACH ROW BEGIN
    DECLARE fecha_actual DATE;
    DECLARE mensaje_error VARCHAR(255);
    SET fecha_actual = CURDATE();   
    IF NEW.fecha_prestamo > fecha_actual THEN       
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'ERROR: <<FECHA PRESTAMO MAYOR FECHA ACTUAL>>';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `socio`
--

DROP TABLE IF EXISTS `socio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `socio` (
  `id_socio` int NOT NULL AUTO_INCREMENT,
  `id_persona` int DEFAULT NULL,
  `correo` varchar(255) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  UNIQUE KEY `id_socio` (`id_socio`),
  UNIQUE KEY `correo` (`correo`),
  KEY `fk_id_socio_persona` (`id_persona`),
  CONSTRAINT `fk_id_socio_persona` FOREIGN KEY (`id_persona`) REFERENCES `persona` (`id_persona`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socio`
--

LOCK TABLES `socio` WRITE;
/*!40000 ALTER TABLE `socio` DISABLE KEYS */;
INSERT INTO `socio` VALUES (1,1,'correo1@example.com','234567891'),(2,2,'correo2@example.com','234567890'),(3,3,'correo3@example.com','345678901'),(4,4,'correo4@example.com','456789012'),(5,5,'correo5@example.com','567890123'),(6,6,'correo6@example.com','678901234'),(7,7,'correo7@example.com','789012345'),(8,8,'correo8@example.com','890123456'),(9,9,'correo9@example.com','901234567'),(10,10,'correo10@example.com','012345678'),(11,11,'correo11@example.com','111111111'),(12,12,'correo12@example.com','222222222'),(13,13,'correo13@example.com','333333333'),(14,14,'correo14@example.com','444444444'),(15,15,'correo15@example.com','555555555');
/*!40000 ALTER TABLE `socio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stg_cambios_empleados`
--

DROP TABLE IF EXISTS `stg_cambios_empleados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stg_cambios_empleados` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_empleado` int DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `apellido` varchar(255) DEFAULT NULL,
  `tipo_operacion` enum('Contratación','Despido') DEFAULT NULL,
  `fecha_hora` date DEFAULT (curdate()),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stg_cambios_empleados`
--

LOCK TABLES `stg_cambios_empleados` WRITE;
/*!40000 ALTER TABLE `stg_cambios_empleados` DISABLE KEYS */;
/*!40000 ALTER TABLE `stg_cambios_empleados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vista_empleados_biblioteca`
--

DROP TABLE IF EXISTS `vista_empleados_biblioteca`;
/*!50001 DROP VIEW IF EXISTS `vista_empleados_biblioteca`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_empleados_biblioteca` AS SELECT 
 1 AS `id_empleado`,
 1 AS `empleado`,
 1 AS `cargo`,
 1 AS `biblioteca`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_estadistica_por_biblioteca`
--

DROP TABLE IF EXISTS `vista_estadistica_por_biblioteca`;
/*!50001 DROP VIEW IF EXISTS `vista_estadistica_por_biblioteca`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_estadistica_por_biblioteca` AS SELECT 
 1 AS `id_biblioteca`,
 1 AS `biblioteca`,
 1 AS `cantidad_empleados`,
 1 AS `cantidad_libros`,
 1 AS `cantidad_prestamos`,
 1 AS `cantidad_multas`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_historial_prestamos_por_persona`
--

DROP TABLE IF EXISTS `vista_historial_prestamos_por_persona`;
/*!50001 DROP VIEW IF EXISTS `vista_historial_prestamos_por_persona`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_historial_prestamos_por_persona` AS SELECT 
 1 AS `nombre_libro`,
 1 AS `fecha_prestamo`,
 1 AS `fecha_devolucion`,
 1 AS `socio`,
 1 AS `dias_prestado`,
 1 AS `estado`,
 1 AS `estado_devolucion`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_libros_en_prestamo`
--

DROP TABLE IF EXISTS `vista_libros_en_prestamo`;
/*!50001 DROP VIEW IF EXISTS `vista_libros_en_prestamo`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_libros_en_prestamo` AS SELECT 
 1 AS `id_prestamo`,
 1 AS `id_libro`,
 1 AS `libro`,
 1 AS `socio`,
 1 AS `estado`,
 1 AS `fecha_esperada_devolucion`,
 1 AS `biblioteca`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_multas_pendientes_socios`
--

DROP TABLE IF EXISTS `vista_multas_pendientes_socios`;
/*!50001 DROP VIEW IF EXISTS `vista_multas_pendientes_socios`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_multas_pendientes_socios` AS SELECT 
 1 AS `id_socio`,
 1 AS `socio`,
 1 AS `correo`,
 1 AS `suma_multas_pendientes`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'biblioflex'
--

--
-- Dumping routines for database 'biblioflex'
--
/*!50003 DROP FUNCTION IF EXISTS `cantidad_dias_prestado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `cantidad_dias_prestado`(
    fecha_prestamo DATE, 
    fecha_devolucion DATE 
) RETURNS int
    DETERMINISTIC
BEGIN
    -- VERIFICAR SI LA FECHA DE PRÉSTAMO ES NULA
    IF fecha_prestamo IS NULL THEN
        RETURN NULL; 
    END IF;
    
    -- VERIFICAR SI LA FECHA DE DEVOLUCIÓN ES NULA, EN CASO AFIRMATIVO, SE ASUME LA FECHA ACTUAL
    IF fecha_devolucion IS NULL THEN
        SELECT CURRENT_DATE() INTO fecha_devolucion; 
    END IF;
    
    -- CALCULAR LA CANTIDAD DE DÍAS PRESTADO Y RETORNAR EL RESULTADO
    RETURN DATEDIFF(fecha_devolucion, fecha_prestamo); 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `obtener_estado_devolucion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `obtener_estado_devolucion`(fecha_devolucion DATE) RETURNS varchar(15) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
    IF fecha_devolucion IS NULL THEN
        RETURN 'NO DEVUELTO';
    ELSE
        RETURN 'DEVUELTO';
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `prestamo_esta_vencido` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `prestamo_esta_vencido`(
    fecha_esperada_devolucion DATE 
) RETURNS varchar(50) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
    DECLARE fecha_actual DATE; 
    DECLARE devolucion_vencida BOOLEAN; 
    DECLARE dias_restantes INT; 
    
    -- OBTENER LA FECHA ACTUAL
    SELECT CURRENT_DATE() INTO fecha_actual;
    
    -- COMPROBAR SI LA DEVOLUCIÓN ESTÁ VENCIDA
    IF fecha_esperada_devolucion > fecha_actual THEN
        SET devolucion_vencida = FALSE; 
    ELSE
        SET devolucion_vencida = TRUE;
    END IF;
    
    -- CALCULAR LOS DÍAS RESTANTES O PASADOS DESDE LA FECHA DE DEVOLUCIÓN ESPERADA
    SET dias_restantes = DATEDIFF(fecha_actual, fecha_esperada_devolucion);
    
    -- RETORNAR EL RESULTADO FORMATEADO
    IF devolucion_vencida = TRUE THEN
        RETURN CONCAT('VENCIDO (', dias_restantes, ' DÍAS)'); -- EL PRÉSTAMO ESTÁ VENCIDO
    ELSE
        RETURN CONCAT('RESTAN (', dias_restantes*-1, ' DÍAS)'); -- QUEDAN DÍAS PARA EL VENCIMIENTO DEL PRÉSTAMO
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `buscar_libros_en_biblioteca` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `buscar_libros_en_biblioteca`(
    IN id_biblioteca INT, 
    IN titulo_libro VARCHAR(255),
    IN autor_libro VARCHAR(255),
    IN editorial_libro VARCHAR(255)
)
BEGIN
    SELECT libro.id_isbn_libro, libro.titulo, libro.editorial, libro.fecha_publicacion, count(1) as stock, biblioteca.nombre  AS nombre_biblioteca, CONCAT(persona.nombre, ' ', persona.apellido) AS autor
    FROM libro
    INNER JOIN inventario_libro ON libro.id_isbn_libro = inventario_libro.id_isbn_libro
    INNER JOIN libro_autor ON libro_autor.id_isbn_libro = inventario_libro.id_isbn_libro
    INNER JOIN persona ON persona.id_persona = libro_autor.id_persona
    INNER JOIN biblioteca ON inventario_libro.id_biblioteca = biblioteca.id_biblioteca
    WHERE inventario_libro.id_biblioteca = id_biblioteca
        AND (titulo_libro IS NULL OR libro.titulo LIKE CONCAT('%', titulo_libro, '%'))
        AND (autor_libro IS NULL OR libro.id_isbn_libro IN (SELECT id_isbn_libro FROM libro_autor WHERE id_persona IN (SELECT id_persona FROM persona WHERE CONCAT(nombre, ' ', apellido) LIKE CONCAT('%', autor_libro, '%'))))
        AND (editorial_libro IS NULL OR libro.editorial LIKE CONCAT('%', editorial_libro, '%'))
    GROUP BY libro.id_isbn_libro, biblioteca.id_biblioteca, autor
    HAVING stock > 0;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `registrar_libro_en_prestamo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `registrar_libro_en_prestamo`(
    IN p_id_prestamo INT,
    IN p_id_libro INT,
    IN p_id_biblioteca INT
)
BEGIN
   
    DECLARE existe_libro_en_biblioteca BOOLEAN;
    DECLARE existe_libro_en_prestamo BOOLEAN;
 
    -- VALIDACIONES ANTES DE PEDIR PRESTAMO: 1) VERIFICAR SI EL LIBRO SE ENCUENTRA EN LA BIBLIOTECA.
    SET  existe_libro_en_biblioteca =  EXISTS(SELECT 1 FROM inventario_libro WHERE id_libro = p_id_libro AND id_biblioteca = p_id_biblioteca);

    IF NOT existe_libro_en_biblioteca THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'ERROR: <<NO EXISTE ESE LIBRO EN LA BIBLIOTECA>>.';
    END IF;

    -- VALIDACIONES ANTES DE PEDIR PRESTAMO: 2) VERIFICAR QUE EL LIBRO NO SE ENCUENTRA PRESTADO
    SELECT EXISTS(SELECT 1 FROM libro_prestado  WHERE fecha_devolucion IS NULL AND libro_prestado.id_prestamo = p_id_libro) INTO existe_libro_en_prestamo;
    IF existe_libro_en_prestamo THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'ERROR: <<ESE LIBRO YA SE ENCUENTRA EN PRESTAMO POR OTRO SOCIO>>.';
    END IF;

    -- INSERTAR LIBRO PRESTADO EN EL PRESTAMO
    INSERT INTO libro_prestado (id_prestamo, id_libro, fecha_devolucion)
    VALUES (p_id_prestamo, p_id_libro, NULL);

    SELECT '<<LIBRO AGREGADO EN PRESTAMO>>.' AS mensaje;
       
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `registrar_prestamo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `registrar_prestamo`(
    IN p_id_socio INT,
    IN p_id_biblioteca INT,
    IN p_fecha_inicio DATE,
    IN p_fecha_devolucion_propuesta DATE
)
BEGIN
    DECLARE existe_socio BOOLEAN;
    DECLARE existe_multas_impagas BOOLEAN;
    DECLARE existe_prestamo_vencido BOOLEAN;
    DECLARE id_prestamo INT;


    -- VALIDACIONES ANTES DE PEDIR PRESTAMO: 1) VERIFICAR SI EL SOCIO ESTÁ REGISTRADO
    SELECT EXISTS(SELECT 1 FROM socio WHERE id_socio = p_id_socio) INTO existe_socio;
    IF NOT existe_socio THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'ERROR: <<SOCIO INEXISTENTE>>.';
    END IF;

    -- VALIDACIONES ANTES DE PEDIR PRESTAMO: 2A) FECHA DE DEVOLUCION PROPUESTA NO INGRESADA > COLOCAMOS LA FECHA INICIO + 14 DIAS. 2B) FECHA DE DEVOLUCION PROPUESTA ES MENOR A LA FECHA DE INCIO > COLOCAMOS LA FECHA DE HOY + 14 DIAS.
    
    IF p_fecha_inicio IS NULL THEN 
	 SET p_fecha_inicio = CURDATE();
	END IF;

    IF p_fecha_devolucion_propuesta IS NULL OR p_fecha_devolucion_propuesta < p_fecha_inicio THEN  
		SET p_fecha_devolucion_propuesta = DATE_ADD(p_fecha_inicio, INTERVAL 14 DAY);
	END IF;

    -- VALIDACIONES ANTES DE PEDIR PRESTAMO: 3) VERIFICAR QUE EL USUARIO NO TENGA MULTAS
    SELECT EXISTS(SELECT 1 FROM multa JOIN prestamo ON prestamo.id_prestamo = multa.id_prestamo  WHERE multa.estado_multa = 0 AND prestamo.id_socio = p_id_socio ) INTO existe_multas_impagas;

    IF existe_multas_impagas THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "ERROR: <<SOCIO CON MULTAS ADEUDADAS>>. ";
    END IF;

    -- VALIDACIONES ANTES DE PEDIR PRESTAMO: 4) VERIFICAR QUE EL USUARIO NO TENGA PRESTAMOS VENCIDOS PENDIENTES
    SELECT EXISTS(SELECT 1 FROM libro_prestado 
	JOIN prestamo ON prestamo.id_prestamo = libro_prestado.id_prestamo 
    WHERE libro_prestado.fecha_devolucion IS NULL AND CURRENT_DATE > prestamo.fecha_esperada_devolucion AND prestamo.id_socio = p_id_socio) INTO existe_prestamo_vencido;


    IF existe_prestamo_vencido THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'ERROR: <<SOCIO CON PRESTAMOS VENCIDOS PENDIENTES>>.';
    END IF;

    -- INSERTAR PRESTAMO
    INSERT INTO prestamo (id_socio, id_biblioteca, fecha_prestamo, fecha_esperada_devolucion)
    VALUES (p_id_socio, p_id_biblioteca, p_fecha_inicio,  p_fecha_devolucion_propuesta);
    -- OBTENER ID PRESTAMO RECIEN INSERTADO
    SET id_prestamo = LAST_INSERT_ID();

    SELECT CONCAT('<<PRESTAMO REGISTRADO EXITOSAMENTE>>.',id_prestamo) AS mensaje;
       
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `vista_empleados_biblioteca`
--

/*!50001 DROP VIEW IF EXISTS `vista_empleados_biblioteca`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_empleados_biblioteca` AS select `empleado`.`id_empleado` AS `id_empleado`,concat(`persona`.`nombre`,' ',`persona`.`apellido`) AS `empleado`,`cargo_empleado`.`nombre_cargo` AS `cargo`,`biblioteca`.`nombre` AS `biblioteca` from (((`empleado` join `persona` on((`persona`.`id_persona` = `empleado`.`id_persona`))) join `cargo_empleado` on((`empleado`.`id_cargo` = `cargo_empleado`.`id_cargo`))) join `biblioteca` on((`biblioteca`.`id_biblioteca` = `empleado`.`id_biblioteca`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_estadistica_por_biblioteca`
--

/*!50001 DROP VIEW IF EXISTS `vista_estadistica_por_biblioteca`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_estadistica_por_biblioteca` AS select `biblioteca`.`id_biblioteca` AS `id_biblioteca`,`biblioteca`.`nombre` AS `biblioteca`,count(distinct `empleado`.`id_empleado`) AS `cantidad_empleados`,count(distinct `inventario_libro`.`id_libro`) AS `cantidad_libros`,count(distinct `prestamo`.`id_prestamo`) AS `cantidad_prestamos`,count(distinct `multa`.`id_multa`) AS `cantidad_multas` from ((((`biblioteca` join `empleado` on((`empleado`.`id_biblioteca` = `biblioteca`.`id_biblioteca`))) join `inventario_libro` on((`biblioteca`.`id_biblioteca` = `inventario_libro`.`id_biblioteca`))) join `prestamo` on((`prestamo`.`id_biblioteca` = `biblioteca`.`id_biblioteca`))) join `multa` on((`multa`.`id_prestamo` = `prestamo`.`id_prestamo`))) group by `biblioteca`.`id_biblioteca` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_historial_prestamos_por_persona`
--

/*!50001 DROP VIEW IF EXISTS `vista_historial_prestamos_por_persona`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_historial_prestamos_por_persona` AS select `libro`.`titulo` AS `nombre_libro`,`prestamo`.`fecha_prestamo` AS `fecha_prestamo`,`libro_prestado`.`fecha_devolucion` AS `fecha_devolucion`,concat(`socio`.`id_socio`,' ',`persona`.`nombre`,' ',`persona`.`apellido`) AS `socio`,`cantidad_dias_prestado`(`prestamo`.`fecha_prestamo`,`libro_prestado`.`fecha_devolucion`) AS `dias_prestado`,`prestamo_esta_vencido`(`prestamo`.`fecha_esperada_devolucion`) AS `estado`,`obtener_estado_devolucion`(`libro_prestado`.`fecha_devolucion`) AS `estado_devolucion` from (((((`libro_prestado` join `prestamo` on((`prestamo`.`id_prestamo` = `libro_prestado`.`id_prestamo`))) join `socio` on((`socio`.`id_socio` = `prestamo`.`id_socio`))) join `persona` on((`persona`.`id_persona` = `socio`.`id_persona`))) join `inventario_libro` on((`inventario_libro`.`id_libro` = `libro_prestado`.`id_libro`))) join `libro` on((`libro`.`id_isbn_libro` = `inventario_libro`.`id_isbn_libro`))) order by `persona`.`id_persona` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_libros_en_prestamo`
--

/*!50001 DROP VIEW IF EXISTS `vista_libros_en_prestamo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_libros_en_prestamo` AS select `prestamo`.`id_prestamo` AS `id_prestamo`,`inventario_libro`.`id_libro` AS `id_libro`,`libro`.`titulo` AS `libro`,concat(`socio`.`id_socio`,' ',`persona`.`nombre`,' ',`persona`.`apellido`) AS `socio`,`prestamo_esta_vencido`(`prestamo`.`fecha_esperada_devolucion`) AS `estado`,`prestamo`.`fecha_esperada_devolucion` AS `fecha_esperada_devolucion`,concat(`biblioteca`.`id_biblioteca`,' ',`biblioteca`.`nombre`) AS `biblioteca` from ((((((`libro_prestado` join `prestamo` on((`prestamo`.`id_prestamo` = `libro_prestado`.`id_prestamo`))) join `socio` on((`socio`.`id_socio` = `prestamo`.`id_socio`))) join `persona` on((`persona`.`id_persona` = `socio`.`id_persona`))) join `inventario_libro` on((`inventario_libro`.`id_libro` = `libro_prestado`.`id_libro`))) join `libro` on((`libro`.`id_isbn_libro` = `inventario_libro`.`id_isbn_libro`))) join `biblioteca` on((`biblioteca`.`id_biblioteca` = `prestamo`.`id_biblioteca`))) where (`libro_prestado`.`fecha_devolucion` is null) order by `biblioteca`.`id_biblioteca` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_multas_pendientes_socios`
--

/*!50001 DROP VIEW IF EXISTS `vista_multas_pendientes_socios`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_multas_pendientes_socios` AS select `prestamo`.`id_socio` AS `id_socio`,concat(`persona`.`nombre`,' ',`persona`.`apellido`) AS `socio`,`socio`.`correo` AS `correo`,sum(`multa`.`monto_multa`) AS `suma_multas_pendientes` from (((((`prestamo` join `libro_prestado` on((`libro_prestado`.`id_prestamo` = `prestamo`.`id_prestamo`))) join `multa` on((`multa`.`id_prestamo` = `prestamo`.`id_prestamo`))) join `socio` on((`socio`.`id_socio` = `prestamo`.`id_socio`))) join `persona` on((`persona`.`id_persona` = `socio`.`id_persona`))) join `biblioteca` on((`biblioteca`.`id_biblioteca` = `prestamo`.`id_biblioteca`))) where (`multa`.`estado_multa` = false) group by `prestamo`.`id_socio` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-26 18:52:03
