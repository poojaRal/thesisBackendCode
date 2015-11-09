-- MySQL  Distrib 5.5.41, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: painreport
-- ------------------------------------------------------
-- Server version	5.5.41-0ubuntu0.14.04.1

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
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Data for table `answers` - This is static data that needs to be preseeded for the apps
--

LOCK TABLES `answers` WRITE;
/*!40000 ALTER TABLE `answers` DISABLE KEYS */;
INSERT INTO `answers` VALUES (1,'Never'),(2,'Rarely'),(3,'Sometimes'),(4,'Often'),(5,'Always'),(6,'Poor'),(7,'Below Average'),
(8,'Average'),(9,'Above Average'),(10,'Excellent'),(11,'0 to 5'),(12,'5 to 10'),(13,'10 to 15'),(14,'15 to 20'),(15,'20+'),
(16,'0 to 3'),(17,'3 to 6'),(18,'6 to 9'),(19,'9 to 12'),(20,'12+'),(21,'0'),(22,'1'),(23,'2'),(24,'3'),(25,'4+'),
(26,'Happy'),(27,'Sad'),(28,'Angry'),(29,'Neutral'),(30,'No Answer'),(31,'4'),(32,'5'),(33,'6'),(34,'7'),(35,'8'),(36,'9'),(37,'10');
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
  `stages` int(11) NOT NULL,
  `event_based` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Data for table `clinical_trials` - this is initial static data for our 3 trials
--

LOCK TABLES `clinical_trials` WRITE;
/*!40000 ALTER TABLE `clinical_trials` DISABLE KEYS */;
INSERT INTO `clinical_trials` VALUES (1,1,'2015-03-12 02:29:38','2015-09-01 02:29:38',7257600,'SER 515 Course Survey','Weekly and Daily Survey for SER 515 course','scd1','','');
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Data for table `form_instances` is not required on startup
--

--
-- Table structure for table `form_types`
--

DROP TABLE IF EXISTS `form_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `form_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Data for table `form_types` - static data for initializing our sets of surveys
--

LOCK TABLES `form_types` WRITE;
/*!40000 ALTER TABLE `form_types` DISABLE KEYS */;
INSERT INTO `form_types` VALUES (1,'SER 515 Weekly Survey'),(2,'SER 515 Daily Survey');
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
-- Data for table `item_types` - static data for our initial question types
--

