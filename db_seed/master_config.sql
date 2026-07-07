-- MySQL dump 10.17  Distrib 10.3.22-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: onesaitplatform_master_config
-- ------------------------------------------------------
-- Server version	10.3.22-MariaDB-1:10.3.22+maria~bionic

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Dumping data for table `iot_session`
--

LOCK TABLES `iot_session` WRITE;
/*!40000 ALTER TABLE `iot_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `iot_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `master_configuration`
--

LOCK TABLES `master_configuration` WRITE;
/*!40000 ALTER TABLE `master_configuration` DISABLE KEYS */;
/*!40000 ALTER TABLE `master_configuration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `master_device_token`
--

LOCK TABLES `master_device_token` WRITE;
/*!40000 ALTER TABLE `master_device_token` DISABLE KEYS */;
INSERT INTO `master_device_token` (`id`, `created_at`, `tenant`, `token`, `updated_at`, `vertical`) VALUES ('f48e8048-78b2-11f1-8525-5659eaac2d36','2026-07-05 22:32:03','development_onesaitplatform','77f83c7326ac48c6b3cab9220a5b3f8b','2026-07-05 22:32:03','onesaitplatform_config');
/*!40000 ALTER TABLE `master_device_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `master_digital_twin_device_token`
--

LOCK TABLES `master_digital_twin_device_token` WRITE;
/*!40000 ALTER TABLE `master_digital_twin_device_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `master_digital_twin_device_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `master_user`
--

LOCK TABLES `master_user` WRITE;
/*!40000 ALTER TABLE `master_user` DISABLE KEYS */;
INSERT INTO `master_user` (`user_id`, `active`, `created_at`, `email`, `extra_fields`, `failed_attemps`, `full_name`, `last_login`, `last_pswd_update`, `password`, `reset_pass`, `updated_at`, `tenant_id`) VALUES ('administrator',1,'2026-07-05 18:39:16','administrator@onesaitplatform.com',NULL,0,'A Administrator of the Platform','2026-07-06 14:52:21','2026-07-05 18:39:16','IKqlocGvkAxAJzcy6acRLkNB9ZJUwmXAiz8TVynJryc=',NULL,'2026-07-05 18:39:17','MASTER-Tenant-1'),('analytics',1,'2026-07-05 18:39:17','analytics@onesaitplatform.com',NULL,0,'Generic Analytics User of the Platform','2026-07-05 18:39:17','2026-07-05 18:39:17','IKqlocGvkAxAJzcy6acRLkNB9ZJUwmXAiz8TVynJryc=',NULL,'2026-07-05 18:39:17','MASTER-Tenant-1'),('anonymous',1,'2026-07-05 18:39:17','anonymous@onesaitplatform.com',NULL,0,'Anonymous User of the Platform','2026-07-05 18:39:17','2026-07-05 18:39:17','IKqlocGvkAxAJzcy6acRLkNB9ZJUwmXAiz8TVynJryc=',NULL,'2026-07-05 18:39:17','MASTER-Tenant-1'),('anyi',1,'2026-07-05 18:40:20','anyi@onesaitplatform.com',NULL,0,'Anyi','2026-07-05 18:40:20','2026-07-05 18:40:20','IKqlocGvkAxAJzcy6acRLkNB9ZJUwmXAiz8TVynJryc=',NULL,'2026-07-05 18:40:20','MASTER-Tenant-1'),('demo_developer',1,'2026-07-05 18:39:17','demo_developer@onesaitplatform.com',NULL,0,'Demo Developer of the Platform','2026-07-05 18:39:17','2026-07-05 18:39:17','IKqlocGvkAxAJzcy6acRLkNB9ZJUwmXAiz8TVynJryc=',NULL,'2026-07-05 18:39:17','MASTER-Tenant-1'),('demo_user',1,'2026-07-05 18:39:17','demo_user@onesaitplatform.com',NULL,0,'Demo User of the Platform','2026-07-05 18:39:17','2026-07-05 18:39:17','IKqlocGvkAxAJzcy6acRLkNB9ZJUwmXAiz8TVynJryc=',NULL,'2026-07-05 18:39:17','MASTER-Tenant-1'),('developer',1,'2026-07-05 18:39:17','developer@onesaitplatform.com',NULL,0,'A Developer of the Platform.','2026-07-05 18:39:17','2026-07-05 18:39:17','IKqlocGvkAxAJzcy6acRLkNB9ZJUwmXAiz8TVynJryc=',NULL,'2026-07-05 18:39:17','MASTER-Tenant-1'),('fernando',1,'2026-07-05 18:40:20','fernando@onesaitplatform.com',NULL,0,'Fernando','2026-07-05 18:40:20','2026-07-05 18:40:20','IKqlocGvkAxAJzcy6acRLkNB9ZJUwmXAiz8TVynJryc=',NULL,'2026-07-05 18:40:20','MASTER-Tenant-1'),('isaias',1,'2026-07-05 18:40:20','isaias@onesaitplatform.com',NULL,0,'Isaias','2026-07-05 18:40:20','2026-07-05 18:40:20','IKqlocGvkAxAJzcy6acRLkNB9ZJUwmXAiz8TVynJryc=',NULL,'2026-07-05 18:40:20','MASTER-Tenant-1'),('jairodavis',1,'2026-07-05 18:40:20','jairodavis@onesaitplatform.com',NULL,0,'Jairo Davis','2026-07-05 18:40:20','2026-07-05 18:40:20','IKqlocGvkAxAJzcy6acRLkNB9ZJUwmXAiz8TVynJryc=',NULL,'2026-07-05 18:40:20','MASTER-Tenant-1'),('kevin',1,'2026-07-05 18:40:20','kevin@onesaitplatform.com',NULL,0,'Kevin','2026-07-05 18:40:20','2026-07-05 18:40:20','IKqlocGvkAxAJzcy6acRLkNB9ZJUwmXAiz8TVynJryc=',NULL,'2026-07-05 18:40:20','MASTER-Tenant-1'),('pamela',1,'2026-07-05 18:40:20','pamela@onesaitplatform.com',NULL,0,'Pamela','2026-07-05 18:40:20','2026-07-05 18:40:20','IKqlocGvkAxAJzcy6acRLkNB9ZJUwmXAiz8TVynJryc=',NULL,'2026-07-05 18:40:20','MASTER-Tenant-1'),('platform_admin',1,'2026-07-05 18:39:17','platformadmin@onesaitplatform.com',NULL,0,'Platform administrator','2026-07-05 18:39:17','2026-07-05 18:39:17','IKqlocGvkAxAJzcy6acRLkNB9ZJUwmXAiz8TVynJryc=',NULL,'2026-07-05 18:39:17','MASTER-Tenant-1'),('sysadmin',1,'2026-07-05 18:39:17','sysadmin@onesaitplatform.com',NULL,0,'Generic SysAdmin of the Platform','2026-07-05 18:39:17','2026-07-05 18:39:17','IKqlocGvkAxAJzcy6acRLkNB9ZJUwmXAiz8TVynJryc=',NULL,'2026-07-05 18:39:17','MASTER-Tenant-1'),('user',1,'2026-07-05 18:39:17','user@onesaitplatform.com',NULL,0,'Generic User of the Platform','2026-07-05 18:39:17','2026-07-05 18:39:17','IKqlocGvkAxAJzcy6acRLkNB9ZJUwmXAiz8TVynJryc=',NULL,'2026-07-05 18:39:17','MASTER-Tenant-1'),('wesfalia',1,'2026-07-05 18:40:20','wesfalia@onesaitplatform.com',NULL,0,'Wesfalia','2026-07-05 18:40:20','2026-07-05 18:40:20','IKqlocGvkAxAJzcy6acRLkNB9ZJUwmXAiz8TVynJryc=',NULL,'2026-07-05 18:40:20','MASTER-Tenant-1');
/*!40000 ALTER TABLE `master_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `master_user_historic`
--

LOCK TABLES `master_user_historic` WRITE;
/*!40000 ALTER TABLE `master_user_historic` DISABLE KEYS */;
INSERT INTO `master_user_historic` (`id`, `created_at`, `password`, `updated_at`, `master_user_id`) VALUES ('d2754747-78a0-11f1-8525-5659eaac2d36','2026-07-05 18:39:17','LoOY0z1pq+O2/h05ysBSS28kcFc8rSr7veWmyEi7uLs=','2026-07-05 18:39:17','administrator'),('d285ff1f-78a0-11f1-8525-5659eaac2d36','2026-07-05 18:39:17','LoOY0z1pq+O2/h05ysBSS28kcFc8rSr7veWmyEi7uLs=','2026-07-05 18:39:17','developer'),('d291d7d0-78a0-11f1-8525-5659eaac2d36','2026-07-05 18:39:17','LoOY0z1pq+O2/h05ysBSS28kcFc8rSr7veWmyEi7uLs=','2026-07-05 18:39:17','demo_developer'),('d2a11ae7-78a0-11f1-8525-5659eaac2d36','2026-07-05 18:39:17','LoOY0z1pq+O2/h05ysBSS28kcFc8rSr7veWmyEi7uLs=','2026-07-05 18:39:17','user'),('d2adc7ae-78a0-11f1-8525-5659eaac2d36','2026-07-05 18:39:17','LoOY0z1pq+O2/h05ysBSS28kcFc8rSr7veWmyEi7uLs=','2026-07-05 18:39:17','demo_user'),('d2b9d510-78a0-11f1-8525-5659eaac2d36','2026-07-05 18:39:17','LoOY0z1pq+O2/h05ysBSS28kcFc8rSr7veWmyEi7uLs=','2026-07-05 18:39:17','analytics'),('d2c4880f-78a0-11f1-8525-5659eaac2d36','2026-07-05 18:39:17','LoOY0z1pq+O2/h05ysBSS28kcFc8rSr7veWmyEi7uLs=','2026-07-05 18:39:17','sysadmin'),('d2d09ecb-78a0-11f1-8525-5659eaac2d36','2026-07-05 18:39:17','LoOY0z1pq+O2/h05ysBSS28kcFc8rSr7veWmyEi7uLs=','2026-07-05 18:39:17','anonymous'),('d2dba4a9-78a0-11f1-8525-5659eaac2d36','2026-07-05 18:39:17','LoOY0z1pq+O2/h05ysBSS28kcFc8rSr7veWmyEi7uLs=','2026-07-05 18:39:17','platform_admin');
/*!40000 ALTER TABLE `master_user_historic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `master_user_token`
--

LOCK TABLES `master_user_token` WRITE;
/*!40000 ALTER TABLE `master_user_token` DISABLE KEYS */;
INSERT INTO `master_user_token` (`id`, `created_at`, `token`, `updated_at`, `master_user_id`, `tenant_id`, `vertical_id`) VALUES ('d528bf10-78a0-11f1-8525-5659eaac2d36','2026-07-05 18:39:21','e96e218bb41943198518ff2d8427f3b2','2026-07-05 18:39:21','administrator','MASTER-Tenant-1','MASTER-Vertical-1'),('d52f4cc8-78a0-11f1-8525-5659eaac2d36','2026-07-05 18:39:21','3ce6b1e3693640da9f6bc336579c3d43','2026-07-05 18:39:21','analytics','MASTER-Tenant-1','MASTER-Vertical-1'),('d532fc1b-78a0-11f1-8525-5659eaac2d36','2026-07-05 18:39:21','55e6fa0b75b64e1bbab89644167ac7b6','2026-07-05 18:39:21','anonymous','MASTER-Tenant-1','MASTER-Vertical-1'),('d536af14-78a0-11f1-8525-5659eaac2d36','2026-07-05 18:39:21','dc30ea86a39b4ee1a3d1cb20f1ea8c47','2026-07-05 18:39:21','demo_developer','MASTER-Tenant-1','MASTER-Vertical-1'),('d53ab6b3-78a0-11f1-8525-5659eaac2d36','2026-07-05 18:39:21','8a90ab8d539b42b983bdbb3cd6ed8269','2026-07-05 18:39:21','demo_user','MASTER-Tenant-1','MASTER-Vertical-1'),('d5400d08-78a0-11f1-8525-5659eaac2d36','2026-07-05 18:39:21','a3975c97027c423c8ed7c2f47de19825','2026-07-05 18:39:21','developer','MASTER-Tenant-1','MASTER-Vertical-1'),('d5461e77-78a0-11f1-8525-5659eaac2d36','2026-07-05 18:39:21','31928133c7664e6bb3c9acab51017bd0','2026-07-05 18:39:21','platform_admin','MASTER-Tenant-1','MASTER-Vertical-1'),('d54afc18-78a0-11f1-8525-5659eaac2d36','2026-07-05 18:39:21','16bd6ba876a74b9ba59a119f28153bf8','2026-07-05 18:39:21','sysadmin','MASTER-Tenant-1','MASTER-Vertical-1'),('d54f4ce5-78a0-11f1-8525-5659eaac2d36','2026-07-05 18:39:21','5e894d63a2254461a5f9afdf5edc13d5','2026-07-05 18:39:21','user','MASTER-Tenant-1','MASTER-Vertical-1');
/*!40000 ALTER TABLE `master_user_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `oauth_access_token`
--

LOCK TABLES `oauth_access_token` WRITE;
/*!40000 ALTER TABLE `oauth_access_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_access_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `oauth_client_details`
--

LOCK TABLES `oauth_client_details` WRITE;
/*!40000 ALTER TABLE `oauth_client_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_client_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `oauth_client_token`
--

LOCK TABLES `oauth_client_token` WRITE;
/*!40000 ALTER TABLE `oauth_client_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_client_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `oauth_code`
--

LOCK TABLES `oauth_code` WRITE;
/*!40000 ALTER TABLE `oauth_code` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `oauth_refresh_token`
--

LOCK TABLES `oauth_refresh_token` WRITE;
/*!40000 ALTER TABLE `oauth_refresh_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_refresh_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `tenant`
--

LOCK TABLES `tenant` WRITE;
/*!40000 ALTER TABLE `tenant` DISABLE KEYS */;
INSERT INTO `tenant` (`id`, `created_at`, `name`, `updated_at`) VALUES ('MASTER-Tenant-1','2026-07-05 18:39:16','development_onesaitplatform','2026-07-05 18:39:16');
/*!40000 ALTER TABLE `tenant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `vertical`
--

LOCK TABLES `vertical` WRITE;
/*!40000 ALTER TABLE `vertical` DISABLE KEYS */;
INSERT INTO `vertical` (`id`, `created_at`, `name`, `schema_db`, `updated_at`) VALUES ('MASTER-Vertical-1','2026-07-05 18:39:16','onesaitplatform','onesaitplatform_config','2026-07-05 18:39:16');
/*!40000 ALTER TABLE `vertical` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `vertical_tenant`
--

LOCK TABLES `vertical_tenant` WRITE;
/*!40000 ALTER TABLE `vertical_tenant` DISABLE KEYS */;
INSERT INTO `vertical_tenant` (`tenant_id`, `vertical_id`) VALUES ('MASTER-Tenant-1','MASTER-Vertical-1');
/*!40000 ALTER TABLE `vertical_tenant` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-07-07 23:43:49
