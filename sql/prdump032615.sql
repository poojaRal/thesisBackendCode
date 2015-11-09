-- MySQL dump 10.14  Distrib 5.5.41-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: painreport
-- ------------------------------------------------------
-- Server version	5.5.41-MariaDB

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
-- Table structure for table `answers`
--

DROP TABLE IF EXISTS `answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `answers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answers`
--

LOCK TABLES `answers` WRITE;
/*!40000 ALTER TABLE `answers` DISABLE KEYS */;
INSERT INTO `answers` VALUES (1,'Never'),(2,'Almost Never'),(3,'Sometimes'),(4,'Often'),(5,'Almost Always'),(6,'With no trouble'),(7,'With a little trouble'),(8,'With some trouble'),(9,'With a lot of trouble'),(10,'Not able to do'),(11,'1'),(12,'2'),(13,'3'),(14,'4'),(15,'5'),(16,'6'),(17,'7'),(18,'8'),(19,'9'),(20,'10'),(21,'front head'),(22,'back head'),(23,'front left leg'),(24,'back left leg'),(25,'front right leg'),(26,'back right leg'),(27,'front chest'),(28,'front abdominal'),(29,'back'),(30,'lower back'),(31,'front left arm'),(32,'back left arm'),(33,'front right arm'),(34,'back right arm'),(35,'No Pain');
/*!40000 ALTER TABLE `answers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clinical_trials`
--

DROP TABLE IF EXISTS `clinical_trials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clinical_trials` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `clinician_id` int(11) NOT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `duration` bigint(20) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `IRB_ID` char(64) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clinical_trials`
--

