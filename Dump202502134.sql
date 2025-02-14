-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: prtinventario
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.22-MariaDB

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
-- Table structure for table `api_categoria`
--

DROP TABLE IF EXISTS `api_categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_categoria` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  `activo` tinyint(1) NOT NULL,
  `creado` datetime(6) NOT NULL,
  `modificado` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_categoria`
--

LOCK TABLES `api_categoria` WRITE;
/*!40000 ALTER TABLE `api_categoria` DISABLE KEYS */;
INSERT INTO `api_categoria` VALUES (1,'categoria actualizada',0,'2025-02-13 16:56:58.131198','2025-02-13 17:17:39.183663'),(2,'Bolsa',1,'2025-02-13 17:18:13.838730','2025-02-13 17:18:13.838730'),(3,'Caja',1,'2025-02-13 17:18:19.699431','2025-02-13 17:18:19.699431'),(4,'Botella',1,'2025-02-13 17:18:27.194278','2025-02-13 17:18:27.194278');
/*!40000 ALTER TABLE `api_categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_producto`
--

DROP TABLE IF EXISTS `api_producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_producto` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombre` longtext DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  `activo` tinyint(1) NOT NULL,
  `creado` datetime(6) NOT NULL,
  `modificado` datetime(6) NOT NULL,
  `categoria_id` bigint(20) NOT NULL,
  `proveedor_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `api_producto_categoria_id_c2e48405_fk_api_categoria_id` (`categoria_id`),
  KEY `api_producto_proveedor_id_c6f06079_fk_api_proveedor_id` (`proveedor_id`),
  CONSTRAINT `api_producto_categoria_id_c2e48405_fk_api_categoria_id` FOREIGN KEY (`categoria_id`) REFERENCES `api_categoria` (`id`),
  CONSTRAINT `api_producto_proveedor_id_c6f06079_fk_api_proveedor_id` FOREIGN KEY (`proveedor_id`) REFERENCES `api_proveedor` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_producto`
--