LOCK TABLES `item_types` WRITE;
/*!40000 ALTER TABLE `item_types` DISABLE KEYS */;
INSERT INTO `item_types` VALUES (1,1,25,1),(2,1,1,2),(3,1,2,3),(4,1,3,4),(5,1,4,5),(6,1,5,6),(7,1,6,7),(8,1,7,8),(9,1,8,9),(10,1,9,10),
(11,1,10,11),(12,1,11,12),(13,1,12,13),(14,1,13,14),(15,1,14,15),(16,1,15,16),(17,1,16,17),(18,1,17,18),(19,1,18,19),(20,1,19,20),
(21,1,20,21),(22,1,21,22),(23,1,22,23),(24,1,23,24),(25,1,24,25),(26,2,25,1);
/*!40000 ALTER TABLE `item_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `  `
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
  `test_patient` tinyint(1) DEFAULT NULL,
  `current_stage` int(11) DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

-- No patient gen in here, use external scripts for which patient population you want to load

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
-- Data for table `question_answers` - static data for initial answer options
--

LOCK TABLES `question_answers` WRITE;
/*!40000 ALTER TABLE `question_answers` DISABLE KEYS */;
INSERT INTO `question_answers` VALUES (1,1,11),(2,1,12),(3,1,13),(4,1,14),(5,1,15),(6,2,16),(7,2,17),(8,2,18),(9,2,19),(10,2,20),
(11,3,1),(12,3,2),(13,3,3),(14,3,4),(15,3,5),(16,4,1),(17,4,2),(18,4,3),(19,4,4),(20,4,5),(21,5,1),(22,5,2),(23,5,3),(24,5,4),(25,5,5),(26,6,1),
(27,6,2),(28,6,3),(29,6,4),(30,6,5),(31,7,1),(32,7,2),(33,7,3),(34,7,4),(35,7,5),(36,8,21),(37,8,22),(38,8,23),(39,8,24),(40,8,25),(41,9,1),(42,9,2),
(43,9,3),(44,9,4),(45,9,5),(46,10,1),(47,10,2),(48,10,3),(49,10,4),(50,10,5),(51,11,6),(52,11,7),(53,11,8),(54,11,9),(55,11,10),(56,12,1),(57,12,2),(58,12,3),
(59,12,4),(60,12,5),(61,13,1),(62,13,2),(63,13,3),(64,13,4),(65,13,5),(66,14,1),(67,14,2),(68,14,3),(69,14,4),(70,14,5),(71,15,1),(72,15,2),(73,15,3),
(74,15,4),(75,15,5),(76,16,1),(77,16,2),(78,16,3),(79,16,4),(80,16,5),(81,17,1),(82,17,2),(83,17,3),(84,17,4),(85,17,5),(86,18,1),(87,18,2),(88,18,3),(89,18,4),
(90,18,5),(91,19,1),(92,19,2),(93,19,3),(94,19,4),(95,19,5),(96,20,1),(97,20,2),(98,20,3),(99,20,4),(100,20,5),(101,21,1),(102,21,2),(103,21,3),(104,21,4),
(105,21,5),(106,22,1),(107,22,2),(108,22,3),(109,22,4),(110,22,5),(111,23,1),(112,23,2),(113,23,3),(114,23,4),(115,23,5),(116,24,1),(117,24,2),(118,24,3),
(119,24,4),(120,24,5),(121,25,26),(122,25,27),(123,25,28),(124,25,29),(125,25,30);
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
-- Data for table `questions` - static data for our initial questions
--

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
INSERT INTO `questions` VALUES
(1,'In the past 7 days how many hours did you spend on this course?','multiChoiceSingleAnswer'),
(2,'In the past 7 days, how many hours did you spend on your SER 515 project?','multiChoiceSingleAnswer'),
(3,'In the past 7 days, did you worries overwhelm you?','multiChoiceSingleAnswer'),
(4,'In the past 7 days, were you satisfied with progress of your project team?','multiChoiceSingleAnswer'),
(5,'In the past 7 days, did you find it hard to focus on anything other than your anxiety?','multiChoiceSingleAnswer'),
(6,'In the past 7 days,  did you feel uneasy?','multiChoiceSingleAnswer'),
(7,'In the past 7 days, did you feel fearful?','multiChoiceSingleAnswer'),
(8,'In the past 7 days, how many team meetings did you have for your project?','multiChoiceSingleAnswer'),
(9,'In the past 7 days, were you studying?','multiChoiceSingleAnswer'),
(10,'In the past 7 days, were you keeping up with the required readings for the class?','multiChoiceSingleAnswer'),
(11,'In the past 7 days, how did you perform  in your exams?','multiChoiceSingleAnswer'),
(12,'In the past 7 days, were you getting your CI papers done on time?','multiChoiceSingleAnswer'),
(13,'In the past 7 days, were you taking good class notes?','multiChoiceSingleAnswer'),
(14,'In the past 7 days, were you preparing for your exams?','multiChoiceSingleAnswer'),
(15,'In the past 7 days, were you afraid that you would make mistakes in project work?','multiChoiceSingleAnswer'),
(16,'In the past 7 days, were you worried that you were not productive enough in  project work?','multiChoiceSingleAnswer'),
(17,'In the past 7 days, were you able to manage time efficiently?','multiChoiceSingleAnswer'),
(18,'In the past 7 days,  were you able to not give time to other coursework?','multiChoiceSingleAnswer'),
(19,'In the past 7 days, did you the get the grades you wanted?','multiChoiceSingleAnswer'),
(20,'In the past 7 days, did you get to talk to your professors?','multiChoiceSingleAnswer'),
(21,'In the past 7 days, did you try and gather information and help from school?','multiChoiceSingleAnswer'),
(22,'In the past 7 days, did you do well in your toughest exam?','multiChoiceSingleAnswer'),
(23,'In the past 7 days, did you find time to study?','multiChoiceSingleAnswer'),
(24,'In the past 7 days, did you try and participate in class discussions?','multiChoiceSingleAnswer'),
(25,'How is your mood today?','bodyPain');
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
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `selected_answers`
--

LOCK TABLES `selected_answers` WRITE;
/*!40000 ALTER TABLE `selected_answers` DISABLE KEYS */;
INSERT INTO `selected_answers` VALUES (1,1,31,23),(2,1,31,15),(3,3,1,2),(4,3,10,6),(5,3,12,7),(6,3,14,7),(7,3,15,7),(8,3,16,2),(9,3,19,2),(10,3,2,2),(11,3,20,2),(12,3,21,1),(13,3,22,2),(14,3,23,2),(15,3,25,2),(16,3,26,2),(17,3,27,1),(18,3,28,2),(19,3,29,2),(20,3,3,2),(21,3,30,2),(22,3,31,26),(23,3,31,14),(24,3,4,2),(25,3,5,2),(26,3,6,2),(27,3,8,7),(28,3,9,7);
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
INSERT INTO `trial_clinicians` VALUES (1,1,1),(2,1,2),(3,1,3),(4,2,1),(5,2,2),(6,2,3),(7,3,1),(8,3,2),(9,3,3),(10,4,1),(11,4,2),(12,4,3),(13,5,1),(14,5,2),(15,5,3),(16,6,1),(17,6,2),(18,6,3),(19,7,1),(20,7,2),(21,7,3),(22,8,1),(23,8,2),(24,8,3),(25,9,1),(26,9,3),(27,10,2),(28,11,2),(29,12,1),(30,12,3);
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
  `stage_number` int(11) NOT NULL,
  `default_interval` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trial_forms`
--

LOCK TABLES `trial_forms` WRITE;
/*!40000 ALTER TABLE `trial_forms` DISABLE KEYS */;
INSERT INTO `trial_forms` VALUES (1,1,1,1,604800),(2,2,1,1,86400);
/*!40000 ALTER TABLE `trial_forms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient_forms`
--

DROP TABLE IF EXISTS `patient_forms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patient_forms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `form_type_id` int(11) DEFAULT NULL,
  `patient_id` int(11) DEFAULT NULL,
  `stage_number` int(11) NOT NULL,
  `interval` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-03-17 10:49:31
