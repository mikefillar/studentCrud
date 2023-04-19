-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: studdb
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `courses`
--

DROP TABLE IF EXISTS `courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `courses` (
  `course_id` int NOT NULL AUTO_INCREMENT,
  `course_name` varchar(45) NOT NULL,
  `course_description` varchar(100) NOT NULL,
  `created_by` varchar(45) NOT NULL DEFAULT 'Mike',
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_by` varchar(45) NOT NULL DEFAULT 'Mike',
  `date_updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`course_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='list of courses';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses`
--

LOCK TABLES `courses` WRITE;
/*!40000 ALTER TABLE `courses` DISABLE KEYS */;
INSERT INTO `courses` VALUES (1,'Front-End Development','Front-end Development','Mike','2023-04-18 14:32:53','Mike','2023-04-18 14:32:53'),(2,'Back-End Development','Back-End Development','Mike','2023-04-18 14:32:53','Mike','2023-04-18 14:32:53'),(3,'Fullstack Development','Fullstack Development','Mike','2023-04-18 14:32:53','Mike','2023-04-18 14:32:53');
/*!40000 ALTER TABLE `courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `students` (
  `student_id` int NOT NULL AUTO_INCREMENT,
  `course_id` int NOT NULL,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `created_by` varchar(45) NOT NULL DEFAULT 'Mike',
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_by` varchar(45) NOT NULL DEFAULT 'Mike',
  `date_updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`student_id`),
  KEY `course_id_idx` (`course_id`),
  CONSTRAINT `course_id` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`) ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='list of students';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES (1,1,'Mikenew','Fillarnew','mike@gmail.com','Mike','2023-04-18 14:34:38','Mike','2023-04-19 16:59:05'),(2,2,'Keb','Memb','keb@gmail.com','Mike','2023-04-18 14:34:38','Mike','2023-04-18 14:34:38'),(3,3,'Pat','Lumen','pat@gmail.com','Mike','2023-04-18 14:34:38','Mike','2023-04-18 14:34:38'),(4,1,'nald','arro','nald@gmail.com','Mike','2023-04-18 20:23:16','Mike','2023-04-18 20:23:16'),(5,2,'test1','test1','test1@gmail.com','Mike','2023-04-18 20:25:41','Mike','2023-04-18 20:25:41'),(6,2,'test2','test2','test2@gmail.com','Mike','2023-04-18 20:28:01','Mike','2023-04-18 20:33:49'),(7,2,'test3','test3','test3@gmail.com','Mike','2023-04-18 20:29:14','Mike','2023-04-18 20:33:49'),(12,2,'Proff','Faner','proff@gmail.com','Mike','2023-04-19 18:14:46','Mike','2023-04-19 18:14:46'),(17,1,'Test6','Test6','test6@gmail.com','Mike','2023-04-19 18:43:39','Mike','2023-04-19 18:43:39');
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `user_name` varchar(45) NOT NULL,
  `user_password` varchar(100) NOT NULL,
  `user_email` varchar(45) NOT NULL,
  `created_by` varchar(45) NOT NULL DEFAULT 'Mike',
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_by` varchar(45) NOT NULL DEFAULT 'Mike',
  `date_updated` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'user1','user1','user1@gmail.com','Mike','2023-04-18 14:37:22','Mike','2023-04-18 14:37:22'),(2,'user2','user2','user2@gmail.com','Mike','2023-04-18 14:37:22','Mike','2023-04-18 14:37:22'),(3,'user3','user3','user3@gmail.com','Mike','2023-04-18 14:37:22','Mike','2023-04-18 14:37:22');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'studdb'
--
/*!50003 DROP PROCEDURE IF EXISTS `list_of_students` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `list_of_students`()
BEGIN
	select st.student_id, cs.course_name, st.first_name, st.last_name, st.email from students as st
	JOIN courses as cs ON st.course_id = cs.course_id;
END ;;
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

-- Dump completed on 2023-04-19 19:13:13
