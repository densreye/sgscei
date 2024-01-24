-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: localhost    Database: gestion
-- ------------------------------------------------------
-- Server version	8.0.26

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
-- Table structure for table `especialidaduser`
--

DROP TABLE IF EXISTS `especialidaduser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `especialidaduser` (
  `EspecialidadesId` int NOT NULL,
  `UsuariosId` int NOT NULL,
  PRIMARY KEY (`EspecialidadesId`,`UsuariosId`),
  KEY `IX_EspecialidadUser_UsuariosId` (`UsuariosId`),
  CONSTRAINT `FK_EspecialidadUser_T_Especialidad_EspecialidadesId` FOREIGN KEY (`EspecialidadesId`) REFERENCES `t_especialidad` (`Id`) ON DELETE CASCADE,
  CONSTRAINT `FK_EspecialidadUser_T_User_UsuariosId` FOREIGN KEY (`UsuariosId`) REFERENCES `t_user` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `especialidaduser`
--

LOCK TABLES `especialidaduser` WRITE;
/*!40000 ALTER TABLE `especialidaduser` DISABLE KEYS */;
/*!40000 ALTER TABLE `especialidaduser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissionrole`
--

DROP TABLE IF EXISTS `permissionrole`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permissionrole` (
  `PermisosId` int NOT NULL,
  `RolesId` int NOT NULL,
  PRIMARY KEY (`PermisosId`,`RolesId`),
  KEY `IX_PermissionRole_RolesId` (`RolesId`),
  CONSTRAINT `FK_PermissionRole_T_Permiso_PermisosId` FOREIGN KEY (`PermisosId`) REFERENCES `t_permiso` (`Id`) ON DELETE CASCADE,
  CONSTRAINT `FK_PermissionRole_T_Rol_RolesId` FOREIGN KEY (`RolesId`) REFERENCES `t_rol` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissionrole`
--

LOCK TABLES `permissionrole` WRITE;
/*!40000 ALTER TABLE `permissionrole` DISABLE KEYS */;
/*!40000 ALTER TABLE `permissionrole` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roleuser`
--

DROP TABLE IF EXISTS `roleuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roleuser` (
  `RoleId` int NOT NULL,
  `UserId` int NOT NULL,
  PRIMARY KEY (`RoleId`,`UserId`),
  KEY `IX_RoleUser_UserId` (`UserId`),
  CONSTRAINT `FK_RoleUser_T_Rol_RoleId` FOREIGN KEY (`RoleId`) REFERENCES `t_rol` (`Id`) ON DELETE CASCADE,
  CONSTRAINT `FK_RoleUser_T_User_UserId` FOREIGN KEY (`UserId`) REFERENCES `t_user` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roleuser`
--

LOCK TABLES `roleuser` WRITE;
/*!40000 ALTER TABLE `roleuser` DISABLE KEYS */;
/*!40000 ALTER TABLE `roleuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_anexo`
--

DROP TABLE IF EXISTS `t_anexo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_anexo` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `SolicitudDetalleId` int NOT NULL,
  `FechaUltimaModificacion` timestamp NULL DEFAULT NULL,
  `TipoAnexoId` int NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `IX_T_Anexo_SolicitudDetalleId` (`SolicitudDetalleId`),
  KEY `IX_T_Anexo_TipoAnexoId` (`TipoAnexoId`),
  CONSTRAINT `FK_T_Anexo_T_Solicitud_Detalle_SolicitudDetalleId` FOREIGN KEY (`SolicitudDetalleId`) REFERENCES `t_solicitud_detalle` (`Id`) ON DELETE CASCADE,
  CONSTRAINT `FK_T_Anexo_T_Tipo_Anexo_TipoAnexoId` FOREIGN KEY (`TipoAnexoId`) REFERENCES `t_tipo_anexo` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_anexo`
--

LOCK TABLES `t_anexo` WRITE;
/*!40000 ALTER TABLE `t_anexo` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_anexo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_anexofield`
--

DROP TABLE IF EXISTS `t_anexofield`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_anexofield` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Nombre` longtext NOT NULL,
  `Value` longtext NOT NULL,
  `AnexoId` int NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `IX_T_AnexoField_AnexoId` (`AnexoId`),
  CONSTRAINT `FK_T_AnexoField_T_Anexo_AnexoId` FOREIGN KEY (`AnexoId`) REFERENCES `t_anexo` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_anexofield`
--

LOCK TABLES `t_anexofield` WRITE;
/*!40000 ALTER TABLE `t_anexofield` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_anexofield` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_archivo`
--

DROP TABLE IF EXISTS `t_archivo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_archivo` (
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
  CONSTRAINT `FK_T_Archivo_T_Tipo_Archivo_TipoArchivoId` FOREIGN KEY (`TipoArchivoId`) REFERENCES `t_tipo_archivo` (`Id`) ON DELETE CASCADE,
  CONSTRAINT `FK_T_Archivo_T_User_UsuarioId` FOREIGN KEY (`UsuarioId`) REFERENCES `t_user` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_archivo`
--

LOCK TABLES `t_archivo` WRITE;
/*!40000 ALTER TABLE `t_archivo` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_archivo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_asignacion`
--

DROP TABLE IF EXISTS `t_asignacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_asignacion` (
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
  CONSTRAINT `FK_T_Asignacion_T_Archivo_ArchivoId` FOREIGN KEY (`ArchivoId`) REFERENCES `t_archivo` (`Id`),
  CONSTRAINT `FK_T_Asignacion_T_Archivo_DocumentoId` FOREIGN KEY (`DocumentoId`) REFERENCES `t_archivo` (`Id`),
  CONSTRAINT `FK_T_Asignacion_T_Solicitud_Detalle_SolicitudDetalleId` FOREIGN KEY (`SolicitudDetalleId`) REFERENCES `t_solicitud_detalle` (`Id`) ON DELETE CASCADE,
  CONSTRAINT `FK_T_Asignacion_T_User_UserAsignadoId` FOREIGN KEY (`UserAsignadoId`) REFERENCES `t_user` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_asignacion`
--

LOCK TABLES `t_asignacion` WRITE;
/*!40000 ALTER TABLE `t_asignacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_asignacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_especialidad`
--

DROP TABLE IF EXISTS `t_especialidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_especialidad` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(50) NOT NULL,
  `Estado` tinyint(1) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_especialidad`
--

LOCK TABLES `t_especialidad` WRITE;
/*!40000 ALTER TABLE `t_especialidad` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_especialidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_estado_solicitud`
--

DROP TABLE IF EXISTS `t_estado_solicitud`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_estado_solicitud` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_estado_solicitud`
--

LOCK TABLES `t_estado_solicitud` WRITE;
/*!40000 ALTER TABLE `t_estado_solicitud` DISABLE KEYS */;
INSERT INTO `t_estado_solicitud` VALUES (1,'Creada'),(2,'Iniciada'),(3,'Factibilidad'),(4,'Asignada'),(5,'En Revisión'),(6,'Resolución'),(7,'Finalizada');
/*!40000 ALTER TABLE `t_estado_solicitud` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_permiso`
--

DROP TABLE IF EXISTS `t_permiso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_permiso` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(55) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_permiso`
--

LOCK TABLES `t_permiso` WRITE;
/*!40000 ALTER TABLE `t_permiso` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_permiso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_resolucion`
--

DROP TABLE IF EXISTS `t_resolucion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_resolucion` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `FechaEmision` datetime DEFAULT NULL,
  `SolicitudId` int NOT NULL,
  `ArchivoId` int NOT NULL,
  `Observacion` longtext,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `IX_T_Resolucion_ArchivoId` (`ArchivoId`),
  UNIQUE KEY `IX_T_Resolucion_SolicitudId` (`SolicitudId`),
  CONSTRAINT `FK_T_Resolucion_T_Archivo_ArchivoId` FOREIGN KEY (`ArchivoId`) REFERENCES `t_archivo` (`Id`) ON DELETE CASCADE,
  CONSTRAINT `FK_T_Resolucion_T_Solicitud_SolicitudId` FOREIGN KEY (`SolicitudId`) REFERENCES `t_solicitud` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_resolucion`
--

LOCK TABLES `t_resolucion` WRITE;
/*!40000 ALTER TABLE `t_resolucion` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_resolucion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_rol`
--

DROP TABLE IF EXISTS `t_rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_rol` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(50) NOT NULL,
  `MaxUsers` int NOT NULL,
  `Estado` tinyint(1) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_rol`
--

LOCK TABLES `t_rol` WRITE;
/*!40000 ALTER TABLE `t_rol` DISABLE KEYS */;
INSERT INTO `t_rol` VALUES (1,'Presidente',1,1);
/*!40000 ALTER TABLE `t_rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_solicitud`
--

DROP TABLE IF EXISTS `t_solicitud`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_solicitud` (
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
  CONSTRAINT `FK_T_Solicitud_T_Estado_Solicitud_EstadoId` FOREIGN KEY (`EstadoId`) REFERENCES `t_estado_solicitud` (`Id`) ON DELETE CASCADE,
  CONSTRAINT `FK_T_Solicitud_T_User_UsuarioId` FOREIGN KEY (`UsuarioId`) REFERENCES `t_user` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_solicitud`
--

LOCK TABLES `t_solicitud` WRITE;
/*!40000 ALTER TABLE `t_solicitud` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_solicitud` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_solicitud_detalle`
--

DROP TABLE IF EXISTS `t_solicitud_detalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_solicitud_detalle` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Observacion` longtext NOT NULL,
  `SolicitudId` int NOT NULL,
  `Factibilidad` tinyint(1) NOT NULL,
  `OtrosArchivos` tinyint(1) NOT NULL,
  `ArchivosSolicitados` longtext NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `IX_T_Solicitud_Detalle_SolicitudId` (`SolicitudId`),
  CONSTRAINT `FK_T_Solicitud_Detalle_T_Solicitud_SolicitudId` FOREIGN KEY (`SolicitudId`) REFERENCES `t_solicitud` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_solicitud_detalle`
--

LOCK TABLES `t_solicitud_detalle` WRITE;
/*!40000 ALTER TABLE `t_solicitud_detalle` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_solicitud_detalle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_tipo_anexo`
--

DROP TABLE IF EXISTS `t_tipo_anexo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_tipo_anexo` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `TituloPrincipal` longtext NOT NULL,
  `Subtitulo` longtext NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_tipo_anexo`
--

LOCK TABLES `t_tipo_anexo` WRITE;
/*!40000 ALTER TABLE `t_tipo_anexo` DISABLE KEYS */;
INSERT INTO `t_tipo_anexo` VALUES (1,'Anexo1A','Solicitud de análisis de propuestas de investigación'),(2,'Anexo1','Solicitud de análisis ético del proyecto de investigación'),(3,'Anexo2','Compromiso de buenas prácticas en investigación y respeto a las normas éticas de espol'),(4,'Anexo3','Solicitud de guía, información y normativas básicas respecto de buenas prácticas y ética en investigación del centro de investigación, facultad o institución de espol'),(5,'Anexo4','Declaración de asunción de responsabilidad para el uso adecuado de la información de carácter confidencial'),(6,'Anexo5','Información de derechos sobre datos personales y consentimiento para su conservación'),(7,'Anexo6','Consentimiento de datos personales de investigadores para su tratamiento y conservación al comité de etica de investigación de espol');
/*!40000 ALTER TABLE `t_tipo_anexo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_tipo_archivo`
--

DROP TABLE IF EXISTS `t_tipo_archivo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_tipo_archivo` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(75) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_tipo_archivo`
--

LOCK TABLES `t_tipo_archivo` WRITE;
/*!40000 ALTER TABLE `t_tipo_archivo` DISABLE KEYS */;
INSERT INTO `t_tipo_archivo` VALUES (1,'DocumentacionAdicional'),(2,'Informe'),(3,'Resolucion'),(4,'EntregasAdicionales');
/*!40000 ALTER TABLE `t_tipo_archivo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_tipo_solicitud`
--

DROP TABLE IF EXISTS `t_tipo_solicitud`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_tipo_solicitud` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) NOT NULL,
  `DiasPlazo` int NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_tipo_solicitud`
--

LOCK TABLES `t_tipo_solicitud` WRITE;
/*!40000 ALTER TABLE `t_tipo_solicitud` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_tipo_solicitud` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_user`
--

DROP TABLE IF EXISTS `t_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_user` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Nombres` varchar(100) NOT NULL,
  `Apellidos` varchar(100) NOT NULL,
  `Correo` varchar(100) NOT NULL,
  `Username` varchar(15) NOT NULL,
  `ContrasenaHash` varchar(30) DEFAULT NULL,
  `Cedula` int NOT NULL,
  `FechaCreacion` timestamp NOT NULL,
  `FechaUltimoLogin` timestamp NULL DEFAULT NULL,
  `Estado` tinyint(1) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_user`
--

LOCK TABLES `t_user` WRITE;
/*!40000 ALTER TABLE `t_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_user` ENABLE KEYS */;
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

-- Dump completed on 2023-09-14 15:19:03
