-- MySQL dump 10.13  Distrib 5.5.35, for Linux (x86_64)
--
-- Host: localhost    Database: mor
-- ------------------------------------------------------
-- Server version	5.5.35

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
-- Table structure for table `acc_group_rights`
--

DROP TABLE IF EXISTS `acc_group_rights`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acc_group_rights` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `acc_group_id` int(11) NOT NULL COMMENT 'Accountant group id',
  `acc_right_id` int(11) NOT NULL COMMENT 'Accountant right id',
  `value` tinyint(4) NOT NULL COMMENT 'Role right value ',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acc_group_rights`
--

LOCK TABLES `acc_group_rights` WRITE;
/*!40000 ALTER TABLE `acc_group_rights` DISABLE KEYS */;
INSERT INTO `acc_group_rights` VALUES (1,1,1,1),(2,1,2,1),(3,1,3,1),(4,1,4,2),(5,1,5,2),(6,1,6,2),(7,1,7,1),(8,1,8,1),(9,1,9,1),(10,1,10,1),(11,1,11,1),(12,1,12,1),(13,1,14,1),(14,1,15,1),(15,1,16,2),(16,1,17,1),(17,1,19,2),(18,1,20,1),(19,1,21,2),(20,1,22,1),(21,1,23,2),(22,1,24,1),(23,1,25,2),(24,1,27,2),(25,1,28,2),(26,1,29,2),(27,1,39,1),(28,1,42,1),(29,1,43,1),(30,1,44,1),(31,2,1,1),(32,2,2,1),(33,2,3,2),(34,2,4,1),(35,2,5,1),(36,2,6,1),(37,2,7,1),(38,2,8,2),(39,2,9,2),(40,2,10,2),(41,2,11,2),(42,2,12,2),(43,2,14,2),(44,2,15,2),(45,2,16,1),(46,2,17,2),(47,2,19,1),(48,2,20,2),(49,2,21,1),(50,2,22,2),(51,2,23,1),(52,2,24,2),(53,2,25,0),(54,2,27,1),(55,2,28,1),(56,2,29,1),(57,2,39,2),(58,2,42,1),(59,2,43,0),(60,2,44,2),(61,3,1,2),(62,3,2,2),(63,3,3,2),(64,3,4,2),(65,3,5,2),(66,3,6,2),(67,3,7,2),(68,3,8,2),(69,3,9,2),(70,3,10,2),(71,3,11,2),(72,3,12,2),(73,3,14,2),(74,3,15,2),(75,3,16,2),(76,3,17,2),(77,3,19,2),(78,3,20,2),(79,3,21,2),(80,3,22,2),(81,3,23,2),(82,3,24,2),(83,3,25,2),(84,3,27,2),(85,3,28,2),(86,3,29,2),(87,3,39,2),(88,3,42,1),(89,3,43,1),(90,3,44,2),(91,4,31,2),(92,4,32,2),(93,4,33,0),(94,4,38,2),(95,4,47,0);
/*!40000 ALTER TABLE `acc_group_rights` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acc_groups`
--

DROP TABLE IF EXISTS `acc_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acc_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT 'Accountant group name',
  `only_view` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'accountants can only view data',
  `group_type` varchar(20) NOT NULL DEFAULT 'accountant' COMMENT 'Type of the permission Group',
  `description` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acc_groups`
--

LOCK TABLES `acc_groups` WRITE;
/*!40000 ALTER TABLE `acc_groups` DISABLE KEYS */;
INSERT INTO `acc_groups` VALUES (1,'Sales',0,'accountant',''),(2,'NOC',0,'accountant',''),(3,'Manager',0,'accountant',''),(4,'General',0,'reseller','');
/*!40000 ALTER TABLE `acc_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acc_permissions`
--

DROP TABLE IF EXISTS `acc_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acc_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `acc_group_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `nice_name` varchar(100) NOT NULL,
  `value` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acc_permissions`
--

LOCK TABLES `acc_permissions` WRITE;
/*!40000 ALTER TABLE `acc_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `acc_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acc_rights`
--

DROP TABLE IF EXISTS `acc_rights`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acc_rights` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT 'Accountant right name',
  `nice_name` varchar(255) NOT NULL DEFAULT '' COMMENT 'Accountant right name to be shown in translation',
  `permission_group` varchar(50) NOT NULL DEFAULT '' COMMENT 'Permission group',
  `right_type` varchar(20) NOT NULL DEFAULT 'accountant' COMMENT 'Type of the permission Right',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acc_rights`
--

LOCK TABLES `acc_rights` WRITE;
/*!40000 ALTER TABLE `acc_rights` DISABLE KEYS */;
INSERT INTO `acc_rights` VALUES (1,'user_create_opt_1','User_Password','User','accountant'),(2,'user_create_opt_2','User_Type','User','accountant'),(3,'user_create_opt_3','User_Lrc','User','accountant'),(4,'user_create_opt_4','User_Tariff','User','accountant'),(5,'user_create_opt_5','User_Balance','User','accountant'),(6,'user_create_opt_6','User_Payment_type','User','accountant'),(7,'user_create_opt_7','User_Call_limit','User','accountant'),(8,'device_edit_opt_1','Device_Extension','Device','accountant'),(9,'device_edit_opt_2','Device_Autentication','Device','accountant'),(10,'device_edit_opt_3','Decive_CallerID_Name','Device','accountant'),(11,'device_edit_opt_4','Device_CallerID_Number','Device','accountant'),(12,'Device_PIN','Device_PIN','Device','accountant'),(14,'Device_Password','Device_Password','Device','accountant'),(15,'VoiceMail_Password','VoiceMail_Password','Device','accountant'),(16,'User_create','User_create','User','accountant'),(17,'Device_create','Device_create','Device','accountant'),(19,'Tariff_manage','Tariff_manage','Tariff','accountant'),(20,'manage_dids_opt_1','Manage_DID','DID','accountant'),(21,'manage_subscriptions_opt_1','Manage_subscriptions','Subscription','accountant'),(22,'cli_ivr','IVR','CLI','accountant'),(23,'user_manage','Manage_Users','User','accountant'),(24,'device_manage','Manage_Devices','Device','accountant'),(25,'see_financial_data','See_Financial_Data','Data','accountant'),(27,'services_manage','Manage_Services','Services','accountant'),(28,'invoices_manage','Manage_Invoices','Invoices','accountant'),(29,'payments_manage','Manage_Payments','Payments','accountant'),(31,'calling_cards','Calling_Cards','Plugins','reseller'),(32,'call_shop','Call_Shop','Plugins','reseller'),(33,'sms_addon','SMS','Plugins','reseller'),(38,'autodialer','Autodialer','Plugins','reseller'),(39,'recordings_manage','Manage_Recordings','Device','accountant'),(42,'provider','Provider','Active_Calls','accountant'),(43,'call_tracing_usage','call_tracing_usage','Functions','accountant'),(44,'manage_queues','Manage_Queues','DID','accountant'),(47,'pbx_functions','Pbx_functions','Plugins','reseller');
/*!40000 ALTER TABLE `acc_rights` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `actions`
--

DROP TABLE IF EXISTS `actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `actions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `action` varchar(50) NOT NULL DEFAULT '0',
  `data` varchar(255) DEFAULT NULL,
  `data2` varchar(255) DEFAULT NULL,
  `processed` int(11) DEFAULT '0',
  `target_type` varchar(255) DEFAULT '' COMMENT 'target type user/device/cardgroup...',
  `target_id` int(11) DEFAULT NULL COMMENT 'id of target ',
  `data3` varchar(255) DEFAULT NULL,
  `data4` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id_index` (`user_id`),
  KEY `target_id_index` (`target_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actions`
--

LOCK TABLES `actions` WRITE;
/*!40000 ALTER TABLE `actions` DISABLE KEYS */;
/*!40000 ALTER TABLE `actions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `active_calls_data`
--

DROP TABLE IF EXISTS `active_calls_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `active_calls_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `count` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `time` (`time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `active_calls_data`
--

LOCK TABLES `active_calls_data` WRITE;
/*!40000 ALTER TABLE `active_calls_data` DISABLE KEYS */;
INSERT INTO `active_calls_data` VALUES (1,'2014-07-29 14:55:35',0),(2,'2014-07-29 14:55:50',0),(3,'2014-07-29 14:56:05',0);
/*!40000 ALTER TABLE `active_calls_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `activecalls`
--

DROP TABLE IF EXISTS `activecalls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `activecalls` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `server_id` int(11) DEFAULT NULL,
  `uniqueid` varchar(255) DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `answer_time` datetime DEFAULT NULL,
  `transfer_time` datetime DEFAULT NULL,
  `src` varchar(255) DEFAULT NULL,
  `dst` varchar(255) DEFAULT NULL,
  `src_device_id` int(11) DEFAULT NULL,
  `dst_device_id` int(11) DEFAULT NULL,
  `channel` varchar(255) DEFAULT NULL,
  `dstchannel` varchar(255) DEFAULT NULL,
  `prefix` varchar(255) DEFAULT NULL,
  `provider_id` int(11) DEFAULT NULL,
  `did_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `localized_dst` varchar(100) DEFAULT NULL,
  `card_id` int(11) DEFAULT '0' COMMENT 'card which is making this call',
  `user_rate` decimal(30,15) DEFAULT '0.000000000000000',
  `lega_codec` varchar(20) DEFAULT NULL,
  `legb_codec` varchar(20) DEFAULT NULL,
  `pdd` decimal(30,15) DEFAULT '0.000000000000000',
  PRIMARY KEY (`id`),
  KEY `user_id_index` (`user_id`),
  KEY `prov_index` (`provider_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activecalls`
--

LOCK TABLES `activecalls` WRITE;
/*!40000 ALTER TABLE `activecalls` DISABLE KEYS */;
/*!40000 ALTER TABLE `activecalls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acustratedetails`
--

DROP TABLE IF EXISTS `acustratedetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acustratedetails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from` int(11) DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `artype` enum('event','minute') DEFAULT NULL,
  `round` int(11) DEFAULT NULL,
  `price` decimal(30,15) DEFAULT '0.000000000000000',
  `customrate_id` int(11) DEFAULT NULL,
  `start_time` time DEFAULT '00:00:00',
  `end_time` time DEFAULT '23:59:59',
  `daytype` enum('','FD','WD') DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acustratedetails`
--

LOCK TABLES `acustratedetails` WRITE;
/*!40000 ALTER TABLE `acustratedetails` DISABLE KEYS */;
/*!40000 ALTER TABLE `acustratedetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `adactions`
--

DROP TABLE IF EXISTS `adactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `priority` int(11) DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `data` varchar(255) DEFAULT NULL,
  `campaign_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adactions`
--

LOCK TABLES `adactions` WRITE;
/*!40000 ALTER TABLE `adactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `adactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addresses`
--

DROP TABLE IF EXISTS `addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `addresses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `direction_id` int(11) DEFAULT NULL,
  `state` varchar(30) DEFAULT NULL,
  `county` varchar(30) DEFAULT NULL,
  `city` varchar(30) DEFAULT NULL,
  `postcode` varchar(20) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `mob_phone` varchar(30) DEFAULT NULL,
  `fax` varchar(30) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addresses`
--

LOCK TABLES `addresses` WRITE;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
INSERT INTO `addresses` VALUES (1,1,'','','','','','','','',''),(2,1,'','','','','','','','',NULL);
/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `adnumbers`
--

DROP TABLE IF EXISTS `adnumbers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adnumbers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT 'new',
  `campaign_id` int(11) DEFAULT NULL,
  `executed_time` datetime DEFAULT NULL,
  `completed_time` datetime DEFAULT NULL,
  `channel` varchar(255) DEFAULT NULL,
  `uniqueid` varchar(30) DEFAULT NULL,
  `user_id` int(11) DEFAULT '0' COMMENT 'Owner id of adnumbers',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniqueidindex` (`uniqueid`),
  KEY `ad1` (`status`,`campaign_id`) USING BTREE,
  KEY `number_index` (`number`),
  KEY `campaign_id_index` (`campaign_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adnumbers`
--

LOCK TABLES `adnumbers` WRITE;
/*!40000 ALTER TABLE `adnumbers` DISABLE KEYS */;
/*!40000 ALTER TABLE `adnumbers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aggregates`
--

DROP TABLE IF EXISTS `aggregates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aggregates` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uniqueid` bigint(11) unsigned NOT NULL DEFAULT '0',
  `direction` varchar(255) DEFAULT NULL,
  `destination` varchar(255) DEFAULT NULL,
  `prefix` varchar(255) DEFAULT NULL,
  `terminator_id` int(11) DEFAULT '0',
  `user_id` int(11) DEFAULT '0',
  `reseller_id` int(11) DEFAULT NULL,
  `time_period_id` int(11) NOT NULL DEFAULT '0',
  `user_billed` decimal(30,15) DEFAULT '0.000000000000000',
  `user_billed_with_tax` decimal(30,15) DEFAULT '0.000000000000000',
  `terminator_billed` decimal(30,15) DEFAULT '0.000000000000000',
  `user_billed_billsec` int(11) NOT NULL DEFAULT '0',
  `terminator_billed_billsec` int(11) NOT NULL DEFAULT '0',
  `billsec` int(11) NOT NULL DEFAULT '0',
  `real_billsec` decimal(30,15) DEFAULT '0.000000000000000',
  `answered_calls` int(11) NOT NULL DEFAULT '0',
  `total_calls` int(11) NOT NULL DEFAULT '0',
  `total_calls_for_user` int(11) NOT NULL DEFAULT '0',
  `variation` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniqueid` (`uniqueid`),
  KEY `time_period_id_index` (`time_period_id`),
  KEY `user_id_index` (`user_id`),
  KEY `terminator_id_index` (`terminator_id`),
  KEY `reseller_id_index` (`reseller_id`),
  KEY `variation_index` (`variation`),
  KEY `prefix_index` (`prefix`(4)),
  KEY `direction_index` (`direction`),
  KEY `destination_index` (`destination`(6))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aggregates`
--

LOCK TABLES `aggregates` WRITE;
/*!40000 ALTER TABLE `aggregates` DISABLE KEYS */;
/*!40000 ALTER TABLE `aggregates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alert_contact_groups`
--

DROP TABLE IF EXISTS `alert_contact_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alert_contact_groups` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `alert_contact_id` bigint(20) unsigned NOT NULL COMMENT '->alert_contacts.id',
  `alert_group_id` bigint(20) unsigned NOT NULL COMMENT '->alert_groups.id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alert_contact_groups`
--

LOCK TABLES `alert_contact_groups` WRITE;
/*!40000 ALTER TABLE `alert_contact_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `alert_contact_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alert_contacts`
--

DROP TABLE IF EXISTS `alert_contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alert_contacts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `status` enum('enabled','disabled') NOT NULL DEFAULT 'enabled',
  `timezone` tinyint(4) NOT NULL DEFAULT '0',
  `email` varchar(100) DEFAULT NULL,
  `max_emails_per_hour` int(10) unsigned NOT NULL DEFAULT '0',
  `emails_this_hour` int(10) unsigned NOT NULL DEFAULT '0',
  `max_emails_per_day` int(10) unsigned NOT NULL DEFAULT '0',
  `emails_this_day` int(10) unsigned NOT NULL DEFAULT '0',
  `phone_number` varchar(50) DEFAULT NULL,
  `max_sms_per_hour` int(10) unsigned NOT NULL DEFAULT '0',
  `sms_this_hour` int(10) unsigned NOT NULL DEFAULT '0',
  `max_sms_per_day` int(10) unsigned NOT NULL DEFAULT '0',
  `sms_this_day` int(10) unsigned NOT NULL DEFAULT '0',
  `comment` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alert_contacts`
--

LOCK TABLES `alert_contacts` WRITE;
/*!40000 ALTER TABLE `alert_contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `alert_contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alert_dependencies`
--

DROP TABLE IF EXISTS `alert_dependencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alert_dependencies` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `owner_alert_id` bigint(20) unsigned NOT NULL,
  `alert_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alert_dependencies`
--

LOCK TABLES `alert_dependencies` WRITE;
/*!40000 ALTER TABLE `alert_dependencies` DISABLE KEYS */;
/*!40000 ALTER TABLE `alert_dependencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alert_groups`
--

DROP TABLE IF EXISTS `alert_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alert_groups` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `status` enum('enabled','disabled') NOT NULL DEFAULT 'enabled',
  `email_schedule_id` bigint(20) unsigned NOT NULL COMMENT '-> alerts_schedules.id',
  `max_emails_per_month` int(10) unsigned NOT NULL DEFAULT '0',
  `emails_this_month` int(10) unsigned NOT NULL DEFAULT '0',
  `sms_schedule_id` bigint(20) unsigned NOT NULL COMMENT '-> alerts_schedules.id',
  `max_sms_per_month` int(10) unsigned NOT NULL DEFAULT '0',
  `sms_this_month` int(10) unsigned NOT NULL DEFAULT '0',
  `comment` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alert_groups`
--

LOCK TABLES `alert_groups` WRITE;
/*!40000 ALTER TABLE `alert_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `alert_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alert_schedule_periods`
--

DROP TABLE IF EXISTS `alert_schedule_periods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alert_schedule_periods` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `alert_schedule_id` bigint(20) unsigned NOT NULL COMMENT '->alert_shedules.id',
  `day_type` enum('all days','monday','tuesday','wednesday','thursday','friday','saturday','sunday') NOT NULL DEFAULT 'all days',
  `status` enum('ON','OFF') NOT NULL DEFAULT 'ON',
  `start` time NOT NULL DEFAULT '00:00:00',
  `end` time NOT NULL DEFAULT '23:59:59',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alert_schedule_periods`
--

LOCK TABLES `alert_schedule_periods` WRITE;
/*!40000 ALTER TABLE `alert_schedule_periods` DISABLE KEYS */;
/*!40000 ALTER TABLE `alert_schedule_periods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alert_schedules`
--

DROP TABLE IF EXISTS `alert_schedules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alert_schedules` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `status` enum('enabled','disabled') NOT NULL DEFAULT 'enabled',
  `comment` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alert_schedules`
--

LOCK TABLES `alert_schedules` WRITE;
/*!40000 ALTER TABLE `alert_schedules` DISABLE KEYS */;
/*!40000 ALTER TABLE `alert_schedules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alerts`
--

DROP TABLE IF EXISTS `alerts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alerts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `status` enum('enabled','disabled') NOT NULL DEFAULT 'enabled',
  `alert_type` enum('asr','acd','pdd','ttc','billsec_sum','calls_total','calls_answered','calls_not_answered','price_sum','sim_calls','hgc_absolute','hgc_percent','group') DEFAULT NULL,
  `alert_count_type` enum('ABS') DEFAULT NULL,
  `check_type` enum('user','provider','device','destination','destination_group') NOT NULL DEFAULT 'user',
  `check_data` varchar(50) DEFAULT NULL,
  `value_at_alert` decimal(12,2) unsigned DEFAULT NULL,
  `alert_if_less` decimal(12,2) unsigned DEFAULT NULL,
  `alert_if_more` decimal(12,2) unsigned DEFAULT NULL,
  `alert_raised_at` timestamp NULL DEFAULT NULL,
  `value_at_clear` decimal(12,2) unsigned DEFAULT NULL,
  `clear_if_less` decimal(12,2) unsigned DEFAULT NULL,
  `clear_if_more` decimal(12,2) unsigned DEFAULT NULL,
  `alert_cleared_at` timestamp NULL DEFAULT NULL,
  `ignore_if_calls_less` int(10) unsigned NOT NULL DEFAULT '0',
  `ignore_if_calls_more` int(10) unsigned NOT NULL DEFAULT '0',
  `action_alert_email` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `action_alert_sms` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `action_alert_disable_object` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `action_alert_change_lcr_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '->lcrs.id',
  `action_clear_email` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `action_clear_sms` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `action_clear_enable_object` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `action_clear_restore_original_lcr` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `action_clear_change_lcr_id` int(11) NOT NULL DEFAULT '0' COMMENT '->lcrs.id (-1 to restore original)',
  `before_alert_original_lcr_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '->lcrs.id',
  `alert_groups_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '->alert_groups.id',
  `comment` varchar(250) DEFAULT NULL,
  `count_period` int(10) unsigned NOT NULL DEFAULT '60',
  `disable_clear` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `owner_id` int(11) DEFAULT '0',
  `clear_after` int(10) unsigned DEFAULT '0',
  `enable_provider_in_lcr` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `disable_provider_in_lcr` int(11) NOT NULL DEFAULT '0',
  `clear_on_date` datetime DEFAULT NULL,
  `notify_to_user` int(11) NOT NULL DEFAULT '0',
  `hgc` int(11) NOT NULL DEFAULT '0',
  `alert_when_more_than` int(11) unsigned NOT NULL DEFAULT '0',
  `clear_when_less_than` int(11) unsigned NOT NULL DEFAULT '0',
  `name` varchar(30) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alerts`
--

LOCK TABLES `alerts` WRITE;
/*!40000 ALTER TABLE `alerts` DISABLE KEYS */;
/*!40000 ALTER TABLE `alerts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aratedetails`
--

DROP TABLE IF EXISTS `aratedetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aratedetails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from` int(11) DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `artype` enum('event','minute') DEFAULT NULL,
  `round` int(11) DEFAULT NULL,
  `price` decimal(30,15) DEFAULT '0.000000000000000',
  `rate_id` int(11) DEFAULT NULL,
  `start_time` time DEFAULT '00:00:00',
  `end_time` time DEFAULT '23:59:59',
  `daytype` enum('','FD','WD') DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `rate_index` (`rate_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aratedetails`
--

LOCK TABLES `aratedetails` WRITE;
/*!40000 ALTER TABLE `aratedetails` DISABLE KEYS */;
/*!40000 ALTER TABLE `aratedetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `background_tasks`
--

DROP TABLE IF EXISTS `background_tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `background_tasks` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `owner_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `task_id` int(11) NOT NULL,
  `status` enum('WAITING','IN PROGRESS','DONE','FAILED') NOT NULL,
  `percent_completed` float NOT NULL DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `started_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `expected_to_finish_at` datetime DEFAULT NULL,
  `finished_at` datetime DEFAULT NULL,
  `failed_at` datetime DEFAULT NULL,
  `last_error` varchar(255) DEFAULT NULL,
  `to_do_times` int(11) DEFAULT NULL,
  `attempts` int(11) DEFAULT NULL,
  `data1` varchar(255) DEFAULT NULL,
  `data2` varchar(255) DEFAULT NULL,
  `data3` varchar(255) DEFAULT NULL,
  `data4` varchar(255) DEFAULT NULL,
  `data5` varchar(255) DEFAULT NULL,
  `data6` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `background_tasks`
--

LOCK TABLES `background_tasks` WRITE;
/*!40000 ALTER TABLE `background_tasks` DISABLE KEYS */;
/*!40000 ALTER TABLE `background_tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `backups`
--

DROP TABLE IF EXISTS `backups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `backups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `backuptime` varchar(255) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `backuptype` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `backups`
--

LOCK TABLES `backups` WRITE;
/*!40000 ALTER TABLE `backups` DISABLE KEYS */;
INSERT INTO `backups` VALUES (1,'20140723000011','','auto'),(2,'20140724000018','','auto'),(3,'20140725000017','','auto'),(4,'20140726000028','','auto'),(5,'20140727000005','','auto'),(6,'20140728000016','','auto'),(7,'20140729000009','','auto');
/*!40000 ALTER TABLE `backups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bl_dst_new_score`
--

DROP TABLE IF EXISTS `bl_dst_new_score`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bl_dst_new_score` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `value` varchar(100) NOT NULL,
  `score` int(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `bl_dst_new_score_index` (`value`(10))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bl_dst_new_score`
--

LOCK TABLES `bl_dst_new_score` WRITE;
/*!40000 ALTER TABLE `bl_dst_new_score` DISABLE KEYS */;
INSERT INTO `bl_dst_new_score` VALUES (1,'default',30);
/*!40000 ALTER TABLE `bl_dst_new_score` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bl_dst_scoring`
--

DROP TABLE IF EXISTS `bl_dst_scoring`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bl_dst_scoring` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `value` varchar(100) NOT NULL,
  `score` int(4) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `bl_dst_scoring_index` (`value`(10))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bl_dst_scoring`
--

LOCK TABLES `bl_dst_scoring` WRITE;
/*!40000 ALTER TABLE `bl_dst_scoring` DISABLE KEYS */;
/*!40000 ALTER TABLE `bl_dst_scoring` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bl_ip_new_score`
--

DROP TABLE IF EXISTS `bl_ip_new_score`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bl_ip_new_score` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `value` varchar(100) NOT NULL,
  `score` int(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `bl_ip_new_score_index` (`value`(10))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bl_ip_new_score`
--

LOCK TABLES `bl_ip_new_score` WRITE;
/*!40000 ALTER TABLE `bl_ip_new_score` DISABLE KEYS */;
INSERT INTO `bl_ip_new_score` VALUES (1,'default',30);
/*!40000 ALTER TABLE `bl_ip_new_score` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bl_ip_scoring`
--

DROP TABLE IF EXISTS `bl_ip_scoring`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bl_ip_scoring` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `value` varchar(100) NOT NULL,
  `score` int(4) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `bl_ip_scoring_index` (`value`(10))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bl_ip_scoring`
--

LOCK TABLES `bl_ip_scoring` WRITE;
/*!40000 ALTER TABLE `bl_ip_scoring` DISABLE KEYS */;
/*!40000 ALTER TABLE `bl_ip_scoring` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bl_src_new_score`
--

DROP TABLE IF EXISTS `bl_src_new_score`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bl_src_new_score` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `value` varchar(100) NOT NULL,
  `score` int(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `bl_src_new_score_index` (`value`(10))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bl_src_new_score`
--

LOCK TABLES `bl_src_new_score` WRITE;
/*!40000 ALTER TABLE `bl_src_new_score` DISABLE KEYS */;
INSERT INTO `bl_src_new_score` VALUES (1,'default',30);
/*!40000 ALTER TABLE `bl_src_new_score` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bl_src_scoring`
--

DROP TABLE IF EXISTS `bl_src_scoring`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bl_src_scoring` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `value` varchar(100) NOT NULL,
  `score` int(4) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `bl_src_scoring_index` (`value`(10))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bl_src_scoring`
--

LOCK TABLES `bl_src_scoring` WRITE;
/*!40000 ALTER TABLE `bl_src_scoring` DISABLE KEYS */;
/*!40000 ALTER TABLE `bl_src_scoring` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blanks`
--

DROP TABLE IF EXISTS `blanks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blanks` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `description` text,
  `value1` int(11) DEFAULT NULL,
  `value2` decimal(8,4) DEFAULT NULL,
  `value3` enum('yes','no') DEFAULT 'no',
  `balance` decimal(30,15) NOT NULL DEFAULT '0.000000000000000',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blanks`
--

LOCK TABLES `blanks` WRITE;
/*!40000 ALTER TABLE `blanks` DISABLE KEYS */;
/*!40000 ALTER TABLE `blanks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `call_details`
--

DROP TABLE IF EXISTS `call_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `call_details` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `call_id` bigint(20) DEFAULT NULL,
  `pdd` decimal(30,15) DEFAULT '0.000000000000000',
  `la_ip` int(11) DEFAULT NULL,
  `la_local_ip` int(11) DEFAULT NULL,
  `la_codec` int(11) DEFAULT NULL,
  `la_rtt` decimal(30,15) DEFAULT '0.000000000000000',
  `la_r` int(11) DEFAULT NULL,
  `la_mos` decimal(30,15) DEFAULT '0.000000000000000',
  `la_rxcount` int(11) DEFAULT NULL,
  `la_lp` int(11) DEFAULT NULL,
  `la_rxjitter` decimal(30,15) DEFAULT '0.000000000000000',
  `la_r_r` int(11) DEFAULT NULL,
  `la_r_mos` decimal(30,15) DEFAULT '0.000000000000000',
  `la_tx_count` int(11) DEFAULT NULL,
  `la_rlp` int(11) DEFAULT NULL,
  `la_txjitter` decimal(30,15) DEFAULT '0.000000000000000',
  `la_t_r` int(11) DEFAULT NULL,
  `la_t_mos` decimal(30,15) DEFAULT '0.000000000000000',
  `lb_ip` int(11) DEFAULT NULL,
  `lb_local_ip` int(11) DEFAULT NULL,
  `lb_codec` tinyint(4) DEFAULT NULL,
  `lb_rtt` decimal(30,15) DEFAULT '0.000000000000000',
  `lb_r` int(11) DEFAULT NULL,
  `lb_mos` decimal(30,15) DEFAULT '0.000000000000000',
  `lb_rxcount` int(11) DEFAULT NULL,
  `lb_lp` int(11) DEFAULT NULL,
  `lb_rxjitter` decimal(30,15) DEFAULT '0.000000000000000',
  `lb_r_r` int(11) DEFAULT NULL,
  `lb_r_mos` decimal(30,15) DEFAULT '0.000000000000000',
  `lb_txcount` int(11) DEFAULT NULL,
  `lb_rlp` int(11) DEFAULT NULL,
  `lb_txjitter` decimal(30,15) DEFAULT '0.000000000000000',
  `lb_t_r` int(11) DEFAULT NULL,
  `lb_t_mos` decimal(30,15) DEFAULT '0.000000000000000',
  `peerip` int(10) unsigned DEFAULT NULL,
  `recvip` int(10) unsigned DEFAULT NULL,
  `sipfrom` varchar(255) DEFAULT NULL,
  `uri` varchar(255) DEFAULT NULL,
  `useragent` varchar(255) DEFAULT NULL,
  `peername` varchar(255) DEFAULT NULL,
  `t38passthrough` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `call_id_index` (`call_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `call_details`
--

LOCK TABLES `call_details` WRITE;
/*!40000 ALTER TABLE `call_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `call_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `call_logs`
--

DROP TABLE IF EXISTS `call_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `call_logs` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uniqueid` varchar(20) NOT NULL,
  `log` text,
  PRIMARY KEY (`id`),
  KEY `uniqueid_index` (`uniqueid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `call_logs`
--

LOCK TABLES `call_logs` WRITE;
/*!40000 ALTER TABLE `call_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `call_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `callerids`
--

DROP TABLE IF EXISTS `callerids`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `callerids` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cli` varchar(255) DEFAULT NULL,
  `device_id` int(11) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `added_at` datetime DEFAULT NULL,
  `banned` int(4) DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `ivr_id` int(11) DEFAULT '0',
  `comment` text,
  `email_callback` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `cli_device_id` (`cli`,`device_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `callerids`
--

LOCK TABLES `callerids` WRITE;
/*!40000 ALTER TABLE `callerids` DISABLE KEYS */;
/*!40000 ALTER TABLE `callerids` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `callflows`
--

DROP TABLE IF EXISTS `callflows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `callflows` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `device_id` int(11) DEFAULT NULL,
  `cf_type` varchar(255) DEFAULT NULL,
  `priority` int(11) NOT NULL DEFAULT '1',
  `action` varchar(255) DEFAULT NULL,
  `data` varchar(255) DEFAULT NULL,
  `data2` varchar(255) DEFAULT NULL,
  `time_data` varchar(255) DEFAULT NULL,
  `data3` int(11) DEFAULT '1',
  `data4` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `callflows`
--

LOCK TABLES `callflows` WRITE;
/*!40000 ALTER TABLE `callflows` DISABLE KEYS */;
/*!40000 ALTER TABLE `callflows` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calls`
--

DROP TABLE IF EXISTS `calls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `calls` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `calldate` timestamp NULL DEFAULT NULL,
  `date` date DEFAULT NULL,
  `clid` varchar(80) NOT NULL,
  `src` varchar(80) NOT NULL,
  `dst` varchar(80) NOT NULL,
  `channel` varchar(80) NOT NULL,
  `duration` int(11) NOT NULL DEFAULT '0',
  `billsec` int(11) NOT NULL DEFAULT '0',
  `disposition` enum('FAILED','NO ANSWER','BUSY','ANSWERED') DEFAULT NULL,
  `accountcode` varchar(20) NOT NULL,
  `uniqueid` varchar(32) NOT NULL,
  `src_device_id` int(11) NOT NULL DEFAULT '0',
  `dst_device_id` int(11) NOT NULL DEFAULT '0',
  `processed` tinyint(4) NOT NULL DEFAULT '0',
  `did_price` decimal(30,15) DEFAULT '0.000000000000000',
  `card_id` int(11) DEFAULT NULL,
  `provider_id` int(11) DEFAULT NULL,
  `provider_rate` decimal(30,15) DEFAULT '0.000000000000000',
  `provider_billsec` int(11) DEFAULT NULL,
  `provider_price` decimal(30,15) DEFAULT '0.000000000000000',
  `user_id` int(11) DEFAULT NULL,
  `user_rate` decimal(30,15) DEFAULT '0.000000000000000',
  `user_billsec` int(11) DEFAULT NULL,
  `user_price` decimal(30,15) DEFAULT '0.000000000000000',
  `reseller_id` int(11) DEFAULT NULL,
  `reseller_rate` decimal(30,15) DEFAULT '0.000000000000000',
  `reseller_billsec` int(11) DEFAULT NULL,
  `reseller_price` decimal(30,15) DEFAULT '0.000000000000000',
  `partner_id` int(11) DEFAULT NULL,
  `partner_rate` decimal(30,15) DEFAULT '0.000000000000000',
  `partner_billsec` int(11) DEFAULT NULL,
  `partner_price` decimal(30,15) DEFAULT '0.000000000000000',
  `prefix` varchar(50) DEFAULT NULL,
  `server_id` int(11) DEFAULT '1',
  `hangupcause` int(11) DEFAULT NULL,
  `callertype` enum('Local','Outside') DEFAULT NULL,
  `peerip` varchar(255) DEFAULT NULL,
  `recvip` varchar(255) DEFAULT NULL,
  `sipfrom` varchar(255) DEFAULT NULL,
  `uri` varchar(255) DEFAULT NULL,
  `useragent` varchar(255) DEFAULT NULL,
  `peername` varchar(255) DEFAULT NULL,
  `t38passthrough` tinyint(4) DEFAULT NULL,
  `did_inc_price` decimal(30,15) DEFAULT '0.000000000000000',
  `did_prov_price` decimal(30,15) DEFAULT '0.000000000000000',
  `localized_dst` varchar(50) DEFAULT NULL,
  `did_provider_id` int(11) DEFAULT '0',
  `did_id` int(11) DEFAULT NULL,
  `originator_ip` varchar(20) DEFAULT '',
  `terminator_ip` varchar(20) DEFAULT '',
  `real_duration` decimal(30,15) DEFAULT '0.000000000000000',
  `real_billsec` decimal(30,15) DEFAULT '0.000000000000000',
  `did_billsec` int(11) DEFAULT '0' COMMENT 'billsec for incoming call',
  `dst_user_id` int(11) DEFAULT NULL COMMENT 'users id which receives call',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `id_2` (`id`),
  UNIQUE KEY `id_3` (`id`),
  KEY `src_device_id` (`src_device_id`),
  KEY `dst_device_id` (`dst_device_id`),
  KEY `src` (`src`,`disposition`),
  KEY `provider_id` (`provider_id`) USING BTREE,
  KEY `card_id` (`card_id`) USING BTREE,
  KEY `disposition` (`disposition`) USING BTREE,
  KEY `user_id_index` (`user_id`),
  KEY `hgcause` (`hangupcause`),
  KEY `resellerid` (`reseller_id`),
  KEY `dst_user_id_index` (`dst_user_id`),
  KEY `did_id` (`did_id`),
  KEY `uniqueidindex` (`uniqueid`(6)),
  KEY `calldateindex` (`calldate`),
  KEY `dateindex` (`date`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calls`
--

LOCK TABLES `calls` WRITE;
/*!40000 ALTER TABLE `calls` DISABLE KEYS */;
INSERT INTO `calls` VALUES (1,'2014-05-28 11:49:08','2014-05-28','\"1002\" <1002>','1002','37063042438','',1,0,'FAILED','0','1401277748.0',0,0,0,0.000000000000000,0,0,0.000000000000000,0,0.000000000000000,0,0.000000000000000,0,0.000000000000000,0,0.000000000000000,0,0.000000000000000,NULL,0.000000000000000,NULL,0.000000000000000,'',1,200,'Local',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.000000000000000,0.000000000000000,'37063042438',0,0,'','',0.012029000000000,0.000000000000000,0,0);
/*!40000 ALTER TABLE `calls` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`mor`@`localhost`*/ /*!50003 TRIGGER `insert_date` BEFORE INSERT ON `calls` FOR EACH ROW SET NEW.date = LEFT(NEW.calldate, 10) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `calls_old`
--

DROP TABLE IF EXISTS `calls_old`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `calls_old` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `calldate` timestamp NULL DEFAULT NULL,
  `date` date DEFAULT NULL,
  `clid` varchar(80) NOT NULL,
  `src` varchar(80) NOT NULL,
  `dst` varchar(80) NOT NULL,
  `channel` varchar(80) NOT NULL,
  `duration` int(11) NOT NULL DEFAULT '0',
  `billsec` int(11) NOT NULL DEFAULT '0',
  `disposition` enum('FAILED','NO ANSWER','BUSY','ANSWERED') DEFAULT NULL,
  `accountcode` varchar(20) NOT NULL,
  `uniqueid` varchar(32) NOT NULL,
  `src_device_id` int(11) NOT NULL DEFAULT '0',
  `dst_device_id` int(11) NOT NULL DEFAULT '0',
  `processed` tinyint(4) NOT NULL DEFAULT '0',
  `did_price` decimal(30,15) DEFAULT '0.000000000000000',
  `card_id` int(11) DEFAULT NULL,
  `provider_id` int(11) DEFAULT NULL,
  `provider_rate` decimal(30,15) DEFAULT '0.000000000000000',
  `provider_billsec` int(11) DEFAULT NULL,
  `provider_price` decimal(30,15) DEFAULT '0.000000000000000',
  `user_id` int(11) DEFAULT NULL,
  `user_rate` decimal(30,15) DEFAULT '0.000000000000000',
  `user_billsec` int(11) DEFAULT NULL,
  `user_price` decimal(30,15) DEFAULT '0.000000000000000',
  `reseller_id` int(11) DEFAULT NULL,
  `reseller_rate` decimal(30,15) DEFAULT '0.000000000000000',
  `reseller_billsec` int(11) DEFAULT NULL,
  `reseller_price` decimal(30,15) DEFAULT '0.000000000000000',
  `partner_id` int(11) DEFAULT NULL,
  `partner_rate` decimal(30,15) DEFAULT '0.000000000000000',
  `partner_billsec` int(11) DEFAULT NULL,
  `partner_price` decimal(30,15) DEFAULT '0.000000000000000',
  `prefix` varchar(50) DEFAULT NULL,
  `server_id` int(11) DEFAULT '1',
  `hangupcause` int(11) DEFAULT NULL,
  `callertype` enum('Local','Outside') DEFAULT NULL,
  `useragent` varchar(255) DEFAULT NULL,
  `did_inc_price` decimal(30,15) DEFAULT '0.000000000000000',
  `did_prov_price` decimal(30,15) DEFAULT '0.000000000000000',
  `localized_dst` varchar(50) DEFAULT NULL,
  `did_provider_id` int(11) DEFAULT '0',
  `did_id` int(11) DEFAULT NULL,
  `originator_ip` varchar(20) DEFAULT '',
  `terminator_ip` varchar(20) DEFAULT '',
  `real_duration` decimal(30,15) DEFAULT '0.000000000000000',
  `real_billsec` decimal(30,15) DEFAULT '0.000000000000000',
  `did_billsec` int(11) DEFAULT '0' COMMENT 'billsec for incoming call',
  `dst_user_id` int(11) DEFAULT NULL COMMENT 'users id which receives call',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `src_device_id` (`src_device_id`),
  KEY `dst_device_id` (`dst_device_id`),
  KEY `src` (`src`,`disposition`),
  KEY `provider_id` (`provider_id`) USING BTREE,
  KEY `card_id` (`card_id`) USING BTREE,
  KEY `disposition` (`disposition`) USING BTREE,
  KEY `user_id_index` (`user_id`),
  KEY `hgcause` (`hangupcause`),
  KEY `resellerid` (`reseller_id`),
  KEY `dst_user_id_index` (`dst_user_id`),
  KEY `did_id` (`did_id`),
  KEY `uniqueidindex` (`uniqueid`(6)),
  KEY `calldateindex` (`calldate`),
  KEY `dateindex` (`date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calls_old`
--

LOCK TABLES `calls_old` WRITE;
/*!40000 ALTER TABLE `calls_old` DISABLE KEYS */;
/*!40000 ALTER TABLE `calls_old` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `campaigns`
--

DROP TABLE IF EXISTS `campaigns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `campaigns` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `campaign_type` varchar(255) DEFAULT 'basic',
  `status` varchar(255) DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `stop_time` time DEFAULT NULL,
  `max_retries` int(11) DEFAULT '0',
  `retry_time` int(11) DEFAULT '120',
  `wait_time` int(11) DEFAULT '30',
  `user_id` int(11) DEFAULT NULL,
  `device_id` int(11) DEFAULT NULL,
  `callerid` varchar(100) DEFAULT '',
  `owner_id` int(11) DEFAULT '0' COMMENT 'Owner id of compaings',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `campaigns`
--

LOCK TABLES `campaigns` WRITE;
/*!40000 ALTER TABLE `campaigns` DISABLE KEYS */;
/*!40000 ALTER TABLE `campaigns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cardgroups`
--

DROP TABLE IF EXISTS `cardgroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cardgroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `price` decimal(30,15) DEFAULT '0.000000000000000',
  `setup_fee` decimal(30,15) DEFAULT '0.000000000000000',
  `ghost_min_perc` decimal(30,15) DEFAULT '100.000000000000000',
  `daily_charge` decimal(30,15) DEFAULT '0.000000000000000',
  `tariff_id` int(11) NOT NULL DEFAULT '0',
  `lcr_id` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `valid_from` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `valid_till` datetime NOT NULL DEFAULT '2010-01-01 00:00:00',
  `vat_percent` decimal(30,15) DEFAULT '0.000000000000000',
  `number_length` int(11) NOT NULL DEFAULT '10',
  `pin_length` int(11) NOT NULL DEFAULT '6',
  `dialplan_id` int(11) NOT NULL DEFAULT '0',
  `image` varchar(255) DEFAULT 'example.jpg',
  `location_id` int(11) DEFAULT '1',
  `owner_id` int(11) DEFAULT '0',
  `tax_id` int(11) NOT NULL DEFAULT '0',
  `valid_after_first_use` int(11) DEFAULT '0' COMMENT 'how many days active after first use. 0 means not used - active forever.',
  `ghost_balance_perc` decimal(30,15) DEFAULT '100.000000000000000',
  `use_external_function` int(11) DEFAULT '0',
  `allow_loss_calls` tinyint(4) DEFAULT '0',
  `tell_cents` tinyint(1) DEFAULT '0' COMMENT 'should allow cardgroups tell censt?',
  `tell_balance_in_currency` varchar(5) DEFAULT '' COMMENT 'cardgroups tell balance in currency?',
  `solo_pinless` tinyint(1) DEFAULT '0',
  `disable_voucher` tinyint(1) DEFAULT '0',
  `hidden` tinyint(4) NOT NULL DEFAULT '0',
  `callerid_leave` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cardgroups`
--

LOCK TABLES `cardgroups` WRITE;
/*!40000 ALTER TABLE `cardgroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `cardgroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cards`
--

DROP TABLE IF EXISTS `cards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cards` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `balance` decimal(30,15) DEFAULT '0.000000000000000',
  `cardgroup_id` int(11) NOT NULL DEFAULT '0',
  `sold` tinyint(4) NOT NULL DEFAULT '0',
  `number` varchar(255) DEFAULT NULL,
  `pin` varchar(255) DEFAULT NULL,
  `first_use` datetime DEFAULT NULL,
  `daily_charge_paid_till` datetime DEFAULT NULL,
  `frozen_balance` decimal(30,15) DEFAULT '0.000000000000000',
  `owner_id` int(11) DEFAULT '0',
  `callerid` varchar(30) DEFAULT NULL,
  `language` varchar(10) DEFAULT 'en' COMMENT 'Language of card',
  `name` varchar(255) DEFAULT '' COMMENT 'Name of card',
  `user_id` int(11) DEFAULT '-1' COMMENT 'User ID',
  `hidden` tinyint(4) NOT NULL DEFAULT '0',
  `call_count` int(11) DEFAULT '0',
  `min_balance` decimal(30,15) DEFAULT '0.000000000000000',
  `active` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `batch_number` varchar(255) DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `cards_number_index` (`number`),
  KEY `cards_pin_index` (`pin`),
  KEY `number_unique` (`number`),
  KEY `batchnumberindex` (`batch_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cards`
--

LOCK TABLES `cards` WRITE;
/*!40000 ALTER TABLE `cards` DISABLE KEYS */;
/*!40000 ALTER TABLE `cards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cc_gmps`
--

DROP TABLE IF EXISTS `cc_gmps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cc_gmps` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cardgroup_id` int(11) NOT NULL,
  `prefix` varchar(255) NOT NULL,
  `percent` decimal(30,15) DEFAULT '100.000000000000000',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cc_gmps`
--

LOCK TABLES `cc_gmps` WRITE;
/*!40000 ALTER TABLE `cc_gmps` DISABLE KEYS */;
/*!40000 ALTER TABLE `cc_gmps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cc_invoices`
--

DROP TABLE IF EXISTS `cc_invoices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cc_invoices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `payment_id` int(11) DEFAULT NULL COMMENT 'Foreign key to payments table',
  `ccorder_id` int(11) NOT NULL COMMENT 'Foreign key to ccorders table',
  `owner_id` int(11) NOT NULL DEFAULT '0' COMMENT 'Foreign key to users table describes payment owner',
  `number` varchar(255) NOT NULL COMMENT 'Payment number',
  `email` varchar(50) NOT NULL DEFAULT '' COMMENT 'Client email address',
  `sent_email` tinyint(4) NOT NULL DEFAULT '0',
  `sent_manually` tinyint(4) NOT NULL DEFAULT '0',
  `paid` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `paid_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `owner_id_index` (`owner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cc_invoices`
--

LOCK TABLES `cc_invoices` WRITE;
/*!40000 ALTER TABLE `cc_invoices` DISABLE KEYS */;
/*!40000 ALTER TABLE `cc_invoices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cclineitems`
--

DROP TABLE IF EXISTS `cclineitems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cclineitems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cardgroup_id` int(11) DEFAULT NULL,
  `quantity` int(11) NOT NULL DEFAULT '0',
  `ccorder_id` int(11) DEFAULT NULL,
  `card_id` int(11) DEFAULT NULL,
  `price` decimal(30,15) DEFAULT '0.000000000000000',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cclineitems`
--

LOCK TABLES `cclineitems` WRITE;
/*!40000 ALTER TABLE `cclineitems` DISABLE KEYS */;
/*!40000 ALTER TABLE `cclineitems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ccorders`
--

DROP TABLE IF EXISTS `ccorders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ccorders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `amount` decimal(30,15) DEFAULT '0.000000000000000',
  `currency` varchar(5) NOT NULL DEFAULT 'USD',
  `ordertype` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `completed` tinyint(4) NOT NULL DEFAULT '0',
  `transaction_id` varchar(255) DEFAULT NULL,
  `shipped_at` datetime DEFAULT NULL,
  `fee` decimal(30,15) DEFAULT '0.000000000000000',
  `gross` decimal(30,15) DEFAULT '0.000000000000000',
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `payer_email` varchar(255) DEFAULT NULL,
  `residence_country` varchar(255) DEFAULT NULL,
  `payer_status` varchar(255) DEFAULT NULL,
  `tax` decimal(30,15) DEFAULT '0.000000000000000',
  `tax_percent` decimal(30,15) DEFAULT '0.000000000000000',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ccorders`
--

LOCK TABLES `ccorders` WRITE;
/*!40000 ALTER TABLE `ccorders` DISABLE KEYS */;
/*!40000 ALTER TABLE `ccorders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cdr`
--

DROP TABLE IF EXISTS `cdr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cdr` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `calldate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `clid` varchar(80) NOT NULL,
  `src` varchar(80) NOT NULL,
  `dst` varchar(80) NOT NULL,
  `dcontext` varchar(80) NOT NULL,
  `channel` varchar(80) NOT NULL,
  `dstchannel` varchar(80) NOT NULL,
  `lastapp` varchar(80) NOT NULL,
  `lastdata` varchar(80) NOT NULL,
  `duration` int(11) NOT NULL DEFAULT '0',
  `billsec` int(11) NOT NULL DEFAULT '0',
  `disposition` varchar(45) NOT NULL,
  `amaflags` int(11) NOT NULL DEFAULT '0',
  `accountcode` varchar(20) NOT NULL,
  `uniqueid` varchar(32) NOT NULL,
  `userfield` varchar(255) NOT NULL,
  `mor_processed` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `calldate` (`calldate`),
  KEY `dst` (`dst`),
  KEY `accountcode` (`accountcode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cdr`
--

LOCK TABLES `cdr` WRITE;
/*!40000 ALTER TABLE `cdr` DISABLE KEYS */;
/*!40000 ALTER TABLE `cdr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `codecs`
--

DROP TABLE IF EXISTS `codecs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `codecs` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `long_name` varchar(255) NOT NULL,
  `codec_type` varchar(255) NOT NULL DEFAULT 'audio',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `name_2` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `codecs`
--

LOCK TABLES `codecs` WRITE;
/*!40000 ALTER TABLE `codecs` DISABLE KEYS */;
INSERT INTO `codecs` VALUES (1,'alaw','G.711 A-law','audio'),(2,'ulaw','G.711 u-law','audio'),(3,'g723','G.723.1','audio'),(4,'g726','G.726','audio'),(5,'g729','G.729','audio'),(6,'gsm','GSM','audio'),(7,'ilbc','iLBC','audio'),(8,'lpc10','LPC10','audio'),(9,'speex','Speex','audio'),(10,'adpcm','ADPCM','audio'),(11,'slin','16 bit Signed Linear PCM','audio'),(12,'h261','H.261 Video','video'),(13,'h263','H.263 Video','video'),(14,'h263p','H.263+ Video','video'),(15,'jpeg','JPEG image','image'),(16,'png','PNG image','image'),(17,'h264','H.264 Video','video'),(18,'g722','G.722','audio');
/*!40000 ALTER TABLE `codecs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `common_use_providers`
--

DROP TABLE IF EXISTS `common_use_providers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `common_use_providers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `provider_id` int(11) NOT NULL,
  `reseller_id` int(11) NOT NULL,
  `tariff_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `common_use_providers`
--

LOCK TABLES `common_use_providers` WRITE;
/*!40000 ALTER TABLE `common_use_providers` DISABLE KEYS */;
/*!40000 ALTER TABLE `common_use_providers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conflines`
--

DROP TABLE IF EXISTS `conflines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `conflines` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `owner_id` int(11) DEFAULT '0',
  `value2` text,
  PRIMARY KEY (`id`),
  KEY `name` (`name`(10),`owner_id`),
  KEY `name_2` (`name`(10),`owner_id`),
  KEY `name_3` (`name`(10),`owner_id`),
  KEY `name_4` (`name`(10),`owner_id`)
) ENGINE=InnoDB AUTO_INCREMENT=536 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conflines`
--

LOCK TABLES `conflines` WRITE;
/*!40000 ALTER TABLE `conflines` DISABLE KEYS */;
INSERT INTO `conflines` VALUES (1,'CSV_Separator',',',0,NULL),(2,'WEB_Callback_CID','',0,NULL),(3,'AMI_Host','127.0.0.1',0,NULL),(4,'AMI_Username','mor',0,NULL),(5,'AMI_Secret','morsecret',0,NULL),(6,'Reg_allow_user_enter_vat','0',0,NULL),(7,'Company','Kolmisoft',0,NULL),(8,'Logo_Picture','logo/mor_logo.png',0,NULL),(9,'Company_Email','your@email.com',0,NULL),(10,'Days_for_did_close','90',0,NULL),(11,'Version','MOR X5',0,NULL),(12,'Copyright_Title',' by <a href=\"http://www.kolmisoft.com\" target=\"_blank\">Kolmisoft </a> 2006 - <span id=\"current_year\"></span><script type=\"text/javascript\"> document.getElementById(\"current_year\").innerHTML = new Date().getFullYear(); </script>',0,NULL),(13,'Invoice_Address1','Street Address',0,NULL),(14,'Invoice_Address2','City, Country',0,NULL),(15,'Invoice_Address3','Phone, fax',0,NULL),(16,'Invoice_Address4','Web, email',0,NULL),(17,'Invoice_Number_Start','INV',0,NULL),(18,'Invoice_Number_Length','9',0,NULL),(19,'Invoice_Number_Type','2',0,NULL),(20,'Invoice_Period_Start_Day','01',0,NULL),(21,'Invoice_Show_Calls_In_Detailed','1',0,NULL),(22,'Invoice_Bank_Details_Line1','Please make payments to:',0,NULL),(23,'Invoice_Bank_Details_Line2','Company name',0,NULL),(24,'Invoice_Bank_Details_Line3','Bank name',0,NULL),(25,'Invoice_Bank_Details_Line4','Bank account number',0,NULL),(26,'Invoice_Bank_Details_Line5','Add. info',0,NULL),(27,'Invoice_End_Title','Thank you for your business!',0,NULL),(28,'Invoice_Address_Format','2',0,NULL),(29,'C2C_Active',NULL,0,NULL),(30,'CB_Active','1',0,NULL),(31,'CB_Temp_Dir','/tmp',0,NULL),(32,'CB_Spool_Dir','/var/spool/asterisk/outgoing',0,NULL),(33,'CB_MaxRetries','0',0,NULL),(34,'CB_RetryTime','10',0,NULL),(35,'CB_WaitTime','20',0,NULL),(36,'Registration_enabled',NULL,0,NULL),(37,'Tariff_for_registered_users',NULL,0,NULL),(38,'LCR_for_registered_users',NULL,0,NULL),(39,'Default_VAT_Percent','18',0,NULL),(40,'Default_Country_ID','123',0,NULL),(41,'Asterisk_Server_IP','127.0.0.1',0,NULL),(42,'Default_CID_Name',NULL,0,NULL),(43,'Default_CID_Number',NULL,0,NULL),(44,'Paypal_Enabled','0',0,NULL),(45,'PayPal_Email','',0,NULL),(46,'PayPal_Default_Amount','10',0,NULL),(47,'PayPal_Min_Amount','5',0,NULL),(48,'PayPal_Test',NULL,0,NULL),(49,'Change_dahdi',NULL,0,NULL),(50,'Change_dahdi_to','PSTN',0,NULL),(51,'Vouchers_Enabled','0',0,NULL),(52,'Voucher_Number_Length','15',0,NULL),(53,'Voucher_Disable_Time','60',0,NULL),(54,'Voucher_Attempts_to_Enter','3',0,NULL),(55,'Send_Email_To_User_After_Registration','1',0,NULL),(56,'Send_Email_To_Admin_After_Registration','1',0,NULL),(57,'Active_Calls_Refresh_Interval','5',0,NULL),(58,'Email_Fax_From_Sender','fax@some.domain.com',0,NULL),(59,'Items_Per_Page','50',0,NULL),(60,'Nice_Number_Digits','4',0,NULL),(61,'User_Wholesale_Enabled','1',0,NULL),(62,'Email_Sending_Enabled',NULL,0,NULL),(63,'Fax_Device_Enabled',NULL,0,NULL),(64,'Agreement_Number_Length','10',0,NULL),(65,'Paypal_Default_Currency','USD',0,NULL),(66,'Device_PIN_Length','6',0,NULL),(67,'Admin_Browser_Title','MOR X5',0,NULL),(68,'Email_Batch_Size','50',0,NULL),(69,'Email_Smtp_Server','localhost',0,NULL),(70,'Email_Domain','localhost.localdomain',0,NULL),(71,'Email_Login','',0,NULL),(72,'Email_Password','',0,NULL),(74,'Greetings_Folder','/home/mor/public/c2c_greetings',0,NULL),(75,'Temp_Dir','/tmp/',0,NULL),(76,'Greetings_Folder','/home/mor/public/c2c_greetings',0,NULL),(77,'Device_Range_MIN','1001',0,NULL),(78,'Device_Range_MAX','9999',0,NULL),(79,'WebMoney_Enabled','0',0,NULL),(80,'WebMoney_Default_Currency','USD',0,NULL),(81,'WebMoney_Min_Amount','5',0,NULL),(82,'WebMoney_Default_Amount','10',0,NULL),(83,'WebMoney_Test','1',0,NULL),(84,'WebMoney_Purse','',0,NULL),(85,'WebMoney_SIM_MODE','0',0,NULL),(86,'VM_Server_Active','0',0,NULL),(87,'VM_Server_Device_ID','',0,NULL),(88,'VM_Server_Retrieve_Extension','*97',0,NULL),(89,'VM_Retrieve_Extension','*97',0,NULL),(90,'Cyberplat_Enabled','0',0,NULL),(91,'Cyberplat_Default_Currency','EUR',0,NULL),(92,'Cyberplat_Min_Amount','3',0,NULL),(93,'Cyberplat_Default_Amount','10',0,NULL),(94,'Cyberplat_ShopIP','',0,NULL),(95,'Cyberplat_Temporary_Directory','/tmp',0,NULL),(96,'Cyberplat_Test',NULL,0,NULL),(97,'Cyberplat_Transacton_Fee','5',0,NULL),(98,'Cyberplat_Crap',NULL,0,''),(99,'Google_Fullscreen',NULL,0,NULL),(100,'Google_ReloadTime',NULL,0,NULL),(101,'Google_Width',NULL,0,NULL),(102,'Google_Height',NULL,0,NULL),(103,'Default_device_dtmfmode','rfc2833',0,NULL),(104,'Default_device_works_not_logged',NULL,0,NULL),(105,'Default_device_location_id','1',0,NULL),(106,'Default_device_ani','0',0,NULL),(107,'Default_device_istrunk','0',0,NULL),(108,'Default_device_record','0',0,NULL),(109,'Default_device_call_limit','0',0,NULL),(110,'Default_device_cid_name','',0,NULL),(111,'Default_device_cid_number','',0,NULL),(112,'Default_device_host',NULL,0,NULL),(113,'Default_device_port','',0,NULL),(114,'Default_device_canreinvite','no',0,NULL),(115,'Default_device_nat','yes',0,NULL),(116,'Default_device_qualify','1000',0,NULL),(117,'Default_device_qualify_time','1000',0,NULL),(118,'Default_device_callgroup','',0,NULL),(119,'Default_device_pickupgroup','',0,NULL),(120,'Default_device_voicemail_active',NULL,0,NULL),(121,'Default_device_voicemail_box','1',0,NULL),(122,'Default_device_voicemail_box_email',NULL,0,NULL),(123,'Default_device_voicemail_box_password',NULL,0,NULL),(124,'Default_device_fromuser',NULL,0,NULL),(125,'Default_device_fromdomain',NULL,0,NULL),(126,'Default_device_trustrpid','no',0,NULL),(127,'Default_device_sendrpid','no',0,NULL),(128,'Default_device_t38pt_udptl','no',0,NULL),(129,'Default_device_promiscredir','no',0,NULL),(130,'Default_device_progressinband','no',0,NULL),(131,'Default_device_videosupport','no',0,NULL),(132,'Default_device_allow_duplicate_calls','0',0,NULL),(133,'Default_device_tell_balance','0',0,NULL),(134,'Default_device_tell_time','0',0,NULL),(135,'Default_device_tell_rtime_when_left','60',0,NULL),(136,'Default_device_repeat_rtime_every','60',0,NULL),(137,'Default_device_permits','0.0.0.0/0.0.0.0',0,NULL),(138,'Default_device_type','SIP',0,NULL),(139,'Default_device_timeout','60',0,NULL),(140,'Default_device_ipaddr',NULL,0,NULL),(141,'Default_device_regseconds','no',0,NULL),(142,'Default_device_insecure',NULL,0,NULL),(143,'Default_device_process_sipchaninfo','0',0,NULL),(144,'Default_device_codec_alaw','1',0,'0'),(145,'Default_device_codec_ulaw','0',0,'2'),(146,'Default_device_codec_g723','0',0,'3'),(147,'Default_device_codec_g726','0',0,'4'),(148,'Default_device_codec_g729','1',0,'1'),(149,'Default_device_codec_gsm','0',0,'5'),(150,'Default_device_codec_ilbc','0',0,'6'),(151,'Default_device_codec_lpc10','0',0,'7'),(152,'Default_device_codec_speex','0',0,'8'),(153,'Default_device_codec_adpcm','0',0,'9'),(154,'Default_device_codec_slin','0',0,'10'),(155,'Default_device_codec_h261','0',0,NULL),(156,'Default_device_codec_h263','0',0,NULL),(157,'Default_device_codec_h263p','0',0,NULL),(158,'Default_device_codec_h264','0',0,NULL),(159,'Default_device_codec_jpeg','0',0,NULL),(160,'Default_device_codec_png','0',0,NULL),(161,'Active_Calls_Maximum_Calls','100',0,NULL),(162,'CSV_Decimal','.',0,NULL),(163,'Fax2Email_Folder',NULL,0,NULL),(164,'IVR_Voice_Dir','/home/mor/public/ivr_voices/',0,NULL),(165,'Backup_Folder','/usr/local/mor/backups',0,NULL),(166,'Backup_number','7',0,NULL),(167,'Backup_disk_space','25',0,NULL),(168,'Backup_shedule','1',0,NULL),(169,'Backup_month','Every_month',0,NULL),(170,'Backup_month_day','Every_day',0,NULL),(171,'Backup_week_day','Every_day',0,NULL),(172,'Backup_hour','24',0,NULL),(173,'Email_Pop3_server',NULL,0,NULL),(174,'Email_port','25',0,NULL),(175,'Invoice_Balance_Line','Outstanding balance(Debt)',0,NULL),(176,'Exception_Support_Email','support@kolmisoft.com',0,NULL),(177,'Exception_Send_Email','1',0,NULL),(178,'Show_Full_Src','1',0,NULL),(179,'CCShop_show_values_without_VAT_for_user','1',0,NULL),(180,'Backup_minute','1',0,NULL),(181,'Server_to_use_for_call_center','1',0,NULL),(182,'Crash_log_file','/tmp/mor_crash.log',0,NULL),(183,'Webmoney_skip_prerequest',NULL,0,NULL),(184,'Show_logo_on_register_page','1',0,NULL),(185,'Tax_1','VAT',1,'1'),(186,'Tax_2','',0,'0'),(187,'Tax_3','',0,'0'),(188,'Tax_4','',0,'0'),(189,'Total_tax_name','Tax',0,NULL),(190,'Banned_CLIs_default_IVR_id','0',0,NULL),(191,'Tax_1_Value','0.0',0,NULL),(192,'Tax_2_Value','0.0',0,NULL),(193,'Tax_3_Value','0.0',0,NULL),(194,'Tax_4_Value','0.0',0,NULL),(195,'Total_Tax_Value','',0,NULL),(196,'Email_Callback_Pop3_Server',NULL,0,NULL),(197,'Email_Callback_Login',NULL,0,NULL),(198,'Email_Callback_Password',NULL,0,NULL),(199,'Web_Callback_Server','1',0,NULL),(200,'Frontpage_Text',NULL,0,'<br><br><br>\r\n<big><b>Thank you for using MOR!<br><br>\r\nGuide how to make first call is <a href=\"http://wiki.kolmisoft.com/index.php/How_to_make_first_call\" target=\"_blank\">here</a>.\r\n<br><br>\r\nManual to all MOR functionality can be found <a href=\"http://wiki.kolmisoft.com/index.php/MOR_Manual\" target=\"_blank\">here</a>.\r\n<br><br>\r\nIf you have any questions or need help, please use our <a href=\"http://forum.kolmisoft.com\" target=\"_blank\">Forum</a>\r\n<br><br>\r\nor contact us <a href=\"http://www.kolmisoft.com/contacts\" target=\"_blank\">directly</a>.\r\n<br><br><br>\r\n</b></big>\r\n<b>Regards,<br>\r\n<a href=\"http://www.kolmisoft.com\" target=\"_blank\">Kolmisoft Team</a></b>'),(201,'Default_Balance_for_new_user','0.0',0,NULL),(202,'reCAPTCHA_enabled','0',0,NULL),(203,'ReCAPTCHA_public_key','',0,NULL),(204,'ReCAPTCHA_private_key','',0,NULL),(205,'Invoice_Show_Balance_Line',NULL,0,NULL),(206,'Invoice_default','0',0,NULL),(207,'Round_finals_to_2_decimals','0',0,NULL),(208,'Prepaid_Invoice_Number_Start','',0,NULL),(209,'Prepaid_Invoice_Number_Length','5',0,NULL),(210,'Prepaid_Invoice_Number_Type',NULL,0,NULL),(211,'Prepaid_Invoice_Period_Start_Day','01',0,NULL),(212,'Prepaid_Invoice_Show_Calls_In_Detailed',NULL,0,NULL),(213,'Prepaid_Invoice_Address_Format','1',0,NULL),(214,'Prepaid_Invoice_Address1','',0,NULL),(215,'Prepaid_Invoice_Address2','',0,NULL),(216,'Prepaid_Invoice_Address3','',0,NULL),(217,'Prepaid_Invoice_Address4','',0,NULL),(218,'Prepaid_Invoice_Bank_Details_Line1','',0,NULL),(219,'Prepaid_Invoice_Bank_Details_Line2','',0,NULL),(220,'Prepaid_Invoice_Bank_Details_Line3','',0,NULL),(221,'Prepaid_Invoice_Bank_Details_Line4','',0,NULL),(222,'Prepaid_Invoice_Bank_Details_Line5','',0,NULL),(223,'Prepaid_Invoice_Balance_Line','',0,NULL),(224,'Prepaid_Invoice_End_Title','',0,NULL),(225,'Prepaid_Invoice_Show_Balance_Line',NULL,0,NULL),(226,'Prepaid_Invoice_default','0',0,NULL),(227,'Prepaid_Round_finals_to_2_decimals','0',0,NULL),(228,'Email_from','your@email.com',0,NULL),(229,'Realtime_reload_time','15',0,NULL),(230,'Usual_text_font_color',NULL,0,NULL),(231,'Usual_text_font_size',NULL,0,NULL),(232,'Usual_text_font_style','0',0,NULL),(233,'Usual_text_highlighted_text_color',NULL,0,NULL),(234,'Usual_text_highlighted_text_style','0',0,NULL),(235,'Usual_text_highlighted_text_size',NULL,0,NULL),(236,'Header_footer_font_color',NULL,0,NULL),(237,'Header_footer_font_size',NULL,0,NULL),(238,'Header_footer_font_style','0',0,NULL),(239,'Background_color',NULL,0,NULL),(240,'Row1_color',NULL,0,NULL),(241,'Row2_color',NULL,0,NULL),(242,'3_first_rows_color',NULL,0,NULL),(243,'Tax_1','Tax',0,'1'),(244,'Devices_Check_Ballance',NULL,0,NULL),(245,'Show_Rates_Without_Tax',NULL,0,NULL),(246,'XML_API_Extension','0',0,NULL),(247,'Google_Key',NULL,0,NULL),(248,'Show_rates_for_users','1',0,NULL),(249,'Hide_payment_options_for_postpaid_users','1',0,NULL),(250,'Hide_quick_stats','0',0,NULL),(251,'Hide_HELP_banner','0',0,NULL),(252,'Allow_API','0',0,NULL),(253,'Allow_GET_API','0',0,NULL),(254,'API_Secret_Key','',0,NULL),(255,'Play_IVR_for_200_HGC','0',0,NULL),(256,'IVR_for_200_HGC','0',0,NULL),(257,'Default_User_warning_email_active','0',0,NULL),(258,'Default_User_recording_enabled',NULL,0,NULL),(259,'Default_User_postpaid','0',0,NULL),(260,'Default_User_recording_forced_enabled',NULL,0,NULL),(261,'Default_User_language','',0,NULL),(262,'Default_User_lcr_id','1',0,NULL),(263,'Default_User_vat_number','',0,NULL),(264,'Default_User_credit','-1',0,NULL),(265,'Default_User_allow_loss_calls','0',0,NULL),(266,'Default_User_username','',0,NULL),(267,'Default_User_warning_email_balance','0.0',0,NULL),(268,'Default_User_tariff_id','2',0,NULL),(269,'Default_User_invoice_zero_calls','0',0,NULL),(270,'Default_User_block_at','2014-1-1',0,NULL),(271,'Default_User_blocked','0',0,NULL),(272,'Default_User_taxation_country','105',0,NULL),(273,'Default_User_usertype','user',0,NULL),(274,'Default_User_block_conditional_use','0',0,NULL),(275,'Default_User_cyberplat_active','0',0,NULL),(276,'Default_User_acc_group_id',NULL,0,NULL),(277,'Default_User_generate_invoice','1',0,NULL),(278,'Default_User_recording_hdd_quota','0',0,NULL),(279,'Default_User_agreement_number','',0,NULL),(280,'Default_User_accounting_number','',0,NULL),(281,'Default_User_call_limit','0',0,NULL),(282,'Default_User_first_name','',0,NULL),(283,'Default_User_send_invoice_types','18',0,NULL),(284,'Default_User_last_name','',0,NULL),(285,'Default_User_clientid','',0,NULL),(286,'Default_User_hidden','0',0,NULL),(287,'Default_User_balance','0.0',0,NULL),(288,'Default_Address_city','',0,NULL),(289,'Default_Address_postcode','',0,NULL),(290,'Default_Address_county','',0,NULL),(291,'Default_Address_direction_id','105',0,NULL),(292,'Default_Address_fax','',0,NULL),(293,'Default_Address_phone','',0,NULL),(294,'Default_Address_mob_phone','',0,NULL),(295,'Default_Address_address','',0,NULL),(296,'Default_Address_state','',0,NULL),(297,'Default_Address_email','',0,NULL),(298,'Default_Tax_tax1_value','0.0',0,NULL),(299,'Default_Tax_total_tax_name','Tax',0,NULL),(300,'Default_Tax_tax4_enabled','0',0,NULL),(301,'Default_Tax_tax2_value','0.0',0,NULL),(302,'Default_Tax_tax1_name','Tax',0,NULL),(303,'Default_Tax_tax3_value','0.0',0,NULL),(304,'Default_Tax_tax2_name','',0,NULL),(305,'Default_Tax_tax4_value','0.0',0,NULL),(306,'Default_Tax_tax1_enabled','1',0,NULL),(307,'Default_Tax_tax3_name','',0,NULL),(308,'Default_Tax_tax2_enabled','0',0,NULL),(309,'Default_Tax_tax4_name','',0,NULL),(310,'Default_Tax_tax3_enabled','0',0,NULL),(311,'Default_User_password_length','8',0,NULL),(312,'AD_Sounds_Folder',NULL,0,NULL),(313,'Invoice_page_limit','20',0,NULL),(314,'Prepaid_Invoice_page_limit','20',0,NULL),(315,'Disalow_Duplicate_Device_Usernames','1',0,NULL),(318,'alerts_need_update','0',0,NULL),(321,'Web_Callback_Send_Source_As_CID','1',0,NULL),(322,'mor_mapped_db_version','150',0,NULL),(324,'Show_balance_line_setting','0',0,NULL),(325,'hourly_actions_cooldown_time','2014-07-29 17:00:10',0,NULL),(326,'System_time_zone_ofset','2',0,NULL),(327,'Default_SIP_device_port','5060',0,NULL),(328,'Default_IAX2_device_port','4569',0,NULL),(329,'Default_H323_device_port','1720',0,NULL),(330,'Resellers_server_id','1',0,NULL),(331,'Default_device_trunk','no',0,NULL),(332,'Proxy_port_first_load','1',0,NULL),(333,'Callback_legA_CID','device',0,NULL),(334,'Callback_legB_CID','device',0,NULL),(335,'load_ok','1',0,NULL),(336,'Show_Usernames_On_Pdf_Csv_Export_Files_In_Last_Calls','0',0,NULL),(337,'Invoice_Bank_Details_Line6','',0,NULL),(338,'Invoice_Bank_Details_Line7','',0,NULL),(339,'Invoice_Bank_Details_Line8','',0,NULL),(340,'Prepaid_Invoice_Bank_Details_Line6','',0,NULL),(341,'Prepaid_Invoice_Bank_Details_Line7','',0,NULL),(342,'Prepaid_Invoice_Bank_Details_Line8','',0,NULL),(343,'Max_PDF_pages','100',0,NULL),(345,'old_mor_encoding_fix','1',0,NULL),(346,'Last_Crash_Exception_Class','NameError',0,NULL),(347,'Last_Crash_Exception_Time','2014-01-23 13:00:15',0,NULL),(348,'GUI_HDD_utilisation','80',0,NULL),(349,'GUI_CPU_General_load','0',0,NULL),(350,'GUI_CPU_Loadstats','0.0',0,NULL),(351,'GUI_CPU_Ruby_process','0',0,NULL),(352,'GUI_CPU_asterisk_process','0',0,NULL),(353,'DB_HDD_utilisation','80',0,NULL),(354,'DB_CPU_General_load','0',0,NULL),(355,'DB_CPU_Loadstats','0.0',0,NULL),(356,'DB_CPU_MySQL_process','0',0,NULL),(357,'DB_CPU_asterisk_process','0',0,NULL),(358,'Delete_Server_Load_stats_older_than','30',0,NULL),(359,'Kill_Call_if_PDD_more_than','0.0',0,NULL),(360,'Kill_Call_if_PDD_less_than','0.0',0,NULL),(361,'AD_sounds_path','/var/lib/asterisk/sounds/mor/ad',0,NULL),(362,'AST_18','1',0,NULL),(364,'Hide_active_calls_longer_than','4',0,NULL),(366,'System_time_zone_offset','2',0,NULL),(367,'Global_Number_Decimal','.',0,NULL),(368,'Integrity_Check','0',0,NULL),(369,'CC_Single_Login','0',0,NULL),(370,'CC_Active',NULL,0,NULL),(371,'AD_Active',NULL,0,NULL),(372,'RS_Active',NULL,0,NULL),(373,'SMS_Active',NULL,0,NULL),(374,'REC_Active',NULL,0,NULL),(375,'PG_Active',NULL,0,NULL),(376,'CS_Active',NULL,0,NULL),(378,'Invoice_email_notice_admin','1',0,NULL),(379,'Invoice_email_notice_manager','0',0,NULL),(380,'How_often_to_send_email_notice','5',0,NULL),(382,'m2_version','68',0,NULL),(384,'daily_actions_cooldown_time','2014-07-29 00:00:17',0,NULL),(385,'monthly_actions_cooldown_time','2014-07-01 00:10:02',0,NULL),(386,'Default_device_server_id','1',0,NULL),(389,'Voucher_Card_Disable','0',0,NULL),(390,'Paypal_Disable_For_Reseller','0',0,NULL),(391,'PayPal_User_Pays_Transfer_Fee','',0,NULL),(392,'PayPal_Max_Amount','',0,NULL),(393,'PayPal_Email_Notification','',0,NULL),(394,'PayPal_Payment_Confirmation','none',0,NULL),(395,'PayPal_Custom_redirect','',0,NULL),(396,'Paypal_return_url','',0,NULL),(397,'Paypal_cancel_url','',0,NULL),(398,'WebMoney_Gateway ','0',0,NULL),(399,'WebMoney_Secret_key','',0,NULL),(400,'Cyberplat_Transaction_Fee','',0,NULL),(401,'Cyberplat_Disabled_Info',NULL,0,''),(402,'Linkpoint_Enabled ','0',0,NULL),(403,'Linkpoint_Test','0',0,NULL),(404,'Linkpoint_Allow_HTTP','0',0,NULL),(405,'Linkpoint_Default_Currency','EUR',0,NULL),(406,'Linkpoint_Min_Amount','',0,NULL),(407,'Linkpoint_Default_Amount','',0,NULL),(408,'Linkpoint_StoreID','',0,NULL),(409,'Ouroboros_Enabled','0',0,NULL),(410,'Ouroboros_Min_Amount','0',0,NULL),(411,'Ouroboros_Max_Amount','0',0,NULL),(412,'Ouroboros_Default_Amount','0',0,NULL),(413,'Ouroboros_Language','hr',0,NULL),(414,'Ouroboros_Default_Currency','HRK',0,NULL),(415,'Ouroboros_Secret_key','',0,NULL),(416,'Ouroboros_Merchant_Code','',0,NULL),(417,'Ouroboros_Completion','0',0,NULL),(418,'Ouroboros_Completion_Over','0',0,NULL),(419,'Ouroboros_Retry_Count','3',0,NULL),(420,'Ouroboros_Link_name_and_url','',0,''),(421,'Login_page_Text',NULL,0,''),(422,'Hide_registration_link',NULL,0,NULL),(423,'Allow_registration_username_passwords_in_devices','0',0,NULL),(424,'Active_calls_show_did','0',0,NULL),(425,'Registration_Enable_VAT_checking','0',0,NULL),(426,'Registration_allow_vat_blank','0',0,NULL),(427,'Invoice_user_billsec_show','1',0,NULL),(428,'Invoice_To_Pay_Line','',0,NULL),(429,'Invoice_Add_Average_rate','0',0,NULL),(430,'Invoice_Show_Time_in_Minutes','0',0,NULL),(431,'Invoice_Short_File_Name','0',0,NULL),(432,'Invoice_show_additional_details_on_separate_page','0',0,''),(433,'Prepaid_Invoice_To_Pay_Line','',0,NULL),(434,'Prepaid_Invoice_Add_Average_rate','0',0,NULL),(435,'Prepaid_Invoice_Show_Time_in_Minutes','0',0,NULL),(436,'Prepaid_Invoice_Short_File_Name','0',0,NULL),(437,'Prepaid_Invoice_show_additional_details_on_separate_page','0',0,''),(438,'Invoice_allow_recalculate_after_send','0',0,NULL),(439,'do_not_block_users_when_balance_below_zero_on_subscription',NULL,0,NULL),(440,'Tax_compound','1',0,NULL),(441,'Date_format','%d/%m/%Y %H:%M:%S',0,NULL),(442,'time_format','%M:%S',0,NULL),(443,'Disallow_prepaid_user_balance_drop_below_zero','0',0,NULL),(444,'Hide_non_completed_payments_for_user','0',0,NULL),(445,'Disallow_Email_Editing',NULL,0,NULL),(446,'Disallow_Details_Editing',NULL,0,NULL),(447,'System_time_zone_daylight_savings','0',0,NULL),(448,'Logout_link','',0,NULL),(449,'Archive_at','-1',0,NULL),(450,'Archive_till','-1',0,NULL),(451,'Move_to_old_calls_older_than','0',0,NULL),(452,'Allow_short_passwords_in_devices','0',0,NULL),(453,'Show_zero_rates_in_LCR_tariff_export','0',0,NULL),(454,'Show_Active_Calls_for_Users',NULL,0,NULL),(455,'Active_Calls_Show_Server',NULL,0,NULL),(456,'Show_Advanced_Rates_For_Users','0',0,NULL),(457,'Show_advanced_Provider_settings','0',0,NULL),(458,'Show_advanced_Device_settings','0',0,NULL),(459,'Hide_Iwantto','0',0,NULL),(460,'Hide_Manual_Link','0',0,NULL),(461,'Hide_Device_Passwords_For_Users','0',0,NULL),(462,'Show_only_main_page','0',0,NULL),(463,'Show_forgot_password','0',0,NULL),(464,'Hide_recordings_for_all_users','0',0,NULL),(465,'Show_device_and_cid_in_last_calls',NULL,0,NULL),(466,'CSV_File_size','0',0,NULL),(467,'Registration_Agreement','0',0,NULL),(468,'Change_ANSWER_to_FAILED_if_HGC_not_equal_to_16_for_Users','0',0,NULL),(469,'Tell_Balance','0',0,NULL),(470,'Tell_Time','0',0,NULL),(471,'LCR_priority_using_drag_and_drop','1',0,NULL),(472,'Hide_Destination_End','0',0,NULL),(473,'RSPRO_Active','0',0,NULL),(474,'MA_Active',NULL,0,NULL),(475,'PROVB_Active',NULL,0,NULL),(476,'WP_Active',NULL,0,NULL),(477,'CALLB_Active',NULL,0,NULL),(478,'PBX_Active',NULL,0,NULL),(480,'Default_User_currency_id','1',0,NULL),(481,'Default_User_time_zone','UTC',0,NULL),(482,'Default_User_responsible_accountant_id','-1',0,NULL),(483,'Default_User_ignore_global_alerts','0',0,NULL),(484,'Default_User_blacklist_enabled','global',0,NULL),(485,'Default_User_routing_threshold','-1',0,NULL),(486,'Default_User_blacklist_lcr','-1',0,NULL),(487,'Default_User_hide_non_answered_calls','0',0,NULL),(488,'Default_User_routing_threshold_3','-1',0,NULL),(489,'Default_User_routing_threshold_2','-1',0,NULL),(490,'Default_User_blacklist_lcr_3','-1',0,NULL),(491,'Default_User_blacklist_lcr_2','-1',0,NULL),(492,'Default_User_minimal_charge','0',0,NULL),(493,'Default_User_minimal_charge_start_at','',0,NULL),(494,'Default_User_hide_destination_end','-1',0,NULL),(495,'Default_Tax_compound_tax','1',0,NULL),(496,'Default_User_username_length','8',0,NULL),(497,'Default_User_warning_email_balance_admin','0.0',0,NULL),(498,'Default_User_warning_email_balance_manager','0.0',0,NULL),(499,'Default_setting_device_caller_id_number','1',0,NULL),(500,'Default_device_fake_ring','0',0,NULL),(501,'Default_device_language','en',0,NULL),(502,'Default_device_enable_mwi','0',0,NULL),(503,'Default_device_qf_tell_time','0',0,NULL),(504,'Default_device_qf_tell_balance','0',0,NULL),(505,'Default_device_use_ani_for_cli','0',0,NULL),(506,'Default_device_encryption','no',0,NULL),(507,'Default_device_block_callerid','0',0,NULL),(508,'Default_device_cps_call_limit','0',0,NULL),(509,'Default_device_cps_period','0',0,NULL),(510,'Default_device_transport','udp',0,NULL),(511,'Default_device_time_limit_per_day','0',0,NULL),(512,'Default_device_codec_g722','0',0,NULL),(513,'Default_device_grace_time','0',0,NULL),(514,'Default_device_calleridpres','',0,NULL),(515,'Default_device_change_failed_code_to','0',0,NULL),(516,'Default_device_anti_resale_auto_answer','0',0,NULL),(517,'Default_device_recording_to_email','0',0,NULL),(518,'Default_device_recording_keep','0',0,NULL),(519,'Default_device_record_forced','0',0,NULL),(520,'Default_device_recording_email','',0,NULL),(521,'Default_device_save_call_log','0',0,NULL),(522,'Default_device_max_timeout','0',0,NULL),(523,'Default_device_tell_rate','0',0,NULL),(524,'DB_Update_From_Script','1',0,NULL),(525,'x5_functionality_3','1',0,NULL),(526,'x5_functionality_6','1',0,NULL),(527,'x5_functionality_7','1',0,NULL),(528,'x5_functionality_9','1',0,NULL),(529,'x5_functionality_10','1',0,NULL),(530,'x5_functionality_12','1',0,NULL),(531,'x5_functionality_15','1',0,NULL),(532,'x5_functionality_16','1',0,NULL),(533,'x5_functionality_18','1',0,NULL),(534,'x5_functionality_19','1',0,NULL),(535,'x5_functionality_20','1',0,NULL);
/*!40000 ALTER TABLE `conflines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `credit_notes`
--

DROP TABLE IF EXISTS `credit_notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `credit_notes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `issue_date` datetime NOT NULL COMMENT 'date when credit note was issued, can not be NULL because of obvious reasons. And default value is not set, so that no one could insert row with issue date as null',
  `number` varchar(255) DEFAULT NULL,
  `comment` text COMMENT 'by default comment is created without any comment, hence default value is null',
  `price` decimal(30,15) DEFAULT '0.000000000000000',
  `price_with_vat` decimal(30,15) DEFAULT '0.000000000000000',
  `tax_id` int(11) DEFAULT NULL COMMENT 'Stores tax that was applied the moment credit note was created',
  `status` enum('paid','unpaid') NOT NULL DEFAULT 'unpaid' COMMENT 'Note may be paid or unpaid, when creating note by default it is unpaid',
  `pay_date` datetime DEFAULT NULL COMMENT 'Date when note was paid, should be null while note is not paid',
  `user_id` int(10) unsigned NOT NULL COMMENT 'note has a relationship one-to-many with user, so it can not be null or negative. Maybe INT is a bit to much(range is 0 to 429496729), but user.id is INT too',
  `payment_id` int(10) unsigned DEFAULT NULL COMMENT 'when note is paid payment should be created and payment-note should have one-to-one relationship, but while it is not paid there should be no relationship between note and payment, so it might be null. considerations why UNSIGNED INT was chosen same as with user_id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `credit_notes`
--

LOCK TABLES `credit_notes` WRITE;
/*!40000 ALTER TABLE `credit_notes` DISABLE KEYS */;
/*!40000 ALTER TABLE `credit_notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cron_actions`
--

DROP TABLE IF EXISTS `cron_actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cron_actions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cron_setting_id` int(11) NOT NULL COMMENT 'setting ID',
  `attempts` int(11) DEFAULT '0' COMMENT 'Provides for retries, but still fail eventually.',
  `locked_by` varchar(255) DEFAULT NULL COMMENT 'Who is working on this object (if locked)',
  `last_error` text,
  `handler` varchar(255) DEFAULT NULL COMMENT 'YAML-encoded string of the object that will do work',
  `run_at` datetime DEFAULT NULL COMMENT 'When to run. Could be Time.now for immediately, or sometime in the future.',
  `locked_at` datetime DEFAULT NULL COMMENT 'Set when a client is working on this object',
  `failed_at` datetime DEFAULT NULL COMMENT 'Set when all retries have failed (actually, by default, the record is deleted instead)',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cron_actions`
--

LOCK TABLES `cron_actions` WRITE;
/*!40000 ALTER TABLE `cron_actions` DISABLE KEYS */;
/*!40000 ALTER TABLE `cron_actions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cron_settings`
--

DROP TABLE IF EXISTS `cron_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cron_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL COMMENT 'owner of setting',
  `name` varchar(255) NOT NULL COMMENT 'Name of setting',
  `description` text,
  `target_id` int(11) NOT NULL COMMENT 'object ID, -1 all in class',
  `target_class` varchar(255) NOT NULL COMMENT 'Object class',
  `to_target_id` int(11) NOT NULL COMMENT 'object ID, -1 all in class',
  `to_target_class` varchar(255) NOT NULL COMMENT 'Object class',
  `periodic_type` int(11) DEFAULT '0' COMMENT 'type of periodic',
  `to_do_time` time DEFAULT NULL,
  `repeat_forever` int(11) DEFAULT '0',
  `priority` int(11) DEFAULT '0',
  `to_do_times` int(11) DEFAULT NULL,
  `valid_from` datetime DEFAULT NULL,
  `valid_till` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `provider_target_id` int(11) NOT NULL,
  `provider_to_target_id` int(11) NOT NULL,
  `lcr_id` int(11) DEFAULT NULL,
  `inv_from` smallint(6) DEFAULT NULL,
  `inv_till` smallint(6) DEFAULT NULL,
  `inv_issue_day` smallint(6) DEFAULT NULL,
  `inv_send_after` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cron_settings`
--

LOCK TABLES `cron_settings` WRITE;
/*!40000 ALTER TABLE `cron_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `cron_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cs_invoices`
--

DROP TABLE IF EXISTS `cs_invoices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cs_invoices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `callshop_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `state` varchar(15) NOT NULL DEFAULT 'unpaid',
  `invoice_type` varchar(10) DEFAULT NULL,
  `balance` decimal(30,15) DEFAULT '0.000000000000000',
  `comment` text,
  `paid_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `tax_id` int(11) DEFAULT NULL COMMENT 'Tax for invoice',
  `balance_with_tax` decimal(30,15) DEFAULT '0.000000000000000',
  PRIMARY KEY (`id`),
  KEY `user_id_index` (`user_id`),
  KEY `callshop_id_index` (`callshop_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cs_invoices`
--

LOCK TABLES `cs_invoices` WRITE;
/*!40000 ALTER TABLE `cs_invoices` DISABLE KEYS */;
/*!40000 ALTER TABLE `cs_invoices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currencies`
--

DROP TABLE IF EXISTS `currencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `currencies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `exchange_rate` decimal(30,15) DEFAULT '1.000000000000000',
  `active` tinyint(4) NOT NULL DEFAULT '1',
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `curr_update` int(11) DEFAULT '1',
  `curr_edit` int(11) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `name` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=150 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currencies`
--

LOCK TABLES `currencies` WRITE;
/*!40000 ALTER TABLE `currencies` DISABLE KEYS */;
INSERT INTO `currencies` VALUES (1,'USD','United States dollar',1.000000000000000,1,'2009-08-31 16:55:07',0,1),(2,'EUR','Euro',0.744100000000000,1,'2014-07-28 21:00:18',1,1),(3,'ALL','Albanian Lek',103.800000000000000,0,'2014-07-28 21:00:18',1,1),(4,'DZD','Algerian Dinar',80.540000000000000,0,'2014-07-28 21:00:18',1,1),(5,'ARS','Argentinian Peso',8.176600000000000,0,'2014-07-28 21:00:18',1,1),(6,'AWG','Aruban Florin',1.790000000000000,0,'2014-07-28 21:00:18',1,1),(7,'AUD','Australian Dollar',1.063000000000000,0,'2014-07-28 21:00:18',1,1),(9,'BHD','Bahraini Dinar',0.377100000000000,0,'2014-07-28 21:00:18',1,1),(10,'BDT','Bangladesh Taka',77.550000000000000,0,'2014-07-28 21:00:18',1,1),(11,'BBD','Barbados Dollar',2.000000000000000,0,'2014-07-28 21:00:18',1,1),(13,'BZD','Belize Dollar',1.995000000000000,0,'2014-07-28 21:00:18',1,1),(14,'BMD','Bermuda Dollar',1.000000000000000,0,'2014-07-28 21:00:18',1,1),(15,'BTN','Bhutan Ngultrum',60.133800000000000,0,'2014-07-28 21:00:18',1,1),(16,'BOB','Bolivian Boliviano',6.910000000000000,0,'2014-07-28 21:00:18',1,1),(17,'BWP','Botswana Pula',8.771900000000000,0,'2014-07-28 21:00:18',1,1),(18,'BRL','Brazilian Real',2.224300000000000,0,'2014-07-28 21:00:18',1,1),(19,'GBP','British Pound',0.588800000000000,0,'2014-07-28 21:00:18',1,1),(20,'BND','Brunei Dollar',1.241400000000000,0,'2014-07-28 21:00:18',1,1),(21,'BGN','Bulgarian Lev',1.461000000000000,0,'2014-07-28 21:00:18',1,1),(22,'KHR','Cambodian Riel',4050.000000000000000,0,'2014-07-28 21:00:18',1,1),(23,'CAD','Canadian Dollar',1.079700000000000,0,'2014-07-28 21:00:18',1,1),(24,'CVE','Cape Verde Escudo',81.020000000000000,0,'2014-07-28 21:00:18',1,1),(25,'KYD','Cayman Islands Dollar ',1.161200000000000,0,'2009-09-01 09:47:07',0,1),(27,'XOF','West African CFA Franc',488.650000000000000,0,'2014-07-28 21:00:18',1,1),(28,'XAF','Central African CFA Franc',488.335800000000000,0,'2014-07-28 21:00:18',1,1),(30,'XPF','CFP Franc',88.730000000000000,0,'2014-07-28 21:00:18',1,1),(31,'CLP','Chilean Peso',563.795000000000000,0,'2014-07-28 21:00:18',1,1),(32,'COP','Colombian Peso',1849.500000000000000,0,'2014-07-28 21:00:18',1,1),(33,'KMF','Comoros Franc',366.251800000000000,0,'2014-07-28 21:00:18',1,1),(34,'CRC','Costa Rican Colon',539.500000000000000,0,'2014-07-28 21:00:18',1,1),(35,'HRK','Croatian Kuna',5.685000000000000,0,'2014-07-28 21:00:18',1,1),(36,'CUP','Cuban Peso',1.000000000000000,0,'2014-07-28 21:00:18',1,1),(38,'CZK','Czech Koruna',20.444500000000000,0,'2014-07-28 21:00:18',1,1),(39,'DKK','Danish Krone',5.548500000000000,0,'2014-07-28 21:00:18',1,1),(40,'DJF','Djibouti Franc',182.000000000000000,0,'2014-07-28 21:00:18',1,1),(41,'DOP','Dominican Peso',43.560000000000000,0,'2014-07-28 21:00:18',1,1),(43,'XCD','East Caribbean Dollar',2.700000000000000,0,'2014-07-28 21:00:18',1,1),(44,'EGP','Egyptian Pound',7.148600000000000,0,'2014-07-28 21:00:18',1,1),(45,'SVC','El Salvador Colon',8.747000000000000,0,'2014-07-28 21:00:18',1,1),(47,'ETB','Ethiopian Birr',19.763000000000000,0,'2014-07-28 21:00:18',1,1),(48,'FJD','Fiji Dollar',1.840000000000000,0,'2014-07-28 21:00:18',1,1),(51,'GMD','Gambia Dalasi',39.600000000000000,0,'2014-07-28 21:00:18',1,1),(53,'GHS','Ghana cedi',3.602000000000000,0,'2014-07-28 21:00:18',1,1),(54,'GIP','Gibraltar Pound',0.588900000000000,0,'2014-07-28 21:00:18',1,1),(56,'GTQ','Guatemala Quetzal',7.800500000000000,0,'2014-07-28 21:00:18',1,1),(57,'GNF','Guinea Franc',7035.000000000000000,0,'2014-07-28 21:00:18',1,1),(58,'GYD','Guyana Dollar',205.700000000000000,0,'2014-07-28 21:00:18',1,1),(59,'HTG','Haitian Gourde',45.297900000000000,0,'2014-07-28 21:00:18',1,1),(60,'HNL','Honduras Lempira',20.966800000000000,0,'2014-07-28 21:00:18',1,1),(61,'HKD','Hong Kong Dollar',7.750100000000000,0,'2014-07-28 21:00:18',1,1),(62,'HUF','Hungarian Forint',229.985000000000000,0,'2014-07-28 21:00:18',1,1),(63,'ISK','Iceland Krona',115.300000000000000,0,'2014-07-28 21:00:18',1,1),(64,'INR','Indian Rupee',60.060000000000000,0,'2014-07-28 21:00:18',1,1),(65,'IDR','Indonesian Rupiah',11625.000000000000000,0,'2014-07-28 21:00:18',1,1),(66,'IEP','Irish Punt',0.586300000000000,0,'2014-07-28 21:00:18',1,1),(67,'ILS','Israeli Shekel',3.427600000000000,0,'2014-07-28 21:00:18',1,1),(69,'JMD','Jamaican Dollar',112.700000000000000,0,'2014-07-28 21:00:18',1,1),(70,'JPY','Japanese Yen',101.860000000000000,0,'2014-07-28 21:00:18',1,1),(71,'JOD','Jordanian Dinar',0.708500000000000,0,'2014-07-28 21:00:18',1,1),(72,'KES','Kenyan Shilling',87.750000000000000,0,'2014-07-28 21:00:18',1,1),(73,'KWD','Kuwaiti Dinar',0.282900000000000,0,'2014-07-28 21:00:18',1,1),(74,'LAK','Laos Kip',8049.500000000000000,0,'2014-07-28 21:00:18',1,1),(75,'LVL','Latvian Lats',0.522800000000000,0,'2014-07-28 21:00:18',1,1),(76,'LBP','Lebanese Pound',1512.500000000000000,0,'2014-07-28 21:00:18',1,1),(77,'LSL','Lesotho Loti',10.570000000000000,0,'2014-07-28 21:00:18',1,1),(78,'LTL','Lithuanian Litas',2.569200000000000,0,'2014-07-28 21:00:18',1,1),(79,'MGA','Malagasy Ariary',2505.000000000000000,0,'2014-07-28 21:00:18',1,1),(80,'MWK','Malawi Kwacha',395.000000000000000,0,'2014-07-28 21:00:18',1,1),(81,'MYR','Malaysian Ringgit',3.174500000000000,0,'2014-07-28 21:00:18',1,1),(82,'MVR','Maldives Rufiyan',15.400000000000000,0,'2014-07-28 21:00:18',1,1),(84,'MRO','Mauritania Ouguiya',290.500000000000000,0,'2014-07-28 21:00:18',1,1),(85,'MUR','Mauritius Rupee',30.800000000000000,0,'2014-07-28 21:00:18',1,1),(86,'MXN','Mexican Peso',13.005200000000000,0,'2014-07-28 21:00:18',1,1),(87,'MNT','Mongolian Tugrik',1847.500000000000000,0,'2014-07-28 21:00:18',1,1),(88,'MAD','Moroccan Dirham',8.328900000000000,0,'2014-07-28 21:00:18',1,1),(89,'MZN','Mozambican metical ',0.000000000000000,0,'2009-09-01 09:47:07',0,1),(90,'MMK','Myanmar Kyat',973.000000000000000,0,'2014-07-28 21:00:18',1,1),(91,'NAD','Namibian Dollar',10.544000000000000,0,'2014-07-28 21:00:18',1,1),(92,'NPR','Nepal Rupee',96.400000000000000,0,'2014-07-28 21:00:18',1,1),(93,'ANG','Netherlands Antilles Guilder',1.790000000000000,0,'2014-07-28 21:00:18',1,1),(94,'NZD','New Zealand Dollar',1.170000000000000,0,'2014-07-28 21:00:18',1,1),(95,'NIO','Nicaraguan Cordoba',26.015000000000000,0,'2014-07-28 21:00:18',1,1),(96,'NGN','Nigerian Naira',161.770000000000000,0,'2014-07-28 21:00:18',1,1),(97,'NOK','Norwegian Krone',6.226800000000000,0,'2014-07-28 21:00:18',1,1),(98,'OMR','Oman Rial',0.385000000000000,0,'2014-07-28 21:00:18',1,1),(99,'PKR','Pakistani Rupee',98.820000000000000,0,'2014-07-28 21:00:18',1,1),(100,'PGK','Papua New Guinea Kina',2.439900000000000,0,'2014-07-28 21:00:18',1,1),(101,'PEN','Peruvian Sol',2.787000000000000,0,'2014-07-28 21:00:18',1,1),(102,'PHP','Philippines Peso',43.370000000000000,0,'2014-07-28 21:00:18',1,1),(103,'PLN','Polish Zloty',3.084200000000000,0,'2014-07-28 21:00:18',1,1),(105,'QAR','Qatari Rial',3.640900000000000,0,'2014-07-28 21:00:18',1,1),(106,'CNY','Renmimbi Yuan',6.187500000000000,0,'2014-07-28 21:00:18',1,1),(107,'RON','Romanian leu',3.264000000000000,0,'2014-07-28 21:00:18',1,1),(108,'RUB','Russian Ruble',35.551000000000000,0,'2014-07-28 21:00:18',1,1),(109,'SBD','Salomon Islands Dollar',7.218200000000000,0,'2014-07-28 21:00:18',1,1),(110,'STD','Sao Tome & Principe Dobra',18215.000000000000000,0,'2014-07-28 21:00:18',1,1),(111,'SAR','Saudi Arabian Riyal',3.750600000000000,0,'2014-07-28 21:00:18',1,1),(112,'SCR','Seychelles Rupee',12.310000000000000,0,'2014-07-28 21:00:18',1,1),(113,'SLL','Sierra Leone Leone',4368.000000000000000,0,'2014-07-28 21:00:18',1,1),(114,'SGD','Singapore Dollar',1.241700000000000,0,'2014-07-28 21:00:18',1,1),(117,'ZAR','South African Rand',10.565000000000000,0,'2014-07-28 21:00:18',1,1),(118,'KRW','South Korean Won',1026.300000000000000,0,'2014-07-28 21:00:18',1,1),(120,'LKR','Sri Lanka Rupee',130.215000000000000,0,'2014-07-28 21:00:18',1,1),(121,'SHP','St. Helena Pound',0.588900000000000,0,'2014-07-28 21:00:18',1,1),(122,'SDG','Sudanese Pound',5.692500000000000,0,'2014-07-28 21:00:18',1,1),(123,'SRD','Surinamese dollar',3.275000000000000,0,'2014-07-28 21:00:18',1,1),(124,'SZL','Swaziland Lilangeni',10.573000000000000,0,'2014-07-28 21:00:18',1,1),(125,'SEK','Swedish Krona',6.836100000000000,0,'2014-07-28 21:00:18',1,1),(126,'CHF','Swiss Franc',0.904000000000000,0,'2014-07-28 21:00:18',1,1),(127,'SYP','Syria Pound',149.550000000000000,0,'2014-07-28 21:00:18',1,1),(128,'TWD','Taiwan New Dollar',30.010000000000000,0,'2014-07-28 21:00:18',1,1),(129,'TZS','Tanzanian Shilling',1657.500000000000000,0,'2014-07-28 21:00:18',1,1),(130,'THB','Thai Baht',31.810000000000000,0,'2014-07-28 21:00:18',1,1),(131,'TOP','Tonga Isl Paanga',1.853000000000000,0,'2014-07-28 21:00:18',1,1),(132,'TTD','Trinidad Dollar',6.354900000000000,0,'2014-07-28 21:00:18',1,1),(133,'TND','Tunisian Dinar',1.714500000000000,0,'2014-07-28 21:00:18',1,1),(134,'TRY','Turkish Lira',2.099100000000000,0,'2014-07-28 21:00:18',1,1),(135,'UGX','Ugandan Shilling',2627.000000000000000,0,'2014-07-28 21:00:18',1,1),(136,'UAH','Ukraine Hryvnia',11.863300000000000,0,'2014-07-28 21:00:18',1,1),(137,'AED','United Arab Emirates Dirham',3.673200000000000,0,'2014-07-28 21:00:18',1,1),(138,'VUV','Vanuatu Vatu',93.450000000000000,0,'2014-07-28 21:00:18',1,1),(139,'VEF','Venezuelan bolivar',6.292500000000000,0,'2014-07-28 21:00:18',1,1),(140,'VND','Vietnam Dong',21205.000000000000000,0,'2014-07-28 21:00:18',1,1),(141,'WST','Western Samoa Tala',2.315100000000000,0,'2014-07-28 21:00:18',1,1),(142,'ZMW','Zambia Kwacha',6.150000000000000,0,'2014-07-28 21:00:18',1,1),(143,'ZWL','Zimbabwean Dollar',322.355000000000000,0,'2014-07-28 21:00:18',1,1),(144,'KZT','Kazakhstani Tenge',183.560000000000000,0,'2014-07-28 21:00:18',1,1),(145,'GEL','Georgian lari',1.743100000000000,0,'2014-07-28 21:00:18',1,1),(146,'MDL','Moldovan leu',13.875000000000000,0,'2014-07-28 21:00:18',1,1),(147,'LYD','Libyan Dinar',1.252200000000000,0,'2014-07-28 21:00:18',1,1),(148,'AMD','Armenian Dram',1.000000000000000,0,'2014-01-23 09:36:15',0,1),(149,'PYG','Paraguayan-Guarani',4277.689900000000000,0,'2014-07-28 21:00:18',1,1);
/*!40000 ALTER TABLE `currencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customrates`
--

DROP TABLE IF EXISTS `customrates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customrates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `destinationgroup_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customrates`
--

LOCK TABLES `customrates` WRITE;
/*!40000 ALTER TABLE `customrates` DISABLE KEYS */;
/*!40000 ALTER TABLE `customrates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `days`
--

DROP TABLE IF EXISTS `days`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `days` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `daytype` enum('FD','WD') DEFAULT 'FD' COMMENT 'Free Day or Work Day?',
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `days`
--

LOCK TABLES `days` WRITE;
/*!40000 ALTER TABLE `days` DISABLE KEYS */;
/*!40000 ALTER TABLE `days` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `destinationgroups`
--

DROP TABLE IF EXISTS `destinationgroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `destinationgroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `desttype` varchar(10) DEFAULT NULL,
  `flag` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1225 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `destinationgroups`
--

LOCK TABLES `destinationgroups` WRITE;
/*!40000 ALTER TABLE `destinationgroups` DISABLE KEYS */;
INSERT INTO `destinationgroups` VALUES (1,'Afghanistan - Fixed','FIX','afg'),(2,'Afghanistan - Mobile AWCC','MOB','afg'),(3,'Afghanistan - Mobile Etisalat','MOB','afg'),(4,'Afghanistan - Mobile MTN','MOB','afg'),(5,'Afghanistan - Mobile Others','MOB','afg'),(6,'Afghanistan - Mobile Roshan','MOB','afg'),(7,'Afghanistan - Mobile WASEL','MOB','afg'),(8,'Albania - Fixed','FIX','alb'),(9,'Albania - Fixed ALBTEL','FIX','alb'),(10,'Albania - Fixed AMC','FIX','alb'),(11,'Albania - Fixed Tirana','FIX','alb'),(12,'Albania - Interactive TV','NGN','alb'),(13,'Albania - Mobile','MOB','alb'),(14,'Albania - Mobile AMC','MOB','alb'),(15,'Albania - Mobile Plus','MOB','alb'),(16,'Albania - Mobile Vodafone','MOB','alb'),(17,'Algeria - Fixed','FIX','dza'),(18,'Algeria - Fixed CAT','FIX','dza'),(19,'Algeria - Mobile Orascom','MOB','dza'),(20,'Algeria - Mobile Others','MOB','dza'),(21,'Algeria - Mobile Wataniya','MOB','dza'),(22,'American Samoa','NGN','asm'),(23,'Andorra - Fixed','FIX','and'),(24,'Andorra - Mobile','MOB','and'),(25,'Angola - Fixed','FIX','ago'),(26,'Angola - Mobile Others','MOB','ago'),(27,'Angola - Mobile Unitel','MOB','ago'),(28,'Anguilla - Fixed','FIX','aia'),(29,'Anguilla - Mobile Digicel','MOB','aia'),(30,'Anguilla - Mobile Others','MOB','aia'),(31,'Antarctica','NGN','ata'),(32,'Antigua and Barbuda - Fixed','FIX','atg'),(33,'Antigua and Barbuda - Mobile','MOB','atg'),(34,'Argentina - Fixed','FIX','arg'),(35,'Argentina - Fixed Buenos Aires','FIX','arg'),(36,'Argentina - Fixed Corridor','FIX','arg'),(37,'Argentina - Mobile','MOB','arg'),(38,'Argentina - Special Services','NGN','arg'),(39,'Argentina - Special Services TYPE_A','NGN','arg'),(40,'Armenia - Fixed','FIX','arm'),(41,'Armenia - Fixed Nagorno Karabakh','FIX','arm'),(42,'Armenia - Fixed Yerevan','FIX','arm'),(43,'Armenia - Mobile','MOB','arm'),(44,'Armenia - Mobile Armentel','MOB','arm'),(45,'Armenia - Mobile Nagorno Karabach','MOB','arm'),(46,'Armenia - Mobile Orange','MOB','arm'),(47,'Armenia - Special Services','NGN','arm'),(48,'Aruba - Fixed','FIX','abw'),(49,'Aruba - Mobile Digicel','MOB','abw'),(50,'Aruba - Mobile Others','MOB','abw'),(51,'Ascension - Special Services','NGN','asc'),(52,'Ascension','NGN','asc'),(53,'Australia - Fixed','FIX','aus'),(54,'Australia - Fixed City Group','FIX','aus'),(55,'Australia - Mobile H3G','MOB','aus'),(56,'Australia - Mobile Lycatel','MOB','aus'),(57,'Australia - Mobile Optus','MOB','aus'),(58,'Australia - Mobile Others','MOB','aus'),(59,'Australia - Mobile Telstra','MOB','aus'),(60,'Australia - Mobile Vodafone','MOB','aus'),(61,'Australia - Special services','NGN','aus'),(62,'Australia Satellite - Fixed Telstra','FIX','aus'),(63,'Australia Satellite - Mobile Optus','MOB','aus'),(64,'Australia Satellite - Mobile Telstra','MOB','aus'),(65,'Austria - Corporate Numbering','NGN','aut'),(66,'Austria - Fixed','FIX','aut'),(67,'Austria - Fixed Vienna','FIX','aut'),(68,'Austria - Mobile H3G','MOB','aut'),(69,'Austria - Mobile Mobilkom','MOB','aut'),(70,'Austria - Mobile Others','MOB','aut'),(71,'Austria - Mobile TMobile','MOB','aut'),(72,'Austria - Special Services','NGN','aut'),(73,'Azerbaijan - Fixed','FIX','aze'),(74,'Azerbaijan - Mobile Bakcell','MOB','aze'),(75,'Azerbaijan - Mobile Others','MOB','aze'),(76,'Bahamas - Mobile','MOB','bhs'),(77,'Bahamas','NGN','bhs'),(78,'Bahrain - Fixed','FIX','bhr'),(79,'Bahrain - Fixed Wimax MENA','FIX','bhr'),(80,'Bahrain - Mobile MTC Vodafone','MOB','bhr'),(81,'Bahrain - Mobile Others','MOB','bhr'),(82,'Bahrain - Mobile STC','MOB','bhr'),(83,'Bangladesh - Fixed','FIX','bgd'),(84,'Bangladesh - Fixed Chittagong','FIX','bgd'),(85,'Bangladesh - Fixed Dhakka','FIX','bgd'),(86,'Bangladesh - Fixed Sylhet','FIX','bgd'),(87,'Bangladesh - Mobile','MOB','bgd'),(88,'Barbados - Fixed','FIX','brb'),(89,'Barbados - Mobile Digicel','MOB','brb'),(90,'Barbados - Mobile Others','MOB','brb'),(91,'Belarus - Fixed','FIX','blr'),(92,'Belarus - Fixed Minsk','FIX','blr'),(93,'Belarus - Mobile MDC','MOB','blr'),(94,'Belarus - Mobile Others','MOB','blr'),(95,'Belarus - Mobility services','NGN','blr'),(96,'Belarus Special services','NGN','blr'),(97,'Belgium - Fixed','FIX','bel'),(98,'Belgium - Mobile Base','MOB','bel'),(99,'Belgium - Mobile Mobistar','MOB','bel'),(100,'Belgium - Mobile Others','MOB','bel'),(101,'Belgium - Mobile Proximus','MOB','bel'),(102,'Belgium - Mobile Telenet','MOB','bel'),(103,'Belgium - Universal Access Number','NGN','bel'),(104,'Belize - Fixed','FIX','blz'),(105,'Belize - Mobile','MOB','blz'),(106,'Benin - Fixed','FIX','ben'),(107,'Benin - Mobile Bell Benin','MOB','ben'),(108,'Benin - Mobile GLOMOB','MOB','ben'),(109,'Benin - Mobile Libercom','MOB','ben'),(110,'Benin - Mobile MTN','MOB','ben'),(111,'Benin - Mobile TELCEL','MOB','ben'),(112,'Bermuda','NGN','bmu'),(113,'Bhutan - Fixed','FIX','btn'),(114,'Bhutan - Mobile','MOB','btn'),(115,'Bolivia - Fixed','FIX','bol'),(116,'Bolivia - Fixed La Paz','FIX','bol'),(117,'Bolivia - Fixed Santa Cruz','FIX','bol'),(118,'Bolivia - Mobile Entel','MOB','bol'),(119,'Bolivia - Mobile Others','MOB','bol'),(120,'Bolivia - Mobile Telcel','MOB','bol'),(121,'Bosnia and Herzegovina - Fixed','FIX','bih'),(122,'Bosnia and Herzegovina - Fixed BIH','FIX','bih'),(123,'Bosnia and Herzegovina - Fixed Mostar','FIX','bih'),(124,'Bosnia and Herzegovina - Fixed SRPSKE','FIX','bih'),(125,'Bosnia and Herzegovina - Mobile BIH','MOB','bih'),(126,'Bosnia and Herzegovina - Mobile Eronet','MOB','bih'),(127,'Bosnia and Herzegovina - Mobile SRPSKE','MOB','bih'),(128,'Botswana - Fixed','FIX','bwa'),(129,'Botswana - Mobile','MOB','bwa'),(130,'Botswana - Mobile MTN','MOB','bwa'),(131,'Brazil - Fixed','FIX','bra'),(132,'Brazil - Fixed Belo Horizonte','FIX','bra'),(133,'Brazil - Fixed Brasilia','FIX','bra'),(134,'Brazil - Fixed Campinas','FIX','bra'),(135,'Brazil - Fixed Curitiba','FIX','bra'),(136,'Brazil - Fixed Florianopolis','FIX','bra'),(137,'Brazil - Fixed Goiania','FIX','bra'),(138,'Brazil - Fixed Governador','FIX','bra'),(139,'Brazil - Fixed Porto Alegre','FIX','bra'),(140,'Brazil - Fixed Rio','FIX','bra'),(141,'Brazil - Fixed Sao Paulo','FIX','bra'),(142,'Brazil - Fixed State of Sao Paulo','FIX','bra'),(143,'Brazil - Mobile Others','MOB','bra'),(144,'Brazil - Mobile TIM','MOB','bra'),(145,'British Virgin Islands - Mobile','MOB','vgb'),(146,'British Virgin Islands - Mobile Digicel','MOB','vgb'),(147,'British Virgin Islands','NGN','vgb'),(148,'Brunei - Fixed','FIX','brn'),(149,'Brunei - Mobile','MOB','brn'),(150,'Bulgaria - fixed OLO','FIX','bgr'),(151,'Bulgaria - Fixed','FIX','bgr'),(152,'Bulgaria - Fixed Sofia','FIX','bgr'),(153,'Bulgaria - Mobile BTC','MOB','bgr'),(154,'Bulgaria - Mobile Globul','MOB','bgr'),(155,'Bulgaria - Mobile Mobiltel','MOB','bgr'),(156,'Bulgaria - Mobile Others','MOB','bgr'),(157,'Bulgaria - Mobility services Mobitel Type B','NGN','bgr'),(158,'Bulgaria - Mobility services MOBITEL','NGN','bgr'),(159,'Bulgaria - Mobility services TYPE_A','NGN','bgr'),(160,'Bulgaria - Special Services','NGN','bgr'),(161,'Burkina Faso - Fixed','FIX','bfa'),(162,'Burkina Faso - Interactive TV','NGN','bfa'),(163,'Burkina Faso - Mobile','MOB','bfa'),(164,'Burkina Faso - Mobile Celtel','MOB','bfa'),(165,'Burkina Faso - Mobile Telecel','MOB','bfa'),(166,'Burundi - Fixed','FIX','bdi'),(167,'Burundi - Mobile','MOB','bdi'),(168,'Burundi - Mobile AFRICL','MOB','bdi'),(169,'Burundi - Mobile Onatel','MOB','bdi'),(170,'Burundi - Mobile Telecel','MOB','bdi'),(171,'Burundi - Special services','NGN','bdi'),(172,'Cambodia - Fixed','FIX','khm'),(173,'Cambodia - Fixed METFONE','FIX','khm'),(174,'Cambodia - Mobile','MOB','khm'),(175,'Cambodia - Mobile METFONE','MOB','khm'),(176,'Cameroon - Fixed','FIX','cmr'),(177,'Cameroon - Fixed Douala','FIX','cmr'),(178,'Cameroon - Mobile MTN','MOB','cmr'),(179,'Cameroon - Mobile Orange','MOB','cmr'),(180,'Cameroon - Special services','NGN','cmr'),(181,'Cameroon - Special Services VAS','NGN','cmr'),(182,'Canada - Fixed Northwest Territories','FIX','can'),(183,'Canada - Fixed Others','FIX','can'),(184,'Cape Verde - Fixed','FIX','cpv'),(185,'Cape Verde - Mobile','MOB','cpv'),(186,'Cape Verde - Mobile TPLUS','MOB','cpv'),(187,'Cayman Islands - Fixed','FIX','cym'),(188,'Cayman Islands - Mobile Digicel','MOB','cym'),(189,'Cayman Islands - Mobile Others','MOB','cym'),(190,'Central African Republic - Fixed','FIX','caf'),(191,'Central African Republic - Mobile','MOB','caf'),(192,'Central African Republic - Mobile TELCEL','MOB','caf'),(193,'Central African Republic - Special Services','NGN','caf'),(194,'Chad - Fixed','FIX','tcd'),(195,'Chad - Mobile Celtel','MOB','tcd'),(196,'Chad - Mobile Millicom','MOB','tcd'),(197,'Chad - Mobile Others','MOB','tcd'),(198,'Chile - Fixed','FIX','chl'),(199,'Chile - Fixed Santiago','FIX','chl'),(200,'Chile - Mobile','MOB','chl'),(201,'Chile - Rural','NGN','chl'),(202,'Chile - Special Services','NGN','chl'),(203,'China - Fixed','FIX','chn'),(204,'China - Mobile Others','MOB','chn'),(205,'China - Mobile UNCCL','MOB','chn'),(206,'Colombia - Fixed','FIX','col'),(207,'Colombia - Fixed Bogota','FIX','col'),(208,'Colombia - Fixed Cali','FIX','col'),(209,'Colombia - Fixed Medellin','FIX','col'),(210,'Colombia - Fixed Pereira','FIX','col'),(211,'Colombia - LEX','NGN','col'),(212,'Colombia - Mobile','MOB','col'),(213,'Colombia - Mobile Comcel','MOB','col'),(214,'Colombia - Mobile Movistar','MOB','col'),(215,'Colombia - Mobile TIGO','MOB','col'),(216,'Comoros - Mobile','MOB','com'),(217,'Comoros - Mobility Services','NGN','com'),(218,'Comoros - Special services','NGN','com'),(219,'Comoros','NGN','com'),(220,'Congo - Fixed','FIX','cog'),(221,'Congo - Mobile Celtel','MOB','cog'),(222,'Congo - Mobile MTN','MOB','cog'),(223,'Congo - Mobile Others','MOB','cog'),(224,'Congo - Mobile Warid','MOB','cog'),(225,'Cook - Fixed','FIX','cok'),(226,'Cook - Mobile','MOB','cok'),(227,'Costa Rica - Fixed','FIX','cri'),(228,'Costa Rica - Mobile','MOB','cri'),(229,'Costa Rica - Mobile Claro','MOB','cri'),(230,'Costa Rica - Mobile Telefonica','MOB','cri'),(231,'Croatia - Fixed','FIX','hrv'),(232,'Croatia - Mobile HPT','MOB','hrv'),(233,'Croatia - Mobile Others','MOB','hrv'),(234,'Croatia - Mobile Vipnet','MOB','hrv'),(235,'Cuba - Fixed','FIX','cub'),(236,'Cuba - Fixed Guantanamo','FIX','cub'),(237,'Cuba - Mobile','MOB','cub'),(238,'Cyprus - Fixed','FIX','cyp'),(239,'Cyprus - Mobile','MOB','cyp'),(240,'Cyprus - Mobile CYTA','MOB','cyp'),(241,'Cyprus - Mobile MTN','MOB','cyp'),(242,'Cyprus - Mobility services','NGN','cyp'),(243,'Cyprus - Personal Numbering','NGN','cyp'),(244,'Czech Republic - Fixed','FIX','cze'),(245,'Czech Republic - Mobile CZETEL','MOB','cze'),(246,'Czech Republic - Mobile Others','MOB','cze'),(247,'Czech Republic - Mobile T-Mobil','MOB','cze'),(248,'Czech Republic - Mobile Travel','MOB','cze'),(249,'Czech Republic - Mobile Travel Type A','MOB','cze'),(250,'Czech Republic - Mobile Vodafone','MOB','cze'),(251,'Czech Republic - Special Services','NGN','cze'),(252,'Denmark - Fixed','FIX','dnk'),(253,'Denmark - Mobile HI3G','MOB','dnk'),(254,'Denmark - Mobile Others','MOB','dnk'),(255,'Denmark - Mobile Sonofon','MOB','dnk'),(256,'Denmark - Mobile TDK','MOB','dnk'),(257,'Denmark - Mobile Telia','MOB','dnk'),(258,'Denmark - Paid800','NGN','dnk'),(259,'Diego Garcia - Fixed','FIX','dga'),(260,'Diego Garcia - Mobile','MOB','dga'),(261,'Djibouti - Fixed','FIX','dji'),(262,'Djibouti - Mobile','MOB','dji'),(263,'Dominica - Mobile Digicel','MOB','dma'),(264,'Dominica - Mobile Others','MOB','dma'),(265,'Dominica - Special Services','NGN','dma'),(266,'Dominica','NGN','dma'),(267,'Dominican Republic - Fixed','FIX','dom'),(268,'Dominican Republic - Mobile Orange','MOB','dom'),(269,'Dominican Republic - Mobile Others','MOB','dom'),(270,'Dominican Republic - Mobile Verizon','MOB','dom'),(271,'Dominican Republic - Santo Domingo','NGN','dom'),(272,'DR of Congo - Fixed','FIX','cod'),(273,'DR of Congo - Mobile AFRICELL','MOB','cod'),(274,'DR of Congo - Mobile Celtel','MOB','cod'),(275,'DR of Congo - Mobile COCHTL','MOB','cod'),(276,'DR of Congo - Mobile Others','MOB','cod'),(277,'DR of Congo - Mobile Sait','MOB','cod'),(278,'DR of Congo - Mobile TATEM','MOB','cod'),(279,'DR of Congo - Mobile Vodacom','MOB','cod'),(280,'DR of Congo - Mobility Services','NGN','cod'),(281,'DR of Congo - Special Services','NGN','cod'),(282,'East Timor - Fixed','FIX','tmp'),(283,'East Timor - Mobile','MOB','tmp'),(284,'East Timor - Mobile TELKOMCEL','MOB','tmp'),(285,'Ecuador - Fixed','FIX','ecu'),(286,'Ecuador - Fixed Quito','FIX','ecu'),(287,'Ecuador - Mobile Otecel','MOB','ecu'),(288,'Ecuador - Mobile Others','MOB','ecu'),(289,'Ecuador - Mobile Porta','MOB','ecu'),(290,'Egypt - Fixed','FIX','egy'),(291,'Egypt - Mobile','MOB','egy'),(292,'Egypt - Mobile Etisalat','MOB','egy'),(293,'El Salvador - Fixed','FIX','slv'),(294,'El Salvador - Mobile','MOB','slv'),(295,'El Salvador - Mobile Claro','MOB','slv'),(296,'El Salvador - Mobile Digicel','MOB','slv'),(297,'El Salvador - Mobile Saltel','MOB','slv'),(298,'El Salvador - Mobile Telemovil','MOB','slv'),(299,'Emsat','NGN','ems'),(300,'Emsat Special Services','NGN','ems'),(301,'Equatorial Guinea - Fixed','FIX','gnq'),(302,'Equatorial Guinea - Fixed Greencom','FIX','gnq'),(303,'Equatorial Guinea - Mobile','MOB','gnq'),(304,'Equatorial Guinea- Mobile Greencom','MOB','gnq'),(305,'Equatorial Guinea- Mobile Orange','MOB','gnq'),(306,'Eritrea - Fixed','FIX','eri'),(307,'Eritrea - Mobile','MOB','eri'),(308,'Estonia - Fixed','FIX','est'),(309,'Estonia - Mobile EMT','MOB','est'),(310,'Estonia - Mobile Others','MOB','est'),(311,'Estonia - Mobile Radiolinja','MOB','est'),(312,'Estonia - Mobile Tele2','MOB','est'),(313,'Estonia - Mobility Services','NGN','est'),(314,'Estonia - Special Services','NGN','est'),(315,'Ethiopia - Fixed','FIX','eth'),(316,'Ethiopia - Fixed Addis Abeba','FIX','eth'),(317,'Ethiopia - Mobile','MOB','eth'),(318,'Ethiopia - Mobile ETA Addis Abeba','MOB','eth'),(319,'Faeroe - Fixed','FIX','fro'),(320,'Faeroe - Mobile','MOB','fro'),(321,'Falkland Islands - Fixed','FIX','flk'),(322,'Falkland Islands - Mobile','MOB','flk'),(323,'Fiji - Fixed','FIX','fji'),(324,'Fiji - Mobile','MOB','fji'),(325,'Finland - Fixed','FIX','fin'),(326,'Finland - Mobile Finnet','MOB','fin'),(327,'Finland - Mobile Others','MOB','fin'),(328,'Finland - Mobile Sonera','MOB','fin'),(329,'Finland - Mobility Services','NGN','fin'),(330,'Finland - Personal Numbering','NGN','fin'),(331,'Finland - Special Services','NGN','fin'),(332,'France - Fixed','FIX','fra'),(333,'France - Fixed ILIAD','FIX','fra'),(334,'France - Fixed OLO','FIX','fra'),(335,'France - Fixed OLO Zone 1','FIX','fra'),(336,'France - Fixed OLO Zone 2','FIX','fra'),(337,'France - Fixed OLO Zone 3','FIX','fra'),(338,'France - Fixed OLO Zone 4','FIX','fra'),(339,'France - Fixed OLO Zone 5','FIX','fra'),(340,'France - Fixed OLO Zone 6','FIX','fra'),(341,'France - Fixed OLO Zone 7','FIX','fra'),(342,'France - Fixed Paris','FIX','fra'),(343,'France - Mobile Bouygues','MOB','fra'),(344,'France - Mobile Free','MOB','fra'),(345,'France - Mobile Globalstar','MOB','fra'),(346,'France - Mobile NRJ','MOB','fra'),(347,'France - Mobile Orange','MOB','fra'),(348,'France - Mobile Others','MOB','fra'),(349,'France - Mobile SFR','MOB','fra'),(350,'France - Mobile Virgin','MOB','fra'),(351,'France - Special services','NGN','fra'),(352,'French Guiana - Fixed','FIX','guf'),(353,'French Guiana - Mobile Digicel','MOB','guf'),(354,'French Guiana - Mobile Orange','MOB','guf'),(355,'French Guiana - Mobile Others','MOB','guf'),(356,'French Guiana - Mobile Outremer','MOB','guf'),(357,'French Polynesia - Fixed','FIX','pyf'),(358,'French Polynesia - Mobile','MOB','pyf'),(359,'Gabon - Fixed','FIX','gab'),(360,'Gabon - Mobile','MOB','gab'),(361,'Gabon - Mobile CELTEL','MOB','gab'),(362,'Gabon - Mobile TELCEL','MOB','gab'),(363,'Gabon - Mobile Usan','MOB','gab'),(364,'Gambia - Fixed','FIX','gmb'),(365,'Gambia - Mobile','MOB','gmb'),(366,'Georgia - Fixed','FIX','geo'),(367,'Georgia - Fixed Tbilisi','FIX','geo'),(368,'Georgia - Mobile Geocell','MOB','geo'),(369,'Georgia - Mobile Magtikom','MOB','geo'),(370,'Georgia - Mobile Others','MOB','geo'),(371,'Georgia - Special services','NGN','geo'),(372,'Germany - Fixed','FIX','deu'),(373,'Germany - Fixed Dusseldorf','FIX','deu'),(374,'Germany - Fixed Frankfurt','FIX','deu'),(375,'Germany - IP Phone','NGN','deu'),(376,'Germany - Mobile Eplus','MOB','deu'),(377,'Germany - Mobile O2','MOB','deu'),(378,'Germany - Mobile Others','MOB','deu'),(379,'Germany - Mobile T-Mobile','MOB','deu'),(380,'Germany - Mobile Vodafone D2','MOB','deu'),(381,'Germany - Personal Numbering','NGN','deu'),(382,'Germany - Special Services','NGN','deu'),(383,'Ghana - Fixed','FIX','gha'),(384,'Ghana - Mobile','MOB','gha'),(385,'Ghana - Mobile Ghanat','MOB','gha'),(386,'Ghana - Mobile Glomob','MOB','gha'),(387,'Ghana - Mobile Millicom','MOB','gha'),(388,'Ghana - Mobile MTN','MOB','gha'),(389,'Ghana - Mobile Zain','MOB','gha'),(390,'Gibraltar - Fixed','FIX','gib'),(391,'Gibraltar - Mobile','MOB','gib'),(392,'Global Mobile Satellite System Ellipso','MOB','el3'),(393,'Globalstar TYPE_A','NGN','gs8'),(394,'Greece - Fixed','FIX','grc'),(395,'Greece - Fixed Athens','FIX','grc'),(396,'Greece - Mobile Cosmote','MOB','grc'),(397,'Greece - Mobile Vodafone','MOB','grc'),(398,'Greece - Mobile Wind','MOB','grc'),(399,'Greenland - Fixed','FIX','grl'),(400,'Greenland - Mobile','MOB','grl'),(401,'Grenada - Fixed','FIX','grd'),(402,'Grenada - Mobile Digicel','MOB','grd'),(403,'Grenada - Mobile Others','MOB','grd'),(404,'Grenada - Special Services','NGN','grd'),(405,'Guadeloupe - Fixed','FIX','glp'),(406,'Guadeloupe - Mobile Digicel','MOB','glp'),(407,'Guadeloupe - Mobile Orange','MOB','glp'),(408,'Guadeloupe - Mobile Others','MOB','glp'),(409,'Guadeloupe - Mobile Outre Mer Telecom','MOB','glp'),(410,'Guam','NGN','gum'),(411,'Guatemala - Fixed','FIX','gtm'),(412,'Guatemala - Mobile','MOB','gtm'),(413,'Guatemala - Mobile COMCEL','MOB','gtm'),(414,'Guatemala - Mobile PCS','MOB','gtm'),(415,'Guatemala - Mobile TELEFONICA','MOB','gtm'),(416,'Guinea - Fixed','FIX','gin'),(417,'Guinea - Mobile CELCOM','MOB','gin'),(418,'Guinea - Mobile GAMMA','MOB','gin'),(419,'Guinea - Mobile INTCEL','MOB','gin'),(420,'Guinea - Mobile MAI','MOB','gin'),(421,'Guinea - Mobile MTN','MOB','gin'),(422,'Guinea - Mobile Orange','MOB','gin'),(423,'Guinea - Mobility services','NGN','gin'),(424,'Guinea - Special services','NGN','gin'),(425,'Guinea-Bissau - Fixed','FIX','gnb'),(426,'Guinea-Bissau - Mobile MTN','MOB','gnb'),(427,'Guinea-Bissau - Mobile Others','MOB','gnb'),(428,'Guinea-Bissau - Special services','NGN','gnb'),(429,'Guyana - Fixed','FIX','guy'),(430,'Guyana - Mobile Digicel','MOB','guy'),(431,'Guyana - Mobile Others','MOB','guy'),(432,'Haiti - Fixed','FIX','hti'),(433,'Haiti - Fixed Haitel','FIX','hti'),(434,'Haiti - Mobile Digicel','MOB','hti'),(435,'Haiti - Mobile Haitel','MOB','hti'),(436,'Haiti - Mobile Others','MOB','hti'),(437,'Honduras - Fixed','FIX','hnd'),(438,'Honduras - Mobile','MOB','hnd'),(439,'Honduras - Mobile Celtel','MOB','hnd'),(440,'Honduras - Mobile Claro','MOB','hnd'),(441,'Hong Kong - Fixed','FIX','hkg'),(442,'Hong Kong - Mobile CSL','MOB','hkg'),(443,'Hong Kong - Mobile Hutchison','MOB','hkg'),(444,'Hong Kong - Mobile Others','MOB','hkg'),(445,'Hong Kong - Mobile Smartone','MOB','hkg'),(446,'Hungary - Fixed','FIX','hun'),(447,'Hungary - Fixed Budapest','FIX','hun'),(448,'Hungary - Mobile','MOB','hun'),(449,'Hungary - Mobile Pannon','MOB','hun'),(450,'Hungary - Mobile TMobile','MOB','hun'),(451,'Hungary - Mobile Vodafone','MOB','hun'),(452,'Iceland - Fixed','FIX','isl'),(453,'Iceland - Mobile Others','MOB','isl'),(454,'Iceland - Mobile SIMINN','MOB','isl'),(455,'Iceland - Mobile Vodafone','MOB','isl'),(456,'India - Fixed','FIX','ind'),(457,'India - Fixed Ahmadabad','FIX','ind'),(458,'India - Fixed Bangalore','FIX','ind'),(459,'India - Fixed Calcutta','FIX','ind'),(460,'India - Fixed Ernakulam','FIX','ind'),(461,'India - Fixed Gujarat','FIX','ind'),(462,'India - Fixed Hyderabad','FIX','ind'),(463,'India - Fixed Jallandher','FIX','ind'),(464,'India - Fixed Kerala','FIX','ind'),(465,'India - Fixed Madras','FIX','ind'),(466,'India - Fixed Mumbai','FIX','ind'),(467,'India - Fixed New Delhi','FIX','ind'),(468,'India - Fixed Pune','FIX','ind'),(469,'India - Fixed Punjab','FIX','ind'),(470,'India - Fixed Tamil Nadu','FIX','ind'),(471,'India - Mobile AIRCEL','MOB','ind'),(472,'India - Mobile Bharti','MOB','ind'),(473,'India - Mobile BSNL','MOB','ind'),(474,'India - Mobile Idea','MOB','ind'),(475,'India - Mobile Others','MOB','ind'),(476,'India - Mobile Reliance','MOB','ind'),(477,'India - Mobile Tata','MOB','ind'),(478,'India - Mobile Vodafone','MOB','ind'),(479,'Indonesia - Fixed','FIX','idn'),(480,'Indonesia - Fixed Bandung','FIX','idn'),(481,'Indonesia - Fixed Batam','FIX','idn'),(482,'Indonesia - Fixed Bogor','FIX','idn'),(483,'Indonesia - Fixed Denpasar','FIX','idn'),(484,'Indonesia - Fixed Jakarta','FIX','idn'),(485,'Indonesia - Fixed Malang','FIX','idn'),(486,'Indonesia - Fixed Medan','FIX','idn'),(487,'Indonesia - Fixed Surabaya','FIX','idn'),(488,'Indonesia - Mobile Exelcom','MOB','idn'),(489,'Indonesia - Mobile Indosat','MOB','idn'),(490,'Indonesia - Mobile Others','MOB','idn'),(491,'Indonesia - Mobile Satellite','MOB','idn'),(492,'Indonesia - Mobile Telkomsel','MOB','idn'),(493,'Inmarsat AERO SNAC','NGN','xnm'),(494,'Inmarsat B (SNAC) Except Pacific','NGN','xnm'),(495,'Inmarsat BGAN HSD SNAC','NGN','xnm'),(496,'Inmarsat BGAN SNAC','NGN','xnm'),(497,'Inmarsat HSD SNAC Except Pacific','NGN','xnm'),(498,'Inmarsat M (SNAC) Except Pacific','NGN','xnm'),(499,'Inmarsat M4 SNAC','NGN','xnm'),(500,'Inmarsat Mini-M (SNAC) Except Pacific','NGN','xnm'),(501,'International Networks - AeroMobile','MOB','ico'),(502,'International Networks - DTAG','NGN','ico'),(503,'International Networks - Ellipso','NGN','el3'),(504,'International Networks - Global Networks','NGN','ico'),(505,'International Networks - Inphon','NGN','ico'),(506,'International Networks - Intermatica','NGN','ico'),(507,'International Networks - Mobistar','NGN','ico'),(508,'International Networks - MTT','NGN','ico'),(509,'International Networks - SEANET','NGN','ico'),(510,'International Networks - Special Services DTAG','NGN','ico'),(511,'International Networks - Special Services GLONET','NGN','ico'),(512,'International Networks - Telenor','NGN','ico'),(513,'International Networks - VODAFO','NGN','ico'),(514,'International Networks - VOXBON','NGN','ico'),(515,'International Networks Navita','NGN','ico'),(516,'International Networks Onair','NGN','ico'),(517,'International Networks Oration Technologies','NGN','ico'),(518,'Iran - Fixed','FIX','irn'),(519,'Iran - Fixed Tehran','FIX','irn'),(520,'Iran - Mobile','MOB','irn'),(521,'Iran - Mobile MTN','MOB','irn'),(522,'Iraq - Fixed','FIX','irq'),(523,'Iraq - Fixed Baghdad','FIX','irq'),(524,'Iraq - Mobile Asia Cell','MOB','irq'),(525,'Iraq - Mobile Atheer','MOB','irq'),(526,'Iraq - Mobile Korek','MOB','irq'),(527,'Iraq - Mobile Others','MOB','irq'),(528,'Iraq - Mobile Sana','MOB','irq'),(529,'Iraq - Special services','NGN','irq'),(530,'Ireland - Fixed','FIX','irl'),(531,'Ireland - Mobile','MOB','irl'),(532,'Ireland - Mobile H3G','MOB','irl'),(533,'Ireland - Mobile Meteor','MOB','irl'),(534,'Ireland - Mobile O2','MOB','irl'),(535,'Ireland - Mobile TESCO','MOB','irl'),(536,'Ireland - Mobile Vodafone','MOB','irl'),(537,'Ireland - Special Services','NGN','irl'),(538,'Iridium','NGN','iri'),(539,'Israel - Fixed','FIX','isr'),(540,'Israel - Fixed Palestine','FIX','isr'),(541,'Israel - Mobile Cellcom','MOB','isr'),(542,'Israel - Mobile Others','MOB','isr'),(543,'Israel - Mobile Palestine','MOB','isr'),(544,'Israel - Mobile Partner','MOB','isr'),(545,'Italy - Fixed','FIX','ita'),(546,'Italy - Mobile Elsacom','MOB','ita'),(547,'Italy - Mobile H3G','MOB','ita'),(548,'Italy - Mobile INTERM','MOB','ita'),(549,'Italy - Mobile Others','MOB','ita'),(550,'Italy - Mobile Tim','MOB','ita'),(551,'Italy - Mobile Vodafone Omnitel','MOB','ita'),(552,'Italy - Mobile Wind','MOB','ita'),(553,'Ivory Coast - Fixed','FIX','civ'),(554,'Ivory Coast - Fixed MTN','FIX','civ'),(555,'Ivory Coast - Mobile COMIUM','MOB','civ'),(556,'Ivory Coast - Mobile Moov','MOB','civ'),(557,'Ivory Coast - Mobile MTN','MOB','civ'),(558,'Ivory Coast - Mobile Orange','MOB','civ'),(559,'Ivory Coast - Mobile Oricel','MOB','civ'),(560,'Ivory Coast - Mobile Others','MOB','civ'),(561,'Ivory Coast - Special Services','NGN','civ'),(562,'Jamaica - Fixed','FIX','jam'),(563,'Jamaica - Mobile CW','MOB','jam'),(564,'Jamaica - Mobile Digicel','MOB','jam'),(565,'Japan - Fixed','FIX','jpn'),(566,'Japan - IP Phone','NGN','jpn'),(567,'Japan - Mobile','MOB','jpn'),(568,'Japan - Mobile Docomo','MOB','jpn'),(569,'Jordan - Fixed','FIX','jor'),(570,'Jordan - Mobile Fastlink','MOB','jor'),(571,'Jordan - Mobile Mobilecom','MOB','jor'),(572,'Jordan - Mobile Others','MOB','jor'),(573,'Jordan - Mobile Umniah','MOB','jor'),(574,'Kazakhstan - Fixed','FIX','kaz'),(575,'Kazakhstan - Fixed Almaty','FIX','kaz'),(576,'Kazakhstan - Fixed Astana','FIX','kaz'),(577,'Kazakhstan - Fixed Karaganda','FIX','kaz'),(578,'Kazakhstan - Fixed OLO','FIX','kaz'),(579,'Kazakhstan - Mobile','MOB','kaz'),(580,'Kazakhstan - Mobile KARTEL','MOB','kaz'),(581,'Kazakhstan - Mobile KCELL','MOB','kaz'),(582,'Kazakhstan - Mobility services','NGN','kaz'),(583,'Kazakhstan - Special services','NGN','kaz'),(584,'Kenya - Fixed','FIX','ken'),(585,'Kenya - Mobile CELTEL','MOB','ken'),(586,'Kenya - Mobile Econet','MOB','ken'),(587,'Kenya - Mobile Others','MOB','ken'),(588,'Kenya - Mobile Safaricom','MOB','ken'),(589,'Kenya - Special services','NGN','ken'),(590,'Kiribati','NGN','kir'),(591,'Kuwait - Fixed','FIX','kwt'),(592,'Kuwait - Mobile','MOB','kwt'),(593,'Kuwait - Mobile MTC','MOB','kwt'),(594,'Kuwait - Mobile UCC','MOB','kwt'),(595,'Kyrgyzstan - Fixed','FIX','kgz'),(596,'Kyrgyzstan - Fixed Bishkek','FIX','kgz'),(597,'Kyrgyzstan - Mobile','MOB','kgz'),(598,'Kyrgyzstan - Mobile AYSAT','MOB','kgz'),(599,'Kyrgyzstan - Mobile Bimokom','MOB','kgz'),(600,'Kyrgyzstan - Mobile Nurtel','MOB','kgz'),(601,'Laos - Fixed','FIX','lao'),(602,'Laos - Mobile','MOB','lao'),(603,'Latvia - Fixed','FIX','lva'),(604,'Latvia - Fixed OLO','FIX','lva'),(605,'Latvia - Fixed Riga','FIX','lva'),(606,'Latvia - Mobile Baltija','MOB','lva'),(607,'Latvia - Mobile Bite','MOB','lva'),(608,'Latvia - Mobile CAMEL','MOB','lva'),(609,'Latvia - Mobile LMT','MOB','lva'),(610,'Latvia - Mobile Master','MOB','lva'),(611,'Latvia - Mobile Others','MOB','lva'),(612,'Latvia - Mobile Tele2','MOB','lva'),(613,'Latvia - Mobility services','NGN','lva'),(614,'Latvia - Special services','NGN','lva'),(615,'Lebanon - Fixed','FIX','lbn'),(616,'Lebanon - Mobile','MOB','lbn'),(617,'Lesotho - Fixed','FIX','lso'),(618,'Lesotho - Mobile ECONET','MOB','lso'),(619,'Lesotho - Mobile Vodacom','MOB','lso'),(620,'Liberia - Fixed','FIX','lbr'),(621,'Liberia - Mobile','MOB','lbr'),(622,'Liberia - Mobile Cellcom','MOB','lbr'),(623,'Liberia - Mobile Comium','MOB','lbr'),(624,'Liberia - Mobile MTN','MOB','lbr'),(625,'Liberia - Mobility services','NGN','lbr'),(626,'Liberia - Special services','NGN','lbr'),(627,'Libya - Fixed','FIX','lby'),(628,'Libya - Mobile','MOB','lby'),(629,'Liechtenstein - Fixed','FIX','lie'),(630,'Liechtenstein - Mobile','MOB','lie'),(631,'Liechtenstein - Mobile Type A','MOB','lie'),(632,'Liechtenstein - Mobility Services','NGN','lie'),(633,'Liechtenstein - Special Services','NGN','lie'),(634,'Liechtenstein - Voice Mail','NGN','lie'),(635,'Lithuania - Fixed','FIX','ltu'),(636,'Lithuania - Mobile BITE','MOB','ltu'),(637,'Lithuania - Mobile Omnitel','MOB','ltu'),(638,'Lithuania - Mobile Others','MOB','ltu'),(639,'Lithuania - Mobile Tele2','MOB','ltu'),(640,'Lithuania - Mobility Services','NGN','ltu'),(641,'Lithuania - Special Services','NGN','ltu'),(642,'Luxemburg - Fixed','FIX','lux'),(643,'Luxemburg - Mobile LUX Gsm','MOB','lux'),(644,'Luxemburg - Mobile Others','MOB','lux'),(645,'Luxemburg - Mobile Tangom','MOB','lux'),(646,'Luxemburg - Mobile Vox','MOB','lux'),(647,'Luxemburg - Non Geographical Number','NGN','lux'),(648,'Macao - Fixed','FIX','mac'),(649,'Macao - Mobile Others','MOB','mac'),(650,'Macedonia - Fixed','FIX','mkd'),(651,'Macedonia - Fixed Cosmofon','FIX','mkd'),(652,'Macedonia - Fixed Skopje','FIX','mkd'),(653,'Macedonia - Mobile Cosmofon','MOB','mkd'),(654,'Macedonia - Mobile Mobimak','MOB','mkd'),(655,'Macedonia - Mobile Others','MOB','mkd'),(656,'Macedonia - Special services','NGN','mkd'),(657,'Madagascar - Fixed','FIX','mdg'),(658,'Madagascar - Mobile','MOB','mdg'),(659,'Madagascar - Mobile Madacom','MOB','mdg'),(660,'Madagascar - Mobile Orange','MOB','mdg'),(661,'Madagascar - Mobility Services','NGN','mdg'),(662,'Madagascar - Special Services B','NGN','mdg'),(663,'Madagascar - Special Services TYPE_A','NGN','mdg'),(664,'Malawi - Fixed','FIX','mwi'),(665,'Malawi - Mobile','MOB','mwi'),(666,'Malawi - Mobile Access','MOB','mwi'),(667,'Malawi - Mobile Celtel','MOB','mwi'),(668,'Malaysia - Fixed','FIX','mys'),(669,'Malaysia - Mobile Celcom','MOB','mys'),(670,'Malaysia - Mobile Digi','MOB','mys'),(671,'Malaysia - Mobile Maxis','MOB','mys'),(672,'Malaysia - Mobile Others','MOB','mys'),(673,'Maldives - Fixed','FIX','mdv'),(674,'Maldives - Mobile Dhiraagu','MOB','mdv'),(675,'Maldives - Mobile Wataniya','MOB','mdv'),(676,'Maldives - Mobility services','NGN','mdv'),(677,'Maldives - Mobility Services Type A','NGN','mdv'),(678,'Maldives - Special Services TYPE_A','NGN','mdv'),(679,'Mali - Fixed','FIX','mli'),(680,'Mali - Fixed Bamako','FIX','mli'),(681,'Mali - Mobile Ikatel','MOB','mli'),(682,'Mali - Mobile Others','MOB','mli'),(683,'Malta - Fixed','FIX','mlt'),(684,'Malta - Mobile Others','MOB','mlt'),(685,'Malta - Mobile Vodafone','MOB','mlt'),(686,'Maritime Communications Partner','NGN','ico'),(687,'Marshall Islands','NGN','mhl'),(688,'Martinique - Fixed','FIX','mtq'),(689,'Martinique - Mobile Digicel','MOB','mtq'),(690,'Martinique - Mobile Orange','MOB','mtq'),(691,'Martinique - Mobile Others','MOB','mtq'),(692,'Martinique - Mobile Outre Mer Telecom','MOB','mtq'),(693,'Mauritania - Fixed CHITEL','FIX','mrt'),(694,'Mauritania - Mobile CHINGUITEL','MOB','mrt'),(695,'Mauritania - Mobile MATTEL','MOB','mrt'),(696,'Mauritania - Mobile MAURITEL','MOB','mrt'),(697,'Mauritania','NGN','mrt'),(698,'Mauritius - Fixed','FIX','mus'),(699,'Mauritius - Mobile Emtel','MOB','mus'),(700,'Mauritius - Mobile Others','MOB','mus'),(701,'Mayotte - Fixed','FIX','myt'),(702,'Mayotte - Mobile','MOB','myt'),(703,'Mexico - Equal Access','NGN','mex'),(704,'Mexico - Fixed','FIX','mex'),(705,'Mexico - Guadalajara','NGN','mex'),(706,'Mexico - Mobile','MOB','mex'),(707,'Mexico Mexico City - Fixed','FIX','mex'),(708,'Mexico Monterrey - Fixed','FIX','mex'),(709,'Micronesia','NGN','fsm'),(710,'Moldova - Fixed','FIX','mda'),(711,'Moldova - Fixed Pridnestrovje','FIX','mda'),(712,'Moldova - Mobile Moldcell','MOB','mda'),(713,'Moldova - Mobile Moldtelecom','MOB','mda'),(714,'Moldova - Mobile Others','MOB','mda'),(715,'Moldova - Mobile Voxtel','MOB','mda'),(716,'Moldova - Special Services','NGN','mda'),(717,'Monaco - Fixed','FIX','mco'),(718,'Monaco - Fixed OLO','FIX','mco'),(719,'Monaco - Mobile','MOB','mco'),(720,'Monaco - Mobile Kosovo','MOB','mco'),(721,'Monaco - Special services','NGN','mco'),(722,'Mongolia - Fixed','FIX','mng'),(723,'Mongolia - Mobile','MOB','mng'),(724,'Montenegro - Fixed','FIX','mbx'),(725,'Montenegro - Mobile','MOB','mbx'),(726,'Montenegro - Mobile MTEL','MOB','mbx'),(727,'Montenegro - Mobile PROMON','MOB','mbx'),(728,'Montenegro - Special services TYPE A','NGN','mbx'),(729,'Montenegro - Special services TYPE B','NGN','mbx'),(730,'Montserrat - Fixed','FIX','msr'),(731,'Montserrat - Mobile','MOB','msr'),(732,'Morocco - Fixed','FIX','mar'),(733,'Morocco - Fixed Meditel','FIX','mar'),(734,'Morocco - Fixed Wana','FIX','mar'),(735,'Morocco - Mobile Hourri','MOB','mar'),(736,'Morocco - Mobile Meditelecom','MOB','mar'),(737,'Morocco - Mobile Others','MOB','mar'),(738,'Morocco - Mobile WANA','MOB','mar'),(739,'Morocco - Mobile WANA Far Zone','MOB','mar'),(740,'Morocco - Mobility services','NGN','mar'),(741,'Mozambique - Fixed','FIX','moz'),(742,'Mozambique - Mobile Movitel','MOB','moz'),(743,'Mozambique - Mobile Others','MOB','moz'),(744,'Mozambique - Mobile Vodacom','MOB','moz'),(745,'Myanmar - Fixed','FIX','mmr'),(746,'Myanmar - Mobile','MOB','mmr'),(747,'Myanmar - Mobility Services','NGN','mmr'),(748,'Namibia - Fixed','FIX','nam'),(749,'Namibia - Mobile','MOB','nam'),(750,'Nauru','NGN','nru'),(751,'Nepal - Fixed','FIX','npl'),(752,'Nepal - Fixed Kathmandu','FIX','npl'),(753,'Nepal - Mobile','MOB','npl'),(754,'Nepal - Mobile SPICE','MOB','npl'),(755,'Netherlands - Fixed','FIX','nld'),(756,'Netherlands - Mobil','NGN','nld'),(757,'Netherlands - Mobile Lyca','MOB','nld'),(758,'Netherlands - Mobile O2','MOB','nld'),(759,'Netherlands - Mobile Others','MOB','nld'),(760,'Netherlands - Mobile T-Mobile','MOB','nld'),(761,'Netherlands - Mobile TELE2','MOB','nld'),(762,'Netherlands - Mobile Tismi','MOB','nld'),(763,'Netherlands - Mobile Vodafone','MOB','nld'),(764,'Netherlands - Special Services','NGN','nld'),(765,'Netherlands Antilles - Fixed','FIX','ant'),(766,'Netherlands Antilles - Mobile','MOB','ant'),(767,'Netherlands Antilles - Mobile Digicel','MOB','ant'),(768,'Netherlands Antilles - Sint maarten','NGN','ant'),(769,'New Caledonia - Fixed','FIX','ncl'),(770,'New Caledonia - Mobile','MOB','ncl'),(771,'New Zealand - Fixed','FIX','nzl'),(772,'New Zealand - Mobile Others','MOB','nzl'),(773,'New Zealand - Mobile Vodafone','MOB','nzl'),(774,'Nicaragua - Fixed','FIX','nic'),(775,'Nicaragua - Mobile Others','MOB','nic'),(776,'Nicaragua - Mobile Telefonica','MOB','nic'),(777,'Nicaragua - Mobility services','NGN','nic'),(778,'Niger - Fixed','FIX','ner'),(779,'Niger - Mobile','MOB','ner'),(780,'Niger - Mobile Celtel','MOB','ner'),(781,'Niger - Mobile Orange','MOB','ner'),(782,'Niger - Mobile Telecel','MOB','ner'),(783,'Niger - Special Services','NGN','ner'),(784,'Nigeria - Fixed','FIX','nga'),(785,'Nigeria - Fixed MTN','FIX','nga'),(786,'Nigeria - Mobile Celtel','MOB','nga'),(787,'Nigeria - Mobile Etisalat','MOB','nga'),(788,'Nigeria - Mobile Globacom','MOB','nga'),(789,'Nigeria - Mobile MTN','MOB','nga'),(790,'Nigeria - Mobile Others','MOB','nga'),(791,'Nigeria - Mobile Visafone','MOB','nga'),(792,'Niue','NGN','niu'),(793,'Norfolk','NGN','nfk'),(794,'North Korea','NGN','prk'),(795,'Norway - Fixed','FIX','nor'),(796,'Norway - Mobile Netcom','MOB','nor'),(797,'Norway - Mobile Network','MOB','nor'),(798,'Norway - Mobile Others','MOB','nor'),(799,'Norway - Mobile Tele2','MOB','nor'),(800,'Norway - Mobile Telenor','MOB','nor'),(801,'Norway - Special Services','NGN','nor'),(802,'Oman - Fixed','FIX','omn'),(803,'Oman - Fixed Nawras','FIX','omn'),(804,'Oman - Mobile','MOB','omn'),(805,'Oman - Mobile Nawras','MOB','omn'),(806,'Pakistan - Fixed','FIX','pak'),(807,'Pakistan - Fixed Islamabad','FIX','pak'),(808,'Pakistan - Fixed Karachi','FIX','pak'),(809,'Pakistan - Fixed Lahore','FIX','pak'),(810,'Pakistan - Mobile','MOB','pak'),(811,'Palau','NGN','plw'),(812,'Palestine - Fixed','FIX','pse'),(813,'Palestine - Mobile','MOB','pse'),(814,'Panama - Fixed','FIX','pan'),(815,'Panama - Mobile','MOB','pan'),(816,'Panama - Mobile CW','MOB','pan'),(817,'Panama - Mobile Digicel','MOB','pan'),(818,'Panama - Mobile Telefonica','MOB','pan'),(819,'Papua New Guinea - Fixed','FIX','png'),(820,'Papua New Guinea - Mobile','MOB','png'),(821,'Papua New Guinea - Mobile Digicel','MOB','png'),(822,'Papua New Guinea - Special services','NGN','png'),(823,'Paraguay - Fixed','FIX','pry'),(824,'Paraguay - Mobile','MOB','pry'),(825,'Paraguay - Mobile Personal','MOB','pry'),(826,'Paraguay - Mobile TELCEL','MOB','pry'),(827,'Peru - Fixed','FIX','per'),(828,'Peru - Fixed Lima','FIX','per'),(829,'Peru - High Cost','NGN','per'),(830,'Peru - Mobile','MOB','per'),(831,'Peru - Mobile Claro','MOB','per'),(832,'Peru - Mobile Telefonica','MOB','per'),(833,'Peru - Rural','NGN','per'),(834,'Philippines - Fixed','FIX','phl'),(835,'Philippines - Fixed Bayantel','FIX','phl'),(836,'Philippines - Fixed Digitel','FIX','phl'),(837,'Philippines - Fixed Globetel','FIX','phl'),(838,'Philippines - Fixed PLDT','FIX','phl'),(839,'Philippines - Mobile Digitel','MOB','phl'),(840,'Philippines - Mobile Globetel','MOB','phl'),(841,'Philippines - Mobile Others','MOB','phl'),(842,'Philippines - Mobile Smart','MOB','phl'),(843,'Poland - Fixed','FIX','pol'),(844,'Poland - Fixed POLTEL Warsaw','FIX','pol'),(845,'Poland - Fixed POLTEL Zone 1','FIX','pol'),(846,'Poland - Fixed POLTEL Zone 2','FIX','pol'),(847,'Poland - Fixed POLTEL Zone 3','FIX','pol'),(848,'Poland - Fixed POLTEL Zone 4','FIX','pol'),(849,'Poland - Fixed POLTEL Zone 5','FIX','pol'),(850,'Poland - Fixed POLTEL Zone 6','FIX','pol'),(851,'Poland - Fixed POLTEL Zone 7','FIX','pol'),(852,'Poland - Fixed POLTEL Zone 8','FIX','pol'),(853,'Poland - Fixed Warsaw','FIX','pol'),(854,'Poland - Mobile Centernet','MOB','pol'),(855,'Poland - Mobile Centertel','MOB','pol'),(856,'Poland - Mobile Era','MOB','pol'),(857,'Poland - Mobile Others','MOB','pol'),(858,'Poland - Mobile P4','MOB','pol'),(859,'Poland - Mobile Polkomtel','MOB','pol'),(860,'Poland - Special services','NGN','pol'),(861,'Portugal - Fixed Marconi Zone 1','FIX','prt'),(862,'Portugal - Fixed Marconi Zone 2','FIX','prt'),(863,'Portugal - Fixed Marconi Zone 3','FIX','prt'),(864,'Portugal - Fixed Marconi Zone 4','FIX','prt'),(865,'Portugal - Fixed Marconi Zone 5','FIX','prt'),(866,'Portugal - Fixed Novis','FIX','prt'),(867,'Portugal - Fixed OLO','FIX','prt'),(868,'Portugal - Fixed ONI','FIX','prt'),(869,'Portugal - Madeira and Azores','NGN','prt'),(870,'Portugal - Mobile Optimus','MOB','prt'),(871,'Portugal - Mobile Others','MOB','prt'),(872,'Portugal - Mobile TMN','MOB','prt'),(873,'Portugal - Mobile Vodafone Telecel','MOB','prt'),(874,'Puerto Rico','NGN','pri'),(875,'Qatar - Fixed','FIX','qat'),(876,'Qatar - Mobile','MOB','qat'),(877,'Qatar - Mobile Vodafo','MOB','qat'),(878,'Reunion - Fixed','FIX','reu'),(879,'Reunion - Mobile Orange','MOB','reu'),(880,'Reunion - Mobile Others','MOB','reu'),(881,'Reunion - Mobile SRR','MOB','reu'),(882,'Romania - fixed COSMOT','FIX','rou'),(883,'Romania - fixed MOBFON','FIX','rou'),(884,'Romania - fixed ORANGE','FIX','rou'),(885,'Romania - Fixed','FIX','rou'),(886,'Romania - Fixed Astral','FIX','rou'),(887,'Romania - Fixed Bucharest','FIX','rou'),(888,'Romania - Fixed OLO Zone1','FIX','rou'),(889,'Romania - Fixed OLO Zone2','FIX','rou'),(890,'Romania - Fixed Rodasy','FIX','rou'),(891,'Romania - Mobile COSMOT','MOB','rou'),(892,'Romania - Mobile Enigma','MOB','rou'),(893,'Romania - Mobile Mobifon','MOB','rou'),(894,'Romania - Mobile Orange','MOB','rou'),(895,'Romania - Mobile Others','MOB','rou'),(896,'Romania - Mobile Romtelecom','MOB','rou'),(897,'Romania - Mobile Telemobil','MOB','rou'),(898,'Romania - Special Services','NGN','rou'),(899,'Romania - Special Services Mediafon','NGN','rou'),(900,'Romania - Special Services Rodasy','NGN','rou'),(901,'Romania - Special Services Type D','NGN','rou'),(902,'Russia - Abkhazia','NGN','rus'),(903,'Russia - Far Zone','NGN','rus'),(904,'Russia - Fixed','FIX','rus'),(905,'Russia - Fixed 1','FIX','rus'),(906,'Russia - Fixed 2','FIX','rus'),(907,'Russia - Fixed Moscow','FIX','rus'),(908,'Russia - Fixed St Petersburg','FIX','rus'),(909,'Russia - Mobile','MOB','rus'),(910,'Russia - Mobile Abkhazia','MOB','rus'),(911,'Russia - Mobile Global','MOB','rus'),(912,'Russia - Mobile Megafon','MOB','rus'),(913,'Russia - Mobile MTS','MOB','rus'),(914,'Russia - Mobile Rostel','MOB','rus'),(915,'Russia - Mobile Vympelcom','MOB','rus'),(916,'Russia - South Ossetia','NGN','rus'),(917,'Rwanda - Fixed','FIX','rwa'),(918,'Rwanda - Fixed MTN','FIX','rwa'),(919,'Rwanda - Mobile AIRTEL','MOB','rwa'),(920,'Rwanda - Mobile MTN','MOB','rwa'),(921,'Rwanda - Mobile Others','MOB','rwa'),(922,'Rwanda - Mobile Tigo','MOB','rwa'),(923,'Saint Kitts and Nevis - Fixed','FIX','kna'),(924,'Saint Kitts and Nevis - Mobile Digicel','MOB','kna'),(925,'Saint Kitts and Nevis - Mobile Others','MOB','kna'),(926,'Saint Lucia - Fixed','FIX','lca'),(927,'Saint Lucia - Mobile Digicel','MOB','lca'),(928,'Saint Lucia - Mobile Others','MOB','lca'),(929,'Saint Vincent and the Grenadines - Fixed','FIX','vct'),(930,'Saint Vincent and the Grenadines - Mobile Digicel','MOB','vct'),(931,'Saint Vincent and the Grenadines - Mobile Others','MOB','vct'),(932,'Saipan','NGN','usa'),(933,'San Marino - Fixed','FIX','smr'),(934,'San Marino - Fixed TISM','FIX','smr'),(935,'San Marino - Mobile SMT','MOB','smr'),(936,'San Marino - Special services Type A','NGN','smr'),(937,'San Marino - Special services Type B','NGN','smr'),(938,'Sao Tome & Principe - Fixed','FIX','stp'),(939,'Sao Tome & Principe - Mobile','MOB','stp'),(940,'Saudi Arabia - Fixed','FIX','sau'),(941,'Saudi Arabia - Fixed Atheeb','FIX','sau'),(942,'Saudi Arabia - Fixed Riyad','FIX','sau'),(943,'Saudi Arabia - Mobile Mobily','MOB','sau'),(944,'Saudi Arabia - Mobile Others','MOB','sau'),(945,'Saudi Arabia - Mobile ZAIN','MOB','sau'),(946,'Senegal - Fixed','FIX','sen'),(947,'Senegal - Fixed Expresso','FIX','sen'),(948,'Senegal - Mobile Orange','MOB','sen'),(949,'Senegal - Mobile Others','MOB','sen'),(950,'Senegal - Mobile Sentel','MOB','sen'),(951,'Serbia - Fixed  Belgrade','FIX','scg'),(952,'Serbia - Fixed','FIX','scg'),(953,'Kosovo - Fixed IPKO','FIX','kos'),(954,'Kosovo - Fixed','FIX','kos'),(955,'Serbia - Fixed Orion','FIX','scg'),(956,'Serbia - Mobile MOBTEL','MOB','scg'),(957,'Serbia - Mobile Others','MOB','scg'),(958,'Serbia - Mobile Vipnet','MOB','scg'),(959,'Serbia - Special services','NGN','scg'),(960,'Serbia - Special services YUGTEL','NGN','scg'),(961,'Seychelles - Mobil','NGN','syc'),(962,'Seychelles - Mobile Airtel','MOB','syc'),(963,'Seychelles - Mobile Smartcom','MOB','syc'),(964,'Seychelles - Special services','NGN','syc'),(965,'Seychelles','NGN','syc'),(966,'Sierra Leone - Fixed','FIX','sle'),(967,'Sierra Leone - Mobile','MOB','sle'),(968,'Singapore - Fixed','FIX','sgp'),(969,'Singapore - Fixed Starhub','FIX','sgp'),(970,'Singapore - Mobile MobileOne','MOB','sgp'),(971,'Singapore - Mobile Others','MOB','sgp'),(972,'Singapore - Mobile Singtel','MOB','sgp'),(973,'Singapore - Mobile Starhub','MOB','sgp'),(974,'SIerra Leone - Special Services','NGN','sle'),(975,'Slovakia - Fixed','FIX','svk'),(976,'Slovakia - Mobile Eurotel','MOB','svk'),(977,'Slovakia - Mobile O2','MOB','svk'),(978,'Slovakia - Mobile Orange','MOB','svk'),(979,'Slovakia - Mobile Others','MOB','svk'),(980,'Slovenia - Fixed','FIX','svn'),(981,'Slovenia - Fixed IPKO','FIX','svn'),(982,'Slovenia - Fixed Type A','FIX','svn'),(983,'Slovenia - Fixed Type B','FIX','svn'),(984,'Slovenia - Mobile IPKO','MOB','svn'),(985,'Slovenia - Mobile Mobitel','MOB','svn'),(986,'Slovenia - Mobile Others','MOB','svn'),(987,'Slovenia - Mobile Simobil','MOB','svn'),(988,'Slovenia - Mobile Tusmobile','MOB','svn'),(989,'Slovenia - Special services','NGN','svn'),(990,'Solomon Islands - Fixed','FIX','slb'),(991,'Solomon Islands - Mobile','MOB','slb'),(992,'Somalia - Fixed Others','FIX','som'),(993,'Somalia - Fixed Telcom','FIX','som'),(994,'Somalia - GOLIS','NGN','som'),(995,'Somalia - Hormuud','NGN','som'),(996,'Somalia - Mobile','MOB','som'),(997,'Somalia - Mobile Somafone','MOB','som'),(998,'Somalia - Mobility Services','NGN','som'),(999,'Somalia - Special Services','NGN','som'),(1000,'Somalia - TELESO','NGN','som'),(1001,'South Africa - Fixed','FIX','zaf'),(1002,'South Africa - Fixed MTN Business VoIP','FIX','zaf'),(1003,'South Africa - Fixed OLO','FIX','zaf'),(1004,'South Africa - Mobile Cell-C','MOB','zaf'),(1005,'South Africa - Mobile MTN','MOB','zaf'),(1006,'South Africa - Mobile others','MOB','zaf'),(1007,'South Africa - Mobile TELKOM','MOB','zaf'),(1008,'South Africa - Mobile Vodacom','MOB','zaf'),(1009,'South Africa - Special Services','NGN','zaf'),(1010,'South Korea - Fixed','FIX','kor'),(1011,'South Korea - Mobile','MOB','kor'),(1012,'South Korea - Mobile KTF','MOB','kor'),(1013,'South Korea - Mobile SK','MOB','kor'),(1014,'South Sudan - Fixed','FIX','ssd'),(1015,'South Sudan - Mobile','MOB','ssd'),(1016,'South Sudan - Mobile GEMTEL','MOB','ssd'),(1017,'South Sudan - Mobile MTN','MOB','ssd'),(1018,'South Sudan - Mobile VIVCEL','MOB','ssd'),(1019,'South Sudan - Mobile ZAIN','MOB','ssd'),(1020,'Spain - Fixed','FIX','esp'),(1021,'Spain - Mobile ORANGE','MOB','esp'),(1022,'Spain - Mobile Others','MOB','esp'),(1023,'Spain - Mobile Telefonica','MOB','esp'),(1024,'Spain - Mobile Vodafone','MOB','esp'),(1025,'Spain - Mobile Xfera','MOB','esp'),(1026,'Spain - Special Services','NGN','esp'),(1027,'Sri Lanka - Fixed','FIX','lka'),(1028,'Sri Lanka - Fixed MTN','FIX','lka'),(1029,'Sri Lanka - Fixed SLT','FIX','lka'),(1030,'Sri Lanka - Mobile Bharti','MOB','lka'),(1031,'Sri Lanka - Mobile Celtel','MOB','lka'),(1032,'Sri Lanka - Mobile Dialog Telekom','MOB','lka'),(1033,'Sri Lanka - Mobile Mobitel','MOB','lka'),(1034,'Sri Lanka - Mobile Others','MOB','lka'),(1035,'St Helena','NGN','shn'),(1036,'St Pierre & Miquelon - Fixed','FIX','spm'),(1037,'St Pierre & Miquelon - Mobile','MOB','spm'),(1038,'Sudan - Fixed KANAR','FIX','sdn'),(1039,'Sudan - Fixed Sudatel','FIX','sdn'),(1040,'Sudan - Mobile MTN','MOB','sdn'),(1041,'Sudan - Mobile Sudani','MOB','sdn'),(1042,'Sudan - Mobile Zain','MOB','sdn'),(1043,'Sudan - Special services','NGN','sdn'),(1044,'Suriname - Mobile Digicel','MOB','sur'),(1045,'Suriname - Mobile Others','MOB','sur'),(1046,'Suriname','NGN','sur'),(1047,'Swaziland - Fixed','FIX','swz'),(1048,'Swaziland - Mobile','MOB','swz'),(1049,'Swaziland - Mobile MTN','MOB','swz'),(1050,'Sweden - Fixed','FIX','swe'),(1051,'Sweden - Fixed Stockholm','FIX','swe'),(1052,'Sweden - Mobile Comviq','MOB','swe'),(1053,'Sweden - Mobile HI3G','MOB','swe'),(1054,'Sweden - Mobile Others','MOB','swe'),(1055,'Sweden - Mobile Telia','MOB','swe'),(1056,'Sweden - Mobile Vodafone','MOB','swe'),(1057,'Switzerland - Fixed','FIX','che'),(1058,'Switzerland - Mobile Lycatel','MOB','che'),(1059,'Switzerland - Mobile Orange','MOB','che'),(1060,'Switzerland - Mobile Others','MOB','che'),(1061,'Switzerland - Mobile Sunrise','MOB','che'),(1062,'Switzerland - Mobile Swisscom','MOB','che'),(1063,'Syria - Fixed','FIX','syr'),(1064,'Syria - Mobile','MOB','syr'),(1065,'Syria - Mobile MTN','MOB','syr'),(1066,'Taiwan - Fixed','FIX','twn'),(1067,'Taiwan - Mobile Chungwa','MOB','twn'),(1068,'Taiwan - Mobile FarEastTone','MOB','twn'),(1069,'Taiwan - Mobile Others','MOB','twn'),(1070,'Taiwan - Mobile Taiwan Mobile','MOB','twn'),(1071,'Taiwan - Mobile Vibo','MOB','twn'),(1072,'Taiwan - Mobility services','NGN','twn'),(1073,'Tajikistan - Fixed','FIX','tjk'),(1074,'Tajikistan - Mobile','MOB','tjk'),(1075,'Tajikistan - Mobile Babilon','MOB','tjk'),(1076,'Tajikistan - Mobile Indigo','MOB','tjk'),(1077,'Tajikistan - Mobile M-teko','MOB','tjk'),(1078,'Tajikistan - Mobile Tacom','MOB','tjk'),(1079,'Tajikistan - Mobile Telecom Ink','MOB','tjk'),(1080,'Tajikistan - Mobile TK Mobile','MOB','tjk'),(1081,'Tajikistan - Mobile Tojiktelecom','MOB','tjk'),(1082,'Tajikistan - Mobile TT-Mobile','MOB','tjk'),(1083,'Tajikistan - Special services','NGN','tjk'),(1084,'Tanzania - Fixed','FIX','tza'),(1085,'Tanzania - Mobile Celtza','MOB','tza'),(1086,'Tanzania - Mobile Mobtel','MOB','tza'),(1087,'Tanzania - Mobile Others','MOB','tza'),(1088,'Tanzania - Mobile Vodacom','MOB','tza'),(1089,'Tanzania - Mobile Zantel','MOB','tza'),(1090,'Telecommunications for Disaster Relief','NGN','ico'),(1091,'Thailand - Fixed','FIX','tha'),(1092,'Thailand - Mobile  AIS','MOB','tha'),(1093,'Thailand - Mobile','MOB','tha'),(1094,'Thailand - Mobile DTAC','MOB','tha'),(1095,'Thuraya Satellite Telecom','NGN','thu'),(1096,'Togo - Fixed','FIX','tgo'),(1097,'Togo - Interactive TV','NGN','tgo'),(1098,'Togo - Mobile','MOB','tgo'),(1099,'Togo - Mobile ATL','MOB','tgo'),(1100,'Tokelau','NGN','tkl'),(1101,'Tonga - Fixed','FIX','ton'),(1102,'Tonga - Mobile','MOB','ton'),(1103,'Trinidad & Tobago - Fixed','FIX','tto'),(1104,'Trinidad and Tobago - Mobile Digicel','MOB','tto'),(1105,'Trinidad and Tobago - Mobile Others','MOB','tto'),(1106,'Tunisia - Fixed','FIX','tun'),(1107,'Tunisia - Fixed ORANGE','FIX','tun'),(1108,'Tunisia - Mobile','MOB','tun'),(1109,'Tunisia - Mobile Orascom','MOB','tun'),(1110,'Tunisia - Mobile ORANGE','MOB','tun'),(1111,'Tunisia - Special Services','NGN','tun'),(1112,'Turkey - 444 Services','NGN','tur'),(1113,'Turkey - Fixed','FIX','tur'),(1114,'Turkey - Fixed Adana','FIX','tur'),(1115,'Turkey - Fixed Ankara','FIX','tur'),(1116,'Turkey - Fixed Antalya','FIX','tur'),(1117,'Turkey - Fixed Istanbul','FIX','tur'),(1118,'Turkey - Fixed Izmir','FIX','tur'),(1119,'Turkey - Mobile Aycell','MOB','tur'),(1120,'Turkey - Mobile Others','MOB','tur'),(1121,'Turkey - Mobile Telsim','MOB','tur'),(1122,'Turkey - Mobile Telsim Northern Cyprus','MOB','tur'),(1123,'Turkey - Mobile Turkcell','MOB','tur'),(1124,'Turkey - Mobile Turkcell Northern Cyprus','MOB','tur'),(1125,'Turkey - Mobility services','NGN','tur'),(1126,'Turkey - Nomadic Services','NGN','tur'),(1127,'Turkey - Northern Cyprus','NGN','tur'),(1128,'Turkmenistan - Fixed','FIX','tkm'),(1129,'Turkmenistan - Mobile','MOB','tkm'),(1130,'Turks and Caicos - Fixed','FIX','tca'),(1131,'Turks and Caicos - Mobile','MOB','tca'),(1132,'Turks and Caicos - Mobile Digicel','MOB','tca'),(1133,'Tuvalu','NGN','tuv'),(1134,'Uganda - Fixed','FIX','uga'),(1135,'Uganda - Fixed MTN','FIX','uga'),(1136,'Uganda - Fixed Smile','FIX','uga'),(1137,'Uganda - Fixed Warid','FIX','uga'),(1138,'Uganda - Mobile','MOB','uga'),(1139,'Uganda - Mobile Celtel','MOB','uga'),(1140,'Uganda - Mobile Gemtel','MOB','uga'),(1141,'Uganda - Mobile MTN','MOB','uga'),(1142,'Uganda - Mobile Orange','MOB','uga'),(1143,'Uganda - Mobile Smile','MOB','uga'),(1144,'Uganda - Mobile UGATEL','MOB','uga'),(1145,'Uganda - Mobile Warid','MOB','uga'),(1146,'Uganda - Special services','NGN','uga'),(1147,'Ukraine - Fixed','FIX','ukr'),(1148,'Ukraine - Fixed Dniepropetrovsk','FIX','ukr'),(1149,'Ukraine - Fixed Kharkiv','FIX','ukr'),(1150,'Ukraine - Fixed Kiev','FIX','ukr'),(1151,'Ukraine - Fixed Lviv','FIX','ukr'),(1152,'Ukraine - Fixed Odessa','FIX','ukr'),(1153,'Ukraine - Mobile Astelit','MOB','ukr'),(1154,'Ukraine - Mobile INTTEL','MOB','ukr'),(1155,'Ukraine - Mobile Kyivstar','MOB','ukr'),(1156,'Ukraine - Mobile Others','MOB','ukr'),(1157,'Ukraine - Mobile UMC','MOB','ukr'),(1158,'Ukraine - Special Services','NGN','ukr'),(1159,'United Arab Emirates - Fixed','FIX','are'),(1160,'United Arab Emirates - Fixed Sanacom','FIX','are'),(1161,'United Arab Emirates - Mobile DU','MOB','are'),(1162,'United Arab Emirates - Mobile Others','MOB','are'),(1163,'United Kingdom - Corporate Numbering','NGN','gbr'),(1164,'United Kingdom - Fixed','FIX','gbr'),(1165,'United Kingdom - Fixed London','FIX','gbr'),(1166,'United Kingdom - Fixed Wide numbers','FIX','gbr'),(1167,'United Kingdom - Local Calls','NGN','gbr'),(1168,'United Kingdom - Mobile H3G','MOB','gbr'),(1169,'United Kingdom - Mobile Lyca','MOB','gbr'),(1170,'United Kingdom - Mobile O2','MOB','gbr'),(1171,'United Kingdom - Mobile Orange','MOB','gbr'),(1172,'United Kingdom - Mobile Others','MOB','gbr'),(1173,'United Kingdom - Mobile T-mobile','MOB','gbr'),(1174,'United Kingdom - Mobile Tismi','MOB','gbr'),(1175,'United Kingdom - Mobile Vodafone','MOB','gbr'),(1176,'United Kingdom - Mobility services TISMIB','NGN','gbr'),(1177,'United Kingdom - National Calls','NGN','gbr'),(1178,'United Kingdom - Personal Numbers','NGN','gbr'),(1179,'United KIngdom - Mobile Alternative','MOB','gbr'),(1180,'United States - 800','NGN','usa'),(1181,'United States - Fixed Alaska','FIX','usa'),(1182,'United States - Fixed Hawaii','FIX','usa'),(1183,'United States','NGN','usa'),(1184,'United States Virgin Islands','NGN','usa'),(1185,'Universal Personal Telecommunications - TPG','NGN','ico'),(1186,'Uruguay - Fixed','FIX','ury'),(1187,'Uruguay - Mobile','MOB','ury'),(1188,'Uzbekistan - Fixed','FIX','uzb'),(1189,'Uzbekistan - Fixed Tashkent','FIX','uzb'),(1190,'Uzbekistan - Mobile','MOB','uzb'),(1191,'Vanuatu - Fixed','FIX','vut'),(1192,'Vanuatu - Mobile','MOB','vut'),(1193,'Venezuela - Fixed','FIX','ven'),(1194,'Venezuela - Fixed Caracas','FIX','ven'),(1195,'Venezuela - Mobile','MOB','ven'),(1196,'Venezuela - Mobile Digitel','MOB','ven'),(1197,'Venezuela - Mobile Movilnet','MOB','ven'),(1198,'Venezuela - Mobile Movistar','MOB','ven'),(1199,'Viet Nam - Fixed','FIX','vnm'),(1200,'Viet Nam - Fixed Hanoi','FIX','vnm'),(1201,'Viet Nam - Fixed Ho Chi Minh','FIX','vnm'),(1202,'Viet Nam - Mobile Others','MOB','vnm'),(1203,'Viet Nam - Mobile Vietel','MOB','vnm'),(1204,'Wallis and Futuna - Fixed','FIX','wlf'),(1205,'Wallis and Futuna - Mobile','MOB','wlf'),(1206,'Western Samoa - Fixed','FIX','wsm'),(1207,'Western Samoa - Mobile','MOB','wsm'),(1208,'Yemen - Fixed','FIX','yem'),(1209,'Yemen - Mobile','MOB','yem'),(1210,'Yemen - Mobile MTN','MOB','yem'),(1211,'Yemen - Mobile Sabafon','MOB','yem'),(1212,'Yemen - Mobile Yementel','MOB','yem'),(1213,'Zambia - Fixed','FIX','zmb'),(1214,'Zambia - Mobile Celtel','MOB','zmb'),(1215,'Zambia - Mobile MTN','MOB','zmb'),(1216,'Zambia - Mobile Zamtel','MOB','zmb'),(1217,'Zimbabwe - Fixed','FIX','zwe'),(1218,'Zimbabwe - Mobile Econet','MOB','zwe'),(1219,'Zimbabwe - Mobile Netone','MOB','zwe'),(1220,'Zimbabwe - Mobile Others','MOB','zwe'),(1221,'Vatican City','FIX','vat'),(1222,'Northern Mariana Islands','FIX','mnp'),(1223,'Christmas Island','FIX','cxr'),(1224,'Cocos (Keeling) Islands','FIX','CCK');
/*!40000 ALTER TABLE `destinationgroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `destinations`
--

DROP TABLE IF EXISTS `destinations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `destinations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `prefix` varchar(50) NOT NULL,
  `direction_code` varchar(20) DEFAULT NULL,
  `subcode` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `lata` varchar(255) DEFAULT NULL,
  `tier` int(11) DEFAULT NULL,
  `ocn` varchar(255) DEFAULT NULL,
  `destinationgroup_id` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `prefix` (`prefix`),
  KEY `id` (`id`),
  KEY `destinations_direction_code_index` (`direction_code`),
  KEY `destinationgroup_id` (`destinationgroup_id`)
) ENGINE=InnoDB AUTO_INCREMENT=36903 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `destinations`
--

LOCK TABLES `destinations` WRITE;
/*!40000 ALTER TABLE `destinations` DISABLE KEYS */;
INSERT INTO `destinations` VALUES (36587,'1500','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36588,'1501','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36589,'1502','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36590,'1503','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36591,'1504','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36592,'1505','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36593,'1507','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36594,'1508','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36595,'1509','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36596,'1510','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36597,'1512','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36598,'1513','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36599,'1515','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36600,'1516','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36601,'1517','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36602,'1518','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36603,'1520','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36604,'1530','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36605,'1531','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36606,'1533','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36607,'1534','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36608,'1539','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36609,'1540','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36610,'1541','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36611,'1544','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36612,'1551','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36613,'1559','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36614,'1561','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36615,'1562','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36616,'1563','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36617,'1566','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36618,'1567','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36619,'1570','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36620,'1571','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36621,'1573','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36622,'1574','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36623,'1575','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36624,'1580','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36625,'1585','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36626,'1586','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36627,'1601','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36628,'1602','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36629,'1603','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36630,'1605','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36631,'1606','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36632,'1607','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36633,'1608','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36634,'1609','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36635,'1610','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36636,'1612','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36637,'1614','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36638,'1615','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36639,'1616','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36640,'1617','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36641,'1618','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36642,'1619','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36643,'1620','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36644,'1623','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36645,'1626','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36646,'1630','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36647,'1631','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36648,'1636','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36649,'1641','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36650,'1646','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36651,'1650','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36652,'1651','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36653,'1657','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36654,'1660','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36655,'1661','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36656,'1662','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36657,'1667','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36658,'1669','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36659,'1678','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36660,'1681','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36661,'1682','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36662,'1700','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36663,'1701','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36664,'1702','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36665,'1703','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36666,'1704','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36667,'1706','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36668,'1707','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36669,'1708','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36670,'1710','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36671,'1712','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36672,'1713','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36673,'1714','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36674,'1715','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36675,'1716','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36676,'1717','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36677,'1718','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36678,'1719','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36679,'1720','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36680,'1724','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36681,'1727','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36682,'1731','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36683,'1732','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36684,'1734','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36685,'1737','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36686,'1740','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36687,'1747','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36688,'1754','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36689,'1757','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36690,'1760','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36691,'1762','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36692,'1763','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36693,'1765','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36694,'1769','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36695,'1770','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36696,'1772','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36697,'1773','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36698,'1774','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36699,'1775','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36700,'1779','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36701,'1781','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36702,'1785','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36703,'1786','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36704,'1801','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36705,'1802','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36706,'1803','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36707,'1804','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36708,'1805','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36709,'1806','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36710,'1810','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36711,'1812','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36712,'1813','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36713,'1814','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36714,'1815','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36715,'1816','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36716,'1817','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36717,'1818','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36718,'1828','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36719,'1830','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36720,'1831','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36721,'1832','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36722,'1843','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36723,'1845','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36724,'1847','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36725,'1848','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36726,'1850','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36727,'1856','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36728,'1857','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36729,'1858','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36730,'1859','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36731,'1860','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36732,'1862','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36733,'1863','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36734,'1864','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36735,'1865','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36736,'1870','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36737,'1872','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36738,'1878','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36739,'1900','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36740,'1901','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36741,'1903','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36742,'1904','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36743,'1906','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36744,'1908','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36745,'1909','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36746,'1910','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36747,'1912','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36748,'1913','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36749,'1914','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36750,'1915','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36751,'1916','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36752,'1917','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36753,'1918','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36754,'1919','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36755,'1920','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36756,'1925','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36757,'1928','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36758,'1929','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36759,'1931','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36760,'1936','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36761,'1937','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36762,'1938','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36763,'1940','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36764,'1941','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36765,'1947','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36766,'1949','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36767,'1951','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36768,'1952','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36769,'1954','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36770,'1956','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36771,'1970','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36772,'1971','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36773,'1972','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36774,'1973','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36775,'1978','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36776,'1979','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36777,'1980','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36778,'1984','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36779,'1985','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36780,'1989','USA','NGN','United States',NULL,NULL,NULL,NULL,NULL,1183),(36781,'1340','VIR','NGN','United States Virgin Islands',NULL,NULL,NULL,NULL,NULL,1184),(36782,'878','INN','NGN','Universal Personal Telecommunications - TPG',NULL,NULL,NULL,NULL,NULL,1185),(36783,'598','URY','FIX','Uruguay - Fixed',NULL,NULL,NULL,NULL,NULL,1186),(36784,'5989','URY','MOB','Uruguay - Mobile',NULL,NULL,NULL,NULL,NULL,1187),(36785,'998','UZB','FIX','Uzbekistan - Fixed',NULL,NULL,NULL,NULL,NULL,1188),(36786,'998711','UZB','FIX','Uzbekistan - Fixed Tashkent',NULL,NULL,NULL,NULL,NULL,1189),(36787,'998712','UZB','FIX','Uzbekistan - Fixed Tashkent',NULL,NULL,NULL,NULL,NULL,1189),(36788,'998713','UZB','FIX','Uzbekistan - Fixed Tashkent',NULL,NULL,NULL,NULL,NULL,1189),(36789,'9989','UZB','MOB','Uzbekistan - Mobile',NULL,NULL,NULL,NULL,NULL,1190),(36790,'678','VUT','FIX','Vanuatu - Fixed',NULL,NULL,NULL,NULL,NULL,1191),(36791,'67853','VUT','MOB','Vanuatu - Mobile',NULL,NULL,NULL,NULL,NULL,1192),(36792,'67854','VUT','MOB','Vanuatu - Mobile',NULL,NULL,NULL,NULL,NULL,1192),(36793,'67855','VUT','MOB','Vanuatu - Mobile',NULL,NULL,NULL,NULL,NULL,1192),(36794,'67856','VUT','MOB','Vanuatu - Mobile',NULL,NULL,NULL,NULL,NULL,1192),(36795,'678572','VUT','MOB','Vanuatu - Mobile',NULL,NULL,NULL,NULL,NULL,1192),(36796,'678573','VUT','MOB','Vanuatu - Mobile',NULL,NULL,NULL,NULL,NULL,1192),(36797,'678574','VUT','MOB','Vanuatu - Mobile',NULL,NULL,NULL,NULL,NULL,1192),(36798,'678575','VUT','MOB','Vanuatu - Mobile',NULL,NULL,NULL,NULL,NULL,1192),(36799,'67859','VUT','MOB','Vanuatu - Mobile',NULL,NULL,NULL,NULL,NULL,1192),(36800,'67870','VUT','MOB','Vanuatu - Mobile',NULL,NULL,NULL,NULL,NULL,1192),(36801,'67871','VUT','MOB','Vanuatu - Mobile',NULL,NULL,NULL,NULL,NULL,1192),(36802,'67873','VUT','MOB','Vanuatu - Mobile',NULL,NULL,NULL,NULL,NULL,1192),(36803,'67874','VUT','MOB','Vanuatu - Mobile',NULL,NULL,NULL,NULL,NULL,1192),(36804,'67875','VUT','MOB','Vanuatu - Mobile',NULL,NULL,NULL,NULL,NULL,1192),(36805,'67876','VUT','MOB','Vanuatu - Mobile',NULL,NULL,NULL,NULL,NULL,1192),(36829,'67877','VUT','MOB','Vanuatu - Mobile',NULL,NULL,NULL,NULL,NULL,1192),(36830,'58','VEN','FIX','Venezuela - Fixed',NULL,NULL,NULL,NULL,NULL,1193),(36831,'58212','VEN','FIX','Venezuela - Fixed Caracas',NULL,NULL,NULL,NULL,NULL,1194),(36832,'5841','VEN','MOB','Venezuela - Mobile',NULL,NULL,NULL,NULL,NULL,1195),(36833,'58412','VEN','MOB','Venezuela - Mobile Digitel',NULL,NULL,NULL,NULL,NULL,1196),(36834,'58416','VEN','MOB','Venezuela - Mobile Movilnet',NULL,NULL,NULL,NULL,NULL,1197),(36835,'58426','VEN','MOB','Venezuela - Mobile Movilnet',NULL,NULL,NULL,NULL,NULL,1197),(36836,'58414','VEN','MOB','Venezuela - Mobile Movistar',NULL,NULL,NULL,NULL,NULL,1198),(36837,'58424','VEN','MOB','Venezuela - Mobile Movistar',NULL,NULL,NULL,NULL,NULL,1198),(36838,'84','VNM','FIX','Viet Nam - Fixed',NULL,NULL,NULL,NULL,NULL,1199),(36839,'844','VNM','FIX','Viet Nam - Fixed Hanoi',NULL,NULL,NULL,NULL,NULL,1200),(36840,'848','VNM','FIX','Viet Nam - Fixed Ho Chi Minh',NULL,NULL,NULL,NULL,NULL,1201),(36841,'8412','VNM','MOB','Viet Nam - Mobile Others',NULL,NULL,NULL,NULL,NULL,1202),(36842,'84186','VNM','MOB','Viet Nam - Mobile Others',NULL,NULL,NULL,NULL,NULL,1202),(36843,'84188','VNM','MOB','Viet Nam - Mobile Others',NULL,NULL,NULL,NULL,NULL,1202),(36844,'84199','VNM','MOB','Viet Nam - Mobile Others',NULL,NULL,NULL,NULL,NULL,1202),(36845,'8490','VNM','MOB','Viet Nam - Mobile Others',NULL,NULL,NULL,NULL,NULL,1202),(36846,'8491','VNM','MOB','Viet Nam - Mobile Others',NULL,NULL,NULL,NULL,NULL,1202),(36847,'8492','VNM','MOB','Viet Nam - Mobile Others',NULL,NULL,NULL,NULL,NULL,1202),(36848,'8493','VNM','MOB','Viet Nam - Mobile Others',NULL,NULL,NULL,NULL,NULL,1202),(36849,'8494','VNM','MOB','Viet Nam - Mobile Others',NULL,NULL,NULL,NULL,NULL,1202),(36850,'8495','VNM','MOB','Viet Nam - Mobile Others',NULL,NULL,NULL,NULL,NULL,1202),(36851,'84993','VNM','MOB','Viet Nam - Mobile Others',NULL,NULL,NULL,NULL,NULL,1202),(36852,'84994','VNM','MOB','Viet Nam - Mobile Others',NULL,NULL,NULL,NULL,NULL,1202),(36853,'84995','VNM','MOB','Viet Nam - Mobile Others',NULL,NULL,NULL,NULL,NULL,1202),(36854,'84996','VNM','MOB','Viet Nam - Mobile Others',NULL,NULL,NULL,NULL,NULL,1202),(36855,'84162','VNM','MOB','Viet Nam - Mobile Vietel',NULL,NULL,NULL,NULL,NULL,1203),(36856,'84163','VNM','MOB','Viet Nam - Mobile Vietel',NULL,NULL,NULL,NULL,NULL,1203),(36857,'84164','VNM','MOB','Viet Nam - Mobile Vietel',NULL,NULL,NULL,NULL,NULL,1203),(36858,'84165','VNM','MOB','Viet Nam - Mobile Vietel',NULL,NULL,NULL,NULL,NULL,1203),(36859,'84166','VNM','MOB','Viet Nam - Mobile Vietel',NULL,NULL,NULL,NULL,NULL,1203),(36860,'84167','VNM','MOB','Viet Nam - Mobile Vietel',NULL,NULL,NULL,NULL,NULL,1203),(36861,'84168','VNM','MOB','Viet Nam - Mobile Vietel',NULL,NULL,NULL,NULL,NULL,1203),(36862,'84169','VNM','MOB','Viet Nam - Mobile Vietel',NULL,NULL,NULL,NULL,NULL,1203),(36863,'8496','VNM','MOB','Viet Nam - Mobile Vietel',NULL,NULL,NULL,NULL,NULL,1203),(36864,'8497','VNM','MOB','Viet Nam - Mobile Vietel',NULL,NULL,NULL,NULL,NULL,1203),(36865,'8498','VNM','MOB','Viet Nam - Mobile Vietel',NULL,NULL,NULL,NULL,NULL,1203),(36866,'681','WLF','FIX','Wallis and Futuna - Fixed',NULL,NULL,NULL,NULL,NULL,1204),(36867,'68150','WLF','MOB','Wallis and Futuna - Mobile',NULL,NULL,NULL,NULL,NULL,1205),(36868,'68168','WLF','MOB','Wallis and Futuna - Mobile',NULL,NULL,NULL,NULL,NULL,1205),(36869,'681728','WLF','MOB','Wallis and Futuna - Mobile',NULL,NULL,NULL,NULL,NULL,1205),(36870,'685','WSM','FIX','Western Samoa - Fixed',NULL,NULL,NULL,NULL,NULL,1206),(36871,'68572','WSM','MOB','Western Samoa - Mobile',NULL,NULL,NULL,NULL,NULL,1207),(36872,'68575','WSM','MOB','Western Samoa - Mobile',NULL,NULL,NULL,NULL,NULL,1207),(36873,'68576','WSM','MOB','Western Samoa - Mobile',NULL,NULL,NULL,NULL,NULL,1207),(36874,'68577','WSM','MOB','Western Samoa - Mobile',NULL,NULL,NULL,NULL,NULL,1207),(36875,'68584','WSM','MOB','Western Samoa - Mobile',NULL,NULL,NULL,NULL,NULL,1207),(36876,'967','YEM','FIX','Yemen - Fixed',NULL,NULL,NULL,NULL,NULL,1208),(36877,'96770','YEM','MOB','Yemen - Mobile',NULL,NULL,NULL,NULL,NULL,1209),(36878,'96773','YEM','MOB','Yemen - Mobile MTN',NULL,NULL,NULL,NULL,NULL,1210),(36879,'96771','YEM','MOB','Yemen - Mobile Sabafon',NULL,NULL,NULL,NULL,NULL,1211),(36880,'96777','YEM','MOB','Yemen - Mobile Yementel',NULL,NULL,NULL,NULL,NULL,1212),(36881,'260','ZMB','FIX','Zambia - Fixed',NULL,NULL,NULL,NULL,NULL,1213),(36882,'26097','ZMB','MOB','Zambia - Mobile Celtel',NULL,NULL,NULL,NULL,NULL,1214),(36883,'26096','ZMB','MOB','Zambia - Mobile MTN',NULL,NULL,NULL,NULL,NULL,1215),(36884,'26095','ZMB','MOB','Zambia - Mobile Zamtel',NULL,NULL,NULL,NULL,NULL,1216),(36885,'263','ZWE','FIX','Zimbabwe - Fixed',NULL,NULL,NULL,NULL,NULL,1217),(36886,'26377','ZWE','MOB','Zimbabwe - Mobile Econet',NULL,NULL,NULL,NULL,NULL,1218),(36887,'26378','ZWE','MOB','Zimbabwe - Mobile Econet',NULL,NULL,NULL,NULL,NULL,1218),(36888,'26371','ZWE','MOB','Zimbabwe - Mobile Netone',NULL,NULL,NULL,NULL,NULL,1219),(36889,'26373','ZWE','MOB','Zimbabwe - Mobile Others',NULL,NULL,NULL,NULL,NULL,1220),(36893,'379','VAT','FIX','Vatican City',NULL,NULL,NULL,NULL,NULL,1221),(36895,'6189164','CXR','FIX','Christmas Island',NULL,NULL,NULL,NULL,NULL,1223),(36896,'61891008','CXR','FIX','Christmas Island',NULL,NULL,NULL,NULL,NULL,1223),(36897,'61891007','CXR','FIX','Christmas Island',NULL,NULL,NULL,NULL,NULL,1223),(36898,'61891006','CXR','FIX','Christmas Island',NULL,NULL,NULL,NULL,NULL,1223),(36899,'61891010','CCK','FIX','Cocos (Keeling) Islands',NULL,NULL,NULL,NULL,NULL,1224),(36900,'61891011','CCK','FIX','Cocos (Keeling) Islands',NULL,NULL,NULL,NULL,NULL,1224),(36901,'61891012','CCK','FIX','Cocos (Keeling) Islands',NULL,NULL,NULL,NULL,NULL,1224),(36902,'6189162','CCK','FIX','Cocos (Keeling) Islands',NULL,NULL,NULL,NULL,NULL,1224);
/*!40000 ALTER TABLE `destinations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `devicecodecs`
--

DROP TABLE IF EXISTS `devicecodecs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `devicecodecs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `device_id` int(11) NOT NULL DEFAULT '0',
  `codec_id` int(11) NOT NULL DEFAULT '0',
  `priority` int(11) DEFAULT '0' COMMENT 'codec priority for device',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `devicecodecs`
--

LOCK TABLES `devicecodecs` WRITE;
/*!40000 ALTER TABLE `devicecodecs` DISABLE KEYS */;
INSERT INTO `devicecodecs` VALUES (1,1,1,0),(2,1,2,0),(3,1,5,0),(4,1,6,0),(11,6,1,0),(12,6,5,0),(15,7,1,0),(16,7,5,0),(17,4,5,0),(19,5,5,0);
/*!40000 ALTER TABLE `devicecodecs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `devicegroups`
--

DROP TABLE IF EXISTS `devicegroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `devicegroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `address_id` int(11) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `primary` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `devicegroups`
--

LOCK TABLES `devicegroups` WRITE;
/*!40000 ALTER TABLE `devicegroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `devicegroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `devicerules`
--

DROP TABLE IF EXISTS `devicerules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `devicerules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `device_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `enabled` tinyint(4) NOT NULL DEFAULT '1',
  `cut` varchar(255) DEFAULT NULL,
  `add` varchar(255) DEFAULT NULL,
  `minlen` int(11) NOT NULL DEFAULT '1',
  `maxlen` int(11) NOT NULL DEFAULT '100',
  `pr_type` enum('dst','src') DEFAULT 'dst',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `devicerules`
--

LOCK TABLES `devicerules` WRITE;
/*!40000 ALTER TABLE `devicerules` DISABLE KEYS */;
/*!40000 ALTER TABLE `devicerules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `devices`
--

DROP TABLE IF EXISTS `devices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `devices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `host` varchar(100) NOT NULL DEFAULT 'dynamic',
  `secret` varchar(50) NOT NULL,
  `context` varchar(100) NOT NULL,
  `ipaddr` varchar(40) DEFAULT NULL,
  `port` int(11) NOT NULL DEFAULT '0',
  `regseconds` int(11) NOT NULL DEFAULT '0',
  `accountcode` int(11) NOT NULL DEFAULT '0',
  `callerid` varchar(100) DEFAULT NULL,
  `extension` varchar(50) NOT NULL,
  `voicemail_active` tinyint(4) NOT NULL DEFAULT '0',
  `username` varchar(60) NOT NULL,
  `device_type` varchar(20) DEFAULT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `primary_did_id` int(11) NOT NULL DEFAULT '0',
  `works_not_logged` tinyint(4) NOT NULL DEFAULT '1',
  `forward_to` int(11) NOT NULL DEFAULT '0',
  `record` tinyint(4) NOT NULL DEFAULT '0',
  `transfer` varchar(255) NOT NULL DEFAULT 'no',
  `disallow` varchar(255) NOT NULL DEFAULT 'all',
  `allow` varchar(255) NOT NULL DEFAULT 'alaw;ulaw;g729',
  `deny` varchar(255) NOT NULL DEFAULT '0.0.0.0/0.0.0.0',
  `permit` varchar(255) NOT NULL DEFAULT '0.0.0.0/0.0.0.0',
  `nat` enum('yes','no','never','route','force_rport','comedia') DEFAULT 'no',
  `qualify` varchar(10) NOT NULL DEFAULT 'yes',
  `fullcontact` varchar(80) DEFAULT NULL,
  `canreinvite` enum('yes','no','nonat','update','update,nonat') DEFAULT 'no',
  `devicegroup_id` int(11) DEFAULT NULL,
  `dtmfmode` varchar(255) DEFAULT 'rfc2833',
  `callgroup` int(11) DEFAULT NULL,
  `pickupgroup` int(11) DEFAULT NULL,
  `fromuser` varchar(255) DEFAULT NULL,
  `fromdomain` varchar(255) DEFAULT NULL,
  `trustrpid` varchar(255) DEFAULT 'no',
  `sendrpid` varchar(255) DEFAULT 'no',
  `insecure` varchar(255) DEFAULT 'no',
  `progressinband` varchar(255) DEFAULT 'never',
  `videosupport` varchar(255) DEFAULT 'no',
  `location_id` int(11) NOT NULL DEFAULT '1',
  `description` varchar(255) DEFAULT NULL,
  `istrunk` int(11) DEFAULT '0',
  `cid_from_dids` tinyint(4) DEFAULT '0',
  `pin` varchar(255) DEFAULT NULL,
  `tell_balance` tinyint(4) NOT NULL DEFAULT '0',
  `tell_time` tinyint(4) NOT NULL DEFAULT '0',
  `tell_rtime_when_left` int(11) NOT NULL DEFAULT '60',
  `repeat_rtime_every` int(11) NOT NULL DEFAULT '60',
  `t38pt_udptl` enum('no','yes','yes, fec','yes, redundancy','yes, none') DEFAULT 'no',
  `regserver` varchar(255) DEFAULT NULL,
  `ani` tinyint(4) DEFAULT '0',
  `promiscredir` enum('yes','no') DEFAULT 'no',
  `timeout` int(11) DEFAULT '60',
  `process_sipchaninfo` tinyint(4) DEFAULT '0',
  `temporary_id` int(11) DEFAULT NULL,
  `allow_duplicate_calls` int(11) DEFAULT '0',
  `call_limit` int(11) DEFAULT '0',
  `lastms` int(11) DEFAULT '0',
  `faststart` enum('no','yes') DEFAULT 'yes',
  `h245tunneling` enum('no','yes') DEFAULT 'yes',
  `latency` decimal(30,15) DEFAULT '0.000000000000000',
  `grace_time` int(11) DEFAULT '0',
  `recording_to_email` tinyint(4) NOT NULL DEFAULT '0',
  `recording_keep` tinyint(4) NOT NULL DEFAULT '1',
  `recording_email` varchar(50) DEFAULT NULL,
  `record_forced` tinyint(4) DEFAULT '0' COMMENT 'Force recording for this device?',
  `fake_ring` tinyint(4) DEFAULT '0' COMMENT 'Fake ring for this device?',
  `save_call_log` tinyint(4) DEFAULT '0' COMMENT 'Save call log',
  `mailbox` varchar(255) DEFAULT '',
  `server_id` int(11) NOT NULL DEFAULT '1' COMMENT 'points to servers.server_id',
  `enable_mwi` int(11) DEFAULT '0' COMMENT 'MWI enable for device',
  `authuser` varchar(100) DEFAULT '',
  `requirecalltoken` varchar(10) DEFAULT 'no',
  `language` varchar(10) DEFAULT NULL,
  `use_ani_for_cli` tinyint(1) DEFAULT '0',
  `calleridpres` enum('allowed_not_screened','allowed_passed_screen','allowed_failed_screen','allowed','prohib_not_screened','prohib_passed_screen','prohib_failed_screen','prohib','unavailable') DEFAULT NULL,
  `change_failed_code_to` int(11) NOT NULL DEFAULT '0',
  `reg_status` varchar(50) DEFAULT NULL,
  `max_timeout` int(11) DEFAULT '0',
  `forward_did_id` int(11) DEFAULT '0',
  `anti_resale_auto_answer` tinyint(4) NOT NULL DEFAULT '0',
  `qf_tell_balance` tinyint(4) NOT NULL DEFAULT '0',
  `qf_tell_time` tinyint(4) NOT NULL DEFAULT '0',
  `time_limit_per_day` int(11) NOT NULL DEFAULT '0',
  `control_callerid_by_cids` int(11) DEFAULT NULL,
  `callerid_advanced_control` tinyint(4) NOT NULL DEFAULT '0',
  `transport` enum('udp','tcp','udp,tcp','tcp,udp','tls') DEFAULT 'udp',
  `subscribemwi` enum('yes','no') DEFAULT NULL,
  `encryption` enum('yes','no') DEFAULT 'no',
  `block_callerid` int(11) DEFAULT '0',
  `tell_rate` tinyint(4) NOT NULL DEFAULT '0',
  `trunk` enum('no','yes') DEFAULT 'no',
  `proxy_port` int(11) NOT NULL DEFAULT '0',
  `timerb` int(11) DEFAULT NULL,
  `cps_call_limit` int(11) NOT NULL DEFAULT '0',
  `cps_period` int(11) NOT NULL DEFAULT '0',
  `callerid_number_pool_id` int(11) DEFAULT '0',
  `op` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `op_active` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `op_tech_prefix` varchar(50) NOT NULL DEFAULT '',
  `op_routing_algorithm` enum('lcr','quality','profit','weight','percent') NOT NULL DEFAULT 'lcr',
  `op_routing_group_id` int(10) unsigned NOT NULL DEFAULT '0',
  `op_tariff_id` int(10) unsigned NOT NULL DEFAULT '0',
  `op_capacity` int(10) unsigned NOT NULL DEFAULT '500',
  `op_src_regexp` varchar(255) NOT NULL DEFAULT '',
  `op_src_deny_regexp` varchar(255) NOT NULL DEFAULT '',
  `tp` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `tp_active` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `tp_tech_prefix` varchar(50) NOT NULL DEFAULT '',
  `tp_tariff_id` int(10) unsigned NOT NULL DEFAULT '0',
  `tp_capacity` int(10) unsigned NOT NULL DEFAULT '500',
  `tp_src_regexp` varchar(255) NOT NULL DEFAULT '',
  `tp_src_deny_regexp` varchar(255) NOT NULL DEFAULT '',
  `custom_sip_header` varchar(255) DEFAULT NULL,
  `defaultuser` varchar(100) DEFAULT NULL,
  `useragent` varchar(20) DEFAULT NULL,
  `type` enum('friend','user','peer') DEFAULT 'friend',
  `md5secret` varchar(40) DEFAULT NULL,
  `remotesecret` varchar(40) DEFAULT NULL,
  `directmedia` enum('yes','no','nonat','update') DEFAULT NULL,
  `useclientcode` enum('yes','no') DEFAULT NULL,
  `setvar` varchar(40) DEFAULT NULL,
  `amaflags` varchar(40) DEFAULT NULL,
  `callcounter` enum('yes','no') DEFAULT NULL,
  `busylevel` int(11) DEFAULT NULL,
  `allowoverlap` enum('yes','no') DEFAULT NULL,
  `allowsubscribe` enum('yes','no') DEFAULT NULL,
  `maxcallbitrate` int(11) DEFAULT NULL,
  `rfc2833compensate` enum('yes','no') DEFAULT NULL,
  `session-timers` enum('accept','refuse','originate') DEFAULT NULL,
  `session-expires` int(11) DEFAULT NULL,
  `session-minse` int(11) DEFAULT NULL,
  `session-refresher` enum('uac','uas') DEFAULT NULL,
  `t38pt_usertpsource` varchar(40) DEFAULT NULL,
  `regexten` varchar(40) DEFAULT NULL,
  `defaultip` varchar(40) DEFAULT NULL,
  `rtptimeout` int(11) DEFAULT NULL,
  `rtpholdtimeout` int(11) DEFAULT NULL,
  `outboundproxy` varchar(40) DEFAULT NULL,
  `callbackextension` varchar(40) DEFAULT NULL,
  `timert1` int(11) DEFAULT NULL,
  `qualifyfreq` int(11) DEFAULT NULL,
  `constantssrc` enum('yes','no') DEFAULT NULL,
  `contactpermit` varchar(40) DEFAULT NULL,
  `contactdeny` varchar(40) DEFAULT NULL,
  `usereqphone` enum('yes','no') DEFAULT NULL,
  `textsupport` enum('yes','no') DEFAULT NULL,
  `faxdetect` enum('yes','no') DEFAULT NULL,
  `buggymwi` enum('yes','no') DEFAULT NULL,
  `auth` varchar(40) DEFAULT NULL,
  `fullname` varchar(40) DEFAULT NULL,
  `trunkname` varchar(40) DEFAULT NULL,
  `cid_number` varchar(40) DEFAULT NULL,
  `callingpres` enum('allowed_not_screened','allowed_passed_screen','allowed_failed_screen','allowed','prohib_not_screened','prohib_passed_screen','prohib_failed_screen','prohib') DEFAULT NULL,
  `mohinterpret` varchar(40) DEFAULT NULL,
  `mohsuggest` varchar(40) DEFAULT NULL,
  `parkinglot` varchar(40) DEFAULT NULL,
  `hasvoicemail` enum('yes','no') DEFAULT NULL,
  `vmexten` varchar(40) DEFAULT NULL,
  `autoframing` enum('yes','no') DEFAULT NULL,
  `rtpkeepalive` int(11) DEFAULT NULL,
  `call-limit` int(11) DEFAULT NULL,
  `g726nonstandard` enum('yes','no') DEFAULT NULL,
  `ignoresdpversion` enum('yes','no') DEFAULT NULL,
  `allowtransfer` enum('yes','no') DEFAULT NULL,
  `dynamic` enum('yes','no') DEFAULT NULL,
  `copy_name_to_number` tinyint(3) unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`,`id`),
  KEY `name_index` (`name`),
  KEY `server_id_index` (`server_id`),
  KEY `ipaddr` (`ipaddr`,`port`),
  KEY `host` (`host`,`port`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `devices`
--

LOCK TABLES `devices` WRITE;
/*!40000 ALTER TABLE `devices` DISABLE KEYS */;
INSERT INTO `devices` VALUES (2,'101','dynamic','eidhFByUhhitrqspmXlL','mor_local','',5060,0,2,'\"101\" <101>','101',0,'101','SIP',2,0,1,0,0,'no','all','all','0.0.0.0/0.0.0.0','0.0.0.0/0.0.0.0','yes','yes','','no',NULL,'rfc2833',NULL,NULL,NULL,NULL,'no','no',NULL,'never','no',1,'Test Device #1',0,0,NULL,0,0,60,60,'no',NULL,0,'no',60,0,NULL,0,0,0,'yes','yes',0.000000000000000,0,0,1,NULL,0,0,0,'',1,0,'','no',NULL,0,NULL,0,NULL,0,0,0,0,0,0,0,0,'udp','no','no',0,0,'no',5060,NULL,0,0,0,0,0,'','lcr',0,0,500,'','',0,0,'',0,500,'','',NULL,'101',NULL,'friend',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),(4,'ipauthDkKr2xzv','5.9.120.86','','mor','',5060,0,4,'','0ub5bvnv6t',0,'','SIP',-1,0,1,0,0,'no','all','g729','0.0.0.0/0.0.0.0','0.0.0.0/0.0.0.0','yes','no','','no',NULL,'rfc2833',NULL,NULL,NULL,NULL,'yes','no','port,invite','never','no',1,NULL,1,0,NULL,0,0,60,60,'no',NULL,0,'no',60,0,NULL,0,0,0,'yes','yes',0.000000000000000,0,0,1,NULL,0,0,0,'',1,0,'','no','en',0,NULL,0,NULL,0,0,0,0,0,0,0,0,'udp','no','no',0,0,'no',5060,NULL,0,0,0,0,0,'','lcr',0,0,500,'','',0,0,'',0,500,'','','','',NULL,'friend',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),(5,'ipauth8wXXCbJg','5.9.120.86','','mor','',5060,0,5,'','3dbh80sqjf',0,'','SIP',-1,0,1,0,0,'no','all','g729','0.0.0.0/0.0.0.0','0.0.0.0/0.0.0.0','yes','no','','no',NULL,'rfc2833',NULL,NULL,NULL,NULL,'yes','no','port,invite','never','no',1,NULL,1,0,NULL,0,0,60,60,'no',NULL,0,'no',60,0,NULL,0,0,0,'yes','yes',0.000000000000000,0,0,1,NULL,0,0,0,'',1,0,'','no','en',0,NULL,0,'Unmonitored',0,0,0,0,0,0,0,0,'udp','no','no',0,0,'no',5060,NULL,0,0,0,0,0,'','lcr',0,0,500,'','',0,0,'',0,500,'','','','',NULL,'friend',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),(6,'prov6','0.0.0.0','please_change','mor','0.0.0.0',5060,0,6,'','vtkg42rg65',0,'prov','SIP',-1,0,1,0,0,'no','all','alaw;ulaw;g729','0.0.0.0/0.0.0.0','0.0.0.0/0.0.0.0','no','yes',NULL,'no',NULL,'rfc2833',NULL,NULL,NULL,NULL,'yes','no','port,invite','never','no',1,NULL,0,0,NULL,0,0,60,60,'no',NULL,0,'no',60,0,NULL,0,0,0,'yes','yes',0.000000000000000,0,0,0,NULL,0,0,0,'',1,0,'','no',NULL,0,NULL,0,NULL,0,0,0,0,0,0,NULL,0,'udp',NULL,'no',0,0,'no',0,NULL,0,0,0,0,0,'','lcr',0,0,500,'','',0,0,'',0,500,'','',NULL,'prov',NULL,'friend',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0);
/*!40000 ALTER TABLE `devices` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`mor`@`localhost`*/ /*!50003 TRIGGER validate_device_insert BEFORE INSERT ON devices FOR EACH ROW SET NEW.callgroup = IF(NEW.callgroup < 0 OR NEW.callgroup > 63, NULL, NEW.callgroup) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `defuser` BEFORE UPDATE ON `devices` 
FOR EACH ROW 
BEGIN 
SET NEW.callgroup = IF(NEW.callgroup < 0 OR NEW.callgroup > 63, OLD.callgroup, NEW.callgroup);
IF LENGTH(NEW.username) THEN
SET NEW.defaultuser = NEW.username;
END IF; 
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `devicetypes`
--

DROP TABLE IF EXISTS `devicetypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `devicetypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `ast_name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `devicetypes`
--

LOCK TABLES `devicetypes` WRITE;
/*!40000 ALTER TABLE `devicetypes` DISABLE KEYS */;
INSERT INTO `devicetypes` VALUES (1,'SIP','SIP'),(2,'IAX2','IAX2'),(3,'H323','OOH323'),(4,'dahdi','dahdi'),(5,'Virtual','Virtual');
/*!40000 ALTER TABLE `devicetypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dialplans`
--

DROP TABLE IF EXISTS `dialplans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dialplans` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dptype` varchar(255) DEFAULT NULL,
  `data1` varchar(255) DEFAULT NULL,
  `data2` varchar(255) DEFAULT NULL,
  `data3` varchar(255) DEFAULT NULL,
  `data4` varchar(255) DEFAULT NULL,
  `data5` varchar(255) DEFAULT NULL,
  `data6` varchar(255) DEFAULT NULL,
  `data7` varchar(255) DEFAULT NULL,
  `data8` varchar(255) DEFAULT NULL,
  `sound_file_id` int(11) DEFAULT '0' COMMENT 'which file to play when dialplan is reached',
  `user_id` int(11) DEFAULT '0' COMMENT 'ID of the user who owns dialplan',
  `data9` varchar(255) DEFAULT NULL,
  `data10` varchar(255) DEFAULT NULL,
  `data11` varchar(255) DEFAULT NULL,
  `data12` varchar(255) DEFAULT NULL,
  `data13` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dialplans`
--

LOCK TABLES `dialplans` WRITE;
/*!40000 ALTER TABLE `dialplans` DISABLE KEYS */;
INSERT INTO `dialplans` VALUES (1,'Quick Forward DIDs DP','quickforwarddids',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `dialplans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `didrates`
--

DROP TABLE IF EXISTS `didrates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `didrates` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `start_time` time NOT NULL DEFAULT '00:00:00',
  `end_time` time NOT NULL DEFAULT '23:59:59',
  `rate` decimal(30,15) DEFAULT '0.000000000000000',
  `connection_fee` decimal(30,15) DEFAULT '0.000000000000000',
  `increment_s` int(11) NOT NULL DEFAULT '1',
  `min_time` int(11) NOT NULL DEFAULT '0',
  `did_id` int(11) NOT NULL DEFAULT '0',
  `rate_type` varchar(20) DEFAULT 'provider',
  `daytype` enum('','FD','WD') DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `did_index` (`did_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `didrates`
--

LOCK TABLES `didrates` WRITE;
/*!40000 ALTER TABLE `didrates` DISABLE KEYS */;
/*!40000 ALTER TABLE `didrates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dids`
--

DROP TABLE IF EXISTS `dids`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dids` (
  `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT,
  `did` varchar(50) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'free',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `device_id` int(11) NOT NULL DEFAULT '0',
  `subscription_id` int(11) NOT NULL DEFAULT '0',
  `reseller_id` int(11) NOT NULL DEFAULT '0',
  `closed_till` datetime NOT NULL DEFAULT '2006-01-01 00:00:00',
  `dialplan_id` int(11) NOT NULL DEFAULT '0',
  `language` varchar(10) DEFAULT '',
  `provider_id` int(11) DEFAULT '0',
  `comment` varchar(255) DEFAULT NULL,
  `call_limit` int(11) DEFAULT '0',
  `sound_file_id` int(11) DEFAULT '0' COMMENT 'which file to play when did is reached',
  `grace_time` int(11) DEFAULT '0',
  `t_digit` int(11) NOT NULL DEFAULT '10' COMMENT 'Timeout Digit',
  `t_response` int(11) NOT NULL DEFAULT '20' COMMENT 'Timeout Response',
  `reseller_comment` varchar(255) DEFAULT NULL,
  `cid_name_prefix` varchar(30) DEFAULT NULL,
  `tonezone` varchar(5) DEFAULT NULL,
  `call_count` int(11) DEFAULT '0',
  `cc_tariff_id` int(10) unsigned DEFAULT '0',
  `owner_tariff_id` int(11) NOT NULL DEFAULT '0',
  `external_server` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `did_index` (`did`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dids`
--

LOCK TABLES `dids` WRITE;
/*!40000 ALTER TABLE `dids` DISABLE KEYS */;
/*!40000 ALTER TABLE `dids` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `directions`
--

DROP TABLE IF EXISTS `directions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `directions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `code` varchar(20) NOT NULL,
  `iso31661code` varchar(3) NOT NULL DEFAULT '000',
  PRIMARY KEY (`id`),
  KEY `directions_code_index` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=258 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `directions`
--

LOCK TABLES `directions` WRITE;
/*!40000 ALTER TABLE `directions` DISABLE KEYS */;
INSERT INTO `directions` VALUES (1,'Afghanistan','AFG','004'),(2,'Albania','ALB','008'),(3,'Algeria','DZA','012'),(4,'American Samoa','ASM','016'),(5,'Andorra','AND','020'),(6,'Angola','AGO','024'),(7,'Anguilla','AIA','660'),(8,'Antarctica','ATA','010'),(9,'Antigua And Barbuda','ATG','028'),(10,'Argentina','ARG','032'),(11,'Armenia','ARM','051'),(12,'Aruba','ABW','533'),(13,'Australia','AUS','036'),(14,'Austria','AUT','040'),(15,'Azerbaijan','AZE','031'),(16,'Bahamas','BHS','044'),(17,'Bahrain','BHR','048'),(18,'Bangladesh','BGD','050'),(19,'Barbados','BRB','052'),(20,'Belarus','BLR','112'),(21,'Belgium','BEL','056'),(22,'Belize','BLZ','084'),(23,'Benin','BEN','204'),(24,'Bermuda','BMU','060'),(25,'Bhutan','BTN','064'),(26,'Bolivia','BOL','068'),(27,'Bosnia And Herzegovina','BIH','070'),(28,'Botswana','BWA','072'),(30,'Brazil','BRA','076'),(32,'Brunei Darussalam','BRN','096'),(33,'Bulgaria','BGR','100'),(34,'Burkina Faso','BFA','854'),(35,'Burundi','BDI','108'),(36,'Cambodia','KHM','116'),(37,'Cameroon','CMR','120'),(38,'Canada','CAN','124'),(39,'Cape Verde','CPV','132'),(40,'Cayman Islands','CYM','136'),(41,'Central African Republic','CAF','140'),(42,'Chad','TCD','148'),(43,'Chile','CHL','152'),(44,'China','CHN','156'),(45,'Christmas Island','CXR','162'),(46,'Cocos (Keeling) Islands','CCK','166'),(47,'Colombia','COL','170'),(48,'Comoros','COM','174'),(49,'Congo','COG','178'),(50,'Congo, The Democratic Republic Of The','COD','180'),(51,'Cook Islands','COK','184'),(52,'Costa Rica','CRI','188'),(53,'Ivory Cost','CIV','384'),(54,'Croatia','HRV','191'),(55,'Cuba','CUB','192'),(56,'Cyprus','CYP','196'),(57,'Czech Republic','CZE','203'),(58,'Denmark','DNK','208'),(59,'Djibouti','DJI','262'),(60,'Dominica','DMA','212'),(61,'Dominican Republic','DOM','214'),(62,'Ecuador','ECU','218'),(63,'Egypt','EGY','818'),(64,'El Salvador','SLV','222'),(65,'Equatorial Guinea','GNQ','226'),(66,'Eritrea','ERI','232'),(67,'Estonia','EST','233'),(68,'Ethiopia','ETH','231'),(69,'Falkland Islands (Malvinas)','FLK','238'),(70,'Faroe Islands','FRO','234'),(71,'Fiji','FJI','242'),(72,'Finland','FIN','246'),(73,'France','FRA','250'),(74,'French Guiana','GUF','254'),(75,'French Polynesia','PYF','258'),(77,'Gabon','GAB','266'),(78,'Gambia','GMB','270'),(79,'Georgia','GEO','268'),(80,'Germany','DEU','276'),(81,'Ghana','GHA','288'),(82,'Gibraltar','GIB','292'),(83,'Greece','GRC','300'),(84,'Greenland','GRL','304'),(85,'Grenada','GRD','308'),(86,'Guadeloupe','GLP','312'),(87,'Guam','GUM','316'),(88,'Guatemala','GTM','320'),(89,'Guinea','GIN','324'),(90,'Guinea-Bissau','GNB','624'),(91,'Guyana','GUY','328'),(92,'Haiti','HTI','332'),(94,'Vatican City','VAT','336'),(95,'Honduras','HND','340'),(96,'Hong Kong','HKG','344'),(97,'Hungary','HUN','348'),(98,'Iceland','ISL','352'),(99,'India','IND','356'),(100,'Indonesia','IDN','360'),(101,'Iran','IRN','364'),(102,'Iraq','IRQ','368'),(103,'Ireland','IRL','372'),(104,'Israel','ISR','376'),(105,'Italy','ITA','380'),(106,'Jamaica','JAM','388'),(107,'Japan','JPN','392'),(108,'Jordan','JOR','400'),(109,'Kazakhstan','KAZ','398'),(110,'Kenya','KEN','404'),(111,'Kiribati','KIR','296'),(112,'North Korea','PRK','408'),(113,'South Korea','KOR','410'),(114,'Kuwait','KWT','414'),(115,'Kyrgyzstan','KGZ','417'),(116,'Laos','LAO','418'),(117,'Latvia','LVA','428'),(118,'Lebanon','LBN','422'),(119,'Lesotho','LSO','426'),(120,'Liberia','LBR','430'),(121,'Libyan Arab Jamahiriya','LBY','434'),(122,'Liechtenstein','LIE','438'),(123,'Lithuania','LTU','440'),(124,'Luxembourg','LUX','442'),(125,'Macao','MAC','446'),(126,'Macedonia','MKD','807'),(127,'Madagascar','MDG','450'),(128,'Malawi','MWI','454'),(129,'Malaysia','MYS','458'),(130,'Maldives','MDV','462'),(131,'Mali','MLI','466'),(132,'Malta','MLT','470'),(133,'Marshall islands','MHL','584'),(134,'Martinique','MTQ','474'),(135,'Mauritania','MRT','478'),(136,'Mauritius','MUS','480'),(137,'Mayotte','MYT','175'),(138,'Mexico','MEX','484'),(139,'Micronesia','FSM','583'),(140,'Moldova','MDA','498'),(141,'Monaco','MCO','492'),(142,'Mongolia','MNG','496'),(143,'Montserrat','MSR','500'),(144,'Morocco','MAR','504'),(145,'Mozambique','MOZ','508'),(146,'Myanmar','MMR','104'),(147,'Namibia','NAM','516'),(148,'Nauru','NRU','520'),(149,'Nepal','NPL','524'),(150,'Netherlands','NLD','528'),(151,'Netherlands Antilles','ANT','530'),(152,'New Caledonia','NCL','540'),(153,'New Zealand','NZL','554'),(154,'Nicaragua','NIC','558'),(155,'Niger','NER','562'),(156,'Nigeria','NGA','566'),(157,'Niue','NIU','570'),(158,'Norfolk Island','NFK','574'),(159,'Northern Mariana Islands','MNP','580'),(160,'Norway','NOR','578'),(161,'Oman','OMN','512'),(162,'Pakistan','PAK','586'),(163,'Palau','PLW','585'),(164,'Palestine','PSE','275'),(165,'Panama','PAN','591'),(166,'Papua New Guinea','PNG','598'),(167,'Paraguay','PRY','600'),(168,'Peru','PER','604'),(169,'Philippines','PHL','608'),(171,'Poland','POL','616'),(172,'Portugal','PRT','620'),(173,'Puerto Rico','PRI','630'),(174,'Qatar','QAT','634'),(175,'Reunion','REU','638'),(176,'Romania','ROU','642'),(177,'Russian Federation','RUS','643'),(178,'Rwanda','RWA','646'),(179,'Saint Helena','SHN','654'),(180,'Saint Kitts And Nevis','KNA','659'),(181,'Saint Lucia','LCA','662'),(182,'Saint Pierre And Miquelon','SPM','666'),(183,'Saint Vincent And The Grenadines','VCT','670'),(184,'Western Samoa','WSM','882'),(185,'San Marino','SMR','674'),(186,'Sao Tome And Principe','STP','678'),(187,'Saudi Arabia','SAU','682'),(188,'Senegal','SEN','686'),(189,'Seychelles','SYC','690'),(190,'Sierra Leone','SLE','694'),(191,'Singapore','SGP','702'),(192,'Slovakia','SVK','703'),(193,'Slovenia','SVN','705'),(194,'Solomon Islands','SLB','090'),(195,'Somalia','SOM','706'),(196,'South Africa','ZAF','710'),(198,'Spain','ESP','724'),(199,'Sri Lanka','LKA','144'),(200,'Sudan','SDN','729'),(201,'Suriname','SUR','740'),(203,'Swaziland','SWZ','748'),(204,'Sweden','SWE','752'),(205,'Switzerland','CHE','756'),(206,'Syrian Arab Republic','SYR','760'),(207,'Taiwan','TWN','158'),(208,'Tajikistan','TJK','762'),(209,'Tanzania','TZA','834'),(210,'Thailand','THA','764'),(212,'Togo','TGO','768'),(213,'Tokelau','TKL','772'),(214,'Tonga','TON','776'),(215,'Trinidad And Tobago','TTO','780'),(216,'Tunisia','TUN','788'),(217,'Turkey','TUR','792'),(218,'Turkmenistan','TKM','795'),(219,'Turks And Caicos Islands','TCA','796'),(220,'Tuvalu','TUV','798'),(221,'Uganda','UGA','800'),(222,'Ukraine','UKR','804'),(223,'United Arab Emirates','ARE','784'),(224,'United Kingdom','GBR','826'),(225,'United States','USA','840'),(227,'Uruguay','URY','858'),(228,'Uzbekistan','UZB','860'),(229,'Vanuatu','VUT','548'),(230,'Venezuela','VEN','862'),(231,'Vietnam','VNM','704'),(232,'Virgin Islands, British','VGB','092'),(233,'Virgin Islands, U.S.','VIR','850'),(234,'Wallis And Futuna','WLF','876'),(236,'Yemen','YEM','887'),(238,'Zambia','ZMB','894'),(239,'Zimbabwe','ZWE','716'),(240,'Ascension Island','ASC','654'),(241,'Diego Garcia','DGA','000'),(242,'Inmarsat','XNM','000'),(243,'East Timor','TMP','626'),(246,'Iridium','IRI','000'),(247,'Serbia and Montenegro','SCG','891'),(250,'Emsat','EMS','000'),(251,'Ellipso-3','EL3','000'),(252,'Globalstar','GS8','000'),(253,'Montenegro','MBX','499'),(254,'Kosovo','KOS','000'),(255,'South Sudan','SSD','728'),(256,'Thuraya','THU','000'),(257,'International Networks','INN','000');
/*!40000 ALTER TABLE `directions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emails`
--

DROP TABLE IF EXISTS `emails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `date_created` datetime NOT NULL,
  `body` text,
  `template` tinyint(4) DEFAULT '0',
  `format` varchar(255) DEFAULT 'html',
  `owner_id` int(11) DEFAULT '0',
  `callcenter` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emails`
--

LOCK TABLES `emails` WRITE;
/*!40000 ALTER TABLE `emails` DISABLE KEYS */;
INSERT INTO `emails` VALUES (1,'registration_confirmation_for_user','Thank you for registering!','2007-10-29 16:55:22','Your device settings: \r\n\r\nServer IP: <%= server_ip %>\r\nDevice type: <%= device_type %>\r\nUsername: <%= device_username %>\r\nPassword: <%= device_password %>\r\n\r\n----\r\n\r\nSettings to login to MOR interface:\r\n\r\nLogin URL: <%= login_url %>\r\nUsername: <%= login_username %>\r\nPassword: <%= login_password %>\r\n\r\nThank you for registering!',1,'html',0,0),(2,'registration_confirmation_for_admin','New user registered','2007-10-29 16:55:51','User settings: \r\n\r\nUser:\r\nFirst Name/Company: <%= first_name %>\r\nLast Name: <%= last_name %>\r\n\r\nDevice settings\r\n\r\nDevice type: <%= device_type %>\r\nUsername: <%= device_username %>\r\nPassword: <%= device_password %>\r\n\r\nSettings to login to MOR interface\r\n\r\nUsername: <%= login_username %>\r\nPassword: <%= login_password %>',1,'html',0,0),(3,'cyberplat_announce','Cyberplat payment announce','2008-07-03 17:32:14','Thank you for using cyberplat.<br />\r\nCompany name: <%= company_name %><br />\r\nDesignation: VoIP<br />\r\nURL: <%= url %><br />\r\nCompany_Email: <%= email%><br />\r\nAmount+VAT: <%= amount %> <%= currency %><br />\r\nTransaction date: <%= date %><br />\r\nAuthorization Code: <%= auth_code %><br />\r\nTransaction Identifier <%= trans_id %><br />\r\nCustomer Name <%= customer_name %><br />\r\nOperation Type: Balance Update<br />\r\nDescription: <%= description %>',1,'html',0,0),(4,'invoices','Invoices','2009-08-31 20:15:39','Invoices are attached.',1,'html',0,0),(5,'c2c_invoices','Invoices','2009-08-31 20:15:39','Invoices are attached.',1,'html',0,0),(6,'calling_cards_data_to_paypal','Calling Card purchase','2009-09-01 10:41:32',' <table>\r\n	<tr>\r\n	    <th><%= _(\'Number\')%></th>\r\n	    <th><%= _(\'PIN\') %></th>\r\n	    <th><%= _(\'Price\') %></th>\r\n	</tr>\r\n    <% i = 0 %>\r\n    <% for card in cards %>\r\n	<tr >   \r\n	    <td align=\'center\'>\r\n		 <%= card.number%>\r\n	    </td>\r\n	    <td align=\'center\'>\r\n    		 <%= card.pin %> \r\n	    </td>\r\n	    <td align=\'center\'>\r\n    		 <%= card.cardgroup.price %> \r\n	    </td>\r\n	</tr>\r\n	<% i += 1%>\r\n    <%end%>\r\n     </table>',1,'html',0,0),(7,'warning_balance_email','Warning','2009-09-01 10:41:32','Balance: <%= balance %> <%= currency %>',1,'html',0,0),(8,'recording_new','New recording','2009-09-01 10:41:47','New recording attached.\n\nCall done on <% calldate %>\nSource number(CallerID): <% source %>\nDialed to: <% destination %>\nCall duration: <% billsec %> seconds\n\nRegards',1,'plain',0,0),(9,'recording_delete','Recording deleted','2009-09-01 10:41:47','Recording was deleted from the server because there is not enough space to store it.\n\nRecording done for the call on: <% calldate %>\nSource number(CallerID): <% source %>\nDialed to: <% destination %>\nCall duration: <% billsec %> seconds\n\nRegards',1,'plain',0,0),(10,'block_when_no_balance','Account blocked','2009-09-01 10:41:47','Account was blocked because of insufficient balance\nUser: <%= full_name %>\nBalance: <%= balance %>',1,'plain',0,0),(11,'monitoring_activation','Monitoring was activated','2014-01-23 11:30:43','Monitoring details:\n\nType: <%=monitoring_type%>\nBalance: <%=monitoring_amount%>\nBlock: <%=monitoring_block%>\n\nAffected users:\n\n<%=monitoring_users%>\n<%= call_list %>',1,'plain',0,0),(12,'payment_notification_integrations','Payment notification','2014-01-23 11:30:44','MOR has received a payment notification which requires your confirmation in order to complete the transaction.<br/><br/>\n\nPayment details:<br/><br/>\n\nType: <%= payment_type %><br/>\nAmount: <%= payment_amount %><br/>\nFee: <%= payment_fee %><br/>\nPayer: <%= payment_payer_first_name %> <%= payment_payer_last_name %> <%= payment_payer_email %><br/>\nMoney should be sent to (your email in MOR): <%= payment_seller_email %><br/>\nMoney was sent to (according to gateway): <%= payment_receiver_email %><br/>\nDate: <%= payment_date %><br/><br/>\n\n<%= login_url %>/payments/list',1,'html',0,0),(13,'payment_notification_regular','Payment notification','2014-01-23 11:30:44','MOR has received a payment notification which requires your confirmation in order to complete the transaction.<br/><br/>\n\nPayment details:<br/><br/>\n\nType: <%= payment_type %><br/>\nAmount: <%= payment_amount %><br/>\nFee: <%= payment_fee %><br/>\nPayer: <%= payment_payer_first_name %> <%= payment_payer_last_name %>\n<br/>Date: <%= payment_date %><br/><br/>\n\n<%= login_url %>/payments/list',1,'html',0,0),(14,'password_reminder','password_reminder','2014-01-23 11:30:44','Settings to login to MOR interface:  Login URL: <%= login_url %> Username: <%= login_username %> Password: <%= login_password %>',1,'html',0,0),(15,'callerid_blocked','Callerid blocked','2014-01-23 11:36:15','At <%= date %> User with ID = <%= user_id %>, with Device ID = <%= device_id %> and CallerID = <%= caller_id %> was blocked because it sent several simultaneous calls in same time.',1,'html',0,0),(16,'warning_balance_email_local','Low Balance Warning','2014-04-16 14:08:10','User <%= full_name %> will run out of balance soon.\n\nCurrent balance: <%= balance %> <%= currency %>',1,'html',0,0);
/*!40000 ALTER TABLE `emails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `extlines`
--

DROP TABLE IF EXISTS `extlines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `extlines` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `context` varchar(20) NOT NULL,
  `exten` varchar(20) NOT NULL,
  `priority` int(4) NOT NULL DEFAULT '0',
  `app` varchar(20) NOT NULL,
  `appdata` varchar(255) DEFAULT NULL,
  `device_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`,`context`,`exten`,`priority`),
  KEY `id` (`id`),
  KEY `extmainindex` (`context`,`exten`,`priority`)
) ENGINE=InnoDB AUTO_INCREMENT=176 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `extlines`
--

LOCK TABLES `extlines` WRITE;
/*!40000 ALTER TABLE `extlines` DISABLE KEYS */;
INSERT INTO `extlines` VALUES (15,'mor_local','101',1,'GotoIf','$[${LEN(${CALLED_TO})} > 0]?2:4',1),(16,'mor_local','101',2,'Set','CALLERID(NAME)=TRANSFER FROM ${CALLED_TO}',1),(17,'mor_local','101',3,'Goto','101,5',1),(18,'mor_local','101',4,'Set','CALLED_TO=${EXTEN}',1),(19,'mor_local','101',5,'NoOp','MOR starts',1),(20,'mor_local','101',6,'GotoIf','$[${LEN(${CALLERID(NAME)})} > 0]?9:7',1),(21,'mor_local','101',7,'GotoIf','$[${LEN(${mor_cid_name})} > 0]?8:9',1),(22,'mor_local','101',8,'Set','CALLERID(NAME)=${mor_cid_name}',1),(23,'mor_local','101',9,'Dial','IAX2/101',1),(24,'mor_local','101',10,'GotoIf','$[\"${DIALSTATUS}\" = \"CHANUNAVAIL\"]?301',1),(25,'mor_local','101',11,'Hangup','',1),(26,'mor_local','101',209,'Background','busy',1),(27,'mor_local','101',210,'Busy','10',1),(28,'mor_local','101',211,'Hangup','',1),(29,'mor_local','101',301,'Ringing','',1),(30,'mor_local','101',302,'Wait','120',1),(31,'mor_local','101',303,'Hangup','',1),(42,'mor_local','*89',1,'VoiceMailMain','',0),(43,'mor_local','*89',2,'Hangup','',0),(44,'mor','fax',1,'Goto','mor_fax2email,123,1',0),(60,'mor_local','*97',1,'AGI','mor_acc2user',0),(61,'mor_local','*97',2,'VoiceMailMain','s${MOR_EXT}',0),(62,'mor_local','*97',3,'Hangup','',0),(63,'mor','fax',1,'Goto','mor_fax2email,123,1',0),(64,'mor_local','_X.',1,'Goto','mor,${EXTEN},1',0),(65,'mor_local','_*X.',1,'Goto','mor,${EXTEN},1',0),(86,'mor_voicemail','_X.',1,'VoiceMail','${EXTEN},${MOR_VM}',0),(87,'mor_voicemail','_X.',2,'Hangup','',0),(144,'mor','disabled_X.',1,'NoOp','MOR starts',0),(145,'mor','disabled_X.',2,'Set','TIMEOUT(response)=20',0),(146,'mor','disabled_X.',3,'Set','TIMEOUT(digit)=10',0),(147,'mor','disabled_X.',4,'mor','${EXTEN}',0),(148,'mor','disabled_X.',5,'GotoIf','$[\"${MOR_CARD_USED}\" != \"\"]?mor_callingcard,s,1',0),(149,'mor','disabled_X.',6,'GotoIf','$[\"${MOR_ANIPIN_USED}\" != \"\"]?mor_anipin,s,1',0),(150,'mor','disabled_X.',7,'GotoIf','$[\"${MOR_TRUNK}\" = \"1\"]?HANGUP_NOW,1',0),(151,'mor','disabled_X.',8,'GotoIf','$[$[\"${DIALSTATUS}\" = \"CHANUNAVAIL\"] , $[\"${DIALSTATUS}\" = \"CONGESTION\"]]?FAILED,1',0),(152,'mor','disabled_X.',9,'GotoIf','$[\"${DIALSTATUS}\" = \"BUSY\"]?BUSY,1:HANGUP,1',0);
/*!40000 ALTER TABLE `extlines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flatrate_data`
--

DROP TABLE IF EXISTS `flatrate_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flatrate_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `year_month` varchar(255) NOT NULL COMMENT 'Marks year and month for which minutes are counted',
  `minutes` int(11) NOT NULL COMMENT 'How many minutes user has already used',
  `subscription_id` int(11) NOT NULL COMMENT 'Foreign key to subscriptions table',
  `seconds` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flatrate_data`
--

LOCK TABLES `flatrate_data` WRITE;
/*!40000 ALTER TABLE `flatrate_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `flatrate_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flatrate_destinations`
--

DROP TABLE IF EXISTS `flatrate_destinations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flatrate_destinations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `service_id` int(11) NOT NULL COMMENT 'Foreign key to services table',
  `destination_id` int(11) NOT NULL COMMENT 'Foreign key to destination table',
  `active` tinyint(4) NOT NULL COMMENT '1 - This destination is included into flatrate service, 0 - destination is excluded',
  PRIMARY KEY (`id`),
  KEY `service_id_index` (`service_id`),
  KEY `destination_id_index` (`destination_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flatrate_destinations`
--

LOCK TABLES `flatrate_destinations` WRITE;
/*!40000 ALTER TABLE `flatrate_destinations` DISABLE KEYS */;
/*!40000 ALTER TABLE `flatrate_destinations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gateways`
--

DROP TABLE IF EXISTS `gateways`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gateways` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Unique ID',
  `setid` int(11) NOT NULL DEFAULT '1' COMMENT 'Destination Set ID',
  `destination` varchar(192) NOT NULL DEFAULT 'sip:' COMMENT 'Destination SIP Address',
  `description` varchar(255) DEFAULT NULL COMMENT 'Description for this Destination',
  `server_id` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gateways`
--

LOCK TABLES `gateways` WRITE;
/*!40000 ALTER TABLE `gateways` DISABLE KEYS */;
/*!40000 ALTER TABLE `gateways` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groups`
--

DROP TABLE IF EXISTS `groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `grouptype` varchar(255) NOT NULL DEFAULT 'simple',
  `owner_id` int(11) NOT NULL DEFAULT '0',
  `description` text,
  `translation_id` int(11) DEFAULT '1',
  `simple_session` smallint(6) NOT NULL DEFAULT '0',
  `postpaid` smallint(6) NOT NULL DEFAULT '-1',
  `balance` decimal(30,15) NOT NULL DEFAULT '0.000000000000000',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups`
--

LOCK TABLES `groups` WRITE;
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hangupcausecodes`
--

DROP TABLE IF EXISTS `hangupcausecodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hangupcausecodes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` int(11) NOT NULL,
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=820 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hangupcausecodes`
--

LOCK TABLES `hangupcausecodes` WRITE;
/*!40000 ALTER TABLE `hangupcausecodes` DISABLE KEYS */;
INSERT INTO `hangupcausecodes` VALUES (629,0,'<b>0 - Unknow error</b><br>This is usually given by the router when none of the other codes apply. This cause usually occurs in the same type of situations as cause 1, cause 88, and cause 100.<br>'),(630,1,'<b>1 - Unallocated (unassigned) number</b><br>This cause indicates that the destination requested by the calling user cannot be reached because, although the number is in a valid format, it is not currently assigned (allocated).<br><br>What it usually means:<br><ol><li>The SPIDS may be incorrectly entered in the router or the Telco switch, giving a SPID failure in the router logs.</li><li>The ISDN phone number being dialed by the router is invalid and the telco switch cannot locate the number to complete the call, as it is invalid.</li><li>On long distance calls, the call cannot be properly routed to its destination.</li></ol>'),(631,2,'<b>2 - No route to specified transit network (national use)</b><br>This cause indicates that the equipment sending this cause has received a request to route the call through a particular transit network which it does not recognize. The equipment sending this cause does not recognize the transit network either because the transit network does not exist or because that particular transit network not serve the equipment which is sending this cause.<br>'),(632,3,'<b>3 - No route to destination</b><br>This cause indicates that the called party cannot be reached because the network through which the call has been routed does not serve the destination desired. This cause is supported on a network dependent basis.<br>'),(633,4,'<b>4 - Send special information tone</b><br>This cause indicates that the called party cannot be reached for reasons that are of a long term nature and that the special information tone should be returned to the calling party.<br>'),(634,5,'<b>5 - Misdialed trunk prefix (national use)</b><br>This cause indicates the erroneous inclusion of a trunk prefix in the called party number. This number is to sniped from the dialed number being sent to the network by the customer premises equipment.<br>'),(635,6,'<b>6 - Channel unacceptable</b><br>This cause indicates that the channel most recently identified is not acceptable to the sending entity for use in this call.<br>'),(636,7,'<b>7 - Call awarded. Being delivered in an established channel</b><br>This cause indicates that the user has been awarded the incoming call and that the incoming call is being connected to a channel already established to that user for similar calls (e.g. packet-mode x.25 virtual calls).<br>'),(637,8,'<b>8 - Preemption</b><br>This cause indicates the call is being preempted.<br>'),(638,9,'<b>9 - Preemption - circuit reserved for reuse</b><br>This cause indicates that the call is being preempted and the circuit is reserved for reuse by the preempting exchange.<br>'),(639,10,'<b>10 - Not standard error code. Consult with Provider.</b><br>'),(640,11,'<b>11 - Not standard error code. Consult with Provider.</b><br>'),(641,12,'<b>12 - Not standard error code. Consult with Provider.</b><br>'),(642,13,'<b>13 - Not standard error code. Consult with Provider.</b><br>'),(643,14,'<b>14 - Not standard error code. Consult with Provider.</b><br>'),(644,15,'<b>15 - Not standard error code. Consult with Provider.</b><br>'),(645,16,'<b>16 - Normal call clearing</b><br>This cause indicates that the call is being cleared because one of the users involved in the call has requested that the call be cleared.<br><br>What it means:<br>This could be almost anything; it is the vaguest of the cause codes. The call comes down normally, but the reasons for it could be:<br><ol><li>Bad username or password</li><li>Routers settings do not match what is expected by the remote end.</li><li>Telephone line problems.</li><li>Hung session on remote end.</li></ol>'),(646,17,'<b>17 - User busy</b><br>This cause is used to indicate that the called party is unable to accept another call because the user busy condition has been encountered.<br>This cause value may be generated by the called user or by the network.<br>In the case of user determined user busy it is noted that the user equipment is compatible with the call.<br>'),(647,18,'<b>18 - No user responding</b><br>This cause is used when a called party does not respond to a call establishment message with either an alerting or connect indication within the prescribed period of time allocated.<br>The equipment on the other end does not answer the call. Usually this is a misconfiguration on the equipment being called.<br>'),(648,19,'<b>19 - No answer from user (user alerted)</b><br>This cause is used when the called party has been alerted but does not respond with a connect indication within a prescribed period of time.<br>Note - This cause is not necessarily generated by Q.931 procedures but may be generated by internal network timers.<br>'),(649,20,'<b>20 - Subscriber absent</b><br>This cause value is used when a mobile station has logged off. Radio contact is not obtained with a mobile station or if a personal telecommunication user is temporarily not addressable at any user-network interface.<br>'),(650,21,'<b>21 - Call rejected</b><br>This cause indicates that the equipment sending this cause does not wish to accept this call. although it could have accepted the call because the equipment sending this cause is neither busy nor incompatible.<br>This cause may also be generated by the network, indicating that the call was cleared due to a supplementary service constraint. The diagnostic field may contain additional information about the supplementary service and reason for rejection.<br>This is usually a telco issue. The call never reaches the final destination, which can be caused by a bad switch translation, or a misconfiguration on the equipment being called.<br>'),(651,22,'<b>22 - Number changed</b><br>This cause is returned to a calling party when the called party number indicated by the calling party is no longer assigned. The new called party number may optionally be included in the diagnostic field. If a network does not support this cause, cause no. 1, unallocated (unassigned) number shall be used.<br>'),(652,23,'<b>23 - Not standard error code. Consult with Provider.</b><br>'),(653,24,'<b>24 - Not standard error code. Consult with Provider.</b><br>'),(654,25,'<b>25 - Not standard error code. Consult with Provider.</b><br>'),(655,26,'<b>26 - Non-selected user clearing</b><br>This cause indicates that the user has not been awarded the incoming call.<br>'),(656,27,'<b>27 - Destination out of order</b><br>This cause indicates that the destination indicated by the user cannot be reached because the interface to the destination is not functioning correctly.<br>The term <i>not functioning correctly</i> indicates that a signal message was unable to be delivered to the remote party; e.g., a physical layer or data link layer failure at the remote party or user equipment off-line.<br>'),(657,28,'<b>28 - Invalid number format (address incomplete)</b><br>This cause indicates that the called party cannot be reached because the called party number is not in a valid format or is not complete.<br>'),(658,29,'<b>29 - Facilities rejected</b><br>This cause is returned when a supplementary service requested by the user cannot be provide by the network.<br>'),(659,30,'<b>30 - Response to STATUS INQUIRY</b><br>This cause is included in the STATUS message when the reason for generating the STATUS message was the prior receipt of a STATUS INQUIRY.<br>'),(660,31,'<b>31 - Normal. Unspecified</b><br>This cause is used to report a normal event only when no other cause in the normal class applies.<br>'),(661,32,'<b>32 - Not standard error code. Consult with Provider.</b><br>'),(662,33,'<b>33 - Not standard error code. Consult with Provider.</b><br>'),(663,34,'<b>34 - No circuit/channel available</b><br>This cause indicates that there is no appropriate circuit/channel presently available to handle the call.<br>There is no place on the Public Telephone network to place the call; the call never gets to its destiation. This is usually a temporary problem.<br>'),(664,35,'<b>35 - Call Queued</b><br>'),(665,36,'<b>36 - Not standard error code. Consult with Provider.</b><br>'),(666,37,'<b>37 - Not standard error code. Consult with Provider.</b><br>'),(667,38,'<b>38 - Network out of order</b><br>This cause indicates that the network is not functioning correctly and that the condition is likely to last a relatively long period of time e.g., immediately re-attempting the call is not likely to be successful.<br>'),(668,39,'<b>39 - Permanent frame mode connection out-of-service.</b><br>This cause is included in a STATUS message to indicate that a permanently established frame mode connection is out-of-service (e.g. due to equipment or section failure)<br>'),(669,40,'<b>40 - Permanent frame mode connection operational.</b><br>This cause is included in a STATUS message to indicate that a permanently established frame mode connection is operational and capable of carrying user information.<br>'),(670,41,'<b>41 - Temporary failure.</b><br>This cause indicates that the network is not functioning correctly and that the condition is no likely to last a long period of time; e.g., the user may wish to try another call attempt almost immediately.<br>This means that there is a temporary failure at the physical layer on the ISDN network.<br>'),(671,42,'<b>42 - Switching equipment congestion</b><br>This cause indicates that the switching equipment generating this cause is experiencing a period of high traffic.<br>Just too much going on at this point on the ISDN network to get the call through to its destination.<br>'),(672,43,'<b>43 - Access information discarded</b><br>This cause indicates that the network could not deliver access information to the remote user as requested. i.e., user-to-user information, low layer compatibility, high layer compatibility or sub-address as indicated in the diagnostic.<br>It is noted that the particular type of access information discarded is optionally included in the diagnostic.<br>'),(673,44,'<b>44 - Requested circuit/channel not available</b><br>This cause is returned when the circuit or channel indicated by the requesting entity cannot be provided by the other side of the interface.<br>'),(674,45,'<b>45 - Not standard error code. Consult with Provider.</b><br>'),(675,46,'<b>46 - Precedence call blocked</b><br>This cause indicates that there are no predictable circuits or that the called user is busy with a call of equal or higher preventable level.<br>'),(676,47,'<b>47 - Resource unavailable, unspecified</b><br>This cause is used to report a resource unavailable event only when no other cause in the resource unavailable class applies.<br>'),(677,48,'<b>48 - Not standard error code. Consult with Provider.</b><br>'),(678,49,'<b>49 - Quality of Service not available</b><br>This cause is used to report that the requested Quality of Service, as defined in Recommendation X.213. cannot be provided (e.g., throughput of transit delay cannot be supported).<br>'),(679,50,'<b>50 - Requested facility not subscribed</b><br>This cause indicates that the user has requested a supplementary service which is implemented by the equipment which generated this cause but the user is not authorized to use.<br>The switch looks at the number being dialed and thinks it is for another service rather than ISDN. If the phone number is put in the correct format, the call should be placed properly.<br>There are no standards for this, all Telcos have their own system for programming the number formats that the switches will recognize. Some systems want to see 7 digits, some 10, and others 11.<br>'),(680,51,'<b>51 - Not standard error code. Consult with Provider.</b><br>'),(681,52,'<b>52 - Outgoing calls barred</b><br>'),(682,53,'<b>53 - Outgoing calls barred within CUG</b><br>This cause indicates that although the calling party is a member of the CUG for the outgoing CUG call. Outgoing calls are not allowed for this member of the CUG.<br>'),(683,54,'<b>54 - Incoming calls barred</b><br>'),(684,55,'<b>55 - Incoming calls barred within CUG</b><br>This cause indicates that although the calling party is a member of the CUG for the incoming CUG call. Incoming calls are not allowed for this member of the CUG.<br>'),(685,56,'<b>56 - Not standard error code. Consult with Provider.</b><br>'),(686,57,'<b>57 - Bearer capability not authorized</b><br>This cause indicates that the user has requested a bearer capability which is implemented by the equipment which generated this cause but the user is not authorized to use.<br>'),(687,58,'<b>58 - Bearer capability not presently available</b><br>This cause indicates that the user has requested a bearer capability which is implemented by the equipment which generated this cause but which is not available at this time.<br>'),(688,59,'<b>59 - Not standard error code. Consult with Provider.</b><br>'),(689,60,'<b>60 - Not standard error code. Consult with Provider.</b><br>'),(690,61,'<b>61 - Not standard error code. Consult with Provider.</b><br>'),(691,62,'<b>62 - Inconsistency in outgoing information element</b><br>This cause indicates an inconsistency in the designated outgoing access information and subscriber class.<br>'),(692,63,'<b>63 - Service or option not available. Unspecified</b><br>This cause is used to report a service or option not available event only when no other cause in the service or option not available class applies.<br>'),(693,64,'<b>64 - Not standard error code. Consult with Provider.</b><br>'),(694,65,'<b>65 - Bearer capability not implemented</b><br>This cause indicates that the equipment sending this cause does not support the bearer capability requested.<br>In most cases, the number being called is not an ISDN number but an analog destination.<br>The equipment is dialing at a faster rate than the circuitry allows, for example, dialing at 64K when only 56K is supported.<br>'),(695,66,'<b>66 - Channel type not implemented</b><br>This cause indicates that the equipment sending this cause does not support the channel type requested.<br>'),(696,67,'<b>67 - Not standard error code. Consult with Provider.</b><br>'),(697,68,'<b>68 - Not standard error code. Consult with Provider.</b><br>'),(698,69,'<b>69 - Requested facility not implemented</b><br>This cause indicates that the equipment sending this cause does not support the requested supplementary services.<br>'),(699,70,'<b>70 - Only restricted digital information bearer capability is available</b><br>This cause indicates that the calling party has requested an unrestricted bearer service but the equipment sending this cause only supports the restricted version of the requested bearer capability.<br>'),(700,71,'<b>71 - Not standard error code. Consult with Provider.</b><br>'),(701,72,'<b>72 - Not standard error code. Consult with Provider.</b><br>'),(702,73,'<b>73 - Not standard error code. Consult with Provider.</b><br>'),(703,74,'<b>74 - Not standard error code. Consult with Provider.</b><br>'),(704,75,'<b>75 - Not standard error code. Consult with Provider.</b><br>'),(705,76,'<b>76 - Not standard error code. Consult with Provider.</b><br>'),(706,77,'<b>77 - Not standard error code. Consult with Provider.</b><br>'),(707,78,'<b>78 - Not standard error code. Consult with Provider.</b><br>'),(708,79,'<b>79 - Service or option not implemented unspecified</b><br>This cause is used to report a service or option not implemented event only when no other cause in the service or option not implemented class applies.<br>'),(709,80,'<b>80 - Not standard error code. Consult with Provider</b><br>'),(710,81,'<b>81 - Invalid call reference value</b><br>This cause indicates that the equipment sending this cause has received a message with a call reference which is not currently in use on the user-network interface.<br>'),(711,82,'<b>82 - Identified channel does not exist</b><br>This cause indicates that the equipment sending this cause has received a request to use a channel not activated on the interface for a call. For example, if a user has subscribed to those channels on a primary rate interface numbered from l to 12 and the user equipment or the network attempts to use channels 3 through 23, this cause is generated.<br>'),(712,83,'<b>83 - A suspended call exists, but this call identify does not</b><br>This cause indicates that a call resume has been attempted with a call identity which differs from that in use for any presently suspended call(s).<br>'),(713,84,'<b>84 - Call identity in use</b><br>This cause indicates that the network has received a call suspended request containing a call identity (including the null call identity) which is already in use for a suspended call within the domain of interfaces over which the call might be resumed.<br>'),(714,85,'<b>85 - No call suspended</b><br>This cause indicates that the network has received a call resume request containing a call identity information element which presently does not indicate any suspended call within the domain of interfaces over which calls may be resumed.<br>'),(715,86,'<b>86 - Call having the requested call identity has been cleared</b><br>This cause indicates that the network has received a call resume request containing a call identity information element indicating a suspended call that has in the meantime been cleared while suspended (either by network time-out or by the remote user).<br>'),(716,87,'<b>87 - User not a member of CUG</b><br>This cause indicates that the called user for the incoming CUG call is not a member of the specified CUG or that the calling user is an ordinary subscriber calling a CUG subscriber.<br>'),(717,88,'<b>88 - Incompatible destination</b><br>This cause indicates that the equipment sending this cause has received a request to establish a call which has low layer compatibility. high layer compatibility or other compatibility attributes (e.g., data rate) which cannot be accommodated.<br>'),(718,89,'<b>89 - Not standard error code. Consult with Provider.</b><br>'),(719,90,'<b>90 - Non-existent CUG</b><br>This cause indicates that the specified CUG does not exist.<br>'),(720,91,'<b>91 - Invalid transit network selection (national use)</b><br>This cause indicates that a transit network identification was received which is of an incorrect format as defined in Annex C/Q.931<br>'),(721,92,'<b>92 - Not standard error code. Consult with Provider.</b><br>'),(722,93,'<b>93 - Not standard error code. Consult with Provider.</b><br>'),(723,94,'<b>94 - Not standard error code. Consult with Provider.</b><br>'),(724,95,'<b>95 - Invalid message, unspecified</b><br>This cause is used to report an invalid message event only when no other cause in the invalid message class applies.<br>'),(725,96,'<b>96 - Mandatory information element is missing</b><br>This cause indicates that the equipment sending this cause has received a message which is missing an information element which must be present in the message before that message can be processed.<br>'),(726,97,'<b>97 - Message type non-existent or not implemented</b><br>This cause indicates that the equipment sending this cause has received a message with a message type it does not recognize either because this is a message not defined of defined but not implemented by the equipment sending this cause.<br>'),(727,98,'<b>98 - Message not compatible with call state or message type non-existent</b><br>This cause indicates that the equipment sending this cause has received a message such that the procedures do not indicate that this is a permissible message to receive while in the call state, or a STATUS message was received indicating an incompatible call state.<br>'),(728,99,'<b>99 - Information element / parameter non-existent or not implemented</b><br>This cause indicates that the equipment sending this cause has received a message which includes information element(s)/parameter(s) not recognized because the information element(s)/parameter name(s) are not defined or are defined but not implemented by the equipment sending the cause.<br>This cause indicates that the information element(s)/parameter(s) were discarded. However, the information element is not required to be present in the message in order for the equipment sending the cause to process the message.<br>'),(729,100,'<b>100 - Invalid information element contents</b><br>This cause indicates that the equipment sending this cause has received and information element which it has implemented; however, one or more of the fields in the information element are coded in such a way which has not been implemented by the equipment sending this cause.<br>Like cause 1 and cause 88, this usually indicates that the ISDN number being dialed is in a format that is not understood by the equipment processing the call. SPIDs will sometimes fail to initialize with a Cause 100, or a call will fail with this cause.<br>'),(730,101,'<b>101 - Message not compatible with call state</b><br>This cause indicates that a message has been received which is incompatible with the call state.<br>'),(731,102,'<b>102 - Recovery on timer expiry</b><br>This cause indicates that a procedure has been initiated by the expiration of a timer in association with error handling procedures.<br>'),(732,103,'<b>103 - Parameter non-existent or not implemented - passed on (national use)</b><br>This cause indicates that the equipment sending this cause has received a message which includes parameters not recognized because the parameters are not defined or are defined but not implemented by the equipment sending this cause.<br>The cause indicates that the parameter(s) were ignored. In addition, if the equipment sending this cause is an intermediate point, then this cause indicates that the parameter(s) were passed unchanged.<br>'),(733,104,'<b>104 - Not standard error code. Consult with Provider.</b><br>'),(734,105,'<b>105 - Not standard error code. Consult with Provider.</b><br>'),(735,106,'<b>106 - Not standard error code. Consult with Provider.</b><br>'),(736,107,'<b>107 - Not standard error code. Consult with Provider.</b><br>'),(737,108,'<b>108 - Not standard error code. Consult with Provider.</b><br>'),(738,109,'<b>109 - Not standard error code. Consult with Provider.</b><br>'),(739,110,'<b>110 - Message with unrecognized parameter discarded</b><br>This cause indicates that the equipment sending this cause has discarded a received message which includes a parameter that is not recognized.<br>'),(740,111,'<b>111 - Protocol error, unspecified</b><br>This cause is used to report a protocol error event only when no other cause in the protocol error class applies.<br>'),(741,112,'<b>112 - Not standard error code. Consult with Provider.</b><br>'),(742,113,'<b>113 - Not standard error code. Consult with Provider.</b><br>'),(743,114,'<b>114 - Not standard error code. Consult with Provider.</b><br>'),(744,115,'<b>115 - Not standard error code. Consult with Provider.</b><br>'),(745,116,'<b>116 - Not standard error code. Consult with Provider.</b><br>'),(746,117,'<b>117 - Not standard error code. Consult with Provider.</b><br>'),(747,118,'<b>118 - Not standard error code. Consult with Provider.</b><br>'),(748,119,'<b>119 - Not standard error code. Consult with Provider.</b><br>'),(749,120,'<b>120 - Not standard error code. Consult with Provider.</b><br>'),(750,121,'<b>121 - Not standard error code. Consult with Provider.</b><br>'),(751,122,'<b>122 - Not standard error code. Consult with Provider.</b><br>'),(752,123,'<b>123 - Not standard error code. Consult with Provider.</b><br>'),(753,124,'<b>124 - Not standard error code. Consult with Provider.</b><br>'),(754,125,'<b>125 - Not standard error code. Consult with Provider.</b><br>'),(755,126,'<b>126 - Not standard error code. Consult with Provider.</b><br>'),(756,127,'<b>127 - Intel-working, unspecified</b><br>This cause indicates that an interworking call (usually a call to 5W56 service) has ended.<br>'),(757,200,'<b>200 - MOR cannot determine who is calling</b><br>The IP from which call comes is not entered in the system or entered incorrectly.<br>Some other fields in configuration can be missing also.<br>Please consult online manual at wiki.kolmisoft.com<br>'),(758,201,'<b>201 - User is blocked</b><br>Unblock the user to allow him to make calls.<br>For more information please consult online manual at wiki.kolmisoft.com<br>'),(759,202,'<b>202 - Reseller is blocked</b><br>Unblock reseller to allow him and his users to make calls.<br>For more information please consult online manual at wiki.kolmisoft.com<br>'),(760,203,'<b>203 - No rates for user</b><br>User cannot make call because his tariff does not have rates to dialed destination.<br>Enter rates to users tariff to allow him to dial to this destination.<br>For more information please use Call Tracing or consult online manual at wiki.kolmisoft.com<br>'),(761,204,'<b>204 - No suitable providers found</b><br>No providers found to terminate call to. None providers in routing table can accept and complete this call.<br><br>There can be several reasons why.<br>User can have empty routing table e.g. users LCR does not have providers. Also these providers could not have rates for dialed destination.<br>To find exact cause for this problem please use Call Tracing.<br>Call Tracing is best tool to troubleshoot this problem.<br>For more info consult online manual at wiki.kolmisoft.com<br>'),(762,205,'<b>205 - MOR not authorized to work on this computer</b><br>Make sure you have serial key entered in configuration file.<br>If you changed hardware recently, please contact Kolmisoft for new serial key.<br>For more information please consult online manual at wiki.kolmisoft.com<br>'),(763,206,'<b>206 - server_id is not set in mor.conf file</b><br>'),(764,207,'<b>207 - Not clear who should receive call</b><br>This error happens when call comes from provider which is not configured as user.<br>Create user for this provider in the system and assign provider to this user to allow him to make calls.<br>For more information please consult online manual at wiki.kolmisoft.com<br>'),(765,208,'<b>208 - MOR can not make more calls</b><br>This means that system reached maximum allowed calls at the same time.<br>To remove the limit please buy full version of the system.<br>For more information please consult online manual at wiki.kolmisoft.com<br>'),(766,209,'<b>209 - Test time exceeded</b><br>Testing period for this system is over.<br>Please contact Kolmisoft to purchase the system.<br>For more information please consult online manual at wiki.kolmisoft.com<br>'),(767,210,'<b>210 - Balance > 0, but not enough to make call 1s in length</b><br>Increase balance for user to allow him to make calls.<br>For more information please use Call Tracing or consult online manual at wiki.kolmisoft.com<br>'),(768,211,'<b>211 - Low balance for user</b><br>Increase balance for user to allow him to make calls.<br>For more information please use Call Tracing or consult online manual at wiki.kolmisoft.com<br>'),(769,212,'<b>212 - Too low balance for more simultaneous calls</b><br>This user already has active call and part of his balance is reserved for this call.<br>Remaining balance is not enough to start new call.<br>Increase users balance to allow him to make more calls at the same time.<br>For more information please consult online manual at wiki.kolmisoft.com<br>'),(770,213,'<b>213 - Low balance for DID owner</b><br>This DID has price which should be paid by DIDs owner.<br>But owner does not have enough balance to cover this call and that is why this call cannot be completed.<br>Increase balance for DIDs owner to solve this problem.<br>For more information please consult online manual at wiki.kolmisoft.com<br>'),(771,214,'<b>214 - Too low balance for DID owner for more simultaneous calls</b><br>Dialing to this DID has price which should be paid by DIDs owner.<br>But owner does not have enough balance to cover this call and that is why this call cannot be completed. Increase balance for DIDs owner to solve this problem.<br>For more information please consult online manual at wiki.kolmisoft.com<br>'),(772,215,'<b>215 - Low balance for reseller</b><br>Increase balance for reseller to allow him and his users to make calls.<br>For more information please use Call Tracing or consult online manual at wiki.kolmisoft.com<br>'),(773,216,'<b>216 - Too low balance for reseller for more simultaneous calls</b><br>Increase balance for reseller to allow him and his users to make more calls at the same time.<br> For more information please use Call Tracing or consult online manual at wiki.kolmisoft.com<br>'),(774,217,'<b>217 - Callback not initiated because device not found by ANI</b><br>Make sure CallerID which initiates callback is in the system.<br>For more information please consult online manual at wiki.kolmisoft.com<br>'),(775,218,'<b>218 - Reseller does not allow loss calls</b><br>This happens when reseller sets lower price for his user compared to the price he buys from system owner and user is not allowed to make loss calls.<br>System saves reseller from getting loss. Set higher rate or allow loss calls for resellers user to fix this problem.<br>For more information please consult online manual at wiki.kolmisoft.com<br>'),(776,219,'<b>219 - DID has reached call limit.</b><br>No more calls allowed to this DID.<br>To resolve this increased call limit for this DID.<br>For more information please consult online manual at wiki.kolmisoft.com<br>'),(777,220,'<b>220 - User call limit reached.</b><br>Increase his limit in users settings if you want to allow him to make more simultaneous calls.<br>For more information please consult online manual at wiki.kolmisoft.com<br>'),(778,221,'<b>221 - Device call limit reached.</b><br>Device is not allowed to make more simultaneous calls.<br>Increase his limit in devices settings if you want to allow him to make more simultaneous calls.<br>For more information please consult online manual at wiki.kolmisoft.com<br>'),(779,222,'<b>222 - Resellers call limit reached.</b><br>Reseller is not allowed to make more simultaneous calls.<br>Increase his limit in users settings if you want to allow him to make more simultaneous calls.<br>For more information please consult online manual at wiki.kolmisoft.com<br>'),(780,223,'<b>223 - Providers call limit reached.</b><br>Providers cannot terminate more calls.<br>Increase this limit in his settings to allow provider terminate more calls at the same time.<br>For more information please consult online manual at wiki.kolmisoft.com<br>'),(781,224,'<b>224 - Provider skipped because his rate is higher than users rate.</b><br>System saves system owner from taking loss from such call when self cost is higher when sell price.<br>Call Tracing is best tool to troubleshoot this problem. For more info consult online manual at wiki.kolmisoft.com<br>'),(782,225,'<b>225 - CallerID is banned</b><br>Unban this CallerID if you want call to pass.<br>For more information please consult online manual at wiki.kolmisoft.com<br>'),(783,226,'<b>226 - DID is free</b><br>Assign this DID to some device or dial plan in configuration to allow call to go from this DID to some destination.<br>Currently it cannot be completed, because system does not know where to send call.<br>For more information please consult online manual at wiki.kolmisoft.com<br>'),(784,230,'<b>230 -  Connection returned error code 0 instead of real code.</b><br>This happens when using IAX2 or H323 protocols.<br>Switch to SIP to get proper call hangup codes which helps troubleshoot problems.<br>For more information please consult online manual at wiki.kolmisoft.com<br>'),(785,231,'<b>231 -  Provider unreachable. </b><br>Make sure providers settings are entered correctly.<br>Most common error is wrong IP address or port.<br>For more information please consult online manual at wiki.kolmisoft.com<br>'),(786,227,'<b>227 - Calling Card PIN is not entered</b><br />User did not entered Calling Card PIN or (NUMBER + PIN)<br />'),(787,228,'<b>228 - Calling Card Destination is not entered</b><br />User did not entered Calling Card Destination<br />'),(788,229,'<b>229 - DID is reserved</b><br />DID is reserved to some User but not assigned to any Device.<br/ >Assign the DID to some Device or Dial Plan to route the call correctly<br />'),(789,232,'<b>232 - Callback DID not available</b><br />Callback does not know to which DID connect the call.<br />Check Callback configuration in Dial Plans menu.<br />'),(790,233,'<b>233 - Skype Addon Disabled</b><br />Skype Addon is not available<br />'),(791,234,'<b>234 - Internal Loop</b><br />You have misconfiguration which creates internal loop<br />'),(792,235,'<b>235 - Providers rate higher by percent</b><br />Provider is skipped, because LCR by price is used and percent is applied to first Provider<br />'),(793,236,'<b>236 - Callback initiation too early</b><br />Callback initiation denied because it is too early from the initiation call from same CallerID.<br /> E.g. First call is made from same CallerID and all other attempts to initiate callback are denied if they are too early. <br /> It is not allowed to initiate more callback attempts from same CallerID in the time period, which is necessary to wait after Callback Initiation Call and Call Leg A. This period is set in Callback Dial-Plan Edit window (Wait (s)).<br /> Such callback initiation control is implemented due to the case when providers send several INVITE packets for the same call.<br />Using this protection, only first INVITE will initiate the callback. All other attempts will be dropped with such HGC: 236<br />If you see such HGC near your call - also check for the good call, which should be made for first INVITE.<br />And you can ignore all these following call attempts or you can contact your DID Provider by asking to fix they call sending routines to avoid several INVITES.<br />By our experience DID Providers do not care to do that<br />'),(794,237,'<b>237 - DID User is blocked</b><br />Call fails, because DID User is blocked and DID cannot be used for blocked Users<br />'),(795,238,'<b>238 - Provider used its daily call time limit</b><br />Provider has daily call limit and call cannot pass over this provider because today too much call time was used over this Provider.<br />Tomorrow daily limit will be reset and calls over this Provider will be possible again (until limit will be reached again)<br />This limitation is only for OUTGOING calls<br />'),(796,239,'<b>239 - Device used its daily call time limit</b><br />User has daily call limit and users call cannot pass because today too much call time was used by this User.<br />Tomorrow daily limit will be reset and calls by this User will be possible again.<br />This limitation is only for OUTGOING calls<br />'),(797,240,'<b>240 - Provider belongs to the User which makes call</b><br />Provider belongs to the User which makes call.<br />In order to avoid the loop, this Provider will be skipped for such call<br />'),(798,241,'<b>241 - Local Caller canceled the call before call was answered</b>'),(799,242,'<b>242 - No Rates for Reseller</b><br/>This cause indicates, that reseller does not have rates for the call destination.<br/><br/>What you can do:<br/><ol><li>Check which tariff plan Reseller is using.</li><li>Apply the correct rates for your destination.</li><li>Use Call Tracing to find the exact problem.</li></ol>'),(800,243,'<b>243 - Provider skipped because of CPS limitation</b>'),(801,244,'<b>244 - Device call aborted because of CPS limitation</b>'),(802,245,'<b>245 - Provider skipped because of balance limitation</b>'),(803,246,'<b>246 - Duplicate call hangup</b><br/>This cause prevents you from duplicate calls. It means that two or more calls are sent from the same User account with the same Caller ID and Destination Number.'),(804,248,'<b>248 - Call was terminated because FAS (False Answer Supervision) control detected an issue.</b><br/><br/>Possible issues:<br/><br/>1. Bad quality of Provider<br/>2. Provider uses FAS'),(805,247,'<b>247 - Dead Provider skipped</b><br/>Provider used to terminate the call was disabled by MOR because it was unreachable.<br/>Functionality which disables provider can be disabled/enabled by option \"Periodic check\" in Provider settings, SIP Specific section.'),(806,300,'300 - Not authenticated (accountcode = 0)'),(807,301,'301 - Originator not found'),(808,302,'302 - Global Call Limit reached'),(809,303,'303 - Originator Capacity reached'),(810,304,'304 - CPS Limit reached'),(811,305,'305 - Source (CallerID) not accepted by regexp'),(812,306,'306 - Originator Balance Limit reached (Balance Min)'),(813,307,'307 - Originator Rate not found'),(814,308,'308 - Dial Peer not found'),(815,309,'309 - No Dial Peer is available by regexp'),(816,310,'310 - Suitable Terminator not found'),(817,311,'311 - User is blocked'),(818,312,'312 - Caller cancelled the call (CANCEL)'),(819,313,'313 - User call limit reached');
/*!40000 ALTER TABLE `hangupcausecodes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoicedetails`
--

DROP TABLE IF EXISTS `invoicedetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invoicedetails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `price` decimal(30,15) DEFAULT '0.000000000000000',
  `invdet_type` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoicedetails`
--

LOCK TABLES `invoicedetails` WRITE;
/*!40000 ALTER TABLE `invoicedetails` DISABLE KEYS */;
/*!40000 ALTER TABLE `invoicedetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoices`
--

DROP TABLE IF EXISTS `invoices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invoices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `period_start` date NOT NULL COMMENT 'when start to bill',
  `period_end` date NOT NULL COMMENT 'till when bill',
  `issue_date` date NOT NULL COMMENT 'when invoice issued',
  `paid` tinyint(4) NOT NULL DEFAULT '0',
  `paid_date` datetime DEFAULT NULL,
  `price` decimal(30,15) DEFAULT '0.000000000000000',
  `price_with_vat` decimal(30,15) DEFAULT '0.000000000000000',
  `payment_id` int(11) DEFAULT NULL,
  `number` varchar(255) NOT NULL,
  `sent_email` int(11) DEFAULT '0',
  `sent_manually` int(11) DEFAULT '0',
  `invoice_type` varchar(20) DEFAULT NULL,
  `number_type` tinyint(4) DEFAULT '1' COMMENT 'invoice number format type',
  `tax_id` int(11) DEFAULT NULL COMMENT 'Tax for invoice',
  `comment` text,
  `tax_1_value` decimal(30,15) DEFAULT '0.000000000000000',
  `tax_2_value` decimal(30,15) DEFAULT '0.000000000000000',
  `tax_3_value` decimal(30,15) DEFAULT '0.000000000000000',
  `tax_4_value` decimal(30,15) DEFAULT '0.000000000000000',
  `invoice_precision` int(11) DEFAULT '2',
  `invoice_exchange_rate` decimal(30,15) DEFAULT '1.000000000000000',
  `invoice_currency` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `periodstart` (`period_start`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoices`
--

LOCK TABLES `invoices` WRITE;
/*!40000 ALTER TABLE `invoices` DISABLE KEYS */;
/*!40000 ALTER TABLE `invoices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `iplocations`
--

DROP TABLE IF EXISTS `iplocations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iplocations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(255) NOT NULL,
  `latitude` decimal(30,15) DEFAULT '0.000000000000000',
  `longitude` decimal(30,15) DEFAULT '0.000000000000000',
  `country` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `iplocations`
--

LOCK TABLES `iplocations` WRITE;
/*!40000 ALTER TABLE `iplocations` DISABLE KEYS */;
INSERT INTO `iplocations` VALUES (1,'127.0.0.1',0.000000000000000,0.000000000000000,'',''),(2,'5.9.120.86',51.000000000000000,9.000000000000000,'Germany',NULL);
/*!40000 ALTER TABLE `iplocations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ivr_action_logs`
--

DROP TABLE IF EXISTS `ivr_action_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ivr_action_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `action_text` varchar(255) DEFAULT NULL,
  `uniqueid` varchar(30) DEFAULT NULL,
  `adnumber_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `adnumber_id` (`adnumber_id`),
  KEY `adnumber_id_2` (`adnumber_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ivr_action_logs`
--

LOCK TABLES `ivr_action_logs` WRITE;
/*!40000 ALTER TABLE `ivr_action_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `ivr_action_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ivr_actions`
--

DROP TABLE IF EXISTS `ivr_actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ivr_actions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `ivr_block_id` int(11) NOT NULL,
  `data1` varchar(255) DEFAULT NULL,
  `data2` varchar(255) DEFAULT NULL,
  `data3` varchar(255) DEFAULT NULL,
  `data4` varchar(255) DEFAULT NULL,
  `data5` varchar(255) DEFAULT NULL,
  `data6` varchar(255) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ivr_actions`
--

LOCK TABLES `ivr_actions` WRITE;
/*!40000 ALTER TABLE `ivr_actions` DISABLE KEYS */;
/*!40000 ALTER TABLE `ivr_actions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ivr_blocks`
--

DROP TABLE IF EXISTS `ivr_blocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ivr_blocks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `ivr_id` int(11) DEFAULT NULL,
  `timeout_response` int(11) DEFAULT NULL,
  `timeout_digits` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ivr_blocks`
--

LOCK TABLES `ivr_blocks` WRITE;
/*!40000 ALTER TABLE `ivr_blocks` DISABLE KEYS */;
/*!40000 ALTER TABLE `ivr_blocks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ivr_extensions`
--

DROP TABLE IF EXISTS `ivr_extensions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ivr_extensions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `exten` varchar(255) NOT NULL,
  `goto_ivr_block_id` int(11) NOT NULL,
  `ivr_block_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ivr_extensions`
--

LOCK TABLES `ivr_extensions` WRITE;
/*!40000 ALTER TABLE `ivr_extensions` DISABLE KEYS */;
/*!40000 ALTER TABLE `ivr_extensions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ivr_sound_files`
--

DROP TABLE IF EXISTS `ivr_sound_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ivr_sound_files` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ivr_voice_id` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `size` int(11) DEFAULT '0',
  `updated_at` datetime DEFAULT NULL,
  `readonly` int(11) DEFAULT '0' COMMENT 'default sound-files cannot be deleted',
  `user_id` int(11) DEFAULT '0' COMMENT 'ID of the user who owns ivr_sound_files',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=141 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ivr_sound_files`
--

LOCK TABLES `ivr_sound_files` WRITE;
/*!40000 ALTER TABLE `ivr_sound_files` DISABLE KEYS */;
INSERT INTO `ivr_sound_files` VALUES (1,'1','silence1.wav','1 second of silence',NULL,16046,NULL,0,0),(2,'1','silence2.wav','2 seconds of silence',NULL,32046,NULL,0,0),(3,'1','silence3.wav','3 seconds of silence',NULL,48046,NULL,0,0),(4,'1','silence4.wav','4 seconds of silence',NULL,64046,NULL,0,0),(5,'1','silence5.wav','5 seconds of silence',NULL,80046,NULL,0,0),(6,'1','silence6.wav','6 seconds of silence',NULL,96046,NULL,0,0),(7,'1','silence7.wav','7 seconds of silence',NULL,112046,NULL,0,0),(8,'1','silence8.wav','8 seconds of silence',NULL,128046,NULL,0,0),(9,'1','silence9.wav','9 seconds of silence',NULL,144046,NULL,0,0),(10,'1','silence10.wav','10 seconds of silence',NULL,160046,NULL,0,0),(11,'2','cc_enter_card_number_pin.wav','Please enter your card and pin number',NULL,0,NULL,1,0),(12,'2','cc_enter_pin.wav','Please enter your pin number',NULL,0,NULL,1,0),(13,'2','cc_you_have_entered_nothing.wav','You have entered nothing',NULL,0,NULL,1,0),(14,'2','cc_card_not_found.wav','Card not found',NULL,0,NULL,1,0),(15,'2','cc_card_expired.wav','Card expired',NULL,0,NULL,1,0),(16,'2','cc_card_is_not_sold_yet.wav','Card is not sold yet',NULL,0,NULL,1,0),(17,'2','cc_card_is_empty.wav','Card is empty',NULL,0,NULL,1,0),(18,'2','cc_please_enter_number.wav','Please enter the number you wish to call',NULL,0,NULL,1,0),(19,'2','cc_busy.wav','The number is busy',NULL,0,NULL,1,0),(20,'2','cc_unreachable.wav','The number is unreachable',NULL,0,NULL,1,0),(21,'2','cc_callingcard_choices.wav','Press one to enter new number...',NULL,0,NULL,1,0),(22,'2','cc_dialing_previous_number.wav','Dialing previous number',NULL,0,NULL,1,0),(23,'2','cc_goodbye.wav','Goodbye',NULL,0,NULL,1,0),(24,'3','cc_enter_card_number_pin.wav','Please enter your card and pin number',NULL,0,NULL,1,0),(25,'3','cc_enter_pin.wav','Please enter your pin number',NULL,0,NULL,1,0),(26,'3','cc_you_have_entered_nothing.wav','You have entered nothing',NULL,0,NULL,1,0),(27,'3','cc_card_not_found.wav','Card not found',NULL,0,NULL,1,0),(28,'3','cc_card_expired.wav','Card expired',NULL,0,NULL,1,0),(29,'3','cc_card_is_not_sold_yet.wav','Card is not sold yet',NULL,0,NULL,1,0),(30,'3','cc_card_is_empty.wav','Card is empty',NULL,0,NULL,1,0),(31,'3','cc_please_enter_number.wav','Please enter the number you wish to call',NULL,0,NULL,1,0),(32,'3','cc_busy.wav','The number is busy',NULL,0,NULL,1,0),(33,'3','cc_unreachable.wav','The number is unreachable',NULL,0,NULL,1,0),(34,'3','cc_callingcard_choices.wav','Press one to enter new number...',NULL,0,NULL,1,0),(35,'3','cc_dialing_previous_number.wav','Dialing previous number',NULL,0,NULL,1,0),(36,'3','cc_goodbye.wav','Goodbye',NULL,0,NULL,1,0),(37,'5','cc_enter_card_number_pin.wav','Please enter your card and pin number',NULL,0,NULL,1,0),(38,'5','cc_enter_pin.wav','Please enter your pin number',NULL,0,NULL,1,0),(39,'5','cc_you_have_entered_nothing.wav','You have entered nothing',NULL,0,NULL,1,0),(40,'5','cc_card_not_found.wav','Card not found',NULL,0,NULL,1,0),(41,'5','cc_card_expired.wav','Card expired',NULL,0,NULL,1,0),(42,'5','cc_card_is_not_sold_yet.wav','Card is not sold yet',NULL,0,NULL,1,0),(43,'5','cc_card_is_empty.wav','Card is empty',NULL,0,NULL,1,0),(44,'5','cc_please_enter_number.wav','Please enter the number you wish to call',NULL,0,NULL,1,0),(45,'5','cc_busy.wav','The number is busy',NULL,0,NULL,1,0),(46,'5','cc_unreachable.wav','The number is unreachable',NULL,0,NULL,1,0),(47,'5','cc_callingcard_choices.wav','Press one to enter new number...',NULL,0,NULL,1,0),(48,'5','cc_dialing_previous_number.wav','Dialing previous number',NULL,0,NULL,1,0),(49,'5','cc_goodbye.wav','Goodbye',NULL,0,NULL,1,0),(50,'4','cc_enter_card_number_pin.wav','Please enter your card and pin number',NULL,0,NULL,1,0),(51,'4','cc_enter_pin.wav','Please enter your pin number',NULL,0,NULL,1,0),(52,'4','cc_you_have_entered_nothing.wav','You have entered nothing',NULL,0,NULL,1,0),(53,'4','cc_card_not_found.wav','Card not found',NULL,0,NULL,1,0),(54,'4','cc_card_expired.wav','Card expired',NULL,0,NULL,1,0),(55,'4','cc_card_is_not_sold_yet.wav','Card is not sold yet',NULL,0,NULL,1,0),(56,'4','cc_card_is_empty.wav','Card is empty',NULL,0,NULL,1,0),(57,'4','cc_please_enter_number.wav','Please enter the number you wish to call',NULL,0,NULL,1,0),(58,'4','cc_busy.wav','The number is busy',NULL,0,NULL,1,0),(59,'4','cc_unreachable.wav','The number is unreachable',NULL,0,NULL,1,0),(60,'4','cc_callingcard_choices.wav','Press one to enter new number...',NULL,0,NULL,1,0),(61,'4','cc_dialing_previous_number.wav','Dialing previous number',NULL,0,NULL,1,0),(62,'4','cc_goodbye.wav','Goodbye',NULL,0,NULL,1,0),(63,'7','cc_enter_card_number_pin.wav','Please enter your card and pin number',NULL,0,NULL,1,0),(64,'7','cc_enter_pin.wav','Please enter your pin number',NULL,0,NULL,1,0),(65,'7','cc_you_have_entered_nothing.wav','You have entered nothing',NULL,0,NULL,1,0),(66,'7','cc_card_not_found.wav','Card not found',NULL,0,NULL,1,0),(67,'7','cc_card_expired.wav','Card expired',NULL,0,NULL,1,0),(68,'7','cc_card_is_not_sold_yet.wav','Card is not sold yet',NULL,0,NULL,1,0),(69,'7','cc_card_is_empty.wav','Card is empty',NULL,0,NULL,1,0),(70,'7','cc_please_enter_number.wav','Please enter the number you wish to call',NULL,0,NULL,1,0),(71,'7','cc_busy.wav','The number is busy',NULL,0,NULL,1,0),(72,'7','cc_unreachable.wav','The number is unreachable',NULL,0,NULL,1,0),(73,'7','cc_callingcard_choices.wav','Press one to enter new number...',NULL,0,NULL,1,0),(74,'7','cc_dialing_previous_number.wav','Dialing previous number',NULL,0,NULL,1,0),(75,'7','cc_goodbye.wav','Goodbye',NULL,0,NULL,1,0),(76,'6','cc_enter_card_number_pin.wav','Please enter your card and pin number',NULL,0,NULL,1,0),(77,'6','cc_enter_pin.wav','Please enter your pin number',NULL,0,NULL,1,0),(78,'6','cc_you_have_entered_nothing.wav','You have entered nothing',NULL,0,NULL,1,0),(79,'6','cc_card_not_found.wav','Card not found',NULL,0,NULL,1,0),(80,'6','cc_card_expired.wav','Card expired',NULL,0,NULL,1,0),(81,'6','cc_card_is_not_sold_yet.wav','Card is not sold yet',NULL,0,NULL,1,0),(82,'6','cc_card_is_empty.wav','Card is empty',NULL,0,NULL,1,0),(83,'6','cc_please_enter_number.wav','Please enter the number you wish to call',NULL,0,NULL,1,0),(84,'6','cc_busy.wav','The number is busy',NULL,0,NULL,1,0),(85,'6','cc_unreachable.wav','The number is unreachable',NULL,0,NULL,1,0),(86,'6','cc_callingcard_choices.wav','Press one to enter new number...',NULL,0,NULL,1,0),(87,'6','cc_dialing_previous_number.wav','Dialing previous number',NULL,0,NULL,1,0),(88,'6','cc_goodbye.wav','Goodbye',NULL,0,NULL,1,0),(89,'8','cc_enter_card_number_pin.wav','Please enter your card and pin number',NULL,0,NULL,1,0),(90,'8','cc_enter_pin.wav','Please enter your pin number',NULL,0,NULL,1,0),(91,'8','cc_you_have_entered_nothing.wav','You have entered nothing',NULL,0,NULL,1,0),(92,'8','cc_card_not_found.wav','Card not found',NULL,0,NULL,1,0),(93,'8','cc_card_expired.wav','Card expired',NULL,0,NULL,1,0),(94,'8','cc_card_is_not_sold_yet.wav','Card is not sold yet',NULL,0,NULL,1,0),(95,'8','cc_card_is_empty.wav','Card is empty',NULL,0,NULL,1,0),(96,'8','cc_please_enter_number.wav','Please enter the number you wish to call',NULL,0,NULL,1,0),(97,'8','cc_busy.wav','The number is busy',NULL,0,NULL,1,0),(98,'8','cc_unreachable.wav','The number is unreachable',NULL,0,NULL,1,0),(99,'8','cc_callingcard_choices.wav','Press one to enter new number...',NULL,0,NULL,1,0),(100,'8','cc_dialing_previous_number.wav','Dialing previous number',NULL,0,NULL,1,0),(101,'8','cc_goodbye.wav','Goodbye',NULL,0,NULL,1,0),(102,'9','cc_enter_card_number_pin.wav','Please enter your card and pin number',NULL,0,NULL,1,0),(103,'9','cc_enter_pin.wav','Please enter your pin number',NULL,0,NULL,1,0),(104,'9','cc_you_have_entered_nothing.wav','You have entered nothing',NULL,0,NULL,1,0),(105,'9','cc_card_not_found.wav','Card not found',NULL,0,NULL,1,0),(106,'9','cc_card_expired.wav','Card expired',NULL,0,NULL,1,0),(107,'9','cc_card_is_not_sold_yet.wav','Card is not sold yet',NULL,0,NULL,1,0),(108,'9','cc_card_is_empty.wav','Card is empty',NULL,0,NULL,1,0),(109,'9','cc_please_enter_number.wav','Please enter the number you wish to call',NULL,0,NULL,1,0),(110,'9','cc_busy.wav','The number is busy',NULL,0,NULL,1,0),(111,'9','cc_unreachable.wav','The number is unreachable',NULL,0,NULL,1,0),(112,'9','cc_callingcard_choices.wav','Press one to enter new number...',NULL,0,NULL,1,0),(113,'9','cc_dialing_previous_number.wav','Dialing previous number',NULL,0,NULL,1,0),(114,'9','cc_goodbye.wav','Goodbye',NULL,0,NULL,1,0),(115,'10','cc_enter_card_number_pin.wav','Please enter your card and pin number',NULL,0,NULL,1,0),(116,'10','cc_enter_pin.wav','Please enter your pin number',NULL,0,NULL,1,0),(117,'10','cc_you_have_entered_nothing.wav','You have entered nothing',NULL,0,NULL,1,0),(118,'10','cc_card_not_found.wav','Card not found',NULL,0,NULL,1,0),(119,'10','cc_card_expired.wav','Card expired',NULL,0,NULL,1,0),(120,'10','cc_card_is_not_sold_yet.wav','Card is not sold yet',NULL,0,NULL,1,0),(121,'10','cc_card_is_empty.wav','Card is empty',NULL,0,NULL,1,0),(122,'10','cc_please_enter_number.wav','Please enter the number you wish to call',NULL,0,NULL,1,0),(123,'10','cc_busy.wav','The number is busy',NULL,0,NULL,1,0),(124,'10','cc_unreachable.wav','The number is unreachable',NULL,0,NULL,1,0),(125,'10','cc_callingcard_choices.wav','Press one to enter new number...',NULL,0,NULL,1,0),(126,'10','cc_dialing_previous_number.wav','Dialing previous number',NULL,0,NULL,1,0),(127,'10','cc_goodbye.wav','Goodbye',NULL,0,NULL,1,0),(128,'11','cc_enter_card_number_pin.wav','Please enter your card and pin number',NULL,0,NULL,1,0),(129,'11','cc_enter_pin.wav','Please enter your pin number',NULL,0,NULL,1,0),(130,'11','cc_you_have_entered_nothing.wav','You have entered nothing',NULL,0,NULL,1,0),(131,'11','cc_card_not_found.wav','Card not found',NULL,0,NULL,1,0),(132,'11','cc_card_expired.wav','Card expired',NULL,0,NULL,1,0),(133,'11','cc_card_is_not_sold_yet.wav','Card is not sold yet',NULL,0,NULL,1,0),(134,'11','cc_card_is_empty.wav','Card is empty',NULL,0,NULL,1,0),(135,'11','cc_please_enter_number.wav','Please enter the number you wish to call',NULL,0,NULL,1,0),(136,'11','cc_busy.wav','The number is busy',NULL,0,NULL,1,0),(137,'11','cc_unreachable.wav','The number is unreachable',NULL,0,NULL,1,0),(138,'11','cc_callingcard_choices.wav','Press one to enter new number...',NULL,0,NULL,1,0),(139,'11','cc_dialing_previous_number.wav','Dialing previous number',NULL,0,NULL,1,0),(140,'11','cc_goodbye.wav','Goodbye',NULL,0,NULL,1,0);
/*!40000 ALTER TABLE `ivr_sound_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ivr_timeperiods`
--

DROP TABLE IF EXISTS `ivr_timeperiods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ivr_timeperiods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `start_hour` int(11) NOT NULL,
  `end_hour` int(11) NOT NULL,
  `start_minute` int(11) NOT NULL,
  `end_minute` int(11) NOT NULL,
  `start_weekday` varchar(3) DEFAULT NULL,
  `end_weekday` varchar(3) DEFAULT NULL,
  `start_day` int(11) DEFAULT NULL,
  `end_day` int(11) DEFAULT NULL,
  `start_month` int(11) DEFAULT NULL,
  `end_month` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT '0' COMMENT 'ID of the user who owns ivr_timeperiods',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ivr_timeperiods`
--

LOCK TABLES `ivr_timeperiods` WRITE;
/*!40000 ALTER TABLE `ivr_timeperiods` DISABLE KEYS */;
/*!40000 ALTER TABLE `ivr_timeperiods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ivr_voices`
--

DROP TABLE IF EXISTS `ivr_voices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ivr_voices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `voice` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `readonly` int(11) DEFAULT '0' COMMENT 'default languages-voices cannot be deleted',
  `user_id` int(11) DEFAULT '0' COMMENT 'ID of the user who owns ivr_voices',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ivr_voices`
--

LOCK TABLES `ivr_voices` WRITE;
/*!40000 ALTER TABLE `ivr_voices` DISABLE KEYS */;
INSERT INTO `ivr_voices` VALUES (1,'silence','Silence files for IVR','2010-05-06 19:02:52',0,0),(2,'en','English voice','2010-05-01 00:00:00',1,0),(3,'es','Spanish voice','2010-05-01 00:00:00',1,0),(4,'ru','Russian voice','2010-05-01 00:00:00',1,0),(5,'fr','French voice','2010-05-01 00:00:00',1,0),(6,'zn','Chinese voice','2010-05-01 00:00:00',1,0),(7,'vn','Vietnamese voice','2010-05-01 00:00:00',1,0),(8,'pt_br','Brazilian-Portuguese voice','2010-05-01 00:00:00',1,0),(9,'it','Italian voice','2010-05-01 00:00:00',1,0),(10,'de','German voice','2010-05-01 00:00:00',1,0),(11,'he','Hebrew voice','2010-05-01 00:00:00',1,0);
/*!40000 ALTER TABLE `ivr_voices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ivrs`
--

DROP TABLE IF EXISTS `ivrs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ivrs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `start_block_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT '0' COMMENT 'ID of the user who owns ivr',
  `all_users_can_use` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ivrs`
--

LOCK TABLES `ivrs` WRITE;
/*!40000 ALTER TABLE `ivrs` DISABLE KEYS */;
/*!40000 ALTER TABLE `ivrs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lcr_partials`
--

DROP TABLE IF EXISTS `lcr_partials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lcr_partials` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `main_lcr_id` int(11) NOT NULL,
  `prefix` varchar(255) NOT NULL,
  `lcr_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT '0' COMMENT 'ID of the user who owns lcr_partials',
  PRIMARY KEY (`id`),
  KEY `user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lcr_partials`
--

LOCK TABLES `lcr_partials` WRITE;
/*!40000 ALTER TABLE `lcr_partials` DISABLE KEYS */;
/*!40000 ALTER TABLE `lcr_partials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lcr_timeperiods`
--

DROP TABLE IF EXISTS `lcr_timeperiods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lcr_timeperiods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `start_hour` int(11) DEFAULT NULL,
  `end_hour` int(11) DEFAULT NULL,
  `start_minute` int(11) DEFAULT NULL,
  `end_minute` int(11) DEFAULT NULL,
  `start_weekday` varchar(3) DEFAULT NULL,
  `end_weekday` varchar(3) DEFAULT NULL,
  `start_day` int(11) DEFAULT NULL,
  `end_day` int(11) DEFAULT NULL,
  `start_month` int(11) DEFAULT NULL,
  `end_month` int(11) DEFAULT NULL,
  `main_lcr_id` int(11) NOT NULL,
  `lcr_id` int(11) NOT NULL DEFAULT '0',
  `active` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lcr_timeperiods`
--

LOCK TABLES `lcr_timeperiods` WRITE;
/*!40000 ALTER TABLE `lcr_timeperiods` DISABLE KEYS */;
/*!40000 ALTER TABLE `lcr_timeperiods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lcrproviders`
--

DROP TABLE IF EXISTS `lcrproviders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lcrproviders` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `lcr_id` bigint(20) NOT NULL DEFAULT '0',
  `provider_id` bigint(20) NOT NULL DEFAULT '0',
  `active` tinyint(4) NOT NULL DEFAULT '1',
  `priority` int(11) DEFAULT '1',
  `percent` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `active_lcr_prov` (`active`,`lcr_id`,`provider_id`),
  KEY `lcrproviders_ibfk` (`lcr_id`),
  CONSTRAINT `lcrproviders_ibfk` FOREIGN KEY (`lcr_id`) REFERENCES `lcrs` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lcrproviders`
--

LOCK TABLES `lcrproviders` WRITE;
/*!40000 ALTER TABLE `lcrproviders` DISABLE KEYS */;
INSERT INTO `lcrproviders` VALUES (2,1,2,1,1,0),(3,2,3,1,1,0);
/*!40000 ALTER TABLE `lcrproviders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lcrs`
--

DROP TABLE IF EXISTS `lcrs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lcrs` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `order` varchar(255) NOT NULL DEFAULT 'price',
  `user_id` int(11) DEFAULT '0' COMMENT 'ID of the user who owns lcrs',
  `first_provider_percent_limit` decimal(30,15) DEFAULT '0.000000000000000',
  `failover_provider_id` bigint(20) DEFAULT NULL,
  `no_failover` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `user_id_index` (`user_id`),
  KEY `failover_provider_index` (`failover_provider_id`),
  CONSTRAINT `failover_provider` FOREIGN KEY (`failover_provider_id`) REFERENCES `providers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lcrs`
--

LOCK TABLES `lcrs` WRITE;
/*!40000 ALTER TABLE `lcrs` DISABLE KEYS */;
INSERT INTO `lcrs` VALUES (1,'PREMIUM','priority',0,0.000000000000000,NULL,1),(2,'STANDARD','priority',0,0.000000000000000,NULL,1);
/*!40000 ALTER TABLE `lcrs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locationrules`
--

DROP TABLE IF EXISTS `locationrules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `locationrules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `location_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `enabled` tinyint(4) NOT NULL DEFAULT '1',
  `cut` varchar(255) DEFAULT NULL,
  `add` varchar(255) DEFAULT NULL,
  `minlen` int(11) NOT NULL DEFAULT '1',
  `maxlen` int(11) NOT NULL DEFAULT '100',
  `lr_type` enum('dst','src') DEFAULT 'dst',
  `lcr_id` int(11) DEFAULT NULL,
  `tariff_id` int(11) DEFAULT NULL,
  `did_id` int(11) DEFAULT NULL COMMENT 'Route to DID',
  `device_id` int(11) DEFAULT NULL COMMENT 'Change call owner',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locationrules`
--

LOCK TABLES `locationrules` WRITE;
/*!40000 ALTER TABLE `locationrules` DISABLE KEYS */;
INSERT INTO `locationrules` VALUES (1,1,'Int. prefix',1,'00','',10,20,'dst',NULL,NULL,NULL,NULL),(2,1,'STANDARD prefix',1,'10#','',10,20,'dst',2,4,NULL,NULL);
/*!40000 ALTER TABLE `locationrules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locations`
--

DROP TABLE IF EXISTS `locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `locations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT '0' COMMENT 'ID of the user who owns location',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locations`
--

LOCK TABLES `locations` WRITE;
/*!40000 ALTER TABLE `locations` DISABLE KEYS */;
INSERT INTO `locations` VALUES (1,'Global',0);
/*!40000 ALTER TABLE `locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mohs`
--

DROP TABLE IF EXISTS `mohs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mohs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `moh_name` varchar(255) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `ivr_voice_id` varchar(255) DEFAULT NULL,
  `random` enum('yes','no') DEFAULT 'yes',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mohs`
--

LOCK TABLES `mohs` WRITE;
/*!40000 ALTER TABLE `mohs` DISABLE KEYS */;
/*!40000 ALTER TABLE `mohs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `number_pools`
--

DROP TABLE IF EXISTS `number_pools`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `number_pools` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `comment` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `number_pools`
--

LOCK TABLES `number_pools` WRITE;
/*!40000 ALTER TABLE `number_pools` DISABLE KEYS */;
/*!40000 ALTER TABLE `number_pools` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `numbers`
--

DROP TABLE IF EXISTS `numbers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `numbers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` varchar(255) DEFAULT NULL,
  `number_pool_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `number` (`number`,`number_pool_id`),
  KEY `number_2` (`number`,`number_pool_id`),
  KEY `number_3` (`number`,`number_pool_id`),
  KEY `number_4` (`number`,`number_pool_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `numbers`
--

LOCK TABLES `numbers` WRITE;
/*!40000 ALTER TABLE `numbers` DISABLE KEYS */;
/*!40000 ALTER TABLE `numbers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `paymenttype` varchar(255) DEFAULT NULL,
  `amount` decimal(30,15) DEFAULT '0.000000000000000',
  `currency` varchar(5) NOT NULL DEFAULT 'USD',
  `email` varchar(255) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `completed` tinyint(4) NOT NULL DEFAULT '0',
  `transaction_id` varchar(255) DEFAULT NULL,
  `shipped_at` datetime DEFAULT NULL,
  `fee` decimal(30,15) DEFAULT '0.000000000000000',
  `gross` decimal(30,15) DEFAULT '0.000000000000000',
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `payer_email` varchar(255) DEFAULT NULL,
  `residence_country` varchar(255) DEFAULT NULL,
  `payer_status` varchar(255) DEFAULT NULL,
  `tax` decimal(30,15) DEFAULT '0.000000000000000',
  `user_id` int(11) DEFAULT NULL,
  `pending_reason` varchar(255) DEFAULT NULL,
  `vat_percent` decimal(30,15) DEFAULT '0.000000000000000',
  `owner_id` int(11) DEFAULT '0',
  `card` tinyint(4) DEFAULT '0',
  `payment_hash` varchar(32) DEFAULT NULL,
  `bill_nr` varchar(255) DEFAULT NULL,
  `description` text,
  `provider_id` int(11) DEFAULT '-1' COMMENT 'Provider ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pbx_pools`
--

DROP TABLE IF EXISTS `pbx_pools`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pbx_pools` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `comment` text,
  `owner_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pbx_pools`
--

LOCK TABLES `pbx_pools` WRITE;
/*!40000 ALTER TABLE `pbx_pools` DISABLE KEYS */;
/*!40000 ALTER TABLE `pbx_pools` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pbxfunctions`
--

DROP TABLE IF EXISTS `pbxfunctions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pbxfunctions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `context` varchar(255) DEFAULT NULL,
  `extension` varchar(255) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `pf_type` varchar(20) DEFAULT NULL,
  `user_id` int(11) DEFAULT '0' COMMENT 'ID of the user who owns pbxfunction',
  `allow_resellers` int(11) DEFAULT '1' COMMENT 'Pbxfunction allow use reseller',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pbxfunctions`
--

LOCK TABLES `pbxfunctions` WRITE;
/*!40000 ALTER TABLE `pbxfunctions` DISABLE KEYS */;
INSERT INTO `pbxfunctions` VALUES (1,'Tell balance','mor_pbxfunctions','tell_balance',1,'tell_balance',0,1),(2,'Use Voucher','mor_pbxfunctions','use_voucher',1,'use_voucher',0,1),(3,'Milliwatt','mor_pbxfunctions','milliwatt',1,'milliwatt',0,1),(4,'Dial Local','mor_pbxfunctions','dial_local',1,'dial_local',0,1),(5,'DTMF Test','mor_pbxfunctions','dtmf_test',1,'dtmf_test',0,1),(6,'Check VoiceMail','mor_pbxfunctions','check_voicemail',1,'check_voicemail',0,1),(7,'Current Time','mor_pbxfunctions','current_time',1,'current_time',0,1),(8,'External DID','mor_pbxfunctions','external_did',1,'external_did',0,1),(9,'ringgroupID','ringgroupID','s',1,'ringgroupID',0,0),(10,'Card TopUp','mor_pbxfunctions','card_topup',1,'card_topup',0,1);
/*!40000 ALTER TABLE `pbxfunctions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pdffaxemails`
--

DROP TABLE IF EXISTS `pdffaxemails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pdffaxemails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `device_id` int(11) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pdffaxemails`
--

LOCK TABLES `pdffaxemails` WRITE;
/*!40000 ALTER TABLE `pdffaxemails` DISABLE KEYS */;
/*!40000 ALTER TABLE `pdffaxemails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pdffaxes`
--

DROP TABLE IF EXISTS `pdffaxes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pdffaxes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `device_id` int(11) DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `receive_time` datetime DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `deleted` tinyint(4) DEFAULT '0',
  `uniqueid` varchar(255) DEFAULT NULL,
  `fax_sender` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT 'good',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pdffaxes`
--

LOCK TABLES `pdffaxes` WRITE;
/*!40000 ALTER TABLE `pdffaxes` DISABLE KEYS */;
/*!40000 ALTER TABLE `pdffaxes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phonebooks`
--

DROP TABLE IF EXISTS `phonebooks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phonebooks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `number` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `added` datetime NOT NULL,
  `card_id` int(11) NOT NULL DEFAULT '0',
  `speeddial` varchar(50) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phonebooks`
--

LOCK TABLES `phonebooks` WRITE;
/*!40000 ALTER TABLE `phonebooks` DISABLE KEYS */;
/*!40000 ALTER TABLE `phonebooks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `providercodecs`
--

DROP TABLE IF EXISTS `providercodecs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `providercodecs` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `provider_id` int(20) NOT NULL DEFAULT '0',
  `codec_id` int(20) NOT NULL DEFAULT '0',
  `priority` int(11) DEFAULT '0' COMMENT 'codec priority for provider',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `providercodecs`
--

LOCK TABLES `providercodecs` WRITE;
/*!40000 ALTER TABLE `providercodecs` DISABLE KEYS */;
INSERT INTO `providercodecs` VALUES (1,1,1,0),(2,1,2,0),(3,1,5,0),(4,1,6,0),(9,2,5,0),(11,3,5,0);
/*!40000 ALTER TABLE `providercodecs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `providerrules`
--

DROP TABLE IF EXISTS `providerrules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `providerrules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `provider_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `enabled` tinyint(4) NOT NULL DEFAULT '1',
  `cut` varchar(255) DEFAULT NULL,
  `add` varchar(255) DEFAULT NULL,
  `minlen` int(11) NOT NULL DEFAULT '1',
  `maxlen` int(11) NOT NULL DEFAULT '100',
  `pr_type` enum('dst','src') DEFAULT 'dst',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `providerrules`
--

LOCK TABLES `providerrules` WRITE;
/*!40000 ALTER TABLE `providerrules` DISABLE KEYS */;
INSERT INTO `providerrules` VALUES (1,3,'STANDARD prefix',1,'','10#',9,20,'dst');
/*!40000 ALTER TABLE `providerrules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `providers`
--

DROP TABLE IF EXISTS `providers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `providers` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `tech` varchar(255) NOT NULL,
  `channel` varchar(255) DEFAULT NULL,
  `login` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `server_ip` varchar(255) NOT NULL,
  `port` varchar(255) NOT NULL DEFAULT '4569',
  `priority` int(11) NOT NULL DEFAULT '1',
  `quality` int(11) NOT NULL DEFAULT '1',
  `tariff_id` bigint(20) NOT NULL DEFAULT '0',
  `cut_a` int(11) NOT NULL DEFAULT '0',
  `cut_b` int(11) NOT NULL DEFAULT '0',
  `add_a` varchar(255) DEFAULT NULL,
  `add_b` varchar(255) DEFAULT NULL,
  `device_id` bigint(20) NOT NULL DEFAULT '0',
  `ani` tinyint(4) DEFAULT '0',
  `timeout` int(11) DEFAULT '60',
  `call_limit` int(11) DEFAULT '0',
  `interpret_noanswer_as_failed` tinyint(4) DEFAULT '0',
  `interpret_busy_as_failed` tinyint(4) DEFAULT '0',
  `register` int(1) DEFAULT '0',
  `reg_extension` varchar(30) DEFAULT NULL,
  `terminator_id` int(11) NOT NULL DEFAULT '0',
  `reg_line` varchar(255) DEFAULT NULL,
  `hidden` int(11) DEFAULT '0' COMMENT 'Provider hidden status',
  `use_p_asserted_identity` int(11) DEFAULT '0' COMMENT 'P-Asserted-Identity usage, rfc3325',
  `user_id` int(11) DEFAULT '0' COMMENT 'ID of the user who owns provider',
  `common_use` int(11) DEFAULT '0' COMMENT 'Can be used by resellers?',
  `balance` decimal(30,15) DEFAULT '0.000000000000000',
  `balance_limit` decimal(30,15) DEFAULT '0.000000000000000',
  `cps_call_limit` int(11) NOT NULL DEFAULT '0',
  `cps_period` int(11) NOT NULL DEFAULT '0',
  `alive` tinyint(4) DEFAULT '1',
  `periodic_check` tinyint(4) DEFAULT '0',
  `active` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `user_id_index` (`user_id`),
  KEY `terminator_id_index_index` (`terminator_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `providers`
--

LOCK TABLES `providers` WRITE;
/*!40000 ALTER TABLE `providers` DISABLE KEYS */;
INSERT INTO `providers` VALUES (2,'Kolmisoft PREMIUM','SIP','','','','5.9.120.86','5060',1,1,1,0,0,'','',4,0,60,0,0,0,0,'',1,'',0,0,0,0,0.000000000000000,NULL,0,0,1,0,1),(3,'Kolmisoft STANDARD','SIP','','','','5.9.120.86','5060',1,1,3,0,0,'','',5,0,60,0,0,0,0,'',1,'',0,0,0,0,0.000000000000000,NULL,0,0,1,0,1),(4,'DIDWW','SIP','','DIDWW','please_change','0.0.0.0','5060',1,1,1,0,0,'','',6,0,60,0,0,0,0,NULL,0,NULL,1,0,0,0,0.000000000000000,0.000000000000000,0,0,1,0,1);
/*!40000 ALTER TABLE `providers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `providertypes`
--

DROP TABLE IF EXISTS `providertypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `providertypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `ast_name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `providertypes`
--

LOCK TABLES `providertypes` WRITE;
/*!40000 ALTER TABLE `providertypes` DISABLE KEYS */;
INSERT INTO `providertypes` VALUES (1,'dahdi','dahdi'),(2,'SIP','SIP'),(3,'IAX2','IAX2'),(4,'H323','OOH323');
/*!40000 ALTER TABLE `providertypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `queue_agents`
--

DROP TABLE IF EXISTS `queue_agents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `queue_agents` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `agent_name` varchar(40) DEFAULT NULL,
  `queue_id` int(11) DEFAULT NULL,
  `device_id` int(11) DEFAULT NULL,
  `penalty` int(11) DEFAULT NULL,
  `paused` int(11) DEFAULT NULL,
  `priority` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `queue_agents`
--

LOCK TABLES `queue_agents` WRITE;
/*!40000 ALTER TABLE `queue_agents` DISABLE KEYS */;
/*!40000 ALTER TABLE `queue_agents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `queue_periodic_announcements`
--

DROP TABLE IF EXISTS `queue_periodic_announcements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `queue_periodic_announcements` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `queue_id` int(11) DEFAULT NULL,
  `ivr_sound_files_id` int(11) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `queue_periodic_announcements`
--

LOCK TABLES `queue_periodic_announcements` WRITE;
/*!40000 ALTER TABLE `queue_periodic_announcements` DISABLE KEYS */;
/*!40000 ALTER TABLE `queue_periodic_announcements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `queues`
--

DROP TABLE IF EXISTS `queues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `queues` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) DEFAULT NULL,
  `extension` varchar(30) DEFAULT NULL,
  `server_id` int(11) DEFAULT '1',
  `strategy` enum('ringall','roundrobin','leastrecent','fewestcalls','random','rrmemory','wrandom','linear','rrordered') DEFAULT 'ringall',
  `weight` int(11) DEFAULT '0',
  `autofill` enum('yes','no') DEFAULT 'yes',
  `ringinuse` enum('yes','no') DEFAULT 'no',
  `failover_action` enum('hangup','extension','did','device') DEFAULT 'hangup',
  `failover_data` varchar(128) DEFAULT NULL,
  `cid_name_prefix` varchar(30) DEFAULT NULL,
  `reportholdtime` enum('yes','no') DEFAULT 'no',
  `announce` int(11) DEFAULT '0',
  `memberdelay` int(11) DEFAULT '0',
  `timeout` int(11) DEFAULT '30',
  `retry` int(11) DEFAULT '5',
  `wrapuptime` int(11) DEFAULT '0',
  `allow_callee_hangup` enum('yes','no') DEFAULT 'no',
  `maxlen` int(11) DEFAULT '0',
  `join_announcement` int(11) DEFAULT '0',
  `ringing_instead_of_moh` enum('yes','no') DEFAULT 'no',
  `moh_id` int(11) DEFAULT '0',
  `ring_at_once` enum('yes','no') DEFAULT 'no',
  `joinempty` varchar(128) DEFAULT 'penalty,paused,invalid',
  `leavewhenempty` varchar(128) DEFAULT 'penalty,paused,invalid',
  `allow_caller_hangup` enum('yes','no') DEFAULT 'no',
  `context` int(11) DEFAULT '0',
  `max_wait_time` int(11) DEFAULT '300',
  `announce_frequency` int(11) DEFAULT '90',
  `min_announce_frequency` int(11) DEFAULT '15',
  `announce_position` enum('yes','no','limit','more') DEFAULT 'yes',
  `announce_position_limit` int(11) DEFAULT '5',
  `announce_holdtime` enum('yes','no','once') DEFAULT 'once',
  `announce_round_seconds` int(11) DEFAULT '0',
  `periodic_announce_frequency` int(11) DEFAULT '60',
  `random_periodic_announce` enum('yes','no') DEFAULT 'no',
  `relative_periodic_announce` enum('yes','no') DEFAULT 'no',
  `servicelevel` int(11) DEFAULT '0',
  `penaltymemberslimit` int(11) DEFAULT '0',
  `autopause` enum('yes','no','all') DEFAULT 'yes',
  `setinterface` enum('yes','no') DEFAULT 'no',
  `setqueueentryvar` enum('yes','no') DEFAULT 'no',
  `setqueuevar` enum('yes','no') DEFAULT 'no',
  `membermacro` varchar(255) DEFAULT NULL,
  `membergosub` varchar(255) DEFAULT NULL,
  `monitor_format` enum('gsm','wav','wav49') DEFAULT NULL,
  `monitor_type` enum('MixMonitor','Monitor') DEFAULT 'MixMonitor',
  `eventwhencalled` enum('yes','no','vars') DEFAULT 'no',
  `eventmemberstatus` enum('yes','no') DEFAULT 'no',
  `timeoutrestart` enum('yes','no') DEFAULT 'no',
  `queue_youarenext` int(11) DEFAULT '0',
  `queue_thereare` int(11) DEFAULT '0',
  `queue_callswaiting` int(11) DEFAULT '0',
  `queue_holdtime` int(11) DEFAULT '0',
  `queue_minutes` int(11) DEFAULT '0',
  `queue_seconds` int(11) DEFAULT '0',
  `queue_thankyou` int(11) DEFAULT '0',
  `queue_lessthan` int(11) DEFAULT '0',
  `queue_reporthold` int(11) DEFAULT '0',
  `timeoutpriority` enum('app','conf') DEFAULT 'app',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `queues`
--

LOCK TABLES `queues` WRITE;
/*!40000 ALTER TABLE `queues` DISABLE KEYS */;
/*!40000 ALTER TABLE `queues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quickforwarddids`
--

DROP TABLE IF EXISTS `quickforwarddids`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quickforwarddids` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `did_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `number` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quickforwarddids`
--

LOCK TABLES `quickforwarddids` WRITE;
/*!40000 ALTER TABLE `quickforwarddids` DISABLE KEYS */;
/*!40000 ALTER TABLE `quickforwarddids` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quickforwards_rules`
--

DROP TABLE IF EXISTS `quickforwards_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quickforwards_rules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT 'Rule name',
  `user_id` int(11) DEFAULT NULL COMMENT 'Foreign key to users table',
  `rule_regexp` varchar(255) NOT NULL COMMENT 'Regexp rule to find dids.did',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quickforwards_rules`
--

LOCK TABLES `quickforwards_rules` WRITE;
/*!40000 ALTER TABLE `quickforwards_rules` DISABLE KEYS */;
/*!40000 ALTER TABLE `quickforwards_rules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ratedetails`
--

DROP TABLE IF EXISTS `ratedetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ratedetails` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `start_time` time NOT NULL DEFAULT '00:00:00',
  `end_time` time NOT NULL DEFAULT '23:59:59',
  `rate` decimal(30,15) DEFAULT '0.000000000000000',
  `connection_fee` decimal(30,15) DEFAULT '0.000000000000000',
  `rate_id` bigint(20) NOT NULL DEFAULT '0',
  `increment_s` int(11) NOT NULL DEFAULT '1',
  `min_time` int(11) NOT NULL DEFAULT '0',
  `daytype` enum('','FD','WD') DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `rd` (`rate_id`,`daytype`,`start_time`,`end_time`) USING BTREE,
  KEY `dt` (`daytype`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=32993 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ratedetails`
--

LOCK TABLES `ratedetails` WRITE;
/*!40000 ALTER TABLE `ratedetails` DISABLE KEYS */;
INSERT INTO `ratedetails` VALUES (28901,'00:00:00','23:59:59',0.038522000000000,0.000000000000000,28901,0,0,''),(28902,'00:00:00','23:59:59',0.075757440000000,0.000000000000000,28902,0,0,''),(28903,'00:00:00','23:59:59',0.020525120000000,0.000000000000000,28903,0,0,''),(28904,'00:00:00','23:59:59',0.012147520000000,0.000000000000000,28904,0,0,''),(28905,'00:00:00','23:59:59',0.011878240000000,0.000000000000000,28905,0,0,''),(28906,'00:00:00','23:59:59',0.016037120000000,0.000000000000000,28906,0,0,''),(28907,'00:00:00','23:59:59',0.009170480000000,0.000000000000000,28907,0,0,''),(28908,'00:00:00','23:59:59',0.010801120000000,0.000000000000000,28908,0,0,''),(28909,'00:00:00','23:59:59',0.008213040000000,0.000000000000000,28909,0,0,''),(28910,'00:00:00','23:59:59',0.009335040000000,0.000000000000000,28910,0,0,''),(28911,'00:00:00','23:59:59',0.010666480000000,0.000000000000000,28911,0,0,''),(28912,'00:00:00','23:59:59',0.016575680000000,0.000000000000000,28912,0,0,''),(28913,'00:00:00','23:59:59',0.009873600000000,0.000000000000000,28913,0,0,''),(28914,'00:00:00','23:59:59',0.008886240000000,0.000000000000000,28914,0,0,''),(28915,'00:00:00','23:59:59',0.009783840000000,0.000000000000000,28915,0,0,''),(28916,'00:00:00','23:59:59',0.007240640000000,0.000000000000000,28916,0,0,''),(28917,'00:00:00','23:59:59',0.012865600000000,0.000000000000000,28917,0,0,''),(28918,'00:00:00','23:59:59',0.015304080000000,0.000000000000000,28918,0,0,''),(28919,'00:00:00','23:59:59',0.010172800000000,0.000000000000000,28919,0,0,''),(28920,'00:00:00','23:59:59',0.015588320000000,0.000000000000000,28920,0,0,''),(28921,'00:00:00','23:59:59',0.010187760000000,0.000000000000000,28921,60,0,''),(28922,'00:00:00','23:59:59',0.695146320000000,0.000000000000000,28922,0,0,''),(28923,'00:00:00','23:59:59',0.023008480000000,0.000000000000000,28923,0,0,''),(28924,'00:00:00','23:59:59',0.016291440000000,0.000000000000000,28924,0,0,''),(28925,'00:00:00','23:59:59',0.025177680000000,0.000000000000000,28925,0,0,''),(28926,'00:00:00','23:59:59',0.048605040000000,0.000000000000000,28926,0,0,''),(28927,'00:00:00','23:59:59',0.008123280000000,0.000000000000000,28927,0,0,''),(28928,'00:00:00','23:59:59',0.014451360000000,0.000000000000000,28928,0,0,''),(28929,'00:00:00','23:59:59',0.015244240000000,0.000000000000000,28929,0,0,''),(28930,'00:00:00','23:59:59',0.054080400000000,0.000000000000000,28930,0,0,''),(28931,'00:00:00','23:59:59',0.099917840000000,0.000000000000000,28931,0,0,''),(28932,'00:00:00','23:59:59',0.013209680000000,0.000000000000000,28932,0,0,''),(28933,'00:00:00','23:59:59',0.011025520000000,0.000000000000000,28933,0,0,''),(28934,'00:00:00','23:59:59',0.015244240000000,0.000000000000000,28934,0,0,''),(28935,'00:00:00','23:59:59',0.023995840000000,0.000000000000000,28935,0,0,''),(28936,'00:00:00','23:59:59',0.013718320000000,0.000000000000000,28936,0,0,''),(28937,'00:00:00','23:59:59',0.071583600000000,0.000000000000000,28937,0,0,''),(28938,'00:00:00','23:59:59',0.012940400000000,0.000000000000000,28938,0,0,''),(28939,'00:00:00','23:59:59',0.034946560000000,0.000000000000000,28939,0,0,''),(28940,'00:00:00','23:59:59',0.016381200000000,0.000000000000000,28940,0,0,''),(28941,'00:00:00','23:59:59',0.098062800000000,0.000000000000000,28941,0,0,''),(28942,'00:00:00','23:59:59',0.206941680000000,0.000000000000000,28942,0,0,''),(28943,'00:00:00','23:59:59',0.113770800000000,0.000000000000000,28943,0,0,''),(28944,'00:00:00','23:59:59',0.154476960000000,0.000000000000000,28944,0,0,''),(28945,'00:00:00','23:59:59',0.045433520000000,0.000000000000000,28945,0,0,''),(28946,'00:00:00','23:59:59',0.276640320000000,0.000000000000000,28946,0,0,''),(28947,'00:00:00','23:59:59',0.019642480000000,0.000000000000000,28947,0,0,''),(28948,'00:00:00','23:59:59',0.058284160000000,0.000000000000000,28948,0,0,''),(28949,'00:00:00','23:59:59',0.440003520000000,0.000000000000000,28949,0,0,''),(28950,'00:00:00','23:59:59',0.212581600000000,0.000000000000000,28950,0,0,''),(28951,'00:00:00','23:59:59',0.478585360000000,0.000000000000000,28951,60,0,''),(28952,'00:00:00','23:59:59',0.167836240000000,0.000000000000000,28952,0,0,''),(28953,'00:00:00','23:59:59',0.431072400000000,0.000000000000000,28953,0,0,''),(28954,'00:00:00','23:59:59',0.204802400000000,0.000000000000000,28954,0,0,''),(28955,'00:00:00','23:59:59',0.388331680000000,0.000000000000000,28955,0,0,''),(28956,'00:00:00','23:59:59',0.239689120000000,0.000000000000000,28956,0,0,''),(28957,'00:00:00','23:59:59',0.207719600000000,0.000000000000000,28957,0,0,''),(28958,'00:00:00','23:59:59',0.317137040000000,0.000000000000000,28958,0,0,''),(28959,'00:00:00','23:59:59',0.331004960000000,0.000000000000000,28959,0,0,''),(28960,'00:00:00','23:59:59',0.224594480000000,0.000000000000000,28960,0,0,''),(28961,'00:00:00','23:59:59',0.059525840000000,0.000000000000000,28961,0,0,''),(28962,'00:00:00','23:59:59',0.381031200000000,0.000000000000000,28962,0,0,''),(28963,'00:00:00','23:59:59',0.412821200000000,0.000000000000000,28963,0,0,''),(28964,'00:00:00','23:59:59',0.147460720000000,0.000000000000000,28964,0,0,''),(28965,'00:00:00','23:59:59',0.053781200000000,0.000000000000000,28965,0,0,''),(28966,'00:00:00','23:59:59',0.307158720000000,0.000000000000000,28966,0,0,''),(28967,'00:00:00','23:59:59',0.284045520000000,0.000000000000000,28967,0,0,''),(28968,'00:00:00','23:59:59',0.126965520000000,0.000000000000000,28968,0,0,''),(28969,'00:00:00','23:59:59',0.203426080000000,0.000000000000000,28969,0,0,''),(28970,'00:00:00','23:59:59',0.837924560000000,0.000000000000000,28970,0,0,''),(28971,'00:00:00','23:59:59',0.212267440000000,0.000000000000000,28971,0,0,''),(28972,'00:00:00','23:59:59',0.417144640000000,0.000000000000000,28972,0,0,''),(28973,'00:00:00','23:59:59',0.400733520000000,0.000000000000000,28973,0,0,''),(28974,'00:00:00','23:59:59',0.299454320000000,0.000000000000000,28974,0,0,''),(28975,'00:00:00','23:59:59',0.062517840000000,0.000000000000000,28975,0,0,''),(28976,'00:00:00','23:59:59',0.325948480000000,0.000000000000000,28976,0,0,''),(28977,'00:00:00','23:59:59',1.332681680000000,0.000000000000000,28977,0,0,''),(28978,'00:00:00','23:59:59',1.351980080000000,0.000000000000000,28978,0,0,''),(28979,'00:00:00','23:59:59',0.430713360000000,0.000000000000000,28979,0,0,''),(28980,'00:00:00','23:59:59',0.156855600000000,0.000000000000000,28980,0,0,''),(28981,'00:00:00','23:59:59',0.279018960000000,0.000000000000000,28981,0,0,''),(28982,'00:00:00','23:59:59',0.229531280000000,0.000000000000000,28982,0,0,''),(28983,'00:00:00','23:59:59',0.455696560000000,0.000000000000000,28983,0,0,''),(28984,'00:00:00','23:59:59',0.322522640000000,0.000000000000000,28984,0,0,''),(28985,'00:00:00','23:59:59',0.113396800000000,0.000000000000000,28985,0,0,''),(28986,'00:00:00','23:59:59',0.305677680000000,0.000000000000000,28986,0,0,''),(28987,'00:00:00','23:59:59',0.287142240000000,0.000000000000000,28987,0,0,''),(28988,'00:00:00','23:59:59',0.415977760000000,0.000000000000000,28988,0,0,''),(28989,'00:00:00','23:59:59',0.061470640000000,0.000000000000000,28989,0,0,''),(28990,'00:00:00','23:59:59',0.065749200000000,0.000000000000000,28990,0,0,''),(28991,'00:00:00','23:59:59',0.576752880000000,0.000000000000000,28991,0,0,''),(28992,'00:00:00','23:59:59',0.091345760000000,0.000000000000000,28992,0,0,''),(28993,'00:00:00','23:59:59',0.044924880000000,0.000000000000000,28993,0,0,''),(28994,'00:00:00','23:59:59',0.195272880000000,0.000000000000000,28994,0,0,''),(28995,'00:00:00','23:59:59',0.149181120000000,0.000000000000000,28995,0,0,''),(28996,'00:00:00','23:59:59',0.072032400000000,0.000000000000000,28996,0,0,''),(28997,'00:00:00','23:59:59',0.038267680000000,0.000000000000000,28997,0,0,''),(28998,'00:00:00','23:59:59',0.236517600000000,0.000000000000000,28998,0,0,''),(28999,'00:00:00','23:59:59',1.119396960000000,0.000000000000000,28999,0,0,''),(29000,'00:00:00','23:59:59',0.229172240000000,0.000000000000000,29000,0,0,''),(29001,'00:00:00','23:59:59',0.082160320000000,0.000000000000000,29001,0,0,''),(29002,'00:00:00','23:59:59',0.053841040000000,0.000000000000000,29002,0,0,''),(29003,'00:00:00','23:59:59',0.323749360000000,0.000000000000000,29003,0,0,''),(29004,'00:00:00','23:59:59',0.008841360000000,0.000000000000000,29004,0,0,''),(29005,'00:00:00','23:59:59',0.020899120000000,0.000000000000000,29005,0,0,''),(29006,'00:00:00','23:59:59',0.032463200000000,0.000000000000000,29006,0,0,''),(29007,'00:00:00','23:59:59',0.008751600000000,0.000000000000000,29007,0,0,''),(29008,'00:00:00','23:59:59',0.014406480000000,0.000000000000000,29008,0,0,''),(29009,'00:00:00','23:59:59',0.010307440000000,0.000000000000000,29009,0,0,''),(29010,'00:00:00','23:59:59',0.017652800000000,0.000000000000000,29010,0,0,''),(29011,'00:00:00','23:59:59',0.125095520000000,0.000000000000000,29011,0,0,''),(29012,'00:00:00','23:59:59',0.013434080000000,0.000000000000000,29012,0,0,''),(29013,'00:00:00','23:59:59',0.009978320000000,0.000000000000000,29013,0,0,''),(29014,'00:00:00','23:59:59',0.038073200000000,0.000000000000000,29014,0,0,''),(29015,'00:00:00','23:59:59',0.016082000000000,0.000000000000000,29015,0,0,''),(29016,'00:00:00','23:59:59',0.007943760000000,0.000000000000000,29016,0,0,''),(29017,'00:00:00','23:59:59',0.015722960000000,0.000000000000000,29017,0,0,''),(29018,'00:00:00','23:59:59',0.019298400000000,0.000000000000000,29018,0,0,''),(29019,'00:00:00','23:59:59',0.021213280000000,0.000000000000000,29019,0,0,''),(29020,'00:00:00','23:59:59',0.213374480000000,0.000000000000000,29020,0,0,''),(29021,'00:00:00','23:59:59',0.099753280000000,0.000000000000000,29021,0,0,''),(29022,'00:00:00','23:59:59',0.319665280000000,0.000000000000000,29022,0,0,''),(29023,'00:00:00','23:59:59',0.019552720000000,0.000000000000000,29023,0,0,''),(29024,'00:00:00','23:59:59',0.067933360000000,0.000000000000000,29024,0,0,''),(29025,'00:00:00','23:59:59',0.114234560000000,0.000000000000000,29025,0,0,''),(29026,'00:00:00','23:59:59',0.104375920000000,0.000000000000000,29026,0,0,''),(29027,'00:00:00','23:59:59',0.122163360000000,0.000000000000000,29027,0,0,''),(29028,'00:00:00','23:59:59',0.126486800000000,0.000000000000000,29028,0,0,''),(29029,'00:00:00','23:59:59',0.013553760000000,0.000000000000000,29029,0,0,''),(29030,'00:00:00','23:59:59',0.018281120000000,0.000000000000000,29030,0,0,''),(29031,'00:00:00','23:59:59',0.114578640000000,0.000000000000000,29031,0,0,''),(29032,'00:00:00','23:59:59',0.160969600000000,0.000000000000000,29032,0,0,''),(29033,'00:00:00','23:59:59',0.172324240000000,0.000000000000000,29033,0,0,''),(29034,'00:00:00','23:59:59',0.022380160000000,0.000000000000000,29034,0,0,''),(29035,'00:00:00','23:59:59',0.010112960000000,0.000000000000000,29035,0,0,''),(29036,'00:00:00','23:59:59',0.072900080000000,0.000000000000000,29036,0,0,''),(29037,'00:00:00','23:59:59',0.010023200000000,0.000000000000000,29037,0,0,''),(29038,'00:00:00','23:59:59',0.011713680000000,0.000000000000000,29038,0,0,''),(29039,'00:00:00','23:59:59',0.149600000000000,0.000000000000000,29039,0,0,''),(29040,'00:00:00','23:59:59',0.020944000000000,0.000000000000000,29040,0,0,''),(29041,'00:00:00','23:59:59',0.007390240000000,0.000000000000000,29041,0,0,''),(29042,'00:00:00','23:59:59',0.037564560000000,0.000000000000000,29042,0,0,''),(29043,'00:00:00','23:59:59',0.037564560000000,0.000000000000000,29043,0,0,''),(29044,'00:00:00','23:59:59',1.031851040000000,0.000000000000000,29044,0,0,''),(29045,'00:00:00','23:59:59',0.205625200000000,0.000000000000000,29045,0,0,''),(29046,'00:00:00','23:59:59',0.085406640000000,0.000000000000000,29046,0,0,''),(29047,'00:00:00','23:59:59',0.150377920000000,0.000000000000000,29047,0,0,''),(29048,'00:00:00','23:59:59',0.084434240000000,0.000000000000000,29048,0,0,''),(29049,'00:00:00','23:59:59',0.119694960000000,0.000000000000000,29049,0,0,''),(29050,'00:00:00','23:59:59',0.015767840000000,0.000000000000000,29050,0,0,''),(29051,'00:00:00','23:59:59',0.031430960000000,0.000000000000000,29051,0,0,''),(29052,'00:00:00','23:59:59',0.274904960000000,0.000000000000000,29052,0,0,''),(29053,'00:00:00','23:59:59',0.261007120000000,0.000000000000000,29053,0,0,''),(29054,'00:00:00','23:59:59',0.068127840000000,0.000000000000000,29054,0,0,''),(29055,'00:00:00','23:59:59',0.037444880000000,0.000000000000000,29055,60,0,''),(29056,'00:00:00','23:59:59',0.692079520000000,0.000000000000000,29056,0,0,''),(29057,'00:00:00','23:59:59',0.106949040000000,0.000000000000000,29057,0,0,''),(29058,'00:00:00','23:59:59',0.014301760000000,0.000000000000000,29058,0,0,''),(29059,'00:00:00','23:59:59',0.040481760000000,0.000000000000000,29059,0,0,''),(29060,'00:00:00','23:59:59',0.015319040000000,0.000000000000000,29060,0,0,''),(29061,'00:00:00','23:59:59',0.111167760000000,0.000000000000000,29061,0,0,''),(29062,'00:00:00','23:59:59',0.206537760000000,0.000000000000000,29062,0,0,''),(29063,'00:00:00','23:59:59',0.094292880000000,0.000000000000000,29063,0,0,''),(29064,'00:00:00','23:59:59',0.017727600000000,0.000000000000000,29064,0,0,''),(29065,'00:00:00','23:59:59',0.029695600000000,0.000000000000000,29065,0,0,''),(29066,'00:00:00','23:59:59',0.015408800000000,0.000000000000000,29066,0,0,''),(29067,'00:00:00','23:59:59',0.147356000000000,0.000000000000000,29067,0,0,''),(29068,'00:00:00','23:59:59',0.040377040000000,0.000000000000000,29068,0,0,''),(29069,'00:00:00','23:59:59',0.063026480000000,0.000000000000000,29069,0,0,''),(29070,'00:00:00','23:59:59',0.145530880000000,0.000000000000000,29070,0,0,''),(29071,'00:00:00','23:59:59',0.010995600000000,0.000000000000000,29071,0,0,''),(29072,'00:00:00','23:59:59',0.010995600000000,0.000000000000000,29072,0,0,''),(29073,'00:00:00','23:59:59',0.017368560000000,0.000000000000000,29073,0,0,''),(29074,'00:00:00','23:59:59',0.017368560000000,0.000000000000000,29074,0,0,''),(29075,'00:00:00','23:59:59',0.564829760000000,0.000000000000000,29075,0,0,''),(29076,'00:00:00','23:59:59',0.027750800000000,0.000000000000000,29076,0,0,''),(29077,'00:00:00','23:59:59',0.680754800000000,0.000000000000000,29077,0,0,''),(29078,'00:00:00','23:59:59',0.449652720000000,0.000000000000000,29078,0,0,''),(29079,'00:00:00','23:59:59',0.404712880000000,0.000000000000000,29079,0,0,''),(29080,'00:00:00','23:59:59',0.760222320000000,0.000000000000000,29080,0,0,''),(29081,'00:00:00','23:59:59',0.465644960000000,0.000000000000000,29081,0,0,''),(29082,'00:00:00','23:59:59',0.171172320000000,0.000000000000000,29082,0,0,''),(29083,'00:00:00','23:59:59',0.351904080000000,0.000000000000000,29083,0,0,''),(29084,'00:00:00','23:59:59',0.602125040000000,0.000000000000000,29084,0,0,''),(29085,'00:00:00','23:59:59',0.599282640000000,0.000000000000000,29085,0,0,''),(29086,'00:00:00','23:59:59',0.717990240000000,0.000000000000000,29086,0,0,''),(29087,'00:00:00','23:59:59',0.548089520000000,0.000000000000000,29087,0,0,''),(29088,'00:00:00','23:59:59',0.568450080000000,0.000000000000000,29088,0,0,''),(29089,'00:00:00','23:59:59',0.159144480000000,0.000000000000000,29089,0,0,''),(29090,'00:00:00','23:59:59',0.485063040000000,0.000000000000000,29090,0,0,''),(29091,'00:00:00','23:59:59',0.197053120000000,0.000000000000000,29091,0,0,''),(29092,'00:00:00','23:59:59',1.226256240000000,0.000000000000000,29092,0,0,''),(29093,'00:00:00','23:59:59',0.204233920000000,0.000000000000000,29093,0,0,''),(29094,'00:00:00','23:59:59',0.232777600000000,0.000000000000000,29094,0,0,''),(29095,'00:00:00','23:59:59',0.018685040000000,0.000000000000000,29095,0,0,''),(29096,'00:00:00','23:59:59',0.122911360000000,0.000000000000000,29096,0,0,''),(29097,'00:00:00','23:59:59',0.091794560000000,0.000000000000000,29097,0,0,''),(29098,'00:00:00','23:59:59',0.089715120000000,0.000000000000000,29098,0,0,''),(29099,'00:00:00','23:59:59',0.122911360000000,0.000000000000000,29099,0,0,''),(29100,'00:00:00','23:59:59',0.122911360000000,0.000000000000000,29100,0,0,''),(29101,'00:00:00','23:59:59',0.098406880000000,0.000000000000000,29101,0,0,''),(29102,'00:00:00','23:59:59',0.122911360000000,0.000000000000000,29102,0,0,''),(29103,'00:00:00','23:59:59',0.091794560000000,0.000000000000000,29103,0,0,''),(29104,'00:00:00','23:59:59',0.122911360000000,0.000000000000000,29104,0,0,''),(29105,'00:00:00','23:59:59',0.072989840000000,0.000000000000000,29105,0,0,''),(29106,'00:00:00','23:59:59',0.072541040000000,0.000000000000000,29106,0,0,''),(29107,'00:00:00','23:59:59',0.496537360000000,0.000000000000000,29107,0,0,''),(29108,'00:00:00','23:59:59',0.017069360000000,0.000000000000000,29108,0,0,''),(29109,'00:00:00','23:59:59',0.060662800000000,0.000000000000000,29109,0,0,''),(29110,'00:00:00','23:59:59',0.052704080000000,0.000000000000000,29110,0,0,''),(29111,'00:00:00','23:59:59',0.036547280000000,0.000000000000000,29111,0,0,''),(29112,'00:00:00','23:59:59',0.547565920000000,0.000000000000000,29112,0,0,''),(29113,'00:00:00','23:59:59',0.032807280000000,0.000000000000000,29113,0,0,''),(29114,'00:00:00','23:59:59',0.016336320000000,0.000000000000000,29114,0,0,''),(29115,'00:00:00','23:59:59',0.130660640000000,0.000000000000000,29115,0,0,''),(29116,'00:00:00','23:59:59',0.155494240000000,0.000000000000000,29116,0,0,''),(29117,'00:00:00','23:59:59',0.765667760000000,0.000000000000000,29117,0,0,''),(29118,'00:00:00','23:59:59',0.083895680000000,0.000000000000000,29118,0,0,''),(29119,'00:00:00','23:59:59',0.080903680000000,0.000000000000000,29119,0,0,''),(29120,'00:00:00','23:59:59',0.094203120000000,0.000000000000000,29120,0,0,''),(29121,'00:00:00','23:59:59',0.120293360000000,0.000000000000000,29121,0,0,''),(29122,'00:00:00','23:59:59',0.040840800000000,0.000000000000000,29122,0,0,''),(29123,'00:00:00','23:59:59',0.078988800000000,0.000000000000000,29123,0,0,''),(29124,'00:00:00','23:59:59',0.140579120000000,0.000000000000000,29124,0,0,''),(29125,'00:00:00','23:59:59',0.100665840000000,0.000000000000000,29125,0,0,''),(29126,'00:00:00','23:59:59',0.144244320000000,0.000000000000000,29126,0,0,''),(29127,'00:00:00','23:59:59',0.009843680000000,0.000000000000000,29127,0,0,''),(29128,'00:00:00','23:59:59',0.039808560000000,0.000000000000000,29128,0,0,''),(29129,'00:00:00','23:59:59',0.144543520000000,0.000000000000000,29129,0,0,''),(29130,'00:00:00','23:59:59',0.064028800000000,0.000000000000000,29130,0,0,''),(29131,'00:00:00','23:59:59',0.028768080000000,0.000000000000000,29131,0,0,''),(29132,'00:00:00','23:59:59',0.106590000000000,0.000000000000000,29132,0,0,''),(29133,'00:00:00','23:59:59',0.125409680000000,0.000000000000000,29133,0,0,''),(29134,'00:00:00','23:59:59',0.100007600000000,0.000000000000000,29134,0,0,''),(29135,'00:00:00','23:59:59',0.202558400000000,0.000000000000000,29135,0,0,''),(29136,'00:00:00','23:59:59',0.039389680000000,0.000000000000000,29136,0,0,''),(29137,'00:00:00','23:59:59',0.126681280000000,0.000000000000000,29137,0,0,''),(29138,'00:00:00','23:59:59',0.043443840000000,0.000000000000000,29138,0,0,''),(29139,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29139,6,0,''),(29140,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29140,6,0,''),(29141,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29141,6,0,''),(29142,'00:00:00','23:59:59',0.006447760000000,0.000000000000000,29142,0,0,''),(29143,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29143,6,0,''),(29144,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29144,6,0,''),(29145,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29145,6,0,''),(29146,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29146,6,0,''),(29147,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29147,6,0,''),(29148,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29148,6,0,''),(29149,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29149,6,0,''),(29150,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29150,6,0,''),(29151,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29151,6,0,''),(29152,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29152,6,0,''),(29153,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29153,6,0,''),(29154,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29154,6,0,''),(29155,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29155,6,0,''),(29156,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29156,6,0,''),(29157,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29157,6,0,''),(29158,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29158,6,0,''),(29159,'00:00:00','23:59:59',0.006447760000000,0.000000000000000,29159,0,0,''),(29160,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29160,6,0,''),(29161,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29161,6,0,''),(29162,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29162,6,0,''),(29163,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29163,6,0,''),(29164,'00:00:00','23:59:59',0.006447760000000,0.000000000000000,29164,0,0,''),(29165,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29165,6,0,''),(29166,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29166,6,0,''),(29167,'00:00:00','23:59:59',0.067978240000000,0.000000000000000,29167,0,0,''),(29168,'00:00:00','23:59:59',0.131408640000000,0.000000000000000,29168,0,0,''),(29169,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29169,6,0,''),(29170,'00:00:00','23:59:59',0.006447760000000,0.000000000000000,29170,0,0,''),(29171,'00:00:00','23:59:59',0.006447760000000,0.000000000000000,29171,0,0,''),(29172,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29172,6,0,''),(29173,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29173,6,0,''),(29174,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29174,6,0,''),(29175,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29175,6,0,''),(29176,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29176,6,0,''),(29177,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29177,6,0,''),(29178,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29178,6,0,''),(29179,'00:00:00','23:59:59',0.100381600000000,0.000000000000000,29179,0,0,''),(29180,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29180,6,0,''),(29181,'00:00:00','23:59:59',0.155464320000000,0.000000000000000,29181,0,0,''),(29182,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29182,6,0,''),(29183,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29183,6,0,''),(29184,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29184,6,0,''),(29185,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29185,6,0,''),(29186,'00:00:00','23:59:59',0.123958560000000,0.000000000000000,29186,0,0,''),(29187,'00:00:00','23:59:59',0.006447760000000,0.000000000000000,29187,0,0,''),(29188,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29188,6,0,''),(29189,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29189,6,0,''),(29190,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29190,6,0,''),(29191,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29191,6,0,''),(29192,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29192,6,0,''),(29193,'00:00:00','23:59:59',0.006447760000000,0.000000000000000,29193,0,0,''),(29194,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29194,6,0,''),(29195,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29195,6,0,''),(29196,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29196,6,0,''),(29197,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29197,6,0,''),(29198,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29198,6,0,''),(29199,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29199,6,0,''),(29200,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29200,6,0,''),(29201,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29201,6,0,''),(29202,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29202,6,0,''),(29203,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29203,6,0,''),(29204,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29204,6,0,''),(29205,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29205,6,0,''),(29206,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29206,6,0,''),(29207,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29207,6,0,''),(29208,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29208,6,0,''),(29209,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29209,6,0,''),(29210,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29210,6,0,''),(29211,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29211,6,0,''),(29212,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29212,6,0,''),(29213,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29213,6,0,''),(29214,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29214,6,0,''),(29215,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29215,6,0,''),(29216,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29216,6,0,''),(29217,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29217,6,0,''),(29218,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29218,6,0,''),(29219,'00:00:00','23:59:59',0.017233920000000,0.000000000000000,29219,6,0,''),(29220,'00:00:00','23:59:59',0.006447760000000,0.000000000000000,29220,0,0,''),(29221,'00:00:00','23:59:59',0.087411280000000,0.000000000000000,29221,0,0,''),(29222,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29222,6,0,''),(29223,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29223,6,0,''),(29224,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29224,6,0,''),(29225,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29225,6,0,''),(29226,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29226,6,0,''),(29227,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29227,6,0,''),(29228,'00:00:00','23:59:59',0.006447760000000,0.000000000000000,29228,0,0,''),(29229,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29229,6,0,''),(29230,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29230,6,0,''),(29231,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29231,6,0,''),(29232,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29232,6,0,''),(29233,'00:00:00','23:59:59',0.006447760000000,0.000000000000000,29233,0,0,''),(29234,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29234,6,0,''),(29235,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29235,6,0,''),(29236,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29236,6,0,''),(29237,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29237,6,0,''),(29238,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29238,6,0,''),(29239,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29239,6,0,''),(29240,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29240,6,0,''),(29241,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29241,6,0,''),(29242,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29242,6,0,''),(29243,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29243,6,0,''),(29244,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29244,6,0,''),(29245,'00:00:00','23:59:59',0.006447760000000,0.000000000000000,29245,0,0,''),(29246,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29246,6,0,''),(29247,'00:00:00','23:59:59',0.006447760000000,0.000000000000000,29247,0,0,''),(29248,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29248,6,0,''),(29249,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29249,6,0,''),(29250,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29250,6,0,''),(29251,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29251,6,0,''),(29252,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29252,6,0,''),(29253,'00:00:00','23:59:59',0.006447760000000,0.000000000000000,29253,0,0,''),(29254,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29254,6,0,''),(29255,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29255,6,0,''),(29256,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29256,6,0,''),(29257,'00:00:00','23:59:59',0.006447760000000,0.000000000000000,29257,0,0,''),(29258,'00:00:00','23:59:59',0.006447760000000,0.000000000000000,29258,0,0,''),(29259,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29259,6,0,''),(29260,'00:00:00','23:59:59',0.036786640000000,0.000000000000000,29260,0,0,''),(29261,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29261,6,0,''),(29262,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29262,6,0,''),(29263,'00:00:00','23:59:59',0.006447760000000,0.000000000000000,29263,0,0,''),(29264,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29264,6,0,''),(29265,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29265,6,0,''),(29266,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29266,6,0,''),(29267,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29267,6,0,''),(29268,'00:00:00','23:59:59',0.136450160000000,0.000000000000000,29268,0,0,''),(29269,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29269,6,0,''),(29270,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29270,6,0,''),(29271,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29271,6,0,''),(29272,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29272,6,0,''),(29273,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29273,6,0,''),(29274,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29274,6,0,''),(29275,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29275,6,0,''),(29276,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29276,6,0,''),(29277,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29277,6,0,''),(29278,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29278,6,0,''),(29279,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29279,6,0,''),(29280,'00:00:00','23:59:59',0.006447760000000,0.000000000000000,29280,0,0,''),(29281,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29281,6,0,''),(29282,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29282,6,0,''),(29283,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29283,6,0,''),(29284,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29284,6,0,''),(29285,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29285,6,0,''),(29286,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29286,6,0,''),(29287,'00:00:00','23:59:59',0.006447760000000,0.000000000000000,29287,0,0,''),(29288,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29288,6,0,''),(29289,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29289,6,0,''),(29290,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29290,6,0,''),(29291,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29291,6,0,''),(29292,'00:00:00','23:59:59',0.006447760000000,0.000000000000000,29292,0,0,''),(29293,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29293,6,0,''),(29294,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29294,6,0,''),(29295,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29295,6,0,''),(29296,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29296,6,0,''),(29297,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29297,6,0,''),(29298,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29298,6,0,''),(29299,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29299,6,0,''),(29300,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29300,6,0,''),(29301,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29301,6,0,''),(29302,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29302,6,0,''),(29303,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29303,6,0,''),(29304,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29304,6,0,''),(29305,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29305,6,0,''),(29306,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29306,6,0,''),(29307,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29307,6,0,''),(29308,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29308,6,0,''),(29309,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29309,6,0,''),(29310,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29310,6,0,''),(29311,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29311,6,0,''),(29312,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29312,6,0,''),(29313,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29313,6,0,''),(29314,'00:00:00','23:59:59',0.006447760000000,0.000000000000000,29314,0,0,''),(29315,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29315,6,0,''),(29316,'00:00:00','23:59:59',0.006447760000000,0.000000000000000,29316,0,0,''),(29317,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29317,6,0,''),(29318,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29318,6,0,''),(29319,'00:00:00','23:59:59',0.006447760000000,0.000000000000000,29319,0,0,''),(29320,'00:00:00','23:59:59',0.006447760000000,0.000000000000000,29320,0,0,''),(29321,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29321,6,0,''),(29322,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29322,6,0,''),(29323,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29323,6,0,''),(29324,'00:00:00','23:59:59',0.006447760000000,0.000000000000000,29324,0,0,''),(29325,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29325,6,0,''),(29326,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29326,6,0,''),(29327,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29327,6,0,''),(29328,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29328,6,0,''),(29329,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29329,6,0,''),(29330,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29330,6,0,''),(29331,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29331,6,0,''),(29332,'00:00:00','23:59:59',0.006447760000000,0.000000000000000,29332,0,0,''),(29333,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29333,6,0,''),(29334,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29334,6,0,''),(29335,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29335,6,0,''),(29336,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29336,6,0,''),(29337,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29337,6,0,''),(29338,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29338,6,0,''),(29339,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29339,6,0,''),(29340,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29340,6,0,''),(29341,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29341,6,0,''),(29342,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29342,6,0,''),(29343,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29343,6,0,''),(29344,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29344,6,0,''),(29345,'00:00:00','23:59:59',0.006447760000000,0.000000000000000,29345,0,0,''),(29346,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29346,6,0,''),(29347,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29347,6,0,''),(29348,'00:00:00','23:59:59',0.006447760000000,0.000000000000000,29348,0,0,''),(29349,'00:00:00','23:59:59',0.122447600000000,0.000000000000000,29349,0,0,''),(29350,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29350,6,0,''),(29351,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29351,6,0,''),(29352,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29352,6,0,''),(29353,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29353,6,0,''),(29354,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29354,6,0,''),(29355,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29355,6,0,''),(29356,'00:00:00','23:59:59',0.391204000000000,0.000000000000000,29356,0,0,''),(29357,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29357,6,0,''),(29358,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29358,6,0,''),(29359,'00:00:00','23:59:59',0.031864800000000,0.000000000000000,29359,0,0,''),(29360,'00:00:00','23:59:59',0.018834640000000,0.000000000000000,29360,0,0,''),(29361,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29361,6,0,''),(29362,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29362,6,0,''),(29363,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29363,6,0,''),(29364,'00:00:00','23:59:59',0.029291680000000,0.000000000000000,29364,0,0,''),(29365,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29365,6,0,''),(29366,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29366,6,0,''),(29367,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29367,6,0,''),(29368,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29368,6,0,''),(29369,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29369,6,0,''),(29370,'00:00:00','23:59:59',0.006447760000000,0.000000000000000,29370,0,0,''),(29371,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29371,6,0,''),(29372,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29372,6,0,''),(29373,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29373,6,0,''),(29374,'00:00:00','23:59:59',0.006447760000000,0.000000000000000,29374,0,0,''),(29375,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29375,6,0,''),(29376,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29376,6,0,''),(29377,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29377,6,0,''),(29378,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29378,6,0,''),(29379,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29379,6,0,''),(29380,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29380,6,0,''),(29381,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29381,6,0,''),(29382,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29382,6,0,''),(29383,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29383,6,0,''),(29384,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29384,6,0,''),(29385,'00:00:00','23:59:59',0.109133200000000,0.000000000000000,29385,0,0,''),(29386,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29386,6,0,''),(29387,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29387,6,0,''),(29388,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29388,6,0,''),(29389,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29389,6,0,''),(29390,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29390,6,0,''),(29391,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29391,6,0,''),(29392,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29392,6,0,''),(29393,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29393,6,0,''),(29394,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29394,6,0,''),(29395,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29395,6,0,''),(29396,'00:00:00','23:59:59',0.136674560000000,0.000000000000000,29396,0,0,''),(29397,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29397,6,0,''),(29398,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29398,6,0,''),(29399,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29399,6,0,''),(29400,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29400,6,0,''),(29401,'00:00:00','23:59:59',0.130451200000000,0.000000000000000,29401,0,0,''),(29402,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29402,6,0,''),(29403,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29403,6,0,''),(29404,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29404,6,0,''),(29405,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29405,6,0,''),(29406,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29406,6,0,''),(29407,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29407,6,0,''),(29408,'00:00:00','23:59:59',0.006447760000000,0.000000000000000,29408,0,0,''),(29409,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29409,6,0,''),(29410,'00:00:00','23:59:59',0.006447760000000,0.000000000000000,29410,0,0,''),(29411,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29411,6,0,''),(29412,'00:00:00','23:59:59',0.154387200000000,0.000000000000000,29412,0,0,''),(29413,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29413,6,0,''),(29414,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29414,6,0,''),(29415,'00:00:00','23:59:59',0.010367280000000,0.000000000000000,29415,0,0,''),(29416,'00:00:00','23:59:59',0.008811440000000,0.000000000000000,29416,6,0,''),(29417,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29417,6,0,''),(29418,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29418,6,0,''),(29419,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29419,6,0,''),(29420,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29420,6,0,''),(29421,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29421,6,0,''),(29422,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29422,6,0,''),(29423,'00:00:00','23:59:59',0.006447760000000,0.000000000000000,29423,0,0,''),(29424,'00:00:00','23:59:59',0.013134880000000,0.000000000000000,29424,6,0,''),(29425,'00:00:00','23:59:59',0.022395120000000,0.000000000000000,29425,0,0,''),(29426,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29426,6,0,''),(29427,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29427,6,0,''),(29428,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29428,6,0,''),(29429,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29429,6,0,''),(29430,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29430,6,0,''),(29431,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29431,6,0,''),(29432,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29432,6,0,''),(29433,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29433,6,0,''),(29434,'00:00:00','23:59:59',0.006447760000000,0.000000000000000,29434,0,0,''),(29435,'00:00:00','23:59:59',0.008811440000000,0.000000000000000,29435,6,0,''),(29436,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29436,6,0,''),(29437,'00:00:00','23:59:59',0.022395120000000,0.000000000000000,29437,0,0,''),(29438,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29438,6,0,''),(29439,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29439,6,0,''),(29440,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29440,6,0,''),(29441,'00:00:00','23:59:59',0.008811440000000,0.000000000000000,29441,6,0,''),(29442,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29442,6,0,''),(29443,'00:00:00','23:59:59',0.008811440000000,0.000000000000000,29443,6,0,''),(29444,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29444,6,0,''),(29445,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29445,6,0,''),(29446,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29446,6,0,''),(29447,'00:00:00','23:59:59',0.022395120000000,0.000000000000000,29447,0,0,''),(29448,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29448,6,0,''),(29449,'00:00:00','23:59:59',0.008811440000000,0.000000000000000,29449,6,0,''),(29450,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29450,6,0,''),(29451,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29451,6,0,''),(29452,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29452,6,0,''),(29453,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29453,6,0,''),(29454,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29454,6,0,''),(29455,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29455,6,0,''),(29456,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29456,6,0,''),(29457,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29457,6,0,''),(29458,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29458,6,0,''),(29459,'00:00:00','23:59:59',0.008811440000000,0.000000000000000,29459,6,0,''),(29460,'00:00:00','23:59:59',0.012581360000000,0.000000000000000,29460,0,0,''),(29461,'00:00:00','23:59:59',0.070431680000000,0.000000000000000,29461,0,0,''),(29462,'00:00:00','23:59:59',0.132695200000000,0.000000000000000,29462,0,0,''),(29463,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29463,6,0,''),(29464,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29464,6,0,''),(29465,'00:00:00','23:59:59',0.006447760000000,0.000000000000000,29465,0,0,''),(29466,'00:00:00','23:59:59',0.107308080000000,0.000000000000000,29466,0,0,''),(29467,'00:00:00','23:59:59',0.008811440000000,0.000000000000000,29467,6,0,''),(29468,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29468,6,0,''),(29469,'00:00:00','23:59:59',0.008811440000000,0.000000000000000,29469,6,0,''),(29470,'00:00:00','23:59:59',0.008811440000000,0.000000000000000,29470,6,0,''),(29471,'00:00:00','23:59:59',0.008811440000000,0.000000000000000,29471,6,0,''),(29472,'00:00:00','23:59:59',0.008811440000000,0.000000000000000,29472,6,0,''),(29473,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29473,6,0,''),(29474,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29474,6,0,''),(29475,'00:00:00','23:59:59',0.006447760000000,0.000000000000000,29475,0,0,''),(29476,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29476,6,0,''),(29477,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29477,6,0,''),(29478,'00:00:00','23:59:59',0.006447760000000,0.000000000000000,29478,0,0,''),(29479,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29479,6,0,''),(29480,'00:00:00','23:59:59',0.043877680000000,0.000000000000000,29480,6,0,''),(29481,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29481,6,0,''),(29482,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29482,6,0,''),(29483,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29483,6,0,''),(29484,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29484,6,0,''),(29485,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29485,6,0,''),(29486,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29486,6,0,''),(29487,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29487,6,0,''),(29488,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29488,6,0,''),(29489,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29489,6,0,''),(29490,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29490,6,0,''),(29491,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29491,6,0,''),(29492,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29492,6,0,''),(29493,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29493,6,0,''),(29494,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29494,6,0,''),(29495,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29495,6,0,''),(29496,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29496,6,0,''),(29497,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29497,6,0,''),(29498,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29498,6,0,''),(29499,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29499,6,0,''),(29500,'00:00:00','23:59:59',0.010367280000000,0.000000000000000,29500,0,0,''),(29501,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29501,6,0,''),(29502,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29502,6,0,''),(29503,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29503,6,0,''),(29504,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29504,6,0,''),(29505,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29505,6,0,''),(29506,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29506,6,0,''),(29507,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29507,6,0,''),(29508,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29508,6,0,''),(29509,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29509,6,0,''),(29510,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29510,6,0,''),(29511,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29511,6,0,''),(29512,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29512,6,0,''),(29513,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29513,6,0,''),(29514,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29514,6,0,''),(29515,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29515,6,0,''),(29516,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29516,6,0,''),(29517,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29517,6,0,''),(29518,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,29518,6,0,''),(29924,'00:00:00','23:59:59',0.038522000000000,0.000000000000000,29924,0,0,''),(29925,'00:00:00','23:59:59',0.075757440000000,0.000000000000000,29925,0,0,''),(29926,'00:00:00','23:59:59',0.020525120000000,0.000000000000000,29926,0,0,''),(29927,'00:00:00','23:59:59',0.012147520000000,0.000000000000000,29927,0,0,''),(29928,'00:00:00','23:59:59',0.011878240000000,0.000000000000000,29928,0,0,''),(29929,'00:00:00','23:59:59',0.016037120000000,0.000000000000000,29929,0,0,''),(29930,'00:00:00','23:59:59',0.009170480000000,0.000000000000000,29930,0,0,''),(29931,'00:00:00','23:59:59',0.010801120000000,0.000000000000000,29931,0,0,''),(29932,'00:00:00','23:59:59',0.008213040000000,0.000000000000000,29932,0,0,''),(29933,'00:00:00','23:59:59',0.009335040000000,0.000000000000000,29933,0,0,''),(29934,'00:00:00','23:59:59',0.010666480000000,0.000000000000000,29934,0,0,''),(29935,'00:00:00','23:59:59',0.016575680000000,0.000000000000000,29935,0,0,''),(29936,'00:00:00','23:59:59',0.009873600000000,0.000000000000000,29936,0,0,''),(29937,'00:00:00','23:59:59',0.008886240000000,0.000000000000000,29937,0,0,''),(29938,'00:00:00','23:59:59',0.009783840000000,0.000000000000000,29938,0,0,''),(29939,'00:00:00','23:59:59',0.007240640000000,0.000000000000000,29939,0,0,''),(29940,'00:00:00','23:59:59',0.012865600000000,0.000000000000000,29940,0,0,''),(29941,'00:00:00','23:59:59',0.015304080000000,0.000000000000000,29941,0,0,''),(29942,'00:00:00','23:59:59',0.010172800000000,0.000000000000000,29942,0,0,''),(29943,'00:00:00','23:59:59',0.015588320000000,0.000000000000000,29943,0,0,''),(29944,'00:00:00','23:59:59',0.010187760000000,0.000000000000000,29944,60,0,''),(29945,'00:00:00','23:59:59',0.695146320000000,0.000000000000000,29945,0,0,''),(29946,'00:00:00','23:59:59',0.023008480000000,0.000000000000000,29946,0,0,''),(29947,'00:00:00','23:59:59',0.016291440000000,0.000000000000000,29947,0,0,''),(29948,'00:00:00','23:59:59',0.025177680000000,0.000000000000000,29948,0,0,''),(29949,'00:00:00','23:59:59',0.048605040000000,0.000000000000000,29949,0,0,''),(29950,'00:00:00','23:59:59',0.008123280000000,0.000000000000000,29950,0,0,''),(29951,'00:00:00','23:59:59',0.014451360000000,0.000000000000000,29951,0,0,''),(29952,'00:00:00','23:59:59',0.015244240000000,0.000000000000000,29952,0,0,''),(29953,'00:00:00','23:59:59',0.054080400000000,0.000000000000000,29953,0,0,''),(29954,'00:00:00','23:59:59',0.099917840000000,0.000000000000000,29954,0,0,''),(29955,'00:00:00','23:59:59',0.013209680000000,0.000000000000000,29955,0,0,''),(29956,'00:00:00','23:59:59',0.011025520000000,0.000000000000000,29956,0,0,''),(29957,'00:00:00','23:59:59',0.015244240000000,0.000000000000000,29957,0,0,''),(29958,'00:00:00','23:59:59',0.023995840000000,0.000000000000000,29958,0,0,''),(29959,'00:00:00','23:59:59',0.013718320000000,0.000000000000000,29959,0,0,''),(29960,'00:00:00','23:59:59',0.071583600000000,0.000000000000000,29960,0,0,''),(29961,'00:00:00','23:59:59',0.012940400000000,0.000000000000000,29961,0,0,''),(29962,'00:00:00','23:59:59',0.034946560000000,0.000000000000000,29962,0,0,''),(29963,'00:00:00','23:59:59',0.016381200000000,0.000000000000000,29963,0,0,''),(29964,'00:00:00','23:59:59',0.098062800000000,0.000000000000000,29964,0,0,''),(29965,'00:00:00','23:59:59',0.206941680000000,0.000000000000000,29965,0,0,''),(29966,'00:00:00','23:59:59',0.113770800000000,0.000000000000000,29966,0,0,''),(29967,'00:00:00','23:59:59',0.154476960000000,0.000000000000000,29967,0,0,''),(29968,'00:00:00','23:59:59',0.045433520000000,0.000000000000000,29968,0,0,''),(29969,'00:00:00','23:59:59',0.276640320000000,0.000000000000000,29969,0,0,''),(29970,'00:00:00','23:59:59',0.019642480000000,0.000000000000000,29970,0,0,''),(29971,'00:00:00','23:59:59',0.058284160000000,0.000000000000000,29971,0,0,''),(29972,'00:00:00','23:59:59',0.440003520000000,0.000000000000000,29972,0,0,''),(29973,'00:00:00','23:59:59',0.212581600000000,0.000000000000000,29973,0,0,''),(29974,'00:00:00','23:59:59',0.478585360000000,0.000000000000000,29974,60,0,''),(29975,'00:00:00','23:59:59',0.167836240000000,0.000000000000000,29975,0,0,''),(29976,'00:00:00','23:59:59',0.431072400000000,0.000000000000000,29976,0,0,''),(29977,'00:00:00','23:59:59',0.204802400000000,0.000000000000000,29977,0,0,''),(29978,'00:00:00','23:59:59',0.388331680000000,0.000000000000000,29978,0,0,''),(29979,'00:00:00','23:59:59',0.239689120000000,0.000000000000000,29979,0,0,''),(29980,'00:00:00','23:59:59',0.207719600000000,0.000000000000000,29980,0,0,''),(29981,'00:00:00','23:59:59',0.317137040000000,0.000000000000000,29981,0,0,''),(29982,'00:00:00','23:59:59',0.331004960000000,0.000000000000000,29982,0,0,''),(29983,'00:00:00','23:59:59',0.224594480000000,0.000000000000000,29983,0,0,''),(29984,'00:00:00','23:59:59',0.059525840000000,0.000000000000000,29984,0,0,''),(29985,'00:00:00','23:59:59',0.381031200000000,0.000000000000000,29985,0,0,''),(29986,'00:00:00','23:59:59',0.412821200000000,0.000000000000000,29986,0,0,''),(29987,'00:00:00','23:59:59',0.147460720000000,0.000000000000000,29987,0,0,''),(29988,'00:00:00','23:59:59',0.053781200000000,0.000000000000000,29988,0,0,''),(29989,'00:00:00','23:59:59',0.307158720000000,0.000000000000000,29989,0,0,''),(29990,'00:00:00','23:59:59',0.284045520000000,0.000000000000000,29990,0,0,''),(29991,'00:00:00','23:59:59',0.126965520000000,0.000000000000000,29991,0,0,''),(29992,'00:00:00','23:59:59',0.203426080000000,0.000000000000000,29992,0,0,''),(29993,'00:00:00','23:59:59',0.837924560000000,0.000000000000000,29993,0,0,''),(29994,'00:00:00','23:59:59',0.212267440000000,0.000000000000000,29994,0,0,''),(29995,'00:00:00','23:59:59',0.417144640000000,0.000000000000000,29995,0,0,''),(29996,'00:00:00','23:59:59',0.400733520000000,0.000000000000000,29996,0,0,''),(29997,'00:00:00','23:59:59',0.299454320000000,0.000000000000000,29997,0,0,''),(29998,'00:00:00','23:59:59',0.062517840000000,0.000000000000000,29998,0,0,''),(29999,'00:00:00','23:59:59',0.325948480000000,0.000000000000000,29999,0,0,''),(30000,'00:00:00','23:59:59',1.332681680000000,0.000000000000000,30000,0,0,''),(30001,'00:00:00','23:59:59',1.351980080000000,0.000000000000000,30001,0,0,''),(30002,'00:00:00','23:59:59',0.430713360000000,0.000000000000000,30002,0,0,''),(30003,'00:00:00','23:59:59',0.156855600000000,0.000000000000000,30003,0,0,''),(30004,'00:00:00','23:59:59',0.279018960000000,0.000000000000000,30004,0,0,''),(30005,'00:00:00','23:59:59',0.229531280000000,0.000000000000000,30005,0,0,''),(30006,'00:00:00','23:59:59',0.455696560000000,0.000000000000000,30006,0,0,''),(30007,'00:00:00','23:59:59',0.322522640000000,0.000000000000000,30007,0,0,''),(30008,'00:00:00','23:59:59',0.113396800000000,0.000000000000000,30008,0,0,''),(30009,'00:00:00','23:59:59',0.305677680000000,0.000000000000000,30009,0,0,''),(30010,'00:00:00','23:59:59',0.287142240000000,0.000000000000000,30010,0,0,''),(30011,'00:00:00','23:59:59',0.415977760000000,0.000000000000000,30011,0,0,''),(30012,'00:00:00','23:59:59',0.061470640000000,0.000000000000000,30012,0,0,''),(30013,'00:00:00','23:59:59',0.065749200000000,0.000000000000000,30013,0,0,''),(30014,'00:00:00','23:59:59',0.576752880000000,0.000000000000000,30014,0,0,''),(30015,'00:00:00','23:59:59',0.091345760000000,0.000000000000000,30015,0,0,''),(30016,'00:00:00','23:59:59',0.044924880000000,0.000000000000000,30016,0,0,''),(30017,'00:00:00','23:59:59',0.195272880000000,0.000000000000000,30017,0,0,''),(30018,'00:00:00','23:59:59',0.149181120000000,0.000000000000000,30018,0,0,''),(30019,'00:00:00','23:59:59',0.072032400000000,0.000000000000000,30019,0,0,''),(30020,'00:00:00','23:59:59',0.038267680000000,0.000000000000000,30020,0,0,''),(30021,'00:00:00','23:59:59',0.236517600000000,0.000000000000000,30021,0,0,''),(30022,'00:00:00','23:59:59',1.119396960000000,0.000000000000000,30022,0,0,''),(30023,'00:00:00','23:59:59',0.229172240000000,0.000000000000000,30023,0,0,''),(30024,'00:00:00','23:59:59',0.082160320000000,0.000000000000000,30024,0,0,''),(30025,'00:00:00','23:59:59',0.053841040000000,0.000000000000000,30025,0,0,''),(30026,'00:00:00','23:59:59',0.323749360000000,0.000000000000000,30026,0,0,''),(30027,'00:00:00','23:59:59',0.008841360000000,0.000000000000000,30027,0,0,''),(30028,'00:00:00','23:59:59',0.020899120000000,0.000000000000000,30028,0,0,''),(30029,'00:00:00','23:59:59',0.032463200000000,0.000000000000000,30029,0,0,''),(30030,'00:00:00','23:59:59',0.008751600000000,0.000000000000000,30030,0,0,''),(30031,'00:00:00','23:59:59',0.014406480000000,0.000000000000000,30031,0,0,''),(30032,'00:00:00','23:59:59',0.010307440000000,0.000000000000000,30032,0,0,''),(30033,'00:00:00','23:59:59',0.017652800000000,0.000000000000000,30033,0,0,''),(30034,'00:00:00','23:59:59',0.125095520000000,0.000000000000000,30034,0,0,''),(30035,'00:00:00','23:59:59',0.013434080000000,0.000000000000000,30035,0,0,''),(30036,'00:00:00','23:59:59',0.009978320000000,0.000000000000000,30036,0,0,''),(30037,'00:00:00','23:59:59',0.038073200000000,0.000000000000000,30037,0,0,''),(30038,'00:00:00','23:59:59',0.016082000000000,0.000000000000000,30038,0,0,''),(30039,'00:00:00','23:59:59',0.007943760000000,0.000000000000000,30039,0,0,''),(30040,'00:00:00','23:59:59',0.015722960000000,0.000000000000000,30040,0,0,''),(30041,'00:00:00','23:59:59',0.019298400000000,0.000000000000000,30041,0,0,''),(30042,'00:00:00','23:59:59',0.021213280000000,0.000000000000000,30042,0,0,''),(30043,'00:00:00','23:59:59',0.213374480000000,0.000000000000000,30043,0,0,''),(30044,'00:00:00','23:59:59',0.099753280000000,0.000000000000000,30044,0,0,''),(30045,'00:00:00','23:59:59',0.319665280000000,0.000000000000000,30045,0,0,''),(30046,'00:00:00','23:59:59',0.019552720000000,0.000000000000000,30046,0,0,''),(30047,'00:00:00','23:59:59',0.067933360000000,0.000000000000000,30047,0,0,''),(30048,'00:00:00','23:59:59',0.114234560000000,0.000000000000000,30048,0,0,''),(30049,'00:00:00','23:59:59',0.104375920000000,0.000000000000000,30049,0,0,''),(30050,'00:00:00','23:59:59',0.122163360000000,0.000000000000000,30050,0,0,''),(30051,'00:00:00','23:59:59',0.126486800000000,0.000000000000000,30051,0,0,''),(30052,'00:00:00','23:59:59',0.013553760000000,0.000000000000000,30052,0,0,''),(30053,'00:00:00','23:59:59',0.018281120000000,0.000000000000000,30053,0,0,''),(30054,'00:00:00','23:59:59',0.114578640000000,0.000000000000000,30054,0,0,''),(30055,'00:00:00','23:59:59',0.160969600000000,0.000000000000000,30055,0,0,''),(30056,'00:00:00','23:59:59',0.172324240000000,0.000000000000000,30056,0,0,''),(30057,'00:00:00','23:59:59',0.022380160000000,0.000000000000000,30057,0,0,''),(30058,'00:00:00','23:59:59',0.010112960000000,0.000000000000000,30058,0,0,''),(30059,'00:00:00','23:59:59',0.072900080000000,0.000000000000000,30059,0,0,''),(30060,'00:00:00','23:59:59',0.010023200000000,0.000000000000000,30060,0,0,''),(30061,'00:00:00','23:59:59',0.011713680000000,0.000000000000000,30061,0,0,''),(30062,'00:00:00','23:59:59',0.149600000000000,0.000000000000000,30062,0,0,''),(30063,'00:00:00','23:59:59',0.020944000000000,0.000000000000000,30063,0,0,''),(30064,'00:00:00','23:59:59',0.007390240000000,0.000000000000000,30064,0,0,''),(30065,'00:00:00','23:59:59',0.037564560000000,0.000000000000000,30065,0,0,''),(30066,'00:00:00','23:59:59',0.037564560000000,0.000000000000000,30066,0,0,''),(30067,'00:00:00','23:59:59',1.031851040000000,0.000000000000000,30067,0,0,''),(30068,'00:00:00','23:59:59',0.205625200000000,0.000000000000000,30068,0,0,''),(30069,'00:00:00','23:59:59',0.085406640000000,0.000000000000000,30069,0,0,''),(30070,'00:00:00','23:59:59',0.150377920000000,0.000000000000000,30070,0,0,''),(30071,'00:00:00','23:59:59',0.084434240000000,0.000000000000000,30071,0,0,''),(30072,'00:00:00','23:59:59',0.119694960000000,0.000000000000000,30072,0,0,''),(30073,'00:00:00','23:59:59',0.015767840000000,0.000000000000000,30073,0,0,''),(30074,'00:00:00','23:59:59',0.031430960000000,0.000000000000000,30074,0,0,''),(30075,'00:00:00','23:59:59',0.274904960000000,0.000000000000000,30075,0,0,''),(30076,'00:00:00','23:59:59',0.261007120000000,0.000000000000000,30076,0,0,''),(30077,'00:00:00','23:59:59',0.068127840000000,0.000000000000000,30077,0,0,''),(30078,'00:00:00','23:59:59',0.037444880000000,0.000000000000000,30078,60,0,''),(30079,'00:00:00','23:59:59',0.692079520000000,0.000000000000000,30079,0,0,''),(30080,'00:00:00','23:59:59',0.106949040000000,0.000000000000000,30080,0,0,''),(30081,'00:00:00','23:59:59',0.014301760000000,0.000000000000000,30081,0,0,''),(30082,'00:00:00','23:59:59',0.040481760000000,0.000000000000000,30082,0,0,''),(30083,'00:00:00','23:59:59',0.015319040000000,0.000000000000000,30083,0,0,''),(30084,'00:00:00','23:59:59',0.111167760000000,0.000000000000000,30084,0,0,''),(30085,'00:00:00','23:59:59',0.206537760000000,0.000000000000000,30085,0,0,''),(30086,'00:00:00','23:59:59',0.094292880000000,0.000000000000000,30086,0,0,''),(30087,'00:00:00','23:59:59',0.017727600000000,0.000000000000000,30087,0,0,''),(30088,'00:00:00','23:59:59',0.029695600000000,0.000000000000000,30088,0,0,''),(30089,'00:00:00','23:59:59',0.015408800000000,0.000000000000000,30089,0,0,''),(30090,'00:00:00','23:59:59',0.147356000000000,0.000000000000000,30090,0,0,''),(30091,'00:00:00','23:59:59',0.040377040000000,0.000000000000000,30091,0,0,''),(30092,'00:00:00','23:59:59',0.063026480000000,0.000000000000000,30092,0,0,''),(30093,'00:00:00','23:59:59',0.145530880000000,0.000000000000000,30093,0,0,''),(30094,'00:00:00','23:59:59',0.010995600000000,0.000000000000000,30094,0,0,''),(30095,'00:00:00','23:59:59',0.010995600000000,0.000000000000000,30095,0,0,''),(30096,'00:00:00','23:59:59',0.017368560000000,0.000000000000000,30096,0,0,''),(30097,'00:00:00','23:59:59',0.017368560000000,0.000000000000000,30097,0,0,''),(30098,'00:00:00','23:59:59',0.564829760000000,0.000000000000000,30098,0,0,''),(30099,'00:00:00','23:59:59',0.027750800000000,0.000000000000000,30099,0,0,''),(30100,'00:00:00','23:59:59',0.680754800000000,0.000000000000000,30100,0,0,''),(30101,'00:00:00','23:59:59',0.449652720000000,0.000000000000000,30101,0,0,''),(30102,'00:00:00','23:59:59',0.404712880000000,0.000000000000000,30102,0,0,''),(30103,'00:00:00','23:59:59',0.760222320000000,0.000000000000000,30103,0,0,''),(30104,'00:00:00','23:59:59',0.465644960000000,0.000000000000000,30104,0,0,''),(30105,'00:00:00','23:59:59',0.171172320000000,0.000000000000000,30105,0,0,''),(30106,'00:00:00','23:59:59',0.351904080000000,0.000000000000000,30106,0,0,''),(30107,'00:00:00','23:59:59',0.602125040000000,0.000000000000000,30107,0,0,''),(30108,'00:00:00','23:59:59',0.599282640000000,0.000000000000000,30108,0,0,''),(30109,'00:00:00','23:59:59',0.717990240000000,0.000000000000000,30109,0,0,''),(30110,'00:00:00','23:59:59',0.548089520000000,0.000000000000000,30110,0,0,''),(30111,'00:00:00','23:59:59',0.568450080000000,0.000000000000000,30111,0,0,''),(30112,'00:00:00','23:59:59',0.159144480000000,0.000000000000000,30112,0,0,''),(30113,'00:00:00','23:59:59',0.485063040000000,0.000000000000000,30113,0,0,''),(30114,'00:00:00','23:59:59',0.197053120000000,0.000000000000000,30114,0,0,''),(30115,'00:00:00','23:59:59',1.226256240000000,0.000000000000000,30115,0,0,''),(30116,'00:00:00','23:59:59',0.204233920000000,0.000000000000000,30116,0,0,''),(30117,'00:00:00','23:59:59',0.232777600000000,0.000000000000000,30117,0,0,''),(30118,'00:00:00','23:59:59',0.018685040000000,0.000000000000000,30118,0,0,''),(30119,'00:00:00','23:59:59',0.122911360000000,0.000000000000000,30119,0,0,''),(30120,'00:00:00','23:59:59',0.091794560000000,0.000000000000000,30120,0,0,''),(30121,'00:00:00','23:59:59',0.089715120000000,0.000000000000000,30121,0,0,''),(30122,'00:00:00','23:59:59',0.122911360000000,0.000000000000000,30122,0,0,''),(30123,'00:00:00','23:59:59',0.122911360000000,0.000000000000000,30123,0,0,''),(30124,'00:00:00','23:59:59',0.098406880000000,0.000000000000000,30124,0,0,''),(30125,'00:00:00','23:59:59',0.122911360000000,0.000000000000000,30125,0,0,''),(30126,'00:00:00','23:59:59',0.091794560000000,0.000000000000000,30126,0,0,''),(30127,'00:00:00','23:59:59',0.122911360000000,0.000000000000000,30127,0,0,''),(30128,'00:00:00','23:59:59',0.072989840000000,0.000000000000000,30128,0,0,''),(30129,'00:00:00','23:59:59',0.072541040000000,0.000000000000000,30129,0,0,''),(30130,'00:00:00','23:59:59',0.496537360000000,0.000000000000000,30130,0,0,''),(30131,'00:00:00','23:59:59',0.017069360000000,0.000000000000000,30131,0,0,''),(30132,'00:00:00','23:59:59',0.060662800000000,0.000000000000000,30132,0,0,''),(30133,'00:00:00','23:59:59',0.052704080000000,0.000000000000000,30133,0,0,''),(30134,'00:00:00','23:59:59',0.036547280000000,0.000000000000000,30134,0,0,''),(30135,'00:00:00','23:59:59',0.547565920000000,0.000000000000000,30135,0,0,''),(30136,'00:00:00','23:59:59',0.032807280000000,0.000000000000000,30136,0,0,''),(30137,'00:00:00','23:59:59',0.016336320000000,0.000000000000000,30137,0,0,''),(30138,'00:00:00','23:59:59',0.130660640000000,0.000000000000000,30138,0,0,''),(30139,'00:00:00','23:59:59',0.155494240000000,0.000000000000000,30139,0,0,''),(30140,'00:00:00','23:59:59',0.765667760000000,0.000000000000000,30140,0,0,''),(30141,'00:00:00','23:59:59',0.083895680000000,0.000000000000000,30141,0,0,''),(30142,'00:00:00','23:59:59',0.080903680000000,0.000000000000000,30142,0,0,''),(30143,'00:00:00','23:59:59',0.094203120000000,0.000000000000000,30143,0,0,''),(30144,'00:00:00','23:59:59',0.120293360000000,0.000000000000000,30144,0,0,''),(30145,'00:00:00','23:59:59',0.040840800000000,0.000000000000000,30145,0,0,''),(30146,'00:00:00','23:59:59',0.078988800000000,0.000000000000000,30146,0,0,''),(30147,'00:00:00','23:59:59',0.140579120000000,0.000000000000000,30147,0,0,''),(30148,'00:00:00','23:59:59',0.100665840000000,0.000000000000000,30148,0,0,''),(30149,'00:00:00','23:59:59',0.144244320000000,0.000000000000000,30149,0,0,''),(30150,'00:00:00','23:59:59',0.009843680000000,0.000000000000000,30150,0,0,''),(30151,'00:00:00','23:59:59',0.039808560000000,0.000000000000000,30151,0,0,''),(30152,'00:00:00','23:59:59',0.144543520000000,0.000000000000000,30152,0,0,''),(30153,'00:00:00','23:59:59',0.064028800000000,0.000000000000000,30153,0,0,''),(30154,'00:00:00','23:59:59',0.028768080000000,0.000000000000000,30154,0,0,''),(30155,'00:00:00','23:59:59',0.106590000000000,0.000000000000000,30155,0,0,''),(30156,'00:00:00','23:59:59',0.125409680000000,0.000000000000000,30156,0,0,''),(30157,'00:00:00','23:59:59',0.100007600000000,0.000000000000000,30157,0,0,''),(30158,'00:00:00','23:59:59',0.202558400000000,0.000000000000000,30158,0,0,''),(30159,'00:00:00','23:59:59',0.039389680000000,0.000000000000000,30159,0,0,''),(30160,'00:00:00','23:59:59',0.126681280000000,0.000000000000000,30160,0,0,''),(30161,'00:00:00','23:59:59',0.043443840000000,0.000000000000000,30161,0,0,''),(30162,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30162,6,0,''),(30163,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30163,6,0,''),(30164,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30164,6,0,''),(30165,'00:00:00','23:59:59',0.006447760000000,0.000000000000000,30165,0,0,''),(30166,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30166,6,0,''),(30167,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30167,6,0,''),(30168,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30168,6,0,''),(30169,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30169,6,0,''),(30170,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30170,6,0,''),(30171,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30171,6,0,''),(30172,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30172,6,0,''),(30173,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30173,6,0,''),(30174,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30174,6,0,''),(30175,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30175,6,0,''),(30176,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30176,6,0,''),(30177,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30177,6,0,''),(30178,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30178,6,0,''),(30179,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30179,6,0,''),(30180,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30180,6,0,''),(30181,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30181,6,0,''),(30182,'00:00:00','23:59:59',0.006447760000000,0.000000000000000,30182,0,0,''),(30183,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30183,6,0,''),(30184,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30184,6,0,''),(30185,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30185,6,0,''),(30186,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30186,6,0,''),(30187,'00:00:00','23:59:59',0.006447760000000,0.000000000000000,30187,0,0,''),(30188,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30188,6,0,''),(30189,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30189,6,0,''),(30190,'00:00:00','23:59:59',0.067978240000000,0.000000000000000,30190,0,0,''),(30191,'00:00:00','23:59:59',0.131408640000000,0.000000000000000,30191,0,0,''),(30192,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30192,6,0,''),(30193,'00:00:00','23:59:59',0.006447760000000,0.000000000000000,30193,0,0,''),(30194,'00:00:00','23:59:59',0.006447760000000,0.000000000000000,30194,0,0,''),(30195,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30195,6,0,''),(30196,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30196,6,0,''),(30197,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30197,6,0,''),(30198,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30198,6,0,''),(30199,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30199,6,0,''),(30200,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30200,6,0,''),(30201,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30201,6,0,''),(30202,'00:00:00','23:59:59',0.100381600000000,0.000000000000000,30202,0,0,''),(30203,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30203,6,0,''),(30204,'00:00:00','23:59:59',0.155464320000000,0.000000000000000,30204,0,0,''),(30205,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30205,6,0,''),(30206,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30206,6,0,''),(30207,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30207,6,0,''),(30208,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30208,6,0,''),(30209,'00:00:00','23:59:59',0.123958560000000,0.000000000000000,30209,0,0,''),(30210,'00:00:00','23:59:59',0.006447760000000,0.000000000000000,30210,0,0,''),(30211,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30211,6,0,''),(30212,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30212,6,0,''),(30213,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30213,6,0,''),(30214,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30214,6,0,''),(30215,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30215,6,0,''),(30216,'00:00:00','23:59:59',0.006447760000000,0.000000000000000,30216,0,0,''),(30217,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30217,6,0,''),(30218,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30218,6,0,''),(30219,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30219,6,0,''),(30220,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30220,6,0,''),(30221,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30221,6,0,''),(30222,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30222,6,0,''),(30223,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30223,6,0,''),(30224,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30224,6,0,''),(30225,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30225,6,0,''),(30226,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30226,6,0,''),(30227,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30227,6,0,''),(30228,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30228,6,0,''),(30229,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30229,6,0,''),(30230,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30230,6,0,''),(30231,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30231,6,0,''),(30232,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30232,6,0,''),(30233,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30233,6,0,''),(30234,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30234,6,0,''),(30235,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30235,6,0,''),(30236,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30236,6,0,''),(30237,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30237,6,0,''),(30238,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30238,6,0,''),(30239,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30239,6,0,''),(30240,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30240,6,0,''),(30241,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30241,6,0,''),(30242,'00:00:00','23:59:59',0.017233920000000,0.000000000000000,30242,6,0,''),(30243,'00:00:00','23:59:59',0.006447760000000,0.000000000000000,30243,0,0,''),(30244,'00:00:00','23:59:59',0.087411280000000,0.000000000000000,30244,0,0,''),(30245,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30245,6,0,''),(30246,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30246,6,0,''),(30247,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30247,6,0,''),(30248,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30248,6,0,''),(30249,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30249,6,0,''),(30250,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30250,6,0,''),(30251,'00:00:00','23:59:59',0.006447760000000,0.000000000000000,30251,0,0,''),(30252,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30252,6,0,''),(30253,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30253,6,0,''),(30254,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30254,6,0,''),(30255,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30255,6,0,''),(30256,'00:00:00','23:59:59',0.006447760000000,0.000000000000000,30256,0,0,''),(30257,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30257,6,0,''),(30258,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30258,6,0,''),(30259,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30259,6,0,''),(30260,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30260,6,0,''),(30261,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30261,6,0,''),(30262,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30262,6,0,''),(30263,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30263,6,0,''),(30264,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30264,6,0,''),(30265,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30265,6,0,''),(30266,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30266,6,0,''),(30267,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30267,6,0,''),(30268,'00:00:00','23:59:59',0.006447760000000,0.000000000000000,30268,0,0,''),(30269,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30269,6,0,''),(30270,'00:00:00','23:59:59',0.006447760000000,0.000000000000000,30270,0,0,''),(30271,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30271,6,0,''),(30272,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30272,6,0,''),(30273,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30273,6,0,''),(30274,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30274,6,0,''),(30275,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30275,6,0,''),(30276,'00:00:00','23:59:59',0.006447760000000,0.000000000000000,30276,0,0,''),(30277,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30277,6,0,''),(30278,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30278,6,0,''),(30279,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30279,6,0,''),(30280,'00:00:00','23:59:59',0.006447760000000,0.000000000000000,30280,0,0,''),(30281,'00:00:00','23:59:59',0.006447760000000,0.000000000000000,30281,0,0,''),(30282,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30282,6,0,''),(30283,'00:00:00','23:59:59',0.036786640000000,0.000000000000000,30283,0,0,''),(30284,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30284,6,0,''),(30285,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30285,6,0,''),(30286,'00:00:00','23:59:59',0.006447760000000,0.000000000000000,30286,0,0,''),(30287,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30287,6,0,''),(30288,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30288,6,0,''),(30289,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30289,6,0,''),(30290,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30290,6,0,''),(30291,'00:00:00','23:59:59',0.136450160000000,0.000000000000000,30291,0,0,''),(30292,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30292,6,0,''),(30293,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30293,6,0,''),(30294,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30294,6,0,''),(30295,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30295,6,0,''),(30296,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30296,6,0,''),(30297,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30297,6,0,''),(30298,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30298,6,0,''),(30299,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30299,6,0,''),(30300,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30300,6,0,''),(30301,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30301,6,0,''),(30302,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30302,6,0,''),(30303,'00:00:00','23:59:59',0.006447760000000,0.000000000000000,30303,0,0,''),(30304,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30304,6,0,''),(30305,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30305,6,0,''),(30306,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30306,6,0,''),(30307,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30307,6,0,''),(30308,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30308,6,0,''),(30309,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30309,6,0,''),(30310,'00:00:00','23:59:59',0.006447760000000,0.000000000000000,30310,0,0,''),(30311,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30311,6,0,''),(30312,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30312,6,0,''),(30313,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30313,6,0,''),(30314,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30314,6,0,''),(30315,'00:00:00','23:59:59',0.006447760000000,0.000000000000000,30315,0,0,''),(30316,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30316,6,0,''),(30317,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30317,6,0,''),(30318,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30318,6,0,''),(30319,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30319,6,0,''),(30320,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30320,6,0,''),(30321,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30321,6,0,''),(30322,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30322,6,0,''),(30323,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30323,6,0,''),(30324,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30324,6,0,''),(30325,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30325,6,0,''),(30326,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30326,6,0,''),(30327,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30327,6,0,''),(30328,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30328,6,0,''),(30329,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30329,6,0,''),(30330,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30330,6,0,''),(30331,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30331,6,0,''),(30332,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30332,6,0,''),(30333,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30333,6,0,''),(30334,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30334,6,0,''),(30335,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30335,6,0,''),(30336,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30336,6,0,''),(30337,'00:00:00','23:59:59',0.006447760000000,0.000000000000000,30337,0,0,''),(30338,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30338,6,0,''),(30339,'00:00:00','23:59:59',0.006447760000000,0.000000000000000,30339,0,0,''),(30340,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30340,6,0,''),(30341,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30341,6,0,''),(30342,'00:00:00','23:59:59',0.006447760000000,0.000000000000000,30342,0,0,''),(30343,'00:00:00','23:59:59',0.006447760000000,0.000000000000000,30343,0,0,''),(30344,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30344,6,0,''),(30345,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30345,6,0,''),(30346,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30346,6,0,''),(30347,'00:00:00','23:59:59',0.006447760000000,0.000000000000000,30347,0,0,''),(30348,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30348,6,0,''),(30349,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30349,6,0,''),(30350,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30350,6,0,''),(30351,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30351,6,0,''),(30352,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30352,6,0,''),(30353,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30353,6,0,''),(30354,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30354,6,0,''),(30355,'00:00:00','23:59:59',0.006447760000000,0.000000000000000,30355,0,0,''),(30356,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30356,6,0,''),(30357,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30357,6,0,''),(30358,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30358,6,0,''),(30359,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30359,6,0,''),(30360,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30360,6,0,''),(30361,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30361,6,0,''),(30362,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30362,6,0,''),(30363,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30363,6,0,''),(30364,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30364,6,0,''),(30365,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30365,6,0,''),(30366,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30366,6,0,''),(30367,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30367,6,0,''),(30368,'00:00:00','23:59:59',0.006447760000000,0.000000000000000,30368,0,0,''),(30369,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30369,6,0,''),(30370,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30370,6,0,''),(30371,'00:00:00','23:59:59',0.006447760000000,0.000000000000000,30371,0,0,''),(30372,'00:00:00','23:59:59',0.122447600000000,0.000000000000000,30372,0,0,''),(30373,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30373,6,0,''),(30374,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30374,6,0,''),(30375,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30375,6,0,''),(30376,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30376,6,0,''),(30377,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30377,6,0,''),(30378,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30378,6,0,''),(30379,'00:00:00','23:59:59',0.391204000000000,0.000000000000000,30379,0,0,''),(30380,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30380,6,0,''),(30381,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30381,6,0,''),(30382,'00:00:00','23:59:59',0.031864800000000,0.000000000000000,30382,0,0,''),(30383,'00:00:00','23:59:59',0.018834640000000,0.000000000000000,30383,0,0,''),(30384,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30384,6,0,''),(30385,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30385,6,0,''),(30386,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30386,6,0,''),(30387,'00:00:00','23:59:59',0.029291680000000,0.000000000000000,30387,0,0,''),(30388,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30388,6,0,''),(30389,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30389,6,0,''),(30390,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30390,6,0,''),(30391,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30391,6,0,''),(30392,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30392,6,0,''),(30393,'00:00:00','23:59:59',0.006447760000000,0.000000000000000,30393,0,0,''),(30394,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30394,6,0,''),(30395,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30395,6,0,''),(30396,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30396,6,0,''),(30397,'00:00:00','23:59:59',0.006447760000000,0.000000000000000,30397,0,0,''),(30398,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30398,6,0,''),(30399,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30399,6,0,''),(30400,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30400,6,0,''),(30401,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30401,6,0,''),(30402,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30402,6,0,''),(30403,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30403,6,0,''),(30404,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30404,6,0,''),(30405,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30405,6,0,''),(30406,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30406,6,0,''),(30407,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30407,6,0,''),(30408,'00:00:00','23:59:59',0.109133200000000,0.000000000000000,30408,0,0,''),(30409,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30409,6,0,''),(30410,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30410,6,0,''),(30411,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30411,6,0,''),(30412,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30412,6,0,''),(30413,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30413,6,0,''),(30414,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30414,6,0,''),(30415,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30415,6,0,''),(30416,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30416,6,0,''),(30417,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30417,6,0,''),(30418,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30418,6,0,''),(30419,'00:00:00','23:59:59',0.136674560000000,0.000000000000000,30419,0,0,''),(30420,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30420,6,0,''),(30421,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30421,6,0,''),(30422,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30422,6,0,''),(30423,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30423,6,0,''),(30424,'00:00:00','23:59:59',0.130451200000000,0.000000000000000,30424,0,0,''),(30425,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30425,6,0,''),(30426,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30426,6,0,''),(30427,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30427,6,0,''),(30428,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30428,6,0,''),(30429,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30429,6,0,''),(30430,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30430,6,0,''),(30431,'00:00:00','23:59:59',0.006447760000000,0.000000000000000,30431,0,0,''),(30432,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30432,6,0,''),(30433,'00:00:00','23:59:59',0.006447760000000,0.000000000000000,30433,0,0,''),(30434,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30434,6,0,''),(30435,'00:00:00','23:59:59',0.154387200000000,0.000000000000000,30435,0,0,''),(30436,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30436,6,0,''),(30437,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30437,6,0,''),(30438,'00:00:00','23:59:59',0.010367280000000,0.000000000000000,30438,0,0,''),(30439,'00:00:00','23:59:59',0.008811440000000,0.000000000000000,30439,6,0,''),(30440,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30440,6,0,''),(30441,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30441,6,0,''),(30442,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30442,6,0,''),(30443,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30443,6,0,''),(30444,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30444,6,0,''),(30445,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30445,6,0,''),(30446,'00:00:00','23:59:59',0.006447760000000,0.000000000000000,30446,0,0,''),(30447,'00:00:00','23:59:59',0.013134880000000,0.000000000000000,30447,6,0,''),(30448,'00:00:00','23:59:59',0.022395120000000,0.000000000000000,30448,0,0,''),(30449,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30449,6,0,''),(30450,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30450,6,0,''),(30451,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30451,6,0,''),(30452,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30452,6,0,''),(30453,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30453,6,0,''),(30454,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30454,6,0,''),(30455,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30455,6,0,''),(30456,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30456,6,0,''),(30457,'00:00:00','23:59:59',0.006447760000000,0.000000000000000,30457,0,0,''),(30458,'00:00:00','23:59:59',0.008811440000000,0.000000000000000,30458,6,0,''),(30459,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30459,6,0,''),(30460,'00:00:00','23:59:59',0.022395120000000,0.000000000000000,30460,0,0,''),(30461,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30461,6,0,''),(30462,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30462,6,0,''),(30463,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30463,6,0,''),(30464,'00:00:00','23:59:59',0.008811440000000,0.000000000000000,30464,6,0,''),(30465,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30465,6,0,''),(30466,'00:00:00','23:59:59',0.008811440000000,0.000000000000000,30466,6,0,''),(30467,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30467,6,0,''),(30468,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30468,6,0,''),(30469,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30469,6,0,''),(30470,'00:00:00','23:59:59',0.022395120000000,0.000000000000000,30470,0,0,''),(30471,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30471,6,0,''),(30472,'00:00:00','23:59:59',0.008811440000000,0.000000000000000,30472,6,0,''),(30473,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30473,6,0,''),(30474,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30474,6,0,''),(30475,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30475,6,0,''),(30476,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30476,6,0,''),(30477,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30477,6,0,''),(30478,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30478,6,0,''),(30479,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30479,6,0,''),(30480,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30480,6,0,''),(30481,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30481,6,0,''),(30482,'00:00:00','23:59:59',0.008811440000000,0.000000000000000,30482,6,0,''),(30483,'00:00:00','23:59:59',0.012581360000000,0.000000000000000,30483,0,0,''),(30484,'00:00:00','23:59:59',0.070431680000000,0.000000000000000,30484,0,0,''),(30485,'00:00:00','23:59:59',0.132695200000000,0.000000000000000,30485,0,0,''),(30486,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30486,6,0,''),(30487,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30487,6,0,''),(30488,'00:00:00','23:59:59',0.006447760000000,0.000000000000000,30488,0,0,''),(30489,'00:00:00','23:59:59',0.107308080000000,0.000000000000000,30489,0,0,''),(30490,'00:00:00','23:59:59',0.008811440000000,0.000000000000000,30490,6,0,''),(30491,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30491,6,0,''),(30492,'00:00:00','23:59:59',0.008811440000000,0.000000000000000,30492,6,0,''),(30493,'00:00:00','23:59:59',0.008811440000000,0.000000000000000,30493,6,0,''),(30494,'00:00:00','23:59:59',0.008811440000000,0.000000000000000,30494,6,0,''),(30495,'00:00:00','23:59:59',0.008811440000000,0.000000000000000,30495,6,0,''),(30496,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30496,6,0,''),(30497,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30497,6,0,''),(30498,'00:00:00','23:59:59',0.006447760000000,0.000000000000000,30498,0,0,''),(30499,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30499,6,0,''),(30500,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30500,6,0,''),(30501,'00:00:00','23:59:59',0.006447760000000,0.000000000000000,30501,0,0,''),(30502,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30502,6,0,''),(30503,'00:00:00','23:59:59',0.043877680000000,0.000000000000000,30503,6,0,''),(30504,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30504,6,0,''),(30505,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30505,6,0,''),(30506,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30506,6,0,''),(30507,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30507,6,0,''),(30508,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30508,6,0,''),(30509,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30509,6,0,''),(30510,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30510,6,0,''),(30511,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30511,6,0,''),(30512,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30512,6,0,''),(30513,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30513,6,0,''),(30514,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30514,6,0,''),(30515,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30515,6,0,''),(30516,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30516,6,0,''),(30517,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30517,6,0,''),(30518,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30518,6,0,''),(30519,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30519,6,0,''),(30520,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30520,6,0,''),(30521,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30521,6,0,''),(30522,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30522,6,0,''),(30523,'00:00:00','23:59:59',0.010367280000000,0.000000000000000,30523,0,0,''),(30524,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30524,6,0,''),(30525,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30525,6,0,''),(30526,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30526,6,0,''),(30527,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30527,6,0,''),(30528,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30528,6,0,''),(30529,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30529,6,0,''),(30530,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30530,6,0,''),(30531,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30531,6,0,''),(30532,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30532,6,0,''),(30533,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30533,6,0,''),(30534,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30534,6,0,''),(30535,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30535,6,0,''),(30536,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30536,6,0,''),(30537,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30537,6,0,''),(30538,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30538,6,0,''),(30539,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30539,6,0,''),(30540,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30540,6,0,''),(30541,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,30541,6,0,''),(30947,'00:00:00','23:59:59',0.038522000000000,0.000000000000000,30947,0,0,''),(30948,'00:00:00','23:59:59',0.075757440000000,0.000000000000000,30948,0,0,''),(30949,'00:00:00','23:59:59',0.020525120000000,0.000000000000000,30949,0,0,''),(30950,'00:00:00','23:59:59',0.012147520000000,0.000000000000000,30950,0,0,''),(30951,'00:00:00','23:59:59',0.011878240000000,0.000000000000000,30951,0,0,''),(30952,'00:00:00','23:59:59',0.016037120000000,0.000000000000000,30952,0,0,''),(30953,'00:00:00','23:59:59',0.009170480000000,0.000000000000000,30953,0,0,''),(30954,'00:00:00','23:59:59',0.010801120000000,0.000000000000000,30954,0,0,''),(30955,'00:00:00','23:59:59',0.008213040000000,0.000000000000000,30955,0,0,''),(30956,'00:00:00','23:59:59',0.009335040000000,0.000000000000000,30956,0,0,''),(30957,'00:00:00','23:59:59',0.010666480000000,0.000000000000000,30957,0,0,''),(30958,'00:00:00','23:59:59',0.016575680000000,0.000000000000000,30958,0,0,''),(30959,'00:00:00','23:59:59',0.009873600000000,0.000000000000000,30959,0,0,''),(30960,'00:00:00','23:59:59',0.008886240000000,0.000000000000000,30960,0,0,''),(30961,'00:00:00','23:59:59',0.009783840000000,0.000000000000000,30961,0,0,''),(30962,'00:00:00','23:59:59',0.007240640000000,0.000000000000000,30962,0,0,''),(30963,'00:00:00','23:59:59',0.012865600000000,0.000000000000000,30963,0,0,''),(30964,'00:00:00','23:59:59',0.015304080000000,0.000000000000000,30964,0,0,''),(30965,'00:00:00','23:59:59',0.010172800000000,0.000000000000000,30965,0,0,''),(30966,'00:00:00','23:59:59',0.015588320000000,0.000000000000000,30966,0,0,''),(30967,'00:00:00','23:59:59',0.010187760000000,0.000000000000000,30967,60,0,''),(30968,'00:00:00','23:59:59',0.695146320000000,0.000000000000000,30968,0,0,''),(30969,'00:00:00','23:59:59',0.023008480000000,0.000000000000000,30969,0,0,''),(30970,'00:00:00','23:59:59',0.016291440000000,0.000000000000000,30970,0,0,''),(30971,'00:00:00','23:59:59',0.025177680000000,0.000000000000000,30971,0,0,''),(30972,'00:00:00','23:59:59',0.048605040000000,0.000000000000000,30972,0,0,''),(30973,'00:00:00','23:59:59',0.008123280000000,0.000000000000000,30973,0,0,''),(30974,'00:00:00','23:59:59',0.014451360000000,0.000000000000000,30974,0,0,''),(30975,'00:00:00','23:59:59',0.015244240000000,0.000000000000000,30975,0,0,''),(30976,'00:00:00','23:59:59',0.054080400000000,0.000000000000000,30976,0,0,''),(30977,'00:00:00','23:59:59',0.099917840000000,0.000000000000000,30977,0,0,''),(30978,'00:00:00','23:59:59',0.013209680000000,0.000000000000000,30978,0,0,''),(30979,'00:00:00','23:59:59',0.011025520000000,0.000000000000000,30979,0,0,''),(30980,'00:00:00','23:59:59',0.015244240000000,0.000000000000000,30980,0,0,''),(30981,'00:00:00','23:59:59',0.023995840000000,0.000000000000000,30981,0,0,''),(30982,'00:00:00','23:59:59',0.013718320000000,0.000000000000000,30982,0,0,''),(30983,'00:00:00','23:59:59',0.071583600000000,0.000000000000000,30983,0,0,''),(30984,'00:00:00','23:59:59',0.012940400000000,0.000000000000000,30984,0,0,''),(30985,'00:00:00','23:59:59',0.034946560000000,0.000000000000000,30985,0,0,''),(30986,'00:00:00','23:59:59',0.016381200000000,0.000000000000000,30986,0,0,''),(30987,'00:00:00','23:59:59',0.098062800000000,0.000000000000000,30987,0,0,''),(30988,'00:00:00','23:59:59',0.206941680000000,0.000000000000000,30988,0,0,''),(30989,'00:00:00','23:59:59',0.113770800000000,0.000000000000000,30989,0,0,''),(30990,'00:00:00','23:59:59',0.154476960000000,0.000000000000000,30990,0,0,''),(30991,'00:00:00','23:59:59',0.045433520000000,0.000000000000000,30991,0,0,''),(30992,'00:00:00','23:59:59',0.276640320000000,0.000000000000000,30992,0,0,''),(30993,'00:00:00','23:59:59',0.019642480000000,0.000000000000000,30993,0,0,''),(30994,'00:00:00','23:59:59',0.058284160000000,0.000000000000000,30994,0,0,''),(30995,'00:00:00','23:59:59',0.440003520000000,0.000000000000000,30995,0,0,''),(30996,'00:00:00','23:59:59',0.212581600000000,0.000000000000000,30996,0,0,''),(30997,'00:00:00','23:59:59',0.478585360000000,0.000000000000000,30997,60,0,''),(30998,'00:00:00','23:59:59',0.167836240000000,0.000000000000000,30998,0,0,''),(30999,'00:00:00','23:59:59',0.431072400000000,0.000000000000000,30999,0,0,''),(31000,'00:00:00','23:59:59',0.204802400000000,0.000000000000000,31000,0,0,''),(31001,'00:00:00','23:59:59',0.388331680000000,0.000000000000000,31001,0,0,''),(31002,'00:00:00','23:59:59',0.239689120000000,0.000000000000000,31002,0,0,''),(31003,'00:00:00','23:59:59',0.207719600000000,0.000000000000000,31003,0,0,''),(31004,'00:00:00','23:59:59',0.317137040000000,0.000000000000000,31004,0,0,''),(31005,'00:00:00','23:59:59',0.331004960000000,0.000000000000000,31005,0,0,''),(31006,'00:00:00','23:59:59',0.224594480000000,0.000000000000000,31006,0,0,''),(31007,'00:00:00','23:59:59',0.059525840000000,0.000000000000000,31007,0,0,''),(31008,'00:00:00','23:59:59',0.381031200000000,0.000000000000000,31008,0,0,''),(31009,'00:00:00','23:59:59',0.412821200000000,0.000000000000000,31009,0,0,''),(31010,'00:00:00','23:59:59',0.147460720000000,0.000000000000000,31010,0,0,''),(31011,'00:00:00','23:59:59',0.053781200000000,0.000000000000000,31011,0,0,''),(31012,'00:00:00','23:59:59',0.307158720000000,0.000000000000000,31012,0,0,''),(31013,'00:00:00','23:59:59',0.284045520000000,0.000000000000000,31013,0,0,''),(31014,'00:00:00','23:59:59',0.126965520000000,0.000000000000000,31014,0,0,''),(31015,'00:00:00','23:59:59',0.203426080000000,0.000000000000000,31015,0,0,''),(31016,'00:00:00','23:59:59',0.837924560000000,0.000000000000000,31016,0,0,''),(31017,'00:00:00','23:59:59',0.212267440000000,0.000000000000000,31017,0,0,''),(31018,'00:00:00','23:59:59',0.417144640000000,0.000000000000000,31018,0,0,''),(31019,'00:00:00','23:59:59',0.400733520000000,0.000000000000000,31019,0,0,''),(31020,'00:00:00','23:59:59',0.299454320000000,0.000000000000000,31020,0,0,''),(31021,'00:00:00','23:59:59',0.062517840000000,0.000000000000000,31021,0,0,''),(31022,'00:00:00','23:59:59',0.325948480000000,0.000000000000000,31022,0,0,''),(31023,'00:00:00','23:59:59',1.332681680000000,0.000000000000000,31023,0,0,''),(31024,'00:00:00','23:59:59',1.351980080000000,0.000000000000000,31024,0,0,''),(31025,'00:00:00','23:59:59',0.430713360000000,0.000000000000000,31025,0,0,''),(31026,'00:00:00','23:59:59',0.156855600000000,0.000000000000000,31026,0,0,''),(31027,'00:00:00','23:59:59',0.279018960000000,0.000000000000000,31027,0,0,''),(31028,'00:00:00','23:59:59',0.229531280000000,0.000000000000000,31028,0,0,''),(31029,'00:00:00','23:59:59',0.455696560000000,0.000000000000000,31029,0,0,''),(31030,'00:00:00','23:59:59',0.322522640000000,0.000000000000000,31030,0,0,''),(31031,'00:00:00','23:59:59',0.113396800000000,0.000000000000000,31031,0,0,''),(31032,'00:00:00','23:59:59',0.305677680000000,0.000000000000000,31032,0,0,''),(31033,'00:00:00','23:59:59',0.287142240000000,0.000000000000000,31033,0,0,''),(31034,'00:00:00','23:59:59',0.415977760000000,0.000000000000000,31034,0,0,''),(31035,'00:00:00','23:59:59',0.061470640000000,0.000000000000000,31035,0,0,''),(31036,'00:00:00','23:59:59',0.065749200000000,0.000000000000000,31036,0,0,''),(31037,'00:00:00','23:59:59',0.576752880000000,0.000000000000000,31037,0,0,''),(31038,'00:00:00','23:59:59',0.091345760000000,0.000000000000000,31038,0,0,''),(31039,'00:00:00','23:59:59',0.044924880000000,0.000000000000000,31039,0,0,''),(31040,'00:00:00','23:59:59',0.195272880000000,0.000000000000000,31040,0,0,''),(31041,'00:00:00','23:59:59',0.149181120000000,0.000000000000000,31041,0,0,''),(31042,'00:00:00','23:59:59',0.072032400000000,0.000000000000000,31042,0,0,''),(31043,'00:00:00','23:59:59',0.038267680000000,0.000000000000000,31043,0,0,''),(31044,'00:00:00','23:59:59',0.236517600000000,0.000000000000000,31044,0,0,''),(31045,'00:00:00','23:59:59',1.119396960000000,0.000000000000000,31045,0,0,''),(31046,'00:00:00','23:59:59',0.229172240000000,0.000000000000000,31046,0,0,''),(31047,'00:00:00','23:59:59',0.082160320000000,0.000000000000000,31047,0,0,''),(31048,'00:00:00','23:59:59',0.053841040000000,0.000000000000000,31048,0,0,''),(31049,'00:00:00','23:59:59',0.323749360000000,0.000000000000000,31049,0,0,''),(31050,'00:00:00','23:59:59',0.008841360000000,0.000000000000000,31050,0,0,''),(31051,'00:00:00','23:59:59',0.020899120000000,0.000000000000000,31051,0,0,''),(31052,'00:00:00','23:59:59',0.032463200000000,0.000000000000000,31052,0,0,''),(31053,'00:00:00','23:59:59',0.008751600000000,0.000000000000000,31053,0,0,''),(31054,'00:00:00','23:59:59',0.014406480000000,0.000000000000000,31054,0,0,''),(31055,'00:00:00','23:59:59',0.010307440000000,0.000000000000000,31055,0,0,''),(31056,'00:00:00','23:59:59',0.017652800000000,0.000000000000000,31056,0,0,''),(31057,'00:00:00','23:59:59',0.125095520000000,0.000000000000000,31057,0,0,''),(31058,'00:00:00','23:59:59',0.013434080000000,0.000000000000000,31058,0,0,''),(31059,'00:00:00','23:59:59',0.009978320000000,0.000000000000000,31059,0,0,''),(31060,'00:00:00','23:59:59',0.038073200000000,0.000000000000000,31060,0,0,''),(31061,'00:00:00','23:59:59',0.016082000000000,0.000000000000000,31061,0,0,''),(31062,'00:00:00','23:59:59',0.007943760000000,0.000000000000000,31062,0,0,''),(31063,'00:00:00','23:59:59',0.015722960000000,0.000000000000000,31063,0,0,''),(31064,'00:00:00','23:59:59',0.019298400000000,0.000000000000000,31064,0,0,''),(31065,'00:00:00','23:59:59',0.021213280000000,0.000000000000000,31065,0,0,''),(31066,'00:00:00','23:59:59',0.213374480000000,0.000000000000000,31066,0,0,''),(31067,'00:00:00','23:59:59',0.099753280000000,0.000000000000000,31067,0,0,''),(31068,'00:00:00','23:59:59',0.319665280000000,0.000000000000000,31068,0,0,''),(31069,'00:00:00','23:59:59',0.019552720000000,0.000000000000000,31069,0,0,''),(31070,'00:00:00','23:59:59',0.067933360000000,0.000000000000000,31070,0,0,''),(31071,'00:00:00','23:59:59',0.114234560000000,0.000000000000000,31071,0,0,''),(31072,'00:00:00','23:59:59',0.104375920000000,0.000000000000000,31072,0,0,''),(31073,'00:00:00','23:59:59',0.122163360000000,0.000000000000000,31073,0,0,''),(31074,'00:00:00','23:59:59',0.126486800000000,0.000000000000000,31074,0,0,''),(31075,'00:00:00','23:59:59',0.013553760000000,0.000000000000000,31075,0,0,''),(31076,'00:00:00','23:59:59',0.018281120000000,0.000000000000000,31076,0,0,''),(31077,'00:00:00','23:59:59',0.114578640000000,0.000000000000000,31077,0,0,''),(31078,'00:00:00','23:59:59',0.160969600000000,0.000000000000000,31078,0,0,''),(31079,'00:00:00','23:59:59',0.172324240000000,0.000000000000000,31079,0,0,''),(31080,'00:00:00','23:59:59',0.022380160000000,0.000000000000000,31080,0,0,''),(31081,'00:00:00','23:59:59',0.010112960000000,0.000000000000000,31081,0,0,''),(31082,'00:00:00','23:59:59',0.072900080000000,0.000000000000000,31082,0,0,''),(31083,'00:00:00','23:59:59',0.010023200000000,0.000000000000000,31083,0,0,''),(31084,'00:00:00','23:59:59',0.011713680000000,0.000000000000000,31084,0,0,''),(31085,'00:00:00','23:59:59',0.149600000000000,0.000000000000000,31085,0,0,''),(31086,'00:00:00','23:59:59',0.020944000000000,0.000000000000000,31086,0,0,''),(31087,'00:00:00','23:59:59',0.007390240000000,0.000000000000000,31087,0,0,''),(31088,'00:00:00','23:59:59',0.037564560000000,0.000000000000000,31088,0,0,''),(31089,'00:00:00','23:59:59',0.037564560000000,0.000000000000000,31089,0,0,''),(31090,'00:00:00','23:59:59',1.031851040000000,0.000000000000000,31090,0,0,''),(31091,'00:00:00','23:59:59',0.205625200000000,0.000000000000000,31091,0,0,''),(31092,'00:00:00','23:59:59',0.085406640000000,0.000000000000000,31092,0,0,''),(31093,'00:00:00','23:59:59',0.150377920000000,0.000000000000000,31093,0,0,''),(31094,'00:00:00','23:59:59',0.084434240000000,0.000000000000000,31094,0,0,''),(31095,'00:00:00','23:59:59',0.119694960000000,0.000000000000000,31095,0,0,''),(31096,'00:00:00','23:59:59',0.015767840000000,0.000000000000000,31096,0,0,''),(31097,'00:00:00','23:59:59',0.031430960000000,0.000000000000000,31097,0,0,''),(31098,'00:00:00','23:59:59',0.274904960000000,0.000000000000000,31098,0,0,''),(31099,'00:00:00','23:59:59',0.261007120000000,0.000000000000000,31099,0,0,''),(31100,'00:00:00','23:59:59',0.068127840000000,0.000000000000000,31100,0,0,''),(31101,'00:00:00','23:59:59',0.037444880000000,0.000000000000000,31101,60,0,''),(31102,'00:00:00','23:59:59',0.692079520000000,0.000000000000000,31102,0,0,''),(31103,'00:00:00','23:59:59',0.106949040000000,0.000000000000000,31103,0,0,''),(31104,'00:00:00','23:59:59',0.014301760000000,0.000000000000000,31104,0,0,''),(31105,'00:00:00','23:59:59',0.040481760000000,0.000000000000000,31105,0,0,''),(31106,'00:00:00','23:59:59',0.015319040000000,0.000000000000000,31106,0,0,''),(31107,'00:00:00','23:59:59',0.111167760000000,0.000000000000000,31107,0,0,''),(31108,'00:00:00','23:59:59',0.206537760000000,0.000000000000000,31108,0,0,''),(31109,'00:00:00','23:59:59',0.094292880000000,0.000000000000000,31109,0,0,''),(31110,'00:00:00','23:59:59',0.017727600000000,0.000000000000000,31110,0,0,''),(31111,'00:00:00','23:59:59',0.029695600000000,0.000000000000000,31111,0,0,''),(31112,'00:00:00','23:59:59',0.015408800000000,0.000000000000000,31112,0,0,''),(31113,'00:00:00','23:59:59',0.147356000000000,0.000000000000000,31113,0,0,''),(31114,'00:00:00','23:59:59',0.040377040000000,0.000000000000000,31114,0,0,''),(31115,'00:00:00','23:59:59',0.063026480000000,0.000000000000000,31115,0,0,''),(31116,'00:00:00','23:59:59',0.145530880000000,0.000000000000000,31116,0,0,''),(31117,'00:00:00','23:59:59',0.010995600000000,0.000000000000000,31117,0,0,''),(31118,'00:00:00','23:59:59',0.010995600000000,0.000000000000000,31118,0,0,''),(31119,'00:00:00','23:59:59',0.017368560000000,0.000000000000000,31119,0,0,''),(31120,'00:00:00','23:59:59',0.017368560000000,0.000000000000000,31120,0,0,''),(31121,'00:00:00','23:59:59',0.564829760000000,0.000000000000000,31121,0,0,''),(31122,'00:00:00','23:59:59',0.027750800000000,0.000000000000000,31122,0,0,''),(31123,'00:00:00','23:59:59',0.680754800000000,0.000000000000000,31123,0,0,''),(31124,'00:00:00','23:59:59',0.449652720000000,0.000000000000000,31124,0,0,''),(31125,'00:00:00','23:59:59',0.404712880000000,0.000000000000000,31125,0,0,''),(31126,'00:00:00','23:59:59',0.760222320000000,0.000000000000000,31126,0,0,''),(31127,'00:00:00','23:59:59',0.465644960000000,0.000000000000000,31127,0,0,''),(31128,'00:00:00','23:59:59',0.171172320000000,0.000000000000000,31128,0,0,''),(31129,'00:00:00','23:59:59',0.351904080000000,0.000000000000000,31129,0,0,''),(31130,'00:00:00','23:59:59',0.602125040000000,0.000000000000000,31130,0,0,''),(31131,'00:00:00','23:59:59',0.599282640000000,0.000000000000000,31131,0,0,''),(31132,'00:00:00','23:59:59',0.717990240000000,0.000000000000000,31132,0,0,''),(31133,'00:00:00','23:59:59',0.548089520000000,0.000000000000000,31133,0,0,''),(31134,'00:00:00','23:59:59',0.568450080000000,0.000000000000000,31134,0,0,''),(31135,'00:00:00','23:59:59',0.159144480000000,0.000000000000000,31135,0,0,''),(31136,'00:00:00','23:59:59',0.485063040000000,0.000000000000000,31136,0,0,''),(31137,'00:00:00','23:59:59',0.197053120000000,0.000000000000000,31137,0,0,''),(31138,'00:00:00','23:59:59',1.226256240000000,0.000000000000000,31138,0,0,''),(31139,'00:00:00','23:59:59',0.204233920000000,0.000000000000000,31139,0,0,''),(31140,'00:00:00','23:59:59',0.232777600000000,0.000000000000000,31140,0,0,''),(31141,'00:00:00','23:59:59',0.018685040000000,0.000000000000000,31141,0,0,''),(31142,'00:00:00','23:59:59',0.122911360000000,0.000000000000000,31142,0,0,''),(31143,'00:00:00','23:59:59',0.091794560000000,0.000000000000000,31143,0,0,''),(31144,'00:00:00','23:59:59',0.089715120000000,0.000000000000000,31144,0,0,''),(31145,'00:00:00','23:59:59',0.122911360000000,0.000000000000000,31145,0,0,''),(31146,'00:00:00','23:59:59',0.122911360000000,0.000000000000000,31146,0,0,''),(31147,'00:00:00','23:59:59',0.098406880000000,0.000000000000000,31147,0,0,''),(31148,'00:00:00','23:59:59',0.122911360000000,0.000000000000000,31148,0,0,''),(31149,'00:00:00','23:59:59',0.091794560000000,0.000000000000000,31149,0,0,''),(31150,'00:00:00','23:59:59',0.122911360000000,0.000000000000000,31150,0,0,''),(31151,'00:00:00','23:59:59',0.072989840000000,0.000000000000000,31151,0,0,''),(31152,'00:00:00','23:59:59',0.072541040000000,0.000000000000000,31152,0,0,''),(31153,'00:00:00','23:59:59',0.496537360000000,0.000000000000000,31153,0,0,''),(31154,'00:00:00','23:59:59',0.017069360000000,0.000000000000000,31154,0,0,''),(31155,'00:00:00','23:59:59',0.060662800000000,0.000000000000000,31155,0,0,''),(31156,'00:00:00','23:59:59',0.052704080000000,0.000000000000000,31156,0,0,''),(31157,'00:00:00','23:59:59',0.036547280000000,0.000000000000000,31157,0,0,''),(31158,'00:00:00','23:59:59',0.547565920000000,0.000000000000000,31158,0,0,''),(31159,'00:00:00','23:59:59',0.032807280000000,0.000000000000000,31159,0,0,''),(31160,'00:00:00','23:59:59',0.016336320000000,0.000000000000000,31160,0,0,''),(31161,'00:00:00','23:59:59',0.130660640000000,0.000000000000000,31161,0,0,''),(31162,'00:00:00','23:59:59',0.155494240000000,0.000000000000000,31162,0,0,''),(31163,'00:00:00','23:59:59',0.765667760000000,0.000000000000000,31163,0,0,''),(31164,'00:00:00','23:59:59',0.083895680000000,0.000000000000000,31164,0,0,''),(31165,'00:00:00','23:59:59',0.080903680000000,0.000000000000000,31165,0,0,''),(31166,'00:00:00','23:59:59',0.094203120000000,0.000000000000000,31166,0,0,''),(31167,'00:00:00','23:59:59',0.120293360000000,0.000000000000000,31167,0,0,''),(31168,'00:00:00','23:59:59',0.040840800000000,0.000000000000000,31168,0,0,''),(31169,'00:00:00','23:59:59',0.078988800000000,0.000000000000000,31169,0,0,''),(31170,'00:00:00','23:59:59',0.140579120000000,0.000000000000000,31170,0,0,''),(31171,'00:00:00','23:59:59',0.100665840000000,0.000000000000000,31171,0,0,''),(31172,'00:00:00','23:59:59',0.144244320000000,0.000000000000000,31172,0,0,''),(31173,'00:00:00','23:59:59',0.009843680000000,0.000000000000000,31173,0,0,''),(31174,'00:00:00','23:59:59',0.039808560000000,0.000000000000000,31174,0,0,''),(31175,'00:00:00','23:59:59',0.144543520000000,0.000000000000000,31175,0,0,''),(31176,'00:00:00','23:59:59',0.064028800000000,0.000000000000000,31176,0,0,''),(31177,'00:00:00','23:59:59',0.028768080000000,0.000000000000000,31177,0,0,''),(31178,'00:00:00','23:59:59',0.106590000000000,0.000000000000000,31178,0,0,''),(31179,'00:00:00','23:59:59',0.125409680000000,0.000000000000000,31179,0,0,''),(31180,'00:00:00','23:59:59',0.100007600000000,0.000000000000000,31180,0,0,''),(31181,'00:00:00','23:59:59',0.202558400000000,0.000000000000000,31181,0,0,''),(31182,'00:00:00','23:59:59',0.039389680000000,0.000000000000000,31182,0,0,''),(31183,'00:00:00','23:59:59',0.126681280000000,0.000000000000000,31183,0,0,''),(31184,'00:00:00','23:59:59',0.043443840000000,0.000000000000000,31184,0,0,''),(31185,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31185,6,0,''),(31186,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31186,6,0,''),(31187,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31187,6,0,''),(31188,'00:00:00','23:59:59',0.006447760000000,0.000000000000000,31188,0,0,''),(31189,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31189,6,0,''),(31190,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31190,6,0,''),(31191,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31191,6,0,''),(31192,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31192,6,0,''),(31193,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31193,6,0,''),(31194,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31194,6,0,''),(31195,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31195,6,0,''),(31196,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31196,6,0,''),(31197,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31197,6,0,''),(31198,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31198,6,0,''),(31199,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31199,6,0,''),(31200,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31200,6,0,''),(31201,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31201,6,0,''),(31202,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31202,6,0,''),(31203,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31203,6,0,''),(31204,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31204,6,0,''),(31205,'00:00:00','23:59:59',0.006447760000000,0.000000000000000,31205,0,0,''),(31206,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31206,6,0,''),(31207,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31207,6,0,''),(31208,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31208,6,0,''),(31209,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31209,6,0,''),(31210,'00:00:00','23:59:59',0.006447760000000,0.000000000000000,31210,0,0,''),(31211,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31211,6,0,''),(31212,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31212,6,0,''),(31213,'00:00:00','23:59:59',0.067978240000000,0.000000000000000,31213,0,0,''),(31214,'00:00:00','23:59:59',0.131408640000000,0.000000000000000,31214,0,0,''),(31215,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31215,6,0,''),(31216,'00:00:00','23:59:59',0.006447760000000,0.000000000000000,31216,0,0,''),(31217,'00:00:00','23:59:59',0.006447760000000,0.000000000000000,31217,0,0,''),(31218,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31218,6,0,''),(31219,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31219,6,0,''),(31220,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31220,6,0,''),(31221,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31221,6,0,''),(31222,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31222,6,0,''),(31223,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31223,6,0,''),(31224,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31224,6,0,''),(31225,'00:00:00','23:59:59',0.100381600000000,0.000000000000000,31225,0,0,''),(31226,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31226,6,0,''),(31227,'00:00:00','23:59:59',0.155464320000000,0.000000000000000,31227,0,0,''),(31228,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31228,6,0,''),(31229,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31229,6,0,''),(31230,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31230,6,0,''),(31231,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31231,6,0,''),(31232,'00:00:00','23:59:59',0.123958560000000,0.000000000000000,31232,0,0,''),(31233,'00:00:00','23:59:59',0.006447760000000,0.000000000000000,31233,0,0,''),(31234,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31234,6,0,''),(31235,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31235,6,0,''),(31236,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31236,6,0,''),(31237,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31237,6,0,''),(31238,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31238,6,0,''),(31239,'00:00:00','23:59:59',0.006447760000000,0.000000000000000,31239,0,0,''),(31240,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31240,6,0,''),(31241,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31241,6,0,''),(31242,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31242,6,0,''),(31243,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31243,6,0,''),(31244,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31244,6,0,''),(31245,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31245,6,0,''),(31246,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31246,6,0,''),(31247,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31247,6,0,''),(31248,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31248,6,0,''),(31249,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31249,6,0,''),(31250,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31250,6,0,''),(31251,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31251,6,0,''),(31252,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31252,6,0,''),(31253,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31253,6,0,''),(31254,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31254,6,0,''),(31255,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31255,6,0,''),(31256,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31256,6,0,''),(31257,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31257,6,0,''),(31258,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31258,6,0,''),(31259,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31259,6,0,''),(31260,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31260,6,0,''),(31261,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31261,6,0,''),(31262,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31262,6,0,''),(31263,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31263,6,0,''),(31264,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31264,6,0,''),(31265,'00:00:00','23:59:59',0.017233920000000,0.000000000000000,31265,6,0,''),(31266,'00:00:00','23:59:59',0.006447760000000,0.000000000000000,31266,0,0,''),(31267,'00:00:00','23:59:59',0.087411280000000,0.000000000000000,31267,0,0,''),(31268,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31268,6,0,''),(31269,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31269,6,0,''),(31270,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31270,6,0,''),(31271,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31271,6,0,''),(31272,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31272,6,0,''),(31273,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31273,6,0,''),(31274,'00:00:00','23:59:59',0.006447760000000,0.000000000000000,31274,0,0,''),(31275,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31275,6,0,''),(31276,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31276,6,0,''),(31277,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31277,6,0,''),(31278,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31278,6,0,''),(31279,'00:00:00','23:59:59',0.006447760000000,0.000000000000000,31279,0,0,''),(31280,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31280,6,0,''),(31281,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31281,6,0,''),(31282,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31282,6,0,''),(31283,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31283,6,0,''),(31284,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31284,6,0,''),(31285,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31285,6,0,''),(31286,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31286,6,0,''),(31287,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31287,6,0,''),(31288,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31288,6,0,''),(31289,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31289,6,0,''),(31290,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31290,6,0,''),(31291,'00:00:00','23:59:59',0.006447760000000,0.000000000000000,31291,0,0,''),(31292,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31292,6,0,''),(31293,'00:00:00','23:59:59',0.006447760000000,0.000000000000000,31293,0,0,''),(31294,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31294,6,0,''),(31295,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31295,6,0,''),(31296,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31296,6,0,''),(31297,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31297,6,0,''),(31298,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31298,6,0,''),(31299,'00:00:00','23:59:59',0.006447760000000,0.000000000000000,31299,0,0,''),(31300,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31300,6,0,''),(31301,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31301,6,0,''),(31302,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31302,6,0,''),(31303,'00:00:00','23:59:59',0.006447760000000,0.000000000000000,31303,0,0,''),(31304,'00:00:00','23:59:59',0.006447760000000,0.000000000000000,31304,0,0,''),(31305,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31305,6,0,''),(31306,'00:00:00','23:59:59',0.036786640000000,0.000000000000000,31306,0,0,''),(31307,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31307,6,0,''),(31308,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31308,6,0,''),(31309,'00:00:00','23:59:59',0.006447760000000,0.000000000000000,31309,0,0,''),(31310,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31310,6,0,''),(31311,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31311,6,0,''),(31312,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31312,6,0,''),(31313,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31313,6,0,''),(31314,'00:00:00','23:59:59',0.136450160000000,0.000000000000000,31314,0,0,''),(31315,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31315,6,0,''),(31316,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31316,6,0,''),(31317,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31317,6,0,''),(31318,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31318,6,0,''),(31319,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31319,6,0,''),(31320,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31320,6,0,''),(31321,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31321,6,0,''),(31322,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31322,6,0,''),(31323,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31323,6,0,''),(31324,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31324,6,0,''),(31325,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31325,6,0,''),(31326,'00:00:00','23:59:59',0.006447760000000,0.000000000000000,31326,0,0,''),(31327,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31327,6,0,''),(31328,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31328,6,0,''),(31329,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31329,6,0,''),(31330,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31330,6,0,''),(31331,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31331,6,0,''),(31332,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31332,6,0,''),(31333,'00:00:00','23:59:59',0.006447760000000,0.000000000000000,31333,0,0,''),(31334,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31334,6,0,''),(31335,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31335,6,0,''),(31336,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31336,6,0,''),(31337,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31337,6,0,''),(31338,'00:00:00','23:59:59',0.006447760000000,0.000000000000000,31338,0,0,''),(31339,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31339,6,0,''),(31340,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31340,6,0,''),(31341,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31341,6,0,''),(31342,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31342,6,0,''),(31343,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31343,6,0,''),(31344,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31344,6,0,''),(31345,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31345,6,0,''),(31346,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31346,6,0,''),(31347,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31347,6,0,''),(31348,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31348,6,0,''),(31349,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31349,6,0,''),(31350,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31350,6,0,''),(31351,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31351,6,0,''),(31352,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31352,6,0,''),(31353,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31353,6,0,''),(31354,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31354,6,0,''),(31355,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31355,6,0,''),(31356,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31356,6,0,''),(31357,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31357,6,0,''),(31358,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31358,6,0,''),(31359,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31359,6,0,''),(31360,'00:00:00','23:59:59',0.006447760000000,0.000000000000000,31360,0,0,''),(31361,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31361,6,0,''),(31362,'00:00:00','23:59:59',0.006447760000000,0.000000000000000,31362,0,0,''),(31363,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31363,6,0,''),(31364,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31364,6,0,''),(31365,'00:00:00','23:59:59',0.006447760000000,0.000000000000000,31365,0,0,''),(31366,'00:00:00','23:59:59',0.006447760000000,0.000000000000000,31366,0,0,''),(31367,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31367,6,0,''),(31368,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31368,6,0,''),(31369,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31369,6,0,''),(31370,'00:00:00','23:59:59',0.006447760000000,0.000000000000000,31370,0,0,''),(31371,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31371,6,0,''),(31372,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31372,6,0,''),(31373,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31373,6,0,''),(31374,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31374,6,0,''),(31375,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31375,6,0,''),(31376,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31376,6,0,''),(31377,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31377,6,0,''),(31378,'00:00:00','23:59:59',0.006447760000000,0.000000000000000,31378,0,0,''),(31379,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31379,6,0,''),(31380,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31380,6,0,''),(31381,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31381,6,0,''),(31382,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31382,6,0,''),(31383,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31383,6,0,''),(31384,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31384,6,0,''),(31385,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31385,6,0,''),(31386,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31386,6,0,''),(31387,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31387,6,0,''),(31388,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31388,6,0,''),(31389,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31389,6,0,''),(31390,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31390,6,0,''),(31391,'00:00:00','23:59:59',0.006447760000000,0.000000000000000,31391,0,0,''),(31392,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31392,6,0,''),(31393,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31393,6,0,''),(31394,'00:00:00','23:59:59',0.006447760000000,0.000000000000000,31394,0,0,''),(31395,'00:00:00','23:59:59',0.122447600000000,0.000000000000000,31395,0,0,''),(31396,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31396,6,0,''),(31397,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31397,6,0,''),(31398,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31398,6,0,''),(31399,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31399,6,0,''),(31400,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31400,6,0,''),(31401,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31401,6,0,''),(31402,'00:00:00','23:59:59',0.391204000000000,0.000000000000000,31402,0,0,''),(31403,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31403,6,0,''),(31404,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31404,6,0,''),(31405,'00:00:00','23:59:59',0.031864800000000,0.000000000000000,31405,0,0,''),(31406,'00:00:00','23:59:59',0.018834640000000,0.000000000000000,31406,0,0,''),(31407,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31407,6,0,''),(31408,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31408,6,0,''),(31409,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31409,6,0,''),(31410,'00:00:00','23:59:59',0.029291680000000,0.000000000000000,31410,0,0,''),(31411,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31411,6,0,''),(31412,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31412,6,0,''),(31413,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31413,6,0,''),(31414,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31414,6,0,''),(31415,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31415,6,0,''),(31416,'00:00:00','23:59:59',0.006447760000000,0.000000000000000,31416,0,0,''),(31417,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31417,6,0,''),(31418,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31418,6,0,''),(31419,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31419,6,0,''),(31420,'00:00:00','23:59:59',0.006447760000000,0.000000000000000,31420,0,0,''),(31421,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31421,6,0,''),(31422,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31422,6,0,''),(31423,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31423,6,0,''),(31424,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31424,6,0,''),(31425,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31425,6,0,''),(31426,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31426,6,0,''),(31427,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31427,6,0,''),(31428,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31428,6,0,''),(31429,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31429,6,0,''),(31430,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31430,6,0,''),(31431,'00:00:00','23:59:59',0.109133200000000,0.000000000000000,31431,0,0,''),(31432,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31432,6,0,''),(31433,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31433,6,0,''),(31434,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31434,6,0,''),(31435,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31435,6,0,''),(31436,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31436,6,0,''),(31437,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31437,6,0,''),(31438,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31438,6,0,''),(31439,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31439,6,0,''),(31440,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31440,6,0,''),(31441,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31441,6,0,''),(31442,'00:00:00','23:59:59',0.136674560000000,0.000000000000000,31442,0,0,''),(31443,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31443,6,0,''),(31444,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31444,6,0,''),(31445,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31445,6,0,''),(31446,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31446,6,0,''),(31447,'00:00:00','23:59:59',0.130451200000000,0.000000000000000,31447,0,0,''),(31448,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31448,6,0,''),(31449,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31449,6,0,''),(31450,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31450,6,0,''),(31451,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31451,6,0,''),(31452,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31452,6,0,''),(31453,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31453,6,0,''),(31454,'00:00:00','23:59:59',0.006447760000000,0.000000000000000,31454,0,0,''),(31455,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31455,6,0,''),(31456,'00:00:00','23:59:59',0.006447760000000,0.000000000000000,31456,0,0,''),(31457,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31457,6,0,''),(31458,'00:00:00','23:59:59',0.154387200000000,0.000000000000000,31458,0,0,''),(31459,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31459,6,0,''),(31460,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31460,6,0,''),(31461,'00:00:00','23:59:59',0.010367280000000,0.000000000000000,31461,0,0,''),(31462,'00:00:00','23:59:59',0.008811440000000,0.000000000000000,31462,6,0,''),(31463,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31463,6,0,''),(31464,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31464,6,0,''),(31465,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31465,6,0,''),(31466,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31466,6,0,''),(31467,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31467,6,0,''),(31468,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31468,6,0,''),(31469,'00:00:00','23:59:59',0.006447760000000,0.000000000000000,31469,0,0,''),(31470,'00:00:00','23:59:59',0.013134880000000,0.000000000000000,31470,6,0,''),(31471,'00:00:00','23:59:59',0.022395120000000,0.000000000000000,31471,0,0,''),(31472,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31472,6,0,''),(31473,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31473,6,0,''),(31474,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31474,6,0,''),(31475,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31475,6,0,''),(31476,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31476,6,0,''),(31477,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31477,6,0,''),(31478,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31478,6,0,''),(31479,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31479,6,0,''),(31480,'00:00:00','23:59:59',0.006447760000000,0.000000000000000,31480,0,0,''),(31481,'00:00:00','23:59:59',0.008811440000000,0.000000000000000,31481,6,0,''),(31482,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31482,6,0,''),(31483,'00:00:00','23:59:59',0.022395120000000,0.000000000000000,31483,0,0,''),(31484,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31484,6,0,''),(31485,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31485,6,0,''),(31486,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31486,6,0,''),(31487,'00:00:00','23:59:59',0.008811440000000,0.000000000000000,31487,6,0,''),(31488,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31488,6,0,''),(31489,'00:00:00','23:59:59',0.008811440000000,0.000000000000000,31489,6,0,''),(31490,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31490,6,0,''),(31491,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31491,6,0,''),(31492,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31492,6,0,''),(31493,'00:00:00','23:59:59',0.022395120000000,0.000000000000000,31493,0,0,''),(31494,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31494,6,0,''),(31495,'00:00:00','23:59:59',0.008811440000000,0.000000000000000,31495,6,0,''),(31496,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31496,6,0,''),(31497,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31497,6,0,''),(31498,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31498,6,0,''),(31499,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31499,6,0,''),(31500,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31500,6,0,''),(31501,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31501,6,0,''),(31502,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31502,6,0,''),(31503,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31503,6,0,''),(31504,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31504,6,0,''),(31505,'00:00:00','23:59:59',0.008811440000000,0.000000000000000,31505,6,0,''),(31506,'00:00:00','23:59:59',0.012581360000000,0.000000000000000,31506,0,0,''),(31507,'00:00:00','23:59:59',0.070431680000000,0.000000000000000,31507,0,0,''),(31508,'00:00:00','23:59:59',0.132695200000000,0.000000000000000,31508,0,0,''),(31509,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31509,6,0,''),(31510,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31510,6,0,''),(31511,'00:00:00','23:59:59',0.006447760000000,0.000000000000000,31511,0,0,''),(31512,'00:00:00','23:59:59',0.107308080000000,0.000000000000000,31512,0,0,''),(31513,'00:00:00','23:59:59',0.008811440000000,0.000000000000000,31513,6,0,''),(31514,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31514,6,0,''),(31515,'00:00:00','23:59:59',0.008811440000000,0.000000000000000,31515,6,0,''),(31516,'00:00:00','23:59:59',0.008811440000000,0.000000000000000,31516,6,0,''),(31517,'00:00:00','23:59:59',0.008811440000000,0.000000000000000,31517,6,0,''),(31518,'00:00:00','23:59:59',0.008811440000000,0.000000000000000,31518,6,0,''),(31519,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31519,6,0,''),(31520,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31520,6,0,''),(31521,'00:00:00','23:59:59',0.006447760000000,0.000000000000000,31521,0,0,''),(31522,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31522,6,0,''),(31523,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31523,6,0,''),(31524,'00:00:00','23:59:59',0.006447760000000,0.000000000000000,31524,0,0,''),(31525,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31525,6,0,''),(31526,'00:00:00','23:59:59',0.043877680000000,0.000000000000000,31526,6,0,''),(31527,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31527,6,0,''),(31528,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31528,6,0,''),(31529,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31529,6,0,''),(31530,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31530,6,0,''),(31531,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31531,6,0,''),(31532,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31532,6,0,''),(31533,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31533,6,0,''),(31534,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31534,6,0,''),(31535,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31535,6,0,''),(31536,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31536,6,0,''),(31537,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31537,6,0,''),(31538,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31538,6,0,''),(31539,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31539,6,0,''),(31540,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31540,6,0,''),(31541,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31541,6,0,''),(31542,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31542,6,0,''),(31543,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31543,6,0,''),(31544,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31544,6,0,''),(31545,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31545,6,0,''),(31546,'00:00:00','23:59:59',0.010367280000000,0.000000000000000,31546,0,0,''),(31547,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31547,6,0,''),(31548,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31548,6,0,''),(31549,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31549,6,0,''),(31550,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31550,6,0,''),(31551,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31551,6,0,''),(31552,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31552,6,0,''),(31553,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31553,6,0,''),(31554,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31554,6,0,''),(31555,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31555,6,0,''),(31556,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31556,6,0,''),(31557,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31557,6,0,''),(31558,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31558,6,0,''),(31559,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31559,6,0,''),(31560,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31560,6,0,''),(31561,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31561,6,0,''),(31562,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31562,6,0,''),(31563,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31563,6,0,''),(31564,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,31564,6,0,''),(31970,'00:00:00','23:59:59',0.038522000000000,0.000000000000000,31970,0,0,''),(31971,'00:00:00','23:59:59',0.075757440000000,0.000000000000000,31971,0,0,''),(31972,'00:00:00','23:59:59',0.020525120000000,0.000000000000000,31972,0,0,''),(31973,'00:00:00','23:59:59',0.012147520000000,0.000000000000000,31973,0,0,''),(31974,'00:00:00','23:59:59',0.011878240000000,0.000000000000000,31974,0,0,''),(31975,'00:00:00','23:59:59',0.016037120000000,0.000000000000000,31975,0,0,''),(31976,'00:00:00','23:59:59',0.009170480000000,0.000000000000000,31976,0,0,''),(31977,'00:00:00','23:59:59',0.010801120000000,0.000000000000000,31977,0,0,''),(31978,'00:00:00','23:59:59',0.008213040000000,0.000000000000000,31978,0,0,''),(31979,'00:00:00','23:59:59',0.009335040000000,0.000000000000000,31979,0,0,''),(31980,'00:00:00','23:59:59',0.010666480000000,0.000000000000000,31980,0,0,''),(31981,'00:00:00','23:59:59',0.016575680000000,0.000000000000000,31981,0,0,''),(31982,'00:00:00','23:59:59',0.009873600000000,0.000000000000000,31982,0,0,''),(31983,'00:00:00','23:59:59',0.008886240000000,0.000000000000000,31983,0,0,''),(31984,'00:00:00','23:59:59',0.009783840000000,0.000000000000000,31984,0,0,''),(31985,'00:00:00','23:59:59',0.007240640000000,0.000000000000000,31985,0,0,''),(31986,'00:00:00','23:59:59',0.012865600000000,0.000000000000000,31986,0,0,''),(31987,'00:00:00','23:59:59',0.015304080000000,0.000000000000000,31987,0,0,''),(31988,'00:00:00','23:59:59',0.010172800000000,0.000000000000000,31988,0,0,''),(31989,'00:00:00','23:59:59',0.015588320000000,0.000000000000000,31989,0,0,''),(31990,'00:00:00','23:59:59',0.010187760000000,0.000000000000000,31990,60,0,''),(31991,'00:00:00','23:59:59',0.695146320000000,0.000000000000000,31991,0,0,''),(31992,'00:00:00','23:59:59',0.023008480000000,0.000000000000000,31992,0,0,''),(31993,'00:00:00','23:59:59',0.016291440000000,0.000000000000000,31993,0,0,''),(31994,'00:00:00','23:59:59',0.025177680000000,0.000000000000000,31994,0,0,''),(31995,'00:00:00','23:59:59',0.048605040000000,0.000000000000000,31995,0,0,''),(31996,'00:00:00','23:59:59',0.008123280000000,0.000000000000000,31996,0,0,''),(31997,'00:00:00','23:59:59',0.014451360000000,0.000000000000000,31997,0,0,''),(31998,'00:00:00','23:59:59',0.015244240000000,0.000000000000000,31998,0,0,''),(31999,'00:00:00','23:59:59',0.054080400000000,0.000000000000000,31999,0,0,''),(32000,'00:00:00','23:59:59',0.099917840000000,0.000000000000000,32000,0,0,''),(32001,'00:00:00','23:59:59',0.013209680000000,0.000000000000000,32001,0,0,''),(32002,'00:00:00','23:59:59',0.011025520000000,0.000000000000000,32002,0,0,''),(32003,'00:00:00','23:59:59',0.015244240000000,0.000000000000000,32003,0,0,''),(32004,'00:00:00','23:59:59',0.023995840000000,0.000000000000000,32004,0,0,''),(32005,'00:00:00','23:59:59',0.013718320000000,0.000000000000000,32005,0,0,''),(32006,'00:00:00','23:59:59',0.071583600000000,0.000000000000000,32006,0,0,''),(32007,'00:00:00','23:59:59',0.012940400000000,0.000000000000000,32007,0,0,''),(32008,'00:00:00','23:59:59',0.034946560000000,0.000000000000000,32008,0,0,''),(32009,'00:00:00','23:59:59',0.016381200000000,0.000000000000000,32009,0,0,''),(32010,'00:00:00','23:59:59',0.098062800000000,0.000000000000000,32010,0,0,''),(32011,'00:00:00','23:59:59',0.206941680000000,0.000000000000000,32011,0,0,''),(32012,'00:00:00','23:59:59',0.113770800000000,0.000000000000000,32012,0,0,''),(32013,'00:00:00','23:59:59',0.154476960000000,0.000000000000000,32013,0,0,''),(32014,'00:00:00','23:59:59',0.045433520000000,0.000000000000000,32014,0,0,''),(32015,'00:00:00','23:59:59',0.276640320000000,0.000000000000000,32015,0,0,''),(32016,'00:00:00','23:59:59',0.019642480000000,0.000000000000000,32016,0,0,''),(32017,'00:00:00','23:59:59',0.058284160000000,0.000000000000000,32017,0,0,''),(32018,'00:00:00','23:59:59',0.440003520000000,0.000000000000000,32018,0,0,''),(32019,'00:00:00','23:59:59',0.212581600000000,0.000000000000000,32019,0,0,''),(32020,'00:00:00','23:59:59',0.478585360000000,0.000000000000000,32020,60,0,''),(32021,'00:00:00','23:59:59',0.167836240000000,0.000000000000000,32021,0,0,''),(32022,'00:00:00','23:59:59',0.431072400000000,0.000000000000000,32022,0,0,''),(32023,'00:00:00','23:59:59',0.204802400000000,0.000000000000000,32023,0,0,''),(32024,'00:00:00','23:59:59',0.388331680000000,0.000000000000000,32024,0,0,''),(32025,'00:00:00','23:59:59',0.239689120000000,0.000000000000000,32025,0,0,''),(32026,'00:00:00','23:59:59',0.207719600000000,0.000000000000000,32026,0,0,''),(32027,'00:00:00','23:59:59',0.317137040000000,0.000000000000000,32027,0,0,''),(32028,'00:00:00','23:59:59',0.331004960000000,0.000000000000000,32028,0,0,''),(32029,'00:00:00','23:59:59',0.224594480000000,0.000000000000000,32029,0,0,''),(32030,'00:00:00','23:59:59',0.059525840000000,0.000000000000000,32030,0,0,''),(32031,'00:00:00','23:59:59',0.381031200000000,0.000000000000000,32031,0,0,''),(32032,'00:00:00','23:59:59',0.412821200000000,0.000000000000000,32032,0,0,''),(32033,'00:00:00','23:59:59',0.147460720000000,0.000000000000000,32033,0,0,''),(32034,'00:00:00','23:59:59',0.053781200000000,0.000000000000000,32034,0,0,''),(32035,'00:00:00','23:59:59',0.307158720000000,0.000000000000000,32035,0,0,''),(32036,'00:00:00','23:59:59',0.284045520000000,0.000000000000000,32036,0,0,''),(32037,'00:00:00','23:59:59',0.126965520000000,0.000000000000000,32037,0,0,''),(32038,'00:00:00','23:59:59',0.203426080000000,0.000000000000000,32038,0,0,''),(32039,'00:00:00','23:59:59',0.837924560000000,0.000000000000000,32039,0,0,''),(32040,'00:00:00','23:59:59',0.212267440000000,0.000000000000000,32040,0,0,''),(32041,'00:00:00','23:59:59',0.417144640000000,0.000000000000000,32041,0,0,''),(32042,'00:00:00','23:59:59',0.400733520000000,0.000000000000000,32042,0,0,''),(32043,'00:00:00','23:59:59',0.299454320000000,0.000000000000000,32043,0,0,''),(32044,'00:00:00','23:59:59',0.062517840000000,0.000000000000000,32044,0,0,''),(32045,'00:00:00','23:59:59',0.325948480000000,0.000000000000000,32045,0,0,''),(32046,'00:00:00','23:59:59',1.332681680000000,0.000000000000000,32046,0,0,''),(32047,'00:00:00','23:59:59',1.351980080000000,0.000000000000000,32047,0,0,''),(32048,'00:00:00','23:59:59',0.430713360000000,0.000000000000000,32048,0,0,''),(32049,'00:00:00','23:59:59',0.156855600000000,0.000000000000000,32049,0,0,''),(32050,'00:00:00','23:59:59',0.279018960000000,0.000000000000000,32050,0,0,''),(32051,'00:00:00','23:59:59',0.229531280000000,0.000000000000000,32051,0,0,''),(32052,'00:00:00','23:59:59',0.455696560000000,0.000000000000000,32052,0,0,''),(32053,'00:00:00','23:59:59',0.322522640000000,0.000000000000000,32053,0,0,''),(32054,'00:00:00','23:59:59',0.113396800000000,0.000000000000000,32054,0,0,''),(32055,'00:00:00','23:59:59',0.305677680000000,0.000000000000000,32055,0,0,''),(32056,'00:00:00','23:59:59',0.287142240000000,0.000000000000000,32056,0,0,''),(32057,'00:00:00','23:59:59',0.415977760000000,0.000000000000000,32057,0,0,''),(32058,'00:00:00','23:59:59',0.061470640000000,0.000000000000000,32058,0,0,''),(32059,'00:00:00','23:59:59',0.065749200000000,0.000000000000000,32059,0,0,''),(32060,'00:00:00','23:59:59',0.576752880000000,0.000000000000000,32060,0,0,''),(32061,'00:00:00','23:59:59',0.091345760000000,0.000000000000000,32061,0,0,''),(32062,'00:00:00','23:59:59',0.044924880000000,0.000000000000000,32062,0,0,''),(32063,'00:00:00','23:59:59',0.195272880000000,0.000000000000000,32063,0,0,''),(32064,'00:00:00','23:59:59',0.149181120000000,0.000000000000000,32064,0,0,''),(32065,'00:00:00','23:59:59',0.072032400000000,0.000000000000000,32065,0,0,''),(32066,'00:00:00','23:59:59',0.038267680000000,0.000000000000000,32066,0,0,''),(32067,'00:00:00','23:59:59',0.236517600000000,0.000000000000000,32067,0,0,''),(32068,'00:00:00','23:59:59',1.119396960000000,0.000000000000000,32068,0,0,''),(32069,'00:00:00','23:59:59',0.229172240000000,0.000000000000000,32069,0,0,''),(32070,'00:00:00','23:59:59',0.082160320000000,0.000000000000000,32070,0,0,''),(32071,'00:00:00','23:59:59',0.053841040000000,0.000000000000000,32071,0,0,''),(32072,'00:00:00','23:59:59',0.323749360000000,0.000000000000000,32072,0,0,''),(32073,'00:00:00','23:59:59',0.008841360000000,0.000000000000000,32073,0,0,''),(32074,'00:00:00','23:59:59',0.020899120000000,0.000000000000000,32074,0,0,''),(32075,'00:00:00','23:59:59',0.032463200000000,0.000000000000000,32075,0,0,''),(32076,'00:00:00','23:59:59',0.008751600000000,0.000000000000000,32076,0,0,''),(32077,'00:00:00','23:59:59',0.014406480000000,0.000000000000000,32077,0,0,''),(32078,'00:00:00','23:59:59',0.010307440000000,0.000000000000000,32078,0,0,''),(32079,'00:00:00','23:59:59',0.017652800000000,0.000000000000000,32079,0,0,''),(32080,'00:00:00','23:59:59',0.125095520000000,0.000000000000000,32080,0,0,''),(32081,'00:00:00','23:59:59',0.013434080000000,0.000000000000000,32081,0,0,''),(32082,'00:00:00','23:59:59',0.009978320000000,0.000000000000000,32082,0,0,''),(32083,'00:00:00','23:59:59',0.038073200000000,0.000000000000000,32083,0,0,''),(32084,'00:00:00','23:59:59',0.016082000000000,0.000000000000000,32084,0,0,''),(32085,'00:00:00','23:59:59',0.007943760000000,0.000000000000000,32085,0,0,''),(32086,'00:00:00','23:59:59',0.015722960000000,0.000000000000000,32086,0,0,''),(32087,'00:00:00','23:59:59',0.019298400000000,0.000000000000000,32087,0,0,''),(32088,'00:00:00','23:59:59',0.021213280000000,0.000000000000000,32088,0,0,''),(32089,'00:00:00','23:59:59',0.213374480000000,0.000000000000000,32089,0,0,''),(32090,'00:00:00','23:59:59',0.099753280000000,0.000000000000000,32090,0,0,''),(32091,'00:00:00','23:59:59',0.319665280000000,0.000000000000000,32091,0,0,''),(32092,'00:00:00','23:59:59',0.019552720000000,0.000000000000000,32092,0,0,''),(32093,'00:00:00','23:59:59',0.067933360000000,0.000000000000000,32093,0,0,''),(32094,'00:00:00','23:59:59',0.114234560000000,0.000000000000000,32094,0,0,''),(32095,'00:00:00','23:59:59',0.104375920000000,0.000000000000000,32095,0,0,''),(32096,'00:00:00','23:59:59',0.122163360000000,0.000000000000000,32096,0,0,''),(32097,'00:00:00','23:59:59',0.126486800000000,0.000000000000000,32097,0,0,''),(32098,'00:00:00','23:59:59',0.013553760000000,0.000000000000000,32098,0,0,''),(32099,'00:00:00','23:59:59',0.018281120000000,0.000000000000000,32099,0,0,''),(32100,'00:00:00','23:59:59',0.114578640000000,0.000000000000000,32100,0,0,''),(32101,'00:00:00','23:59:59',0.160969600000000,0.000000000000000,32101,0,0,''),(32102,'00:00:00','23:59:59',0.172324240000000,0.000000000000000,32102,0,0,''),(32103,'00:00:00','23:59:59',0.022380160000000,0.000000000000000,32103,0,0,''),(32104,'00:00:00','23:59:59',0.010112960000000,0.000000000000000,32104,0,0,''),(32105,'00:00:00','23:59:59',0.072900080000000,0.000000000000000,32105,0,0,''),(32106,'00:00:00','23:59:59',0.010023200000000,0.000000000000000,32106,0,0,''),(32107,'00:00:00','23:59:59',0.011713680000000,0.000000000000000,32107,0,0,''),(32108,'00:00:00','23:59:59',0.149600000000000,0.000000000000000,32108,0,0,''),(32109,'00:00:00','23:59:59',0.020944000000000,0.000000000000000,32109,0,0,''),(32110,'00:00:00','23:59:59',0.007390240000000,0.000000000000000,32110,0,0,''),(32111,'00:00:00','23:59:59',0.037564560000000,0.000000000000000,32111,0,0,''),(32112,'00:00:00','23:59:59',0.037564560000000,0.000000000000000,32112,0,0,''),(32113,'00:00:00','23:59:59',1.031851040000000,0.000000000000000,32113,0,0,''),(32114,'00:00:00','23:59:59',0.205625200000000,0.000000000000000,32114,0,0,''),(32115,'00:00:00','23:59:59',0.085406640000000,0.000000000000000,32115,0,0,''),(32116,'00:00:00','23:59:59',0.150377920000000,0.000000000000000,32116,0,0,''),(32117,'00:00:00','23:59:59',0.084434240000000,0.000000000000000,32117,0,0,''),(32118,'00:00:00','23:59:59',0.119694960000000,0.000000000000000,32118,0,0,''),(32119,'00:00:00','23:59:59',0.015767840000000,0.000000000000000,32119,0,0,''),(32120,'00:00:00','23:59:59',0.031430960000000,0.000000000000000,32120,0,0,''),(32121,'00:00:00','23:59:59',0.274904960000000,0.000000000000000,32121,0,0,''),(32122,'00:00:00','23:59:59',0.261007120000000,0.000000000000000,32122,0,0,''),(32123,'00:00:00','23:59:59',0.068127840000000,0.000000000000000,32123,0,0,''),(32124,'00:00:00','23:59:59',0.037444880000000,0.000000000000000,32124,60,0,''),(32125,'00:00:00','23:59:59',0.692079520000000,0.000000000000000,32125,0,0,''),(32126,'00:00:00','23:59:59',0.106949040000000,0.000000000000000,32126,0,0,''),(32127,'00:00:00','23:59:59',0.014301760000000,0.000000000000000,32127,0,0,''),(32128,'00:00:00','23:59:59',0.040481760000000,0.000000000000000,32128,0,0,''),(32129,'00:00:00','23:59:59',0.015319040000000,0.000000000000000,32129,0,0,''),(32130,'00:00:00','23:59:59',0.111167760000000,0.000000000000000,32130,0,0,''),(32131,'00:00:00','23:59:59',0.206537760000000,0.000000000000000,32131,0,0,''),(32132,'00:00:00','23:59:59',0.094292880000000,0.000000000000000,32132,0,0,''),(32133,'00:00:00','23:59:59',0.017727600000000,0.000000000000000,32133,0,0,''),(32134,'00:00:00','23:59:59',0.029695600000000,0.000000000000000,32134,0,0,''),(32135,'00:00:00','23:59:59',0.015408800000000,0.000000000000000,32135,0,0,''),(32136,'00:00:00','23:59:59',0.147356000000000,0.000000000000000,32136,0,0,''),(32137,'00:00:00','23:59:59',0.040377040000000,0.000000000000000,32137,0,0,''),(32138,'00:00:00','23:59:59',0.063026480000000,0.000000000000000,32138,0,0,''),(32139,'00:00:00','23:59:59',0.145530880000000,0.000000000000000,32139,0,0,''),(32140,'00:00:00','23:59:59',0.010995600000000,0.000000000000000,32140,0,0,''),(32141,'00:00:00','23:59:59',0.010995600000000,0.000000000000000,32141,0,0,''),(32142,'00:00:00','23:59:59',0.017368560000000,0.000000000000000,32142,0,0,''),(32143,'00:00:00','23:59:59',0.017368560000000,0.000000000000000,32143,0,0,''),(32144,'00:00:00','23:59:59',0.564829760000000,0.000000000000000,32144,0,0,''),(32145,'00:00:00','23:59:59',0.027750800000000,0.000000000000000,32145,0,0,''),(32146,'00:00:00','23:59:59',0.680754800000000,0.000000000000000,32146,0,0,''),(32147,'00:00:00','23:59:59',0.449652720000000,0.000000000000000,32147,0,0,''),(32148,'00:00:00','23:59:59',0.404712880000000,0.000000000000000,32148,0,0,''),(32149,'00:00:00','23:59:59',0.760222320000000,0.000000000000000,32149,0,0,''),(32150,'00:00:00','23:59:59',0.465644960000000,0.000000000000000,32150,0,0,''),(32151,'00:00:00','23:59:59',0.171172320000000,0.000000000000000,32151,0,0,''),(32152,'00:00:00','23:59:59',0.351904080000000,0.000000000000000,32152,0,0,''),(32153,'00:00:00','23:59:59',0.602125040000000,0.000000000000000,32153,0,0,''),(32154,'00:00:00','23:59:59',0.599282640000000,0.000000000000000,32154,0,0,''),(32155,'00:00:00','23:59:59',0.717990240000000,0.000000000000000,32155,0,0,''),(32156,'00:00:00','23:59:59',0.548089520000000,0.000000000000000,32156,0,0,''),(32157,'00:00:00','23:59:59',0.568450080000000,0.000000000000000,32157,0,0,''),(32158,'00:00:00','23:59:59',0.159144480000000,0.000000000000000,32158,0,0,''),(32159,'00:00:00','23:59:59',0.485063040000000,0.000000000000000,32159,0,0,''),(32160,'00:00:00','23:59:59',0.197053120000000,0.000000000000000,32160,0,0,''),(32161,'00:00:00','23:59:59',1.226256240000000,0.000000000000000,32161,0,0,''),(32162,'00:00:00','23:59:59',0.204233920000000,0.000000000000000,32162,0,0,''),(32163,'00:00:00','23:59:59',0.232777600000000,0.000000000000000,32163,0,0,''),(32164,'00:00:00','23:59:59',0.018685040000000,0.000000000000000,32164,0,0,''),(32165,'00:00:00','23:59:59',0.122911360000000,0.000000000000000,32165,0,0,''),(32166,'00:00:00','23:59:59',0.091794560000000,0.000000000000000,32166,0,0,''),(32167,'00:00:00','23:59:59',0.089715120000000,0.000000000000000,32167,0,0,''),(32168,'00:00:00','23:59:59',0.122911360000000,0.000000000000000,32168,0,0,''),(32169,'00:00:00','23:59:59',0.122911360000000,0.000000000000000,32169,0,0,''),(32170,'00:00:00','23:59:59',0.098406880000000,0.000000000000000,32170,0,0,''),(32171,'00:00:00','23:59:59',0.122911360000000,0.000000000000000,32171,0,0,''),(32172,'00:00:00','23:59:59',0.091794560000000,0.000000000000000,32172,0,0,''),(32173,'00:00:00','23:59:59',0.122911360000000,0.000000000000000,32173,0,0,''),(32174,'00:00:00','23:59:59',0.072989840000000,0.000000000000000,32174,0,0,''),(32175,'00:00:00','23:59:59',0.072541040000000,0.000000000000000,32175,0,0,''),(32176,'00:00:00','23:59:59',0.496537360000000,0.000000000000000,32176,0,0,''),(32177,'00:00:00','23:59:59',0.017069360000000,0.000000000000000,32177,0,0,''),(32178,'00:00:00','23:59:59',0.060662800000000,0.000000000000000,32178,0,0,''),(32179,'00:00:00','23:59:59',0.052704080000000,0.000000000000000,32179,0,0,''),(32180,'00:00:00','23:59:59',0.036547280000000,0.000000000000000,32180,0,0,''),(32181,'00:00:00','23:59:59',0.547565920000000,0.000000000000000,32181,0,0,''),(32182,'00:00:00','23:59:59',0.032807280000000,0.000000000000000,32182,0,0,''),(32183,'00:00:00','23:59:59',0.016336320000000,0.000000000000000,32183,0,0,''),(32184,'00:00:00','23:59:59',0.130660640000000,0.000000000000000,32184,0,0,''),(32185,'00:00:00','23:59:59',0.155494240000000,0.000000000000000,32185,0,0,''),(32186,'00:00:00','23:59:59',0.765667760000000,0.000000000000000,32186,0,0,''),(32187,'00:00:00','23:59:59',0.083895680000000,0.000000000000000,32187,0,0,''),(32188,'00:00:00','23:59:59',0.080903680000000,0.000000000000000,32188,0,0,''),(32189,'00:00:00','23:59:59',0.094203120000000,0.000000000000000,32189,0,0,''),(32190,'00:00:00','23:59:59',0.120293360000000,0.000000000000000,32190,0,0,''),(32191,'00:00:00','23:59:59',0.040840800000000,0.000000000000000,32191,0,0,''),(32192,'00:00:00','23:59:59',0.078988800000000,0.000000000000000,32192,0,0,''),(32193,'00:00:00','23:59:59',0.140579120000000,0.000000000000000,32193,0,0,''),(32194,'00:00:00','23:59:59',0.100665840000000,0.000000000000000,32194,0,0,''),(32195,'00:00:00','23:59:59',0.144244320000000,0.000000000000000,32195,0,0,''),(32196,'00:00:00','23:59:59',0.009843680000000,0.000000000000000,32196,0,0,''),(32197,'00:00:00','23:59:59',0.039808560000000,0.000000000000000,32197,0,0,''),(32198,'00:00:00','23:59:59',0.144543520000000,0.000000000000000,32198,0,0,''),(32199,'00:00:00','23:59:59',0.064028800000000,0.000000000000000,32199,0,0,''),(32200,'00:00:00','23:59:59',0.028768080000000,0.000000000000000,32200,0,0,''),(32201,'00:00:00','23:59:59',0.106590000000000,0.000000000000000,32201,0,0,''),(32202,'00:00:00','23:59:59',0.125409680000000,0.000000000000000,32202,0,0,''),(32203,'00:00:00','23:59:59',0.100007600000000,0.000000000000000,32203,0,0,''),(32204,'00:00:00','23:59:59',0.202558400000000,0.000000000000000,32204,0,0,''),(32205,'00:00:00','23:59:59',0.039389680000000,0.000000000000000,32205,0,0,''),(32206,'00:00:00','23:59:59',0.126681280000000,0.000000000000000,32206,0,0,''),(32207,'00:00:00','23:59:59',0.043443840000000,0.000000000000000,32207,0,0,''),(32208,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32208,6,0,''),(32209,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32209,6,0,''),(32210,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32210,6,0,''),(32211,'00:00:00','23:59:59',0.006447760000000,0.000000000000000,32211,0,0,''),(32212,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32212,6,0,''),(32213,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32213,6,0,''),(32214,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32214,6,0,''),(32215,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32215,6,0,''),(32216,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32216,6,0,''),(32217,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32217,6,0,''),(32218,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32218,6,0,''),(32219,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32219,6,0,''),(32220,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32220,6,0,''),(32221,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32221,6,0,''),(32222,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32222,6,0,''),(32223,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32223,6,0,''),(32224,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32224,6,0,''),(32225,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32225,6,0,''),(32226,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32226,6,0,''),(32227,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32227,6,0,''),(32228,'00:00:00','23:59:59',0.006447760000000,0.000000000000000,32228,0,0,''),(32229,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32229,6,0,''),(32230,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32230,6,0,''),(32231,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32231,6,0,''),(32232,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32232,6,0,''),(32233,'00:00:00','23:59:59',0.006447760000000,0.000000000000000,32233,0,0,''),(32234,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32234,6,0,''),(32235,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32235,6,0,''),(32236,'00:00:00','23:59:59',0.067978240000000,0.000000000000000,32236,0,0,''),(32237,'00:00:00','23:59:59',0.131408640000000,0.000000000000000,32237,0,0,''),(32238,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32238,6,0,''),(32239,'00:00:00','23:59:59',0.006447760000000,0.000000000000000,32239,0,0,''),(32240,'00:00:00','23:59:59',0.006447760000000,0.000000000000000,32240,0,0,''),(32241,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32241,6,0,''),(32242,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32242,6,0,''),(32243,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32243,6,0,''),(32244,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32244,6,0,''),(32245,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32245,6,0,''),(32246,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32246,6,0,''),(32247,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32247,6,0,''),(32248,'00:00:00','23:59:59',0.100381600000000,0.000000000000000,32248,0,0,''),(32249,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32249,6,0,''),(32250,'00:00:00','23:59:59',0.155464320000000,0.000000000000000,32250,0,0,''),(32251,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32251,6,0,''),(32252,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32252,6,0,''),(32253,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32253,6,0,''),(32254,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32254,6,0,''),(32255,'00:00:00','23:59:59',0.123958560000000,0.000000000000000,32255,0,0,''),(32256,'00:00:00','23:59:59',0.006447760000000,0.000000000000000,32256,0,0,''),(32257,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32257,6,0,''),(32258,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32258,6,0,''),(32259,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32259,6,0,''),(32260,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32260,6,0,''),(32261,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32261,6,0,''),(32262,'00:00:00','23:59:59',0.006447760000000,0.000000000000000,32262,0,0,''),(32263,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32263,6,0,''),(32264,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32264,6,0,''),(32265,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32265,6,0,''),(32266,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32266,6,0,''),(32267,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32267,6,0,''),(32268,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32268,6,0,''),(32269,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32269,6,0,''),(32270,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32270,6,0,''),(32271,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32271,6,0,''),(32272,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32272,6,0,''),(32273,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32273,6,0,''),(32274,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32274,6,0,''),(32275,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32275,6,0,''),(32276,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32276,6,0,''),(32277,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32277,6,0,''),(32278,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32278,6,0,''),(32279,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32279,6,0,''),(32280,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32280,6,0,''),(32281,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32281,6,0,''),(32282,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32282,6,0,''),(32283,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32283,6,0,''),(32284,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32284,6,0,''),(32285,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32285,6,0,''),(32286,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32286,6,0,''),(32287,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32287,6,0,''),(32288,'00:00:00','23:59:59',0.017233920000000,0.000000000000000,32288,6,0,''),(32289,'00:00:00','23:59:59',0.006447760000000,0.000000000000000,32289,0,0,''),(32290,'00:00:00','23:59:59',0.087411280000000,0.000000000000000,32290,0,0,''),(32291,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32291,6,0,''),(32292,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32292,6,0,''),(32293,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32293,6,0,''),(32294,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32294,6,0,''),(32295,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32295,6,0,''),(32296,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32296,6,0,''),(32297,'00:00:00','23:59:59',0.006447760000000,0.000000000000000,32297,0,0,''),(32298,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32298,6,0,''),(32299,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32299,6,0,''),(32300,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32300,6,0,''),(32301,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32301,6,0,''),(32302,'00:00:00','23:59:59',0.006447760000000,0.000000000000000,32302,0,0,''),(32303,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32303,6,0,''),(32304,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32304,6,0,''),(32305,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32305,6,0,''),(32306,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32306,6,0,''),(32307,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32307,6,0,''),(32308,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32308,6,0,''),(32309,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32309,6,0,''),(32310,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32310,6,0,''),(32311,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32311,6,0,''),(32312,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32312,6,0,''),(32313,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32313,6,0,''),(32314,'00:00:00','23:59:59',0.006447760000000,0.000000000000000,32314,0,0,''),(32315,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32315,6,0,''),(32316,'00:00:00','23:59:59',0.006447760000000,0.000000000000000,32316,0,0,''),(32317,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32317,6,0,''),(32318,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32318,6,0,''),(32319,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32319,6,0,''),(32320,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32320,6,0,''),(32321,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32321,6,0,''),(32322,'00:00:00','23:59:59',0.006447760000000,0.000000000000000,32322,0,0,''),(32323,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32323,6,0,''),(32324,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32324,6,0,''),(32325,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32325,6,0,''),(32326,'00:00:00','23:59:59',0.006447760000000,0.000000000000000,32326,0,0,''),(32327,'00:00:00','23:59:59',0.006447760000000,0.000000000000000,32327,0,0,''),(32328,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32328,6,0,''),(32329,'00:00:00','23:59:59',0.036786640000000,0.000000000000000,32329,0,0,''),(32330,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32330,6,0,''),(32331,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32331,6,0,''),(32332,'00:00:00','23:59:59',0.006447760000000,0.000000000000000,32332,0,0,''),(32333,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32333,6,0,''),(32334,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32334,6,0,''),(32335,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32335,6,0,''),(32336,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32336,6,0,''),(32337,'00:00:00','23:59:59',0.136450160000000,0.000000000000000,32337,0,0,''),(32338,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32338,6,0,''),(32339,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32339,6,0,''),(32340,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32340,6,0,''),(32341,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32341,6,0,''),(32342,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32342,6,0,''),(32343,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32343,6,0,''),(32344,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32344,6,0,''),(32345,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32345,6,0,''),(32346,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32346,6,0,''),(32347,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32347,6,0,''),(32348,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32348,6,0,''),(32349,'00:00:00','23:59:59',0.006447760000000,0.000000000000000,32349,0,0,''),(32350,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32350,6,0,''),(32351,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32351,6,0,''),(32352,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32352,6,0,''),(32353,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32353,6,0,''),(32354,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32354,6,0,''),(32355,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32355,6,0,''),(32356,'00:00:00','23:59:59',0.006447760000000,0.000000000000000,32356,0,0,''),(32357,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32357,6,0,''),(32358,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32358,6,0,''),(32359,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32359,6,0,''),(32360,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32360,6,0,''),(32361,'00:00:00','23:59:59',0.006447760000000,0.000000000000000,32361,0,0,''),(32362,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32362,6,0,''),(32363,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32363,6,0,''),(32364,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32364,6,0,''),(32365,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32365,6,0,''),(32366,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32366,6,0,''),(32367,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32367,6,0,''),(32368,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32368,6,0,''),(32369,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32369,6,0,''),(32370,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32370,6,0,''),(32371,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32371,6,0,''),(32372,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32372,6,0,''),(32373,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32373,6,0,''),(32374,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32374,6,0,''),(32375,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32375,6,0,''),(32376,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32376,6,0,''),(32377,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32377,6,0,''),(32378,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32378,6,0,''),(32379,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32379,6,0,''),(32380,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32380,6,0,''),(32381,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32381,6,0,''),(32382,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32382,6,0,''),(32383,'00:00:00','23:59:59',0.006447760000000,0.000000000000000,32383,0,0,''),(32384,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32384,6,0,''),(32385,'00:00:00','23:59:59',0.006447760000000,0.000000000000000,32385,0,0,''),(32386,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32386,6,0,''),(32387,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32387,6,0,''),(32388,'00:00:00','23:59:59',0.006447760000000,0.000000000000000,32388,0,0,''),(32389,'00:00:00','23:59:59',0.006447760000000,0.000000000000000,32389,0,0,''),(32390,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32390,6,0,''),(32391,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32391,6,0,''),(32392,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32392,6,0,''),(32393,'00:00:00','23:59:59',0.006447760000000,0.000000000000000,32393,0,0,''),(32394,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32394,6,0,''),(32395,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32395,6,0,''),(32396,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32396,6,0,''),(32397,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32397,6,0,''),(32398,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32398,6,0,''),(32399,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32399,6,0,''),(32400,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32400,6,0,''),(32401,'00:00:00','23:59:59',0.006447760000000,0.000000000000000,32401,0,0,''),(32402,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32402,6,0,''),(32403,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32403,6,0,''),(32404,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32404,6,0,''),(32405,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32405,6,0,''),(32406,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32406,6,0,''),(32407,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32407,6,0,''),(32408,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32408,6,0,''),(32409,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32409,6,0,''),(32410,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32410,6,0,''),(32411,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32411,6,0,''),(32412,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32412,6,0,''),(32413,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32413,6,0,''),(32414,'00:00:00','23:59:59',0.006447760000000,0.000000000000000,32414,0,0,''),(32415,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32415,6,0,''),(32416,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32416,6,0,''),(32417,'00:00:00','23:59:59',0.006447760000000,0.000000000000000,32417,0,0,''),(32418,'00:00:00','23:59:59',0.122447600000000,0.000000000000000,32418,0,0,''),(32419,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32419,6,0,''),(32420,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32420,6,0,''),(32421,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32421,6,0,''),(32422,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32422,6,0,''),(32423,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32423,6,0,''),(32424,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32424,6,0,''),(32425,'00:00:00','23:59:59',0.391204000000000,0.000000000000000,32425,0,0,''),(32426,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32426,6,0,''),(32427,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32427,6,0,''),(32428,'00:00:00','23:59:59',0.031864800000000,0.000000000000000,32428,0,0,''),(32429,'00:00:00','23:59:59',0.018834640000000,0.000000000000000,32429,0,0,''),(32430,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32430,6,0,''),(32431,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32431,6,0,''),(32432,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32432,6,0,''),(32433,'00:00:00','23:59:59',0.029291680000000,0.000000000000000,32433,0,0,''),(32434,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32434,6,0,''),(32435,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32435,6,0,''),(32436,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32436,6,0,''),(32437,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32437,6,0,''),(32438,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32438,6,0,''),(32439,'00:00:00','23:59:59',0.006447760000000,0.000000000000000,32439,0,0,''),(32440,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32440,6,0,''),(32441,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32441,6,0,''),(32442,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32442,6,0,''),(32443,'00:00:00','23:59:59',0.006447760000000,0.000000000000000,32443,0,0,''),(32444,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32444,6,0,''),(32445,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32445,6,0,''),(32446,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32446,6,0,''),(32447,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32447,6,0,''),(32448,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32448,6,0,''),(32449,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32449,6,0,''),(32450,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32450,6,0,''),(32451,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32451,6,0,''),(32452,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32452,6,0,''),(32453,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32453,6,0,''),(32454,'00:00:00','23:59:59',0.109133200000000,0.000000000000000,32454,0,0,''),(32455,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32455,6,0,''),(32456,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32456,6,0,''),(32457,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32457,6,0,''),(32458,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32458,6,0,''),(32459,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32459,6,0,''),(32460,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32460,6,0,''),(32461,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32461,6,0,''),(32462,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32462,6,0,''),(32463,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32463,6,0,''),(32464,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32464,6,0,''),(32465,'00:00:00','23:59:59',0.136674560000000,0.000000000000000,32465,0,0,''),(32466,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32466,6,0,''),(32467,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32467,6,0,''),(32468,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32468,6,0,''),(32469,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32469,6,0,''),(32470,'00:00:00','23:59:59',0.130451200000000,0.000000000000000,32470,0,0,''),(32471,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32471,6,0,''),(32472,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32472,6,0,''),(32473,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32473,6,0,''),(32474,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32474,6,0,''),(32475,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32475,6,0,''),(32476,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32476,6,0,''),(32477,'00:00:00','23:59:59',0.006447760000000,0.000000000000000,32477,0,0,''),(32478,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32478,6,0,''),(32479,'00:00:00','23:59:59',0.006447760000000,0.000000000000000,32479,0,0,''),(32480,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32480,6,0,''),(32481,'00:00:00','23:59:59',0.154387200000000,0.000000000000000,32481,0,0,''),(32482,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32482,6,0,''),(32483,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32483,6,0,''),(32484,'00:00:00','23:59:59',0.010367280000000,0.000000000000000,32484,0,0,''),(32485,'00:00:00','23:59:59',0.008811440000000,0.000000000000000,32485,6,0,''),(32486,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32486,6,0,''),(32487,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32487,6,0,''),(32488,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32488,6,0,''),(32489,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32489,6,0,''),(32490,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32490,6,0,''),(32491,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32491,6,0,''),(32492,'00:00:00','23:59:59',0.006447760000000,0.000000000000000,32492,0,0,''),(32493,'00:00:00','23:59:59',0.013134880000000,0.000000000000000,32493,6,0,''),(32494,'00:00:00','23:59:59',0.022395120000000,0.000000000000000,32494,0,0,''),(32495,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32495,6,0,''),(32496,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32496,6,0,''),(32497,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32497,6,0,''),(32498,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32498,6,0,''),(32499,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32499,6,0,''),(32500,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32500,6,0,''),(32501,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32501,6,0,''),(32502,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32502,6,0,''),(32503,'00:00:00','23:59:59',0.006447760000000,0.000000000000000,32503,0,0,''),(32504,'00:00:00','23:59:59',0.008811440000000,0.000000000000000,32504,6,0,''),(32505,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32505,6,0,''),(32506,'00:00:00','23:59:59',0.022395120000000,0.000000000000000,32506,0,0,''),(32507,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32507,6,0,''),(32508,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32508,6,0,''),(32509,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32509,6,0,''),(32510,'00:00:00','23:59:59',0.008811440000000,0.000000000000000,32510,6,0,''),(32511,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32511,6,0,''),(32512,'00:00:00','23:59:59',0.008811440000000,0.000000000000000,32512,6,0,''),(32513,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32513,6,0,''),(32514,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32514,6,0,''),(32515,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32515,6,0,''),(32516,'00:00:00','23:59:59',0.022395120000000,0.000000000000000,32516,0,0,''),(32517,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32517,6,0,''),(32518,'00:00:00','23:59:59',0.008811440000000,0.000000000000000,32518,6,0,''),(32519,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32519,6,0,''),(32520,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32520,6,0,''),(32521,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32521,6,0,''),(32522,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32522,6,0,''),(32523,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32523,6,0,''),(32524,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32524,6,0,''),(32525,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32525,6,0,''),(32526,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32526,6,0,''),(32527,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32527,6,0,''),(32528,'00:00:00','23:59:59',0.008811440000000,0.000000000000000,32528,6,0,''),(32529,'00:00:00','23:59:59',0.012581360000000,0.000000000000000,32529,0,0,''),(32530,'00:00:00','23:59:59',0.070431680000000,0.000000000000000,32530,0,0,''),(32531,'00:00:00','23:59:59',0.132695200000000,0.000000000000000,32531,0,0,''),(32532,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32532,6,0,''),(32533,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32533,6,0,''),(32534,'00:00:00','23:59:59',0.006447760000000,0.000000000000000,32534,0,0,''),(32535,'00:00:00','23:59:59',0.107308080000000,0.000000000000000,32535,0,0,''),(32536,'00:00:00','23:59:59',0.008811440000000,0.000000000000000,32536,6,0,''),(32537,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32537,6,0,''),(32538,'00:00:00','23:59:59',0.008811440000000,0.000000000000000,32538,6,0,''),(32539,'00:00:00','23:59:59',0.008811440000000,0.000000000000000,32539,6,0,''),(32540,'00:00:00','23:59:59',0.008811440000000,0.000000000000000,32540,6,0,''),(32541,'00:00:00','23:59:59',0.008811440000000,0.000000000000000,32541,6,0,''),(32542,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32542,6,0,''),(32543,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32543,6,0,''),(32544,'00:00:00','23:59:59',0.006447760000000,0.000000000000000,32544,0,0,''),(32545,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32545,6,0,''),(32546,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32546,6,0,''),(32547,'00:00:00','23:59:59',0.006447760000000,0.000000000000000,32547,0,0,''),(32548,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32548,6,0,''),(32549,'00:00:00','23:59:59',0.043877680000000,0.000000000000000,32549,6,0,''),(32550,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32550,6,0,''),(32551,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32551,6,0,''),(32552,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32552,6,0,''),(32553,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32553,6,0,''),(32554,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32554,6,0,''),(32555,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32555,6,0,''),(32556,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32556,6,0,''),(32557,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32557,6,0,''),(32558,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32558,6,0,''),(32559,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32559,6,0,''),(32560,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32560,6,0,''),(32561,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32561,6,0,''),(32562,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32562,6,0,''),(32563,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32563,6,0,''),(32564,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32564,6,0,''),(32565,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32565,6,0,''),(32566,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32566,6,0,''),(32567,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32567,6,0,''),(32568,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32568,6,0,''),(32569,'00:00:00','23:59:59',0.010367280000000,0.000000000000000,32569,0,0,''),(32570,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32570,6,0,''),(32571,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32571,6,0,''),(32572,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32572,6,0,''),(32573,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32573,6,0,''),(32574,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32574,6,0,''),(32575,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32575,6,0,''),(32576,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32576,6,0,''),(32577,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32577,6,0,''),(32578,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32578,6,0,''),(32579,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32579,6,0,''),(32580,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32580,6,0,''),(32581,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32581,6,0,''),(32582,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32582,6,0,''),(32583,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32583,6,0,''),(32584,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32584,6,0,''),(32585,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32585,6,0,''),(32586,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32586,6,0,''),(32587,'00:00:00','23:59:59',0.021048720000000,0.000000000000000,32587,6,0,'');
/*!40000 ALTER TABLE `ratedetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rates`
--

DROP TABLE IF EXISTS `rates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rates` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tariff_id` bigint(20) NOT NULL DEFAULT '0',
  `destination_id` bigint(20) NOT NULL DEFAULT '0',
  `destinationgroup_id` int(11) DEFAULT NULL,
  `ghost_min_perc` decimal(30,15) DEFAULT '0.000000000000000',
  `effective_from` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tariff` (`tariff_id`),
  KEY `dst` (`destination_id`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32993 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rates`
--

LOCK TABLES `rates` WRITE;
/*!40000 ALTER TABLE `rates` DISABLE KEYS */;
INSERT INTO `rates` VALUES (28901,1,31478,NULL,NULL,NULL),(28902,1,6352,NULL,NULL,NULL),(28903,1,33141,NULL,NULL,NULL),(28904,1,10415,NULL,NULL,NULL),(28905,1,16306,NULL,NULL,NULL),(28906,1,994,NULL,NULL,NULL),(28907,1,6792,NULL,NULL,NULL),(28908,1,33390,NULL,NULL,NULL),(28909,1,11165,NULL,NULL,NULL),(28910,1,13984,NULL,NULL,NULL),(28911,1,28888,NULL,NULL,NULL),(28912,1,34043,NULL,NULL,NULL),(28913,1,734,NULL,NULL,NULL),(28914,1,35914,NULL,NULL,NULL),(28915,1,4102,NULL,NULL,NULL),(28916,1,33712,NULL,NULL,NULL),(28917,1,16671,NULL,NULL,NULL),(28918,1,20188,NULL,NULL,NULL),(28919,1,10342,NULL,NULL,NULL),(28920,1,17269,NULL,NULL,NULL),(28921,1,16118,NULL,NULL,NULL),(28922,1,3961,NULL,NULL,NULL),(28923,1,530,NULL,NULL,NULL),(28924,1,1753,NULL,NULL,NULL),(28925,1,3543,NULL,NULL,NULL),(28926,1,3718,NULL,NULL,NULL),(28927,1,36830,NULL,NULL,NULL),(28928,1,15596,NULL,NULL,NULL),(28929,1,585,NULL,NULL,NULL),(28930,1,13837,NULL,NULL,NULL),(28931,1,17920,NULL,NULL,NULL),(28932,1,16494,NULL,NULL,NULL),(28933,1,32197,NULL,NULL,NULL),(28934,1,34363,NULL,NULL,NULL),(28935,1,14199,NULL,NULL,NULL),(28936,1,33306,NULL,NULL,NULL),(28937,1,36838,NULL,NULL,NULL),(28938,1,3690,NULL,NULL,NULL),(28939,1,35680,NULL,NULL,NULL),(28940,1,11209,NULL,NULL,NULL),(28941,1,17167,NULL,NULL,NULL),(28942,1,1,NULL,NULL,NULL),(28943,1,33575,NULL,NULL,NULL),(28944,1,16287,NULL,NULL,NULL),(28945,1,13917,NULL,NULL,NULL),(28946,1,33381,NULL,NULL,NULL),(28947,1,16212,NULL,NULL,NULL),(28948,1,454,NULL,NULL,NULL),(28949,1,35649,NULL,NULL,NULL),(28950,1,15054,NULL,NULL,NULL),(28951,1,10310,NULL,NULL,NULL),(28952,1,32097,NULL,NULL,NULL),(28953,1,15862,NULL,NULL,NULL),(28954,1,15766,NULL,NULL,NULL),(28955,1,10813,NULL,NULL,NULL),(28956,1,14026,NULL,NULL,NULL),(28957,1,2917,NULL,NULL,NULL),(28958,1,16597,NULL,NULL,NULL),(28959,1,35554,NULL,NULL,NULL),(28960,1,1059,NULL,NULL,NULL),(28961,1,15863,NULL,NULL,NULL),(28962,1,14974,NULL,NULL,NULL),(28963,1,32181,NULL,NULL,NULL),(28964,1,10396,NULL,NULL,NULL),(28965,1,16616,NULL,NULL,NULL),(28966,1,3537,NULL,NULL,NULL),(28967,1,3528,NULL,NULL,NULL),(28968,1,3019,NULL,NULL,NULL),(28969,1,3452,NULL,NULL,NULL),(28970,1,32079,NULL,NULL,NULL),(28971,1,6545,NULL,NULL,NULL),(28972,1,10297,NULL,NULL,NULL),(28973,1,3939,NULL,NULL,NULL),(28974,1,6225,NULL,NULL,NULL),(28975,1,479,NULL,NULL,NULL),(28976,1,10854,NULL,NULL,NULL),(28977,1,4578,NULL,NULL,NULL),(28978,1,584,NULL,NULL,NULL),(28979,1,32180,NULL,NULL,NULL),(28980,1,33681,NULL,NULL,NULL),(28981,1,31993,NULL,NULL,NULL),(28982,1,6677,NULL,NULL,NULL),(28983,1,33058,NULL,NULL,NULL),(28984,1,4580,NULL,NULL,NULL),(28985,1,14365,NULL,NULL,NULL),(28986,1,34349,NULL,NULL,NULL),(28987,1,35837,NULL,NULL,NULL),(28988,1,2939,NULL,NULL,NULL),(28989,1,16282,NULL,NULL,NULL),(28990,1,36881,NULL,NULL,NULL),(28991,1,15583,NULL,NULL,NULL),(28992,1,36885,NULL,NULL,NULL),(28993,1,16290,NULL,NULL,NULL),(28994,1,15592,NULL,NULL,NULL),(28995,1,14970,NULL,NULL,NULL),(28996,1,1712,NULL,NULL,NULL),(28997,1,33708,NULL,NULL,NULL),(28998,1,3938,NULL,NULL,NULL),(28999,1,33676,NULL,NULL,NULL),(29000,1,6550,NULL,NULL,NULL),(29001,1,565,NULL,NULL,NULL),(29002,1,6719,NULL,NULL,NULL),(29003,1,10424,NULL,NULL,NULL),(29004,1,9887,NULL,NULL,NULL),(29005,1,33438,NULL,NULL,NULL),(29006,1,10408,NULL,NULL,NULL),(29007,1,28513,NULL,NULL,NULL),(29008,1,15504,NULL,NULL,NULL),(29009,1,13940,NULL,NULL,NULL),(29010,1,11171,NULL,NULL,NULL),(29011,1,14,NULL,NULL,NULL),(29012,1,15780,NULL,NULL,NULL),(29013,1,3966,NULL,NULL,NULL),(29014,1,6752,NULL,NULL,NULL),(29015,1,2903,NULL,NULL,NULL),(29016,1,11166,NULL,NULL,NULL),(29017,1,15083,NULL,NULL,NULL),(29018,1,14416,NULL,NULL,NULL),(29019,1,6552,NULL,NULL,NULL),(29020,1,16124,NULL,NULL,NULL),(29021,1,553,NULL,NULL,NULL),(29022,1,981,NULL,NULL,NULL),(29023,1,474,NULL,NULL,NULL),(29024,1,16178,NULL,NULL,NULL),(29025,1,32074,NULL,NULL,NULL),(29026,1,35865,NULL,NULL,NULL),(29027,1,32107,NULL,NULL,NULL),(29028,1,16199,NULL,NULL,NULL),(29029,1,3953,NULL,NULL,NULL),(29030,1,32862,NULL,NULL,NULL),(29031,1,1152,NULL,NULL,NULL),(29032,1,15529,NULL,NULL,NULL),(29033,1,31296,NULL,NULL,NULL),(29034,1,3980,NULL,NULL,NULL),(29035,1,32838,NULL,NULL,NULL),(29036,1,15060,NULL,NULL,NULL),(29037,1,735,NULL,NULL,NULL),(29038,1,35916,NULL,NULL,NULL),(29039,1,36444,NULL,NULL,NULL),(29040,1,4162,NULL,NULL,NULL),(29041,1,33713,NULL,NULL,NULL),(29042,1,16935,NULL,NULL,NULL),(29043,1,16938,NULL,NULL,NULL),(29044,1,6740,NULL,NULL,NULL),(29045,1,1051,NULL,NULL,NULL),(29046,1,10534,NULL,NULL,NULL),(29047,1,6357,NULL,NULL,NULL),(29048,1,10913,NULL,NULL,NULL),(29049,1,16520,NULL,NULL,NULL),(29050,1,3948,NULL,NULL,NULL),(29051,1,17185,NULL,NULL,NULL),(29052,1,33677,NULL,NULL,NULL),(29053,1,10882,NULL,NULL,NULL),(29054,1,17332,NULL,NULL,NULL),(29055,1,16120,NULL,NULL,NULL),(29056,1,3963,NULL,NULL,NULL),(29057,1,550,NULL,NULL,NULL),(29058,1,3544,NULL,NULL,NULL),(29059,1,3545,NULL,NULL,NULL),(29060,1,10459,NULL,NULL,NULL),(29061,1,1080,NULL,NULL,NULL),(29062,1,10862,NULL,NULL,NULL),(29063,1,6260,NULL,NULL,NULL),(29064,1,10257,NULL,NULL,NULL),(29065,1,17246,NULL,NULL,NULL),(29066,1,15795,NULL,NULL,NULL),(29067,1,33707,NULL,NULL,NULL),(29068,1,36783,NULL,NULL,NULL),(29069,1,16445,NULL,NULL,NULL),(29070,1,20165,NULL,NULL,NULL),(29071,1,32411,NULL,NULL,NULL),(29072,1,32412,NULL,NULL,NULL),(29073,1,35049,NULL,NULL,NULL),(29074,1,35050,NULL,NULL,NULL),(29075,1,6256,NULL,NULL,NULL),(29076,1,2658,NULL,NULL,NULL),(29077,1,16294,NULL,NULL,NULL),(29078,1,17237,NULL,NULL,NULL),(29079,1,35566,NULL,NULL,NULL),(29080,1,32994,NULL,NULL,NULL),(29081,1,36790,NULL,NULL,NULL),(29082,1,6743,NULL,NULL,NULL),(29083,1,17178,NULL,NULL,NULL),(29084,1,36866,NULL,NULL,NULL),(29085,1,3944,NULL,NULL,NULL),(29086,1,16667,NULL,NULL,NULL),(29087,1,36870,NULL,NULL,NULL),(29088,1,14378,NULL,NULL,NULL),(29089,1,16476,NULL,NULL,NULL),(29090,1,35836,NULL,NULL,NULL),(29091,1,10288,NULL,NULL,NULL),(29092,1,35565,NULL,NULL,NULL),(29093,1,16123,NULL,NULL,NULL),(29094,1,15794,NULL,NULL,NULL),(29095,1,14329,NULL,NULL,NULL),(29096,1,31579,NULL,NULL,NULL),(29097,1,31635,NULL,NULL,NULL),(29098,1,31627,NULL,NULL,NULL),(29099,1,31580,NULL,NULL,NULL),(29100,1,31581,NULL,NULL,NULL),(29101,1,31982,NULL,NULL,NULL),(29102,1,31582,NULL,NULL,NULL),(29103,1,31636,NULL,NULL,NULL),(29104,1,31583,NULL,NULL,NULL),(29105,1,36839,NULL,NULL,NULL),(29106,1,36840,NULL,NULL,NULL),(29107,1,16670,NULL,NULL,NULL),(29108,1,10955,NULL,NULL,NULL),(29109,1,15527,NULL,NULL,NULL),(29110,1,2949,NULL,NULL,NULL),(29111,1,14414,NULL,NULL,NULL),(29112,1,36782,NULL,NULL,NULL),(29113,1,942,NULL,NULL,NULL),(29114,1,34154,NULL,NULL,NULL),(29115,1,34362,NULL,NULL,NULL),(29116,1,16288,NULL,NULL,NULL),(29117,1,15731,NULL,NULL,NULL),(29118,1,14953,NULL,NULL,NULL),(29119,1,14290,NULL,NULL,NULL),(29120,1,34145,NULL,NULL,NULL),(29121,1,13930,NULL,NULL,NULL),(29122,1,14379,NULL,NULL,NULL),(29123,1,32082,NULL,NULL,NULL),(29124,1,36876,NULL,NULL,NULL),(29125,1,17151,NULL,NULL,NULL),(29126,1,35891,NULL,NULL,NULL),(29127,1,13963,NULL,NULL,NULL),(29128,1,903,NULL,NULL,NULL),(29129,1,28721,NULL,NULL,NULL),(29130,1,1076,NULL,NULL,NULL),(29131,1,16184,NULL,NULL,NULL),(29132,1,16295,NULL,NULL,NULL),(29133,1,34331,NULL,NULL,NULL),(29134,1,35774,NULL,NULL,NULL),(29135,1,829,NULL,NULL,NULL),(29136,1,10322,NULL,NULL,NULL),(29137,1,14397,NULL,NULL,NULL),(29138,1,36785,NULL,NULL,NULL),(29139,1,36477,NULL,NULL,NULL),(29140,1,36478,NULL,NULL,NULL),(29141,1,36479,NULL,NULL,NULL),(29142,1,3416,NULL,NULL,NULL),(29143,1,36480,NULL,NULL,NULL),(29144,1,36481,NULL,NULL,NULL),(29145,1,36482,NULL,NULL,NULL),(29146,1,36483,NULL,NULL,NULL),(29147,1,36484,NULL,NULL,NULL),(29148,1,36485,NULL,NULL,NULL),(29149,1,36486,NULL,NULL,NULL),(29150,1,36487,NULL,NULL,NULL),(29151,1,36488,NULL,NULL,NULL),(29152,1,36489,NULL,NULL,NULL),(29153,1,36490,NULL,NULL,NULL),(29154,1,36491,NULL,NULL,NULL),(29155,1,36492,NULL,NULL,NULL),(29156,1,36493,NULL,NULL,NULL),(29157,1,36494,NULL,NULL,NULL),(29158,1,36495,NULL,NULL,NULL),(29159,1,3417,NULL,NULL,NULL),(29160,1,36496,NULL,NULL,NULL),(29161,1,36497,NULL,NULL,NULL),(29162,1,36498,NULL,NULL,NULL),(29163,1,36499,NULL,NULL,NULL),(29164,1,3418,NULL,NULL,NULL),(29165,1,36500,NULL,NULL,NULL),(29166,1,36501,NULL,NULL,NULL),(29167,1,902,NULL,NULL,NULL),(29168,1,952,NULL,NULL,NULL),(29169,1,36502,NULL,NULL,NULL),(29170,1,3419,NULL,NULL,NULL),(29171,1,3420,NULL,NULL,NULL),(29172,1,36503,NULL,NULL,NULL),(29173,1,36504,NULL,NULL,NULL),(29174,1,36505,NULL,NULL,NULL),(29175,1,36506,NULL,NULL,NULL),(29176,1,36507,NULL,NULL,NULL),(29177,1,36508,NULL,NULL,NULL),(29178,1,36509,NULL,NULL,NULL),(29179,1,485,NULL,NULL,NULL),(29180,1,36510,NULL,NULL,NULL),(29181,1,501,NULL,NULL,NULL),(29182,1,36511,NULL,NULL,NULL),(29183,1,36512,NULL,NULL,NULL),(29184,1,36513,NULL,NULL,NULL),(29185,1,36514,NULL,NULL,NULL),(29186,1,2657,NULL,NULL,NULL),(29187,1,3421,NULL,NULL,NULL),(29188,1,36515,NULL,NULL,NULL),(29189,1,36516,NULL,NULL,NULL),(29190,1,36517,NULL,NULL,NULL),(29191,1,36518,NULL,NULL,NULL),(29192,1,36519,NULL,NULL,NULL),(29193,1,3422,NULL,NULL,NULL),(29194,1,36520,NULL,NULL,NULL),(29195,1,36521,NULL,NULL,NULL),(29196,1,36522,NULL,NULL,NULL),(29197,1,36523,NULL,NULL,NULL),(29198,1,36524,NULL,NULL,NULL),(29199,1,36525,NULL,NULL,NULL),(29200,1,36526,NULL,NULL,NULL),(29201,1,36527,NULL,NULL,NULL),(29202,1,36528,NULL,NULL,NULL),(29203,1,36529,NULL,NULL,NULL),(29204,1,36530,NULL,NULL,NULL),(29205,1,36531,NULL,NULL,NULL),(29206,1,36532,NULL,NULL,NULL),(29207,1,36533,NULL,NULL,NULL),(29208,1,36534,NULL,NULL,NULL),(29209,1,36535,NULL,NULL,NULL),(29210,1,36536,NULL,NULL,NULL),(29211,1,36537,NULL,NULL,NULL),(29212,1,36538,NULL,NULL,NULL),(29213,1,36539,NULL,NULL,NULL),(29214,1,36540,NULL,NULL,NULL),(29215,1,36541,NULL,NULL,NULL),(29216,1,36542,NULL,NULL,NULL),(29217,1,36543,NULL,NULL,NULL),(29218,1,36544,NULL,NULL,NULL),(29219,1,36781,NULL,NULL,NULL),(29220,1,3423,NULL,NULL,NULL),(29221,1,3475,NULL,NULL,NULL),(29222,1,36545,NULL,NULL,NULL),(29223,1,36546,NULL,NULL,NULL),(29224,1,36547,NULL,NULL,NULL),(29225,1,36548,NULL,NULL,NULL),(29226,1,36549,NULL,NULL,NULL),(29227,1,36550,NULL,NULL,NULL),(29228,1,3424,NULL,NULL,NULL),(29229,1,36551,NULL,NULL,NULL),(29230,1,36552,NULL,NULL,NULL),(29231,1,36553,NULL,NULL,NULL),(29232,1,36554,NULL,NULL,NULL),(29233,1,3425,NULL,NULL,NULL),(29234,1,36555,NULL,NULL,NULL),(29235,1,36556,NULL,NULL,NULL),(29236,1,36557,NULL,NULL,NULL),(29237,1,36558,NULL,NULL,NULL),(29238,1,36559,NULL,NULL,NULL),(29239,1,36560,NULL,NULL,NULL),(29240,1,36561,NULL,NULL,NULL),(29241,1,36562,NULL,NULL,NULL),(29242,1,36563,NULL,NULL,NULL),(29243,1,36564,NULL,NULL,NULL),(29244,1,36565,NULL,NULL,NULL),(29245,1,3426,NULL,NULL,NULL),(29246,1,36566,NULL,NULL,NULL),(29247,1,3427,NULL,NULL,NULL),(29248,1,36567,NULL,NULL,NULL),(29249,1,36568,NULL,NULL,NULL),(29250,1,36569,NULL,NULL,NULL),(29251,1,36570,NULL,NULL,NULL),(29252,1,36571,NULL,NULL,NULL),(29253,1,3428,NULL,NULL,NULL),(29254,1,36572,NULL,NULL,NULL),(29255,1,36573,NULL,NULL,NULL),(29256,1,36574,NULL,NULL,NULL),(29257,1,3429,NULL,NULL,NULL),(29258,1,3430,NULL,NULL,NULL),(29259,1,36575,NULL,NULL,NULL),(29260,1,1075,NULL,NULL,NULL),(29261,1,36576,NULL,NULL,NULL),(29262,1,36577,NULL,NULL,NULL),(29263,1,3431,NULL,NULL,NULL),(29264,1,36578,NULL,NULL,NULL),(29265,1,36579,NULL,NULL,NULL),(29266,1,36580,NULL,NULL,NULL),(29267,1,36581,NULL,NULL,NULL),(29268,1,10428,NULL,NULL,NULL),(29269,1,36582,NULL,NULL,NULL),(29270,1,36583,NULL,NULL,NULL),(29271,1,36584,NULL,NULL,NULL),(29272,1,36585,NULL,NULL,NULL),(29273,1,36586,NULL,NULL,NULL),(29274,1,36587,NULL,NULL,NULL),(29275,1,36588,NULL,NULL,NULL),(29276,1,36589,NULL,NULL,NULL),(29277,1,36590,NULL,NULL,NULL),(29278,1,36591,NULL,NULL,NULL),(29279,1,36592,NULL,NULL,NULL),(29280,1,3432,NULL,NULL,NULL),(29281,1,36593,NULL,NULL,NULL),(29282,1,36594,NULL,NULL,NULL),(29283,1,36595,NULL,NULL,NULL),(29284,1,36596,NULL,NULL,NULL),(29285,1,36597,NULL,NULL,NULL),(29286,1,36598,NULL,NULL,NULL),(29287,1,3433,NULL,NULL,NULL),(29288,1,36599,NULL,NULL,NULL),(29289,1,36600,NULL,NULL,NULL),(29290,1,36601,NULL,NULL,NULL),(29291,1,36602,NULL,NULL,NULL),(29292,1,3434,NULL,NULL,NULL),(29293,1,36603,NULL,NULL,NULL),(29294,1,36604,NULL,NULL,NULL),(29295,1,36605,NULL,NULL,NULL),(29296,1,36606,NULL,NULL,NULL),(29297,1,36607,NULL,NULL,NULL),(29298,1,36608,NULL,NULL,NULL),(29299,1,36609,NULL,NULL,NULL),(29300,1,36610,NULL,NULL,NULL),(29301,1,36611,NULL,NULL,NULL),(29302,1,36612,NULL,NULL,NULL),(29303,1,36613,NULL,NULL,NULL),(29304,1,36614,NULL,NULL,NULL),(29305,1,36615,NULL,NULL,NULL),(29306,1,36616,NULL,NULL,NULL),(29307,1,36617,NULL,NULL,NULL),(29308,1,36618,NULL,NULL,NULL),(29309,1,36619,NULL,NULL,NULL),(29310,1,36620,NULL,NULL,NULL),(29311,1,36621,NULL,NULL,NULL),(29312,1,36622,NULL,NULL,NULL),(29313,1,36623,NULL,NULL,NULL),(29314,1,3435,NULL,NULL,NULL),(29315,1,36624,NULL,NULL,NULL),(29316,1,3436,NULL,NULL,NULL),(29317,1,36625,NULL,NULL,NULL),(29318,1,36626,NULL,NULL,NULL),(29319,1,3437,NULL,NULL,NULL),(29320,1,3438,NULL,NULL,NULL),(29321,1,36627,NULL,NULL,NULL),(29322,1,36628,NULL,NULL,NULL),(29323,1,36629,NULL,NULL,NULL),(29324,1,3439,NULL,NULL,NULL),(29325,1,36630,NULL,NULL,NULL),(29326,1,36631,NULL,NULL,NULL),(29327,1,36632,NULL,NULL,NULL),(29328,1,36633,NULL,NULL,NULL),(29329,1,36634,NULL,NULL,NULL),(29330,1,36635,NULL,NULL,NULL),(29331,1,36636,NULL,NULL,NULL),(29332,1,3440,NULL,NULL,NULL),(29333,1,36637,NULL,NULL,NULL),(29334,1,36638,NULL,NULL,NULL),(29335,1,36639,NULL,NULL,NULL),(29336,1,36640,NULL,NULL,NULL),(29337,1,36641,NULL,NULL,NULL),(29338,1,36642,NULL,NULL,NULL),(29339,1,36643,NULL,NULL,NULL),(29340,1,36644,NULL,NULL,NULL),(29341,1,36645,NULL,NULL,NULL),(29342,1,36646,NULL,NULL,NULL),(29343,1,36647,NULL,NULL,NULL),(29344,1,36648,NULL,NULL,NULL),(29345,1,3441,NULL,NULL,NULL),(29346,1,36649,NULL,NULL,NULL),(29347,1,36650,NULL,NULL,NULL),(29348,1,3442,NULL,NULL,NULL),(29349,1,35807,NULL,NULL,NULL),(29350,1,36651,NULL,NULL,NULL),(29351,1,36652,NULL,NULL,NULL),(29352,1,36653,NULL,NULL,NULL),(29353,1,36654,NULL,NULL,NULL),(29354,1,36655,NULL,NULL,NULL),(29355,1,36656,NULL,NULL,NULL),(29356,1,16206,NULL,NULL,NULL),(29357,1,36657,NULL,NULL,NULL),(29358,1,36658,NULL,NULL,NULL),(29359,1,32073,NULL,NULL,NULL),(29360,1,10533,NULL,NULL,NULL),(29361,1,36659,NULL,NULL,NULL),(29362,1,36660,NULL,NULL,NULL),(29363,1,36661,NULL,NULL,NULL),(29364,1,473,NULL,NULL,NULL),(29365,1,36662,NULL,NULL,NULL),(29366,1,36663,NULL,NULL,NULL),(29367,1,36664,NULL,NULL,NULL),(29368,1,36665,NULL,NULL,NULL),(29369,1,36666,NULL,NULL,NULL),(29370,1,3443,NULL,NULL,NULL),(29371,1,36667,NULL,NULL,NULL),(29372,1,36668,NULL,NULL,NULL),(29373,1,36669,NULL,NULL,NULL),(29374,1,3444,NULL,NULL,NULL),(29375,1,36670,NULL,NULL,NULL),(29376,1,36671,NULL,NULL,NULL),(29377,1,36672,NULL,NULL,NULL),(29378,1,36673,NULL,NULL,NULL),(29379,1,36674,NULL,NULL,NULL),(29380,1,36675,NULL,NULL,NULL),(29381,1,36676,NULL,NULL,NULL),(29382,1,36677,NULL,NULL,NULL),(29383,1,36678,NULL,NULL,NULL),(29384,1,36679,NULL,NULL,NULL),(29385,1,16475,NULL,NULL,NULL),(29386,1,36680,NULL,NULL,NULL),(29387,1,36681,NULL,NULL,NULL),(29388,1,36682,NULL,NULL,NULL),(29389,1,36683,NULL,NULL,NULL),(29390,1,36684,NULL,NULL,NULL),(29391,1,36685,NULL,NULL,NULL),(29392,1,36686,NULL,NULL,NULL),(29393,1,36687,NULL,NULL,NULL),(29394,1,36688,NULL,NULL,NULL),(29395,1,36689,NULL,NULL,NULL),(29396,1,32018,NULL,NULL,NULL),(29397,1,36690,NULL,NULL,NULL),(29398,1,36691,NULL,NULL,NULL),(29399,1,36692,NULL,NULL,NULL),(29400,1,36693,NULL,NULL,NULL),(29401,1,4609,NULL,NULL,NULL),(29402,1,36694,NULL,NULL,NULL),(29403,1,36695,NULL,NULL,NULL),(29404,1,36696,NULL,NULL,NULL),(29405,1,36697,NULL,NULL,NULL),(29406,1,36698,NULL,NULL,NULL),(29407,1,36699,NULL,NULL,NULL),(29408,1,3445,NULL,NULL,NULL),(29409,1,36700,NULL,NULL,NULL),(29410,1,3446,NULL,NULL,NULL),(29411,1,36701,NULL,NULL,NULL),(29412,1,32047,NULL,NULL,NULL),(29413,1,36702,NULL,NULL,NULL),(29414,1,36703,NULL,NULL,NULL),(29415,1,28719,NULL,NULL,NULL),(29416,1,36464,NULL,NULL,NULL),(29417,1,36704,NULL,NULL,NULL),(29418,1,36705,NULL,NULL,NULL),(29419,1,36706,NULL,NULL,NULL),(29420,1,36707,NULL,NULL,NULL),(29421,1,36708,NULL,NULL,NULL),(29422,1,36709,NULL,NULL,NULL),(29423,1,3447,NULL,NULL,NULL),(29424,1,36476,NULL,NULL,NULL),(29425,1,4610,NULL,NULL,NULL),(29426,1,36710,NULL,NULL,NULL),(29427,1,36711,NULL,NULL,NULL),(29428,1,36712,NULL,NULL,NULL),(29429,1,36713,NULL,NULL,NULL),(29430,1,36714,NULL,NULL,NULL),(29431,1,36715,NULL,NULL,NULL),(29432,1,36716,NULL,NULL,NULL),(29433,1,36717,NULL,NULL,NULL),(29434,1,3448,NULL,NULL,NULL),(29435,1,36465,NULL,NULL,NULL),(29436,1,36718,NULL,NULL,NULL),(29437,1,4611,NULL,NULL,NULL),(29438,1,36719,NULL,NULL,NULL),(29439,1,36720,NULL,NULL,NULL),(29440,1,36721,NULL,NULL,NULL),(29441,1,36466,NULL,NULL,NULL),(29442,1,36722,NULL,NULL,NULL),(29443,1,36467,NULL,NULL,NULL),(29444,1,36723,NULL,NULL,NULL),(29445,1,36724,NULL,NULL,NULL),(29446,1,36725,NULL,NULL,NULL),(29447,1,4612,NULL,NULL,NULL),(29448,1,36726,NULL,NULL,NULL),(29449,1,36468,NULL,NULL,NULL),(29450,1,36727,NULL,NULL,NULL),(29451,1,36728,NULL,NULL,NULL),(29452,1,36729,NULL,NULL,NULL),(29453,1,36730,NULL,NULL,NULL),(29454,1,36731,NULL,NULL,NULL),(29455,1,36732,NULL,NULL,NULL),(29456,1,36733,NULL,NULL,NULL),(29457,1,36734,NULL,NULL,NULL),(29458,1,36735,NULL,NULL,NULL),(29459,1,36469,NULL,NULL,NULL),(29460,1,3415,NULL,NULL,NULL),(29461,1,35614,NULL,NULL,NULL),(29462,1,31999,NULL,NULL,NULL),(29463,1,36736,NULL,NULL,NULL),(29464,1,36737,NULL,NULL,NULL),(29465,1,3449,NULL,NULL,NULL),(29466,1,14073,NULL,NULL,NULL),(29467,1,36470,NULL,NULL,NULL),(29468,1,36738,NULL,NULL,NULL),(29469,1,36471,NULL,NULL,NULL),(29470,1,36472,NULL,NULL,NULL),(29471,1,36473,NULL,NULL,NULL),(29472,1,36474,NULL,NULL,NULL),(29473,1,36739,NULL,NULL,NULL),(29474,1,36740,NULL,NULL,NULL),(29475,1,3450,NULL,NULL,NULL),(29476,1,36741,NULL,NULL,NULL),(29477,1,36742,NULL,NULL,NULL),(29478,1,3451,NULL,NULL,NULL),(29479,1,36743,NULL,NULL,NULL),(29480,1,36475,NULL,NULL,NULL),(29481,1,36744,NULL,NULL,NULL),(29482,1,36745,NULL,NULL,NULL),(29483,1,36746,NULL,NULL,NULL),(29484,1,36747,NULL,NULL,NULL),(29485,1,36748,NULL,NULL,NULL),(29486,1,36749,NULL,NULL,NULL),(29487,1,36750,NULL,NULL,NULL),(29488,1,36751,NULL,NULL,NULL),(29489,1,36752,NULL,NULL,NULL),(29490,1,36753,NULL,NULL,NULL),(29491,1,36754,NULL,NULL,NULL),(29492,1,36755,NULL,NULL,NULL),(29493,1,36756,NULL,NULL,NULL),(29494,1,36757,NULL,NULL,NULL),(29495,1,36758,NULL,NULL,NULL),(29496,1,36759,NULL,NULL,NULL),(29497,1,36760,NULL,NULL,NULL),(29498,1,36761,NULL,NULL,NULL),(29499,1,36762,NULL,NULL,NULL),(29500,1,28720,NULL,NULL,NULL),(29501,1,36763,NULL,NULL,NULL),(29502,1,36764,NULL,NULL,NULL),(29503,1,36765,NULL,NULL,NULL),(29504,1,36766,NULL,NULL,NULL),(29505,1,36767,NULL,NULL,NULL),(29506,1,36768,NULL,NULL,NULL),(29507,1,36769,NULL,NULL,NULL),(29508,1,36770,NULL,NULL,NULL),(29509,1,36771,NULL,NULL,NULL),(29510,1,36772,NULL,NULL,NULL),(29511,1,36773,NULL,NULL,NULL),(29512,1,36774,NULL,NULL,NULL),(29513,1,36775,NULL,NULL,NULL),(29514,1,36776,NULL,NULL,NULL),(29515,1,36777,NULL,NULL,NULL),(29516,1,36778,NULL,NULL,NULL),(29517,1,36779,NULL,NULL,NULL),(29518,1,36780,NULL,NULL,NULL),(29924,3,31478,NULL,NULL,NULL),(29925,3,6352,NULL,NULL,NULL),(29926,3,33141,NULL,NULL,NULL),(29927,3,10415,NULL,NULL,NULL),(29928,3,16306,NULL,NULL,NULL),(29929,3,994,NULL,NULL,NULL),(29930,3,6792,NULL,NULL,NULL),(29931,3,33390,NULL,NULL,NULL),(29932,3,11165,NULL,NULL,NULL),(29933,3,13984,NULL,NULL,NULL),(29934,3,28888,NULL,NULL,NULL),(29935,3,34043,NULL,NULL,NULL),(29936,3,734,NULL,NULL,NULL),(29937,3,35914,NULL,NULL,NULL),(29938,3,4102,NULL,NULL,NULL),(29939,3,33712,NULL,NULL,NULL),(29940,3,16671,NULL,NULL,NULL),(29941,3,20188,NULL,NULL,NULL),(29942,3,10342,NULL,NULL,NULL),(29943,3,17269,NULL,NULL,NULL),(29944,3,16118,NULL,NULL,NULL),(29945,3,3961,NULL,NULL,NULL),(29946,3,530,NULL,NULL,NULL),(29947,3,1753,NULL,NULL,NULL),(29948,3,3543,NULL,NULL,NULL),(29949,3,3718,NULL,NULL,NULL),(29950,3,36830,NULL,NULL,NULL),(29951,3,15596,NULL,NULL,NULL),(29952,3,585,NULL,NULL,NULL),(29953,3,13837,NULL,NULL,NULL),(29954,3,17920,NULL,NULL,NULL),(29955,3,16494,NULL,NULL,NULL),(29956,3,32197,NULL,NULL,NULL),(29957,3,34363,NULL,NULL,NULL),(29958,3,14199,NULL,NULL,NULL),(29959,3,33306,NULL,NULL,NULL),(29960,3,36838,NULL,NULL,NULL),(29961,3,3690,NULL,NULL,NULL),(29962,3,35680,NULL,NULL,NULL),(29963,3,11209,NULL,NULL,NULL),(29964,3,17167,NULL,NULL,NULL),(29965,3,1,NULL,NULL,NULL),(29966,3,33575,NULL,NULL,NULL),(29967,3,16287,NULL,NULL,NULL),(29968,3,13917,NULL,NULL,NULL),(29969,3,33381,NULL,NULL,NULL),(29970,3,16212,NULL,NULL,NULL),(29971,3,454,NULL,NULL,NULL),(29972,3,35649,NULL,NULL,NULL),(29973,3,15054,NULL,NULL,NULL),(29974,3,10310,NULL,NULL,NULL),(29975,3,32097,NULL,NULL,NULL),(29976,3,15862,NULL,NULL,NULL),(29977,3,15766,NULL,NULL,NULL),(29978,3,10813,NULL,NULL,NULL),(29979,3,14026,NULL,NULL,NULL),(29980,3,2917,NULL,NULL,NULL),(29981,3,16597,NULL,NULL,NULL),(29982,3,35554,NULL,NULL,NULL),(29983,3,1059,NULL,NULL,NULL),(29984,3,15863,NULL,NULL,NULL),(29985,3,14974,NULL,NULL,NULL),(29986,3,32181,NULL,NULL,NULL),(29987,3,10396,NULL,NULL,NULL),(29988,3,16616,NULL,NULL,NULL),(29989,3,3537,NULL,NULL,NULL),(29990,3,3528,NULL,NULL,NULL),(29991,3,3019,NULL,NULL,NULL),(29992,3,3452,NULL,NULL,NULL),(29993,3,32079,NULL,NULL,NULL),(29994,3,6545,NULL,NULL,NULL),(29995,3,10297,NULL,NULL,NULL),(29996,3,3939,NULL,NULL,NULL),(29997,3,6225,NULL,NULL,NULL),(29998,3,479,NULL,NULL,NULL),(29999,3,10854,NULL,NULL,NULL),(30000,3,4578,NULL,NULL,NULL),(30001,3,584,NULL,NULL,NULL),(30002,3,32180,NULL,NULL,NULL),(30003,3,33681,NULL,NULL,NULL),(30004,3,31993,NULL,NULL,NULL),(30005,3,6677,NULL,NULL,NULL),(30006,3,33058,NULL,NULL,NULL),(30007,3,4580,NULL,NULL,NULL),(30008,3,14365,NULL,NULL,NULL),(30009,3,34349,NULL,NULL,NULL),(30010,3,35837,NULL,NULL,NULL),(30011,3,2939,NULL,NULL,NULL),(30012,3,16282,NULL,NULL,NULL),(30013,3,36881,NULL,NULL,NULL),(30014,3,15583,NULL,NULL,NULL),(30015,3,36885,NULL,NULL,NULL),(30016,3,16290,NULL,NULL,NULL),(30017,3,15592,NULL,NULL,NULL),(30018,3,14970,NULL,NULL,NULL),(30019,3,1712,NULL,NULL,NULL),(30020,3,33708,NULL,NULL,NULL),(30021,3,3938,NULL,NULL,NULL),(30022,3,33676,NULL,NULL,NULL),(30023,3,6550,NULL,NULL,NULL),(30024,3,565,NULL,NULL,NULL),(30025,3,6719,NULL,NULL,NULL),(30026,3,10424,NULL,NULL,NULL),(30027,3,9887,NULL,NULL,NULL),(30028,3,33438,NULL,NULL,NULL),(30029,3,10408,NULL,NULL,NULL),(30030,3,28513,NULL,NULL,NULL),(30031,3,15504,NULL,NULL,NULL),(30032,3,13940,NULL,NULL,NULL),(30033,3,11171,NULL,NULL,NULL),(30034,3,14,NULL,NULL,NULL),(30035,3,15780,NULL,NULL,NULL),(30036,3,3966,NULL,NULL,NULL),(30037,3,6752,NULL,NULL,NULL),(30038,3,2903,NULL,NULL,NULL),(30039,3,11166,NULL,NULL,NULL),(30040,3,15083,NULL,NULL,NULL),(30041,3,14416,NULL,NULL,NULL),(30042,3,6552,NULL,NULL,NULL),(30043,3,16124,NULL,NULL,NULL),(30044,3,553,NULL,NULL,NULL),(30045,3,981,NULL,NULL,NULL),(30046,3,474,NULL,NULL,NULL),(30047,3,16178,NULL,NULL,NULL),(30048,3,32074,NULL,NULL,NULL),(30049,3,35865,NULL,NULL,NULL),(30050,3,32107,NULL,NULL,NULL),(30051,3,16199,NULL,NULL,NULL),(30052,3,3953,NULL,NULL,NULL),(30053,3,32862,NULL,NULL,NULL),(30054,3,1152,NULL,NULL,NULL),(30055,3,15529,NULL,NULL,NULL),(30056,3,31296,NULL,NULL,NULL),(30057,3,3980,NULL,NULL,NULL),(30058,3,32838,NULL,NULL,NULL),(30059,3,15060,NULL,NULL,NULL),(30060,3,735,NULL,NULL,NULL),(30061,3,35916,NULL,NULL,NULL),(30062,3,36444,NULL,NULL,NULL),(30063,3,4162,NULL,NULL,NULL),(30064,3,33713,NULL,NULL,NULL),(30065,3,16935,NULL,NULL,NULL),(30066,3,16938,NULL,NULL,NULL),(30067,3,6740,NULL,NULL,NULL),(30068,3,1051,NULL,NULL,NULL),(30069,3,10534,NULL,NULL,NULL),(30070,3,6357,NULL,NULL,NULL),(30071,3,10913,NULL,NULL,NULL),(30072,3,16520,NULL,NULL,NULL),(30073,3,3948,NULL,NULL,NULL),(30074,3,17185,NULL,NULL,NULL),(30075,3,33677,NULL,NULL,NULL),(30076,3,10882,NULL,NULL,NULL),(30077,3,17332,NULL,NULL,NULL),(30078,3,16120,NULL,NULL,NULL),(30079,3,3963,NULL,NULL,NULL),(30080,3,550,NULL,NULL,NULL),(30081,3,3544,NULL,NULL,NULL),(30082,3,3545,NULL,NULL,NULL),(30083,3,10459,NULL,NULL,NULL),(30084,3,1080,NULL,NULL,NULL),(30085,3,10862,NULL,NULL,NULL),(30086,3,6260,NULL,NULL,NULL),(30087,3,10257,NULL,NULL,NULL),(30088,3,17246,NULL,NULL,NULL),(30089,3,15795,NULL,NULL,NULL),(30090,3,33707,NULL,NULL,NULL),(30091,3,36783,NULL,NULL,NULL),(30092,3,16445,NULL,NULL,NULL),(30093,3,20165,NULL,NULL,NULL),(30094,3,32411,NULL,NULL,NULL),(30095,3,32412,NULL,NULL,NULL),(30096,3,35049,NULL,NULL,NULL),(30097,3,35050,NULL,NULL,NULL),(30098,3,6256,NULL,NULL,NULL),(30099,3,2658,NULL,NULL,NULL),(30100,3,16294,NULL,NULL,NULL),(30101,3,17237,NULL,NULL,NULL),(30102,3,35566,NULL,NULL,NULL),(30103,3,32994,NULL,NULL,NULL),(30104,3,36790,NULL,NULL,NULL),(30105,3,6743,NULL,NULL,NULL),(30106,3,17178,NULL,NULL,NULL),(30107,3,36866,NULL,NULL,NULL),(30108,3,3944,NULL,NULL,NULL),(30109,3,16667,NULL,NULL,NULL),(30110,3,36870,NULL,NULL,NULL),(30111,3,14378,NULL,NULL,NULL),(30112,3,16476,NULL,NULL,NULL),(30113,3,35836,NULL,NULL,NULL),(30114,3,10288,NULL,NULL,NULL),(30115,3,35565,NULL,NULL,NULL),(30116,3,16123,NULL,NULL,NULL),(30117,3,15794,NULL,NULL,NULL),(30118,3,14329,NULL,NULL,NULL),(30119,3,31579,NULL,NULL,NULL),(30120,3,31635,NULL,NULL,NULL),(30121,3,31627,NULL,NULL,NULL),(30122,3,31580,NULL,NULL,NULL),(30123,3,31581,NULL,NULL,NULL),(30124,3,31982,NULL,NULL,NULL),(30125,3,31582,NULL,NULL,NULL),(30126,3,31636,NULL,NULL,NULL),(30127,3,31583,NULL,NULL,NULL),(30128,3,36839,NULL,NULL,NULL),(30129,3,36840,NULL,NULL,NULL),(30130,3,16670,NULL,NULL,NULL),(30131,3,10955,NULL,NULL,NULL),(30132,3,15527,NULL,NULL,NULL),(30133,3,2949,NULL,NULL,NULL),(30134,3,14414,NULL,NULL,NULL),(30135,3,36782,NULL,NULL,NULL),(30136,3,942,NULL,NULL,NULL),(30137,3,34154,NULL,NULL,NULL),(30138,3,34362,NULL,NULL,NULL),(30139,3,16288,NULL,NULL,NULL),(30140,3,15731,NULL,NULL,NULL),(30141,3,14953,NULL,NULL,NULL),(30142,3,14290,NULL,NULL,NULL),(30143,3,34145,NULL,NULL,NULL),(30144,3,13930,NULL,NULL,NULL),(30145,3,14379,NULL,NULL,NULL),(30146,3,32082,NULL,NULL,NULL),(30147,3,36876,NULL,NULL,NULL),(30148,3,17151,NULL,NULL,NULL),(30149,3,35891,NULL,NULL,NULL),(30150,3,13963,NULL,NULL,NULL),(30151,3,903,NULL,NULL,NULL),(30152,3,28721,NULL,NULL,NULL),(30153,3,1076,NULL,NULL,NULL),(30154,3,16184,NULL,NULL,NULL),(30155,3,16295,NULL,NULL,NULL),(30156,3,34331,NULL,NULL,NULL),(30157,3,35774,NULL,NULL,NULL),(30158,3,829,NULL,NULL,NULL),(30159,3,10322,NULL,NULL,NULL),(30160,3,14397,NULL,NULL,NULL),(30161,3,36785,NULL,NULL,NULL),(30162,3,36477,NULL,NULL,NULL),(30163,3,36478,NULL,NULL,NULL),(30164,3,36479,NULL,NULL,NULL),(30165,3,3416,NULL,NULL,NULL),(30166,3,36480,NULL,NULL,NULL),(30167,3,36481,NULL,NULL,NULL),(30168,3,36482,NULL,NULL,NULL),(30169,3,36483,NULL,NULL,NULL),(30170,3,36484,NULL,NULL,NULL),(30171,3,36485,NULL,NULL,NULL),(30172,3,36486,NULL,NULL,NULL),(30173,3,36487,NULL,NULL,NULL),(30174,3,36488,NULL,NULL,NULL),(30175,3,36489,NULL,NULL,NULL),(30176,3,36490,NULL,NULL,NULL),(30177,3,36491,NULL,NULL,NULL),(30178,3,36492,NULL,NULL,NULL),(30179,3,36493,NULL,NULL,NULL),(30180,3,36494,NULL,NULL,NULL),(30181,3,36495,NULL,NULL,NULL),(30182,3,3417,NULL,NULL,NULL),(30183,3,36496,NULL,NULL,NULL),(30184,3,36497,NULL,NULL,NULL),(30185,3,36498,NULL,NULL,NULL),(30186,3,36499,NULL,NULL,NULL),(30187,3,3418,NULL,NULL,NULL),(30188,3,36500,NULL,NULL,NULL),(30189,3,36501,NULL,NULL,NULL),(30190,3,902,NULL,NULL,NULL),(30191,3,952,NULL,NULL,NULL),(30192,3,36502,NULL,NULL,NULL),(30193,3,3419,NULL,NULL,NULL),(30194,3,3420,NULL,NULL,NULL),(30195,3,36503,NULL,NULL,NULL),(30196,3,36504,NULL,NULL,NULL),(30197,3,36505,NULL,NULL,NULL),(30198,3,36506,NULL,NULL,NULL),(30199,3,36507,NULL,NULL,NULL),(30200,3,36508,NULL,NULL,NULL),(30201,3,36509,NULL,NULL,NULL),(30202,3,485,NULL,NULL,NULL),(30203,3,36510,NULL,NULL,NULL),(30204,3,501,NULL,NULL,NULL),(30205,3,36511,NULL,NULL,NULL),(30206,3,36512,NULL,NULL,NULL),(30207,3,36513,NULL,NULL,NULL),(30208,3,36514,NULL,NULL,NULL),(30209,3,2657,NULL,NULL,NULL),(30210,3,3421,NULL,NULL,NULL),(30211,3,36515,NULL,NULL,NULL),(30212,3,36516,NULL,NULL,NULL),(30213,3,36517,NULL,NULL,NULL),(30214,3,36518,NULL,NULL,NULL),(30215,3,36519,NULL,NULL,NULL),(30216,3,3422,NULL,NULL,NULL),(30217,3,36520,NULL,NULL,NULL),(30218,3,36521,NULL,NULL,NULL),(30219,3,36522,NULL,NULL,NULL),(30220,3,36523,NULL,NULL,NULL),(30221,3,36524,NULL,NULL,NULL),(30222,3,36525,NULL,NULL,NULL),(30223,3,36526,NULL,NULL,NULL),(30224,3,36527,NULL,NULL,NULL),(30225,3,36528,NULL,NULL,NULL),(30226,3,36529,NULL,NULL,NULL),(30227,3,36530,NULL,NULL,NULL),(30228,3,36531,NULL,NULL,NULL),(30229,3,36532,NULL,NULL,NULL),(30230,3,36533,NULL,NULL,NULL),(30231,3,36534,NULL,NULL,NULL),(30232,3,36535,NULL,NULL,NULL),(30233,3,36536,NULL,NULL,NULL),(30234,3,36537,NULL,NULL,NULL),(30235,3,36538,NULL,NULL,NULL),(30236,3,36539,NULL,NULL,NULL),(30237,3,36540,NULL,NULL,NULL),(30238,3,36541,NULL,NULL,NULL),(30239,3,36542,NULL,NULL,NULL),(30240,3,36543,NULL,NULL,NULL),(30241,3,36544,NULL,NULL,NULL),(30242,3,36781,NULL,NULL,NULL),(30243,3,3423,NULL,NULL,NULL),(30244,3,3475,NULL,NULL,NULL),(30245,3,36545,NULL,NULL,NULL),(30246,3,36546,NULL,NULL,NULL),(30247,3,36547,NULL,NULL,NULL),(30248,3,36548,NULL,NULL,NULL),(30249,3,36549,NULL,NULL,NULL),(30250,3,36550,NULL,NULL,NULL),(30251,3,3424,NULL,NULL,NULL),(30252,3,36551,NULL,NULL,NULL),(30253,3,36552,NULL,NULL,NULL),(30254,3,36553,NULL,NULL,NULL),(30255,3,36554,NULL,NULL,NULL),(30256,3,3425,NULL,NULL,NULL),(30257,3,36555,NULL,NULL,NULL),(30258,3,36556,NULL,NULL,NULL),(30259,3,36557,NULL,NULL,NULL),(30260,3,36558,NULL,NULL,NULL),(30261,3,36559,NULL,NULL,NULL),(30262,3,36560,NULL,NULL,NULL),(30263,3,36561,NULL,NULL,NULL),(30264,3,36562,NULL,NULL,NULL),(30265,3,36563,NULL,NULL,NULL),(30266,3,36564,NULL,NULL,NULL),(30267,3,36565,NULL,NULL,NULL),(30268,3,3426,NULL,NULL,NULL),(30269,3,36566,NULL,NULL,NULL),(30270,3,3427,NULL,NULL,NULL),(30271,3,36567,NULL,NULL,NULL),(30272,3,36568,NULL,NULL,NULL),(30273,3,36569,NULL,NULL,NULL),(30274,3,36570,NULL,NULL,NULL),(30275,3,36571,NULL,NULL,NULL),(30276,3,3428,NULL,NULL,NULL),(30277,3,36572,NULL,NULL,NULL),(30278,3,36573,NULL,NULL,NULL),(30279,3,36574,NULL,NULL,NULL),(30280,3,3429,NULL,NULL,NULL),(30281,3,3430,NULL,NULL,NULL),(30282,3,36575,NULL,NULL,NULL),(30283,3,1075,NULL,NULL,NULL),(30284,3,36576,NULL,NULL,NULL),(30285,3,36577,NULL,NULL,NULL),(30286,3,3431,NULL,NULL,NULL),(30287,3,36578,NULL,NULL,NULL),(30288,3,36579,NULL,NULL,NULL),(30289,3,36580,NULL,NULL,NULL),(30290,3,36581,NULL,NULL,NULL),(30291,3,10428,NULL,NULL,NULL),(30292,3,36582,NULL,NULL,NULL),(30293,3,36583,NULL,NULL,NULL),(30294,3,36584,NULL,NULL,NULL),(30295,3,36585,NULL,NULL,NULL),(30296,3,36586,NULL,NULL,NULL),(30297,3,36587,NULL,NULL,NULL),(30298,3,36588,NULL,NULL,NULL),(30299,3,36589,NULL,NULL,NULL),(30300,3,36590,NULL,NULL,NULL),(30301,3,36591,NULL,NULL,NULL),(30302,3,36592,NULL,NULL,NULL),(30303,3,3432,NULL,NULL,NULL),(30304,3,36593,NULL,NULL,NULL),(30305,3,36594,NULL,NULL,NULL),(30306,3,36595,NULL,NULL,NULL),(30307,3,36596,NULL,NULL,NULL),(30308,3,36597,NULL,NULL,NULL),(30309,3,36598,NULL,NULL,NULL),(30310,3,3433,NULL,NULL,NULL),(30311,3,36599,NULL,NULL,NULL),(30312,3,36600,NULL,NULL,NULL),(30313,3,36601,NULL,NULL,NULL),(30314,3,36602,NULL,NULL,NULL),(30315,3,3434,NULL,NULL,NULL),(30316,3,36603,NULL,NULL,NULL),(30317,3,36604,NULL,NULL,NULL),(30318,3,36605,NULL,NULL,NULL),(30319,3,36606,NULL,NULL,NULL),(30320,3,36607,NULL,NULL,NULL),(30321,3,36608,NULL,NULL,NULL),(30322,3,36609,NULL,NULL,NULL),(30323,3,36610,NULL,NULL,NULL),(30324,3,36611,NULL,NULL,NULL),(30325,3,36612,NULL,NULL,NULL),(30326,3,36613,NULL,NULL,NULL),(30327,3,36614,NULL,NULL,NULL),(30328,3,36615,NULL,NULL,NULL),(30329,3,36616,NULL,NULL,NULL),(30330,3,36617,NULL,NULL,NULL),(30331,3,36618,NULL,NULL,NULL),(30332,3,36619,NULL,NULL,NULL),(30333,3,36620,NULL,NULL,NULL),(30334,3,36621,NULL,NULL,NULL),(30335,3,36622,NULL,NULL,NULL),(30336,3,36623,NULL,NULL,NULL),(30337,3,3435,NULL,NULL,NULL),(30338,3,36624,NULL,NULL,NULL),(30339,3,3436,NULL,NULL,NULL),(30340,3,36625,NULL,NULL,NULL),(30341,3,36626,NULL,NULL,NULL),(30342,3,3437,NULL,NULL,NULL),(30343,3,3438,NULL,NULL,NULL),(30344,3,36627,NULL,NULL,NULL),(30345,3,36628,NULL,NULL,NULL),(30346,3,36629,NULL,NULL,NULL),(30347,3,3439,NULL,NULL,NULL),(30348,3,36630,NULL,NULL,NULL),(30349,3,36631,NULL,NULL,NULL),(30350,3,36632,NULL,NULL,NULL),(30351,3,36633,NULL,NULL,NULL),(30352,3,36634,NULL,NULL,NULL),(30353,3,36635,NULL,NULL,NULL),(30354,3,36636,NULL,NULL,NULL),(30355,3,3440,NULL,NULL,NULL),(30356,3,36637,NULL,NULL,NULL),(30357,3,36638,NULL,NULL,NULL),(30358,3,36639,NULL,NULL,NULL),(30359,3,36640,NULL,NULL,NULL),(30360,3,36641,NULL,NULL,NULL),(30361,3,36642,NULL,NULL,NULL),(30362,3,36643,NULL,NULL,NULL),(30363,3,36644,NULL,NULL,NULL),(30364,3,36645,NULL,NULL,NULL),(30365,3,36646,NULL,NULL,NULL),(30366,3,36647,NULL,NULL,NULL),(30367,3,36648,NULL,NULL,NULL),(30368,3,3441,NULL,NULL,NULL),(30369,3,36649,NULL,NULL,NULL),(30370,3,36650,NULL,NULL,NULL),(30371,3,3442,NULL,NULL,NULL),(30372,3,35807,NULL,NULL,NULL),(30373,3,36651,NULL,NULL,NULL),(30374,3,36652,NULL,NULL,NULL),(30375,3,36653,NULL,NULL,NULL),(30376,3,36654,NULL,NULL,NULL),(30377,3,36655,NULL,NULL,NULL),(30378,3,36656,NULL,NULL,NULL),(30379,3,16206,NULL,NULL,NULL),(30380,3,36657,NULL,NULL,NULL),(30381,3,36658,NULL,NULL,NULL),(30382,3,32073,NULL,NULL,NULL),(30383,3,10533,NULL,NULL,NULL),(30384,3,36659,NULL,NULL,NULL),(30385,3,36660,NULL,NULL,NULL),(30386,3,36661,NULL,NULL,NULL),(30387,3,473,NULL,NULL,NULL),(30388,3,36662,NULL,NULL,NULL),(30389,3,36663,NULL,NULL,NULL),(30390,3,36664,NULL,NULL,NULL),(30391,3,36665,NULL,NULL,NULL),(30392,3,36666,NULL,NULL,NULL),(30393,3,3443,NULL,NULL,NULL),(30394,3,36667,NULL,NULL,NULL),(30395,3,36668,NULL,NULL,NULL),(30396,3,36669,NULL,NULL,NULL),(30397,3,3444,NULL,NULL,NULL),(30398,3,36670,NULL,NULL,NULL),(30399,3,36671,NULL,NULL,NULL),(30400,3,36672,NULL,NULL,NULL),(30401,3,36673,NULL,NULL,NULL),(30402,3,36674,NULL,NULL,NULL),(30403,3,36675,NULL,NULL,NULL),(30404,3,36676,NULL,NULL,NULL),(30405,3,36677,NULL,NULL,NULL),(30406,3,36678,NULL,NULL,NULL),(30407,3,36679,NULL,NULL,NULL),(30408,3,16475,NULL,NULL,NULL),(30409,3,36680,NULL,NULL,NULL),(30410,3,36681,NULL,NULL,NULL),(30411,3,36682,NULL,NULL,NULL),(30412,3,36683,NULL,NULL,NULL),(30413,3,36684,NULL,NULL,NULL),(30414,3,36685,NULL,NULL,NULL),(30415,3,36686,NULL,NULL,NULL),(30416,3,36687,NULL,NULL,NULL),(30417,3,36688,NULL,NULL,NULL),(30418,3,36689,NULL,NULL,NULL),(30419,3,32018,NULL,NULL,NULL),(30420,3,36690,NULL,NULL,NULL),(30421,3,36691,NULL,NULL,NULL),(30422,3,36692,NULL,NULL,NULL),(30423,3,36693,NULL,NULL,NULL),(30424,3,4609,NULL,NULL,NULL),(30425,3,36694,NULL,NULL,NULL),(30426,3,36695,NULL,NULL,NULL),(30427,3,36696,NULL,NULL,NULL),(30428,3,36697,NULL,NULL,NULL),(30429,3,36698,NULL,NULL,NULL),(30430,3,36699,NULL,NULL,NULL),(30431,3,3445,NULL,NULL,NULL),(30432,3,36700,NULL,NULL,NULL),(30433,3,3446,NULL,NULL,NULL),(30434,3,36701,NULL,NULL,NULL),(30435,3,32047,NULL,NULL,NULL),(30436,3,36702,NULL,NULL,NULL),(30437,3,36703,NULL,NULL,NULL),(30438,3,28719,NULL,NULL,NULL),(30439,3,36464,NULL,NULL,NULL),(30440,3,36704,NULL,NULL,NULL),(30441,3,36705,NULL,NULL,NULL),(30442,3,36706,NULL,NULL,NULL),(30443,3,36707,NULL,NULL,NULL),(30444,3,36708,NULL,NULL,NULL),(30445,3,36709,NULL,NULL,NULL),(30446,3,3447,NULL,NULL,NULL),(30447,3,36476,NULL,NULL,NULL),(30448,3,4610,NULL,NULL,NULL),(30449,3,36710,NULL,NULL,NULL),(30450,3,36711,NULL,NULL,NULL),(30451,3,36712,NULL,NULL,NULL),(30452,3,36713,NULL,NULL,NULL),(30453,3,36714,NULL,NULL,NULL),(30454,3,36715,NULL,NULL,NULL),(30455,3,36716,NULL,NULL,NULL),(30456,3,36717,NULL,NULL,NULL),(30457,3,3448,NULL,NULL,NULL),(30458,3,36465,NULL,NULL,NULL),(30459,3,36718,NULL,NULL,NULL),(30460,3,4611,NULL,NULL,NULL),(30461,3,36719,NULL,NULL,NULL),(30462,3,36720,NULL,NULL,NULL),(30463,3,36721,NULL,NULL,NULL),(30464,3,36466,NULL,NULL,NULL),(30465,3,36722,NULL,NULL,NULL),(30466,3,36467,NULL,NULL,NULL),(30467,3,36723,NULL,NULL,NULL),(30468,3,36724,NULL,NULL,NULL),(30469,3,36725,NULL,NULL,NULL),(30470,3,4612,NULL,NULL,NULL),(30471,3,36726,NULL,NULL,NULL),(30472,3,36468,NULL,NULL,NULL),(30473,3,36727,NULL,NULL,NULL),(30474,3,36728,NULL,NULL,NULL),(30475,3,36729,NULL,NULL,NULL),(30476,3,36730,NULL,NULL,NULL),(30477,3,36731,NULL,NULL,NULL),(30478,3,36732,NULL,NULL,NULL),(30479,3,36733,NULL,NULL,NULL),(30480,3,36734,NULL,NULL,NULL),(30481,3,36735,NULL,NULL,NULL),(30482,3,36469,NULL,NULL,NULL),(30483,3,3415,NULL,NULL,NULL),(30484,3,35614,NULL,NULL,NULL),(30485,3,31999,NULL,NULL,NULL),(30486,3,36736,NULL,NULL,NULL),(30487,3,36737,NULL,NULL,NULL),(30488,3,3449,NULL,NULL,NULL),(30489,3,14073,NULL,NULL,NULL),(30490,3,36470,NULL,NULL,NULL),(30491,3,36738,NULL,NULL,NULL),(30492,3,36471,NULL,NULL,NULL),(30493,3,36472,NULL,NULL,NULL),(30494,3,36473,NULL,NULL,NULL),(30495,3,36474,NULL,NULL,NULL),(30496,3,36739,NULL,NULL,NULL),(30497,3,36740,NULL,NULL,NULL),(30498,3,3450,NULL,NULL,NULL),(30499,3,36741,NULL,NULL,NULL),(30500,3,36742,NULL,NULL,NULL),(30501,3,3451,NULL,NULL,NULL),(30502,3,36743,NULL,NULL,NULL),(30503,3,36475,NULL,NULL,NULL),(30504,3,36744,NULL,NULL,NULL),(30505,3,36745,NULL,NULL,NULL),(30506,3,36746,NULL,NULL,NULL),(30507,3,36747,NULL,NULL,NULL),(30508,3,36748,NULL,NULL,NULL),(30509,3,36749,NULL,NULL,NULL),(30510,3,36750,NULL,NULL,NULL),(30511,3,36751,NULL,NULL,NULL),(30512,3,36752,NULL,NULL,NULL),(30513,3,36753,NULL,NULL,NULL),(30514,3,36754,NULL,NULL,NULL),(30515,3,36755,NULL,NULL,NULL),(30516,3,36756,NULL,NULL,NULL),(30517,3,36757,NULL,NULL,NULL),(30518,3,36758,NULL,NULL,NULL),(30519,3,36759,NULL,NULL,NULL),(30520,3,36760,NULL,NULL,NULL),(30521,3,36761,NULL,NULL,NULL),(30522,3,36762,NULL,NULL,NULL),(30523,3,28720,NULL,NULL,NULL),(30524,3,36763,NULL,NULL,NULL),(30525,3,36764,NULL,NULL,NULL),(30526,3,36765,NULL,NULL,NULL),(30527,3,36766,NULL,NULL,NULL),(30528,3,36767,NULL,NULL,NULL),(30529,3,36768,NULL,NULL,NULL),(30530,3,36769,NULL,NULL,NULL),(30531,3,36770,NULL,NULL,NULL),(30532,3,36771,NULL,NULL,NULL),(30533,3,36772,NULL,NULL,NULL),(30534,3,36773,NULL,NULL,NULL),(30535,3,36774,NULL,NULL,NULL),(30536,3,36775,NULL,NULL,NULL),(30537,3,36776,NULL,NULL,NULL),(30538,3,36777,NULL,NULL,NULL),(30539,3,36778,NULL,NULL,NULL),(30540,3,36779,NULL,NULL,NULL),(30541,3,36780,NULL,NULL,NULL),(30947,2,31478,NULL,NULL,NULL),(30948,2,6352,NULL,NULL,NULL),(30949,2,33141,NULL,NULL,NULL),(30950,2,10415,NULL,NULL,NULL),(30951,2,16306,NULL,NULL,NULL),(30952,2,994,NULL,NULL,NULL),(30953,2,6792,NULL,NULL,NULL),(30954,2,33390,NULL,NULL,NULL),(30955,2,11165,NULL,NULL,NULL),(30956,2,13984,NULL,NULL,NULL),(30957,2,28888,NULL,NULL,NULL),(30958,2,34043,NULL,NULL,NULL),(30959,2,734,NULL,NULL,NULL),(30960,2,35914,NULL,NULL,NULL),(30961,2,4102,NULL,NULL,NULL),(30962,2,33712,NULL,NULL,NULL),(30963,2,16671,NULL,NULL,NULL),(30964,2,20188,NULL,NULL,NULL),(30965,2,10342,NULL,NULL,NULL),(30966,2,17269,NULL,NULL,NULL),(30967,2,16118,NULL,NULL,NULL),(30968,2,3961,NULL,NULL,NULL),(30969,2,530,NULL,NULL,NULL),(30970,2,1753,NULL,NULL,NULL),(30971,2,3543,NULL,NULL,NULL),(30972,2,3718,NULL,NULL,NULL),(30973,2,36830,NULL,NULL,NULL),(30974,2,15596,NULL,NULL,NULL),(30975,2,585,NULL,NULL,NULL),(30976,2,13837,NULL,NULL,NULL),(30977,2,17920,NULL,NULL,NULL),(30978,2,16494,NULL,NULL,NULL),(30979,2,32197,NULL,NULL,NULL),(30980,2,34363,NULL,NULL,NULL),(30981,2,14199,NULL,NULL,NULL),(30982,2,33306,NULL,NULL,NULL),(30983,2,36838,NULL,NULL,NULL),(30984,2,3690,NULL,NULL,NULL),(30985,2,35680,NULL,NULL,NULL),(30986,2,11209,NULL,NULL,NULL),(30987,2,17167,NULL,NULL,NULL),(30988,2,1,NULL,NULL,NULL),(30989,2,33575,NULL,NULL,NULL),(30990,2,16287,NULL,NULL,NULL),(30991,2,13917,NULL,NULL,NULL),(30992,2,33381,NULL,NULL,NULL),(30993,2,16212,NULL,NULL,NULL),(30994,2,454,NULL,NULL,NULL),(30995,2,35649,NULL,NULL,NULL),(30996,2,15054,NULL,NULL,NULL),(30997,2,10310,NULL,NULL,NULL),(30998,2,32097,NULL,NULL,NULL),(30999,2,15862,NULL,NULL,NULL),(31000,2,15766,NULL,NULL,NULL),(31001,2,10813,NULL,NULL,NULL),(31002,2,14026,NULL,NULL,NULL),(31003,2,2917,NULL,NULL,NULL),(31004,2,16597,NULL,NULL,NULL),(31005,2,35554,NULL,NULL,NULL),(31006,2,1059,NULL,NULL,NULL),(31007,2,15863,NULL,NULL,NULL),(31008,2,14974,NULL,NULL,NULL),(31009,2,32181,NULL,NULL,NULL),(31010,2,10396,NULL,NULL,NULL),(31011,2,16616,NULL,NULL,NULL),(31012,2,3537,NULL,NULL,NULL),(31013,2,3528,NULL,NULL,NULL),(31014,2,3019,NULL,NULL,NULL),(31015,2,3452,NULL,NULL,NULL),(31016,2,32079,NULL,NULL,NULL),(31017,2,6545,NULL,NULL,NULL),(31018,2,10297,NULL,NULL,NULL),(31019,2,3939,NULL,NULL,NULL),(31020,2,6225,NULL,NULL,NULL),(31021,2,479,NULL,NULL,NULL),(31022,2,10854,NULL,NULL,NULL),(31023,2,4578,NULL,NULL,NULL),(31024,2,584,NULL,NULL,NULL),(31025,2,32180,NULL,NULL,NULL),(31026,2,33681,NULL,NULL,NULL),(31027,2,31993,NULL,NULL,NULL),(31028,2,6677,NULL,NULL,NULL),(31029,2,33058,NULL,NULL,NULL),(31030,2,4580,NULL,NULL,NULL),(31031,2,14365,NULL,NULL,NULL),(31032,2,34349,NULL,NULL,NULL),(31033,2,35837,NULL,NULL,NULL),(31034,2,2939,NULL,NULL,NULL),(31035,2,16282,NULL,NULL,NULL),(31036,2,36881,NULL,NULL,NULL),(31037,2,15583,NULL,NULL,NULL),(31038,2,36885,NULL,NULL,NULL),(31039,2,16290,NULL,NULL,NULL),(31040,2,15592,NULL,NULL,NULL),(31041,2,14970,NULL,NULL,NULL),(31042,2,1712,NULL,NULL,NULL),(31043,2,33708,NULL,NULL,NULL),(31044,2,3938,NULL,NULL,NULL),(31045,2,33676,NULL,NULL,NULL),(31046,2,6550,NULL,NULL,NULL),(31047,2,565,NULL,NULL,NULL),(31048,2,6719,NULL,NULL,NULL),(31049,2,10424,NULL,NULL,NULL),(31050,2,9887,NULL,NULL,NULL),(31051,2,33438,NULL,NULL,NULL),(31052,2,10408,NULL,NULL,NULL),(31053,2,28513,NULL,NULL,NULL),(31054,2,15504,NULL,NULL,NULL),(31055,2,13940,NULL,NULL,NULL),(31056,2,11171,NULL,NULL,NULL),(31057,2,14,NULL,NULL,NULL),(31058,2,15780,NULL,NULL,NULL),(31059,2,3966,NULL,NULL,NULL),(31060,2,6752,NULL,NULL,NULL),(31061,2,2903,NULL,NULL,NULL),(31062,2,11166,NULL,NULL,NULL),(31063,2,15083,NULL,NULL,NULL),(31064,2,14416,NULL,NULL,NULL),(31065,2,6552,NULL,NULL,NULL),(31066,2,16124,NULL,NULL,NULL),(31067,2,553,NULL,NULL,NULL),(31068,2,981,NULL,NULL,NULL),(31069,2,474,NULL,NULL,NULL),(31070,2,16178,NULL,NULL,NULL),(31071,2,32074,NULL,NULL,NULL),(31072,2,35865,NULL,NULL,NULL),(31073,2,32107,NULL,NULL,NULL),(31074,2,16199,NULL,NULL,NULL),(31075,2,3953,NULL,NULL,NULL),(31076,2,32862,NULL,NULL,NULL),(31077,2,1152,NULL,NULL,NULL),(31078,2,15529,NULL,NULL,NULL),(31079,2,31296,NULL,NULL,NULL),(31080,2,3980,NULL,NULL,NULL),(31081,2,32838,NULL,NULL,NULL),(31082,2,15060,NULL,NULL,NULL),(31083,2,735,NULL,NULL,NULL),(31084,2,35916,NULL,NULL,NULL),(31085,2,36444,NULL,NULL,NULL),(31086,2,4162,NULL,NULL,NULL),(31087,2,33713,NULL,NULL,NULL),(31088,2,16935,NULL,NULL,NULL),(31089,2,16938,NULL,NULL,NULL),(31090,2,6740,NULL,NULL,NULL),(31091,2,1051,NULL,NULL,NULL),(31092,2,10534,NULL,NULL,NULL),(31093,2,6357,NULL,NULL,NULL),(31094,2,10913,NULL,NULL,NULL),(31095,2,16520,NULL,NULL,NULL),(31096,2,3948,NULL,NULL,NULL),(31097,2,17185,NULL,NULL,NULL),(31098,2,33677,NULL,NULL,NULL),(31099,2,10882,NULL,NULL,NULL),(31100,2,17332,NULL,NULL,NULL),(31101,2,16120,NULL,NULL,NULL),(31102,2,3963,NULL,NULL,NULL),(31103,2,550,NULL,NULL,NULL),(31104,2,3544,NULL,NULL,NULL),(31105,2,3545,NULL,NULL,NULL),(31106,2,10459,NULL,NULL,NULL),(31107,2,1080,NULL,NULL,NULL),(31108,2,10862,NULL,NULL,NULL),(31109,2,6260,NULL,NULL,NULL),(31110,2,10257,NULL,NULL,NULL),(31111,2,17246,NULL,NULL,NULL),(31112,2,15795,NULL,NULL,NULL),(31113,2,33707,NULL,NULL,NULL),(31114,2,36783,NULL,NULL,NULL),(31115,2,16445,NULL,NULL,NULL),(31116,2,20165,NULL,NULL,NULL),(31117,2,32411,NULL,NULL,NULL),(31118,2,32412,NULL,NULL,NULL),(31119,2,35049,NULL,NULL,NULL),(31120,2,35050,NULL,NULL,NULL),(31121,2,6256,NULL,NULL,NULL),(31122,2,2658,NULL,NULL,NULL),(31123,2,16294,NULL,NULL,NULL),(31124,2,17237,NULL,NULL,NULL),(31125,2,35566,NULL,NULL,NULL),(31126,2,32994,NULL,NULL,NULL),(31127,2,36790,NULL,NULL,NULL),(31128,2,6743,NULL,NULL,NULL),(31129,2,17178,NULL,NULL,NULL),(31130,2,36866,NULL,NULL,NULL),(31131,2,3944,NULL,NULL,NULL),(31132,2,16667,NULL,NULL,NULL),(31133,2,36870,NULL,NULL,NULL),(31134,2,14378,NULL,NULL,NULL),(31135,2,16476,NULL,NULL,NULL),(31136,2,35836,NULL,NULL,NULL),(31137,2,10288,NULL,NULL,NULL),(31138,2,35565,NULL,NULL,NULL),(31139,2,16123,NULL,NULL,NULL),(31140,2,15794,NULL,NULL,NULL),(31141,2,14329,NULL,NULL,NULL),(31142,2,31579,NULL,NULL,NULL),(31143,2,31635,NULL,NULL,NULL),(31144,2,31627,NULL,NULL,NULL),(31145,2,31580,NULL,NULL,NULL),(31146,2,31581,NULL,NULL,NULL),(31147,2,31982,NULL,NULL,NULL),(31148,2,31582,NULL,NULL,NULL),(31149,2,31636,NULL,NULL,NULL),(31150,2,31583,NULL,NULL,NULL),(31151,2,36839,NULL,NULL,NULL),(31152,2,36840,NULL,NULL,NULL),(31153,2,16670,NULL,NULL,NULL),(31154,2,10955,NULL,NULL,NULL),(31155,2,15527,NULL,NULL,NULL),(31156,2,2949,NULL,NULL,NULL),(31157,2,14414,NULL,NULL,NULL),(31158,2,36782,NULL,NULL,NULL),(31159,2,942,NULL,NULL,NULL),(31160,2,34154,NULL,NULL,NULL),(31161,2,34362,NULL,NULL,NULL),(31162,2,16288,NULL,NULL,NULL),(31163,2,15731,NULL,NULL,NULL),(31164,2,14953,NULL,NULL,NULL),(31165,2,14290,NULL,NULL,NULL),(31166,2,34145,NULL,NULL,NULL),(31167,2,13930,NULL,NULL,NULL),(31168,2,14379,NULL,NULL,NULL),(31169,2,32082,NULL,NULL,NULL),(31170,2,36876,NULL,NULL,NULL),(31171,2,17151,NULL,NULL,NULL),(31172,2,35891,NULL,NULL,NULL),(31173,2,13963,NULL,NULL,NULL),(31174,2,903,NULL,NULL,NULL),(31175,2,28721,NULL,NULL,NULL),(31176,2,1076,NULL,NULL,NULL),(31177,2,16184,NULL,NULL,NULL),(31178,2,16295,NULL,NULL,NULL),(31179,2,34331,NULL,NULL,NULL),(31180,2,35774,NULL,NULL,NULL),(31181,2,829,NULL,NULL,NULL),(31182,2,10322,NULL,NULL,NULL),(31183,2,14397,NULL,NULL,NULL),(31184,2,36785,NULL,NULL,NULL),(31185,2,36477,NULL,NULL,NULL),(31186,2,36478,NULL,NULL,NULL),(31187,2,36479,NULL,NULL,NULL),(31188,2,3416,NULL,NULL,NULL),(31189,2,36480,NULL,NULL,NULL),(31190,2,36481,NULL,NULL,NULL),(31191,2,36482,NULL,NULL,NULL),(31192,2,36483,NULL,NULL,NULL),(31193,2,36484,NULL,NULL,NULL),(31194,2,36485,NULL,NULL,NULL),(31195,2,36486,NULL,NULL,NULL),(31196,2,36487,NULL,NULL,NULL),(31197,2,36488,NULL,NULL,NULL),(31198,2,36489,NULL,NULL,NULL),(31199,2,36490,NULL,NULL,NULL),(31200,2,36491,NULL,NULL,NULL),(31201,2,36492,NULL,NULL,NULL),(31202,2,36493,NULL,NULL,NULL),(31203,2,36494,NULL,NULL,NULL),(31204,2,36495,NULL,NULL,NULL),(31205,2,3417,NULL,NULL,NULL),(31206,2,36496,NULL,NULL,NULL),(31207,2,36497,NULL,NULL,NULL),(31208,2,36498,NULL,NULL,NULL),(31209,2,36499,NULL,NULL,NULL),(31210,2,3418,NULL,NULL,NULL),(31211,2,36500,NULL,NULL,NULL),(31212,2,36501,NULL,NULL,NULL),(31213,2,902,NULL,NULL,NULL),(31214,2,952,NULL,NULL,NULL),(31215,2,36502,NULL,NULL,NULL),(31216,2,3419,NULL,NULL,NULL),(31217,2,3420,NULL,NULL,NULL),(31218,2,36503,NULL,NULL,NULL),(31219,2,36504,NULL,NULL,NULL),(31220,2,36505,NULL,NULL,NULL),(31221,2,36506,NULL,NULL,NULL),(31222,2,36507,NULL,NULL,NULL),(31223,2,36508,NULL,NULL,NULL),(31224,2,36509,NULL,NULL,NULL),(31225,2,485,NULL,NULL,NULL),(31226,2,36510,NULL,NULL,NULL),(31227,2,501,NULL,NULL,NULL),(31228,2,36511,NULL,NULL,NULL),(31229,2,36512,NULL,NULL,NULL),(31230,2,36513,NULL,NULL,NULL),(31231,2,36514,NULL,NULL,NULL),(31232,2,2657,NULL,NULL,NULL),(31233,2,3421,NULL,NULL,NULL),(31234,2,36515,NULL,NULL,NULL),(31235,2,36516,NULL,NULL,NULL),(31236,2,36517,NULL,NULL,NULL),(31237,2,36518,NULL,NULL,NULL),(31238,2,36519,NULL,NULL,NULL),(31239,2,3422,NULL,NULL,NULL),(31240,2,36520,NULL,NULL,NULL),(31241,2,36521,NULL,NULL,NULL),(31242,2,36522,NULL,NULL,NULL),(31243,2,36523,NULL,NULL,NULL),(31244,2,36524,NULL,NULL,NULL),(31245,2,36525,NULL,NULL,NULL),(31246,2,36526,NULL,NULL,NULL),(31247,2,36527,NULL,NULL,NULL),(31248,2,36528,NULL,NULL,NULL),(31249,2,36529,NULL,NULL,NULL),(31250,2,36530,NULL,NULL,NULL),(31251,2,36531,NULL,NULL,NULL),(31252,2,36532,NULL,NULL,NULL),(31253,2,36533,NULL,NULL,NULL),(31254,2,36534,NULL,NULL,NULL),(31255,2,36535,NULL,NULL,NULL),(31256,2,36536,NULL,NULL,NULL),(31257,2,36537,NULL,NULL,NULL),(31258,2,36538,NULL,NULL,NULL),(31259,2,36539,NULL,NULL,NULL),(31260,2,36540,NULL,NULL,NULL),(31261,2,36541,NULL,NULL,NULL),(31262,2,36542,NULL,NULL,NULL),(31263,2,36543,NULL,NULL,NULL),(31264,2,36544,NULL,NULL,NULL),(31265,2,36781,NULL,NULL,NULL),(31266,2,3423,NULL,NULL,NULL),(31267,2,3475,NULL,NULL,NULL),(31268,2,36545,NULL,NULL,NULL),(31269,2,36546,NULL,NULL,NULL),(31270,2,36547,NULL,NULL,NULL),(31271,2,36548,NULL,NULL,NULL),(31272,2,36549,NULL,NULL,NULL),(31273,2,36550,NULL,NULL,NULL),(31274,2,3424,NULL,NULL,NULL),(31275,2,36551,NULL,NULL,NULL),(31276,2,36552,NULL,NULL,NULL),(31277,2,36553,NULL,NULL,NULL),(31278,2,36554,NULL,NULL,NULL),(31279,2,3425,NULL,NULL,NULL),(31280,2,36555,NULL,NULL,NULL),(31281,2,36556,NULL,NULL,NULL),(31282,2,36557,NULL,NULL,NULL),(31283,2,36558,NULL,NULL,NULL),(31284,2,36559,NULL,NULL,NULL),(31285,2,36560,NULL,NULL,NULL),(31286,2,36561,NULL,NULL,NULL),(31287,2,36562,NULL,NULL,NULL),(31288,2,36563,NULL,NULL,NULL),(31289,2,36564,NULL,NULL,NULL),(31290,2,36565,NULL,NULL,NULL),(31291,2,3426,NULL,NULL,NULL),(31292,2,36566,NULL,NULL,NULL),(31293,2,3427,NULL,NULL,NULL),(31294,2,36567,NULL,NULL,NULL),(31295,2,36568,NULL,NULL,NULL),(31296,2,36569,NULL,NULL,NULL),(31297,2,36570,NULL,NULL,NULL),(31298,2,36571,NULL,NULL,NULL),(31299,2,3428,NULL,NULL,NULL),(31300,2,36572,NULL,NULL,NULL),(31301,2,36573,NULL,NULL,NULL),(31302,2,36574,NULL,NULL,NULL),(31303,2,3429,NULL,NULL,NULL),(31304,2,3430,NULL,NULL,NULL),(31305,2,36575,NULL,NULL,NULL),(31306,2,1075,NULL,NULL,NULL),(31307,2,36576,NULL,NULL,NULL),(31308,2,36577,NULL,NULL,NULL),(31309,2,3431,NULL,NULL,NULL),(31310,2,36578,NULL,NULL,NULL),(31311,2,36579,NULL,NULL,NULL),(31312,2,36580,NULL,NULL,NULL),(31313,2,36581,NULL,NULL,NULL),(31314,2,10428,NULL,NULL,NULL),(31315,2,36582,NULL,NULL,NULL),(31316,2,36583,NULL,NULL,NULL),(31317,2,36584,NULL,NULL,NULL),(31318,2,36585,NULL,NULL,NULL),(31319,2,36586,NULL,NULL,NULL),(31320,2,36587,NULL,NULL,NULL),(31321,2,36588,NULL,NULL,NULL),(31322,2,36589,NULL,NULL,NULL),(31323,2,36590,NULL,NULL,NULL),(31324,2,36591,NULL,NULL,NULL),(31325,2,36592,NULL,NULL,NULL),(31326,2,3432,NULL,NULL,NULL),(31327,2,36593,NULL,NULL,NULL),(31328,2,36594,NULL,NULL,NULL),(31329,2,36595,NULL,NULL,NULL),(31330,2,36596,NULL,NULL,NULL),(31331,2,36597,NULL,NULL,NULL),(31332,2,36598,NULL,NULL,NULL),(31333,2,3433,NULL,NULL,NULL),(31334,2,36599,NULL,NULL,NULL),(31335,2,36600,NULL,NULL,NULL),(31336,2,36601,NULL,NULL,NULL),(31337,2,36602,NULL,NULL,NULL),(31338,2,3434,NULL,NULL,NULL),(31339,2,36603,NULL,NULL,NULL),(31340,2,36604,NULL,NULL,NULL),(31341,2,36605,NULL,NULL,NULL),(31342,2,36606,NULL,NULL,NULL),(31343,2,36607,NULL,NULL,NULL),(31344,2,36608,NULL,NULL,NULL),(31345,2,36609,NULL,NULL,NULL),(31346,2,36610,NULL,NULL,NULL),(31347,2,36611,NULL,NULL,NULL),(31348,2,36612,NULL,NULL,NULL),(31349,2,36613,NULL,NULL,NULL),(31350,2,36614,NULL,NULL,NULL),(31351,2,36615,NULL,NULL,NULL),(31352,2,36616,NULL,NULL,NULL),(31353,2,36617,NULL,NULL,NULL),(31354,2,36618,NULL,NULL,NULL),(31355,2,36619,NULL,NULL,NULL),(31356,2,36620,NULL,NULL,NULL),(31357,2,36621,NULL,NULL,NULL),(31358,2,36622,NULL,NULL,NULL),(31359,2,36623,NULL,NULL,NULL),(31360,2,3435,NULL,NULL,NULL),(31361,2,36624,NULL,NULL,NULL),(31362,2,3436,NULL,NULL,NULL),(31363,2,36625,NULL,NULL,NULL),(31364,2,36626,NULL,NULL,NULL),(31365,2,3437,NULL,NULL,NULL),(31366,2,3438,NULL,NULL,NULL),(31367,2,36627,NULL,NULL,NULL),(31368,2,36628,NULL,NULL,NULL),(31369,2,36629,NULL,NULL,NULL),(31370,2,3439,NULL,NULL,NULL),(31371,2,36630,NULL,NULL,NULL),(31372,2,36631,NULL,NULL,NULL),(31373,2,36632,NULL,NULL,NULL),(31374,2,36633,NULL,NULL,NULL),(31375,2,36634,NULL,NULL,NULL),(31376,2,36635,NULL,NULL,NULL),(31377,2,36636,NULL,NULL,NULL),(31378,2,3440,NULL,NULL,NULL),(31379,2,36637,NULL,NULL,NULL),(31380,2,36638,NULL,NULL,NULL),(31381,2,36639,NULL,NULL,NULL),(31382,2,36640,NULL,NULL,NULL),(31383,2,36641,NULL,NULL,NULL),(31384,2,36642,NULL,NULL,NULL),(31385,2,36643,NULL,NULL,NULL),(31386,2,36644,NULL,NULL,NULL),(31387,2,36645,NULL,NULL,NULL),(31388,2,36646,NULL,NULL,NULL),(31389,2,36647,NULL,NULL,NULL),(31390,2,36648,NULL,NULL,NULL),(31391,2,3441,NULL,NULL,NULL),(31392,2,36649,NULL,NULL,NULL),(31393,2,36650,NULL,NULL,NULL),(31394,2,3442,NULL,NULL,NULL),(31395,2,35807,NULL,NULL,NULL),(31396,2,36651,NULL,NULL,NULL),(31397,2,36652,NULL,NULL,NULL),(31398,2,36653,NULL,NULL,NULL),(31399,2,36654,NULL,NULL,NULL),(31400,2,36655,NULL,NULL,NULL),(31401,2,36656,NULL,NULL,NULL),(31402,2,16206,NULL,NULL,NULL),(31403,2,36657,NULL,NULL,NULL),(31404,2,36658,NULL,NULL,NULL),(31405,2,32073,NULL,NULL,NULL),(31406,2,10533,NULL,NULL,NULL),(31407,2,36659,NULL,NULL,NULL),(31408,2,36660,NULL,NULL,NULL),(31409,2,36661,NULL,NULL,NULL),(31410,2,473,NULL,NULL,NULL),(31411,2,36662,NULL,NULL,NULL),(31412,2,36663,NULL,NULL,NULL),(31413,2,36664,NULL,NULL,NULL),(31414,2,36665,NULL,NULL,NULL),(31415,2,36666,NULL,NULL,NULL),(31416,2,3443,NULL,NULL,NULL),(31417,2,36667,NULL,NULL,NULL),(31418,2,36668,NULL,NULL,NULL),(31419,2,36669,NULL,NULL,NULL),(31420,2,3444,NULL,NULL,NULL),(31421,2,36670,NULL,NULL,NULL),(31422,2,36671,NULL,NULL,NULL),(31423,2,36672,NULL,NULL,NULL),(31424,2,36673,NULL,NULL,NULL),(31425,2,36674,NULL,NULL,NULL),(31426,2,36675,NULL,NULL,NULL),(31427,2,36676,NULL,NULL,NULL),(31428,2,36677,NULL,NULL,NULL),(31429,2,36678,NULL,NULL,NULL),(31430,2,36679,NULL,NULL,NULL),(31431,2,16475,NULL,NULL,NULL),(31432,2,36680,NULL,NULL,NULL),(31433,2,36681,NULL,NULL,NULL),(31434,2,36682,NULL,NULL,NULL),(31435,2,36683,NULL,NULL,NULL),(31436,2,36684,NULL,NULL,NULL),(31437,2,36685,NULL,NULL,NULL),(31438,2,36686,NULL,NULL,NULL),(31439,2,36687,NULL,NULL,NULL),(31440,2,36688,NULL,NULL,NULL),(31441,2,36689,NULL,NULL,NULL),(31442,2,32018,NULL,NULL,NULL),(31443,2,36690,NULL,NULL,NULL),(31444,2,36691,NULL,NULL,NULL),(31445,2,36692,NULL,NULL,NULL),(31446,2,36693,NULL,NULL,NULL),(31447,2,4609,NULL,NULL,NULL),(31448,2,36694,NULL,NULL,NULL),(31449,2,36695,NULL,NULL,NULL),(31450,2,36696,NULL,NULL,NULL),(31451,2,36697,NULL,NULL,NULL),(31452,2,36698,NULL,NULL,NULL),(31453,2,36699,NULL,NULL,NULL),(31454,2,3445,NULL,NULL,NULL),(31455,2,36700,NULL,NULL,NULL),(31456,2,3446,NULL,NULL,NULL),(31457,2,36701,NULL,NULL,NULL),(31458,2,32047,NULL,NULL,NULL),(31459,2,36702,NULL,NULL,NULL),(31460,2,36703,NULL,NULL,NULL),(31461,2,28719,NULL,NULL,NULL),(31462,2,36464,NULL,NULL,NULL),(31463,2,36704,NULL,NULL,NULL),(31464,2,36705,NULL,NULL,NULL),(31465,2,36706,NULL,NULL,NULL),(31466,2,36707,NULL,NULL,NULL),(31467,2,36708,NULL,NULL,NULL),(31468,2,36709,NULL,NULL,NULL),(31469,2,3447,NULL,NULL,NULL),(31470,2,36476,NULL,NULL,NULL),(31471,2,4610,NULL,NULL,NULL),(31472,2,36710,NULL,NULL,NULL),(31473,2,36711,NULL,NULL,NULL),(31474,2,36712,NULL,NULL,NULL),(31475,2,36713,NULL,NULL,NULL),(31476,2,36714,NULL,NULL,NULL),(31477,2,36715,NULL,NULL,NULL),(31478,2,36716,NULL,NULL,NULL),(31479,2,36717,NULL,NULL,NULL),(31480,2,3448,NULL,NULL,NULL),(31481,2,36465,NULL,NULL,NULL),(31482,2,36718,NULL,NULL,NULL),(31483,2,4611,NULL,NULL,NULL),(31484,2,36719,NULL,NULL,NULL),(31485,2,36720,NULL,NULL,NULL),(31486,2,36721,NULL,NULL,NULL),(31487,2,36466,NULL,NULL,NULL),(31488,2,36722,NULL,NULL,NULL),(31489,2,36467,NULL,NULL,NULL),(31490,2,36723,NULL,NULL,NULL),(31491,2,36724,NULL,NULL,NULL),(31492,2,36725,NULL,NULL,NULL),(31493,2,4612,NULL,NULL,NULL),(31494,2,36726,NULL,NULL,NULL),(31495,2,36468,NULL,NULL,NULL),(31496,2,36727,NULL,NULL,NULL),(31497,2,36728,NULL,NULL,NULL),(31498,2,36729,NULL,NULL,NULL),(31499,2,36730,NULL,NULL,NULL),(31500,2,36731,NULL,NULL,NULL),(31501,2,36732,NULL,NULL,NULL),(31502,2,36733,NULL,NULL,NULL),(31503,2,36734,NULL,NULL,NULL),(31504,2,36735,NULL,NULL,NULL),(31505,2,36469,NULL,NULL,NULL),(31506,2,3415,NULL,NULL,NULL),(31507,2,35614,NULL,NULL,NULL),(31508,2,31999,NULL,NULL,NULL),(31509,2,36736,NULL,NULL,NULL),(31510,2,36737,NULL,NULL,NULL),(31511,2,3449,NULL,NULL,NULL),(31512,2,14073,NULL,NULL,NULL),(31513,2,36470,NULL,NULL,NULL),(31514,2,36738,NULL,NULL,NULL),(31515,2,36471,NULL,NULL,NULL),(31516,2,36472,NULL,NULL,NULL),(31517,2,36473,NULL,NULL,NULL),(31518,2,36474,NULL,NULL,NULL),(31519,2,36739,NULL,NULL,NULL),(31520,2,36740,NULL,NULL,NULL),(31521,2,3450,NULL,NULL,NULL),(31522,2,36741,NULL,NULL,NULL),(31523,2,36742,NULL,NULL,NULL),(31524,2,3451,NULL,NULL,NULL),(31525,2,36743,NULL,NULL,NULL),(31526,2,36475,NULL,NULL,NULL),(31527,2,36744,NULL,NULL,NULL),(31528,2,36745,NULL,NULL,NULL),(31529,2,36746,NULL,NULL,NULL),(31530,2,36747,NULL,NULL,NULL),(31531,2,36748,NULL,NULL,NULL),(31532,2,36749,NULL,NULL,NULL),(31533,2,36750,NULL,NULL,NULL),(31534,2,36751,NULL,NULL,NULL),(31535,2,36752,NULL,NULL,NULL),(31536,2,36753,NULL,NULL,NULL),(31537,2,36754,NULL,NULL,NULL),(31538,2,36755,NULL,NULL,NULL),(31539,2,36756,NULL,NULL,NULL),(31540,2,36757,NULL,NULL,NULL),(31541,2,36758,NULL,NULL,NULL),(31542,2,36759,NULL,NULL,NULL),(31543,2,36760,NULL,NULL,NULL),(31544,2,36761,NULL,NULL,NULL),(31545,2,36762,NULL,NULL,NULL),(31546,2,28720,NULL,NULL,NULL),(31547,2,36763,NULL,NULL,NULL),(31548,2,36764,NULL,NULL,NULL),(31549,2,36765,NULL,NULL,NULL),(31550,2,36766,NULL,NULL,NULL),(31551,2,36767,NULL,NULL,NULL),(31552,2,36768,NULL,NULL,NULL),(31553,2,36769,NULL,NULL,NULL),(31554,2,36770,NULL,NULL,NULL),(31555,2,36771,NULL,NULL,NULL),(31556,2,36772,NULL,NULL,NULL),(31557,2,36773,NULL,NULL,NULL),(31558,2,36774,NULL,NULL,NULL),(31559,2,36775,NULL,NULL,NULL),(31560,2,36776,NULL,NULL,NULL),(31561,2,36777,NULL,NULL,NULL),(31562,2,36778,NULL,NULL,NULL),(31563,2,36779,NULL,NULL,NULL),(31564,2,36780,NULL,NULL,NULL),(31970,4,31478,NULL,NULL,NULL),(31971,4,6352,NULL,NULL,NULL),(31972,4,33141,NULL,NULL,NULL),(31973,4,10415,NULL,NULL,NULL),(31974,4,16306,NULL,NULL,NULL),(31975,4,994,NULL,NULL,NULL),(31976,4,6792,NULL,NULL,NULL),(31977,4,33390,NULL,NULL,NULL),(31978,4,11165,NULL,NULL,NULL),(31979,4,13984,NULL,NULL,NULL),(31980,4,28888,NULL,NULL,NULL),(31981,4,34043,NULL,NULL,NULL),(31982,4,734,NULL,NULL,NULL),(31983,4,35914,NULL,NULL,NULL),(31984,4,4102,NULL,NULL,NULL),(31985,4,33712,NULL,NULL,NULL),(31986,4,16671,NULL,NULL,NULL),(31987,4,20188,NULL,NULL,NULL),(31988,4,10342,NULL,NULL,NULL),(31989,4,17269,NULL,NULL,NULL),(31990,4,16118,NULL,NULL,NULL),(31991,4,3961,NULL,NULL,NULL),(31992,4,530,NULL,NULL,NULL),(31993,4,1753,NULL,NULL,NULL),(31994,4,3543,NULL,NULL,NULL),(31995,4,3718,NULL,NULL,NULL),(31996,4,36830,NULL,NULL,NULL),(31997,4,15596,NULL,NULL,NULL),(31998,4,585,NULL,NULL,NULL),(31999,4,13837,NULL,NULL,NULL),(32000,4,17920,NULL,NULL,NULL),(32001,4,16494,NULL,NULL,NULL),(32002,4,32197,NULL,NULL,NULL),(32003,4,34363,NULL,NULL,NULL),(32004,4,14199,NULL,NULL,NULL),(32005,4,33306,NULL,NULL,NULL),(32006,4,36838,NULL,NULL,NULL),(32007,4,3690,NULL,NULL,NULL),(32008,4,35680,NULL,NULL,NULL),(32009,4,11209,NULL,NULL,NULL),(32010,4,17167,NULL,NULL,NULL),(32011,4,1,NULL,NULL,NULL),(32012,4,33575,NULL,NULL,NULL),(32013,4,16287,NULL,NULL,NULL),(32014,4,13917,NULL,NULL,NULL),(32015,4,33381,NULL,NULL,NULL),(32016,4,16212,NULL,NULL,NULL),(32017,4,454,NULL,NULL,NULL),(32018,4,35649,NULL,NULL,NULL),(32019,4,15054,NULL,NULL,NULL),(32020,4,10310,NULL,NULL,NULL),(32021,4,32097,NULL,NULL,NULL),(32022,4,15862,NULL,NULL,NULL),(32023,4,15766,NULL,NULL,NULL),(32024,4,10813,NULL,NULL,NULL),(32025,4,14026,NULL,NULL,NULL),(32026,4,2917,NULL,NULL,NULL),(32027,4,16597,NULL,NULL,NULL),(32028,4,35554,NULL,NULL,NULL),(32029,4,1059,NULL,NULL,NULL),(32030,4,15863,NULL,NULL,NULL),(32031,4,14974,NULL,NULL,NULL),(32032,4,32181,NULL,NULL,NULL),(32033,4,10396,NULL,NULL,NULL),(32034,4,16616,NULL,NULL,NULL),(32035,4,3537,NULL,NULL,NULL),(32036,4,3528,NULL,NULL,NULL),(32037,4,3019,NULL,NULL,NULL),(32038,4,3452,NULL,NULL,NULL),(32039,4,32079,NULL,NULL,NULL),(32040,4,6545,NULL,NULL,NULL),(32041,4,10297,NULL,NULL,NULL),(32042,4,3939,NULL,NULL,NULL),(32043,4,6225,NULL,NULL,NULL),(32044,4,479,NULL,NULL,NULL),(32045,4,10854,NULL,NULL,NULL),(32046,4,4578,NULL,NULL,NULL),(32047,4,584,NULL,NULL,NULL),(32048,4,32180,NULL,NULL,NULL),(32049,4,33681,NULL,NULL,NULL),(32050,4,31993,NULL,NULL,NULL),(32051,4,6677,NULL,NULL,NULL),(32052,4,33058,NULL,NULL,NULL),(32053,4,4580,NULL,NULL,NULL),(32054,4,14365,NULL,NULL,NULL),(32055,4,34349,NULL,NULL,NULL),(32056,4,35837,NULL,NULL,NULL),(32057,4,2939,NULL,NULL,NULL),(32058,4,16282,NULL,NULL,NULL),(32059,4,36881,NULL,NULL,NULL),(32060,4,15583,NULL,NULL,NULL),(32061,4,36885,NULL,NULL,NULL),(32062,4,16290,NULL,NULL,NULL),(32063,4,15592,NULL,NULL,NULL),(32064,4,14970,NULL,NULL,NULL),(32065,4,1712,NULL,NULL,NULL),(32066,4,33708,NULL,NULL,NULL),(32067,4,3938,NULL,NULL,NULL),(32068,4,33676,NULL,NULL,NULL),(32069,4,6550,NULL,NULL,NULL),(32070,4,565,NULL,NULL,NULL),(32071,4,6719,NULL,NULL,NULL),(32072,4,10424,NULL,NULL,NULL),(32073,4,9887,NULL,NULL,NULL),(32074,4,33438,NULL,NULL,NULL),(32075,4,10408,NULL,NULL,NULL),(32076,4,28513,NULL,NULL,NULL),(32077,4,15504,NULL,NULL,NULL),(32078,4,13940,NULL,NULL,NULL),(32079,4,11171,NULL,NULL,NULL),(32080,4,14,NULL,NULL,NULL),(32081,4,15780,NULL,NULL,NULL),(32082,4,3966,NULL,NULL,NULL),(32083,4,6752,NULL,NULL,NULL),(32084,4,2903,NULL,NULL,NULL),(32085,4,11166,NULL,NULL,NULL),(32086,4,15083,NULL,NULL,NULL),(32087,4,14416,NULL,NULL,NULL),(32088,4,6552,NULL,NULL,NULL),(32089,4,16124,NULL,NULL,NULL),(32090,4,553,NULL,NULL,NULL),(32091,4,981,NULL,NULL,NULL),(32092,4,474,NULL,NULL,NULL),(32093,4,16178,NULL,NULL,NULL),(32094,4,32074,NULL,NULL,NULL),(32095,4,35865,NULL,NULL,NULL),(32096,4,32107,NULL,NULL,NULL),(32097,4,16199,NULL,NULL,NULL),(32098,4,3953,NULL,NULL,NULL),(32099,4,32862,NULL,NULL,NULL),(32100,4,1152,NULL,NULL,NULL),(32101,4,15529,NULL,NULL,NULL),(32102,4,31296,NULL,NULL,NULL),(32103,4,3980,NULL,NULL,NULL),(32104,4,32838,NULL,NULL,NULL),(32105,4,15060,NULL,NULL,NULL),(32106,4,735,NULL,NULL,NULL),(32107,4,35916,NULL,NULL,NULL),(32108,4,36444,NULL,NULL,NULL),(32109,4,4162,NULL,NULL,NULL),(32110,4,33713,NULL,NULL,NULL),(32111,4,16935,NULL,NULL,NULL),(32112,4,16938,NULL,NULL,NULL),(32113,4,6740,NULL,NULL,NULL),(32114,4,1051,NULL,NULL,NULL),(32115,4,10534,NULL,NULL,NULL),(32116,4,6357,NULL,NULL,NULL),(32117,4,10913,NULL,NULL,NULL),(32118,4,16520,NULL,NULL,NULL),(32119,4,3948,NULL,NULL,NULL),(32120,4,17185,NULL,NULL,NULL),(32121,4,33677,NULL,NULL,NULL),(32122,4,10882,NULL,NULL,NULL),(32123,4,17332,NULL,NULL,NULL),(32124,4,16120,NULL,NULL,NULL),(32125,4,3963,NULL,NULL,NULL),(32126,4,550,NULL,NULL,NULL),(32127,4,3544,NULL,NULL,NULL),(32128,4,3545,NULL,NULL,NULL),(32129,4,10459,NULL,NULL,NULL),(32130,4,1080,NULL,NULL,NULL),(32131,4,10862,NULL,NULL,NULL),(32132,4,6260,NULL,NULL,NULL),(32133,4,10257,NULL,NULL,NULL),(32134,4,17246,NULL,NULL,NULL),(32135,4,15795,NULL,NULL,NULL),(32136,4,33707,NULL,NULL,NULL),(32137,4,36783,NULL,NULL,NULL),(32138,4,16445,NULL,NULL,NULL),(32139,4,20165,NULL,NULL,NULL),(32140,4,32411,NULL,NULL,NULL),(32141,4,32412,NULL,NULL,NULL),(32142,4,35049,NULL,NULL,NULL),(32143,4,35050,NULL,NULL,NULL),(32144,4,6256,NULL,NULL,NULL),(32145,4,2658,NULL,NULL,NULL),(32146,4,16294,NULL,NULL,NULL),(32147,4,17237,NULL,NULL,NULL),(32148,4,35566,NULL,NULL,NULL),(32149,4,32994,NULL,NULL,NULL),(32150,4,36790,NULL,NULL,NULL),(32151,4,6743,NULL,NULL,NULL),(32152,4,17178,NULL,NULL,NULL),(32153,4,36866,NULL,NULL,NULL),(32154,4,3944,NULL,NULL,NULL),(32155,4,16667,NULL,NULL,NULL),(32156,4,36870,NULL,NULL,NULL),(32157,4,14378,NULL,NULL,NULL),(32158,4,16476,NULL,NULL,NULL),(32159,4,35836,NULL,NULL,NULL),(32160,4,10288,NULL,NULL,NULL),(32161,4,35565,NULL,NULL,NULL),(32162,4,16123,NULL,NULL,NULL),(32163,4,15794,NULL,NULL,NULL),(32164,4,14329,NULL,NULL,NULL),(32165,4,31579,NULL,NULL,NULL),(32166,4,31635,NULL,NULL,NULL),(32167,4,31627,NULL,NULL,NULL),(32168,4,31580,NULL,NULL,NULL),(32169,4,31581,NULL,NULL,NULL),(32170,4,31982,NULL,NULL,NULL),(32171,4,31582,NULL,NULL,NULL),(32172,4,31636,NULL,NULL,NULL),(32173,4,31583,NULL,NULL,NULL),(32174,4,36839,NULL,NULL,NULL),(32175,4,36840,NULL,NULL,NULL),(32176,4,16670,NULL,NULL,NULL),(32177,4,10955,NULL,NULL,NULL),(32178,4,15527,NULL,NULL,NULL),(32179,4,2949,NULL,NULL,NULL),(32180,4,14414,NULL,NULL,NULL),(32181,4,36782,NULL,NULL,NULL),(32182,4,942,NULL,NULL,NULL),(32183,4,34154,NULL,NULL,NULL),(32184,4,34362,NULL,NULL,NULL),(32185,4,16288,NULL,NULL,NULL),(32186,4,15731,NULL,NULL,NULL),(32187,4,14953,NULL,NULL,NULL),(32188,4,14290,NULL,NULL,NULL),(32189,4,34145,NULL,NULL,NULL),(32190,4,13930,NULL,NULL,NULL),(32191,4,14379,NULL,NULL,NULL),(32192,4,32082,NULL,NULL,NULL),(32193,4,36876,NULL,NULL,NULL),(32194,4,17151,NULL,NULL,NULL),(32195,4,35891,NULL,NULL,NULL),(32196,4,13963,NULL,NULL,NULL),(32197,4,903,NULL,NULL,NULL),(32198,4,28721,NULL,NULL,NULL),(32199,4,1076,NULL,NULL,NULL),(32200,4,16184,NULL,NULL,NULL),(32201,4,16295,NULL,NULL,NULL),(32202,4,34331,NULL,NULL,NULL),(32203,4,35774,NULL,NULL,NULL),(32204,4,829,NULL,NULL,NULL),(32205,4,10322,NULL,NULL,NULL),(32206,4,14397,NULL,NULL,NULL),(32207,4,36785,NULL,NULL,NULL),(32208,4,36477,NULL,NULL,NULL),(32209,4,36478,NULL,NULL,NULL),(32210,4,36479,NULL,NULL,NULL),(32211,4,3416,NULL,NULL,NULL),(32212,4,36480,NULL,NULL,NULL),(32213,4,36481,NULL,NULL,NULL),(32214,4,36482,NULL,NULL,NULL),(32215,4,36483,NULL,NULL,NULL),(32216,4,36484,NULL,NULL,NULL),(32217,4,36485,NULL,NULL,NULL),(32218,4,36486,NULL,NULL,NULL),(32219,4,36487,NULL,NULL,NULL),(32220,4,36488,NULL,NULL,NULL),(32221,4,36489,NULL,NULL,NULL),(32222,4,36490,NULL,NULL,NULL),(32223,4,36491,NULL,NULL,NULL),(32224,4,36492,NULL,NULL,NULL),(32225,4,36493,NULL,NULL,NULL),(32226,4,36494,NULL,NULL,NULL),(32227,4,36495,NULL,NULL,NULL),(32228,4,3417,NULL,NULL,NULL),(32229,4,36496,NULL,NULL,NULL),(32230,4,36497,NULL,NULL,NULL),(32231,4,36498,NULL,NULL,NULL),(32232,4,36499,NULL,NULL,NULL),(32233,4,3418,NULL,NULL,NULL),(32234,4,36500,NULL,NULL,NULL),(32235,4,36501,NULL,NULL,NULL),(32236,4,902,NULL,NULL,NULL),(32237,4,952,NULL,NULL,NULL),(32238,4,36502,NULL,NULL,NULL),(32239,4,3419,NULL,NULL,NULL),(32240,4,3420,NULL,NULL,NULL),(32241,4,36503,NULL,NULL,NULL),(32242,4,36504,NULL,NULL,NULL),(32243,4,36505,NULL,NULL,NULL),(32244,4,36506,NULL,NULL,NULL),(32245,4,36507,NULL,NULL,NULL),(32246,4,36508,NULL,NULL,NULL),(32247,4,36509,NULL,NULL,NULL),(32248,4,485,NULL,NULL,NULL),(32249,4,36510,NULL,NULL,NULL),(32250,4,501,NULL,NULL,NULL),(32251,4,36511,NULL,NULL,NULL),(32252,4,36512,NULL,NULL,NULL),(32253,4,36513,NULL,NULL,NULL),(32254,4,36514,NULL,NULL,NULL),(32255,4,2657,NULL,NULL,NULL),(32256,4,3421,NULL,NULL,NULL),(32257,4,36515,NULL,NULL,NULL),(32258,4,36516,NULL,NULL,NULL),(32259,4,36517,NULL,NULL,NULL),(32260,4,36518,NULL,NULL,NULL),(32261,4,36519,NULL,NULL,NULL),(32262,4,3422,NULL,NULL,NULL),(32263,4,36520,NULL,NULL,NULL),(32264,4,36521,NULL,NULL,NULL),(32265,4,36522,NULL,NULL,NULL),(32266,4,36523,NULL,NULL,NULL),(32267,4,36524,NULL,NULL,NULL),(32268,4,36525,NULL,NULL,NULL),(32269,4,36526,NULL,NULL,NULL),(32270,4,36527,NULL,NULL,NULL),(32271,4,36528,NULL,NULL,NULL),(32272,4,36529,NULL,NULL,NULL),(32273,4,36530,NULL,NULL,NULL),(32274,4,36531,NULL,NULL,NULL),(32275,4,36532,NULL,NULL,NULL),(32276,4,36533,NULL,NULL,NULL),(32277,4,36534,NULL,NULL,NULL),(32278,4,36535,NULL,NULL,NULL),(32279,4,36536,NULL,NULL,NULL),(32280,4,36537,NULL,NULL,NULL),(32281,4,36538,NULL,NULL,NULL),(32282,4,36539,NULL,NULL,NULL),(32283,4,36540,NULL,NULL,NULL),(32284,4,36541,NULL,NULL,NULL),(32285,4,36542,NULL,NULL,NULL),(32286,4,36543,NULL,NULL,NULL),(32287,4,36544,NULL,NULL,NULL),(32288,4,36781,NULL,NULL,NULL),(32289,4,3423,NULL,NULL,NULL),(32290,4,3475,NULL,NULL,NULL),(32291,4,36545,NULL,NULL,NULL),(32292,4,36546,NULL,NULL,NULL),(32293,4,36547,NULL,NULL,NULL),(32294,4,36548,NULL,NULL,NULL),(32295,4,36549,NULL,NULL,NULL),(32296,4,36550,NULL,NULL,NULL),(32297,4,3424,NULL,NULL,NULL),(32298,4,36551,NULL,NULL,NULL),(32299,4,36552,NULL,NULL,NULL),(32300,4,36553,NULL,NULL,NULL),(32301,4,36554,NULL,NULL,NULL),(32302,4,3425,NULL,NULL,NULL),(32303,4,36555,NULL,NULL,NULL),(32304,4,36556,NULL,NULL,NULL),(32305,4,36557,NULL,NULL,NULL),(32306,4,36558,NULL,NULL,NULL),(32307,4,36559,NULL,NULL,NULL),(32308,4,36560,NULL,NULL,NULL),(32309,4,36561,NULL,NULL,NULL),(32310,4,36562,NULL,NULL,NULL),(32311,4,36563,NULL,NULL,NULL),(32312,4,36564,NULL,NULL,NULL),(32313,4,36565,NULL,NULL,NULL),(32314,4,3426,NULL,NULL,NULL),(32315,4,36566,NULL,NULL,NULL),(32316,4,3427,NULL,NULL,NULL),(32317,4,36567,NULL,NULL,NULL),(32318,4,36568,NULL,NULL,NULL),(32319,4,36569,NULL,NULL,NULL),(32320,4,36570,NULL,NULL,NULL),(32321,4,36571,NULL,NULL,NULL),(32322,4,3428,NULL,NULL,NULL),(32323,4,36572,NULL,NULL,NULL),(32324,4,36573,NULL,NULL,NULL),(32325,4,36574,NULL,NULL,NULL),(32326,4,3429,NULL,NULL,NULL),(32327,4,3430,NULL,NULL,NULL),(32328,4,36575,NULL,NULL,NULL),(32329,4,1075,NULL,NULL,NULL),(32330,4,36576,NULL,NULL,NULL),(32331,4,36577,NULL,NULL,NULL),(32332,4,3431,NULL,NULL,NULL),(32333,4,36578,NULL,NULL,NULL),(32334,4,36579,NULL,NULL,NULL),(32335,4,36580,NULL,NULL,NULL),(32336,4,36581,NULL,NULL,NULL),(32337,4,10428,NULL,NULL,NULL),(32338,4,36582,NULL,NULL,NULL),(32339,4,36583,NULL,NULL,NULL),(32340,4,36584,NULL,NULL,NULL),(32341,4,36585,NULL,NULL,NULL),(32342,4,36586,NULL,NULL,NULL),(32343,4,36587,NULL,NULL,NULL),(32344,4,36588,NULL,NULL,NULL),(32345,4,36589,NULL,NULL,NULL),(32346,4,36590,NULL,NULL,NULL),(32347,4,36591,NULL,NULL,NULL),(32348,4,36592,NULL,NULL,NULL),(32349,4,3432,NULL,NULL,NULL),(32350,4,36593,NULL,NULL,NULL),(32351,4,36594,NULL,NULL,NULL),(32352,4,36595,NULL,NULL,NULL),(32353,4,36596,NULL,NULL,NULL),(32354,4,36597,NULL,NULL,NULL),(32355,4,36598,NULL,NULL,NULL),(32356,4,3433,NULL,NULL,NULL),(32357,4,36599,NULL,NULL,NULL),(32358,4,36600,NULL,NULL,NULL),(32359,4,36601,NULL,NULL,NULL),(32360,4,36602,NULL,NULL,NULL),(32361,4,3434,NULL,NULL,NULL),(32362,4,36603,NULL,NULL,NULL),(32363,4,36604,NULL,NULL,NULL),(32364,4,36605,NULL,NULL,NULL),(32365,4,36606,NULL,NULL,NULL),(32366,4,36607,NULL,NULL,NULL),(32367,4,36608,NULL,NULL,NULL),(32368,4,36609,NULL,NULL,NULL),(32369,4,36610,NULL,NULL,NULL),(32370,4,36611,NULL,NULL,NULL),(32371,4,36612,NULL,NULL,NULL),(32372,4,36613,NULL,NULL,NULL),(32373,4,36614,NULL,NULL,NULL),(32374,4,36615,NULL,NULL,NULL),(32375,4,36616,NULL,NULL,NULL),(32376,4,36617,NULL,NULL,NULL),(32377,4,36618,NULL,NULL,NULL),(32378,4,36619,NULL,NULL,NULL),(32379,4,36620,NULL,NULL,NULL),(32380,4,36621,NULL,NULL,NULL),(32381,4,36622,NULL,NULL,NULL),(32382,4,36623,NULL,NULL,NULL),(32383,4,3435,NULL,NULL,NULL),(32384,4,36624,NULL,NULL,NULL),(32385,4,3436,NULL,NULL,NULL),(32386,4,36625,NULL,NULL,NULL),(32387,4,36626,NULL,NULL,NULL),(32388,4,3437,NULL,NULL,NULL),(32389,4,3438,NULL,NULL,NULL),(32390,4,36627,NULL,NULL,NULL),(32391,4,36628,NULL,NULL,NULL),(32392,4,36629,NULL,NULL,NULL),(32393,4,3439,NULL,NULL,NULL),(32394,4,36630,NULL,NULL,NULL),(32395,4,36631,NULL,NULL,NULL),(32396,4,36632,NULL,NULL,NULL),(32397,4,36633,NULL,NULL,NULL),(32398,4,36634,NULL,NULL,NULL),(32399,4,36635,NULL,NULL,NULL),(32400,4,36636,NULL,NULL,NULL),(32401,4,3440,NULL,NULL,NULL),(32402,4,36637,NULL,NULL,NULL),(32403,4,36638,NULL,NULL,NULL),(32404,4,36639,NULL,NULL,NULL),(32405,4,36640,NULL,NULL,NULL),(32406,4,36641,NULL,NULL,NULL),(32407,4,36642,NULL,NULL,NULL),(32408,4,36643,NULL,NULL,NULL),(32409,4,36644,NULL,NULL,NULL),(32410,4,36645,NULL,NULL,NULL),(32411,4,36646,NULL,NULL,NULL),(32412,4,36647,NULL,NULL,NULL),(32413,4,36648,NULL,NULL,NULL),(32414,4,3441,NULL,NULL,NULL),(32415,4,36649,NULL,NULL,NULL),(32416,4,36650,NULL,NULL,NULL),(32417,4,3442,NULL,NULL,NULL),(32418,4,35807,NULL,NULL,NULL),(32419,4,36651,NULL,NULL,NULL),(32420,4,36652,NULL,NULL,NULL),(32421,4,36653,NULL,NULL,NULL),(32422,4,36654,NULL,NULL,NULL),(32423,4,36655,NULL,NULL,NULL),(32424,4,36656,NULL,NULL,NULL),(32425,4,16206,NULL,NULL,NULL),(32426,4,36657,NULL,NULL,NULL),(32427,4,36658,NULL,NULL,NULL),(32428,4,32073,NULL,NULL,NULL),(32429,4,10533,NULL,NULL,NULL),(32430,4,36659,NULL,NULL,NULL),(32431,4,36660,NULL,NULL,NULL),(32432,4,36661,NULL,NULL,NULL),(32433,4,473,NULL,NULL,NULL),(32434,4,36662,NULL,NULL,NULL),(32435,4,36663,NULL,NULL,NULL),(32436,4,36664,NULL,NULL,NULL),(32437,4,36665,NULL,NULL,NULL),(32438,4,36666,NULL,NULL,NULL),(32439,4,3443,NULL,NULL,NULL),(32440,4,36667,NULL,NULL,NULL),(32441,4,36668,NULL,NULL,NULL),(32442,4,36669,NULL,NULL,NULL),(32443,4,3444,NULL,NULL,NULL),(32444,4,36670,NULL,NULL,NULL),(32445,4,36671,NULL,NULL,NULL),(32446,4,36672,NULL,NULL,NULL),(32447,4,36673,NULL,NULL,NULL),(32448,4,36674,NULL,NULL,NULL),(32449,4,36675,NULL,NULL,NULL),(32450,4,36676,NULL,NULL,NULL),(32451,4,36677,NULL,NULL,NULL),(32452,4,36678,NULL,NULL,NULL),(32453,4,36679,NULL,NULL,NULL),(32454,4,16475,NULL,NULL,NULL),(32455,4,36680,NULL,NULL,NULL),(32456,4,36681,NULL,NULL,NULL),(32457,4,36682,NULL,NULL,NULL),(32458,4,36683,NULL,NULL,NULL),(32459,4,36684,NULL,NULL,NULL),(32460,4,36685,NULL,NULL,NULL),(32461,4,36686,NULL,NULL,NULL),(32462,4,36687,NULL,NULL,NULL),(32463,4,36688,NULL,NULL,NULL),(32464,4,36689,NULL,NULL,NULL),(32465,4,32018,NULL,NULL,NULL),(32466,4,36690,NULL,NULL,NULL),(32467,4,36691,NULL,NULL,NULL),(32468,4,36692,NULL,NULL,NULL),(32469,4,36693,NULL,NULL,NULL),(32470,4,4609,NULL,NULL,NULL),(32471,4,36694,NULL,NULL,NULL),(32472,4,36695,NULL,NULL,NULL),(32473,4,36696,NULL,NULL,NULL),(32474,4,36697,NULL,NULL,NULL),(32475,4,36698,NULL,NULL,NULL),(32476,4,36699,NULL,NULL,NULL),(32477,4,3445,NULL,NULL,NULL),(32478,4,36700,NULL,NULL,NULL),(32479,4,3446,NULL,NULL,NULL),(32480,4,36701,NULL,NULL,NULL),(32481,4,32047,NULL,NULL,NULL),(32482,4,36702,NULL,NULL,NULL),(32483,4,36703,NULL,NULL,NULL),(32484,4,28719,NULL,NULL,NULL),(32485,4,36464,NULL,NULL,NULL),(32486,4,36704,NULL,NULL,NULL),(32487,4,36705,NULL,NULL,NULL),(32488,4,36706,NULL,NULL,NULL),(32489,4,36707,NULL,NULL,NULL),(32490,4,36708,NULL,NULL,NULL),(32491,4,36709,NULL,NULL,NULL),(32492,4,3447,NULL,NULL,NULL),(32493,4,36476,NULL,NULL,NULL),(32494,4,4610,NULL,NULL,NULL),(32495,4,36710,NULL,NULL,NULL),(32496,4,36711,NULL,NULL,NULL),(32497,4,36712,NULL,NULL,NULL),(32498,4,36713,NULL,NULL,NULL),(32499,4,36714,NULL,NULL,NULL),(32500,4,36715,NULL,NULL,NULL),(32501,4,36716,NULL,NULL,NULL),(32502,4,36717,NULL,NULL,NULL),(32503,4,3448,NULL,NULL,NULL),(32504,4,36465,NULL,NULL,NULL),(32505,4,36718,NULL,NULL,NULL),(32506,4,4611,NULL,NULL,NULL),(32507,4,36719,NULL,NULL,NULL),(32508,4,36720,NULL,NULL,NULL),(32509,4,36721,NULL,NULL,NULL),(32510,4,36466,NULL,NULL,NULL),(32511,4,36722,NULL,NULL,NULL),(32512,4,36467,NULL,NULL,NULL),(32513,4,36723,NULL,NULL,NULL),(32514,4,36724,NULL,NULL,NULL),(32515,4,36725,NULL,NULL,NULL),(32516,4,4612,NULL,NULL,NULL),(32517,4,36726,NULL,NULL,NULL),(32518,4,36468,NULL,NULL,NULL),(32519,4,36727,NULL,NULL,NULL),(32520,4,36728,NULL,NULL,NULL),(32521,4,36729,NULL,NULL,NULL),(32522,4,36730,NULL,NULL,NULL),(32523,4,36731,NULL,NULL,NULL),(32524,4,36732,NULL,NULL,NULL),(32525,4,36733,NULL,NULL,NULL),(32526,4,36734,NULL,NULL,NULL),(32527,4,36735,NULL,NULL,NULL),(32528,4,36469,NULL,NULL,NULL),(32529,4,3415,NULL,NULL,NULL),(32530,4,35614,NULL,NULL,NULL),(32531,4,31999,NULL,NULL,NULL),(32532,4,36736,NULL,NULL,NULL),(32533,4,36737,NULL,NULL,NULL),(32534,4,3449,NULL,NULL,NULL),(32535,4,14073,NULL,NULL,NULL),(32536,4,36470,NULL,NULL,NULL),(32537,4,36738,NULL,NULL,NULL),(32538,4,36471,NULL,NULL,NULL),(32539,4,36472,NULL,NULL,NULL),(32540,4,36473,NULL,NULL,NULL),(32541,4,36474,NULL,NULL,NULL),(32542,4,36739,NULL,NULL,NULL),(32543,4,36740,NULL,NULL,NULL),(32544,4,3450,NULL,NULL,NULL),(32545,4,36741,NULL,NULL,NULL),(32546,4,36742,NULL,NULL,NULL),(32547,4,3451,NULL,NULL,NULL),(32548,4,36743,NULL,NULL,NULL),(32549,4,36475,NULL,NULL,NULL),(32550,4,36744,NULL,NULL,NULL),(32551,4,36745,NULL,NULL,NULL),(32552,4,36746,NULL,NULL,NULL),(32553,4,36747,NULL,NULL,NULL),(32554,4,36748,NULL,NULL,NULL),(32555,4,36749,NULL,NULL,NULL),(32556,4,36750,NULL,NULL,NULL),(32557,4,36751,NULL,NULL,NULL),(32558,4,36752,NULL,NULL,NULL),(32559,4,36753,NULL,NULL,NULL),(32560,4,36754,NULL,NULL,NULL),(32561,4,36755,NULL,NULL,NULL),(32562,4,36756,NULL,NULL,NULL),(32563,4,36757,NULL,NULL,NULL),(32564,4,36758,NULL,NULL,NULL),(32565,4,36759,NULL,NULL,NULL),(32566,4,36760,NULL,NULL,NULL),(32567,4,36761,NULL,NULL,NULL),(32568,4,36762,NULL,NULL,NULL),(32569,4,28720,NULL,NULL,NULL),(32570,4,36763,NULL,NULL,NULL),(32571,4,36764,NULL,NULL,NULL),(32572,4,36765,NULL,NULL,NULL),(32573,4,36766,NULL,NULL,NULL),(32574,4,36767,NULL,NULL,NULL),(32575,4,36768,NULL,NULL,NULL),(32576,4,36769,NULL,NULL,NULL),(32577,4,36770,NULL,NULL,NULL),(32578,4,36771,NULL,NULL,NULL),(32579,4,36772,NULL,NULL,NULL),(32580,4,36773,NULL,NULL,NULL),(32581,4,36774,NULL,NULL,NULL),(32582,4,36775,NULL,NULL,NULL),(32583,4,36776,NULL,NULL,NULL),(32584,4,36777,NULL,NULL,NULL),(32585,4,36778,NULL,NULL,NULL),(32586,4,36779,NULL,NULL,NULL),(32587,4,36780,NULL,NULL,NULL);
/*!40000 ALTER TABLE `rates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recordings`
--

DROP TABLE IF EXISTS `recordings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recordings` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `src` varchar(255) NOT NULL,
  `dst` varchar(255) NOT NULL,
  `src_device_id` bigint(20) NOT NULL DEFAULT '0',
  `dst_device_id` bigint(20) NOT NULL DEFAULT '0',
  `call_id` bigint(20) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `path` varchar(255) NOT NULL DEFAULT '',
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  `send_time` datetime DEFAULT NULL,
  `comment` varchar(255) NOT NULL DEFAULT '',
  `size` decimal(30,15) DEFAULT '0.000000000000000',
  `uniqueid` varchar(30) DEFAULT '' COMMENT 'Name of recording',
  `visible_to_user` tinyint(4) DEFAULT '1' COMMENT 'Can user see it?',
  `dst_user_id` int(11) DEFAULT '0' COMMENT 'User which received call',
  `local` tinyint(4) DEFAULT '1' COMMENT 'is recording saved on GUI server',
  `visible_to_dst_user` tinyint(4) DEFAULT '1' COMMENT 'is recording visible to dst user?',
  PRIMARY KEY (`id`),
  KEY `uniqueidindex` (`uniqueid`(6)),
  KEY `visible_to_user` (`visible_to_user`),
  KEY `src_device_id` (`src_device_id`),
  KEY `visible_to_user_2` (`visible_to_user`),
  KEY `src_device_id_2` (`src_device_id`),
  KEY `visible_to_user_3` (`visible_to_user`),
  KEY `src_device_id_3` (`src_device_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recordings`
--

LOCK TABLES `recordings` WRITE;
/*!40000 ALTER TABLE `recordings` DISABLE KEYS */;
/*!40000 ALTER TABLE `recordings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rights`
--

DROP TABLE IF EXISTS `rights`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rights` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `controller` varchar(255) NOT NULL,
  `action` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `saved` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `rights_controoler_action` (`controller`,`action`),
  KEY `rights_controller_index` (`controller`),
  KEY `rights_action_index` (`action`)
) ENGINE=InnoDB AUTO_INCREMENT=1248 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rights`
--

LOCK TABLES `rights` WRITE;
/*!40000 ALTER TABLE `rights` DISABLE KEYS */;
INSERT INTO `rights` VALUES (4,'users','list','Users_list',0),(5,'users','hidden','Users_Hidden',0),(6,'users','hide','Users_Hide',0),(8,'users','create','Users_Create',0),(9,'users','edit','Users_Edit',0),(10,'users','update','Users_Update',0),(11,'users','destroy','Users_Destroy',0),(30,'users','device_groups','Users_device_groups',0),(31,'users','device_group_edit','Users_device_group_edit',0),(32,'users','device_group_update','Users_device_group_update',0),(33,'users','device_group_new','Users_device_group_new',0),(34,'users','device_group_create','Users_device_group_create',0),(35,'users','device_group_delete','Users_device_group_delete',0),(36,'users','personal_details','Users_personal_details',0),(37,'users','update_personal_details','Users_update_personal_details',0),(38,'users','custom_rates','Users_custom_rates',0),(39,'users','user_custom_rate_add_new','Users_user_custom_rate_add_new',0),(40,'users','user_delete_custom_rate','Users_user_delete_custom_rate',0),(41,'users','artg_destroy','Users_artg_destroy',0),(42,'users','ard_manage','Users_ard_manage',0),(43,'users','user_acustrates_full','Users_user_acustrates_full',0),(44,'users','user_ard_time_edit','Users_user_ard_time_edit',0),(45,'users','user_acustrates','User_user_acustrates',0),(46,'users','user_custom_rate_update','User_user_custom_rate_update',0),(47,'users','user_custom_rate_add','User_user_custom_rate_add',0),(48,'users','user_custom_rate_delete','Users_user_custom_rate_delete',0),(49,'users','check_owner_for_user','Users_check_owner_for_user',0),(58,'callc','index','Callc_index',0),(59,'callc','login','Callc_login',0),(60,'callc','try_to_login','Callc_try_to_login',0),(61,'callc','logout','Callc_logout',0),(62,'callc','main','Callc_main',0),(63,'callc','user_settings','Callc_user_settings',0),(64,'callc','ranks','Callc_ranks',0),(65,'callc','show_ranks','Callc_show_ranks',0),(66,'callc','realtime_stats','Callc_realtime_stats',0),(67,'callc','global_settings','Callc_global_settings',0),(68,'callc','reconfigure_globals','Callc_reconfigure_globals',0),(69,'callc','signup_start','Callc_signup_start',0),(70,'callc','signup_end','Callc_signup_end',0),(71,'users','set_user_last_name','Users_set_user_last_name',0),(72,'users','set_user_first_name','Users_set_user_first_name',0),(75,'accounting','generate_invoices','Accounting_generate_invoices',0),(76,'accounting','generate_invoices_status','Accounting_generate_invoices_status',0),(77,'accounting','invoices','Accounting_invoices',0),(78,'accounting','user_invoices','Accounting_user_invoices',0),(79,'accounting','pay_invoice','Accounting_pay_invoice',0),(80,'accounting','invoice_details','Accounting_invoice_details',0),(81,'accounting','user_invoice_details','Accounting_user_invoice_details',0),(82,'accounting','invoice_delete','Accounting_invoice_delete',0),(83,'accounting','invoice_header_pdf','Accounting_invoice_header_pdf',0),(84,'accounting','generate_invoice_pdf','Accounting_generate_invoice_pdf',0),(85,'accounting','invoice_detailed_helper_pdf','Accounting_invoice_detailed_helper_pdf',0),(86,'accounting','generate_invoice_detailed_pdf','Accounting_generate_invoice_detailed_pdf',0),(87,'accounting','generate_invoice_by_cid_pdf','Accounting_generate_invoice_by_cid_pdf',0),(88,'accounting','line_increment','Accounting_line_increment',0),(89,'accounting','generate_invoice_csv','Accounting_generate_invoice_csv',0),(90,'accounting','generate_invoice_detailed_csv','Accounting_generate_invoice_detailed_csv',0),(91,'vouchers','vouchers','Accounting_vouchers',0),(92,'vouchers','voucher_new','Accounting_voucher_new',0),(93,'vouchers','vouchers_create','Accounting_vouchers_create',0),(94,'vouchers','voucher_delete','Accounting_voucher_delete',0),(95,'vouchers','voucher_use','Accounting_voucher_use',0),(96,'vouchers','voucher_status','Accounting_voucher_status',0),(97,'vouchers','voucher_pay','Accounting_voucher_pay',0),(98,'accounting','generate_invoice_number','Accounting_generate_invoice_number',0),(101,'autodialer','campaigns','Autodialer_campaigns',0),(102,'autodialer','view_campaign_actions','Autodialer_view_campaign_actions',0),(103,'autodialer','user_campaigns','Autodialer_user_campaigns',0),(104,'autodialer','campaign_new','Autodialer_campaign_new',0),(105,'autodialer','campaign_create','Autodialer_campaign_create',0),(106,'autodialer','campaign_destroy','Autodialer_campaign_destroy',0),(107,'autodialer','campaign_edit','Autodialer_campaign_edit',0),(108,'autodialer','campaign_update','Autodialer_campaign_update',0),(109,'autodialer','campaign_change_status','Autodialer_campaign_change_status',0),(110,'autodialer','campaign_numbers','Autodialer_campaign_numbers',0),(111,'autodialer','delete_all_numbers','Autodialer_delete_all_numbers',0),(112,'autodialer','import_numbers_from_file','Autodialer_import_numbers_from_file',0),(113,'autodialer','reactivate_number','Autodialer_reactivate_number',0),(114,'autodialer','campaign_actions','Autodialer_campaign_actions',0),(115,'autodialer','action_add','Autodialer_action_add',0),(116,'autodialer','action_destroy','Autodialer_action_destroy',0),(117,'autodialer','action_edit','Autodialer_action_edit',0),(118,'autodialer','action_update','Autodialer_action_update',0),(119,'autodialer','play_rec','Autodialer_play_rec',0),(121,'phonebooks','add_new','Phonebooks_add_new',0),(122,'phonebooks','create','Phonebooks_create',0),(123,'phonebooks','destroy','Phonebooks_destroy',0),(124,'phonebooks','edit','Phonebooks_edit',0),(125,'phonebooks','index','Phonebooks_index',0),(126,'phonebooks','list','Phonebooks_list',0),(127,'phonebooks','set_phonebook_added','Phonebooks_set_phonebook_added',0),(128,'phonebooks','set_phonebook_name','Phonebooks_set_phonebook_name',0),(129,'phonebooks','set_phonebook_number','Phonebooks_set_phonebook_number',0),(130,'phonebooks','show','Phonebooks_show',0),(131,'phonebooks','update','Phonebooks_update',0),(132,'functions','action_finder','Functions_action_finder',0),(133,'functions','action_syncronise','Functions_action_syncronise',0),(134,'functions','activate_callback','Functions_activate_callback',0),(135,'functions','call_tracing','Functions_call_tracing',0),(136,'functions','call_tracing_device','Functions_call_tracing_device',0),(137,'functions','call_tracing_user','Functions_call_tracing_user',0),(138,'functions','callback','Functions_callback',0),(139,'functions','callback_from_url','Functions_callback_from_url',0),(140,'functions','currencies','Functions_currencies',0),(141,'functions','currency_add','Functions_currency_add',0),(142,'functions','currency_destroy','Functions_currency_destroy',0),(143,'functions','currency_edit','Functions_currency_edit',0),(144,'functions','currency_update','Functions_currency_update',0),(145,'functions','integrity_check','Functions_integrity_check',0),(146,'locations','localization','Functions_localization',0),(147,'locations','location_add','Functions_location_add',0),(148,'locations','location_change','Functions_location_change',0),(149,'locations','location_destroy','Functions_location_destroy',0),(150,'locations','location_devices','Functions_location_devices',0),(151,'locations','location_rule_add','Functions_location_rule_add',0),(152,'locations','location_rule_change_status','Functions_location_rule_change_status',0),(153,'locations','location_rule_destroy','Functions_location_rule_destroy',0),(154,'locations','location_rule_edit','Functions_location_rule_edit',0),(155,'locations','location_rule_update','Functions_location_rule_update',0),(156,'locations','location_rules','Functions_location_rules',0),(157,'functions','login_as','Functions_login_as',0),(158,'functions','login_as_execute','Functions_login_as_execute',0),(159,'functions','pbx_functions','Functions_pbx_functions',0),(160,'functions','pbx_functions_add','Functions_pbx_functions_add',0),(161,'functions','pbx_functions_destroy','Functions_pbx_functions_destroy',0),(162,'functions','pbx_functions_edit','Functions_pbx_functions_edit',0),(163,'functions','pbx_functions_update','Functions_pbx_functions_update',0),(164,'functions','permissions','Functions_permissions',0),(165,'functions','permissions_save','Functions_permissions_save',0),(166,'functions','reseller_settings','Functions_reseller_settings',0),(167,'functions','reseller_settings_change','Functions_reseller_settings_change',0),(168,'functions','reseller_settings_logo','Functions_reseller_settings_logo',0),(169,'functions','reseller_settings_logo_save','Functions_reseller_settings_logo_save',0),(170,'functions','reseller_settings_payments','Functions_reseller_settings_payments',0),(171,'functions','reseller_settings_payments_change','Functions_reseller_settings_payments_change',0),(172,'functions','right_create','Functions_right_create',0),(173,'functions','right_destroy','Functions_right_destroy',0),(174,'functions','right_new','Functions_right_new',0),(175,'functions','role_create','Functions_role_create',0),(176,'functions','role_destroy','Functions_role_destroy',0),(177,'functions','role_new','Functions_role_new',0),(178,'functions','settings','Functions_settings',0),(179,'functions','settings_change','Functions_settings_change',0),(181,'functions','settings_logo_save','Functions_settings_logo_save',0),(182,'functions','settings_payments','Functions_settings_payments',0),(183,'functions','settings_payments_change','Functions_settings_payments_change',0),(184,'functions','settings_vm','Functions_settings_vm',0),(185,'functions','settings_vm_change','Functions_settings_vm_change',0),(186,'functions','translations','Functions_translations',0),(187,'functions','translations_change_status','Functions_translations_change_status',0),(188,'functions','translations_refresh','Functions_translations_refresh',0),(189,'functions','translations_sort','Functions_translations_sort',0),(190,'functions','update_confline','Functions_update_confline',0),(191,'directions','create','Directions_create',0),(192,'destination_groups','dest_mass_update','Directions_dest_mass_update',0),(193,'destinations','create','Directions_destination_create',0),(194,'destinations','destroy','Directions_destination_destroy',0),(195,'destinations','edit','Directions_destination_edit',0),(196,'destination_groups','create','Directions_destination_group_create',0),(197,'destination_groups','destroy','Directions_destination_group_destroy',0),(198,'destination_groups','edit','Directions_destination_group_edit',0),(199,'destination_groups','new','Directions_destination_group_new',0),(200,'destination_groups','stats','Directions_destination_group_stats',0),(201,'destination_groups','update','Directions_destination_group_update',0),(202,'destination_groups','list','Directions_destination_groups_list',0),(203,'destinations','list','Directions_destination_list',0),(204,'destinations','new','Directions_destination_new',0),(205,'destinations','stats','Directions_destination_stats',0),(206,'destinations','update','Directions_destination_update',0),(207,'destination_groups','destinations_to_dg','Directions_destinations_to_dg',0),(208,'destination_groups','destinations_to_dg_update','Directions_destinations_to_dg_update',0),(209,'directions','destroy','Directions_destroy',0),(210,'destination_groups','dg_add_destinations','Directions_dg_add_destinations',0),(211,'destination_groups','dg_destination_delete','Directions_dg_destination_delete',0),(212,'directions','dg_destination_stats','Directions_dg_destination_stats',0),(213,'destination_groups','destinations','Directions_dg_list_destinations',0),(214,'destination_groups','dg_list_user_destinations','Directions_dg_list_user_destinations',0),(215,'destination_groups','dg_new_destinations','Directions_dg_new_destinations',0),(216,'directions','directions_stats','Directions_directions_stats',0),(217,'directions','edit','Directions_edit',0),(218,'directions','index','Directions_index',0),(219,'directions','list','Directions_list',0),(220,'directions','update','Directions_update',0),(221,'emails','create','Emails_create',0),(222,'emails','destroy','Emails_destroy',0),(223,'emails','edit','Emails_edit',0),(224,'emails','list','Emails_list',0),(225,'emails','list_users','Emails_list_users',0),(226,'emails','send_all','Emails_send_all',0),(227,'emails','send_emails','Emails_send_emails',0),(228,'emails','send_test','Emails_send_test',0),(229,'emails','update','Emails_update',0),(230,'ccshop','add_to_cart','Ccshop_add_to_cart',0),(231,'ccshop','call_list','Ccshop_call_list',0),(232,'ccshop','card_details','Ccshop_card_details',0),(233,'ccshop','checkout','Ccshop_checkout',0),(234,'ccshop','display_cart','Ccshop_display_cart',0),(235,'ccshop','empty_cart','Ccshop_empty_cart',0),(236,'ccshop','index','Ccshop_index',0),(237,'ccshop','list','Ccshop_list',0),(238,'ccshop','logout','Ccshop_logout',0),(239,'ccshop','paypal_complete','Ccshop_paypal_complete',0),(240,'ccshop','paypal_ipn','Ccshop_paypal_ipn',0),(241,'ccshop','remove_from_cart','Ccshop_remove_from_cart',0),(242,'ccshop','try_to_login','Ccshop_try_to_login',0),(243,'ccshop','tx_status','Ccshop_tx_status',0),(244,'payments','create','Payments_create',0),(245,'payments','delete_payment','Payments_delete_payment',0),(246,'payments','destroy','Payments_destroy',0),(247,'payments','edit','Payments_edit',0),(248,'payments','index','Payments_index',0),(249,'payments','list','Payments_list',0),(250,'payments','manual_payment','Payments_manual_payment',0),(251,'payments','manual_payment_finish','Payments_manual_payment_finish',0),(252,'payments','manual_payment_status','Payments_manual_payment_status',0),(253,'payments','paypal','Payments_paypal',0),(254,'payments','paypal_ipn','Payments_paypal_ipn',0),(255,'payments','paypal_pay','Payments_paypal_pay',0),(256,'payments','personal_payments','Payments_personal_payments',0),(257,'payments','show','Payments_show',0),(258,'payments','update','Payments_update',0),(259,'payments','webmoney','Payments_webmoney',0),(260,'payments','webmoney_fail','Payments_webmoney_fail',0),(261,'payments','webmoney_pay','Payments_webmoney_pay',0),(262,'payments','webmoney_result','Payments_webmoney_result',0),(263,'payments','webmoney_success','Payments_webmoney_success',0),(264,'cardgroups','cards_to_csv','Cardgroups_cards_to_csv',0),(265,'cardgroups','create','Cardgroups_create',0),(266,'cardgroups','destroy','Cardgroups_destroy',0),(267,'cardgroups','edit','Cardgroups_edit',0),(268,'cardgroups','index','Cardgroups_index',0),(269,'cardgroups','list','Cardgroups_list',0),(270,'cardgroups','show','Cardgroups_show',0),(271,'cardgroups','update','Cardgroups_update',0),(272,'services','create','Services_create',0),(273,'services','destroy','Services_destroy',0),(274,'services','edit','Services_edit',0),(275,'services','index','Services_index',0),(276,'services','list','Services_list',0),(277,'services','show','Services_show',0),(278,'services','subscription_create','Services_subscription_create',0),(279,'services','subscription_destroy','Services_subscription_destroy',0),(280,'services','subscription_edit','Services_subscription_edit',0),(281,'services','subscription_new','Services_subscription_new',0),(282,'services','subscription_update','Services_subscription_update',0),(283,'services','subscriptions_list','Services_subscriptions_list',0),(284,'services','update','Services_update',0),(285,'services','user_subscriptions','Services_user_subscriptions',0),(286,'stats','active_calls','Stats_active_calls',0),(287,'stats','active_calls_count','Stats_active_calls_count',0),(288,'stats','active_calls_show','Stats_active_calls_show',0),(289,'stats','all_users_detailed','Stats_all_users_detailed',0),(290,'stats','authorize_user','Stats_authorize_user',0),(291,'stats','call_list','Stats_call_list',0),(292,'stats','call_list_from_link','Stats_call_list_from_link',0),(293,'stats','call_list_to_csv','Stats_call_list_to_csv',0),(294,'stats','call_list_to_pdf','Stats_call_list_to_pdf',0),(295,'stats','cc_call_list','Stats_cc_call_list',0),(296,'stats','country_stats','Stats_country_stats',0),(297,'stats','faxes','Stats_faxes',0),(298,'stats','faxes_list','Stats_faxes_list',0),(299,'stats','generate_profit_pdf','Stats_generate_profit_pdf',0),(300,'stats','last_calls','Stats_last_calls',0),(301,'stats','loss_making_calls','Stats_loss_making_calls',0),(302,'stats','missed_calls','Stats_missed_calls',0),(303,'stats','new_calls','Stats_new_calls',0),(304,'stats','new_calls_list','Stats_new_calls_list',0),(305,'stats','profit','Stats_profit',0),(306,'stats','providers','Stats_providers',0),(307,'stats','providers_calls','Stats_providers_calls',0),(308,'stats','providers_calls_to_csv','Stats_providers_calls_to_csv',0),(309,'stats','providers_calls_to_pdf','Stats_providers_calls_to_pdf',0),(310,'stats','show_user_stats','Stats_show_user_stats',0),(311,'stats','user_logins','Stats_user_logins',0),(312,'stats','user_stats','Stats_user_stats',0),(313,'stats','users_finances','Stats_users_finances',0),(315,'api','callback','Api_callback',0),(316,'api','invoices','Api_invoices',0),(317,'api','login','Api_login',0),(318,'api','logout','Api_logout',0),(319,'users','index','Users_index',0),(320,'users','set_user_accounting_number','Users_set_user_accounting_number',0),(321,'users','set_user_agreement_date','Users_set_user_agreement_date',0),(322,'users','set_user_agreement_number','Users_set_user_agreement_number',0),(323,'users','set_user_allow_loss_calls','Users_set_user_allow_loss_calls',0),(324,'users','set_user_balance','Users_set_user_balance',0),(325,'users','set_user_blocked','Users_set_user_blocked',0),(327,'users','set_user_calltime_normative','Users_set_user_calltime_normative',0),(328,'users','set_user_clientid','Users_set_user_clientid',0),(329,'users','set_user_credit','Users_set_user_credit',0),(330,'users','set_user_frozen_balance','Users_set_user_frozen_balance',0),(331,'users','set_user_hash','Users_set_user_hash',0),(332,'users','set_user_hidden','Users_set_user_hidden',0),(333,'users','set_user_language','Users_set_user_language',0),(334,'users','set_user_logged','Users_set_user_logged',0),(335,'users','set_user_month_plan_perc','Users_set_user_month_plan_perc',0),(336,'users','set_user_month_plan_updated','Users_set_user_month_plan_updated',0),(337,'users','set_user_password','Users_set_user_password',0),(338,'users','set_user_postpaid','Users_set_user_postpaid',0),(339,'users','set_user_sales_this_month','Users_set_user_sales_this_month',0),(340,'users','set_user_sales_this_month_planned','Users_set_user_sales_this_month_planned',0),(341,'users','set_user_show_billing_info','Users_set_user_show_billing_info',0),(342,'users','set_user_show_in_realtime_stats','Users_set_user_show_in_realtime_stats',0),(343,'users','set_user_taxation_country','Users_set_user_taxation_country',0),(344,'users','set_user_uniquehash','Users_set_user_uniquehash',0),(345,'users','set_user_username','Users_set_user_username',0),(346,'users','set_user_usertype','Users_set_user_usertype',0),(347,'users','set_user_vat_number','Users_set_user_vat_number',0),(348,'users','set_user_vat_percent','Users_set_user_vat_percent',0),(349,'users','set_user_vouchers_disabled_till','Users_set_user_vouchers_disabled_till',0),(350,'users','show','Users_show',0),(351,'dids','assign_dp','Dids_assign_dp',0),(352,'dids','assign_to_dp','Dids_assign_to_dp',0),(353,'dids','assign_to_dp_old_disabled','Dids_assign_to_dp_old_disabled',0),(354,'dids','create','Dids_create',0),(355,'dids','destroy','Dids_destroy',0),(356,'dialplans','create','Dids_dialplan_create',0),(357,'dialplans','destroy','Dids_dialplan_destroy',0),(358,'dialplans','edit','Dids_dialplan_edit',0),(359,'dialplans','new','Dids_dialplan_new',0),(360,'dialplans','update','Dids_dialplan_update',0),(361,'dialplans','dialplans','Dids_dialplans',0),(362,'dids','did_rates','Dids_did_rates',0),(363,'dids','edit','Dids_edit',0),(364,'dids','edit_rate','Dids_edit_rate',0),(365,'dids','fix_did_rates','Dids_fix_did_rates',0),(366,'dids','index','Dids_index',0),(367,'dids','list','Dids_list',0),(368,'dids','quickforwarddid_destroy','Dids_quickforwarddid_destroy',0),(369,'dids','quickforwarddid_edit','Dids_quickforwarddid_edit',0),(370,'dids','quickforwarddid_update','Dids_quickforwarddid_update',0),(371,'dids','quickforwarddids','Dids_quickforwarddids',0),(372,'dids','set_didrate_connection_fee','Dids_set_didrate_connection_fee',0),(373,'dids','set_didrate_end_time','Dids_set_didrate_end_time',0),(374,'dids','set_didrate_increment_s','Dids_set_didrate_increment_s',0),(375,'dids','set_didrate_min_time','Dids_set_didrate_min_time',0),(376,'dids','set_didrate_rate','Dids_set_didrate_rate',0),(377,'dids','set_didrate_rate_type','Dids_set_didrate_rate_type',0),(378,'dids','set_didrate_start_time','Dids_set_didrate_start_time',0),(379,'dids','show','Dids_show',0),(380,'dids','update','Dids_update',0),(381,'cards','act','Cards_act',0),(382,'cards','act2','Cards_act2',0),(383,'cards','act_confirm','Cards_act_confirm',0),(384,'cards','card_pay','Cards_card_pay',0),(385,'cards','card_payment_finish','Cards_card_payment_finish',0),(386,'cards','card_payment_status','Cards_card_payment_status',0),(387,'cards','create','Cards_create',0),(388,'cards','destroy','Cards_destroy',0),(389,'cards','edit','Cards_edit',0),(390,'cards','index','Cards_index',0),(391,'cards','list','Cards_list',0),(392,'cards','set_card_balance','Cards_set_card_balance',0),(393,'cards','set_card_daily_charge_paid_till','Cards_set_card_daily_charge_paid_till',0),(394,'cards','set_card_first_use','Cards_set_card_first_use',0),(395,'cards','set_card_frozen_balance','Cards_set_card_frozen_balance',0),(396,'cards','set_card_number','Cards_set_card_number',0),(397,'cards','set_card_pin','Cards_set_card_pin',0),(398,'cards','set_card_sold','Cards_set_card_sold',0),(399,'cards','show','Cards_show',0),(400,'cards','update','Cards_update',0),(401,'recordings','calls2recordings','Recordings_calls2recordings',0),(402,'recordings','play_rec','Recordings_play_rec',0),(403,'recordings','set_user_accounting_number','Recordings_set_user_accounting_number',0),(404,'recordings','set_user_agreement_date','Recordings_set_user_agreement_date',0),(405,'recordings','set_user_agreement_number','Recordings_set_user_agreement_number',0),(406,'recordings','set_user_allow_loss_calls','Recordings_set_user_allow_loss_calls',0),(407,'recordings','set_user_balance','Recordings_set_user_balance',0),(408,'recordings','set_user_blocked','Recordings_set_user_blocked',0),(410,'recordings','set_user_calltime_normative','Recordings_set_user_calltime_normative',0),(411,'recordings','set_user_clientid','Recordings_set_user_clientid',0),(412,'recordings','set_user_credit','Recordings_set_user_credit',0),(413,'recordings','set_user_first_name','Recordings_set_user_first_name',0),(414,'recordings','set_user_frozen_balance','Recordings_set_user_frozen_balance',0),(415,'recordings','set_user_hash','Recordings_set_user_hash',0),(416,'recordings','set_user_hidden','Recordings_set_user_hidden',0),(417,'recordings','set_user_language','Recordings_set_user_language',0),(418,'recordings','set_user_last_name','Recordings_set_user_last_name',0),(419,'recordings','set_user_logged','Recordings_set_user_logged',0),(420,'recordings','set_user_month_plan_perc','Recordings_set_user_month_plan_perc',0),(421,'recordings','set_user_month_plan_updated','Recordings_set_user_month_plan_updated',0),(422,'recordings','set_user_password','Recordings_set_user_password',0),(423,'recordings','set_user_postpaid','Recordings_set_user_postpaid',0),(424,'recordings','set_user_sales_this_month','Recordings_set_user_sales_this_month',0),(425,'recordings','set_user_sales_this_month_planned','Recordings_set_user_sales_this_month_planned',0),(426,'recordings','set_user_show_billing_info','Recordings_set_user_show_billing_info',0),(427,'recordings','set_user_show_in_realtime_stats','Recordings_set_user_show_in_realtime_stats',0),(428,'recordings','set_user_taxation_country','Recordings_set_user_taxation_country',0),(429,'recordings','set_user_uniquehash','Recordings_set_user_uniquehash',0),(430,'recordings','set_user_username','Recordings_set_user_username',0),(431,'recordings','set_user_usertype','Recordings_set_user_usertype',0),(432,'recordings','set_user_vat_number','Recordings_set_user_vat_number',0),(433,'recordings','set_user_vat_percent','Recordings_set_user_vat_percent',0),(434,'recordings','set_user_vouchers_disabled_till','Recordings_set_user_vouchers_disabled_till',0),(435,'recordings','setup','Recordings_setup',0),(436,'recordings','show','Recordings_show',0),(437,'recordings','update_recordings','Recordings_update_recordings',0),(438,'devices','callflow','Devices_callflow',0),(439,'devices','callflow_device','Devices_callflow_device',0),(440,'devices','callflow_edit','Devices_callflow_edit',0),(441,'devices','cli_add','Devices_cli_add',0),(442,'devices','cli_delete','Devices_cli_delete',0),(443,'devices','cli_edit','Devices_cli_edit',0),(444,'devices','cli_update','Devices_cli_update',0),(445,'devices','create','Devices_create',0),(446,'devices','destroy','Devices_destroy',0),(447,'devices','device_all_details','Devices_device_all_details',0),(448,'devices','device_clis','Devices_device_clis',0),(449,'devices','device_dids','Devices_device_dids',0),(450,'devices','device_edit','Devices_device_edit',0),(451,'devices','device_extlines','Devices_device_extlines',0),(452,'devices','device_forward','Devices_device_forward',0),(453,'devices','device_update','Devices_device_update',0),(454,'devices','devices_all','Devices_devices_all',0),(455,'devices','edit','Devices_edit',0),(456,'devices','forwards','Devices_forwards',0),(457,'devices','group_forwards','Devices_group_forwards',0),(458,'devices','pdffaxemail_add','Devices_pdffaxemail_add',0),(459,'devices','pdffaxemail_destroy','Devices_pdffaxemail_destroy',0),(460,'devices','pdffaxemail_edit','Devices_pdffaxemail_edit',0),(461,'devices','pdffaxemail_new','Devices_pdffaxemail_new',0),(462,'devices','pdffaxemail_update','Devices_pdffaxemail_update',0),(463,'devices','set_pdffaxemail_email','Devices_set_pdffaxemail_email',0),(464,'devices','set_user_accounting_number','Devices_set_user_accounting_number',0),(465,'devices','set_user_agreement_date','Devices_set_user_agreement_date',0),(466,'devices','set_user_agreement_number','Devices_set_user_agreement_number',0),(467,'devices','set_user_allow_loss_calls','Devices_set_user_allow_loss_calls',0),(468,'devices','set_user_balance','Devices_set_user_balance',0),(469,'devices','set_user_blocked','Devices_set_user_blocked',0),(471,'devices','set_user_calltime_normative','Devices_set_user_calltime_normative',0),(472,'devices','set_user_clientid','Devices_set_user_clientid',0),(473,'devices','set_user_credit','Devices_set_user_credit',0),(474,'devices','set_user_first_name','Devices_set_user_first_name',0),(475,'devices','set_user_frozen_balance','Devices_set_user_frozen_balance',0),(476,'devices','set_user_hash','Devices_set_user_hash',0),(477,'devices','set_user_hidden','Devices_set_user_hidden',0),(478,'devices','set_user_language','Devices_set_user_language',0),(479,'devices','set_user_last_name','Devices_set_user_last_name',0),(480,'devices','set_user_logged','Devices_set_user_logged',0),(481,'devices','set_user_month_plan_perc','Devices_set_user_month_plan_perc',0),(482,'devices','set_user_month_plan_updated','Devices_set_user_month_plan_updated',0),(483,'devices','set_user_password','Devices_set_user_password',0),(484,'devices','set_user_postpaid','Devices_set_user_postpaid',0),(485,'devices','set_user_sales_this_month','Devices_set_user_sales_this_month',0),(486,'devices','set_user_sales_this_month_planned','Devices_set_user_sales_this_month_planned',0),(487,'devices','set_user_show_billing_info','Devices_set_user_show_billing_info',0),(488,'devices','set_user_show_in_realtime_stats','Devices_set_user_show_in_realtime_stats',0),(489,'devices','set_user_taxation_country','Devices_set_user_taxation_country',0),(490,'devices','set_user_uniquehash','Devices_set_user_uniquehash',0),(491,'devices','set_user_username','Devices_set_user_username',0),(492,'devices','set_user_usertype','Devices_set_user_usertype',0),(493,'devices','set_user_vat_number','Devices_set_user_vat_number',0),(494,'devices','set_user_vat_percent','Devices_set_user_vat_percent',0),(495,'devices','set_user_vouchers_disabled_till','Devices_set_user_vouchers_disabled_till',0),(496,'devices','show_devices','Devices_show_devices',0),(497,'devices','try_to_forward_device','Devices_try_to_forward_device',0),(498,'devices','user_device_clis','Devices_user_device_clis',0),(499,'devices','user_devices','Devices_user_devices',0),(500,'groups','add_member','Groups_add_member',0),(501,'groups','authorize_group_manager','Groups_authorize_group_manager',0),(502,'groups','callshop_management','Groups_callshop_management',0),(503,'groups','change_member_type','Groups_change_member_type',0),(504,'groups','create','Groups_create',0),(505,'groups','destroy','Groups_destroy',0),(506,'groups','edit','Groups_edit',0),(507,'groups','group_member_devices','Groups_group_member_devices',0),(508,'groups','index','Groups_index',0),(509,'groups','list','Groups_list',0),(510,'groups','manager_list','Groups_manager_list',0),(511,'groups','manager_members','Groups_manager_members',0),(512,'groups','member_stats','Groups_member_stats',0),(513,'groups','member_stats_update','Groups_member_stats_update',0),(514,'groups','members','Groups_members',0),(515,'groups','remove_member','Groups_remove_member',0),(516,'groups','show','Groups_show',0),(517,'groups','update','Groups_update',0),(518,'callc','debug','Callc_debug',0),(519,'callc','set_user_accounting_number','Callc_set_user_accounting_number',0),(520,'callc','set_user_agreement_date','Callc_set_user_agreement_date',0),(521,'callc','set_user_agreement_number','Callc_set_user_agreement_number',0),(522,'callc','set_user_allow_loss_calls','Callc_set_user_allow_loss_calls',0),(523,'callc','set_user_balance','Callc_set_user_balance',0),(524,'callc','set_user_blocked','Callc_set_user_blocked',0),(526,'callc','set_user_calltime_normative','Callc_set_user_calltime_normative',0),(527,'callc','set_user_clientid','Callc_set_user_clientid',0),(528,'callc','set_user_credit','Callc_set_user_credit',0),(529,'callc','set_user_first_name','Callc_set_user_first_name',0),(530,'callc','set_user_frozen_balance','Callc_set_user_frozen_balance',0),(531,'callc','set_user_hash','Callc_set_user_hash',0),(532,'callc','set_user_hidden','Callc_set_user_hidden',0),(533,'callc','set_user_language','Callc_set_user_language',0),(534,'callc','set_user_last_name','Callc_set_user_last_name',0),(535,'callc','set_user_logged','Callc_set_user_logged',0),(536,'callc','set_user_month_plan_perc','Callc_set_user_month_plan_perc',0),(537,'callc','set_user_month_plan_updated','Callc_set_user_month_plan_updated',0),(538,'callc','set_user_password','Callc_set_user_password',0),(539,'callc','set_user_postpaid','Callc_set_user_postpaid',0),(540,'callc','set_user_sales_this_month','Callc_set_user_sales_this_month',0),(541,'callc','set_user_sales_this_month_planned','Callc_set_user_sales_this_month_planned',0),(542,'callc','set_user_show_billing_info','Callc_set_user_show_billing_info',0),(543,'callc','set_user_show_in_realtime_stats','Callc_set_user_show_in_realtime_stats',0),(544,'callc','set_user_taxation_country','Callc_set_user_taxation_country',0),(545,'callc','set_user_uniquehash','Callc_set_user_uniquehash',0),(546,'callc','set_user_username','Callc_set_user_username',0),(547,'callc','set_user_usertype','Callc_set_user_usertype',0),(548,'callc','set_user_vat_number','Callc_set_user_vat_number',0),(549,'callc','set_user_vat_percent','Callc_set_user_vat_percent',0),(550,'callc','set_user_vouchers_disabled_till','Callc_set_user_vouchers_disabled_till',0),(551,'tariffs','analysis','Tariffs_analysis',0),(552,'tariffs','analysis2','Tariffs_analysis2',0),(553,'tariffs','ard_manage','Tariffs_ard_manage',0),(554,'tariffs','artg_destroy','Tariffs_artg_destroy',0),(555,'tariffs','bad_rows_from_csv','Tariffs_bad_rows_from_csv',0),(556,'tariffs','create','Tariffs_create',0),(557,'tariffs','day_add','Tariffs_day_add',0),(558,'tariffs','day_destroy','Tariffs_day_destroy',0),(559,'tariffs','day_edit','Tariffs_day_edit',0),(560,'tariffs','day_setup','Tariffs_day_setup',0),(561,'tariffs','day_update','Tariffs_day_update',0),(562,'tariffs','delete_all_rates','Tariffs_delete_all_rates',0),(563,'tariffs','destinations_csv','Tariffs_destinations_csv',0),(564,'tariffs','destroy','Tariffs_destroy',0),(565,'tariffs','dst_to_create_from_csv','Tariffs_dst_to_create_from_csv',0),(566,'tariffs','edit','Tariffs_edit',0),(567,'tariffs','generate_analysis_csv','Tariffs_generate_analysis_csv',0),(568,'tariffs','generate_personal_rates_csv','Tariffs_generate_personal_rates_csv',0),(569,'tariffs','generate_personal_rates_pdf','Tariffs_generate_personal_rates_pdf',0),(570,'tariffs','generate_personal_wholesale_rates_csv','Tariffs_generate_personal_wholesale_rates_csv',0),(571,'tariffs','generate_personal_wholesale_rates_pdf','Tariffs_generate_personal_wholesale_rates_pdf',0),(572,'tariffs','generate_provider_rates_pdf','Tariffs_generate_provider_rates_pdf',0),(573,'tariffs','generate_providers_rates_csv','Tariffs_generate_providers_rates_csv',0),(574,'tariffs','generate_user_rates_csv','Tariffs_generate_user_rates_csv',0),(575,'tariffs','generate_user_rates_pdf','Tariffs_generate_user_rates_pdf',0),(576,'tariffs','get_personal_rate_details','Tariffs_get_personal_rate_details',0),(577,'tariffs','get_provider_rate_details','Tariffs_get_provider_rate_details',0),(578,'tariffs','get_user_rate_details','Tariffs_get_user_rate_details',0),(579,'tariffs','import_csv','Tariffs_import_csv',0),(580,'tariffs','index','Tariffs_index',0),(581,'tariffs','list','Tariffs_list',0),(582,'tariffs','make_user_tariff','Tariffs_make_user_tariff',0),(583,'tariffs','make_user_tariff_status','Tariffs_make_user_tariff_status',0),(584,'tariffs','rate_destroy','Tariffs_rate_destroy',0),(585,'tariffs','rate_details','Tariffs_rate_details',0),(586,'tariffs','rate_import_status','Tariffs_rate_import_status',0),(587,'tariffs','rate_import_status_view','Tariffs_rate_import_status_view',0),(588,'tariffs','rate_new','Tariffs_rate_new',0),(589,'tariffs','rate_try_to_add','Tariffs_rate_try_to_add',0),(590,'tariffs','ratedetail_create','Tariffs_ratedetail_create',0),(591,'tariffs','ratedetail_destroy','Tariffs_ratedetail_destroy',0),(592,'tariffs','ratedetail_edit','Tariffs_ratedetail_edit',0),(593,'tariffs','ratedetail_new','Tariffs_ratedetail_new',0),(594,'tariffs','ratedetail_update','Tariffs_ratedetail_update',0),(595,'tariffs','ratedetails_manage','Tariffs_ratedetails_manage',0),(596,'tariffs','rates_list','Tariffs_rates_list',0),(597,'tariffs','tariffs_list','Tariffs_tariffs_list',0),(598,'tariffs','update','Tariffs_update',0),(599,'tariffs','user_advrates','Tariffs_user_advrates',0),(600,'tariffs','user_arates','Tariffs_user_arates',0),(601,'tariffs','user_arates_full','Tariffs_user_arates_full',0),(602,'tariffs','user_ard_time_edit','Tariffs_user_ard_time_edit',0),(603,'tariffs','user_rate_add','Tariffs_user_rate_add',0),(604,'tariffs','user_rate_delete','Tariffs_user_rate_delete',0),(605,'tariffs','user_rate_destroy','Tariffs_user_rate_destroy',0),(606,'tariffs','user_rate_update','Tariffs_user_rate_update',0),(607,'tariffs','user_rates','Tariffs_user_rates',0),(608,'tariffs','user_rates_list','Tariffs_user_rates_list',0),(609,'tariffs','user_rates_update','Tariffs_user_rates_update',0),(610,'lcrs','create','Lcrs_create',0),(611,'lcrs','destroy','Lcrs_destroy',0),(612,'lcrs','edit','Lcrs_edit',0),(613,'lcrs','index','Lcrs_index',0),(614,'lcrs','list','Lcrs_list',0),(615,'lcrs','provider_change_status','Lcrs_provider_change_status',0),(616,'lcrs','providers_list','Lcrs_providers_list',0),(617,'lcrs','providers_sort','Lcrs_providers_sort',0),(618,'lcrs','providers_sort_save','Lcrs_providers_sort_save',0),(619,'lcrs','remove_provider','Lcrs_remove_provider',0),(620,'lcrs','tariffs_list','Lcrs_tariffs_list',0),(621,'lcrs','try_to_add_provider','Lcrs_try_to_add_provider',0),(622,'lcrs','update','Lcrs_update',0),(648,'cdr','import_csv','Cdr_import_csv',0),(649,'cdr','rerating','Cdr_rerating',0),(650,'providers','create','Providers_create',0),(651,'providers','destroy','Providers_destroy',0),(652,'providers','edit','Providers_edit',0),(653,'providers','index','Providers_index',0),(654,'providers','list','Providers_list',0),(655,'providers','provider_rule_add','Providers_provider_rule_add',0),(656,'providers','provider_rule_change_status','Providers_provider_rule_change_status',0),(657,'providers','provider_rule_destroy','Providers_provider_rule_destroy',0),(658,'providers','provider_rule_edit','Providers_provider_rule_edit',0),(659,'providers','provider_rule_update','Providers_provider_rule_update',0),(660,'providers','provider_rules','Providers_provider_rules',0),(661,'providers','set_providerrule_add','Providers_set_providerrule_add',0),(662,'providers','set_providerrule_cut','Providers_set_providerrule_cut',0),(663,'providers','set_providerrule_enabled','Providers_set_providerrule_enabled',0),(664,'providers','set_providerrule_maxlen','Providers_set_providerrule_maxlen',0),(665,'providers','set_providerrule_minlen','Providers_set_providerrule_minlen',0),(666,'providers','set_providerrule_name','Providers_set_providerrule_name',0),(667,'providers','show','Providers_show',0),(668,'providers','update','Providers_update',0),(669,'devices','new','Devices_new',0),(670,'cardgroups','new','Cardgroups_new',0),(671,'cards','new','Cards_new',0),(672,'dids','new','Dids_new',0),(673,'directions','new','Directions_new',0),(674,'emails','new','Emails_new',0),(675,'groups','new','Groups_new',0),(676,'lcrs','new','Lcrs_new',0),(677,'payments','new','Payments_new',0),(678,'phonebooks','new','Phonebooks_new',0),(679,'providers','new','Providers_new',0),(680,'services','new','Services_new',0),(681,'tariffs','new','Tariffs_new',0),(682,'users','new','Users_new',0),(683,'functions','create_call_file','Functions_create_call_file',0),(688,'functions','pbx_function_add','Functions_pbx_function_add',0),(689,'functions','pbx_function_destroy','Functions_pbx_function_destroy',0),(690,'functions','pbx_function_edit','Functions_pbx_function_edit',0),(691,'functions','pbx_function_update','Functions_pbx_function_update',0),(692,'cards','import_from_csv','Cards_import_from_csv',0),(693,'functions','settings_logo','Functions_settings_logo',0),(694,'providers','set_providerrule_pr_type','Providers_set_providerrule_pr_type',0),(695,'functions','dump_permissions','Functions_dump_permissions',0),(696,'accounting','send_invoices','Accounting_send_invoices',0),(697,'functions','style','Functions_style',0),(698,'users','set_user_send_invoice_types','Users_set_user_send_invoice_types',0),(699,'recordings','set_user_send_invoice_types','Recordings_set_user_send_invoice_types',0),(700,'devices','set_user_send_invoice_types','Devices_set_user_send_invoice_types',0),(701,'accounting','send_email_with_attachment','Accounting_send_email_with_attachment',0),(702,'callc','set_user_send_invoice_types','Callc_set_user_send_invoice_types',0),(703,'stylesheets','rcss','Stylesheets_rcss',0),(704,'stylesheets','show','Stylesheets_show',0),(705,'stylesheets','style','Stylesheets_style',0),(706,'payments','linkpoint','Payments_linkpoint',0),(707,'payments','linkpoint_pay','Payments_linkpoint_pay',0),(708,'servers','list','Servers_list',0),(709,'servers','server_change_status','Servers_server_change_status',0),(901,'stats','last_calls_stats','Stats_last_calls_stats',0),(911,'stats','system_stats','Stats_system_stats',0),(921,'stats','provider_hangup_cause_codes','Stats_provider_hangup_cause_codes',0),(931,'stats','dids','Stats_dids',0),(941,'stats','dids_usage','Stats_dids_usage',0),(942,'callc','daily_actions','Callc_daily_actions',0),(943,'callcenter','task_list','Callcenter_task_list',0),(944,'callcenter','next_client','Callcenter_next_client',0),(945,'callcenter','agent_workplace','Callcenter_agent_workplace',0),(946,'callcenter','call_to','Callcenter_call_to',0),(947,'callc','hourly_actions','Callc_hourly_actions',0),(948,'backups','backup_create','Backups_backup_create',0),(949,'backups','backups_hourly_cronjob','Backups_backups_hourly_cronjob',0),(950,'cardgroups','loss_calls','Cardgroups_loss_calls',0),(951,'cardgroups','invoices','Cardgroups_invoices',0),(952,'users','default_user','Users_default_user',0),(953,'tariffs','change_tariff_for_users','Tariffs_change_tariff_for_users',0),(954,'users','default_user_update','Users_default_user_update',0),(955,'devices','default_device','Devices_default_device',0),(956,'devices','default_device_update','Devices_default_device_update',0),(958,'functions','test_text','Functions_send_test_email',0),(959,'emails','show_emails','Emails_show_emails',0),(960,'recordings','recordings','Recordings_recordings',0),(961,'backups','backup_download','Backups_backup_download',0),(962,'backups','backup_restore','Backups_backup_restore',0),(963,'backups','backup_destroy','Backups_backup_destroy',0),(964,'backups','backup_manager','Backups_backup_manager',0),(965,'backups','backup_new','Backups_backup_new',0),(966,'stats','google_maps','Stats_google_maps',0),(967,'permissions','group_create','Permissions_group_create',0),(968,'permissions','group_destroy','Permissions_group_destroy',0),(969,'permissions','group_edit','Permissions_group_edit',0),(970,'permissions','group_update','Permissions_group_update',0),(971,'permissions','groups_list','Permissions_group_list',0),(972,'services','subscriptions','Services_subscriptions',0),(973,'dids','confirm_did','Dids_confirm_did',0),(974,'services','subscription_confirm_destroy','Services_subscription_confirm_destroy',0),(975,'providers','provider_test','Providers_test',0),(976,'callc','test_pdf_generation','Callc_test_pdf_generation',0),(977,'sms','sms_result','Sms_sms_result',0),(978,'ivr','update_voice','Ivr_update_voice',0),(979,'ivr','update_sound_file','Ivr_update_sound_file',0),(980,'ivr','edit_voice','Ivr_edit_voice',0),(981,'ivr','play_sound','Ivr_play_sound',0),(982,'ivr','edit_sound_file','Ivr_sound_file',0),(983,'ivr','destroy_sound_file','Ivr_destroy_sound_file',0),(984,'api','ma_activate','Api_ma_activate',0),(985,'devices','devices_weak_passwords','devices_devices_weak_passwords',0),(986,'cardgroups','cardgroups_stats','Cardgroups_cardgroups_stats',0),(987,'ivr','index','ivr_index',0),(988,'ivr','list','ivr_list',0),(989,'ivr','list_voice','ivr_list_voice',0),(990,'ivr','new_voice','ivr_new_voice',0),(991,'ivr','create_voice','ivr_create_voice',0),(992,'ivr','destroy_voice','ivr_destroy_voice',0),(993,'ivr','new_sound_file','ivr_new_sound_file',0),(994,'ivr','create_sound_file','ivr_create_sound_file',0),(995,'ivr','list_timeperiod','ivr_list_timeperiod',0),(996,'ivr','new_timeperiod','ivr_new_timeperiod',0),(997,'ivr','create_timeperiod','ivr_create_timeperiod',0),(998,'ivr','destroy_timeperiod','ivr_destroy_timeperiod',0),(999,'ivr','edit_timeperiod','ivr_edit_timeperiod',0),(1000,'ivr','update_timeperiod','ivr_update_timeperiod',0),(1001,'ivr','settings','ivr_settings',0),(1002,'ivr','settings_change','ivr_settings_change',0),(1003,'ivr','list_ivr','ivr_list_ivr',0),(1004,'ivr','new_ivr','ivr_new_ivr',0),(1005,'ivr','create_ivr','ivr_create_ivr',0),(1006,'ivr','edit_ivr','ivr_edit_ivr',0),(1007,'ivr','action_params','ivr_action_params',0),(1008,'ivr','update_block_name','ivr_update_block_name',0),(1009,'ivr','update_ivr_name','ivr_update_ivr_name',0),(1010,'ivr','update_block_timeout_digits','ivr_update_block_timeout_digits',0),(1011,'ivr','update_block_timeout_response','ivr_update_block_timeout_response',0),(1012,'ivr','update_data1','ivr_update_data1',0),(1013,'ivr','update_data2','ivr_update_data2',0),(1014,'ivr','extension_extent','ivr_extension_extent',0),(1015,'ivr','extension_block','ivr_extension_block',0),(1016,'ivr','add_ivr_action','ivr_add_ivr_action',0),(1017,'ivr','add_ivr_extension','ivr_add_ivr_extension',0),(1018,'ivr','add_block','ivr_add_block',0),(1019,'ivr','refresh_edit_window','ivr_refresh_edit_window',0),(1020,'ivr','change_block','ivr_change_block',0),(1021,'ivr','ivr_extlines','ivr_ivr_extlines',0),(1022,'ivr','destroy_ivr','ivr_destroy_ivr',0),(1023,'recordings','bulk_delete','Recordings_bulk_delete',0),(1024,'recordings','bulk_management','Recordings_bulk_management',0),(1025,'dids','dids_interval_assign_dialplan','dids_dids_interval_assign_dialplan',0),(1026,'dids','personal_dids','dids_personal_dids',0),(1027,'stats','reseller_all_user_stats','stats_reseller_all_user_stats',0),(1028,'stats','action_log','stats_action_log',0),(1029,'permissions','index','permissions_index',0),(1030,'permissions','group_destory','permissions_group_destory',0),(1031,'dids','bulk_management','dids_bulk_management',0),(1032,'currencies','currencies','currencies_currencies',0),(1033,'functions','settings_addons','functions_settings_addons',0),(1034,'devices','clis','devices_clis',0),(1035,'functions','import_user_data','functions_import_user_data',0),(1036,'cardgroups','aggregate','cardgroups_aggregate',0),(1037,'stats','resellers','stats_resellers',0),(1038,'stats','calls_by_scr','stats_calls_by_scr',0),(1039,'stats','calls_per_day','stats_calls_per_day',0),(1040,'stats','load_stats','stats_load_stats',0),(1041,'stats','first_activity','stats_first_activity',0),(1042,'stats','hangup_cause_codes_stats','stats_hangup_cause_codes_stats',0),(1043,'stats','prefix_finder','stats_prefix_finder',0),(1044,'stats','subscriptions_stats','stats_subscriptions_stats',0),(1045,'recordings','list_users','recordings_list_users',0),(1046,'calls','aggregate','calls_aggregate',0),(1047,'calls','summary','calls_summary',0),(1048,'servers','edit','servers_edit',0),(1049,'servers','server_add','servers_server_add',0),(1050,'servers','server_update','servers_server_update',0),(1051,'servers','delete','servers_delete',0),(1052,'servers','destroy','servers_destroy',0),(1053,'servers','server_providers','servers_server_providers',0),(1054,'servers','add_provider_to_server','servers_add_provider_to_server',0),(1055,'dids','dids_export_to_csv','dids_dids_export_to_csv',0),(1056,'accounting','generate_invoice_destinations_csv','accounting_generate_invoice_destinations_csv',0),(1057,'accounting','generate_invoice_by_cid_csv','accounting_generate_invoice_by_cid_csv',0),(1058,'providers','terminators','providers_terminators',0),(1059,'providers','terminator_edit','providers_terminator_edit',0),(1060,'providers','terminator_providers','providers_terminator_providers',0),(1061,'providers','terminator_destory','providers_terminator_destory',0),(1062,'lcrs','details_by_destinations','lcrs_details_by_destinations',0),(1063,'lcrs','details','lcrs_details',0),(1064,'dialplans','list_extlines','dids_list_extlines',0),(1065,'payments','payments_csv','payments_payments_csv',0),(1066,'vouchers','bulk_management','vouchers_bulk_management',0),(1067,'devices','cli_device_edit','devices_cli_device_edit',0),(1068,'devices','cli_device_delete','devices_cli_device_delete',0),(1069,'functions','import_user_data_users','functions_import_user_data_users',0),(1070,'functions','import_user_data_devices','functions_import_user_data_devices',0),(1071,'functions','import_user_data_dids','functions_import_user_data_dids',0),(1072,'vouchers','vouchers_list_to_csv','vouchers_vouchers_list_to_csv',0),(1073,'terminators','list','Terminators_list',0),(1074,'terminators','index','Terminators_index',0),(1075,'terminators','create','Terminators_create',0),(1076,'terminators','destroy','Terminators_destroy',0),(1077,'terminators','edit','Terminators_edit',0),(1078,'terminators','update','Terminators_update',0),(1079,'terminators','provider','Terminators_provider',0),(1080,'terminators','provider_add','Terminators_provider_add',0),(1081,'terminators','provider_remove','Terminators_provider_remove',0),(1082,'providers','hide','Providers_hide',0),(1083,'lcrs','create_prefix_lcr_partials','Lcrs_create_prefix_lcr_partials',0),(1084,'lcrs','prefix_finder_find_country','Lcrs_prefix_finder_find_country',0),(1085,'lcrs','lcrpartial_destinations','Lcrs_lcrpartial_destinations',0),(1086,'lcrs','lcrpartial_edit','Lcrs_lcrpartial_edit',0),(1087,'lcrs','update_lcrpartial','Lcrs_update_lcrpartial',0),(1088,'lcrs','lcrpartial_destroy','Lcrs_lcrpartial_destroy',0),(1089,'lcrs','providers_percent','Lcrs_providers_percent',0),(1090,'lcrs','find_lcr_from_id','Lcrs_find_lcr_from_id',0),(1091,'lcrs','find_lcr_partial_from_id','Lcrs_find_lcr_partial_from_id',0),(1092,'destination_groups','bulk_management_confirmation','destination_groups_bulk_management_confirmation',0),(1093,'destination_groups','bulk_assign','destination_groups_bulk_assign',0),(1094,'dialplans','did_assign_to_dp','dialplans_did_assign_to_dp',0),(1095,'pbxfunctions','destroy','pbxfunctions_destroy',0),(1096,'pbxfunctions','create','pbxfunctions_create',0),(1097,'pbxfunctions','update','pbxfunctions_update',0),(1098,'pbxfunctions','set_allow','pbxfunctions_set_allow',0),(1099,'pbxfunctions','list','pbxfunctions_list',0),(1100,'quickforwards_rules','destroy','quickforwards_rules_destroy',0),(1101,'quickforwards_rules','create','quickforwards_rules_create',0),(1102,'quickforwards_rules','update','quickforwards_rules_update',0),(1103,'quickforwards_rules','new','quickforwards_rules_new',0),(1104,'quickforwards_rules','edit','quickforwards_rules_edit',0),(1105,'quickforwards_rules','list','quickforwards_rules_list',0),(1106,'ivr','new','ivr_new',0),(1107,'ivr','create','ivr_create',0),(1108,'ivr','edit','ivr_edit',0),(1109,'ivr','destroy','ivr_destroy',0),(1110,'ivr_sound_files','new','ivr_sound_files_edit',0),(1111,'ivr_sound_files','create','ivr_sound_files_create',0),(1112,'ivr_sound_files','edit','ivr_sound_files_edit',0),(1113,'ivr_sound_files','update','ivr_sound_files_update',0),(1114,'ivr_sound_files','destroy','ivr_sound_files_destroy',0),(1115,'ivr_sound_files','play_sound','ivr_sound_files_play_sound',0),(1116,'ivr_time_priods','index','ivr_time_priods_index',0),(1117,'ivr_time_priods','new','ivr_time_priods_new',0),(1118,'ivr_time_priods','create','ivr_time_priods_create',0),(1119,'ivr_time_priods','destroy','ivr_time_priods_destroy',0),(1120,'ivr_time_priods','edit','ivr_time_priods_edit',0),(1121,'ivr_time_priods','update','ivr_time_priods_update',0),(1122,'ivrvoices','index','ivrvoices_index',0),(1123,'ivrvoices','new','ivrvoices_new',0),(1124,'ivrvoices','create','ivrvoices_create',0),(1125,'ivrvoices','destroy','ivrvoices_destroy',0),(1126,'ivrvoices','edit','ivrvoices_edit',0),(1127,'ivrvoices','update','ivrvoices_update',0),(1128,'functions','skype','functions_skype',0),(1129,'functions','skype_change_default_provider','functions_skype_change_default_provider',0),(1130,'cron_actions','index','cron_actions_index',0),(1131,'cron_actions','new','cron_actions_new',0),(1132,'cron_actions','create','cron_actions_create',0),(1133,'cron_actions','destroy','cron_actions_destroy',0),(1134,'cron_actions','edit','cron_actions_edit',0),(1135,'cron_actions','update','cron_actions_update',0),(1136,'stats','providers_stats','stats_providers_stats',0),(1137,'resellers','settings','resellers_settings',0),(1138,'ringgroups','index','ringgroups_index',0),(1139,'ringgroups','new','ringgroups_new',0),(1140,'ringgroups','create','ringgroups_create',0),(1141,'ringgroups','show','ringgroups_show',0),(1142,'ringgroups','edi','ringgroups_edi',0),(1143,'ringgroups','destroy','ringgroups_destroy',0),(1144,'ringgroups','assign_device','ringgroups_assign_device',0),(1145,'ringgroups','show_dids','ringgroups_show_dids',0),(1146,'ringgroups','show_devices','ringgroups_show_devices',0),(1147,'ringgroups','show_extlines','ringgroups_show_extlines',0),(1148,'ringgroups','device_sort','ringgroups_device_sort',0),(1149,'ringgroups','update','ringgroups_update',0),(1150,'ringgroups','free_user_devices','ringgroups_free_user_devices',0),(1151,'ringgroups','delete_device','ringgroups_delete_device',0),(1152,'providers','custom_use_providers','providers_custom_use_providers',0),(1153,'providers','add_custom_use_providers','providers_add_custom_use_providers',0),(1154,'providers','edit_custom_use_providers','providers_edit_custom_use_providers',0),(1155,'providers','update_custom_use_providers','providers_update_custom_use_providers',0),(1156,'providers','remove_custom_use_providers','providers_remove_custom_use_providers',0),(1157,'common_use_providers','index','common_use_providers_index',0),(1158,'common_use_providers','create','common_use_providers_create',0),(1159,'common_use_providers','edit','common_use_providers_edit',0),(1160,'common_use_providers','update','common_use_providers_update',0),(1161,'common_use_providers','destroy','common_use_providers_destroy',0),(1162,'common_use_providers','let_resellers_use_all_common_use_providers','common_use_providers_let_resellers_use_all_common_use_providers',0),(1163,'cdr','cli_add','cdr_cli_add',0),(1164,'cdr','fix_bad_cdr','cdr_fix_bad_cdr',0),(1165,'cdr','not_import_bad_cdr','cdr_not_import_bad_cdr',0),(1166,'cards','bad_cards','cards_bad_cards',0),(1167,'dids','list_extlines','dids_list_extlines',0),(1168,'cards','user_list','cards_user_list',0),(1169,'cards','card_active','cards_card_active',0),(1170,'cards','card_active_bulk','cards_card_active_bulk',0),(1171,'cards','bullk_for_activate','cards_bullk_for_activate',0),(1172,'cards','bulk_confirm','cards_bulk_confirm',0),(1173,'erp','settings','erp_settings',0),(1174,'erp','settings_update','erp_settings_update',0),(1175,'did_rates','index','did_rates_index',0),(1176,'did_rates','edit','did_rates_edit',0),(1177,'did_rates','update','did_rates_update',0),(1178,'did_rates','manage','did_rates_manage',0),(1179,'tariffs','ghost_percent_edit','tariffs_ghost_percent_edit',0),(1180,'tariffs','ghost_percent_update','tariffs_ghost_percent_update',0),(1181,'device_rules','list','device_rules_list',0),(1182,'device_rules','create','device_rules_create',0),(1183,'device_rules','change_status','device_rules_change_status',0),(1184,'device_rules','destroy','device_rules_destroy',0),(1185,'device_rules','edit','device_rules_edit',0),(1186,'device_rules','update','device_rules_update',0),(1187,'autodialer','export_call_data_to_csv','autodialer_export_call_data_to_csv',0),(1188,'functions','webphone_settings','functions_webphone_settings',0),(1189,'functions','webphone_settings_update','functions_webphone_settings_update',0),(1190,'functions','mohs','Function_mohs',0),(1191,'functions','moh_edit','Function_moh_edit',0),(1192,'functions','moh_new','Function_moh_new',0),(1193,'functions','moh_destroy','Function_moh_destroy',0),(1194,'functions','moh_save','Function_moh_save',0),(1195,'functions','moh_update','Function_moh_update',0),(1196,'ast_queues','list','queues_list',0),(1197,'ast_queues','edit','queues_edit',0),(1198,'ast_queues','destroy','queues_destroy',0),(1199,'ast_queues','create','queues_create',0),(1200,'ast_queues','update','queues_create',0),(1201,'ast_queues','new','queues_edit',0),(1202,'callc','additional_modules','callc_additional_modules',0),(1203,'smsautodialer','user_campaigns','User_campaigns',0),(1204,'smsautodialer','index','Index',0),(1205,'smsautodialer','campaigns','Campaigns',0),(1206,'smsautodialer','view_campaign_actions','View_campaign_actions',0),(1207,'smsautodialer','campaign_new','Campaign_new',0),(1208,'smsautodialer','campaign_change_status','Campaign_change_status',0),(1209,'smsautodialer','campaign_numbers','Campaign_numbers',0),(1210,'smsautodialer','delete_all_numbers','Delete_all_numbers',0),(1211,'smsautodialer','import_numbers_from_file','Import_numbers_from_file',0),(1212,'smsautodialer','bad_numbers_from_csv','Bad_numbers_from_csv',0),(1213,'smsautodialer','reactivate_number','Reactivate_number',0),(1214,'smsautodialer','campaign_actions','Campaign_actions',0),(1215,'smsautodialer','action_add','Action_add',0),(1216,'smsautodialer','action_destroy','Action_destroy',0),(1217,'smsautodialer','play_rec','Play_rec',0),(1218,'smsautodialer','redial_all_failed_calls','Redial_all_failed_calls',0),(1219,'smsautodialer','campaign_statistics','Campaign_statistics',0),(1220,'smsautodialer','export_call_data_to_csv','Export_call_data_to_csv',0),(1221,'alerts','index','Index',0),(1222,'alerts','alert_new','Alert_new',0),(1223,'alerts','alert_edit','Alert_edit',0),(1224,'alerts','alert_limitations','Alert_limitations',0),(1225,'alerts','contacts','Contacts',0),(1226,'alerts','contact_toggle','Contact_toggle',0),(1227,'alerts','alert_toggle','Alert_toggle',0),(1228,'alerts','contact_add','Contact_add',0),(1229,'alerts','schedule_add','Schedule_add',0),(1230,'alerts','schedule_edit','Schedule_edit',0),(1231,'alerts','contact_edit','Contact_edit',0),(1232,'alerts','schedules','Schedules',0),(1233,'alerts','groups','Groups',0),(1234,'alerts','group_add','Group_add',0),(1235,'alerts','group_contacts','Group_contacts',0),(1236,'alerts','group_contact_add','Group_contact_add',0),(1237,'alerts','group_toggle','Group_toggle',0),(1238,'alerts','group_edit','Group_edit',0),(1239,'alerts','schedule_toggle','Schedule_toggle',0),(1240,'alerts','new_schedule','New_schedule',0),(1241,'alerts','drop_period','Drop_period',0),(1242,'autodialer','number_destroy','Number_destroy',0),(1243,'smsautodialer','number_destroy','SMS_number_destroy',0),(1244,'pbx_functions','pbx_pool_users','Pbx_pool_users',0),(1245,'pbx_functions','pbx_pool_users_update','Pbx_pool_users_update',0),(1246,'pbx_functions','pbx_pool_new','Pbx_pool_new',0),(1247,'pbx_functions','pbx_pool_edit','Pbx_pool_edit',0);
/*!40000 ALTER TABLE `rights` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ringgroups`
--

DROP TABLE IF EXISTS `ringgroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ringgroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `comment` text,
  `timeout` int(11) DEFAULT NULL,
  `options` varchar(255) DEFAULT NULL,
  `strategy` enum('ringall','hunt','memoryhunt','ringall-prim','hunt-prim','memoryhunt-prim','firstavailable','firstnotonphone') NOT NULL DEFAULT 'ringall',
  `cid_prefix` varchar(255) DEFAULT NULL,
  `did_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ringgroups`
--

LOCK TABLES `ringgroups` WRITE;
/*!40000 ALTER TABLE `ringgroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `ringgroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ringgroups_devices`
--

DROP TABLE IF EXISTS `ringgroups_devices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ringgroups_devices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ringgroup_id` int(11) NOT NULL,
  `device_id` int(11) NOT NULL,
  `priority` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ringgroups_devices`
--

LOCK TABLES `ringgroups_devices` WRITE;
/*!40000 ALTER TABLE `ringgroups_devices` DISABLE KEYS */;
/*!40000 ALTER TABLE `ringgroups_devices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_rights`
--

DROP TABLE IF EXISTS `role_rights`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_rights` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `right_id` int(11) NOT NULL,
  `permission` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `role_rights_index2` (`role_id`,`right_id`),
  KEY `role_rights_index` (`role_id`,`right_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5755 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_rights`
--

LOCK TABLES `role_rights` WRITE;
/*!40000 ALTER TABLE `role_rights` DISABLE KEYS */;
INSERT INTO `role_rights` VALUES (89,9,5,0),(90,9,4,0),(91,9,6,0),(92,9,7,0),(93,9,8,0),(94,9,9,0),(95,9,10,0),(96,9,11,0),(97,9,43,0),(98,9,42,0),(99,9,41,0),(100,9,40,0),(101,9,39,0),(102,9,38,0),(103,9,36,1),(104,9,37,1),(105,9,35,0),(106,9,34,0),(107,9,33,0),(108,9,32,0),(109,9,31,0),(110,9,30,0),(111,9,44,0),(112,9,45,0),(113,9,46,0),(114,9,47,0),(115,9,48,0),(116,9,49,0),(117,6,5,1),(118,6,4,1),(119,6,6,1),(120,6,7,1),(121,6,8,1),(122,6,9,1),(123,6,10,1),(124,6,11,1),(125,6,43,1),(126,6,42,1),(127,6,41,1),(128,6,40,1),(129,6,39,1),(130,6,38,1),(131,6,36,1),(132,6,37,1),(133,6,35,1),(134,6,34,1),(135,6,33,1),(136,6,32,1),(137,6,31,1),(138,6,30,1),(139,6,44,1),(140,6,45,1),(141,6,46,1),(142,6,47,1),(143,6,48,1),(144,6,49,1),(145,8,5,1),(146,8,4,1),(147,8,6,1),(148,8,7,1),(149,8,8,1),(150,8,9,1),(151,8,10,1),(152,8,11,1),(153,8,43,1),(154,8,42,1),(155,8,41,0),(156,8,40,1),(157,8,39,1),(158,8,38,1),(159,8,36,1),(160,8,37,1),(161,8,35,1),(162,8,34,1),(163,8,33,1),(164,8,32,1),(165,8,31,1),(166,8,30,1),(167,8,44,1),(168,8,45,1),(169,8,46,1),(170,8,47,1),(171,8,48,1),(172,8,49,0),(213,16,4,0),(214,16,5,0),(215,16,6,0),(216,16,7,0),(217,16,8,0),(218,16,9,0),(219,16,10,0),(220,16,11,0),(221,16,30,0),(222,16,31,0),(223,16,32,0),(224,16,33,0),(225,16,34,0),(226,16,35,0),(227,16,36,0),(228,16,37,0),(229,16,38,0),(230,16,39,0),(231,16,40,0),(232,16,41,0),(233,16,42,0),(234,16,43,0),(235,16,44,0),(236,16,45,0),(237,16,46,0),(238,16,47,0),(239,16,48,0),(240,16,49,0),(241,9,58,1),(242,6,58,1),(243,8,58,1),(244,16,58,1),(245,9,59,1),(246,6,59,1),(247,8,59,1),(248,16,59,1),(249,9,60,1),(250,6,60,1),(251,8,60,1),(252,16,60,1),(253,9,61,1),(254,6,61,1),(255,8,61,1),(256,16,61,0),(257,9,62,1),(258,6,62,1),(259,8,62,1),(260,16,62,1),(261,9,63,1),(262,6,63,1),(263,8,63,1),(264,16,63,0),(265,9,64,0),(266,6,64,1),(267,8,64,0),(268,16,64,0),(269,9,65,0),(270,6,65,1),(271,8,65,0),(272,16,65,0),(273,9,66,0),(274,6,66,1),(275,8,66,0),(276,16,66,0),(277,9,67,0),(278,6,67,1),(279,8,67,0),(280,16,67,0),(281,9,68,0),(282,6,68,1),(283,8,68,0),(284,16,68,0),(285,9,69,1),(286,6,69,1),(287,8,69,1),(288,16,69,1),(289,9,70,1),(290,6,70,1),(291,8,70,1),(292,16,70,1),(293,9,71,0),(294,6,71,1),(295,8,71,1),(296,16,71,0),(297,9,72,0),(298,6,72,1),(299,8,72,1),(300,16,72,0),(309,9,75,0),(310,6,75,1),(311,8,75,1),(312,16,75,0),(313,9,76,0),(314,6,76,1),(315,8,76,1),(316,16,76,0),(317,9,77,0),(318,6,77,1),(319,8,77,1),(320,16,77,0),(321,9,78,1),(322,6,78,1),(323,8,78,1),(324,16,78,0),(325,9,79,1),(326,6,79,1),(327,8,79,1),(328,16,79,0),(329,9,80,0),(330,6,80,1),(331,8,80,1),(332,16,80,0),(333,9,81,1),(334,6,81,1),(335,8,81,1),(336,16,81,0),(337,9,82,0),(338,6,82,1),(339,8,82,1),(340,16,82,0),(341,9,83,0),(342,6,83,1),(343,8,83,0),(344,16,83,0),(345,9,84,1),(346,6,84,1),(347,8,84,1),(348,16,84,0),(349,9,85,1),(350,6,85,1),(351,8,85,1),(352,16,85,0),(353,9,86,1),(354,6,86,1),(355,8,86,1),(356,16,86,0),(357,9,87,1),(358,6,87,1),(359,8,87,1),(360,16,87,0),(361,9,88,0),(362,6,88,1),(363,8,88,0),(364,16,88,0),(365,9,89,1),(366,6,89,1),(367,8,89,1),(368,16,89,0),(369,9,90,1),(370,6,90,1),(371,8,90,1),(372,16,90,0),(373,9,91,0),(374,6,91,1),(375,8,91,0),(376,16,91,0),(377,9,92,0),(378,6,92,1),(379,8,92,0),(380,16,92,0),(381,9,93,0),(382,6,93,1),(383,8,93,0),(384,16,93,0),(385,9,94,0),(386,6,94,1),(387,8,94,0),(388,16,94,0),(389,9,95,1),(390,6,95,1),(391,8,95,1),(392,16,95,0),(393,9,96,1),(394,6,96,1),(395,8,96,1),(396,16,96,0),(397,9,97,1),(398,6,97,1),(399,8,97,1),(400,16,97,0),(401,9,98,0),(402,6,98,1),(403,8,98,1),(404,16,98,0),(413,9,101,0),(414,6,101,1),(415,8,101,1),(416,16,101,0),(417,9,102,1),(418,6,102,1),(419,8,102,1),(420,16,102,0),(421,9,103,1),(422,6,103,1),(423,8,103,1),(424,16,103,0),(425,9,104,1),(426,6,104,1),(427,8,104,1),(428,16,104,0),(429,9,105,1),(430,6,105,1),(431,8,105,1),(432,16,105,0),(433,9,106,1),(434,6,106,1),(435,8,106,1),(436,16,106,0),(437,9,107,1),(438,6,107,1),(439,8,107,1),(440,16,107,0),(441,9,108,1),(442,6,108,1),(443,8,108,1),(444,16,108,0),(445,9,109,1),(446,6,109,1),(447,8,109,1),(448,16,109,0),(449,9,110,1),(450,6,110,1),(451,8,110,1),(452,16,110,0),(453,9,111,1),(454,6,111,1),(455,8,111,1),(456,16,111,0),(457,9,112,1),(458,6,112,1),(459,8,112,1),(460,16,112,0),(461,9,113,1),(462,6,113,1),(463,8,113,1),(464,16,113,0),(465,9,114,1),(466,6,114,1),(467,8,114,1),(468,16,114,0),(469,9,115,1),(470,6,115,1),(471,8,115,1),(472,16,115,0),(473,9,116,1),(474,6,116,1),(475,8,116,1),(476,16,116,0),(477,9,117,1),(478,6,117,1),(479,8,117,1),(480,16,117,0),(481,9,118,1),(482,6,118,1),(483,8,118,1),(484,16,118,0),(485,9,119,1),(486,6,119,1),(487,8,119,1),(488,16,119,0),(493,9,121,1),(494,6,121,1),(495,8,121,1),(496,16,121,0),(497,9,122,1),(498,6,122,1),(499,8,122,1),(500,16,122,0),(501,9,123,1),(502,6,123,1),(503,8,123,1),(504,16,123,0),(505,9,124,1),(506,6,124,1),(507,8,124,1),(508,16,124,0),(509,9,125,1),(510,6,125,1),(511,8,125,1),(512,16,125,0),(513,9,126,1),(514,6,126,1),(515,8,126,1),(516,16,126,0),(517,9,127,1),(518,6,127,1),(519,8,127,1),(520,16,127,0),(521,9,128,1),(522,6,128,1),(523,8,128,1),(524,16,128,0),(525,9,129,1),(526,6,129,1),(527,8,129,1),(528,16,129,0),(529,9,130,1),(530,6,130,1),(531,8,130,1),(532,16,130,0),(533,9,131,1),(534,6,131,1),(535,8,131,1),(536,16,131,0),(537,9,132,0),(538,6,132,1),(539,8,132,0),(540,16,132,0),(541,9,133,0),(542,6,133,1),(543,8,133,0),(544,16,133,0),(545,9,134,1),(546,6,134,1),(547,8,134,1),(548,16,134,0),(549,9,135,0),(550,6,135,1),(551,8,135,1),(552,16,135,0),(553,9,136,0),(554,6,136,1),(555,8,136,1),(556,16,136,0),(557,9,137,0),(558,6,137,1),(559,8,137,1),(560,16,137,0),(561,9,138,1),(562,6,138,1),(563,8,138,1),(564,16,138,0),(565,9,139,1),(566,6,139,1),(567,8,139,1),(568,16,139,1),(569,9,140,0),(570,6,140,1),(571,8,140,0),(572,16,140,0),(573,9,141,0),(574,6,141,1),(575,8,141,0),(576,16,141,0),(577,9,142,0),(578,6,142,1),(579,8,142,0),(580,16,142,0),(581,9,143,0),(582,6,143,1),(583,8,143,0),(584,16,143,0),(585,9,144,0),(586,6,144,1),(587,8,144,0),(588,16,144,0),(589,9,145,0),(590,6,145,1),(591,8,145,0),(592,16,145,0),(593,9,146,0),(594,6,146,1),(595,8,146,1),(596,16,146,0),(597,9,147,0),(598,6,147,1),(599,8,147,1),(600,16,147,0),(601,9,148,0),(602,6,148,1),(603,8,148,1),(604,16,148,0),(605,9,149,0),(606,6,149,1),(607,8,149,1),(608,16,149,0),(609,9,150,0),(610,6,150,1),(611,8,150,1),(612,16,150,0),(613,9,151,0),(614,6,151,1),(615,8,151,1),(616,16,151,0),(617,9,152,0),(618,6,152,1),(619,8,152,1),(620,16,152,0),(621,9,153,0),(622,6,153,1),(623,8,153,1),(624,16,153,0),(625,9,154,0),(626,6,154,1),(627,8,154,1),(628,16,154,0),(629,9,155,0),(630,6,155,1),(631,8,155,1),(632,16,155,0),(633,9,156,0),(634,6,156,1),(635,8,156,1),(636,16,156,0),(637,9,157,0),(638,6,157,1),(639,8,157,0),(640,16,157,0),(641,9,158,0),(642,6,158,1),(643,8,158,1),(644,16,158,0),(645,9,159,0),(646,6,159,1),(647,8,159,1),(648,16,159,0),(649,9,160,0),(650,6,160,1),(651,8,160,0),(652,16,160,0),(653,9,161,0),(654,6,161,1),(655,8,161,0),(656,16,161,0),(657,9,162,0),(658,6,162,1),(659,8,162,0),(660,16,162,0),(661,9,163,0),(662,6,163,1),(663,8,163,0),(664,16,163,0),(665,9,164,0),(666,6,164,1),(667,8,164,0),(668,16,164,0),(669,9,165,0),(670,6,165,1),(671,8,165,0),(672,16,165,0),(673,9,166,0),(674,6,166,1),(675,8,166,1),(676,16,166,0),(677,9,167,0),(678,6,167,1),(679,8,167,1),(680,16,167,0),(681,9,168,0),(682,6,168,1),(683,8,168,1),(684,16,168,0),(685,9,169,0),(686,6,169,1),(687,8,169,1),(688,16,169,0),(689,9,170,0),(690,6,170,1),(691,8,170,1),(692,16,170,0),(693,9,171,0),(694,6,171,1),(695,8,171,1),(696,16,171,0),(697,9,172,0),(698,6,172,1),(699,8,172,0),(700,16,172,0),(701,9,173,0),(702,6,173,1),(703,8,173,0),(704,16,173,0),(705,9,174,0),(706,6,174,1),(707,8,174,0),(708,16,174,0),(709,9,175,0),(710,6,175,1),(711,8,175,0),(712,16,175,0),(713,9,176,0),(714,6,176,1),(715,8,176,0),(716,16,176,0),(717,9,177,0),(718,6,177,1),(719,8,177,0),(720,16,177,0),(721,9,178,0),(722,6,178,1),(723,8,178,0),(724,16,178,0),(725,9,179,0),(726,6,179,1),(727,8,179,0),(728,16,179,0),(733,9,181,0),(734,6,181,1),(735,8,181,1),(736,16,181,0),(737,9,182,0),(738,6,182,1),(739,8,182,0),(740,16,182,0),(741,9,183,0),(742,6,183,1),(743,8,183,0),(744,16,183,0),(745,9,184,0),(746,6,184,1),(747,8,184,0),(748,16,184,0),(749,9,185,0),(750,6,185,1),(751,8,185,0),(752,16,185,0),(753,9,186,0),(754,6,186,1),(755,8,186,1),(756,16,186,0),(757,9,187,0),(758,6,187,1),(759,8,187,1),(760,16,187,0),(761,9,188,0),(762,6,188,1),(763,8,188,1),(764,16,188,0),(765,9,189,0),(766,6,189,1),(767,8,189,1),(768,16,189,0),(769,9,190,0),(770,6,190,1),(771,8,190,1),(772,16,190,0),(773,9,191,0),(774,6,191,1),(775,8,191,0),(776,16,191,0),(777,9,192,0),(778,6,192,1),(779,8,192,0),(780,16,192,0),(781,9,193,0),(782,6,193,1),(783,8,193,0),(784,16,193,0),(785,9,194,0),(786,6,194,1),(787,8,194,0),(788,16,194,0),(789,9,195,0),(790,6,195,1),(791,8,195,0),(792,16,195,0),(793,9,196,0),(794,6,196,1),(795,8,196,0),(796,16,196,0),(797,9,197,0),(798,6,197,1),(799,8,197,0),(800,16,197,0),(801,9,198,0),(802,6,198,1),(803,8,198,0),(804,16,198,0),(805,9,199,0),(806,6,199,1),(807,8,199,0),(808,16,199,0),(809,9,200,0),(810,6,200,1),(811,8,200,0),(812,16,200,0),(813,9,201,0),(814,6,201,1),(815,8,201,0),(816,16,201,0),(817,9,202,0),(818,6,202,1),(819,8,202,0),(820,16,202,0),(821,9,203,0),(822,6,203,1),(823,8,203,0),(824,16,203,0),(825,9,204,0),(826,6,204,1),(827,8,204,0),(828,16,204,0),(829,9,205,0),(830,6,205,1),(831,8,205,0),(832,16,205,0),(833,9,206,0),(834,6,206,1),(835,8,206,0),(836,16,206,0),(837,9,207,0),(838,6,207,1),(839,8,207,0),(840,16,207,0),(841,9,208,0),(842,6,208,1),(843,8,208,0),(844,16,208,0),(845,9,209,0),(846,6,209,1),(847,8,209,0),(848,16,209,0),(849,9,210,0),(850,6,210,1),(851,8,210,0),(852,16,210,0),(853,9,211,0),(854,6,211,1),(855,8,211,0),(856,16,211,0),(857,9,212,0),(858,6,212,1),(859,8,212,0),(860,16,212,0),(861,9,213,0),(862,6,213,1),(863,8,213,1),(864,16,213,0),(865,9,214,1),(866,6,214,1),(867,8,214,1),(868,16,214,0),(869,9,215,0),(870,6,215,1),(871,8,215,0),(872,16,215,0),(873,9,216,0),(874,6,216,1),(875,8,216,0),(876,16,216,0),(877,9,217,0),(878,6,217,1),(879,8,217,0),(880,16,217,0),(881,9,218,0),(882,6,218,1),(883,8,218,0),(884,16,218,0),(885,9,219,0),(886,6,219,1),(887,8,219,0),(888,16,219,0),(889,9,220,0),(890,6,220,1),(891,8,220,0),(892,16,220,0),(893,9,221,0),(894,6,221,1),(895,8,221,1),(896,16,221,0),(897,9,222,0),(898,6,222,1),(899,8,222,1),(900,16,222,0),(901,9,223,0),(902,6,223,1),(903,8,223,1),(904,16,223,0),(905,9,224,0),(906,6,224,1),(907,8,224,1),(908,16,224,0),(909,9,225,0),(910,6,225,1),(911,8,225,1),(912,16,225,0),(913,9,226,0),(914,6,226,1),(915,8,226,1),(916,16,226,0),(917,9,227,0),(918,6,227,1),(919,8,227,1),(920,16,227,0),(921,9,228,0),(922,6,228,1),(923,8,228,1),(924,16,228,0),(925,9,229,0),(926,6,229,1),(927,8,229,1),(928,16,229,0),(929,9,230,1),(930,6,230,1),(931,8,230,1),(932,16,230,1),(933,9,231,1),(934,6,231,1),(935,8,231,1),(936,16,231,1),(937,9,232,1),(938,6,232,1),(939,8,232,1),(940,16,232,1),(941,9,233,1),(942,6,233,1),(943,8,233,1),(944,16,233,1),(945,9,234,1),(946,6,234,1),(947,8,234,1),(948,16,234,1),(949,9,235,1),(950,6,235,1),(951,8,235,1),(952,16,235,1),(953,9,236,1),(954,6,236,1),(955,8,236,1),(956,16,236,1),(957,9,237,1),(958,6,237,1),(959,8,237,1),(960,16,237,1),(961,9,238,1),(962,6,238,1),(963,8,238,1),(964,16,238,1),(965,9,239,1),(966,6,239,1),(967,8,239,1),(968,16,239,1),(969,9,240,1),(970,6,240,1),(971,8,240,1),(972,16,240,1),(973,9,241,0),(974,6,241,1),(975,8,241,0),(976,16,241,1),(977,9,242,1),(978,6,242,1),(979,8,242,1),(980,16,242,1),(981,9,243,0),(982,6,243,1),(983,8,243,0),(984,16,243,1),(985,9,244,0),(986,6,244,1),(987,8,244,0),(988,16,244,0),(989,9,245,0),(990,6,245,1),(991,8,245,1),(992,16,245,0),(993,9,246,0),(994,6,246,1),(995,8,246,0),(996,16,246,0),(997,9,247,0),(998,6,247,1),(999,8,247,0),(1000,16,247,0),(1001,9,248,0),(1002,6,248,1),(1003,8,248,0),(1004,16,248,0),(1005,9,249,0),(1006,6,249,1),(1007,8,249,1),(1008,16,249,0),(1009,9,250,0),(1010,6,250,1),(1011,8,250,1),(1012,16,250,0),(1013,9,251,0),(1014,6,251,1),(1015,8,251,1),(1016,16,251,0),(1017,9,252,0),(1018,6,252,1),(1019,8,252,1),(1020,16,252,0),(1021,9,253,1),(1022,6,253,1),(1023,8,253,1),(1024,16,253,0),(1025,9,254,1),(1026,6,254,1),(1027,8,254,1),(1028,16,254,1),(1029,9,255,1),(1030,6,255,1),(1031,8,255,1),(1032,16,255,0),(1033,9,256,1),(1034,6,256,1),(1035,8,256,1),(1036,16,256,0),(1037,9,257,0),(1038,6,257,1),(1039,8,257,0),(1040,16,257,0),(1041,9,258,0),(1042,6,258,1),(1043,8,258,0),(1044,16,258,0),(1045,9,259,1),(1046,6,259,1),(1047,8,259,1),(1048,16,259,0),(1049,9,260,1),(1050,6,260,1),(1051,8,260,1),(1052,16,260,0),(1053,9,261,1),(1054,6,261,1),(1055,8,261,1),(1056,16,261,0),(1057,9,262,1),(1058,6,262,1),(1059,8,262,1),(1060,16,262,1),(1061,9,263,1),(1062,6,263,1),(1063,8,263,1),(1064,16,263,0),(1065,9,264,1),(1066,6,264,1),(1067,8,264,1),(1068,16,264,0),(1069,9,265,0),(1070,6,265,1),(1071,8,265,1),(1072,16,265,0),(1073,9,266,0),(1074,6,266,1),(1075,8,266,1),(1076,16,266,0),(1077,9,267,0),(1078,6,267,1),(1079,8,267,1),(1080,16,267,0),(1081,9,268,0),(1082,6,268,1),(1083,8,268,1),(1084,16,268,0),(1085,9,269,0),(1086,6,269,1),(1087,8,269,1),(1088,16,269,0),(1089,9,270,0),(1090,6,270,1),(1091,8,270,1),(1092,16,270,0),(1093,9,271,0),(1094,6,271,1),(1095,8,271,1),(1096,16,271,0),(1097,9,272,0),(1098,6,272,1),(1099,8,272,1),(1100,16,272,0),(1101,9,273,0),(1102,6,273,1),(1103,8,273,1),(1104,16,273,0),(1105,9,274,0),(1106,6,274,1),(1107,8,274,1),(1108,16,274,0),(1109,9,275,0),(1110,6,275,1),(1111,8,275,1),(1112,16,275,0),(1113,9,276,0),(1114,6,276,1),(1115,8,276,1),(1116,16,276,0),(1117,9,277,0),(1118,6,277,1),(1119,8,277,1),(1120,16,277,0),(1121,9,278,0),(1122,6,278,1),(1123,8,278,1),(1124,16,278,0),(1125,9,279,0),(1126,6,279,1),(1127,8,279,1),(1128,16,279,0),(1129,9,280,0),(1130,6,280,1),(1131,8,280,1),(1132,16,280,0),(1133,9,281,0),(1134,6,281,1),(1135,8,281,1),(1136,16,281,0),(1137,9,282,0),(1138,6,282,1),(1139,8,282,1),(1140,16,282,0),(1141,9,283,0),(1142,6,283,1),(1143,8,283,1),(1144,16,283,0),(1145,9,284,0),(1146,6,284,1),(1147,8,284,1),(1148,16,284,0),(1149,9,285,1),(1150,6,285,1),(1151,8,285,1),(1152,16,285,0),(1153,9,286,1),(1154,6,286,1),(1155,8,286,1),(1156,16,286,1),(1157,9,287,1),(1158,6,287,1),(1159,8,287,1),(1160,16,287,1),(1161,9,288,1),(1162,6,288,1),(1163,8,288,1),(1164,16,288,1),(1165,9,289,0),(1166,6,289,1),(1167,8,289,0),(1168,16,289,0),(1169,9,290,1),(1170,6,290,1),(1171,8,290,1),(1172,16,290,0),(1173,9,291,1),(1174,6,291,1),(1175,8,291,1),(1176,16,291,0),(1177,9,292,1),(1178,6,292,1),(1179,8,292,1),(1180,16,292,0),(1181,9,293,1),(1182,6,293,1),(1183,8,293,1),(1184,16,293,0),(1185,9,294,1),(1186,6,294,1),(1187,8,294,1),(1188,16,294,0),(1189,9,295,1),(1190,6,295,1),(1191,8,295,1),(1192,16,295,0),(1193,9,296,0),(1194,6,296,1),(1195,8,296,1),(1196,16,296,0),(1197,9,297,0),(1198,6,297,1),(1199,8,297,0),(1200,16,297,0),(1201,9,298,1),(1202,6,298,1),(1203,8,298,1),(1204,16,298,0),(1205,9,299,0),(1206,6,299,1),(1207,8,299,1),(1208,16,299,0),(1209,9,300,1),(1210,6,300,1),(1211,8,300,1),(1212,16,300,0),(1213,9,301,0),(1214,6,301,1),(1215,8,301,0),(1216,16,301,0),(1217,9,302,1),(1218,6,302,1),(1219,8,302,1),(1220,16,302,0),(1221,9,303,1),(1222,6,303,1),(1223,8,303,1),(1224,16,303,0),(1225,9,304,1),(1226,6,304,1),(1227,8,304,1),(1228,16,304,0),(1229,9,305,0),(1230,6,305,1),(1231,8,305,1),(1232,16,305,0),(1233,9,306,0),(1234,6,306,1),(1235,8,306,1),(1236,16,306,0),(1237,9,307,0),(1238,6,307,1),(1239,8,307,1),(1240,16,307,0),(1241,9,308,0),(1242,6,308,1),(1243,8,308,0),(1244,16,308,0),(1245,9,309,0),(1246,6,309,1),(1247,8,309,0),(1248,16,309,0),(1249,9,310,0),(1250,6,310,1),(1251,8,310,1),(1252,16,310,0),(1253,9,311,1),(1254,6,311,1),(1255,8,311,1),(1256,16,311,0),(1257,9,312,1),(1258,6,312,1),(1259,8,312,1),(1260,16,312,0),(1261,9,313,0),(1262,6,313,1),(1263,8,313,0),(1264,16,313,0),(1265,9,314,0),(1266,6,314,1),(1267,8,314,0),(1268,16,314,1),(1269,9,315,0),(1270,6,315,1),(1271,8,315,0),(1272,16,315,1),(1273,9,316,0),(1274,6,316,1),(1275,8,316,0),(1276,16,316,1),(1277,9,317,0),(1278,6,317,1),(1279,8,317,0),(1280,16,317,1),(1281,9,318,0),(1282,6,318,1),(1283,8,318,0),(1284,16,318,1),(1285,9,319,0),(1286,6,319,1),(1287,8,319,0),(1288,16,319,0),(1289,9,320,0),(1290,6,320,1),(1291,8,320,0),(1292,16,320,0),(1293,9,321,0),(1294,6,321,1),(1295,8,321,0),(1296,16,321,0),(1297,9,322,0),(1298,6,322,1),(1299,8,322,0),(1300,16,322,0),(1301,9,323,0),(1302,6,323,1),(1303,8,323,0),(1304,16,323,0),(1305,9,324,0),(1306,6,324,1),(1307,8,324,0),(1308,16,324,0),(1309,9,325,0),(1310,6,325,1),(1311,8,325,0),(1312,16,325,0),(1313,9,326,0),(1314,6,326,1),(1315,8,326,0),(1316,16,326,0),(1317,9,327,0),(1318,6,327,1),(1319,8,327,0),(1320,16,327,0),(1321,9,328,0),(1322,6,328,1),(1323,8,328,0),(1324,16,328,0),(1325,9,329,0),(1326,6,329,1),(1327,8,329,0),(1328,16,329,0),(1329,9,330,0),(1330,6,330,1),(1331,8,330,0),(1332,16,330,0),(1333,9,331,0),(1334,6,331,1),(1335,8,331,0),(1336,16,331,0),(1337,9,332,0),(1338,6,332,1),(1339,8,332,0),(1340,16,332,0),(1341,9,333,0),(1342,6,333,1),(1343,8,333,0),(1344,16,333,0),(1345,9,334,0),(1346,6,334,1),(1347,8,334,0),(1348,16,334,0),(1349,9,335,0),(1350,6,335,1),(1351,8,335,0),(1352,16,335,0),(1353,9,336,0),(1354,6,336,1),(1355,8,336,0),(1356,16,336,0),(1357,9,337,0),(1358,6,337,1),(1359,8,337,0),(1360,16,337,0),(1361,9,338,0),(1362,6,338,1),(1363,8,338,0),(1364,16,338,0),(1365,9,339,0),(1366,6,339,1),(1367,8,339,0),(1368,16,339,0),(1369,9,340,0),(1370,6,340,1),(1371,8,340,0),(1372,16,340,0),(1373,9,341,0),(1374,6,341,1),(1375,8,341,0),(1376,16,341,0),(1377,9,342,0),(1378,6,342,1),(1379,8,342,0),(1380,16,342,0),(1381,9,343,0),(1382,6,343,1),(1383,8,343,0),(1384,16,343,0),(1385,9,344,0),(1386,6,344,1),(1387,8,344,0),(1388,16,344,0),(1389,9,345,0),(1390,6,345,1),(1391,8,345,0),(1392,16,345,0),(1393,9,346,0),(1394,6,346,1),(1395,8,346,0),(1396,16,346,0),(1397,9,347,0),(1398,6,347,1),(1399,8,347,0),(1400,16,347,0),(1401,9,348,0),(1402,6,348,1),(1403,8,348,0),(1404,16,348,0),(1405,9,349,0),(1406,6,349,1),(1407,8,349,0),(1408,16,349,0),(1409,9,350,0),(1410,6,350,1),(1411,8,350,0),(1412,16,350,0),(1413,9,351,0),(1414,6,351,1),(1415,8,351,0),(1416,16,351,0),(1417,9,352,0),(1418,6,352,1),(1419,8,352,1),(1420,16,352,0),(1421,9,353,0),(1422,6,353,1),(1423,8,353,0),(1424,16,353,0),(1425,9,354,0),(1426,6,354,1),(1427,8,354,1),(1428,16,354,0),(1429,9,355,0),(1430,6,355,1),(1431,8,355,0),(1432,16,355,0),(1433,9,356,0),(1434,6,356,1),(1435,8,356,1),(1436,16,356,0),(1437,9,357,0),(1438,6,357,1),(1439,8,357,1),(1440,16,357,0),(1441,9,358,0),(1442,6,358,1),(1443,8,358,1),(1444,16,358,0),(1445,9,359,0),(1446,6,359,1),(1447,8,359,1),(1448,16,359,0),(1449,9,360,0),(1450,6,360,1),(1451,8,360,1),(1452,16,360,0),(1453,9,361,0),(1454,6,361,1),(1455,8,361,1),(1456,16,361,0),(1457,9,362,0),(1458,6,362,1),(1459,8,362,1),(1460,16,362,0),(1461,9,363,0),(1462,6,363,1),(1463,8,363,1),(1464,16,363,0),(1465,9,364,0),(1466,6,364,1),(1467,8,364,1),(1468,16,364,0),(1469,9,365,0),(1470,6,365,1),(1471,8,365,0),(1472,16,365,0),(1473,9,366,0),(1474,6,366,1),(1475,8,366,0),(1476,16,366,0),(1477,9,367,0),(1478,6,367,1),(1479,8,367,1),(1480,16,367,0),(1481,9,368,1),(1482,6,368,1),(1483,8,368,1),(1484,16,368,0),(1485,9,369,1),(1486,6,369,1),(1487,8,369,1),(1488,16,369,0),(1489,9,370,1),(1490,6,370,1),(1491,8,370,1),(1492,16,370,0),(1493,9,371,1),(1494,6,371,1),(1495,8,371,1),(1496,16,371,0),(1497,9,372,0),(1498,6,372,1),(1499,8,372,0),(1500,16,372,0),(1501,9,373,0),(1502,6,373,1),(1503,8,373,0),(1504,16,373,0),(1505,9,374,0),(1506,6,374,1),(1507,8,374,0),(1508,16,374,0),(1509,9,375,0),(1510,6,375,1),(1511,8,375,0),(1512,16,375,0),(1513,9,376,0),(1514,6,376,1),(1515,8,376,0),(1516,16,376,0),(1517,9,377,0),(1518,6,377,1),(1519,8,377,0),(1520,16,377,0),(1521,9,378,0),(1522,6,378,1),(1523,8,378,0),(1524,16,378,0),(1525,9,379,0),(1526,6,379,1),(1527,8,379,0),(1528,16,379,0),(1529,9,380,0),(1530,6,380,1),(1531,8,380,1),(1532,16,380,0),(1533,9,381,0),(1534,6,381,1),(1535,8,381,1),(1536,16,381,0),(1537,9,382,0),(1538,6,382,1),(1539,8,382,1),(1540,16,382,0),(1541,9,383,0),(1542,6,383,1),(1543,8,383,1),(1544,16,383,0),(1545,9,384,0),(1546,6,384,1),(1547,8,384,1),(1548,16,384,0),(1549,9,385,0),(1550,6,385,1),(1551,8,385,1),(1552,16,385,0),(1553,9,386,0),(1554,6,386,1),(1555,8,386,1),(1556,16,386,0),(1557,9,387,0),(1558,6,387,1),(1559,8,387,1),(1560,16,387,0),(1561,9,388,0),(1562,6,388,1),(1563,8,388,1),(1564,16,388,0),(1565,9,389,0),(1566,6,389,1),(1567,8,389,1),(1568,16,389,0),(1569,9,390,0),(1570,6,390,1),(1571,8,390,1),(1572,16,390,0),(1573,9,391,0),(1574,6,391,1),(1575,8,391,1),(1576,16,391,0),(1577,9,392,0),(1578,6,392,1),(1579,8,392,1),(1580,16,392,0),(1581,9,393,0),(1582,6,393,1),(1583,8,393,1),(1584,16,393,0),(1585,9,394,0),(1586,6,394,1),(1587,8,394,1),(1588,16,394,0),(1589,9,395,0),(1590,6,395,1),(1591,8,395,1),(1592,16,395,0),(1593,9,396,0),(1594,6,396,1),(1595,8,396,1),(1596,16,396,0),(1597,9,397,0),(1598,6,397,1),(1599,8,397,1),(1600,16,397,0),(1601,9,398,0),(1602,6,398,1),(1603,8,398,1),(1604,16,398,0),(1605,9,399,0),(1606,6,399,1),(1607,8,399,1),(1608,16,399,0),(1609,9,400,0),(1610,6,400,1),(1611,8,400,1),(1612,16,400,0),(1613,9,401,0),(1614,6,401,1),(1615,8,401,0),(1616,16,401,0),(1617,9,402,0),(1618,6,402,1),(1619,8,402,0),(1620,16,402,0),(1621,9,403,0),(1622,6,403,1),(1623,8,403,0),(1624,16,403,0),(1625,9,404,0),(1626,6,404,1),(1627,8,404,0),(1628,16,404,0),(1629,9,405,0),(1630,6,405,1),(1631,8,405,0),(1632,16,405,0),(1633,9,406,0),(1634,6,406,1),(1635,8,406,0),(1636,16,406,0),(1637,9,407,0),(1638,6,407,1),(1639,8,407,0),(1640,16,407,0),(1641,9,408,0),(1642,6,408,1),(1643,8,408,0),(1644,16,408,0),(1645,9,409,0),(1646,6,409,1),(1647,8,409,0),(1648,16,409,0),(1649,9,410,0),(1650,6,410,1),(1651,8,410,0),(1652,16,410,0),(1653,9,411,0),(1654,6,411,1),(1655,8,411,0),(1656,16,411,0),(1657,9,412,0),(1658,6,412,1),(1659,8,412,0),(1660,16,412,0),(1661,9,413,0),(1662,6,413,1),(1663,8,413,0),(1664,16,413,0),(1665,9,414,0),(1666,6,414,1),(1667,8,414,0),(1668,16,414,0),(1669,9,415,0),(1670,6,415,1),(1671,8,415,0),(1672,16,415,0),(1673,9,416,0),(1674,6,416,1),(1675,8,416,0),(1676,16,416,0),(1677,9,417,0),(1678,6,417,1),(1679,8,417,0),(1680,16,417,0),(1681,9,418,0),(1682,6,418,1),(1683,8,418,0),(1684,16,418,0),(1685,9,419,0),(1686,6,419,1),(1687,8,419,0),(1688,16,419,0),(1689,9,420,0),(1690,6,420,1),(1691,8,420,0),(1692,16,420,0),(1693,9,421,0),(1694,6,421,1),(1695,8,421,0),(1696,16,421,0),(1697,9,422,0),(1698,6,422,1),(1699,8,422,0),(1700,16,422,0),(1701,9,423,0),(1702,6,423,1),(1703,8,423,0),(1704,16,423,0),(1705,9,424,0),(1706,6,424,1),(1707,8,424,0),(1708,16,424,0),(1709,9,425,0),(1710,6,425,1),(1711,8,425,0),(1712,16,425,0),(1713,9,426,0),(1714,6,426,1),(1715,8,426,0),(1716,16,426,0),(1717,9,427,0),(1718,6,427,1),(1719,8,427,0),(1720,16,427,0),(1721,9,428,0),(1722,6,428,1),(1723,8,428,0),(1724,16,428,0),(1725,9,429,0),(1726,6,429,1),(1727,8,429,0),(1728,16,429,0),(1729,9,430,0),(1730,6,430,1),(1731,8,430,0),(1732,16,430,0),(1733,9,431,0),(1734,6,431,1),(1735,8,431,0),(1736,16,431,0),(1737,9,432,0),(1738,6,432,1),(1739,8,432,0),(1740,16,432,0),(1741,9,433,0),(1742,6,433,1),(1743,8,433,0),(1744,16,433,0),(1745,9,434,0),(1746,6,434,1),(1747,8,434,0),(1748,16,434,0),(1749,9,435,0),(1750,6,435,1),(1751,8,435,0),(1752,16,435,0),(1753,9,436,0),(1754,6,436,1),(1755,8,436,1),(1756,16,436,0),(1757,9,437,0),(1758,6,437,1),(1759,8,437,0),(1760,16,437,0),(1761,9,438,1),(1762,6,438,1),(1763,8,438,1),(1764,16,438,0),(1765,9,439,1),(1766,6,439,1),(1767,8,439,1),(1768,16,439,0),(1769,9,440,1),(1770,6,440,1),(1771,8,440,1),(1772,16,440,0),(1773,9,441,1),(1774,6,441,1),(1775,8,441,1),(1776,16,441,0),(1777,9,442,0),(1778,6,442,1),(1779,8,442,1),(1780,16,442,0),(1781,9,443,0),(1782,6,443,1),(1783,8,443,1),(1784,16,443,0),(1785,9,444,1),(1786,6,444,1),(1787,8,444,1),(1788,16,444,0),(1789,9,445,0),(1790,6,445,1),(1791,8,445,1),(1792,16,445,0),(1793,9,446,0),(1794,6,446,1),(1795,8,446,1),(1796,16,446,0),(1797,9,447,0),(1798,6,447,1),(1799,8,447,1),(1800,16,447,0),(1801,9,448,0),(1802,6,448,1),(1803,8,448,1),(1804,16,448,0),(1805,9,449,0),(1806,6,449,1),(1807,8,449,1),(1808,16,449,0),(1809,9,450,1),(1810,6,450,1),(1811,8,450,1),(1812,16,450,0),(1813,9,451,0),(1814,6,451,1),(1815,8,451,0),(1816,16,451,0),(1817,9,452,1),(1818,6,452,1),(1819,8,452,1),(1820,16,452,0),(1821,9,453,0),(1822,6,453,1),(1823,8,453,1),(1824,16,453,0),(1825,9,454,0),(1826,6,454,1),(1827,8,454,1),(1828,16,454,0),(1829,9,455,0),(1830,6,455,1),(1831,8,455,0),(1832,16,455,0),(1833,9,456,0),(1834,6,456,1),(1835,8,456,0),(1836,16,456,0),(1837,9,457,1),(1838,6,457,1),(1839,8,457,1),(1840,16,457,0),(1841,9,458,0),(1842,6,458,1),(1843,8,458,1),(1844,16,458,0),(1845,9,459,0),(1846,6,459,1),(1847,8,459,1),(1848,16,459,0),(1849,9,460,0),(1850,6,460,1),(1851,8,460,1),(1852,16,460,0),(1853,9,461,0),(1854,6,461,1),(1855,8,461,1),(1856,16,461,0),(1857,9,462,0),(1858,6,462,1),(1859,8,462,1),(1860,16,462,0),(1861,9,463,0),(1862,6,463,1),(1863,8,463,0),(1864,16,463,0),(1865,9,464,0),(1866,6,464,1),(1867,8,464,0),(1868,16,464,0),(1869,9,465,0),(1870,6,465,1),(1871,8,465,0),(1872,16,465,0),(1873,9,466,0),(1874,6,466,1),(1875,8,466,0),(1876,16,466,0),(1877,9,467,0),(1878,6,467,1),(1879,8,467,0),(1880,16,467,0),(1881,9,468,0),(1882,6,468,1),(1883,8,468,0),(1884,16,468,0),(1885,9,469,0),(1886,6,469,1),(1887,8,469,0),(1888,16,469,0),(1889,9,470,0),(1890,6,470,1),(1891,8,470,0),(1892,16,470,0),(1893,9,471,0),(1894,6,471,1),(1895,8,471,0),(1896,16,471,0),(1897,9,472,0),(1898,6,472,1),(1899,8,472,0),(1900,16,472,0),(1901,9,473,0),(1902,6,473,1),(1903,8,473,0),(1904,16,473,0),(1905,9,474,0),(1906,6,474,1),(1907,8,474,0),(1908,16,474,0),(1909,9,475,0),(1910,6,475,1),(1911,8,475,0),(1912,16,475,0),(1913,9,476,0),(1914,6,476,1),(1915,8,476,0),(1916,16,476,0),(1917,9,477,0),(1918,6,477,1),(1919,8,477,0),(1920,16,477,0),(1921,9,478,0),(1922,6,478,1),(1923,8,478,0),(1924,16,478,0),(1925,9,479,0),(1926,6,479,1),(1927,8,479,0),(1928,16,479,0),(1929,9,480,0),(1930,6,480,1),(1931,8,480,0),(1932,16,480,0),(1933,9,481,0),(1934,6,481,1),(1935,8,481,0),(1936,16,481,0),(1937,9,482,0),(1938,6,482,1),(1939,8,482,0),(1940,16,482,0),(1941,9,483,0),(1942,6,483,1),(1943,8,483,0),(1944,16,483,0),(1945,9,484,0),(1946,6,484,1),(1947,8,484,0),(1948,16,484,0),(1949,9,485,0),(1950,6,485,1),(1951,8,485,0),(1952,16,485,0),(1953,9,486,0),(1954,6,486,1),(1955,8,486,0),(1956,16,486,0),(1957,9,487,0),(1958,6,487,1),(1959,8,487,0),(1960,16,487,0),(1961,9,488,0),(1962,6,488,1),(1963,8,488,0),(1964,16,488,0),(1965,9,489,0),(1966,6,489,1),(1967,8,489,0),(1968,16,489,0),(1969,9,490,0),(1970,6,490,1),(1971,8,490,0),(1972,16,490,0),(1973,9,491,0),(1974,6,491,1),(1975,8,491,0),(1976,16,491,0),(1977,9,492,0),(1978,6,492,1),(1979,8,492,0),(1980,16,492,0),(1981,9,493,0),(1982,6,493,1),(1983,8,493,0),(1984,16,493,0),(1985,9,494,0),(1986,6,494,1),(1987,8,494,0),(1988,16,494,0),(1989,9,495,0),(1990,6,495,1),(1991,8,495,0),(1992,16,495,0),(1993,9,496,0),(1994,6,496,1),(1995,8,496,1),(1996,16,496,0),(1997,9,497,1),(1998,6,497,1),(1999,8,497,1),(2000,16,497,0),(2001,9,498,1),(2002,6,498,1),(2003,8,498,1),(2004,16,498,0),(2005,9,499,1),(2006,6,499,1),(2007,8,499,1),(2008,16,499,0),(2009,9,500,1),(2010,6,500,1),(2011,8,500,1),(2012,16,500,0),(2013,9,501,1),(2014,6,501,1),(2015,8,501,1),(2016,16,501,0),(2017,9,502,1),(2018,6,502,1),(2019,8,502,1),(2020,16,502,0),(2021,9,503,1),(2022,6,503,1),(2023,8,503,1),(2024,16,503,0),(2025,9,504,0),(2026,6,504,1),(2027,8,504,1),(2028,16,504,0),(2029,9,505,0),(2030,6,505,1),(2031,8,505,1),(2032,16,505,0),(2033,9,506,0),(2034,6,506,1),(2035,8,506,1),(2036,16,506,0),(2037,9,507,1),(2038,6,507,1),(2039,8,507,1),(2040,16,507,0),(2041,9,508,1),(2042,6,508,1),(2043,8,508,1),(2044,16,508,0),(2045,9,509,0),(2046,6,509,1),(2048,16,509,0),(2049,9,510,1),(2050,6,510,1),(2051,8,510,1),(2052,16,510,0),(2053,9,511,1),(2054,6,511,1),(2055,8,511,1),(2056,16,511,0),(2057,9,512,1),(2058,6,512,1),(2059,8,512,1),(2060,16,512,0),(2061,9,513,1),(2062,6,513,1),(2063,8,513,1),(2064,16,513,0),(2065,9,514,1),(2066,6,514,1),(2068,16,514,0),(2069,9,515,1),(2070,6,515,1),(2071,8,515,1),(2072,16,515,0),(2073,9,516,1),(2074,6,516,1),(2075,8,516,1),(2076,16,516,0),(2077,9,517,0),(2078,6,517,1),(2079,8,517,1),(2080,16,517,0),(2081,9,518,0),(2082,6,518,1),(2083,8,518,0),(2084,16,518,0),(2085,9,519,0),(2086,6,519,1),(2087,8,519,0),(2088,16,519,0),(2089,9,520,0),(2090,6,520,1),(2091,8,520,0),(2092,16,520,0),(2093,9,521,0),(2094,6,521,1),(2095,8,521,0),(2096,16,521,0),(2097,9,522,0),(2098,6,522,1),(2099,8,522,0),(2100,16,522,0),(2101,9,523,0),(2102,6,523,1),(2103,8,523,0),(2104,16,523,0),(2105,9,524,0),(2106,6,524,1),(2107,8,524,0),(2108,16,524,0),(2109,9,525,0),(2110,6,525,1),(2111,8,525,0),(2112,16,525,0),(2113,9,526,0),(2114,6,526,1),(2115,8,526,0),(2116,16,526,0),(2117,9,527,0),(2118,6,527,1),(2119,8,527,0),(2120,16,527,0),(2121,9,528,0),(2122,6,528,1),(2123,8,528,0),(2124,16,528,0),(2125,9,529,0),(2126,6,529,1),(2127,8,529,0),(2128,16,529,0),(2129,9,530,0),(2130,6,530,1),(2131,8,530,0),(2132,16,530,0),(2133,9,531,0),(2134,6,531,1),(2135,8,531,0),(2136,16,531,0),(2137,9,532,0),(2138,6,532,1),(2139,8,532,0),(2140,16,532,0),(2141,9,533,0),(2142,6,533,1),(2143,8,533,0),(2144,16,533,0),(2145,9,534,0),(2146,6,534,1),(2147,8,534,0),(2148,16,534,0),(2149,9,535,0),(2150,6,535,1),(2151,8,535,0),(2152,16,535,0),(2153,9,536,0),(2154,6,536,1),(2155,8,536,0),(2156,16,536,0),(2157,9,537,0),(2158,6,537,1),(2159,8,537,0),(2160,16,537,0),(2161,9,538,0),(2162,6,538,1),(2163,8,538,0),(2164,16,538,0),(2165,9,539,0),(2166,6,539,1),(2167,8,539,0),(2168,16,539,0),(2169,9,540,0),(2170,6,540,1),(2171,8,540,0),(2172,16,540,0),(2173,9,541,0),(2174,6,541,1),(2175,8,541,0),(2176,16,541,0),(2177,9,542,0),(2178,6,542,1),(2179,8,542,0),(2180,16,542,0),(2181,9,543,0),(2182,6,543,1),(2183,8,543,0),(2184,16,543,0),(2185,9,544,0),(2186,6,544,1),(2187,8,544,0),(2188,16,544,0),(2189,9,545,0),(2190,6,545,1),(2191,8,545,0),(2192,16,545,0),(2193,9,546,0),(2194,6,546,1),(2195,8,546,0),(2196,16,546,0),(2197,9,547,0),(2198,6,547,1),(2199,8,547,0),(2200,16,547,0),(2201,9,548,0),(2202,6,548,1),(2203,8,548,0),(2204,16,548,0),(2205,9,549,0),(2206,6,549,1),(2207,8,549,0),(2208,16,549,0),(2209,9,550,0),(2210,6,550,1),(2211,8,550,0),(2212,16,550,0),(2213,9,551,0),(2214,6,551,1),(2215,8,551,0),(2216,16,551,0),(2217,9,552,0),(2218,6,552,1),(2219,8,552,0),(2220,16,552,0),(2221,9,553,0),(2222,6,553,1),(2223,8,553,1),(2224,16,553,0),(2225,9,554,0),(2226,6,554,1),(2227,8,554,0),(2228,16,554,0),(2229,9,555,0),(2230,6,555,1),(2231,8,555,0),(2232,16,555,0),(2233,9,556,0),(2234,6,556,1),(2235,8,556,1),(2236,16,556,0),(2237,9,557,0),(2238,6,557,1),(2239,8,557,0),(2240,16,557,0),(2241,9,558,0),(2242,6,558,1),(2243,8,558,0),(2244,16,558,0),(2245,9,559,0),(2246,6,559,1),(2247,8,559,0),(2248,16,559,0),(2249,9,560,0),(2250,6,560,1),(2251,8,560,0),(2252,16,560,0),(2253,9,561,0),(2254,6,561,1),(2255,8,561,0),(2256,16,561,0),(2257,9,562,0),(2258,6,562,1),(2259,8,562,1),(2260,16,562,0),(2261,9,563,0),(2262,6,563,1),(2263,8,563,1),(2264,16,563,0),(2265,9,564,0),(2266,6,564,1),(2267,8,564,1),(2268,16,564,0),(2269,9,565,0),(2270,6,565,1),(2271,8,565,0),(2272,16,565,0),(2273,9,566,0),(2274,6,566,1),(2275,8,566,1),(2276,16,566,0),(2277,9,567,0),(2278,6,567,1),(2279,8,567,0),(2280,16,567,0),(2281,9,568,1),(2282,6,568,1),(2283,8,568,1),(2284,16,568,0),(2285,9,569,1),(2286,6,569,1),(2287,8,569,1),(2288,16,569,0),(2289,9,570,1),(2290,6,570,1),(2291,8,570,1),(2292,16,570,0),(2293,9,571,1),(2294,6,571,1),(2295,8,571,1),(2296,16,571,0),(2297,9,572,0),(2298,6,572,1),(2299,8,572,1),(2300,16,572,0),(2301,9,573,0),(2302,6,573,1),(2303,8,573,1),(2304,16,573,0),(2305,9,574,0),(2306,6,574,1),(2307,8,574,1),(2308,16,574,0),(2309,9,575,0),(2310,6,575,1),(2311,8,575,1),(2312,16,575,0),(2313,9,576,1),(2314,6,576,1),(2315,8,576,1),(2316,16,576,0),(2317,9,577,0),(2318,6,577,1),(2319,8,577,0),(2320,16,577,0),(2321,9,578,0),(2322,6,578,1),(2323,8,578,0),(2324,16,578,0),(2325,9,579,0),(2326,6,579,1),(2327,8,579,1),(2328,16,579,0),(2329,9,580,0),(2330,6,580,1),(2331,8,580,0),(2332,16,580,0),(2333,9,581,0),(2334,6,581,1),(2335,8,581,1),(2336,16,581,0),(2337,9,582,0),(2338,6,582,1),(2339,8,582,1),(2340,16,582,0),(2341,9,583,0),(2342,6,583,1),(2343,8,583,1),(2344,16,583,0),(2345,9,584,0),(2346,6,584,1),(2347,8,584,1),(2348,16,584,0),(2349,9,585,0),(2350,6,585,1),(2351,8,585,1),(2352,16,585,0),(2353,9,586,0),(2354,6,586,1),(2355,8,586,1),(2356,16,586,0),(2357,9,587,0),(2358,6,587,1),(2359,8,587,1),(2360,16,587,0),(2361,9,588,0),(2362,6,588,1),(2363,8,588,1),(2364,16,588,0),(2365,9,589,0),(2366,6,589,1),(2367,8,589,1),(2368,16,589,0),(2369,9,590,0),(2370,6,590,1),(2371,8,590,1),(2372,16,590,0),(2373,9,591,0),(2374,6,591,1),(2375,8,591,1),(2376,16,591,0),(2377,9,592,0),(2378,6,592,1),(2379,8,592,1),(2380,16,592,0),(2381,9,593,0),(2382,6,593,1),(2383,8,593,1),(2384,16,593,0),(2385,9,594,0),(2386,6,594,1),(2387,8,594,1),(2388,16,594,0),(2389,9,595,0),(2390,6,595,1),(2391,8,595,1),(2392,16,595,0),(2393,9,596,0),(2394,6,596,1),(2395,8,596,1),(2396,16,596,0),(2397,9,597,0),(2398,6,597,1),(2399,8,597,1),(2400,16,597,0),(2401,9,598,0),(2402,6,598,1),(2403,8,598,1),(2404,16,598,0),(2405,9,599,0),(2406,6,599,1),(2407,8,599,1),(2408,16,599,0),(2409,9,600,0),(2410,6,600,1),(2411,8,600,1),(2412,16,600,0),(2413,9,601,0),(2414,6,601,1),(2415,8,601,1),(2416,16,601,0),(2417,9,602,0),(2418,6,602,1),(2419,8,602,1),(2420,16,602,0),(2421,9,603,0),(2422,6,603,1),(2423,8,603,1),(2424,16,603,0),(2425,9,604,0),(2426,6,604,1),(2427,8,604,1),(2428,16,604,0),(2429,9,605,0),(2430,6,605,1),(2431,8,605,1),(2432,16,605,0),(2433,9,606,0),(2434,6,606,1),(2435,8,606,1),(2436,16,606,0),(2437,9,607,1),(2438,6,607,1),(2439,8,607,1),(2440,16,607,0),(2441,9,608,1),(2442,6,608,1),(2443,8,608,1),(2444,16,608,0),(2445,9,609,0),(2446,6,609,1),(2447,8,609,1),(2448,16,609,0),(2449,9,610,0),(2450,6,610,1),(2451,8,610,1),(2452,16,610,0),(2453,9,611,0),(2454,6,611,1),(2455,8,611,1),(2456,16,611,0),(2457,9,612,0),(2458,6,612,1),(2459,8,612,1),(2460,16,612,0),(2461,9,613,0),(2462,6,613,1),(2463,8,613,1),(2464,16,613,0),(2465,9,614,0),(2466,6,614,1),(2467,8,614,1),(2468,16,614,0),(2469,9,615,0),(2470,6,615,1),(2471,8,615,1),(2472,16,615,0),(2473,9,616,0),(2474,6,616,1),(2475,8,616,1),(2476,16,616,0),(2477,9,617,0),(2478,6,617,1),(2479,8,617,1),(2480,16,617,0),(2481,9,618,0),(2482,6,618,1),(2483,8,618,1),(2484,16,618,0),(2485,9,619,0),(2486,6,619,1),(2487,8,619,1),(2488,16,619,0),(2489,9,620,0),(2490,6,620,1),(2491,8,620,0),(2492,16,620,0),(2493,9,621,0),(2494,6,621,1),(2495,8,621,1),(2496,16,621,0),(2497,9,622,0),(2498,6,622,1),(2499,8,622,1),(2500,16,622,0),(2501,9,623,1),(2502,6,623,1),(2503,8,623,1),(2504,16,623,0),(2505,9,624,1),(2506,6,624,1),(2507,8,624,1),(2508,16,624,0),(2509,9,625,1),(2510,6,625,1),(2511,8,625,1),(2512,16,625,0),(2513,9,626,1),(2514,6,626,1),(2515,8,626,1),(2516,16,626,0),(2517,9,627,1),(2518,6,627,1),(2519,8,627,1),(2520,16,627,0),(2521,9,628,1),(2522,6,628,1),(2523,8,628,1),(2524,16,628,0),(2525,9,629,1),(2526,6,629,1),(2527,8,629,1),(2528,16,629,0),(2529,9,630,1),(2530,6,630,1),(2531,8,630,1),(2532,16,630,0),(2533,9,631,1),(2534,6,631,1),(2535,8,631,1),(2536,16,631,0),(2537,9,632,1),(2538,6,632,1),(2539,8,632,1),(2540,16,632,0),(2541,9,633,1),(2542,6,633,1),(2543,8,633,1),(2544,16,633,0),(2545,9,634,1),(2546,6,634,1),(2547,8,634,1),(2548,16,634,0),(2549,9,635,1),(2550,6,635,1),(2551,8,635,1),(2552,16,635,0),(2553,9,636,1),(2554,6,636,1),(2555,8,636,1),(2556,16,636,0),(2557,9,637,1),(2558,6,637,1),(2559,8,637,1),(2560,16,637,0),(2561,9,638,1),(2562,6,638,1),(2563,8,638,1),(2564,16,638,0),(2565,9,639,1),(2566,6,639,1),(2567,8,639,1),(2568,16,639,0),(2569,9,640,1),(2570,6,640,1),(2571,8,640,1),(2572,16,640,0),(2573,9,641,1),(2574,6,641,1),(2575,8,641,1),(2576,16,641,0),(2577,9,642,1),(2578,6,642,1),(2579,8,642,1),(2580,16,642,0),(2581,9,643,1),(2582,6,643,1),(2583,8,643,1),(2584,16,643,0),(2585,9,644,1),(2586,6,644,1),(2587,8,644,1),(2588,16,644,0),(2589,9,645,1),(2590,6,645,1),(2591,8,645,1),(2592,16,645,0),(2593,9,646,0),(2594,6,646,1),(2595,8,646,0),(2596,16,646,0),(2597,9,647,0),(2598,6,647,1),(2599,8,647,0),(2600,16,647,0),(2601,9,648,0),(2602,6,648,1),(2603,8,648,1),(2604,16,648,0),(2605,9,649,0),(2606,6,649,1),(2607,8,649,0),(2608,16,649,0),(2609,9,650,0),(2610,6,650,1),(2611,8,650,1),(2612,16,650,0),(2613,9,651,0),(2614,6,651,1),(2615,8,651,1),(2616,16,651,0),(2617,9,652,0),(2618,6,652,1),(2619,8,652,1),(2620,16,652,0),(2621,9,653,0),(2622,6,653,1),(2623,8,653,1),(2624,16,653,0),(2625,9,654,0),(2626,6,654,1),(2627,8,654,1),(2628,16,654,0),(2629,9,655,0),(2630,6,655,1),(2631,8,655,1),(2632,16,655,0),(2633,9,656,0),(2634,6,656,1),(2635,8,656,1),(2636,16,656,0),(2637,9,657,0),(2638,6,657,1),(2639,8,657,1),(2640,16,657,0),(2641,9,658,0),(2642,6,658,1),(2643,8,658,1),(2644,16,658,0),(2645,9,659,0),(2646,6,659,1),(2647,8,659,1),(2648,16,659,0),(2649,9,660,0),(2650,6,660,1),(2651,8,660,1),(2652,16,660,0),(2653,9,661,0),(2654,6,661,1),(2655,8,661,0),(2656,16,661,0),(2657,9,662,0),(2658,6,662,1),(2659,8,662,0),(2660,16,662,0),(2661,9,663,0),(2662,6,663,1),(2663,8,663,0),(2664,16,663,0),(2665,9,664,0),(2666,6,664,1),(2667,8,664,0),(2668,16,664,0),(2669,9,665,0),(2670,6,665,1),(2671,8,665,0),(2672,16,665,0),(2673,9,666,0),(2674,6,666,1),(2675,8,666,0),(2676,16,666,0),(2677,9,667,0),(2678,6,667,1),(2679,8,667,0),(2680,16,667,0),(2681,9,668,0),(2682,6,668,1),(2683,8,668,1),(2684,16,668,0),(2685,9,669,0),(2686,6,669,1),(2687,8,669,1),(2688,16,669,0),(2689,9,670,0),(2690,6,670,1),(2691,8,670,1),(2692,16,670,0),(2693,9,671,0),(2694,6,671,1),(2695,8,671,1),(2696,16,671,0),(2697,9,672,0),(2698,6,672,1),(2699,8,672,1),(2700,16,672,0),(2701,9,673,0),(2702,6,673,1),(2703,8,673,0),(2704,16,673,0),(2705,9,674,0),(2706,6,674,1),(2707,8,674,1),(2708,16,674,0),(2709,9,675,0),(2710,6,675,1),(2711,8,675,1),(2712,16,675,0),(2713,9,676,0),(2714,6,676,1),(2715,8,676,1),(2716,16,676,0),(2717,9,677,0),(2718,6,677,1),(2719,8,677,1),(2720,16,677,0),(2721,9,678,1),(2722,6,678,1),(2723,8,678,1),(2724,16,678,0),(2725,9,679,0),(2726,6,679,1),(2727,8,679,1),(2728,16,679,0),(2729,9,680,0),(2730,6,680,1),(2731,8,680,1),(2732,16,680,0),(2733,9,681,0),(2734,6,681,1),(2735,8,681,1),(2736,16,681,0),(2737,9,682,0),(2738,6,682,1),(2739,8,682,1),(2740,16,682,0),(2741,9,683,1),(2742,6,683,1),(2743,8,683,1),(2744,16,683,0),(2761,9,688,0),(2762,6,688,1),(2763,8,688,1),(2764,16,688,0),(2765,9,689,0),(2766,6,689,1),(2767,8,689,1),(2768,16,689,0),(2769,9,690,0),(2770,6,690,1),(2771,8,690,1),(2772,16,690,0),(2773,9,691,0),(2774,6,691,1),(2775,8,691,1),(2776,16,691,0),(2777,9,692,0),(2778,6,692,1),(2779,8,692,1),(2780,16,692,0),(2781,9,693,0),(2782,6,693,1),(2783,8,693,1),(2784,16,693,0),(2785,17,4,1),(2786,17,5,1),(2787,17,6,1),(2788,17,7,1),(2789,17,8,1),(2790,17,9,1),(2791,17,10,1),(2792,17,11,1),(2793,17,30,0),(2794,17,31,0),(2795,17,32,0),(2796,17,33,0),(2797,17,34,0),(2798,17,35,0),(2799,17,36,1),(2800,17,37,1),(2801,17,38,1),(2802,17,39,1),(2803,17,40,1),(2804,17,41,0),(2805,17,42,1),(2806,17,43,1),(2807,17,44,1),(2808,17,45,1),(2809,17,46,1),(2810,17,47,1),(2811,17,48,1),(2812,17,49,0),(2813,17,58,1),(2814,17,59,1),(2815,17,60,1),(2816,17,61,1),(2817,17,62,1),(2818,17,63,1),(2819,17,64,1),(2820,17,65,1),(2821,17,66,1),(2822,17,67,0),(2823,17,68,1),(2824,17,69,1),(2825,17,70,1),(2826,17,71,1),(2827,17,72,1),(2828,17,75,1),(2829,17,76,1),(2830,17,77,1),(2831,17,78,1),(2832,17,79,1),(2833,17,80,1),(2834,17,81,1),(2835,17,82,1),(2836,17,83,1),(2837,17,84,1),(2838,17,85,1),(2839,17,86,1),(2840,17,87,1),(2841,17,88,1),(2842,17,89,1),(2843,17,90,1),(2844,17,91,1),(2845,17,92,1),(2846,17,93,1),(2847,17,94,1),(2848,17,95,1),(2849,17,96,1),(2850,17,97,1),(2851,17,98,1),(2852,17,101,0),(2853,17,102,1),(2854,17,103,1),(2855,17,104,1),(2856,17,105,1),(2857,17,106,1),(2858,17,107,1),(2859,17,108,1),(2860,17,109,1),(2861,17,110,1),(2862,17,111,1),(2863,17,112,1),(2864,17,113,1),(2865,17,114,1),(2866,17,115,1),(2867,17,116,1),(2868,17,117,1),(2869,17,118,1),(2870,17,119,1),(2871,17,121,1),(2872,17,122,1),(2873,17,123,1),(2874,17,124,1),(2875,17,125,1),(2876,17,126,1),(2877,17,127,1),(2878,17,128,1),(2879,17,129,1),(2880,17,130,1),(2881,17,131,1),(2882,17,132,0),(2883,17,133,0),(2884,17,134,1),(2885,17,135,1),(2886,17,136,1),(2887,17,137,1),(2888,17,138,1),(2889,17,139,1),(2890,17,140,0),(2891,17,141,0),(2892,17,142,0),(2893,17,143,0),(2894,17,144,0),(2895,17,145,0),(2896,17,146,0),(2897,17,147,0),(2898,17,148,0),(2899,17,149,0),(2900,17,150,0),(2901,17,151,0),(2902,17,152,0),(2903,17,153,0),(2904,17,154,0),(2905,17,155,0),(2906,17,156,0),(2907,17,157,0),(2908,17,158,1),(2909,17,159,0),(2910,17,160,0),(2911,17,161,0),(2912,17,162,0),(2913,17,163,0),(2914,17,164,0),(2915,17,165,0),(2916,17,166,0),(2917,17,167,0),(2918,17,168,0),(2919,17,169,0),(2920,17,170,0),(2921,17,171,0),(2922,17,172,0),(2923,17,173,0),(2924,17,174,0),(2925,17,175,0),(2926,17,176,0),(2927,17,177,0),(2928,17,178,0),(2929,17,179,0),(2930,17,181,0),(2931,17,182,0),(2932,17,183,0),(2933,17,184,0),(2934,17,185,0),(2935,17,186,0),(2936,17,187,0),(2937,17,188,0),(2938,17,189,0),(2939,17,190,0),(2940,17,191,0),(2941,17,192,0),(2942,17,193,0),(2943,17,194,0),(2944,17,195,0),(2945,17,196,0),(2946,17,197,0),(2947,17,198,0),(2948,17,199,0),(2949,17,200,0),(2950,17,201,0),(2951,17,202,0),(2952,17,203,0),(2953,17,204,0),(2954,17,205,0),(2955,17,206,0),(2956,17,207,0),(2957,17,208,0),(2958,17,209,0),(2959,17,210,0),(2960,17,211,0),(2961,17,212,0),(2962,17,213,0),(2963,17,214,1),(2964,17,215,0),(2965,17,216,0),(2966,17,217,0),(2967,17,218,0),(2968,17,219,0),(2969,17,220,0),(2970,17,221,0),(2971,17,222,0),(2972,17,223,0),(2973,17,224,0),(2974,17,225,0),(2975,17,226,0),(2976,17,227,0),(2977,17,228,0),(2978,17,229,0),(2979,17,230,1),(2980,17,231,1),(2981,17,232,1),(2982,17,233,1),(2983,17,234,1),(2984,17,235,1),(2985,17,236,1),(2986,17,237,1),(2987,17,238,1),(2988,17,239,1),(2989,17,240,1),(2990,17,241,0),(2991,17,242,1),(2992,17,243,0),(2993,17,244,1),(2994,17,245,1),(2995,17,246,1),(2996,17,247,1),(2997,17,248,1),(2998,17,249,1),(2999,17,250,1),(3000,17,251,1),(3001,17,252,1),(3002,17,253,1),(3003,17,254,1),(3004,17,255,1),(3005,17,256,1),(3006,17,257,1),(3007,17,258,1),(3008,17,259,1),(3009,17,260,1),(3010,17,261,1),(3011,17,262,1),(3012,17,263,1),(3013,17,264,1),(3014,17,265,1),(3015,17,266,1),(3016,17,267,1),(3017,17,268,1),(3018,17,269,1),(3019,17,270,1),(3020,17,271,1),(3021,17,272,1),(3022,17,273,1),(3023,17,274,1),(3024,17,275,1),(3025,17,276,1),(3026,17,277,1),(3027,17,278,1),(3028,17,279,1),(3029,17,280,1),(3030,17,281,1),(3031,17,282,1),(3032,17,283,1),(3033,17,284,1),(3034,17,285,1),(3035,17,286,1),(3036,17,287,1),(3037,17,288,1),(3038,17,289,1),(3039,17,290,1),(3040,17,291,1),(3041,17,292,1),(3042,17,293,1),(3043,17,294,1),(3044,17,295,1),(3045,17,296,1),(3046,17,297,1),(3047,17,298,1),(3048,17,299,1),(3049,17,300,1),(3050,17,301,1),(3051,17,302,1),(3052,17,303,1),(3053,17,304,1),(3054,17,305,1),(3055,17,306,1),(3056,17,307,0),(3057,17,308,0),(3058,17,309,0),(3059,17,310,1),(3060,17,311,1),(3061,17,312,1),(3062,17,313,1),(3063,17,314,0),(3064,17,315,0),(3065,17,316,0),(3066,17,317,0),(3067,17,318,0),(3068,17,319,0),(3069,17,320,1),(3070,17,321,1),(3071,17,322,1),(3072,17,323,1),(3073,17,324,1),(3074,17,325,1),(3075,17,326,1),(3076,17,327,1),(3077,17,328,1),(3078,17,329,1),(3079,17,330,1),(3080,17,331,1),(3081,17,332,1),(3082,17,333,1),(3083,17,334,1),(3084,17,335,1),(3085,17,336,1),(3086,17,337,1),(3087,17,338,1),(3088,17,339,1),(3089,17,340,1),(3090,17,341,1),(3091,17,342,1),(3092,17,343,1),(3093,17,344,1),(3094,17,345,1),(3095,17,346,1),(3096,17,347,1),(3097,17,348,1),(3098,17,349,1),(3099,17,350,0),(3100,17,351,0),(3101,17,352,1),(3102,17,353,0),(3103,17,354,1),(3104,17,355,0),(3105,17,356,0),(3106,17,357,0),(3107,17,358,0),(3108,17,359,0),(3109,17,360,0),(3110,17,361,0),(3111,17,362,1),(3112,17,363,1),(3113,17,364,1),(3114,17,365,0),(3115,17,366,0),(3116,17,367,1),(3117,17,368,1),(3118,17,369,1),(3119,17,370,1),(3120,17,371,1),(3121,17,372,0),(3122,17,373,0),(3123,17,374,0),(3124,17,375,0),(3125,17,376,0),(3126,17,377,0),(3127,17,378,0),(3128,17,379,0),(3129,17,380,1),(3130,17,381,1),(3131,17,382,1),(3132,17,383,1),(3133,17,384,1),(3134,17,385,1),(3135,17,386,1),(3136,17,387,1),(3137,17,388,1),(3138,17,389,1),(3139,17,390,1),(3140,17,391,1),(3141,17,392,1),(3142,17,393,1),(3143,17,394,1),(3144,17,395,1),(3145,17,396,1),(3146,17,397,1),(3147,17,398,1),(3148,17,399,1),(3149,17,400,1),(3150,17,401,1),(3151,17,402,1),(3152,17,403,1),(3153,17,404,1),(3154,17,405,1),(3155,17,406,1),(3156,17,407,1),(3157,17,408,1),(3158,17,409,1),(3159,17,410,1),(3160,17,411,1),(3161,17,412,1),(3162,17,413,1),(3163,17,414,1),(3164,17,415,1),(3165,17,416,1),(3166,17,417,1),(3167,17,418,1),(3168,17,419,1),(3169,17,420,1),(3170,17,421,1),(3171,17,422,1),(3172,17,423,1),(3173,17,424,1),(3174,17,425,1),(3175,17,426,1),(3176,17,427,1),(3177,17,428,1),(3178,17,429,1),(3179,17,430,1),(3180,17,431,1),(3181,17,432,1),(3182,17,433,1),(3183,17,434,1),(3184,17,435,1),(3185,17,436,1),(3186,17,437,1),(3187,17,438,1),(3188,17,439,1),(3189,17,440,1),(3190,17,441,1),(3191,17,442,1),(3192,17,443,1),(3193,17,444,1),(3194,17,445,1),(3195,17,446,1),(3196,17,447,1),(3197,17,448,1),(3198,17,449,1),(3199,17,450,1),(3200,17,451,0),(3201,17,452,1),(3202,17,453,1),(3203,17,454,0),(3204,17,455,0),(3205,17,456,0),(3206,17,457,1),(3207,17,458,0),(3208,17,459,0),(3209,17,460,0),(3210,17,461,0),(3211,17,462,0),(3212,17,463,0),(3213,17,464,1),(3214,17,465,1),(3215,17,466,1),(3216,17,467,1),(3217,17,468,1),(3218,17,469,1),(3219,17,470,1),(3220,17,471,1),(3221,17,472,1),(3222,17,473,1),(3223,17,474,1),(3224,17,475,1),(3225,17,476,1),(3226,17,477,1),(3227,17,478,1),(3228,17,479,1),(3229,17,480,1),(3230,17,481,1),(3231,17,482,1),(3232,17,483,1),(3233,17,484,1),(3234,17,485,1),(3235,17,486,1),(3236,17,487,1),(3237,17,488,1),(3238,17,489,1),(3239,17,490,1),(3240,17,491,1),(3241,17,492,1),(3242,17,493,1),(3243,17,494,1),(3244,17,495,1),(3245,17,496,1),(3246,17,497,1),(3247,17,498,1),(3248,17,499,1),(3249,17,500,0),(3250,17,501,0),(3251,17,502,0),(3252,17,503,0),(3253,17,504,0),(3254,17,505,0),(3255,17,506,0),(3256,17,507,0),(3257,17,508,0),(3258,17,509,0),(3259,17,510,0),(3260,17,511,0),(3261,17,512,0),(3262,17,513,0),(3263,17,514,0),(3264,17,515,0),(3265,17,516,0),(3266,17,517,0),(3267,17,518,0),(3268,17,519,1),(3269,17,520,1),(3270,17,521,1),(3271,17,522,1),(3272,17,523,1),(3273,17,524,1),(3274,17,525,1),(3275,17,526,1),(3276,17,527,1),(3277,17,528,1),(3278,17,529,1),(3279,17,530,1),(3280,17,531,1),(3281,17,532,1),(3282,17,533,1),(3283,17,534,1),(3284,17,535,1),(3285,17,536,1),(3286,17,537,1),(3287,17,538,1),(3288,17,539,1),(3289,17,540,1),(3290,17,541,1),(3291,17,542,1),(3292,17,543,1),(3293,17,544,1),(3294,17,545,1),(3295,17,546,1),(3296,17,547,1),(3297,17,548,1),(3298,17,549,1),(3299,17,550,1),(3300,17,551,1),(3301,17,552,1),(3302,17,553,1),(3303,17,554,1),(3304,17,555,1),(3305,17,556,1),(3306,17,557,1),(3307,17,558,1),(3308,17,559,1),(3309,17,560,1),(3310,17,561,1),(3311,17,562,1),(3312,17,563,1),(3313,17,564,1),(3314,17,565,1),(3315,17,566,1),(3316,17,567,1),(3317,17,568,1),(3318,17,569,1),(3319,17,570,1),(3320,17,571,1),(3321,17,572,1),(3322,17,573,1),(3323,17,574,1),(3324,17,575,1),(3325,17,576,1),(3326,17,577,1),(3327,17,578,1),(3328,17,579,1),(3329,17,580,1),(3330,17,581,1),(3331,17,582,1),(3332,17,583,1),(3333,17,584,1),(3334,17,585,1),(3335,17,586,1),(3336,17,587,1),(3337,17,588,1),(3338,17,589,1),(3339,17,590,1),(3340,17,591,1),(3341,17,592,1),(3342,17,593,1),(3343,17,594,1),(3344,17,595,1),(3345,17,596,1),(3346,17,597,1),(3347,17,598,1),(3348,17,599,1),(3349,17,600,1),(3350,17,601,1),(3351,17,602,1),(3352,17,603,1),(3353,17,604,1),(3354,17,605,1),(3355,17,606,1),(3356,17,607,1),(3357,17,608,1),(3358,17,609,1),(3359,17,610,0),(3360,17,611,0),(3361,17,612,0),(3362,17,613,0),(3363,17,614,0),(3364,17,615,0),(3365,17,616,0),(3366,17,617,0),(3367,17,618,0),(3368,17,619,0),(3369,17,620,0),(3370,17,621,0),(3371,17,622,0),(3372,17,623,1),(3373,17,624,1),(3374,17,625,1),(3375,17,626,1),(3376,17,627,1),(3377,17,628,1),(3378,17,629,1),(3379,17,630,1),(3380,17,631,1),(3381,17,632,1),(3382,17,633,1),(3383,17,634,1),(3384,17,635,1),(3385,17,636,1),(3386,17,637,1),(3387,17,638,1),(3388,17,639,1),(3389,17,640,1),(3390,17,641,1),(3391,17,642,1),(3392,17,643,1),(3393,17,644,1),(3394,17,645,1),(3395,17,646,0),(3396,17,647,0),(3397,17,648,1),(3398,17,649,1),(3399,17,650,0),(3400,17,651,0),(3401,17,652,0),(3402,17,653,0),(3403,17,654,0),(3404,17,655,0),(3405,17,656,0),(3406,17,657,0),(3407,17,658,0),(3408,17,659,0),(3409,17,660,0),(3410,17,661,0),(3411,17,662,0),(3412,17,663,0),(3413,17,664,0),(3414,17,665,0),(3415,17,666,0),(3416,17,667,0),(3417,17,668,0),(3418,17,669,1),(3419,17,670,1),(3420,17,671,1),(3421,17,672,1),(3422,17,673,0),(3423,17,674,0),(3424,17,675,0),(3425,17,676,0),(3426,17,677,1),(3427,17,678,1),(3428,17,679,0),(3429,17,680,1),(3430,17,681,1),(3431,17,682,1),(3432,17,683,1),(3433,17,688,0),(3434,17,689,0),(3435,17,690,0),(3436,17,691,0),(3437,17,692,1),(3438,17,693,0),(3439,9,694,0),(3440,6,694,1),(3441,8,694,0),(3442,16,694,0),(3443,17,694,0),(3444,9,695,0),(3445,6,695,1),(3446,8,695,0),(3447,16,695,0),(3448,17,695,0),(3449,9,696,0),(3450,6,696,1),(3451,8,696,1),(3452,16,696,0),(3453,17,696,1),(3454,9,697,0),(3455,6,697,1),(3456,8,697,0),(3457,16,697,0),(3458,17,697,0),(3459,9,698,0),(3460,6,698,1),(3461,8,698,0),(3462,16,698,0),(3463,17,698,1),(3464,9,699,0),(3465,6,699,1),(3466,8,699,0),(3467,16,699,0),(3468,17,699,1),(3469,9,700,0),(3470,6,700,1),(3471,8,700,0),(3472,16,700,0),(3473,17,700,1),(3474,9,701,1),(3475,6,701,1),(3476,8,701,1),(3477,16,701,0),(3478,17,701,0),(3479,9,702,0),(3480,6,702,1),(3481,8,702,0),(3482,16,702,0),(3483,17,702,1),(3484,9,703,0),(3485,6,703,1),(3486,8,703,0),(3487,16,703,0),(3488,17,703,0),(3489,9,704,0),(3490,6,704,1),(3491,8,704,0),(3492,16,704,0),(3493,17,704,0),(3494,9,705,0),(3495,6,705,1),(3496,8,705,0),(3497,16,705,0),(3498,17,705,0),(3499,9,706,1),(3500,6,706,1),(3501,8,706,1),(3502,16,706,0),(3503,17,706,1),(3504,9,707,1),(3505,6,707,1),(3506,8,707,1),(3507,16,707,0),(3508,17,707,1),(3509,9,708,0),(3510,6,708,1),(3511,8,708,0),(3512,16,708,0),(3513,17,708,0),(3514,9,709,0),(3515,6,709,1),(3516,8,709,0),(3517,16,709,0),(3518,17,709,0),(4461,9,901,1),(4471,6,901,1),(4481,8,901,1),(4491,16,901,0),(4501,17,901,1),(4511,9,911,0),(4521,6,911,1),(4531,8,911,0),(4541,16,911,0),(4551,17,911,1),(4561,9,921,0),(4571,6,921,1),(4581,8,921,0),(4591,16,921,0),(4601,17,921,0),(4611,9,931,0),(4621,6,931,1),(4631,8,931,0),(4641,16,931,0),(4651,17,931,1),(4661,9,941,0),(4671,6,941,1),(4681,8,941,0),(4691,16,941,0),(4701,17,941,1),(4712,9,942,1),(4713,6,942,0),(4714,8,942,1),(4715,16,942,1),(4716,17,942,0),(4717,9,943,1),(4718,6,943,1),(4719,8,943,1),(4720,16,943,0),(4721,17,943,1),(4722,9,944,1),(4723,6,944,1),(4724,8,944,1),(4725,16,944,0),(4726,17,944,1),(4727,9,945,1),(4728,6,945,1),(4729,8,945,1),(4730,16,945,0),(4731,17,945,1),(4732,9,946,1),(4733,6,946,1),(4734,8,946,1),(4735,16,946,0),(4736,17,946,1),(4737,17,947,0),(4738,6,947,0),(4739,16,947,1),(4740,8,947,0),(4741,9,947,1),(4743,6,948,1),(4747,17,949,0),(4748,6,949,0),(4749,16,949,1),(4750,8,949,0),(4751,9,949,1),(4752,17,950,1),(4753,6,950,1),(4754,16,950,0),(4755,8,950,1),(4756,9,950,1),(4757,17,951,1),(4758,6,951,1),(4759,16,951,0),(4760,8,951,1),(4761,9,951,1),(4762,17,952,0),(4763,6,952,1),(4764,16,952,0),(4765,8,952,1),(4766,9,952,0),(4767,17,953,1),(4768,6,953,1),(4769,16,953,0),(4770,8,953,1),(4771,9,953,0),(4772,17,954,0),(4773,6,954,1),(4774,16,954,0),(4775,8,954,1),(4776,9,954,0),(4777,17,955,0),(4778,6,955,1),(4779,16,955,0),(4780,8,955,1),(4781,9,955,0),(4782,17,956,0),(4783,6,956,1),(4784,16,956,0),(4785,8,956,1),(4786,9,956,0),(4787,17,957,1),(4788,6,957,1),(4789,16,957,0),(4790,8,957,1),(4791,9,957,1),(4792,8,958,1),(4793,8,959,1),(4794,8,960,0),(4795,9,960,0),(4796,6,961,1),(4797,6,962,1),(4798,6,963,1),(4799,6,964,1),(4800,9,948,0),(4801,9,961,0),(4802,9,962,0),(4803,9,963,0),(4804,9,964,0),(4805,8,948,0),(4806,8,961,0),(4807,8,962,0),(4808,8,963,0),(4809,8,964,0),(4810,16,948,0),(4811,16,961,0),(4812,16,962,0),(4813,16,963,0),(4814,16,964,0),(4815,17,948,0),(4816,17,961,0),(4817,17,962,0),(4818,17,963,0),(4819,17,964,0),(4820,9,965,0),(4821,8,965,0),(4822,16,965,0),(4823,17,965,0),(4824,9,966,0),(4825,8,966,1),(4826,16,966,0),(4827,17,966,0),(4828,9,967,0),(4829,8,967,0),(4830,16,967,0),(4831,17,967,0),(4832,9,968,0),(4833,8,968,0),(4834,16,968,0),(4835,17,968,0),(4836,9,969,0),(4837,8,969,0),(4838,16,969,0),(4839,17,969,0),(4840,9,970,0),(4841,8,970,0),(4842,16,970,0),(4843,17,970,0),(4844,9,971,0),(4845,8,971,0),(4846,16,971,0),(4847,17,971,0),(4848,9,972,0),(4849,8,972,1),(4850,16,972,0),(4851,17,972,1),(4859,17,973,1),(4860,9,974,0),(4861,8,974,1),(4862,16,974,0),(4863,17,974,1),(4864,9,975,0),(4865,8,975,1),(4866,16,975,0),(4867,17,975,0),(4868,9,976,0),(4869,8,976,0),(4870,16,976,1),(4871,17,976,0),(4872,9,977,1),(4873,8,977,1),(4874,16,977,1),(4875,17,977,1),(5074,8,514,1),(5075,8,509,1),(5076,8,978,0),(5077,8,979,0),(5078,8,980,0),(5079,8,981,0),(5080,8,982,0),(5081,8,983,0),(5082,9,978,0),(5083,9,979,0),(5084,9,980,0),(5085,9,981,0),(5086,9,982,0),(5087,9,983,0),(5088,17,978,0),(5089,17,979,0),(5090,17,981,0),(5091,17,982,0),(5092,17,983,0),(5093,16,984,1),(5094,17,985,0),(5095,9,985,0),(5096,8,985,0),(5097,9,986,0),(5098,8,986,1),(5099,9,987,0),(5100,8,987,1),(5101,9,988,0),(5102,8,988,0),(5103,9,989,0),(5104,8,989,0),(5105,9,990,0),(5106,8,990,0),(5107,9,991,0),(5108,8,991,0),(5109,9,992,0),(5110,8,992,0),(5111,9,993,0),(5112,8,993,0),(5113,9,994,0),(5114,8,994,0),(5115,9,995,0),(5116,8,995,0),(5117,9,996,0),(5118,8,996,0),(5119,9,997,0),(5120,8,997,0),(5121,9,998,0),(5122,8,998,0),(5123,9,999,0),(5124,8,999,0),(5125,9,1000,0),(5126,8,1000,0),(5127,9,1001,0),(5128,8,1001,0),(5129,9,1002,0),(5130,8,1002,0),(5131,9,1003,0),(5132,8,1003,0),(5133,9,1004,0),(5134,8,1004,0),(5135,9,1005,0),(5136,8,1005,0),(5137,9,1006,0),(5138,8,1006,0),(5139,9,1007,0),(5140,8,1007,1),(5141,9,1008,0),(5142,8,1008,1),(5143,9,1009,0),(5144,8,1009,1),(5145,9,1010,0),(5146,8,1010,1),(5147,9,1011,0),(5148,8,1011,1),(5149,9,1012,0),(5150,8,1012,1),(5151,9,1013,0),(5152,8,1013,1),(5153,9,1014,0),(5154,8,1014,1),(5155,9,1015,0),(5156,8,1015,1),(5157,9,1016,0),(5158,8,1016,1),(5159,9,1017,0),(5160,8,1017,1),(5161,9,1018,0),(5162,8,1018,1),(5163,9,1019,0),(5164,8,1019,1),(5165,9,1020,0),(5166,8,1020,1),(5167,9,1021,0),(5168,8,1021,1),(5169,9,1022,0),(5170,8,1022,0),(5171,0,1023,0),(5172,0,1024,0),(5173,9,1025,0),(5174,8,1025,0),(5175,9,1026,1),(5176,8,1026,1),(5177,17,1026,1),(5178,17,1025,1),(5179,9,1027,0),(5180,17,1027,0),(5181,6,1027,0),(5182,8,1027,1),(5183,17,1028,1),(5184,17,1029,0),(5185,17,1030,0),(5186,8,1029,0),(5187,8,1030,0),(5188,9,1029,0),(5189,9,1030,0),(5190,9,1031,0),(5191,17,1031,1),(5192,8,1031,1),(5193,9,1032,0),(5194,9,1033,0),(5195,9,1034,0),(5196,9,1035,0),(5197,9,1036,0),(5198,9,1037,0),(5199,9,1038,0),(5200,9,1039,0),(5201,9,1040,0),(5202,9,1041,0),(5203,9,1042,0),(5204,9,1043,0),(5205,9,1044,0),(5206,9,1045,0),(5207,9,1046,0),(5208,9,1047,0),(5209,9,1024,0),(5210,8,1045,1),(5211,17,1046,1),(5212,17,1047,1),(5213,17,1039,1),(5214,8,1046,1),(5215,8,1047,1),(5216,8,1043,1),(5217,17,1038,1),(5218,17,1040,1),(5219,17,1041,1),(5220,9,1048,0),(5221,9,1049,0),(5222,9,1050,0),(5223,9,1051,0),(5224,9,1052,0),(5225,9,1053,0),(5226,9,1054,0),(5227,9,1055,0),(5228,9,1056,0),(5229,9,1057,1),(5230,9,1058,0),(5231,9,1059,0),(5232,9,1060,0),(5233,9,1061,0),(5234,9,1062,0),(5235,9,1063,0),(5236,9,1064,0),(5237,9,1065,0),(5238,9,1066,0),(5239,9,1067,0),(5240,9,1068,0),(5241,9,1069,0),(5242,9,1070,0),(5243,9,1071,0),(5244,17,1067,1),(5245,17,1068,1),(5246,8,1067,1),(5247,8,1068,1),(5248,8,1056,1),(5249,8,1057,1),(5250,17,1056,1),(5251,17,1057,1),(5252,8,1065,1),(5253,17,1072,1),(5254,6,1073,1),(5255,17,1073,0),(5256,8,1073,1),(5257,9,1073,0),(5258,16,1073,0),(5259,6,1074,1),(5260,17,1074,0),(5261,8,1074,1),(5262,9,1074,0),(5263,16,1074,0),(5264,6,1075,1),(5265,17,1075,0),(5266,8,1075,1),(5267,9,1075,0),(5268,16,1075,0),(5269,6,1076,1),(5270,17,1076,0),(5271,8,1076,1),(5272,9,1076,0),(5273,16,1076,0),(5274,6,1077,1),(5275,17,1077,0),(5276,8,1077,1),(5277,9,1077,0),(5278,16,1077,0),(5279,6,1078,1),(5280,17,1078,0),(5281,8,1078,1),(5282,9,1078,0),(5283,16,1078,0),(5284,6,1079,1),(5285,17,1079,0),(5286,8,1079,1),(5287,9,1079,0),(5288,16,1079,0),(5289,6,1080,1),(5290,17,1080,0),(5291,8,1080,1),(5292,9,1080,0),(5293,16,1080,0),(5294,6,1081,1),(5295,17,1081,0),(5296,8,1081,1),(5297,9,1081,0),(5298,16,1081,0),(5299,6,1082,1),(5300,17,1082,0),(5301,8,1082,1),(5302,9,1082,0),(5303,16,1082,0),(5304,8,1063,1),(5305,8,1062,1),(5306,8,1083,1),(5307,8,0,1),(5308,8,1084,1),(5309,8,1085,1),(5310,8,1086,1),(5311,8,1087,1),(5312,8,1088,1),(5313,8,1089,1),(5314,8,1090,1),(5315,8,1091,1),(5316,8,1040,1),(5317,9,1023,0),(5318,8,1023,0),(5319,8,1024,0),(5320,8,1092,0),(5321,8,1093,0),(5322,9,1092,0),(5323,9,1093,0),(5324,8,1064,1),(5325,8,1094,1),(5326,8,1095,0),(5327,8,1096,0),(5328,8,1097,0),(5329,8,1098,0),(5330,8,1099,0),(5331,9,1095,0),(5332,9,1096,0),(5333,9,1097,0),(5334,9,1098,0),(5335,9,1099,0),(5336,17,1095,0),(5337,17,1096,0),(5338,17,1097,0),(5339,17,1098,0),(5340,17,1099,0),(5341,17,1100,0),(5342,17,1101,0),(5343,17,1102,0),(5344,17,1103,0),(5345,17,1104,0),(5346,17,1105,0),(5347,9,1100,0),(5348,9,1101,0),(5349,9,1102,0),(5350,9,1103,0),(5351,9,1104,0),(5352,9,1105,0),(5353,8,1100,1),(5354,8,1101,1),(5355,8,1102,1),(5356,8,1103,1),(5357,8,1104,1),(5358,8,1105,1),(5359,8,1106,1),(5360,8,1107,1),(5361,8,1108,1),(5362,8,1109,1),(5363,6,1110,1),(5364,6,1111,1),(5365,6,1112,1),(5366,6,1113,1),(5367,6,1114,1),(5368,6,1115,1),(5369,8,1110,1),(5370,8,1111,1),(5371,8,1112,1),(5372,8,1113,1),(5373,8,1114,1),(5374,8,1115,1),(5375,6,1116,1),(5376,6,1117,1),(5377,6,1118,1),(5378,6,1119,1),(5379,6,1120,1),(5380,6,1121,1),(5381,8,1116,1),(5382,8,1117,1),(5383,8,1118,1),(5384,8,1119,1),(5385,8,1120,1),(5386,8,1121,1),(5387,6,1122,1),(5388,6,1123,1),(5389,6,1124,1),(5390,6,1125,1),(5391,6,1126,1),(5392,6,1127,1),(5393,8,1122,1),(5394,8,1123,1),(5395,8,1124,1),(5396,8,1125,1),(5397,8,1126,1),(5398,8,1127,1),(5399,8,1128,0),(5400,8,1129,0),(5401,8,1130,0),(5402,8,1131,0),(5403,8,1132,0),(5404,8,1133,0),(5405,8,1134,0),(5406,8,1135,0),(5407,17,1130,0),(5408,17,1131,0),(5409,17,1132,0),(5410,17,1133,0),(5411,17,1134,0),(5412,17,1135,0),(5413,9,1130,0),(5414,9,1131,0),(5415,9,1132,0),(5416,9,1133,0),(5417,9,1134,0),(5418,9,1135,0),(5419,8,1136,1),(5420,9,1137,0),(5421,17,1066,1),(5422,9,1138,0),(5423,9,1139,0),(5424,9,1140,0),(5425,9,1141,0),(5426,9,1142,0),(5427,9,1143,0),(5428,9,1144,0),(5429,9,1145,0),(5430,9,1146,0),(5431,9,1147,0),(5432,9,1148,0),(5433,9,1149,0),(5434,9,1150,0),(5435,9,1151,0),(5436,17,1152,0),(5437,17,1153,0),(5438,17,1154,0),(5439,17,1155,0),(5440,17,1156,0),(5441,9,1152,0),(5442,9,1153,0),(5443,9,1154,0),(5444,9,1155,0),(5445,9,1156,0),(5446,6,1152,1),(5447,6,1153,1),(5448,6,1154,1),(5449,6,1155,1),(5450,6,1156,1),(5451,8,1152,0),(5452,8,1153,0),(5453,8,1154,0),(5454,8,1155,0),(5455,8,1156,0),(5456,6,1157,1),(5457,6,1158,1),(5458,6,1159,1),(5459,6,1160,1),(5460,6,1161,1),(5461,6,1162,1),(5462,17,1157,0),(5463,17,1158,0),(5464,17,1159,0),(5465,17,1160,0),(5466,17,1161,0),(5467,17,1162,0),(5468,8,1157,0),(5469,8,1158,0),(5470,8,1159,0),(5471,8,1160,0),(5472,8,1161,0),(5473,8,1162,0),(5474,9,1157,0),(5475,9,1158,0),(5476,9,1159,0),(5477,9,1160,0),(5478,9,1161,0),(5479,9,1162,0),(5480,8,1163,1),(5481,8,1164,1),(5482,8,1165,1),(5483,8,973,1),(5484,0,682,1),(5485,8,1166,1),(5486,9,1167,0),(5487,8,1168,1),(5488,8,1169,1),(5489,8,1170,1),(5490,8,1171,1),(5491,8,1172,1),(5492,9,1168,1),(5493,9,1169,1),(5494,9,1170,1),(5495,9,1171,1),(5496,9,1172,1),(5497,17,1168,1),(5498,17,1169,1),(5499,17,1170,1),(5500,17,1171,1),(5501,17,1172,1),(5502,6,1168,1),(5503,6,1169,1),(5504,6,1170,1),(5505,6,1171,1),(5506,6,1172,1),(5507,6,1173,1),(5508,6,1174,1),(5509,8,1173,1),(5510,8,1174,1),(5511,17,1173,1),(5512,17,1174,1),(5513,6,1175,1),(5514,6,1176,1),(5515,6,1177,1),(5516,6,1178,1),(5517,17,1175,1),(5518,17,1176,1),(5519,17,1177,1),(5520,17,1178,1),(5521,9,1179,0),(5522,9,1180,0),(5523,17,1179,1),(5524,17,1180,1),(5525,8,1179,1),(5526,8,1180,1),(5527,8,1036,1),(5528,8,1042,1),(5529,8,1181,1),(5530,8,1182,1),(5531,8,1183,1),(5532,8,1184,1),(5533,8,1185,1),(5534,8,1186,1),(5535,8,1034,1),(5536,8,1187,1),(5537,17,1187,1),(5538,17,1188,1),(5539,17,1189,1),(5540,8,1188,1),(5541,8,1189,1),(5542,17,1044,1),(5544,9,1187,1),(5545,17,1042,1),(5546,17,1043,1),(5547,6,1190,1),(5548,17,1190,0),(5549,8,1190,0),(5550,9,1190,0),(5551,16,1190,0),(5552,6,1191,1),(5553,17,1191,0),(5554,8,1191,0),(5555,9,1191,0),(5556,16,1191,0),(5557,6,1192,1),(5558,17,1192,0),(5559,8,1192,0),(5560,9,1192,0),(5561,16,1192,0),(5562,6,1193,1),(5563,17,1193,0),(5564,8,1193,0),(5565,9,1193,0),(5566,16,1193,0),(5567,6,1194,1),(5568,17,1194,0),(5569,8,1194,0),(5570,9,1194,0),(5571,16,1194,0),(5572,6,1195,1),(5573,17,1195,0),(5574,8,1195,0),(5575,9,1195,0),(5576,16,1195,0),(5577,8,1196,0),(5578,17,1196,1),(5579,16,1196,0),(5580,6,1196,1),(5581,9,1196,0),(5582,8,1197,0),(5583,17,1197,1),(5584,16,1197,0),(5585,6,1197,1),(5586,9,1197,0),(5587,8,1198,0),(5588,17,1198,1),(5589,16,1198,0),(5590,6,1198,1),(5591,9,1198,0),(5592,8,1199,0),(5593,17,1199,1),(5594,16,1199,0),(5595,6,1199,1),(5596,9,1199,0),(5597,8,1200,0),(5598,17,1200,1),(5599,16,1200,0),(5600,6,1200,1),(5601,9,1200,0),(5607,6,1201,1),(5608,17,1201,1),(5609,8,1201,0),(5610,9,1201,0),(5611,16,1201,0),(5612,6,1202,1),(5613,17,1202,0),(5614,8,1202,0),(5615,9,1202,0),(5616,16,1202,0),(5617,17,1034,1),(5618,17,1203,0),(5619,17,1204,0),(5620,17,1205,0),(5621,17,1206,0),(5622,17,1207,0),(5623,17,1208,0),(5624,17,1209,0),(5625,17,1210,0),(5626,17,1211,0),(5627,17,1212,0),(5628,17,1213,0),(5629,17,1214,0),(5630,17,1215,0),(5631,17,1216,0),(5632,17,1217,0),(5633,17,1218,0),(5634,17,1219,0),(5635,17,1220,0),(5636,9,1203,1),(5637,9,1204,1),(5638,9,1205,1),(5639,9,1206,1),(5640,9,1207,1),(5641,9,1208,1),(5642,9,1209,1),(5643,9,1210,1),(5644,9,1211,1),(5645,9,1212,1),(5646,9,1213,1),(5647,9,1214,1),(5648,9,1215,1),(5649,9,1216,1),(5650,9,1217,1),(5651,9,1218,1),(5652,9,1219,1),(5653,9,1220,1),(5654,8,1203,1),(5655,8,1204,1),(5656,8,1205,1),(5657,8,1206,1),(5658,8,1207,1),(5659,8,1208,1),(5660,8,1209,1),(5661,8,1210,1),(5662,8,1211,1),(5663,8,1212,1),(5664,8,1213,1),(5665,8,1214,1),(5666,8,1215,1),(5667,8,1216,1),(5668,8,1217,1),(5669,8,1218,1),(5670,8,1219,1),(5671,8,1220,1),(5672,8,1221,0),(5673,17,1221,0),(5674,9,1221,0),(5675,8,1222,0),(5676,17,1222,0),(5677,9,1222,0),(5678,8,1223,0),(5679,17,1223,0),(5680,9,1223,0),(5681,8,1224,0),(5682,17,1224,0),(5683,9,1224,0),(5684,8,1225,0),(5685,17,1225,0),(5686,9,1225,0),(5687,8,1226,0),(5688,17,1226,0),(5689,9,1226,0),(5690,8,1227,0),(5691,17,1227,0),(5692,9,1227,0),(5693,8,1228,0),(5694,17,1228,0),(5695,9,1228,0),(5696,8,1229,0),(5697,17,1229,0),(5698,9,1229,0),(5699,8,1230,0),(5700,17,1230,0),(5701,9,1230,0),(5702,8,1231,0),(5703,17,1231,0),(5704,9,1231,0),(5705,8,1232,0),(5706,17,1232,0),(5707,9,1232,0),(5708,8,1233,0),(5709,17,1233,0),(5710,9,1233,0),(5711,8,1234,0),(5712,17,1234,0),(5713,9,1234,0),(5714,8,1235,0),(5715,17,1235,0),(5716,9,1235,0),(5717,8,1236,0),(5718,17,1236,0),(5719,9,1236,0),(5720,8,1237,0),(5721,17,1237,0),(5722,9,1237,0),(5723,8,1238,0),(5724,17,1238,0),(5725,9,1238,0),(5726,8,1239,0),(5727,17,1239,0),(5728,9,1239,0),(5729,8,1240,0),(5730,17,1240,0),(5731,9,1240,0),(5732,8,1241,0),(5733,17,1241,0),(5734,9,1241,0),(5735,9,1242,1),(5736,8,1242,0),(5737,17,1242,0),(5738,6,1242,0),(5739,9,1243,1),(5740,8,1243,0),(5741,17,1243,0),(5742,6,1243,0),(5743,8,1244,1),(5744,17,1244,1),(5745,9,1244,1),(5746,8,1245,1),(5747,17,1245,1),(5748,9,1245,1),(5749,8,1246,1),(5750,17,1246,0),(5751,9,1246,0),(5752,8,1247,1),(5753,17,1247,0),(5754,9,1247,0);
/*!40000 ALTER TABLE `role_rights` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `role_name` (`name`),
  KEY `roles_name_index` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (17,'accountant'),(6,'admin'),(16,'guest'),(8,'reseller'),(9,'user');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `server_devices`
--

DROP TABLE IF EXISTS `server_devices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `server_devices` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `device_id` int(10) unsigned NOT NULL,
  `server_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `device_server_index` (`device_id`,`server_id`),
  KEY `server_device_index` (`server_id`,`device_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `server_devices`
--

LOCK TABLES `server_devices` WRITE;
/*!40000 ALTER TABLE `server_devices` DISABLE KEYS */;
INSERT INTO `server_devices` VALUES (1,2,1);
/*!40000 ALTER TABLE `server_devices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `server_loadstats`
--

DROP TABLE IF EXISTS `server_loadstats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `server_loadstats` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `server_id` int(11) NOT NULL COMMENT '->servers.id',
  `datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `hdd_util` decimal(8,4) NOT NULL DEFAULT '0.0000',
  `cpu_general_load` decimal(8,4) NOT NULL DEFAULT '0.0000',
  `cpu_mysql_load` decimal(8,4) NOT NULL DEFAULT '0.0000',
  `cpu_ruby_load` decimal(8,4) NOT NULL DEFAULT '0.0000',
  `cpu_asterisk_load` decimal(8,4) NOT NULL DEFAULT '0.0000',
  `cpu_loadstats1` decimal(8,4) NOT NULL DEFAULT '0.0000',
  PRIMARY KEY (`id`),
  KEY `server_id` (`server_id`),
  KEY `datetime` (`datetime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `server_loadstats`
--

LOCK TABLES `server_loadstats` WRITE;
/*!40000 ALTER TABLE `server_loadstats` DISABLE KEYS */;
/*!40000 ALTER TABLE `server_loadstats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `serverproviders`
--

DROP TABLE IF EXISTS `serverproviders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `serverproviders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `server_id` int(11) NOT NULL,
  `provider_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `serverproviders`
--

LOCK TABLES `serverproviders` WRITE;
/*!40000 ALTER TABLE `serverproviders` DISABLE KEYS */;
INSERT INTO `serverproviders` VALUES (1,1,2),(2,1,3);
/*!40000 ALTER TABLE `serverproviders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servers`
--

DROP TABLE IF EXISTS `servers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `servers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `server_ip` varchar(255) NOT NULL,
  `stats_url` varchar(255) DEFAULT NULL,
  `server_type` enum('asterisk','sip_proxy') NOT NULL DEFAULT 'asterisk',
  `active` tinyint(4) DEFAULT '0',
  `comment` varchar(255) DEFAULT NULL,
  `hostname` varchar(255) DEFAULT NULL,
  `maxcalllimit` int(11) DEFAULT '1000',
  `ami_port` varchar(255) DEFAULT '5038',
  `ami_secret` varchar(255) DEFAULT 'morsecret',
  `ami_username` varchar(255) DEFAULT 'mor',
  `port` int(11) DEFAULT '5060',
  `ssh_username` varchar(255) DEFAULT 'root',
  `ssh_secret` varchar(255) DEFAULT NULL,
  `ssh_port` int(11) DEFAULT '22',
  `gateway_active` tinyint(4) DEFAULT '0',
  `version` varchar(30) DEFAULT NULL,
  `uptime` varchar(150) DEFAULT NULL,
  `gui` tinyint(4) DEFAULT '0',
  `db` tinyint(4) DEFAULT '0',
  `core` tinyint(4) DEFAULT '0',
  `load_ok` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servers`
--

LOCK TABLES `servers` WRITE;
/*!40000 ALTER TABLE `servers` DISABLE KEYS */;
INSERT INTO `servers` VALUES (1,'127.0.0.1','','asterisk',1,'main system','127.0.0.1',500,'5038','morsecret','mor',5060,'root','',22,0,'1.8.23.0','4 weeks, 4 hours, 50 minutes, 49 seconds \nLast reload: 4 weeks, 4 hours, 50 minutes, 49 seconds',1,1,1,1);
/*!40000 ALTER TABLE `servers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `services`
--

DROP TABLE IF EXISTS `services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `services` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `servicetype` enum('flat_rate','one_time_fee','periodic_fee') DEFAULT NULL,
  `destinationgroup_id` int(11) DEFAULT NULL,
  `periodtype` enum('day','month') DEFAULT NULL,
  `price` decimal(30,15) DEFAULT '0.000000000000000',
  `owner_id` int(11) DEFAULT '0',
  `quantity` int(11) DEFAULT '1',
  `selfcost_price` decimal(30,15) DEFAULT '0.000000000000000',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services`
--

LOCK TABLES `services` WRITE;
/*!40000 ALTER TABLE `services` DISABLE KEYS */;
/*!40000 ALTER TABLE `services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sms_adactions`
--

DROP TABLE IF EXISTS `sms_adactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sms_adactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `priority` int(11) DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `data` varchar(255) DEFAULT NULL,
  `sms_campaign_id` int(11) DEFAULT NULL,
  `data2` varchar(50) DEFAULT NULL,
  `data3` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sms_adactions`
--

LOCK TABLES `sms_adactions` WRITE;
/*!40000 ALTER TABLE `sms_adactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `sms_adactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sms_adnumbers`
--

DROP TABLE IF EXISTS `sms_adnumbers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sms_adnumbers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT 'new',
  `sms_campaign_id` int(11) DEFAULT NULL,
  `executed_time` datetime DEFAULT NULL,
  `completed_time` datetime DEFAULT NULL,
  `channel` varchar(255) DEFAULT NULL,
  `uniqueid` varchar(30) DEFAULT NULL,
  `user_id` int(11) DEFAULT '0' COMMENT 'Owner id of adnumbers',
  PRIMARY KEY (`id`),
  KEY `ad1` (`status`,`sms_campaign_id`) USING BTREE,
  KEY `number_index` (`number`),
  KEY `campaign_id_index` (`sms_campaign_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sms_adnumbers`
--

LOCK TABLES `sms_adnumbers` WRITE;
/*!40000 ALTER TABLE `sms_adnumbers` DISABLE KEYS */;
/*!40000 ALTER TABLE `sms_adnumbers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sms_campaigns`
--

DROP TABLE IF EXISTS `sms_campaigns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sms_campaigns` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `campaign_type` varchar(255) DEFAULT 'basic',
  `status` varchar(255) DEFAULT NULL,
  `run_time` datetime DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `stop_time` time DEFAULT NULL,
  `max_retries` int(11) DEFAULT '0',
  `retry_time` int(11) DEFAULT '120',
  `wait_time` int(11) DEFAULT '30',
  `user_id` int(11) DEFAULT NULL,
  `device_id` int(11) DEFAULT NULL,
  `callerid` varchar(100) DEFAULT '',
  `owner_id` int(11) DEFAULT '0' COMMENT 'Owner id of compaigns',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sms_campaigns`
--

LOCK TABLES `sms_campaigns` WRITE;
/*!40000 ALTER TABLE `sms_campaigns` DISABLE KEYS */;
/*!40000 ALTER TABLE `sms_campaigns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sms_lcrproviders`
--

DROP TABLE IF EXISTS `sms_lcrproviders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sms_lcrproviders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sms_lcr_id` int(11) NOT NULL,
  `sms_provider_id` int(11) NOT NULL,
  `active` int(11) DEFAULT '1',
  `priority` int(11) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sms_lcrproviders`
--

LOCK TABLES `sms_lcrproviders` WRITE;
/*!40000 ALTER TABLE `sms_lcrproviders` DISABLE KEYS */;
/*!40000 ALTER TABLE `sms_lcrproviders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sms_lcrs`
--

DROP TABLE IF EXISTS `sms_lcrs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sms_lcrs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `order` varchar(255) DEFAULT 'price',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sms_lcrs`
--

LOCK TABLES `sms_lcrs` WRITE;
/*!40000 ALTER TABLE `sms_lcrs` DISABLE KEYS */;
/*!40000 ALTER TABLE `sms_lcrs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sms_messages`
--

DROP TABLE IF EXISTS `sms_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sms_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sending_date` datetime DEFAULT NULL,
  `status_code` varchar(255) DEFAULT NULL,
  `provider_id` int(11) DEFAULT NULL,
  `provider_rate` decimal(30,15) DEFAULT '0.000000000000000',
  `provider_price` decimal(30,15) DEFAULT '0.000000000000000',
  `user_id` int(11) DEFAULT NULL,
  `user_rate` decimal(30,15) DEFAULT '0.000000000000000',
  `user_price` decimal(30,15) DEFAULT '0.000000000000000',
  `reseller_id` int(11) DEFAULT '0',
  `reseller_rate` decimal(30,15) DEFAULT '0.000000000000000',
  `reseller_price` decimal(30,15) DEFAULT '0.000000000000000',
  `prefix` varchar(255) DEFAULT NULL,
  `number` varchar(255) DEFAULT NULL,
  `clickatell_message_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sms_messages`
--

LOCK TABLES `sms_messages` WRITE;
/*!40000 ALTER TABLE `sms_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `sms_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sms_providers`
--

DROP TABLE IF EXISTS `sms_providers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sms_providers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `login` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `api_id` int(11) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `sms_tariff_id` int(11) DEFAULT NULL,
  `provider_type` varchar(255) DEFAULT NULL,
  `sms_provider_domain` varchar(255) DEFAULT NULL,
  `use_subject` varchar(255) DEFAULT NULL,
  `sms_subject` varchar(255) DEFAULT NULL,
  `sms_email_wait_time` varchar(255) DEFAULT '0',
  `wait_for_good_email` int(11) DEFAULT '0',
  `email_good_keywords` varchar(255) DEFAULT NULL,
  `wait_for_bad_email` int(11) DEFAULT '0',
  `email_bad_keywords` varchar(255) DEFAULT NULL,
  `time_out_charge_user` int(11) DEFAULT '0',
  `nan_keywords_charge_user` int(11) DEFAULT '0',
  `pay_sms_receiver` int(11) DEFAULT '0',
  `sms_from` varchar(255) DEFAULT '' COMMENT 'SMS source address, sender ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sms_providers`
--

LOCK TABLES `sms_providers` WRITE;
/*!40000 ALTER TABLE `sms_providers` DISABLE KEYS */;
/*!40000 ALTER TABLE `sms_providers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sms_rates`
--

DROP TABLE IF EXISTS `sms_rates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sms_rates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `prefix` varchar(255) DEFAULT NULL,
  `price` decimal(30,15) DEFAULT '0.000000000000000',
  `sms_tariff_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sms_rates`
--

LOCK TABLES `sms_rates` WRITE;
/*!40000 ALTER TABLE `sms_rates` DISABLE KEYS */;
/*!40000 ALTER TABLE `sms_rates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sms_tariffs`
--

DROP TABLE IF EXISTS `sms_tariffs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sms_tariffs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `tariff_type` varchar(255) DEFAULT NULL,
  `owner_id` int(11) DEFAULT '0',
  `currency` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sms_tariffs`
--

LOCK TABLES `sms_tariffs` WRITE;
/*!40000 ALTER TABLE `sms_tariffs` DISABLE KEYS */;
/*!40000 ALTER TABLE `sms_tariffs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscriptions`
--

DROP TABLE IF EXISTS `subscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subscriptions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `service_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `device_id` int(11) DEFAULT NULL,
  `activation_start` datetime DEFAULT NULL,
  `activation_end` datetime DEFAULT NULL,
  `added` datetime DEFAULT NULL,
  `memo` varchar(255) DEFAULT NULL,
  `no_expire` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscriptions`
--

LOCK TABLES `subscriptions` WRITE;
/*!40000 ALTER TABLE `subscriptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `subscriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tariffs`
--

DROP TABLE IF EXISTS `tariffs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tariffs` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `purpose` varchar(255) NOT NULL DEFAULT 'user',
  `owner_id` int(11) DEFAULT '0',
  `currency` varchar(255) DEFAULT NULL,
  `code_deck_id` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tariffs`
--

LOCK TABLES `tariffs` WRITE;
/*!40000 ALTER TABLE `tariffs` DISABLE KEYS */;
INSERT INTO `tariffs` VALUES (1,'PREMIUM','provider',0,'EUR',1),(2,'PREMIUM','user_wholesale',0,'EUR',1),(3,'STANDARD','provider',0,'EUR',1),(4,'STANDARD','user_wholesale',0,'EUR',1);
/*!40000 ALTER TABLE `tariffs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taxes`
--

DROP TABLE IF EXISTS `taxes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taxes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tax1_enabled` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Shows if tax is enabled',
  `tax2_enabled` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Shows if tax is enabled',
  `tax3_enabled` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Shows if tax is enabled',
  `tax4_enabled` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Shows if tax is enabled',
  `tax1_name` varchar(255) NOT NULL DEFAULT '' COMMENT 'Tax name',
  `tax2_name` varchar(255) NOT NULL DEFAULT '' COMMENT 'Tax name',
  `tax3_name` varchar(255) NOT NULL DEFAULT '' COMMENT 'Tax name',
  `tax4_name` varchar(255) NOT NULL DEFAULT '' COMMENT 'Tax name',
  `total_tax_name` varchar(255) NOT NULL DEFAULT '' COMMENT 'Name of total tax. Sum of all taxes',
  `tax1_value` decimal(30,15) DEFAULT '0.000000000000000',
  `tax2_value` decimal(30,15) DEFAULT '0.000000000000000',
  `tax3_value` decimal(30,15) DEFAULT '0.000000000000000',
  `tax4_value` decimal(30,15) DEFAULT '0.000000000000000',
  `compound_tax` tinyint(4) DEFAULT '1' COMMENT 'is this tax compound',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taxes`
--

LOCK TABLES `taxes` WRITE;
/*!40000 ALTER TABLE `taxes` DISABLE KEYS */;
INSERT INTO `taxes` VALUES (1,0,0,0,0,'Tax','','','','Tax',0.000000000000000,0.000000000000000,0.000000000000000,0.000000000000000,1),(2,0,0,0,0,'Tax','','','','Tax',0.000000000000000,0.000000000000000,0.000000000000000,0.000000000000000,1);
/*!40000 ALTER TABLE `taxes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `terminators`
--

DROP TABLE IF EXISTS `terminators`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `terminators` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `user_id` int(11) DEFAULT '0' COMMENT 'ID of the user who owns terminator',
  PRIMARY KEY (`id`),
  KEY `user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `terminators`
--

LOCK TABLES `terminators` WRITE;
/*!40000 ALTER TABLE `terminators` DISABLE KEYS */;
INSERT INTO `terminators` VALUES (1,'Kolmisoft',0);
/*!40000 ALTER TABLE `terminators` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `time_periods`
--

DROP TABLE IF EXISTS `time_periods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `time_periods` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `from_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `period_type` enum('hour','day','month','year') DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `from_date_index` (`from_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `time_periods`
--

LOCK TABLES `time_periods` WRITE;
/*!40000 ALTER TABLE `time_periods` DISABLE KEYS */;
/*!40000 ALTER TABLE `time_periods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `timezones`
--

DROP TABLE IF EXISTS `timezones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `timezones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `zone` varchar(100) NOT NULL,
  `offset` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `zone` (`zone`),
  KEY `zone_index` (`zone`(4))
) ENGINE=InnoDB AUTO_INCREMENT=148 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timezones`
--

LOCK TABLES `timezones` WRITE;
/*!40000 ALTER TABLE `timezones` DISABLE KEYS */;
INSERT INTO `timezones` VALUES (1,'American Samoa',-39600),(2,'International Date Line West',-39600),(3,'Midway Island',-39600),(4,'Hawaii',-36000),(5,'Alaska',-28800),(6,'Pacific Time (US & Canada)',-25200),(7,'Tijuana',-25200),(8,'Arizona',-25200),(9,'Chihuahua',-21600),(10,'Mazatlan',-21600),(11,'Mountain Time (US & Canada)',-21600),(12,'Central America',-21600),(13,'Central Time (US & Canada)',-18000),(14,'Guadalajara',-18000),(15,'Mexico City',-18000),(16,'Monterrey',-18000),(17,'Saskatchewan',-21600),(18,'Bogota',-18000),(19,'Eastern Time (US & Canada)',-14400),(20,'Indiana (East)',-14400),(21,'Lima',-18000),(22,'Quito',-18000),(23,'Caracas',-16200),(24,'Atlantic Time (Canada)',-10800),(25,'Georgetown',-14400),(26,'La Paz',-14400),(27,'Santiago',-14400),(28,'Newfoundland',-9000),(29,'Brasilia',-10800),(30,'Buenos Aires',-10800),(31,'Greenland',-7200),(32,'Mid-Atlantic',-7200),(33,'Azores',0),(34,'Cape Verde Is.',-3600),(35,'Casablanca',0),(36,'Dublin',3600),(37,'Edinburgh',3600),(38,'Lisbon',3600),(39,'London',3600),(40,'Monrovia',0),(41,'UTC',0),(42,'Amsterdam',7200),(43,'Belgrade',7200),(44,'Berlin',7200),(45,'Bern',7200),(46,'Bratislava',7200),(47,'Brussels',7200),(48,'Budapest',7200),(49,'Copenhagen',7200),(50,'Ljubljana',7200),(51,'Madrid',7200),(52,'Paris',7200),(53,'Prague',7200),(54,'Rome',7200),(55,'Sarajevo',7200),(56,'Skopje',7200),(57,'Stockholm',7200),(58,'Vienna',7200),(59,'Warsaw',7200),(60,'West Central Africa',3600),(61,'Zagreb',7200),(62,'Athens',10800),(63,'Bucharest',10800),(64,'Cairo',7200),(65,'Harare',7200),(66,'Helsinki',10800),(67,'Istanbul',10800),(68,'Jerusalem',10800),(69,'Kyiv',10800),(70,'Pretoria',7200),(71,'Riga',10800),(72,'Sofia',10800),(73,'Tallinn',10800),(74,'Vilnius',10800),(75,'Baghdad',10800),(76,'Kuwait',10800),(77,'Minsk',10800),(78,'Nairobi',10800),(79,'Riyadh',10800),(80,'Tehran',16200),(81,'Abu Dhabi',14400),(82,'Baku',18000),(83,'Moscow',14400),(84,'Muscat',14400),(85,'St. Petersburg',14400),(86,'Tbilisi',14400),(87,'Volgograd',14400),(88,'Yerevan',14400),(89,'Kabul',16200),(90,'Islamabad',18000),(91,'Karachi',18000),(92,'Tashkent',18000),(93,'Chennai',19800),(94,'Kolkata',19800),(95,'Mumbai',19800),(96,'New Delhi',19800),(97,'Sri Jayawardenepura',19800),(98,'Kathmandu',20700),(99,'Almaty',21600),(100,'Astana',21600),(101,'Dhaka',21600),(102,'Ekaterinburg',21600),(103,'Rangoon',23400),(104,'Bangkok',25200),(105,'Hanoi',25200),(106,'Jakarta',25200),(107,'Novosibirsk',25200),(108,'Beijing',28800),(109,'Chongqing',28800),(110,'Hong Kong',28800),(111,'Krasnoyarsk',28800),(112,'Kuala Lumpur',28800),(113,'Perth',28800),(114,'Singapore',28800),(115,'Taipei',28800),(116,'Ulaan Bataar',28800),(117,'Urumqi',28800),(118,'Irkutsk',32400),(119,'Osaka',32400),(120,'Sapporo',32400),(121,'Seoul',32400),(122,'Tokyo',32400),(123,'Adelaide',34200),(124,'Darwin',34200),(125,'Brisbane',36000),(126,'Canberra',36000),(127,'Guam',36000),(128,'Hobart',36000),(129,'Melbourne',36000),(130,'Port Moresby',36000),(131,'Sydney',36000),(132,'Yakutsk',36000),(133,'New Caledonia',39600),(134,'Vladivostok',39600),(135,'Auckland',43200),(136,'Fiji',43200),(137,'Kamchatka',43200),(138,'Magadan',43200),(139,'Marshall Is.',43200),(140,'Solomon Is.',39600),(141,'Wellington',43200),(142,'Nuku\'alofa',46800),(143,'Samoa',46800),(144,'Tokelau Is.',46800),(145,'Montevideo',-10800),(146,'Ulaanbaatar',28800),(147,'Chatham Is.',45900);
/*!40000 ALTER TABLE `timezones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `translations`
--

DROP TABLE IF EXISTS `translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `translations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `native_name` varchar(255) NOT NULL,
  `short_name` varchar(255) NOT NULL,
  `position` int(11) NOT NULL,
  `active` tinyint(4) DEFAULT '1',
  `flag` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translations`
--

LOCK TABLES `translations` WRITE;
/*!40000 ALTER TABLE `translations` DISABLE KEYS */;
INSERT INTO `translations` VALUES (1,'English','','en',1,1,'gbr'),(2,'Lithuanian','','lt',2,1,'ltu'),(3,'Spanish','','es',3,1,'esp'),(4,'Dutch','Nederlands','nl',4,1,'nld'),(5,'Italian','Italiano','it',5,1,'ita'),(6,'Albanian','Gjuha shqipe','al',6,1,'alb'),(7,'Russian','','ru',7,1,'rus'),(8,'Brazilian Portuguese','','pt',8,1,'bra'),(9,'Estonian','Eesti','et',9,1,'est'),(10,'Bulgarian','','bg',10,1,'bgr'),(11,'Swedish','Svenska','se',11,1,'swe'),(12,'German','Deutch','de',12,1,'deu'),(13,'Armenian','','am',13,1,'arm'),(14,'French','','fr',14,1,'fra'),(15,'Polish','Polski','pl',15,1,'pol'),(16,'Romanian','','ro',16,1,'rom'),(17,'Turkish','','tr',17,1,'tur'),(18,'Indonesian','Bahasa Indonesia','id',18,1,'idn'),(19,'Hungarian','Magyar','hu',19,1,'hun'),(20,'Slovenian','Slovene','sl',100,1,'svn'),(21,'Greek','','gr',101,1,'grc'),(22,'Australian English','','au',102,1,'aus'),(23,'Serbian','Srpski','sr',103,1,'scg'),(24,'Belarussian','','by',104,1,'blr'),(25,'Arabic','','ar',105,1,'ara'),(26,'Macedonian','Makedonski','mk',106,1,'mkd'),(27,'Chinese','','zn',107,1,'chn'),(28,'Urdu','','ur',108,1,'pak'),(29,'Latvian','','lv',109,1,'lva'),(30,'Croatian','','cr',108,1,'hrv'),(31,'Ukrainian','','ua',100,1,'ukr'),(32,'Czech','','cz',32,1,'cze'),(33,'Hebrew','Ivrit','he',110,1,'isr');
/*!40000 ALTER TABLE `translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_translations`
--

DROP TABLE IF EXISTS `user_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_translations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `translation_id` int(11) NOT NULL,
  `position` int(11) NOT NULL,
  `active` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `user_id_index` (`user_id`),
  KEY `translation_id_index` (`translation_id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_translations`
--

LOCK TABLES `user_translations` WRITE;
/*!40000 ALTER TABLE `user_translations` DISABLE KEYS */;
INSERT INTO `user_translations` VALUES (1,0,1,0,1),(2,0,2,1,0),(3,0,3,3,1),(4,0,4,4,0),(5,0,5,2,1),(6,0,6,5,0),(7,0,7,23,1),(8,0,8,6,1),(9,0,9,7,0),(10,0,10,8,0),(11,0,11,9,0),(12,0,12,10,1),(13,0,13,11,0),(14,0,14,12,1),(15,0,15,13,0),(16,0,16,14,0),(17,0,17,15,0),(18,0,18,16,0),(19,0,19,17,0),(20,0,20,21,0),(21,0,21,22,0),(22,0,22,24,0),(23,0,23,25,0),(24,0,24,26,0),(25,0,25,27,1),(26,0,26,28,0),(27,0,27,29,0),(28,0,28,31,0),(29,0,29,32,0),(30,0,30,30,0),(31,0,31,19,0),(32,0,32,18,0),(33,0,33,20,1);
/*!40000 ALTER TABLE `user_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usergroups`
--

DROP TABLE IF EXISTS `usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usergroups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL DEFAULT '0',
  `group_id` bigint(20) NOT NULL DEFAULT '0',
  `gusertype` varchar(255) NOT NULL,
  `position` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `user_id_index` (`user_id`),
  KEY `group_id_index` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usergroups`
--

LOCK TABLES `usergroups` WRITE;
/*!40000 ALTER TABLE `usergroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `usergroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `password` varchar(100) NOT NULL,
  `usertype` varchar(20) NOT NULL DEFAULT 'user',
  `logged` tinyint(4) NOT NULL DEFAULT '0',
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `calltime_normative` decimal(30,15) DEFAULT '3.000000000000000',
  `show_in_realtime_stats` tinyint(4) NOT NULL DEFAULT '0',
  `balance` decimal(30,15) DEFAULT '0.000000000000000',
  `frozen_balance` decimal(30,15) DEFAULT '0.000000000000000',
  `lcr_id` bigint(20) NOT NULL DEFAULT '0',
  `postpaid` tinyint(4) NOT NULL DEFAULT '1',
  `blocked` tinyint(4) NOT NULL DEFAULT '0',
  `tariff_id` bigint(20) NOT NULL DEFAULT '0',
  `month_plan_perc` decimal(30,15) DEFAULT '0.000000000000000',
  `month_plan_updated` datetime DEFAULT '0000-00-00 00:00:00',
  `sales_this_month` int(11) NOT NULL DEFAULT '0',
  `sales_this_month_planned` int(11) NOT NULL DEFAULT '0',
  `show_billing_info` tinyint(4) NOT NULL DEFAULT '1',
  `primary_device_id` int(11) NOT NULL DEFAULT '0',
  `credit` decimal(30,15) DEFAULT '-1.000000000000000',
  `clientid` varchar(30) DEFAULT NULL,
  `agreement_number` varchar(20) DEFAULT NULL,
  `agreement_date` date DEFAULT NULL,
  `language` varchar(10) DEFAULT NULL,
  `taxation_country` int(11) DEFAULT NULL,
  `vat_number` varchar(30) DEFAULT NULL,
  `vat_percent` decimal(30,15) DEFAULT '0.000000000000000',
  `address_id` int(11) DEFAULT NULL,
  `accounting_number` varchar(30) DEFAULT NULL,
  `owner_id` int(11) DEFAULT '0',
  `hidden` tinyint(4) DEFAULT '0',
  `allow_loss_calls` int(11) DEFAULT '0',
  `vouchers_disabled_till` datetime DEFAULT '2000-01-01 00:00:00',
  `uniquehash` varchar(10) DEFAULT NULL,
  `temporary_id` int(11) DEFAULT NULL,
  `send_invoice_types` int(11) DEFAULT '1',
  `call_limit` int(11) DEFAULT '0',
  `sms_tariff_id` int(11) DEFAULT NULL,
  `sms_lcr_id` int(11) DEFAULT NULL,
  `sms_service_active` int(11) DEFAULT '0',
  `cyberplat_active` int(1) DEFAULT '0',
  `call_center_agent` int(11) DEFAULT '0',
  `generate_invoice` tinyint(4) DEFAULT '1',
  `tax_1` decimal(30,15) DEFAULT '0.000000000000000',
  `tax_2` decimal(30,15) DEFAULT '0.000000000000000',
  `tax_3` decimal(30,15) DEFAULT '0.000000000000000',
  `tax_4` decimal(30,15) DEFAULT '0.000000000000000',
  `block_at` date DEFAULT '2008-01-01',
  `block_at_conditional` tinyint(4) DEFAULT '15',
  `block_conditional_use` tinyint(4) DEFAULT '0',
  `recording_enabled` tinyint(4) NOT NULL DEFAULT '0',
  `recording_forced_enabled` tinyint(4) NOT NULL DEFAULT '0',
  `recordings_email` varchar(50) DEFAULT NULL,
  `recording_hdd_quota` int(11) NOT NULL DEFAULT '100',
  `warning_email_active` tinyint(4) NOT NULL DEFAULT '0',
  `warning_email_balance` decimal(30,15) DEFAULT '0.000000000000000',
  `warning_email_sent` tinyint(4) DEFAULT '0',
  `tax_id` int(11) NOT NULL DEFAULT '0',
  `invoice_zero_calls` tinyint(4) NOT NULL DEFAULT '1',
  `acc_group_id` int(11) NOT NULL DEFAULT '0',
  `hide_destination_end` tinyint(4) DEFAULT '-1',
  `warning_email_hour` int(11) DEFAULT '-1' COMMENT 'warning balance email sending at hour',
  `warning_balance_call` int(11) DEFAULT '0' COMMENT 'should system play warning balance on every call?',
  `warning_balance_sound_file_id` int(11) DEFAULT '0' COMMENT 'which file to play when balance drops lower then set value',
  `own_providers` int(11) DEFAULT '0' COMMENT 'should allow provider to have own providers?',
  `currency_id` int(11) DEFAULT '1' COMMENT 'User default currency ID',
  `quickforwards_rule_id` int(11) DEFAULT '0' COMMENT 'User quickforwards rule ID',
  `spy_device_id` int(11) DEFAULT '0' COMMENT 'ChanSpy device ID',
  `time_zone` varchar(255) NOT NULL DEFAULT 'UTC',
  `minimal_charge` int(11) NOT NULL DEFAULT '0' COMMENT '0 means that there is no minimal chrage set/enabled, in this case it wouldnt be logical to set it to 0. By default minimal charge is disabled, hence default value is 0. NOT NULL is set because so that there wouldnt be any ambiguity between NULL and 0 values.',
  `minimal_charge_start_at` datetime DEFAULT NULL COMMENT 'minimal charge date does not have any sence if minimal charge option is disabled, so this value can be NULL and by default it is NULL, because minimal charge is disabled by default',
  `webphone_allow_use` int(11) DEFAULT '0' COMMENT 'webphone enabled for user',
  `webphone_device_id` int(11) DEFAULT '0' COMMENT 'webphone device id',
  `responsible_accountant_id` int(11) DEFAULT '-1',
  `blacklist_enabled` enum('yes','no','global') NOT NULL DEFAULT 'global',
  `blacklist_lcr` int(11) NOT NULL DEFAULT '-1',
  `routing_threshold` int(11) NOT NULL DEFAULT '-1',
  `pbx_pool_id` int(11) NOT NULL DEFAULT '0',
  `hide_non_answered_calls` tinyint(4) NOT NULL DEFAULT '0',
  `balance_min` decimal(10,4) DEFAULT '0.0000',
  `balance_max` decimal(10,4) DEFAULT '0.0000',
  `routing_threshold_2` int(11) NOT NULL DEFAULT '-1',
  `blacklist_lcr_2` int(11) NOT NULL DEFAULT '-1',
  `routing_threshold_3` int(11) NOT NULL DEFAULT '-1',
  `blacklist_lcr_3` int(11) NOT NULL DEFAULT '-1',
  `main_email` varchar(50) DEFAULT NULL,
  `noc_email` varchar(50) DEFAULT NULL,
  `billing_email` varchar(50) DEFAULT NULL,
  `rates_email` varchar(50) DEFAULT NULL,
  `warning_email_balance_admin` decimal(30,15) NOT NULL DEFAULT '0.000000000000000',
  `warning_email_balance_manager` decimal(30,15) NOT NULL DEFAULT '0.000000000000000',
  `billing_period` enum('weekly','bi-weekly','monthly') NOT NULL DEFAULT 'monthly',
  `invoice_grace_period` tinyint(3) NOT NULL DEFAULT '15',
  `warning_email_sent_admin` tinyint(4) DEFAULT '0',
  `warning_email_sent_manager` tinyint(4) DEFAULT '0',
  `comment` text,
  `ignore_global_alerts` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `owner_id_index` (`owner_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (0,'admin','d033e22ae348aeb5660fc2140aec35850c4da997','admin',1,'System','Admin',3.000000000000000,0,0.000000000000000,0.000000000000000,0,0,0,0,0.000000000000000,'2000-01-01 00:00:00',0,0,1,0,-1.000000000000000,'','','2007-03-26','',1,'',0.000000000000000,1,'',0,0,0,'2000-01-01 00:00:00','1c99d99974',NULL,0,0,NULL,NULL,0,0,0,1,0.000000000000000,0.000000000000000,0.000000000000000,0.000000000000000,'2009-01-01',15,0,0,0,NULL,100,0,0.000000000000000,0,1,1,0,-1,0,0,0,0,1,0,0,'London',0,NULL,0,0,-1,'global',-1,-1,0,0,0.0000,0.0000,-1,-1,-1,-1,NULL,NULL,NULL,NULL,0.000000000000000,0.000000000000000,'monthly',15,0,0,NULL,0),(2,'101','8cc322d12549f3160e0ec2c5122f5b96afe214f6','user',0,'Test User','#1',3.000000000000000,1,100.000000000000000,0.000000000000000,1,0,1,2,0.000000000000000,'2000-01-01 00:00:00',0,0,1,2,-1.000000000000000,'','','2009-09-01','',1,'',0.000000000000000,2,'',0,0,0,'2000-01-01 00:00:00',NULL,NULL,0,0,NULL,NULL,0,0,0,1,0.000000000000000,0.000000000000000,0.000000000000000,0.000000000000000,'2009-01-01',15,0,0,0,NULL,100,0,0.000000000000000,0,2,1,0,-1,-1,0,0,0,1,0,0,'London',0,NULL,0,0,-1,'global',-1,-1,0,0,0.0000,0.0000,-1,-1,-1,-1,NULL,NULL,NULL,NULL,0.000000000000000,0.000000000000000,'monthly',15,0,0,NULL,0);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `voicemail_boxes`
--

DROP TABLE IF EXISTS `voicemail_boxes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voicemail_boxes` (
  `uniqueid` int(11) NOT NULL AUTO_INCREMENT,
  `context` varchar(50) NOT NULL,
  `mailbox` varchar(50) DEFAULT NULL,
  `password` varchar(5) NOT NULL DEFAULT '0',
  `fullname` varchar(150) NOT NULL,
  `email` varchar(50) NOT NULL,
  `pager` varchar(50) NOT NULL,
  `tz` varchar(10) NOT NULL DEFAULT 'central',
  `attach` varchar(4) NOT NULL DEFAULT 'yes',
  `saycid` varchar(4) NOT NULL DEFAULT 'yes',
  `dialout` varchar(10) NOT NULL,
  `callback` varchar(10) NOT NULL,
  `review` varchar(4) NOT NULL DEFAULT 'no',
  `operator` varchar(4) NOT NULL DEFAULT 'no',
  `envelope` varchar(4) NOT NULL DEFAULT 'no',
  `sayduration` varchar(4) NOT NULL DEFAULT 'no',
  `saydurationm` tinyint(4) NOT NULL DEFAULT '1',
  `sendvoicemail` varchar(4) NOT NULL DEFAULT 'no',
  `delete` varchar(4) NOT NULL DEFAULT 'no',
  `nextaftercmd` varchar(4) NOT NULL DEFAULT 'yes',
  `forcename` varchar(4) NOT NULL DEFAULT 'no',
  `forcegreetings` varchar(4) NOT NULL DEFAULT 'no',
  `hidefromdir` varchar(4) NOT NULL DEFAULT 'yes',
  `stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `device_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`uniqueid`),
  UNIQUE KEY `device_id` (`device_id`),
  UNIQUE KEY `device_id_2` (`device_id`),
  UNIQUE KEY `device_id_3` (`device_id`),
  KEY `mailbox` (`mailbox`,`context`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `voicemail_boxes`
--

LOCK TABLES `voicemail_boxes` WRITE;
/*!40000 ALTER TABLE `voicemail_boxes` DISABLE KEYS */;
INSERT INTO `voicemail_boxes` VALUES (1,'default','1002','','Test User #1','','','central','yes','yes','','','no','no','no','no',1,'no','no','yes','no','no','yes','2009-09-05 17:32:10',6),(2,'default','101','6471','Test User #1','','','central','yes','yes','','','no','no','no','no',1,'no','no','yes','no','no','yes','2009-09-05 17:33:26',2);
/*!40000 ALTER TABLE `voicemail_boxes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vouchers`
--

DROP TABLE IF EXISTS `vouchers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vouchers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` varchar(255) NOT NULL,
  `tag` varchar(255) NOT NULL,
  `credit_with_vat` decimal(30,15) DEFAULT '0.000000000000000',
  `vat_percent` decimal(30,15) DEFAULT '0.000000000000000',
  `user_id` int(11) NOT NULL DEFAULT '-1',
  `use_date` datetime DEFAULT NULL,
  `active_till` datetime NOT NULL,
  `currency` varchar(255) NOT NULL,
  `payment_id` int(11) DEFAULT NULL,
  `active` tinyint(4) DEFAULT '1',
  `tax_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vouchers`
--

LOCK TABLES `vouchers` WRITE;
/*!40000 ALTER TABLE `vouchers` DISABLE KEYS */;
/*!40000 ALTER TABLE `vouchers` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-07-29 17:56:19