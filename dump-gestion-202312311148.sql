-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: gestion
-- ------------------------------------------------------
-- Server version	8.0.26

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `EspecialidadUser`
--

DROP TABLE IF EXISTS `EspecialidadUser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `EspecialidadUser` (
  `EspecialidadesId` int NOT NULL,
  `UsuariosId` int NOT NULL,
  PRIMARY KEY (`EspecialidadesId`,`UsuariosId`),
  KEY `IX_EspecialidadUser_UsuariosId` (`UsuariosId`),
  CONSTRAINT `FK_EspecialidadUser_T_Especialidad_EspecialidadesId` FOREIGN KEY (`EspecialidadesId`) REFERENCES `T_Especialidad` (`Id`) ON DELETE CASCADE,
  CONSTRAINT `FK_EspecialidadUser_T_User_UsuariosId` FOREIGN KEY (`UsuariosId`) REFERENCES `T_User` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EspecialidadUser`
--

LOCK TABLES `EspecialidadUser` WRITE;
/*!40000 ALTER TABLE `EspecialidadUser` DISABLE KEYS */;
/*!40000 ALTER TABLE `EspecialidadUser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `InvitacionLink`
--

DROP TABLE IF EXISTS `InvitacionLink`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `InvitacionLink` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Link` longtext NOT NULL,
  `correo` longtext NOT NULL,
  `code` longtext NOT NULL,
  `FechaCreacion` datetime(6) NOT NULL,
  `Estado` tinyint(1) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `InvitacionLink`
--

LOCK TABLES `InvitacionLink` WRITE;
/*!40000 ALTER TABLE `InvitacionLink` DISABLE KEYS */;
INSERT INTO `InvitacionLink` VALUES (1,'https://localhost:44448/Registro/726654','juvb9619@gmail.com','726654','2023-12-25 18:12:42.391254',1),(2,'https://localhost:44448/Registro/302707','juvb9619@gmail.com','302707','2023-12-30 02:13:24.468213',1);
/*!40000 ALTER TABLE `InvitacionLink` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PermissionRole`
--

DROP TABLE IF EXISTS `PermissionRole`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PermissionRole` (
  `PermisosId` int NOT NULL,
  `RolesId` int NOT NULL,
  PRIMARY KEY (`PermisosId`,`RolesId`),
  KEY `IX_PermissionRole_RolesId` (`RolesId`),
  CONSTRAINT `FK_PermissionRole_T_Permiso_PermisosId` FOREIGN KEY (`PermisosId`) REFERENCES `T_Permiso` (`Id`) ON DELETE CASCADE,
  CONSTRAINT `FK_PermissionRole_T_Rol_RolesId` FOREIGN KEY (`RolesId`) REFERENCES `T_Rol` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PermissionRole`
--

LOCK TABLES `PermissionRole` WRITE;
/*!40000 ALTER TABLE `PermissionRole` DISABLE KEYS */;
/*!40000 ALTER TABLE `PermissionRole` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RoleUser`
--

DROP TABLE IF EXISTS `RoleUser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RoleUser` (
  `RoleId` int NOT NULL,
  `UserId` int NOT NULL,
  PRIMARY KEY (`RoleId`,`UserId`),
  KEY `IX_RoleUser_UserId` (`UserId`),
  CONSTRAINT `FK_RoleUser_T_Rol_RoleId` FOREIGN KEY (`RoleId`) REFERENCES `T_Rol` (`Id`) ON DELETE CASCADE,
  CONSTRAINT `FK_RoleUser_T_User_UserId` FOREIGN KEY (`UserId`) REFERENCES `T_User` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RoleUser`
--

LOCK TABLES `RoleUser` WRITE;
/*!40000 ALTER TABLE `RoleUser` DISABLE KEYS */;
INSERT INTO `RoleUser` VALUES (2,4),(3,4),(2,6),(3,6),(4,6);
/*!40000 ALTER TABLE `RoleUser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `T_Anexo`
--

DROP TABLE IF EXISTS `T_Anexo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `T_Anexo` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `SolicitudDetalleId` int NOT NULL,
  `FechaUltimaModificacion` timestamp NULL DEFAULT NULL,
  `TipoAnexoId` int NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `IX_T_Anexo_SolicitudDetalleId` (`SolicitudDetalleId`),
  KEY `IX_T_Anexo_TipoAnexoId` (`TipoAnexoId`),
  CONSTRAINT `FK_T_Anexo_T_Solicitud_Detalle_SolicitudDetalleId` FOREIGN KEY (`SolicitudDetalleId`) REFERENCES `T_Solicitud_Detalle` (`Id`) ON DELETE CASCADE,
  CONSTRAINT `FK_T_Anexo_T_Tipo_Anexo_TipoAnexoId` FOREIGN KEY (`TipoAnexoId`) REFERENCES `T_Tipo_Anexo` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `T_Anexo`
--

LOCK TABLES `T_Anexo` WRITE;
/*!40000 ALTER TABLE `T_Anexo` DISABLE KEYS */;
INSERT INTO `T_Anexo` VALUES (6,5,'2023-12-25 13:04:43',1),(7,5,'2023-12-25 13:11:17',2),(8,5,NULL,4),(9,5,NULL,6),(10,6,NULL,1),(11,6,NULL,2),(12,6,NULL,3),(13,6,NULL,4),(14,6,NULL,5),(15,6,NULL,6),(16,6,NULL,7),(17,7,NULL,1),(18,7,NULL,2),(19,7,NULL,3),(20,7,NULL,4),(21,7,NULL,5),(22,7,NULL,6),(23,7,NULL,7),(24,8,NULL,1),(25,8,NULL,3),(26,8,NULL,5),(27,8,NULL,7),(28,9,NULL,1),(29,9,NULL,3),(30,9,NULL,5),(31,9,NULL,7),(32,10,NULL,1),(33,10,NULL,3),(34,10,NULL,5),(35,10,NULL,7);
/*!40000 ALTER TABLE `T_Anexo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `T_AnexoField`
--

DROP TABLE IF EXISTS `T_AnexoField`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `T_AnexoField` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Nombre` longtext NOT NULL,
  `Value` longtext NOT NULL,
  `AnexoId` int NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `IX_T_AnexoField_AnexoId` (`AnexoId`),
  CONSTRAINT `FK_T_AnexoField_T_Anexo_AnexoId` FOREIGN KEY (`AnexoId`) REFERENCES `T_Anexo` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `T_AnexoField`
--

LOCK TABLES `T_AnexoField` WRITE;
/*!40000 ALTER TABLE `T_AnexoField` DISABLE KEYS */;
INSERT INTO `T_AnexoField` VALUES (23,'dia','',6),(24,'mes','',6),(25,'anio','',6),(26,'nombres','juan vera',6),(27,'objetivo','',6),(28,'finalidad','',6),(29,'cedula','',6),(30,'facultad','',6),(31,'riesgos','',6),(32,'probabilidad','',6),(33,'nombreTabla','',6),(34,'titulo','investigacion A TEST',7),(35,'investigador','Msc. Juan Vera',7),(36,'coInvestigadores','ninguno',7),(37,'contacto','yo mismo',7),(38,'inicioInvestigacion','dev1 fecha',7),(39,'finInvestigacion','dev2 fecha',7),(40,'financiamiento','dev3 fecha',7),(41,'obGeneral','',7),(42,'obEspecifico','',7),(43,'procedimiento','',7),(44,'riesgos','',7),(45,'consulta','',7),(46,'ventajas','',7),(47,'recoleccionData','',7),(48,'disenoInvestigacion','',7),(49,'consentimiento','',7),(50,'instrumentos','',7),(51,'fechaEnvio','',7),(52,'certificoRecoleccion','',7),(53,'certificoRevision','',7),(54,'dia','',20),(55,'mes','',20),(56,'anio','',20);
/*!40000 ALTER TABLE `T_AnexoField` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `T_Archivo`
--

DROP TABLE IF EXISTS `T_Archivo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `T_Archivo` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Nombre` longtext NOT NULL,
  `SolicitudDetalleId` int NOT NULL,
  `Url` longtext NOT NULL,
  `FechaCreacion` timestamp NOT NULL,
  `NumeroDescargas` int NOT NULL,
  `Extension` longtext NOT NULL,
  `UsuarioId` int NOT NULL,
  `TipoArchivoId` int NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `IX_T_Archivo_TipoArchivoId` (`TipoArchivoId`),
  KEY `IX_T_Archivo_UsuarioId` (`UsuarioId`),
  CONSTRAINT `FK_T_Archivo_T_Tipo_Archivo_TipoArchivoId` FOREIGN KEY (`TipoArchivoId`) REFERENCES `T_Tipo_Archivo` (`Id`) ON DELETE CASCADE,
  CONSTRAINT `FK_T_Archivo_T_User_UsuarioId` FOREIGN KEY (`UsuarioId`) REFERENCES `T_User` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `T_Archivo`
--

LOCK TABLES `T_Archivo` WRITE;
/*!40000 ALTER TABLE `T_Archivo` DISABLE KEYS */;
INSERT INTO `T_Archivo` VALUES (6,'1660076494937.png',7,'','2023-12-25 13:48:37',0,'png',4,1),(7,'actividad_final.png',7,'','2023-12-25 13:48:37',0,'png',4,1),(8,'analisis_reto_judith.png',7,'','2023-12-25 13:48:37',0,'png',4,1),(9,'Reporte_nota_de_entrega_1.pdf',7,'C:\\Users\\Ing. Juan Vera\\Documents\\Ingenieria\\Desarrollo\\Dennys\\v2\\sgscei\\sistema-gestion-solicitudes\\uploads\\Reporte_nota_de_entrega_1.pdf','2023-12-25 22:52:08',0,'pdf',4,1),(10,'Reporte_nota_de_entrega_7 (6).pdf',7,'C:\\Users\\Ing. Juan Vera\\Documents\\Ingenieria\\Desarrollo\\Dennys\\v2\\sgscei\\sistema-gestion-solicitudes\\uploads\\Reporte_nota_de_entrega_7 (6).pdf','2023-12-25 22:52:09',0,'pdf',4,1),(11,'doc_prueba.xlsx',8,'C:\\Users\\Ing. Juan Vera\\Documents\\Ingenieria\\Desarrollo\\Dennys\\v2\\sgscei\\sistema-gestion-solicitudes\\uploads\\doc_prueba.xlsx','2023-12-29 21:01:34',0,'xlsx',4,1),(12,'Historias de Usuario 2023 -Fase 2 (1).xlsx',9,'C:\\Users\\Ing. Juan Vera\\Documents\\Ingenieria\\Desarrollo\\Dennys\\v2\\sgscei\\sistema-gestion-solicitudes\\uploads\\Historias de Usuario 2023 -Fase 2 (1).xlsx','2023-12-29 21:08:18',0,'xlsx',4,1);
/*!40000 ALTER TABLE `T_Archivo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `T_Asignacion`
--

DROP TABLE IF EXISTS `T_Asignacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `T_Asignacion` (
  `id` int NOT NULL AUTO_INCREMENT,
  `SolicitudDetalleId` int NOT NULL,
  `FechaAsignacion` timestamp NULL DEFAULT NULL,
  `FechaEntrega` timestamp NULL DEFAULT NULL,
  `UserAsignadoId` int NOT NULL,
  `ArchivoId` int DEFAULT NULL,
  `DocumentoId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `IX_T_Asignacion_ArchivoId` (`ArchivoId`),
  KEY `IX_T_Asignacion_DocumentoId` (`DocumentoId`),
  KEY `IX_T_Asignacion_SolicitudDetalleId` (`SolicitudDetalleId`),
  KEY `IX_T_Asignacion_UserAsignadoId` (`UserAsignadoId`),
  CONSTRAINT `FK_T_Asignacion_T_Archivo_ArchivoId` FOREIGN KEY (`ArchivoId`) REFERENCES `T_Archivo` (`Id`),
  CONSTRAINT `FK_T_Asignacion_T_Archivo_DocumentoId` FOREIGN KEY (`DocumentoId`) REFERENCES `T_Archivo` (`Id`),
  CONSTRAINT `FK_T_Asignacion_T_Solicitud_Detalle_SolicitudDetalleId` FOREIGN KEY (`SolicitudDetalleId`) REFERENCES `T_Solicitud_Detalle` (`Id`) ON DELETE CASCADE,
  CONSTRAINT `FK_T_Asignacion_T_User_UserAsignadoId` FOREIGN KEY (`UserAsignadoId`) REFERENCES `T_User` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `T_Asignacion`
--

LOCK TABLES `T_Asignacion` WRITE;
/*!40000 ALTER TABLE `T_Asignacion` DISABLE KEYS */;
INSERT INTO `T_Asignacion` VALUES (2,9,'2023-12-29 21:16:11',NULL,6,NULL,NULL);
/*!40000 ALTER TABLE `T_Asignacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `T_Especialidad`
--

DROP TABLE IF EXISTS `T_Especialidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `T_Especialidad` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(50) NOT NULL,
  `Estado` tinyint(1) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `T_Especialidad`
--

LOCK TABLES `T_Especialidad` WRITE;
/*!40000 ALTER TABLE `T_Especialidad` DISABLE KEYS */;
INSERT INTO `T_Especialidad` VALUES (1,'Investigador 1',1);
/*!40000 ALTER TABLE `T_Especialidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `T_Estado_Solicitud`
--

DROP TABLE IF EXISTS `T_Estado_Solicitud`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `T_Estado_Solicitud` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `T_Estado_Solicitud`
--

LOCK TABLES `T_Estado_Solicitud` WRITE;
/*!40000 ALTER TABLE `T_Estado_Solicitud` DISABLE KEYS */;
INSERT INTO `T_Estado_Solicitud` VALUES (1,'Creada'),(2,'Iniciada'),(3,'Factibilidad'),(4,'Asignada'),(5,'En Revisión'),(6,'Resolución'),(7,'Finalizada');
/*!40000 ALTER TABLE `T_Estado_Solicitud` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `T_Permiso`
--

DROP TABLE IF EXISTS `T_Permiso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `T_Permiso` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(55) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `T_Permiso`
--

LOCK TABLES `T_Permiso` WRITE;
/*!40000 ALTER TABLE `T_Permiso` DISABLE KEYS */;
/*!40000 ALTER TABLE `T_Permiso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `T_Resolucion`
--

DROP TABLE IF EXISTS `T_Resolucion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `T_Resolucion` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `FechaEmision` datetime DEFAULT NULL,
  `SolicitudId` int NOT NULL,
  `ArchivoId` int NOT NULL,
  `Observacion` longtext,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `IX_T_Resolucion_ArchivoId` (`ArchivoId`),
  UNIQUE KEY `IX_T_Resolucion_SolicitudId` (`SolicitudId`),
  CONSTRAINT `FK_T_Resolucion_T_Archivo_ArchivoId` FOREIGN KEY (`ArchivoId`) REFERENCES `T_Archivo` (`Id`) ON DELETE CASCADE,
  CONSTRAINT `FK_T_Resolucion_T_Solicitud_SolicitudId` FOREIGN KEY (`SolicitudId`) REFERENCES `T_Solicitud` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `T_Resolucion`
--

LOCK TABLES `T_Resolucion` WRITE;
/*!40000 ALTER TABLE `T_Resolucion` DISABLE KEYS */;
/*!40000 ALTER TABLE `T_Resolucion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `T_Rol`
--

DROP TABLE IF EXISTS `T_Rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `T_Rol` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(50) NOT NULL,
  `MaxUsers` int NOT NULL,
  `Estado` tinyint(1) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `T_Rol`
--

LOCK TABLES `T_Rol` WRITE;
/*!40000 ALTER TABLE `T_Rol` DISABLE KEYS */;
INSERT INTO `T_Rol` VALUES (1,'Presidente',1,1),(2,'Usuario Externo',50,1),(3,'Investigador',50,1),(4,'Miembro del Comite',1,1);
/*!40000 ALTER TABLE `T_Rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `T_Solicitud`
--

DROP TABLE IF EXISTS `T_Solicitud`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `T_Solicitud` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Codigo` varchar(45) DEFAULT NULL,
  `Titulo` longtext,
  `FechaCreacion` datetime DEFAULT NULL,
  `FechaRevision` datetime DEFAULT NULL,
  `FechaCierre` datetime DEFAULT NULL,
  `Apelacion` tinyint(1) DEFAULT NULL,
  `UsuarioId` int NOT NULL,
  `EstadoId` int NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `IX_T_Solicitud_EstadoId` (`EstadoId`),
  KEY `IX_T_Solicitud_UsuarioId` (`UsuarioId`),
  CONSTRAINT `FK_T_Solicitud_T_Estado_Solicitud_EstadoId` FOREIGN KEY (`EstadoId`) REFERENCES `T_Estado_Solicitud` (`Id`) ON DELETE CASCADE,
  CONSTRAINT `FK_T_Solicitud_T_User_UsuarioId` FOREIGN KEY (`UsuarioId`) REFERENCES `T_User` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `T_Solicitud`
--

LOCK TABLES `T_Solicitud` WRITE;
/*!40000 ALTER TABLE `T_Solicitud` DISABLE KEYS */;
INSERT INTO `T_Solicitud` VALUES (5,'C-5','Investigacion A','2023-12-25 12:56:47','2023-12-25 13:09:41','2023-12-25 13:17:35',NULL,4,7),(6,'C-6','Investigacion B','2023-12-25 13:26:06','2023-12-25 13:26:59','2023-12-25 13:27:46',NULL,4,7),(7,'C-7','Investigacion C','2023-12-25 13:28:01',NULL,NULL,NULL,4,2),(8,'C-8','Investigacion D','2023-12-29 20:56:55',NULL,NULL,NULL,4,2),(9,'C-9','Investigacion E','2023-12-29 21:04:26','2023-12-29 21:11:28',NULL,NULL,4,6),(10,'C-10','Investigacion F','2023-12-31 11:17:55',NULL,NULL,NULL,4,2);
/*!40000 ALTER TABLE `T_Solicitud` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `T_Solicitud_Detalle`
--

DROP TABLE IF EXISTS `T_Solicitud_Detalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `T_Solicitud_Detalle` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Observacion` longtext NOT NULL,
  `SolicitudId` int NOT NULL,
  `Factibilidad` tinyint(1) NOT NULL,
  `OtrosArchivos` tinyint(1) NOT NULL,
  `ArchivosSolicitados` longtext NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `IX_T_Solicitud_Detalle_SolicitudId` (`SolicitudId`),
  CONSTRAINT `FK_T_Solicitud_Detalle_T_Solicitud_SolicitudId` FOREIGN KEY (`SolicitudId`) REFERENCES `T_Solicitud` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `T_Solicitud_Detalle`
--

LOCK TABLES `T_Solicitud_Detalle` WRITE;
/*!40000 ALTER TABLE `T_Solicitud_Detalle` DISABLE KEYS */;
INSERT INTO `T_Solicitud_Detalle` VALUES (5,'',5,1,1,'hoja de vida y curriculum'),(6,'',6,1,1,'hoja de vida'),(7,'',7,0,1,'hoja de vida'),(8,'',8,0,1,'Archivo adicional'),(9,'',9,1,1,'hoja de vida'),(10,'',10,0,1,'suba archivo');
/*!40000 ALTER TABLE `T_Solicitud_Detalle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `T_Tipo_Anexo`
--

DROP TABLE IF EXISTS `T_Tipo_Anexo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `T_Tipo_Anexo` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `TituloPrincipal` longtext NOT NULL,
  `Subtitulo` longtext NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `T_Tipo_Anexo`
--

LOCK TABLES `T_Tipo_Anexo` WRITE;
/*!40000 ALTER TABLE `T_Tipo_Anexo` DISABLE KEYS */;
INSERT INTO `T_Tipo_Anexo` VALUES (1,'Anexo1A','Solicitud de análisis de propuestas de investigación'),(2,'Anexo1','Solicitud de análisis ético del proyecto de investigación'),(3,'Anexo2','Compromiso de buenas prácticas en investigación y respeto a las normas éticas de espol'),(4,'Anexo3','Solicitud de guía, información y normativas básicas respecto de buenas prácticas y ética en investigación del centro de investigación, facultad o institución de espol'),(5,'Anexo4','Declaración de asunción de responsabilidad para el uso adecuado de la información de carácter confidencial'),(6,'Anexo5','Información de derechos sobre datos personales y consentimiento para su conservación'),(7,'Anexo6','Consentimiento de datos personales de investigadores para su tratamiento y conservación al comité de etica de investigación de espol');
/*!40000 ALTER TABLE `T_Tipo_Anexo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `T_Tipo_Archivo`
--

DROP TABLE IF EXISTS `T_Tipo_Archivo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `T_Tipo_Archivo` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(75) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `T_Tipo_Archivo`
--

LOCK TABLES `T_Tipo_Archivo` WRITE;
/*!40000 ALTER TABLE `T_Tipo_Archivo` DISABLE KEYS */;
INSERT INTO `T_Tipo_Archivo` VALUES (1,'DocumentacionAdicional'),(2,'Informe'),(3,'Resolucion'),(4,'EntregasAdicionales');
/*!40000 ALTER TABLE `T_Tipo_Archivo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `T_Tipo_Solicitud`
--

DROP TABLE IF EXISTS `T_Tipo_Solicitud`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `T_Tipo_Solicitud` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) NOT NULL,
  `DiasPlazo` int NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `T_Tipo_Solicitud`
--

LOCK TABLES `T_Tipo_Solicitud` WRITE;
/*!40000 ALTER TABLE `T_Tipo_Solicitud` DISABLE KEYS */;
/*!40000 ALTER TABLE `T_Tipo_Solicitud` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `T_User`
--

DROP TABLE IF EXISTS `T_User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `T_User` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Nombres` varchar(100) NOT NULL,
  `Apellidos` varchar(100) NOT NULL,
  `Correo` varchar(100) NOT NULL,
  `Username` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ContrasenaHash` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Cedula` int NOT NULL,
  `FechaCreacion` timestamp NOT NULL,
  `FechaUltimoLogin` timestamp NULL DEFAULT NULL,
  `Estado` tinyint(1) NOT NULL,
  `IsInvited` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `T_User`
--

LOCK TABLES `T_User` WRITE;
/*!40000 ALTER TABLE `T_User` DISABLE KEYS */;
INSERT INTO `T_User` VALUES (4,'user2','dev','user2@gmail.com','user2@gmail.com','5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5',999999992,'2023-12-25 12:56:04',NULL,1,0),(6,'Diego','Benavides','juvb9619@gmail.com','juvb9619@gmail.com','5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5',1312561952,'2023-12-29 21:14:51',NULL,1,1);
/*!40000 ALTER TABLE `T_User` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `__EFMigrationsHistory`
--

DROP TABLE IF EXISTS `__EFMigrationsHistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `__EFMigrationsHistory` (
  `MigrationId` varchar(150) NOT NULL,
  `ProductVersion` varchar(32) NOT NULL,
  PRIMARY KEY (`MigrationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `__EFMigrationsHistory`
--

LOCK TABLES `__EFMigrationsHistory` WRITE;
/*!40000 ALTER TABLE `__EFMigrationsHistory` DISABLE KEYS */;
INSERT INTO `__EFMigrationsHistory` VALUES ('20231224020202_TablaInvitacion','7.0.9'),('20231224061800_isInvited','7.0.9');
/*!40000 ALTER TABLE `__EFMigrationsHistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `__efmigrationshistory`
--

DROP TABLE IF EXISTS `__efmigrationshistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `__efmigrationshistory` (
  `MigrationId` varchar(150) NOT NULL,
  `ProductVersion` varchar(32) NOT NULL,
  PRIMARY KEY (`MigrationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `__efmigrationshistory`
--

LOCK TABLES `__efmigrationshistory` WRITE;
/*!40000 ALTER TABLE `__efmigrationshistory` DISABLE KEYS */;
INSERT INTO `__efmigrationshistory` VALUES ('20230914180939_initial','7.0.9');
/*!40000 ALTER TABLE `__efmigrationshistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'gestion'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-31 11:48:15
