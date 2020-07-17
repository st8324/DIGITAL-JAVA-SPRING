CREATE DATABASE  IF NOT EXISTS `spring` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `spring`;
-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: localhost    Database: spring
-- ------------------------------------------------------
-- Server version	8.0.20

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
-- Table structure for table `board`
--

DROP TABLE IF EXISTS `board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `board` (
  `num` int NOT NULL AUTO_INCREMENT,
  `writer` varchar(21) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` longtext NOT NULL,
  `registerDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `isDel` varchar(1) NOT NULL DEFAULT 'N',
  `views` int NOT NULL DEFAULT '0',
  `delDate` date DEFAULT NULL,
  PRIMARY KEY (`num`),
  KEY `writer_idx` (`writer`),
  CONSTRAINT `writer` FOREIGN KEY (`writer`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `board`
--

LOCK TABLES `board` WRITE;
/*!40000 ALTER TABLE `board` DISABLE KEYS */;
INSERT INTO `board` VALUES (1,'abc123','게시글입니다(수정)2','게시글','2020-07-09 10:22:09','Y',9,'2020-07-10'),(2,'abc123','게시물2(수정)','게시물2','2020-07-09 12:33:04','Y',3,'2020-07-10'),(4,'abc123','게시물(수정)','게시물3','2020-07-09 12:38:42','N',7,NULL),(5,'abc123','테스트','글쓰기 등록 테스트','2020-07-09 16:23:02','N',3,NULL),(6,'abc123','안녕하세요','안녕하세요.','2020-07-09 16:24:05','N',2,NULL),(7,'abc123','테스트','테스트','2020-07-10 09:31:16','N',3,NULL),(8,'abc123','7월13일','123','2020-07-13 11:16:15','N',0,NULL),(9,'abc123','7월14일(수정)2-1','복습(수정)2-1','2020-07-14 12:42:32','N',35,NULL),(10,'abc123','7월14일 마지막 테스트','7월14일 마지막 테스트','2020-07-14 17:12:15','N',5,NULL),(11,'abc123','7월 15일(수정)','테스트','2020-07-15 09:33:15','N',7,'2020-07-15'),(12,'abc123','12','12','2020-07-15 16:13:08','N',1,NULL),(13,'abc123','13','13','2020-07-15 16:13:15','N',1,NULL),(14,'abc123','15','15','2020-07-15 16:13:33','N',1,NULL),(15,'abc123','11번째','12','2020-07-15 16:13:48','N',1,NULL);
/*!40000 ALTER TABLE `board` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-07-17 16:39:10