LOCK TABLES `clinical_trials` WRITE;
/*!40000 ALTER TABLE `clinical_trials` DISABLE KEYS */;
INSERT INTO `clinical_trials` VALUES (1,1,'2015-03-26 17:16:19','2016-03-24 17:16:19',7257600,'Sickle Cell','Weekly Survey for Sickle Cell Disease pain','scd1'),(2,2,'2015-03-26 17:16:19','2016-03-24 17:16:19',7257600,'Post Op','Weekly and Daily survey for Post Operative pain','po1');
/*!40000 ALTER TABLE `clinical_trials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `form_instances`
--

DROP TABLE IF EXISTS `form_instances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `form_instances` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_id` int(11) NOT NULL,
  `form_type_id` int(11) NOT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `user_submission_time` datetime DEFAULT NULL,
  `actual_submission_time` datetime DEFAULT NULL,
  `completed` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `form_instances`
--

LOCK TABLES `form_instances` WRITE;
/*!40000 ALTER TABLE `form_instances` DISABLE KEYS */;
/*!40000 ALTER TABLE `form_instances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `form_types`
--

DROP TABLE IF EXISTS `form_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `form_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `interval` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `form_types`
--

LOCK TABLES `form_types` WRITE;
/*!40000 ALTER TABLE `form_types` DISABLE KEYS */;
INSERT INTO `form_types` VALUES (1,'Sickle Cell Weekly Survey',600),(2,'Post Op Weekly Survey',600),(3,'Post Op Daily Survey',300);
/*!40000 ALTER TABLE `form_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_types`
--

DROP TABLE IF EXISTS `item_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `form_type_id` int(11) DEFAULT NULL,
  `question_id` int(11) DEFAULT NULL,
  `question_order` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_types`
--

LOCK TABLES `item_types` WRITE;
/*!40000 ALTER TABLE `item_types` DISABLE KEYS */;
INSERT INTO `item_types` VALUES (1,1,31,1),(2,1,1,2),(3,1,2,3),(4,1,3,4),(5,1,4,5),(6,1,5,6),(7,1,6,7),(8,1,8,8),(9,1,9,9),(10,1,10,10),(11,1,12,11),(12,1,14,12),(13,1,15,13),(14,1,16,14),(15,1,19,15),(16,1,20,16),(17,1,21,17),(18,1,22,18),(19,1,23,19),(20,1,25,20),(21,1,26,21),(22,1,27,22),(23,1,28,23),(24,1,29,24),(25,1,30,25),(26,3,31,1),(27,2,31,1),(28,2,1,2),(29,2,2,3),(30,2,3,4),(31,2,4,5),(32,2,5,6),(33,2,6,7),(34,2,8,8),(35,2,9,9),(36,2,10,10),(37,2,12,11),(38,2,14,12),(39,2,15,13),(40,2,16,14),(41,2,19,15),(42,2,20,16),(43,2,21,17),(44,2,22,18),(45,2,23,19),(46,2,25,20),(47,2,26,21),(48,2,27,22),(49,2,28,23),(50,2,29,24),(51,2,30,25);
/*!40000 ALTER TABLE `item_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patients`
--

DROP TABLE IF EXISTS `patients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patients` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `clinical_trial_id` int(11) DEFAULT NULL,
  `pin` char(4) COLLATE utf8_unicode_ci NOT NULL,
  `device_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `version` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_started` datetime DEFAULT NULL,
  `date_completed` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patients`
--

LOCK TABLES `patients` WRITE;
/*!40000 ALTER TABLE `patients` DISABLE KEYS */;
INSERT INTO `patients` VALUES (1,1,'2221','8','4','2014-10-09 17:16:19','2015-01-01 17:16:19'),(2,1,'2222','8','4','2015-03-26 17:16:19','2015-06-18 17:16:19'),(3,1,'2223','8','4','2015-03-26 17:16:19','2015-06-18 17:16:19'),(4,1,'2224','8','4','2015-03-26 17:16:19','2015-06-18 17:16:19'),(5,1,'2225','8','4','2015-03-26 17:16:19','2015-06-18 17:16:19'),(6,1,'2226','8','4','2015-03-26 17:16:19','2015-06-18 17:16:19'),(7,1,'2227','8','4','2015-03-26 17:16:19','2015-06-18 17:16:19'),(8,1,'2228','8','4',NULL,NULL),(9,1,'2229','8','4',NULL,NULL),(10,1,'2230','8','4',NULL,NULL),(11,2,'3333','8','4','2015-03-26 17:16:19','2015-06-18 17:16:19'),(12,2,'3334','8','4','2015-03-26 17:16:19','2015-06-18 17:16:19'),(13,2,'3335','8','4','2015-03-26 17:16:19','2015-06-18 17:16:19'),(14,2,'3336','8','4','2015-03-26 17:16:19','2015-06-18 17:16:19'),(15,2,'3337','8','4','2015-03-26 17:16:19','2015-06-18 17:16:19'),(16,2,'3338','8','4','2015-03-26 17:16:19','2015-06-18 17:16:19'),(17,2,'3339','8','4',NULL,NULL),(18,2,'3340','8','4',NULL,NULL),(19,2,'3341','8','4',NULL,NULL);
/*!40000 ALTER TABLE `patients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question_answers`
--

DROP TABLE IF EXISTS `question_answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `question_answers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question_id` int(11) DEFAULT NULL,
  `answer_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=161 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question_answers`
--

LOCK TABLES `question_answers` WRITE;
/*!40000 ALTER TABLE `question_answers` DISABLE KEYS */;
INSERT INTO `question_answers` VALUES (1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,1,5),(6,2,1),(7,2,2),(8,2,3),(9,2,4),(10,2,5),(11,3,1),(12,3,2),(13,3,3),(14,3,4),(15,3,5),(16,4,1),(17,4,2),(18,4,3),(19,4,4),(20,4,5),(21,5,1),(22,5,2),(23,5,3),(24,5,4),(25,5,5),(26,6,1),(27,6,2),(28,6,3),(29,6,4),(30,6,5),(31,7,1),(32,7,2),(33,7,3),(34,7,4),(35,7,5),(36,8,6),(37,8,7),(38,8,8),(39,8,9),(40,8,10),(41,9,6),(42,9,7),(43,9,8),(44,9,9),(45,9,10),(46,10,6),(47,10,7),(48,10,8),(49,10,9),(50,10,10),(51,11,6),(52,11,7),(53,11,8),(54,11,9),(55,11,10),(56,12,6),(57,12,7),(58,12,8),(59,12,9),(60,12,10),(61,13,6),(62,13,7),(63,13,8),(64,13,9),(65,13,10),(66,14,6),(67,14,7),(68,14,8),(69,14,9),(70,14,10),(71,15,6),(72,15,7),(73,15,8),(74,15,9),(75,15,10),(76,16,1),(77,16,2),(78,16,3),(79,16,4),(80,16,5),(81,17,1),(82,17,2),(83,17,3),(84,17,4),(85,17,5),(86,18,1),(87,18,2),(88,18,3),(89,18,4),(90,18,5),(91,19,1),(92,19,2),(93,19,3),(94,19,4),(95,19,5),(96,20,1),(97,20,2),(98,20,3),(99,20,4),(100,20,5),(101,21,1),(102,21,2),(103,21,3),(104,21,4),(105,21,5),(106,22,1),(107,22,2),(108,22,3),(109,22,4),(110,22,5),(111,23,1),(112,23,2),(113,23,3),(114,23,4),(115,23,5),(116,24,1),(117,24,2),(118,24,3),(119,24,4),(120,24,5),(121,25,1),(122,25,2),(123,25,3),(124,25,4),(125,25,5),(126,26,1),(127,26,2),(128,26,3),(129,26,4),(130,26,5),(131,27,1),(132,27,2),(133,27,3),(134,27,4),(135,27,5),(136,28,1),(137,28,2),(138,28,3),(139,28,4),(140,28,5),(141,29,1),(142,29,2),(143,29,3),(144,29,4),(145,29,5),(146,30,1),(147,30,2),(148,30,3),(149,30,4),(150,30,5),(151,31,21),(152,31,22),(153,31,23),(154,31,24),(155,31,25),(156,31,26),(157,31,27),(158,31,28),(159,31,29),(160,31,30);
/*!40000 ALTER TABLE `question_answers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questions`
--

DROP TABLE IF EXISTS `questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `questions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `qtype` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions`
--

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
INSERT INTO `questions` VALUES (1,'In the past 7 days, I had trouble sleeping when I had pain.','multiChoiceSingleAnswer'),(2,'In the past 7 days, I had trouble doing schoolwork when I had pain.','multiChoiceSingleAnswer'),(3,'In the past 7 days, It was hard for me to pay attention when I had pain.','multiChoiceSingleAnswer'),(4,'In the past 7 days, It was hard for me to run when I had pain.','multiChoiceSingleAnswer'),(5,'In the past 7 days, It was hard for me to walk one block when I had pain.','multiChoiceSingleAnswer'),(6,'In the past 7 days, It was hard to have fun when I had pain.','multiChoiceSingleAnswer'),(7,'In the past 7 days, It was hard to stay standing when I had pain.','multiChoiceSingleAnswer'),(8,'In the past 7 days, I could do sports and exercise that others kids my age could do.','multiChoiceSingleAnswer'),(9,'In the past 7 days, I could get up from the floor.','multiChoiceSingleAnswer'),(10,'In the past 7 days, I could keep up when I played with other kids.','multiChoiceSingleAnswer'),(11,'In the past 7 days, I could move my legs.','multiChoiceSingleAnswer'),(12,'In the past 7 days, I could stand up by myself.','multiChoiceSingleAnswer'),(13,'In the past 7 days, I could stand up on my tiptoes.','multiChoiceSingleAnswer'),(14,'In the past 7 days, I could walk up stairs without holding on to anything.','multiChoiceSingleAnswer'),(15,'In the past 7 days, I have been physically able to do the activities I enjoy most.','multiChoiceSingleAnswer'),(16,'In the past 7 days, being tired made it hard for me to play or go out with my friends as much as I\'d like.','multiChoiceSingleAnswer'),(17,'In the past 7 days, I felt weak.','multiChoiceSingleAnswer'),(18,'In the past 7 days, I got tired easily.','multiChoiceSingleAnswer'),(19,'In the past 7 days, being tired made it hard for me to keep up with my schoolwork.','multiChoiceSingleAnswer'),(20,'In the past 7 days, I had trouble starting things because I was too tired.','multiChoiceSingleAnswer'),(21,'In the past 7 days, I was so tired it was hard for me to pay attention.','multiChoiceSingleAnswer'),(22,'In the past 7 days, I was too tired to do sport or exercise.','multiChoiceSingleAnswer'),(23,'In the past 7 days, I was too tired to do things outside.','multiChoiceSingleAnswer'),(24,'In the past 7 days, I was too tired to enjoy the things I like to do.','multiChoiceSingleAnswer'),(25,'In the past 7 days, I felt nervous.','multiChoiceSingleAnswer'),(26,'In the past 7 days, I felt worried.','multiChoiceSingleAnswer'),(27,'In the past 7 days, I felt like something awful might happen.','multiChoiceSingleAnswer'),(28,'In the past 7 days, I was afraid that I would make mistakes.','multiChoiceSingleAnswer'),(29,'In the past 7 days, I worried about what could happen to me.','multiChoiceSingleAnswer'),(30,'In the past 7 days, I worried when I went to bed at night.','multiChoiceSingleAnswer'),(31,'Please indicate your body pain','bodyPain');
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20140425220736'),('20140425222600'),('20150116193629'),('20150130223624'),('20150130223851');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `selected_answers`
--

DROP TABLE IF EXISTS `selected_answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `selected_answers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `form_instance_id` int(11) DEFAULT NULL,
  `question_id` int(11) DEFAULT NULL,
  `answer_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `selected_answers`
--

LOCK TABLES `selected_answers` WRITE;
/*!40000 ALTER TABLE `selected_answers` DISABLE KEYS */;
/*!40000 ALTER TABLE `selected_answers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trial_clinicians`
--

DROP TABLE IF EXISTS `trial_clinicians`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trial_clinicians` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `clinical_trial_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trial_clinicians`
--

LOCK TABLES `trial_clinicians` WRITE;
/*!40000 ALTER TABLE `trial_clinicians` DISABLE KEYS */;
INSERT INTO `trial_clinicians` VALUES (1,3,1),(2,3,2);
/*!40000 ALTER TABLE `trial_clinicians` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trial_forms`
--

DROP TABLE IF EXISTS `trial_forms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trial_forms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `form_type_id` int(11) DEFAULT NULL,
  `clinical_trial_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trial_forms`
--

LOCK TABLES `trial_forms` WRITE;
/*!40000 ALTER TABLE `trial_forms` DISABLE KEYS */;
INSERT INTO `trial_forms` VALUES (1,1,1),(2,2,2),(3,3,2);
/*!40000 ALTER TABLE `trial_forms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `encrypted_password` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `reset_password_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `sign_in_count` int(11) NOT NULL DEFAULT '0',
  `current_sign_in_at` datetime DEFAULT NULL,
  `last_sign_in_at` datetime DEFAULT NULL,
  `current_sign_in_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_sign_in_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_users_on_email` (`email`),
  UNIQUE KEY `index_users_on_reset_password_token` (`reset_password_token`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'scd@example.com','$2a$10$Lv8YJVBolZonz80MwpS2eO3M0.pMKXfUI.IIQJTtMN2rNmqjKQXa.',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2015-03-26 17:16:19','2015-03-26 17:16:19'),(2,'po@example.com','$2a$10$d7cTs/Vb55oPdhM9aG.H..FJLjS9/lwNAWGvPZdvurUZN/SVnr1C2',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2015-03-26 17:16:19','2015-03-26 17:16:19'),(3,'test@example.com','$2a$10$7yFImq4ef3q3XOwrsSj7geWLDBKH6lhg/3jftuzBewBALQ8z4hR3O',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2015-03-26 17:16:19','2015-03-26 17:16:19');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-03-26 10:17:35
