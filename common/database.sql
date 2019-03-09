-- MySQL dump 10.13  Distrib 8.0.13, for Win64 (x86_64)
--
-- Host: localhost    Database: doanhoi_it
-- ------------------------------------------------------
-- Server version	8.0.13

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `activities`
--

DROP TABLE IF EXISTS `activities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `activities` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `start_regis_date` date NOT NULL,
  `end_regis_date` date NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `content` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `practise_marks` tinyint(4) NOT NULL DEFAULT '0',
  `social_marks` tinyint(4) NOT NULL DEFAULT '0',
  `max_regis_num` int(11) NOT NULL DEFAULT '0',
  `leader` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(10) unsigned DEFAULT NULL,
  `updated_by` int(10) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `activities_users_foregin` (`leader`),
  CONSTRAINT `activities_users_foregin` FOREIGN KEY (`leader`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activities`
--

LOCK TABLES `activities` WRITE;
/*!40000 ALTER TABLE `activities` DISABLE KEYS */;
/*!40000 ALTER TABLE `activities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `activity_fund_details`
--

DROP TABLE IF EXISTS `activity_fund_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `activity_fund_details` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fund_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `paying_for` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` bigint(20) NOT NULL,
  `payment_type` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(10) unsigned DEFAULT NULL,
  `updated_by` int(10) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `activity_fund_details_activity_funds_foregin` (`fund_id`),
  KEY `activity_fund_details_users_foregin` (`user_id`),
  CONSTRAINT `activity_fund_details_activity_funds_foregin` FOREIGN KEY (`fund_id`) REFERENCES `activity_funds` (`id`),
  CONSTRAINT `activity_fund_details_users_foregin` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity_fund_details`
--

LOCK TABLES `activity_fund_details` WRITE;
/*!40000 ALTER TABLE `activity_fund_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `activity_fund_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `activity_funds`
--

DROP TABLE IF EXISTS `activity_funds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `activity_funds` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `activity_id` int(10) unsigned NOT NULL,
  `initial_funds` bigint(20) NOT NULL,
  `actual_funds` bigint(20) NOT NULL,
  `name` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(10) unsigned DEFAULT NULL,
  `updated_by` int(10) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `activity_funds_activities_foregin` (`activity_id`),
  CONSTRAINT `activity_funds_activities_foregin` FOREIGN KEY (`activity_id`) REFERENCES `activities` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity_funds`
--

LOCK TABLES `activity_funds` WRITE;
/*!40000 ALTER TABLE `activity_funds` DISABLE KEYS */;
/*!40000 ALTER TABLE `activity_funds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attenders`
--

DROP TABLE IF EXISTS `attenders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `attenders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `student_id` char(20) COLLATE utf8_unicode_ci NOT NULL,
  `activity_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(10) unsigned DEFAULT NULL,
  `updated_by` int(10) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `attenders_activities_foregin` (`activity_id`),
  KEY `attenders_students_foregin` (`student_id`),
  CONSTRAINT `attenders_activities_foregin` FOREIGN KEY (`activity_id`) REFERENCES `activities` (`id`),
  CONSTRAINT `attenders_students_foregin` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attenders`
--

LOCK TABLES `attenders` WRITE;
/*!40000 ALTER TABLE `attenders` DISABLE KEYS */;
/*!40000 ALTER TABLE `attenders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `checkin`
--

DROP TABLE IF EXISTS `checkin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `checkin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `student_id` char(20) COLLATE utf8_unicode_ci NOT NULL,
  `activity_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(10) unsigned DEFAULT NULL,
  `updated_by` int(10) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `checkin_activities_foregin` (`activity_id`),
  KEY `checkin_students_foregin` (`student_id`),
  CONSTRAINT `checkin_activities_foregin` FOREIGN KEY (`activity_id`) REFERENCES `activities` (`id`),
  CONSTRAINT `checkin_students_foregin` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `checkin`
--

LOCK TABLES `checkin` WRITE;
/*!40000 ALTER TABLE `checkin` DISABLE KEYS */;
/*!40000 ALTER TABLE `checkin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classes`
--

DROP TABLE IF EXISTS `classes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `classes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `class_id` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `class_name` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(10) unsigned DEFAULT NULL,
  `updated_by` int(10) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classes`
--

LOCK TABLES `classes` WRITE;
/*!40000 ALTER TABLE `classes` DISABLE KEYS */;
/*!40000 ALTER TABLE `classes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `districts`
--

DROP TABLE IF EXISTS `districts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `districts` (
  `id` char(20) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `province_id` char(191) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(10) unsigned DEFAULT NULL,
  `updated_by` int(10) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `districts_provinces_foregin` (`province_id`),
  CONSTRAINT `districts_provinces_foregin` FOREIGN KEY (`province_id`) REFERENCES `provinces` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `districts`
--

LOCK TABLES `districts` WRITE;
/*!40000 ALTER TABLE `districts` DISABLE KEYS */;
/*!40000 ALTER TABLE `districts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (6,'2019_03_08_170435_create_roles_table',1),(7,'2019_03_08_170509_create_users_table',1),(8,'2019_03_08_170543_create_password_resets_table',1),(9,'2019_03_08_170705_create_classes_table',1),(10,'2019_03_08_170735_create_shool_years_table',1),(11,'2019_03_08_170859_create_activities_table',1),(12,'2019_03_08_170930_create_workflows_table',1),(13,'2019_03_08_171037_create_activity_funds_table',1),(14,'2019_03_08_171124_create_provinces_table',1),(15,'2019_03_08_171144_create_districts_table',1),(16,'2019_03_08_171309_create_activity_fund_details_table',1),(17,'2019_03_08_171335_create_attenders_table',1),(18,'2019_03_08_171406_create_checkin_table',1),(19,'2019_03_08_171510_create_practise_marks_table',1),(20,'2019_03_08_171534_create_social_marks_table',1),(21,'2019_03_08_171649_create_yearly_funds_table',1),(22,'2019_03_08_171712_create_news_types_table',1),(23,'2019_03_08_171724_create_news_table',1),(24,'2019_03_08_171748_create_union_fees_table',1),(25,'2019_03_08_171839_create_wards_table',1),(26,'2019_03_09_064015_create_students_table',1),(27,'2019_03_09_133158_create_user_roles_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `news` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sumary` text COLLATE utf8_unicode_ci,
  `content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(10) unsigned DEFAULT NULL,
  `updated_by` int(10) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `news_news_types_foregin` (`type_id`),
  KEY `news_users_foregin` (`created_by`),
  CONSTRAINT `news_news_types_foregin` FOREIGN KEY (`type_id`) REFERENCES `news_types` (`id`),
  CONSTRAINT `news_users_foregin` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news`
--

LOCK TABLES `news` WRITE;
/*!40000 ALTER TABLE `news` DISABLE KEYS */;
/*!40000 ALTER TABLE `news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news_types`
--

DROP TABLE IF EXISTS `news_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `news_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(10) unsigned DEFAULT NULL,
  `updated_by` int(10) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news_types`
--

LOCK TABLES `news_types` WRITE;
/*!40000 ALTER TABLE `news_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `news_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `practise_marks`
--

DROP TABLE IF EXISTS `practise_marks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `practise_marks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `student_id` char(20) COLLATE utf8_unicode_ci NOT NULL,
  `mark` tinyint(4) NOT NULL,
  `activity_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(10) unsigned DEFAULT NULL,
  `updated_by` int(10) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `practise_marks_activities_foregin` (`activity_id`),
  KEY `practise_marks_students_foregin` (`student_id`),
  CONSTRAINT `practise_marks_activities_foregin` FOREIGN KEY (`activity_id`) REFERENCES `activities` (`id`),
  CONSTRAINT `practise_marks_students_foregin` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `practise_marks`
--

LOCK TABLES `practise_marks` WRITE;
/*!40000 ALTER TABLE `practise_marks` DISABLE KEYS */;
/*!40000 ALTER TABLE `practise_marks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `provinces`
--

DROP TABLE IF EXISTS `provinces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `provinces` (
  `id` char(20) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(10) unsigned DEFAULT NULL,
  `updated_by` int(10) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provinces`
--

LOCK TABLES `provinces` WRITE;
/*!40000 ALTER TABLE `provinces` DISABLE KEYS */;
/*!40000 ALTER TABLE `provinces` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(10) unsigned DEFAULT NULL,
  `updated_by` int(10) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `school_years`
--

DROP TABLE IF EXISTS `school_years`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `school_years` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(10) unsigned DEFAULT NULL,
  `updated_by` int(10) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `school_years`
--

LOCK TABLES `school_years` WRITE;
/*!40000 ALTER TABLE `school_years` DISABLE KEYS */;
/*!40000 ALTER TABLE `school_years` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_marks`
--

DROP TABLE IF EXISTS `social_marks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `social_marks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `student_id` char(20) COLLATE utf8_unicode_ci NOT NULL,
  `mark` tinyint(4) NOT NULL,
  `activity_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(10) unsigned DEFAULT NULL,
  `updated_by` int(10) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `social_marks_activities_foregin` (`activity_id`),
  KEY `social_marks_students_foregin` (`student_id`),
  CONSTRAINT `social_marks_activities_foregin` FOREIGN KEY (`activity_id`) REFERENCES `activities` (`id`),
  CONSTRAINT `social_marks_students_foregin` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_marks`
--

LOCK TABLES `social_marks` WRITE;
/*!40000 ALTER TABLE `social_marks` DISABLE KEYS */;
/*!40000 ALTER TABLE `social_marks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `students` (
  `student_id` char(20) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `class_id` int(10) unsigned NOT NULL,
  `school_year_id` int(10) unsigned NOT NULL,
  `address` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `sex` tinyint(1) NOT NULL DEFAULT '1',
  `phone_no` int(11) NOT NULL DEFAULT '1',
  `is_youth_union_member` tinyint(1) NOT NULL DEFAULT '1',
  `is_study` tinyint(1) NOT NULL DEFAULT '1',
  `date_on_union` date DEFAULT NULL,
  `is_payed_union_fee` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(10) unsigned DEFAULT NULL,
  `updated_by` int(10) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`student_id`),
  KEY `students_classes_foregin` (`class_id`),
  KEY `students_school_years_foregin` (`school_year_id`),
  CONSTRAINT `students_classes_foregin` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`),
  CONSTRAINT `students_school_years_foregin` FOREIGN KEY (`school_year_id`) REFERENCES `school_years` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `union_fees`
--

DROP TABLE IF EXISTS `union_fees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `union_fees` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `value` bigint(20) NOT NULL,
  `school_year_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(10) unsigned DEFAULT NULL,
  `updated_by` int(10) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `union_fees_school_years_foregin` (`school_year_id`),
  CONSTRAINT `union_fees_school_years_foregin` FOREIGN KEY (`school_year_id`) REFERENCES `school_years` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `union_fees`
--

LOCK TABLES `union_fees` WRITE;
/*!40000 ALTER TABLE `union_fees` DISABLE KEYS */;
/*!40000 ALTER TABLE `union_fees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_roles`
--

DROP TABLE IF EXISTS `user_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `user_roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(10) unsigned DEFAULT NULL,
  `updated_by` int(10) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_roles_users_foregin` (`user_id`),
  KEY `user_roles_roles_foregin` (`role_id`),
  CONSTRAINT `user_roles_roles_foregin` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`),
  CONSTRAINT `user_roles_users_foregin` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_roles`
--

LOCK TABLES `user_roles` WRITE;
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  `student_id` char(20) COLLATE utf8_unicode_ci NOT NULL,
  `level` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '0: Sinh vien, 1: UV BCH, 2: Thuong truc',
  `created_by` int(10) unsigned DEFAULT NULL,
  `updated_by` int(10) unsigned DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_student_id_foregin` (`student_id`),
  CONSTRAINT `users_student_id_foregin` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wards`
--

DROP TABLE IF EXISTS `wards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `wards` (
  `id` char(20) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `district_id` char(191) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(10) unsigned DEFAULT NULL,
  `updated_by` int(10) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `wards_districts_foregin` (`district_id`),
  CONSTRAINT `wards_districts_foregin` FOREIGN KEY (`district_id`) REFERENCES `districts` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wards`
--

LOCK TABLES `wards` WRITE;
/*!40000 ALTER TABLE `wards` DISABLE KEYS */;
/*!40000 ALTER TABLE `wards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflows`
--

DROP TABLE IF EXISTS `workflows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `workflows` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `activity_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `begin_date` date NOT NULL,
  `deadline` date NOT NULL,
  `content` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `progress` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(10) unsigned NOT NULL,
  `updated_by` int(10) unsigned NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `workflows_users_foregin` (`user_id`),
  KEY `workflows_activities_foregin` (`activity_id`),
  CONSTRAINT `workflows_activities_foregin` FOREIGN KEY (`activity_id`) REFERENCES `activities` (`id`),
  CONSTRAINT `workflows_users_foregin` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflows`
--

LOCK TABLES `workflows` WRITE;
/*!40000 ALTER TABLE `workflows` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflows` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yearly_funds`
--

DROP TABLE IF EXISTS `yearly_funds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `yearly_funds` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `school_year_id` int(10) unsigned NOT NULL,
  `semester1_value` bigint(20) DEFAULT NULL,
  `semester2_value` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(10) unsigned DEFAULT NULL,
  `updated_by` int(10) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `yearly_funds_school_years_foregin` (`school_year_id`),
  CONSTRAINT `yearly_funds_school_years_foregin` FOREIGN KEY (`school_year_id`) REFERENCES `school_years` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yearly_funds`
--

LOCK TABLES `yearly_funds` WRITE;
/*!40000 ALTER TABLE `yearly_funds` DISABLE KEYS */;
/*!40000 ALTER TABLE `yearly_funds` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-03-09 22:05:39
