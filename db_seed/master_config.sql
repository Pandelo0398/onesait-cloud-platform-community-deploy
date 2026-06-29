
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iot_session` (
  `id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `client_platform` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `client_platform_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `device` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expiration` bigint(20) DEFAULT NULL,
  `last_access` datetime DEFAULT NULL,
  `session_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_at` datetime NOT NULL,
  `user_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `token` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `session_key` (`session_key`),
  KEY `FK_iot_session_token` (`token`),
  CONSTRAINT `FK_iot_session_token` FOREIGN KEY (`token`) REFERENCES `master_device_token` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `iot_session` WRITE;
/*!40000 ALTER TABLE `iot_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `iot_session` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `master_configuration` (
  `id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_at` datetime NOT NULL,
  `yml_config` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `master_configuration` WRITE;
/*!40000 ALTER TABLE `master_configuration` DISABLE KEYS */;
/*!40000 ALTER TABLE `master_configuration` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `master_device_token` (
  `id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `tenant` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated_at` datetime NOT NULL,
  `vertical` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `token` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `master_device_token` WRITE;
/*!40000 ALTER TABLE `master_device_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `master_device_token` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `master_digital_twin_device_token` (
  `id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `tenant` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated_at` datetime NOT NULL,
  `vertical` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `token` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `master_digital_twin_device_token` WRITE;
/*!40000 ALTER TABLE `master_digital_twin_device_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `master_digital_twin_device_token` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `master_user` (
  `user_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `extra_fields` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `failed_attemps` int(11) DEFAULT NULL,
  `full_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `last_pswd_update` datetime DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reset_pass` datetime DEFAULT NULL,
  `updated_at` datetime NOT NULL,
  `tenant_id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`user_id`),
  KEY `FK_master_user_tenant_id` (`tenant_id`),
  CONSTRAINT `FK_master_user_tenant_id` FOREIGN KEY (`tenant_id`) REFERENCES `tenant` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `master_user` WRITE;
/*!40000 ALTER TABLE `master_user` DISABLE KEYS */;
INSERT INTO `master_user` VALUES ('administrator',1,'2026-05-23 23:36:42','administrator@onesaitplatform.com',NULL,0,'A Administrator of the Platform','2026-06-24 19:13:24','2026-05-23 23:36:42','IKqlocGvkAxAJzcy6acRLkNB9ZJUwmXAiz8TVynJryc=',NULL,'2026-05-23 23:36:42','MASTER-Tenant-1'),('analytics',1,'2026-05-23 23:36:42','analytics@onesaitplatform.com',NULL,0,'Generic Analytics User of the Platform','2026-05-23 23:36:42','2026-05-23 23:36:42','IKqlocGvkAxAJzcy6acRLkNB9ZJUwmXAiz8TVynJryc=',NULL,'2026-05-23 23:36:42','MASTER-Tenant-1'),('anonymous',1,'2026-05-23 23:36:42','anonymous@onesaitplatform.com',NULL,0,'Anonymous User of the Platform','2026-05-23 23:36:42','2026-05-23 23:36:42','IKqlocGvkAxAJzcy6acRLkNB9ZJUwmXAiz8TVynJryc=',NULL,'2026-05-23 23:36:43','MASTER-Tenant-1'),('anyi',1,'2026-05-24 00:45:29','anyi@onesaitplatform.com',NULL,0,'Anyi','2026-05-24 02:00:35','2026-05-24 00:45:29','IKqlocGvkAxAJzcy6acRLkNB9ZJUwmXAiz8TVynJryc=',NULL,'2026-05-24 02:24:04','MASTER-Tenant-1'),('demo_developer',1,'2026-05-23 23:36:42','demo_developer@onesaitplatform.com',NULL,0,'Demo Developer of the Platform','2026-05-23 23:36:42','2026-05-23 23:36:42','IKqlocGvkAxAJzcy6acRLkNB9ZJUwmXAiz8TVynJryc=',NULL,'2026-05-23 23:36:42','MASTER-Tenant-1'),('demo_user',1,'2026-05-23 23:36:42','demo_user@onesaitplatform.com',NULL,0,'Demo User of the Platform','2026-05-23 23:36:42','2026-05-23 23:36:42','IKqlocGvkAxAJzcy6acRLkNB9ZJUwmXAiz8TVynJryc=',NULL,'2026-05-23 23:36:42','MASTER-Tenant-1'),('developer',1,'2026-05-23 23:36:42','developer@onesaitplatform.com',NULL,0,'A Developer of the Platform.','2026-06-14 23:18:46','2026-05-23 23:36:42','IKqlocGvkAxAJzcy6acRLkNB9ZJUwmXAiz8TVynJryc=',NULL,'2026-06-14 23:19:11','MASTER-Tenant-1'),('fernando',1,'2026-05-24 00:45:29','fernando@onesaitplatform.com',NULL,0,'Fernando','2026-05-24 02:24:57','2026-05-24 00:45:29','IKqlocGvkAxAJzcy6acRLkNB9ZJUwmXAiz8TVynJryc=',NULL,'2026-05-24 02:24:04','MASTER-Tenant-1'),('isaias',1,'2026-05-24 00:45:29','isaias@onesaitplatform.com',NULL,0,'Isaias','2026-05-24 00:45:29','2026-05-24 00:45:29','IKqlocGvkAxAJzcy6acRLkNB9ZJUwmXAiz8TVynJryc=',NULL,'2026-05-24 00:45:29','MASTER-Tenant-1'),('jairodavis',1,'2026-06-20 15:36:20','jairodavis@onesaitplatform.com',NULL,NULL,'Jairo Davis',NULL,NULL,'IKqlocGvkAxAJzcy6acRLkNB9ZJUwmXAiz8TVynJryc=',NULL,'2026-06-20 15:36:20','MASTER-Tenant-1'),('kevin',1,'2026-05-24 00:45:29','kevin@onesaitplatform.com',NULL,0,'Kevin','2026-05-24 00:45:29','2026-05-24 00:45:29','IKqlocGvkAxAJzcy6acRLkNB9ZJUwmXAiz8TVynJryc=',NULL,'2026-05-24 00:45:29','MASTER-Tenant-1'),('pamela',1,'2026-05-24 00:45:29','pamela@onesaitplatform.com',NULL,0,'Pamela','2026-05-24 00:45:29','2026-05-24 00:45:29','IKqlocGvkAxAJzcy6acRLkNB9ZJUwmXAiz8TVynJryc=',NULL,'2026-05-24 00:45:29','MASTER-Tenant-1'),('platform_admin',1,'2026-05-23 23:36:43','platformadmin@onesaitplatform.com',NULL,0,'Platform administrator','2026-05-23 23:36:43','2026-05-23 23:36:43','IKqlocGvkAxAJzcy6acRLkNB9ZJUwmXAiz8TVynJryc=',NULL,'2026-05-23 23:36:43','MASTER-Tenant-1'),('sysadmin',1,'2026-05-23 23:36:42','sysadmin@onesaitplatform.com',NULL,0,'Generic SysAdmin of the Platform','2026-05-23 23:36:42','2026-05-23 23:36:42','IKqlocGvkAxAJzcy6acRLkNB9ZJUwmXAiz8TVynJryc=',NULL,'2026-05-23 23:36:42','MASTER-Tenant-1'),('user',1,'2026-05-23 23:36:42','user@onesaitplatform.com',NULL,0,'Generic User of the Platform','2026-05-23 23:36:42','2026-05-23 23:36:42','IKqlocGvkAxAJzcy6acRLkNB9ZJUwmXAiz8TVynJryc=',NULL,'2026-05-23 23:36:42','MASTER-Tenant-1'),('wesfalia',1,'2026-05-24 00:45:29','wesfalia@onesaitplatform.com',NULL,0,'Wesfalia','2026-05-24 00:45:29','2026-05-24 00:45:29','IKqlocGvkAxAJzcy6acRLkNB9ZJUwmXAiz8TVynJryc=',NULL,'2026-05-24 00:45:29','MASTER-Tenant-1');
/*!40000 ALTER TABLE `master_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `master_user_historic` (
  `id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `password` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated_at` datetime NOT NULL,
  `master_user_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_master_user_historic_master_user_id` (`master_user_id`),
  CONSTRAINT `FK_master_user_historic_master_user_id` FOREIGN KEY (`master_user_id`) REFERENCES `master_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `master_user_historic` WRITE;
/*!40000 ALTER TABLE `master_user_historic` DISABLE KEYS */;
INSERT INTO `master_user_historic` VALUES ('39c49f98-5700-11f1-bd8c-16c4a4938c6e','2026-05-23 23:36:42','LoOY0z1pq+O2/h05ysBSS28kcFc8rSr7veWmyEi7uLs=','2026-05-23 23:36:42','administrator'),('39d6a0c2-5700-11f1-bd8c-16c4a4938c6e','2026-05-23 23:36:42','LoOY0z1pq+O2/h05ysBSS28kcFc8rSr7veWmyEi7uLs=','2026-05-23 23:36:42','developer'),('39e8c49c-5700-11f1-bd8c-16c4a4938c6e','2026-05-23 23:36:42','LoOY0z1pq+O2/h05ysBSS28kcFc8rSr7veWmyEi7uLs=','2026-05-23 23:36:42','demo_developer'),('39faf238-5700-11f1-bd8c-16c4a4938c6e','2026-05-23 23:36:42','LoOY0z1pq+O2/h05ysBSS28kcFc8rSr7veWmyEi7uLs=','2026-05-23 23:36:42','user'),('3a07cccb-5700-11f1-bd8c-16c4a4938c6e','2026-05-23 23:36:42','LoOY0z1pq+O2/h05ysBSS28kcFc8rSr7veWmyEi7uLs=','2026-05-23 23:36:42','demo_user'),('3a182e88-5700-11f1-bd8c-16c4a4938c6e','2026-05-23 23:36:42','LoOY0z1pq+O2/h05ysBSS28kcFc8rSr7veWmyEi7uLs=','2026-05-23 23:36:42','analytics'),('3a2730b7-5700-11f1-bd8c-16c4a4938c6e','2026-05-23 23:36:42','LoOY0z1pq+O2/h05ysBSS28kcFc8rSr7veWmyEi7uLs=','2026-05-23 23:36:42','sysadmin'),('3a345da6-5700-11f1-bd8c-16c4a4938c6e','2026-05-23 23:36:43','LoOY0z1pq+O2/h05ysBSS28kcFc8rSr7veWmyEi7uLs=','2026-05-23 23:36:43','anonymous'),('3a4135d0-5700-11f1-bd8c-16c4a4938c6e','2026-05-23 23:36:43','LoOY0z1pq+O2/h05ysBSS28kcFc8rSr7veWmyEi7uLs=','2026-05-23 23:36:43','platform_admin');
/*!40000 ALTER TABLE `master_user_historic` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `master_user_token` (
  `id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated_at` datetime NOT NULL,
  `master_user_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tenant_id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vertical_id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `token` (`token`),
  KEY `FK_master_user_token_master_user_id` (`master_user_id`),
  KEY `FK_master_user_token_tenant_id` (`tenant_id`),
  KEY `FK_master_user_token_vertical_id` (`vertical_id`),
  CONSTRAINT `FK_master_user_token_master_user_id` FOREIGN KEY (`master_user_id`) REFERENCES `master_user` (`user_id`),
  CONSTRAINT `FK_master_user_token_tenant_id` FOREIGN KEY (`tenant_id`) REFERENCES `tenant` (`id`),
  CONSTRAINT `FK_master_user_token_vertical_id` FOREIGN KEY (`vertical_id`) REFERENCES `vertical` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `master_user_token` WRITE;
/*!40000 ALTER TABLE `master_user_token` DISABLE KEYS */;
INSERT INTO `master_user_token` VALUES ('3cb96aea-5700-11f1-bd8c-16c4a4938c6e','2026-05-23 23:36:47','7297fd8c2c924ad1968b17d7d4a80b8c','2026-05-23 23:36:47','administrator','MASTER-Tenant-1','MASTER-Vertical-1'),('3cc2d20d-5700-11f1-bd8c-16c4a4938c6e','2026-05-23 23:36:47','09081779a8104df3b042ceef04d4925b','2026-05-23 23:36:47','analytics','MASTER-Tenant-1','MASTER-Vertical-1'),('3cc8094d-5700-11f1-bd8c-16c4a4938c6e','2026-05-23 23:36:47','5d529f5cf98e4a458fcabf801f998ec4','2026-05-23 23:36:47','anonymous','MASTER-Tenant-1','MASTER-Vertical-1'),('3ccd410a-5700-11f1-bd8c-16c4a4938c6e','2026-05-23 23:36:47','eb30b89860ac4f93a47bf931397e1de8','2026-05-23 23:36:47','demo_developer','MASTER-Tenant-1','MASTER-Vertical-1'),('3cd32ac4-5700-11f1-bd8c-16c4a4938c6e','2026-05-23 23:36:47','9bf451f89028419dae6ae039d0ea2fb3','2026-05-23 23:36:47','demo_user','MASTER-Tenant-1','MASTER-Vertical-1'),('3cd835cf-5700-11f1-bd8c-16c4a4938c6e','2026-05-23 23:36:47','a37544808a60430aabfa7320d5beb351','2026-05-23 23:36:47','developer','MASTER-Tenant-1','MASTER-Vertical-1'),('3cdd9efc-5700-11f1-bd8c-16c4a4938c6e','2026-05-23 23:36:47','0f971e879e5d47e7860a0ba63227a63b','2026-05-23 23:36:47','platform_admin','MASTER-Tenant-1','MASTER-Vertical-1'),('3ce35867-5700-11f1-bd8c-16c4a4938c6e','2026-05-23 23:36:47','7d2f1b65e762461f9b9ae5ca6346d77e','2026-05-23 23:36:47','sysadmin','MASTER-Tenant-1','MASTER-Vertical-1'),('3ce88b0c-5700-11f1-bd8c-16c4a4938c6e','2026-05-23 23:36:47','a0b78043b52e44149764fcbfbf87377c','2026-05-23 23:36:47','user','MASTER-Tenant-1','MASTER-Vertical-1');
/*!40000 ALTER TABLE `master_user_token` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_access_token` (
  `token_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `authentication` longblob DEFAULT NULL,
  `authentication_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `client_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `refresh_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `token` longblob DEFAULT NULL,
  `user_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`token_id`),
  UNIQUE KEY `authentication_id` (`authentication_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `oauth_access_token` WRITE;
/*!40000 ALTER TABLE `oauth_access_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_access_token` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_client_details` (
  `client_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_validity` int(11) DEFAULT NULL,
  `additional_information` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `authorities` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `authorized_grant_types` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `client_secret` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `refresh_token_validity` int(11) DEFAULT NULL,
  `web_server_redirect_uri` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `resource_ids` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scope` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `oauth_client_details` WRITE;
/*!40000 ALTER TABLE `oauth_client_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_client_details` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_client_token` (
  `token_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `authentication_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `client_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `token` longblob DEFAULT NULL,
  `user_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `oauth_client_token` WRITE;
/*!40000 ALTER TABLE `oauth_client_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_client_token` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_code` (
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `authentication` longblob DEFAULT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `oauth_code` WRITE;
/*!40000 ALTER TABLE `oauth_code` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_code` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_refresh_token` (
  `token_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `authentication` longblob DEFAULT NULL,
  `token` longblob DEFAULT NULL,
  PRIMARY KEY (`token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `oauth_refresh_token` WRITE;
/*!40000 ALTER TABLE `oauth_refresh_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_refresh_token` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tenant` (
  `id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNQ_tenant_0` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `tenant` WRITE;
/*!40000 ALTER TABLE `tenant` DISABLE KEYS */;
INSERT INTO `tenant` VALUES ('MASTER-Tenant-1','2026-05-23 23:36:41','development_onesaitplatform','2026-05-23 23:36:41');
/*!40000 ALTER TABLE `tenant` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vertical` (
  `id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `schema_db` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `schema_db` (`schema_db`),
  UNIQUE KEY `UNQ_vertical_0` (`schema_db`),
  UNIQUE KEY `UNQ_vertical_1` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `vertical` WRITE;
/*!40000 ALTER TABLE `vertical` DISABLE KEYS */;
INSERT INTO `vertical` VALUES ('MASTER-Vertical-1','2026-05-23 23:36:42','onesaitplatform','onesaitplatform_config','2026-05-23 23:36:42');
/*!40000 ALTER TABLE `vertical` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vertical_tenant` (
  `tenant_id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vertical_id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`tenant_id`,`vertical_id`),
  UNIQUE KEY `UNQ_VERTICAL_TENANT_0` (`vertical_id`,`tenant_id`),
  CONSTRAINT `FK_VERTICAL_TENANT_tenant_id` FOREIGN KEY (`tenant_id`) REFERENCES `tenant` (`id`),
  CONSTRAINT `FK_VERTICAL_TENANT_vertical_id` FOREIGN KEY (`vertical_id`) REFERENCES `vertical` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `vertical_tenant` WRITE;
/*!40000 ALTER TABLE `vertical_tenant` DISABLE KEYS */;
INSERT INTO `vertical_tenant` VALUES ('MASTER-Tenant-1','MASTER-Vertical-1');
/*!40000 ALTER TABLE `vertical_tenant` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