LOCK TABLES `api_producto` WRITE;
/*!40000 ALTER TABLE `api_producto` DISABLE KEYS */;
INSERT INTO `api_producto` VALUES (2,'tortrix',20,2.50,1,'2025-02-13 18:08:16.442871','2025-02-13 18:14:29.472798',2,1),(3,'Producto nuevo',23,4.00,1,'2025-02-13 21:07:28.891528','2025-02-13 21:07:28.891528',2,1),(4,'Producto N',23,4.00,1,'2025-02-13 21:08:33.401542','2025-02-13 21:08:33.401542',2,1);
/*!40000 ALTER TABLE `api_producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_proveedor`
--

DROP TABLE IF EXISTS `api_proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_proveedor` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(40) DEFAULT NULL,
  `apellido` varchar(40) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `activo` tinyint(1) NOT NULL,
  `creado` datetime(6) NOT NULL,
  `modificado` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_proveedor`
--

LOCK TABLES `api_proveedor` WRITE;
/*!40000 ALTER TABLE `api_proveedor` DISABLE KEYS */;
INSERT INTO `api_proveedor` VALUES (1,'Luis','Reyes','Ciudad',1,'2025-02-13 17:26:20.586269','2025-02-13 17:26:20.586269'),(2,'Carlos','Fidalgo','Ciudad',1,'2025-02-13 17:26:28.108456','2025-02-13 17:26:28.108456'),(3,'Alex','Lopez','Ciudad',1,'2025-02-13 17:26:34.302132','2025-02-13 17:26:34.302132'),(4,'Juan','Perez','Ciudad',1,'2025-02-13 17:26:44.281311','2025-02-13 17:26:44.281311');
/*!40000 ALTER TABLE `api_proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_usuario`
--

DROP TABLE IF EXISTS `api_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_usuario` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `apellido` varchar(255) DEFAULT NULL,
  `activo` tinyint(1) NOT NULL,
  `reset_pass` tinyint(1) NOT NULL,
  `creado` datetime(6) NOT NULL,
  `modificado` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_usuario`
--

LOCK TABLES `api_usuario` WRITE;
/*!40000 ALTER TABLE `api_usuario` DISABLE KEYS */;
INSERT INTO `api_usuario` VALUES (1,'pbkdf2_sha256$260000$QsLaTTDOmWdjAzi14iEfR7$kfkU7ZXsOuEMYA9TpIA5uSfPwEu1EflSGiIX+j6FJDY=',NULL,1,'admin','','','admin@mail.mail',1,1,'2025-02-13 16:15:41.213368',NULL,NULL,1,1,'2025-02-13 16:15:41.295480','2025-02-13 16:15:41.295480');
/*!40000 ALTER TABLE `api_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_usuario_groups`
--

DROP TABLE IF EXISTS `api_usuario_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_usuario_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `usuario_id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `api_usuario_groups_usuario_id_group_id_d9500af0_uniq` (`usuario_id`,`group_id`),
  KEY `api_usuario_groups_group_id_a1787217_fk_auth_group_id` (`group_id`),
  CONSTRAINT `api_usuario_groups_group_id_a1787217_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `api_usuario_groups_usuario_id_7c19c78d_fk_api_usuario_id` FOREIGN KEY (`usuario_id`) REFERENCES `api_usuario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_usuario_groups`
--

LOCK TABLES `api_usuario_groups` WRITE;
/*!40000 ALTER TABLE `api_usuario_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_usuario_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_usuario_user_permissions`
--

DROP TABLE IF EXISTS `api_usuario_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_usuario_user_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `usuario_id` bigint(20) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `api_usuario_user_permiss_usuario_id_permission_id_7f855256_uniq` (`usuario_id`,`permission_id`),
  KEY `api_usuario_user_per_permission_id_0ae209ef_fk_auth_perm` (`permission_id`),
  CONSTRAINT `api_usuario_user_per_permission_id_0ae209ef_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `api_usuario_user_per_usuario_id_598fe587_fk_api_usuar` FOREIGN KEY (`usuario_id`) REFERENCES `api_usuario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_usuario_user_permissions`
--

LOCK TABLES `api_usuario_user_permissions` WRITE;
/*!40000 ALTER TABLE `api_usuario_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_usuario_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add user',6,'add_usuario'),(22,'Can change user',6,'change_usuario'),(23,'Can delete user',6,'delete_usuario'),(24,'Can view user',6,'view_usuario'),(25,'Can add categoria',7,'add_categoria'),(26,'Can change categoria',7,'change_categoria'),(27,'Can delete categoria',7,'delete_categoria'),(28,'Can view categoria',7,'view_categoria'),(29,'Can add proveedor',8,'add_proveedor'),(30,'Can change proveedor',8,'change_proveedor'),(31,'Can delete proveedor',8,'delete_proveedor'),(32,'Can view proveedor',8,'view_proveedor'),(33,'Can add producto',9,'add_producto'),(34,'Can change producto',9,'change_producto'),(35,'Can delete producto',9,'delete_producto'),(36,'Can view producto',9,'view_producto');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_api_usuario_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_api_usuario_id` FOREIGN KEY (`user_id`) REFERENCES `api_usuario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(7,'api','categoria'),(9,'api','producto'),(8,'api','proveedor'),(6,'api','usuario'),(3,'auth','group'),(2,'auth','permission'),(4,'contenttypes','contenttype'),(5,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2025-02-13 16:14:52.447268'),(2,'contenttypes','0002_remove_content_type_name','2025-02-13 16:14:52.499919'),(3,'auth','0001_initial','2025-02-13 16:14:52.726612'),(4,'auth','0002_alter_permission_name_max_length','2025-02-13 16:14:52.767934'),(5,'auth','0003_alter_user_email_max_length','2025-02-13 16:14:52.774236'),(6,'auth','0004_alter_user_username_opts','2025-02-13 16:14:52.780042'),(7,'auth','0005_alter_user_last_login_null','2025-02-13 16:14:52.785474'),(8,'auth','0006_require_contenttypes_0002','2025-02-13 16:14:52.789866'),(9,'auth','0007_alter_validators_add_error_messages','2025-02-13 16:14:52.794589'),(10,'auth','0008_alter_user_username_max_length','2025-02-13 16:14:52.800901'),(11,'auth','0009_alter_user_last_name_max_length','2025-02-13 16:14:52.807082'),(12,'auth','0010_alter_group_name_max_length','2025-02-13 16:14:52.818754'),(13,'auth','0011_update_proxy_permissions','2025-02-13 16:14:52.824335'),(14,'auth','0012_alter_user_first_name_max_length','2025-02-13 16:14:52.830007'),(15,'api','0001_initial','2025-02-13 16:14:53.115431'),(16,'admin','0001_initial','2025-02-13 16:14:53.230918'),(17,'admin','0002_logentry_remove_auto_add','2025-02-13 16:14:53.240259'),(18,'admin','0003_logentry_add_action_flag_choices','2025-02-13 16:14:53.249958'),(19,'sessions','0001_initial','2025-02-13 16:14:53.284450'),(20,'api','0002_categoria_proveedor','2025-02-13 16:22:08.628741'),(21,'api','0003_producto','2025-02-13 17:36:27.507225'),(22,'api','0004_rename_provedor_producto_proveedor','2025-02-13 18:04:55.581884');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-02-13 19:20:53
