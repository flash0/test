-- MySQL dump 10.13  Distrib 5.6.21, for Linux (x86_64)
--
-- Host: localhost    Database: xx
-- ------------------------------------------------------
-- Server version	5.6.21

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

--
-- Table structure for table `xx_article`
--

DROP TABLE IF EXISTS `xx_article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xx_article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(64) NOT NULL,
  `content` text NOT NULL,
  `user_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `views` int(11) DEFAULT '0',
  `status` tinyint(4) DEFAULT '1',
  `modify_time` datetime DEFAULT NULL,
  `content_type` varchar(10) DEFAULT NULL,
  `tags` varchar(32) DEFAULT NULL,
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK_type_id` (`type_id`),
  KEY `FK_user_id` (`user_id`),
  CONSTRAINT `FK_type_id` FOREIGN KEY (`type_id`) REFERENCES `xx_type` (`id`),
  CONSTRAINT `FK_user_id` FOREIGN KEY (`user_id`) REFERENCES `xx_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xx_article`
--

LOCK TABLES `xx_article` WRITE;
/*!40000 ALTER TABLE `xx_article` DISABLE KEYS */;
/*!40000 ALTER TABLE `xx_article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xx_group`
--

DROP TABLE IF EXISTS `xx_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xx_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(15) NOT NULL,
  `description` text NOT NULL,
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK_group_user_id` (`user_id`),
  CONSTRAINT `FK_group_user_id` FOREIGN KEY (`user_id`) REFERENCES `xx_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xx_group`
--

LOCK TABLES `xx_group` WRITE;
/*!40000 ALTER TABLE `xx_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `xx_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xx_major`
--

DROP TABLE IF EXISTS `xx_major`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xx_major` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `status` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xx_major`
--

LOCK TABLES `xx_major` WRITE;
/*!40000 ALTER TABLE `xx_major` DISABLE KEYS */;
/*!40000 ALTER TABLE `xx_major` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xx_profile`
--

DROP TABLE IF EXISTS `xx_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xx_profile` (
  `user_id` int(11) NOT NULL,
  `name` varchar(10) DEFAULT NULL,
  `grade` varchar(10) DEFAULT NULL,
  `major_id` int(11) DEFAULT NULL,
  `student_id` varchar(12) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  KEY `FK_profile_user_id` (`user_id`),
  KEY `FK_profile_major_id` (`major_id`),
  KEY `FK_profile_group_id` (`group_id`),
  CONSTRAINT `FK_profile_group_id` FOREIGN KEY (`group_id`) REFERENCES `xx_group` (`id`),
  CONSTRAINT `FK_profile_major_id` FOREIGN KEY (`major_id`) REFERENCES `xx_major` (`id`),
  CONSTRAINT `FK_profile_user_id` FOREIGN KEY (`user_id`) REFERENCES `xx_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xx_profile`
--

LOCK TABLES `xx_profile` WRITE;
/*!40000 ALTER TABLE `xx_profile` DISABLE KEYS */;
/*!40000 ALTER TABLE `xx_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xx_type`
--

DROP TABLE IF EXISTS `xx_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xx_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(15) NOT NULL,
  `model` varchar(15) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK_type_user_id` (`user_id`),
  CONSTRAINT `FK_type_user_id` FOREIGN KEY (`user_id`) REFERENCES `xx_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xx_type`
--

LOCK TABLES `xx_type` WRITE;
/*!40000 ALTER TABLE `xx_type` DISABLE KEYS */;
INSERT INTO `xx_type` VALUES (1,'新闻','news',NULL,'2015-08-28 18:52:05'),(2,'公告','announcement',NULL,'2015-08-28 18:52:35'),(3,'博客','blog',NULL,'2015-08-28 18:53:01');
/*!40000 ALTER TABLE `xx_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xx_user`
--

DROP TABLE IF EXISTS `xx_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xx_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(16) NOT NULL,
  `password` varchar(64) NOT NULL,
  `nickname` varchar(16) NOT NULL,
  `status` tinyint(4) DEFAULT '0',
  `portrait` varchar(64) DEFAULT NULL,
  `email` varchar(32) NOT NULL,
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xx_user`
--

LOCK TABLES `xx_user` WRITE;
/*!40000 ALTER TABLE `xx_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `xx_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-08-29 13:41:43
