-- MySQL dump 10.13  Distrib 8.0.25, for Win64 (x86_64)
--
-- Host: localhost    Database: health
-- ------------------------------------------------------
-- Server version	8.0.25

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
-- Table structure for table `patient`
--

DROP TABLE IF EXISTS `patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient` (
  `id` int NOT NULL AUTO_INCREMENT,
  `psychiatrist_id` int DEFAULT NULL,
  `name` varchar(20) NOT NULL,
  `address` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone_number` varchar(12) DEFAULT NULL,
  `password` varchar(100) NOT NULL,
  `image` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `psychiatrist_id` (`psychiatrist_id`),
  CONSTRAINT `patient_ibfk_1` FOREIGN KEY (`psychiatrist_id`) REFERENCES `psychiatrist` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient`
--

LOCK TABLES `patient` WRITE;
/*!40000 ALTER TABLE `patient` DISABLE KEYS */;
INSERT INTO `patient` VALUES (2,29,'kunwar','10/2 kesa colony','kprock41951@gmail.com','928374828392','kA8b23rhhf8fd','profile_pic-1653578696607.jpg'),(4,29,'kunwar','10/2 kesa colony','abc951@gmail.com','928374828392','kA8b23rhhf8fd','profile_pic-1653578784993.jpg'),(5,29,'rohan','10/2 kesa colony','yes51@gmail.com','928374828392','kA8b23rhhf8fd','profile_pic-1653578798980.jpg'),(7,30,'shivam','10/2 kesa colony','yes531@gmail.com','928374828392','kA8b23rhhf8fd','profile_pic-1653578821120.jpg'),(8,30,'shivam singh','10/2 kesa colony','shiva531@gmail.com','928374828392','kA8b23rhhf8fd','profile_pic-1653578833835.jpg'),(9,30,'rahul','10/2 kesa colony','rahul531@gmail.com','928374828392','kA8b23rhhf8fd','profile_pic-1653578845863.jpg'),(10,35,'rahul singh','10/2 kesa colony','rahus531@gmail.com','928374828392','kA8b23rhhf8fd','profile_pic-1653578926141.jpg'),(11,35,'ajay singh','10/2 kesa colony','ajay@gmail.com','928374828392','kA8b23rhhf8fd','profile_pic-1653578937973.jpg'),(12,35,'parul singh','10/2 kesa colony','parul@gmail.com','928374828392','kA8b23rhhf8fd','profile_pic-1653578953874.jpg'),(13,40,'parul sharma','10/2 kesa colony','parulsh@gmail.com','928374828392','kA8b23rhhf8fd','profile_pic-1653578975572.jpg'),(15,42,'aditi','10/2 kesa colony','aditi@gmail.com','928374828392','kA8b23rhhf8fd','profile_pic-1653579011937.jpg'),(16,42,'deepanshu','10/2 kesa colony','deepsxo@gmail.com','928374828392','kA8b23rhhf8fd','profile_pic-1653579025406.jpg'),(17,42,'karan','10/2 kesa colony','karan@gmail.com','928374828392','kA8b23rhhf8fd','profile_pic-1653579058453.jpg'),(18,60,'kunal','10/2 kesa colony','kunal@gmail.com','928374828392','kA8b23rhhf8fd','profile_pic-1653579080822.jpg'),(19,60,'asna','10/2 kesa colony','asna@gmail.com','928374828392','kA8b23rhhf8fd','profile_pic-1653579092551.jpg'),(20,67,'amrit','10/2 kesa colony','amrit@gmail.com','928374828392','kA8b23rhhf8fd','profile_pic-1653579115158.jpg'),(21,67,'amrita','10/2 kesa colony','amrita@gmail.com','928374828392','kA8b23rhhf8fd','profile_pic-1653579472325.jpg'),(22,67,'amrita kumari','10/2 kesa colony','amrita_k@gmail.com','928374828392','kA8b23rhhf8fd','profile_pic-1653579481637.jpg'),(23,67,'honey','10/2 kesa colony','honey_k@gmail.com','928374828392','kA8b23rhhf8fd','profile_pic-1653579489360.jpg'),(24,35,'Harsh Galgate','delhi','hardsh@gmail.com','918237472847','helloWo4ld','profile_pic-1653584007954.jpg');
/*!40000 ALTER TABLE `patient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `psychiatrist`
--

DROP TABLE IF EXISTS `psychiatrist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `psychiatrist` (
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(20) NOT NULL,
  `last_name` varchar(20) NOT NULL,
  `hospital_name` varchar(100) NOT NULL,
  `phone_number` varchar(12) NOT NULL,
  `pincode` varchar(6) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `phone_number` (`phone_number`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `psychiatrist`
--

LOCK TABLES `psychiatrist` WRITE;
/*!40000 ALTER TABLE `psychiatrist` DISABLE KEYS */;
INSERT INTO `psychiatrist` VALUES (27,'kunwar','pratap','Apollo Hospitals','919883920384','208003','uttar pradesh'),(29,'karan','sharma','Apollo Hospitals','919882920384','208003','uttar pradesh'),(30,'arun','sharma','Apollo Hospitals','919882020384','208003','uttar pradesh'),(32,'nikita','sharma','Apollo Hospitals','919882030384','208003','uttar pradesh'),(33,'naman','sharma','Apollo Hospitals','919834030384','208003','uttarakhand'),(35,'nikhil','sharma','Apollo Hospitals','919234030384','208003','uttarakhand'),(36,'arun','sharma','Apollo Hospitals','919094030384','208003','uttarakhand'),(37,'arunam','sharma','Apollo Hospitals','919099030384','208003','uttarakhand'),(38,'naman','sharma','Apollo Hospitals','919019030384','208003','uttarakhand'),(40,'naman','sharma','Jawahar Lal Nehru Medical College and Hospital','919013030384','208003','uttarakhand'),(41,'naman','sharma','Jawahar Lal Nehru Medical College and Hospital','919013010384','208003','uttarakhand'),(42,'naman','sharma','Jawahar Lal Nehru Medical College and Hospital','919013019384','208003','uttarakhand'),(43,'naman','sharma','Jawahar Lal Nehru Medical College and Hospital','913013019384','208003','uttarakhand'),(44,'aman','sharma','Jawahar Lal Nehru Medical College and Hospital','913013011384','208003','uttarakhand'),(45,'karan','sharma','Jawahar Lal Nehru Medical College and Hospital','913013077384','208003','uttarakhand'),(46,'ajay','sharma','Jawahar Lal Nehru Medical College and Hospital','913013071384','208003','uttarakhand'),(47,'kunal','sharma','Jawahar Lal Nehru Medical College and Hospital','913013171384','208003','uttarakhand'),(48,'preeti','sharma','Jawahar Lal Nehru Medical College and Hospital','913013111384','208003','uttarakhand'),(49,'harsh','sharma','Jawahar Lal Nehru Medical College and Hospital','912013111384','208003','uttarakhand'),(50,'harsh','rawat','Jawahar Lal Nehru Medical College and Hospital','911013111384','208003','uttarakhand'),(51,'harsh','rawat','Indira Gandhi Institute of Medical Sciences','911013111314','208003','uttarakhand'),(53,'ishita','singh','Indira Gandhi Institute of Medical Sciences','911113111314','208003','uttarakhand'),(54,'shivam','singh','Indira Gandhi Institute of Medical Sciences','913113111314','208003','uttarakhand'),(55,'shivam','verma','Indira Gandhi Institute of Medical Sciences','913113871314','208003','uttarakhand'),(56,'saransh','verma','Indira Gandhi Institute of Medical Sciences','913113871324','208003','uttarakhand'),(57,'aditi','verma','Indira Gandhi Institute of Medical Sciences','913113871924','208003','uttarakhand'),(58,'aditi','sharma','Indira Gandhi Institute of Medical Sciences','923113871924','208003','uttarakhand'),(59,'aditi','singh','Indira Gandhi Institute of Medical Sciences','923113871934','208003','uttarakhand'),(60,'aditi','gandhi','Indira Gandhi Institute of Medical Sciences','923113871933','208003','uttarakhand'),(61,'aditi','gandhi','AIIMS','923112871933','208003','uttarakhand'),(62,'anand','gandhi','AIIMS','926112871933','208003','uttarakhand'),(63,'anand','gandhi','AIIMS','926552871933','208003','uttarakhand'),(64,'anandi','gandhi','AIIMS','926652871933','208003','uttarakhand'),(65,'jaran','gandhi','AIIMS','926652871953','208003','uttarakhand'),(67,'sushant','gandhi','AIIMS','926652471953','208003','uttarakhand'),(68,'samant','gandhi','AIIMS','926652471973','208003','uttarakhand'),(69,'samanvaya','gandhi','AIIMS','926352471973','208003','delhi'),(70,'saman','gandhi','AIIMS','926952471973','208003','delhi'),(71,'aryan','gandhi','AIIMS','926952471993','208003','delhi'),(72,'aryan','singh','AIIMS','926952479993','208003','delhi'),(73,'suryansh','mishra','AIIMS','918287389287','208002','Uttar Pradesh');
/*!40000 ALTER TABLE `psychiatrist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `token`
--

DROP TABLE IF EXISTS `token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `token` (
  `token` varchar(100) NOT NULL,
  `id` int NOT NULL,
  PRIMARY KEY (`token`),
  KEY `id` (`id`),
  CONSTRAINT `token_ibfk_1` FOREIGN KEY (`id`) REFERENCES `psychiatrist` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `token`
--

LOCK TABLES `token` WRITE;
/*!40000 ALTER TABLE `token` DISABLE KEYS */;
INSERT INTO `token` VALUES ('ypevji701l9c0cxgitrddb919882920384',29),('molqd0hmatwjnl2m2ma9k919882020384',30),('aoqybb9kmqqdpzyk1txavh919234030384',35),('nlpw54qfr7agyach2vrot6919013030384',40),('74x1bh5o0eiyizr6u9yme9919013019384',42),('7vjun050cew2henhr2n23p913013071384',46),('2s7c46ruw1lvekqyv0qyln913013111384',48),('zjih8vnlmqod2qsg18t2923113871933',60),('g13cs1g9jcum0zssjgv2d926652471953',67),('2ytid6hmnyw1sof4cp7cj1926952479993',72),('7mnegqouef3abizn208mk918287389287',73);
/*!40000 ALTER TABLE `token` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-27  0:54:03
