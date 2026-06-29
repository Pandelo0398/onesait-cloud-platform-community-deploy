
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
CREATE TABLE `admin_event_entity` (
  `ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ADMIN_EVENT_TIME` bigint(20) DEFAULT NULL,
  `REALM_ID` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `OPERATION_TYPE` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `AUTH_REALM_ID` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `AUTH_CLIENT_ID` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `AUTH_USER_ID` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `IP_ADDRESS` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `RESOURCE_PATH` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `REPRESENTATION` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ERROR` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `RESOURCE_TYPE` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_ADMIN_EVENT_TIME` (`REALM_ID`,`ADMIN_EVENT_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `admin_event_entity` WRITE;
/*!40000 ALTER TABLE `admin_event_entity` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin_event_entity` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `associated_policy` (
  `POLICY_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ASSOCIATED_POLICY_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`POLICY_ID`,`ASSOCIATED_POLICY_ID`),
  KEY `IDX_ASSOC_POL_ASSOC_POL_ID` (`ASSOCIATED_POLICY_ID`),
  CONSTRAINT `FK_FRSR5S213XCX4WNKOG82SSRFY` FOREIGN KEY (`ASSOCIATED_POLICY_ID`) REFERENCES `resource_server_policy` (`ID`),
  CONSTRAINT `FK_FRSRPAS14XCX4WNKOG82SSRFY` FOREIGN KEY (`POLICY_ID`) REFERENCES `resource_server_policy` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `associated_policy` WRITE;
/*!40000 ALTER TABLE `associated_policy` DISABLE KEYS */;
INSERT INTO `associated_policy` VALUES ('59604f2b-440d-4bed-918f-85b4d1dd6ddf','55279fac-62a3-4396-b3af-f0768b1f299d');
/*!40000 ALTER TABLE `associated_policy` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authentication_execution` (
  `ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ALIAS` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `AUTHENTICATOR` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `REALM_ID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `FLOW_ID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `REQUIREMENT` int(11) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `AUTHENTICATOR_FLOW` bit(1) NOT NULL DEFAULT b'0',
  `AUTH_FLOW_ID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `AUTH_CONFIG` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_AUTH_EXEC_REALM_FLOW` (`REALM_ID`,`FLOW_ID`),
  KEY `IDX_AUTH_EXEC_FLOW` (`FLOW_ID`),
  CONSTRAINT `FK_AUTH_EXEC_FLOW` FOREIGN KEY (`FLOW_ID`) REFERENCES `authentication_flow` (`ID`),
  CONSTRAINT `FK_AUTH_EXEC_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `realm` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `authentication_execution` WRITE;
/*!40000 ALTER TABLE `authentication_execution` DISABLE KEYS */;
INSERT INTO `authentication_execution` VALUES ('02513063-6367-4010-943f-8703c7836415',NULL,NULL,'onesaitplatform','0873bb87-7dee-4d82-b1cc-e2d0afb505bb',0,20,'','abddf49f-4786-4c02-9ac3-39be66315e45',NULL),('0afcccab-9ed9-435b-a4b6-ceddaa04f1bd',NULL,'idp-review-profile','onesaitplatform','54c3d15c-4df4-47e2-814b-7df77e44c693',0,10,'\0',NULL,'e709d650-f13d-4393-9ed4-d1610193f94b'),('0d340cd1-878f-470c-93b3-bfc06370a2fb',NULL,'basic-auth','onesaitplatform','9346250b-33c6-4223-9cbf-68b9b3bad654',0,10,'\0',NULL,NULL),('0f5f0795-cffe-496e-bbb3-1360dc9f1d55',NULL,'direct-grant-validate-username','onesaitplatform','4be72a30-8785-4346-95de-3fdadab18b84',0,0,'\0',NULL,NULL),('103487e0-92a5-4cef-bb44-c535a2b4611c',NULL,'registration-password-action','cadce104-54a0-4956-8ab8-384021f6a4c5','d54158b4-fc50-48e3-a023-9afb9173acaf',0,50,'\0',NULL,NULL),('1079e1e6-61ad-45a7-b2b4-9377f9a43175',NULL,NULL,'onesaitplatform','5d7e49e4-147e-44c3-a966-dcff8e307f52',0,20,'','9346250b-33c6-4223-9cbf-68b9b3bad654',NULL),('12ea9932-28c0-4623-98e6-549c250ba3a7',NULL,'auth-cookie','cadce104-54a0-4956-8ab8-384021f6a4c5','e261e7f1-843f-4e5d-b208-5925a5c33fe6',2,10,'\0',NULL,NULL),('16612ef7-f469-431c-9f05-80633b1a3a5a',NULL,'auth-otp-form','cadce104-54a0-4956-8ab8-384021f6a4c5','7256e84d-6be5-43db-b7f7-a545707765a0',0,20,'\0',NULL,NULL),('1679e42d-2b67-405e-9657-17e3efb04ddf',NULL,'client-x509','cadce104-54a0-4956-8ab8-384021f6a4c5','65ea8add-5ff5-42e4-9261-1d96bfacb67d',2,40,'\0',NULL,NULL),('169abd27-1c86-4450-bcc8-f8eba8d12df2',NULL,NULL,'onesaitplatform','54c3d15c-4df4-47e2-814b-7df77e44c693',0,20,'','feff7ebb-0850-4c2b-a289-42b64906fc6f',NULL),('1b346c76-5edf-4123-b921-941c98257426',NULL,NULL,'onesaitplatform','abddf49f-4786-4c02-9ac3-39be66315e45',2,20,'','98e66e2a-d4da-4c0f-acfa-38e8937b4c52',NULL),('20046426-ceb3-43ad-819c-ce765c723496',NULL,NULL,'cadce104-54a0-4956-8ab8-384021f6a4c5','e261e7f1-843f-4e5d-b208-5925a5c33fe6',2,30,'','ebcd7420-1e24-4522-800e-14e7b0cc954a',NULL),('21d28742-e5c3-4cef-b3b2-f5e92c26b5b3',NULL,NULL,'cadce104-54a0-4956-8ab8-384021f6a4c5','80314424-20af-4403-b21a-e0b3861d572d',2,20,'','7252b9da-515d-44b8-919e-8f70a0b0e547',NULL),('241ffba2-efe0-4eed-90e8-0fe136e01ec0',NULL,'conditional-user-configured','cadce104-54a0-4956-8ab8-384021f6a4c5','7256e84d-6be5-43db-b7f7-a545707765a0',0,10,'\0',NULL,NULL),('24e08c6f-cfaf-47eb-aeb1-75ba46a95042',NULL,'client-secret-jwt','onesaitplatform','00e224b3-14a0-4ecf-99f4-795e82796dd2',2,30,'\0',NULL,NULL),('25240300-9971-48f5-b40e-2ff0c263a89e',NULL,'client-secret','cadce104-54a0-4956-8ab8-384021f6a4c5','65ea8add-5ff5-42e4-9261-1d96bfacb67d',2,10,'\0',NULL,NULL),('26ef7ace-46de-47c4-8e70-d853b1a5e88d',NULL,NULL,'onesaitplatform','67a99acf-9939-4d7a-b6b8-9021d05cff3d',1,40,'','b62e0e05-c08c-4c2d-8fc6-6ecae3ed1add',NULL),('2a0fa776-47be-4053-a27c-eba9785a50c8',NULL,'direct-grant-validate-username','cadce104-54a0-4956-8ab8-384021f6a4c5','268bdf85-24f4-43d9-9ddf-4177e219e293',0,10,'\0',NULL,NULL),('2aad1a9b-919d-4553-a6f7-f85d88da7560',NULL,'registration-recaptcha-action','cadce104-54a0-4956-8ab8-384021f6a4c5','d54158b4-fc50-48e3-a023-9afb9173acaf',3,60,'\0',NULL,NULL),('2c239582-791e-4695-8b31-f5e4a756d100',NULL,NULL,'cadce104-54a0-4956-8ab8-384021f6a4c5','268bdf85-24f4-43d9-9ddf-4177e219e293',1,30,'','3e05cff5-29a1-4005-bb81-f64dfbd6bc4b',NULL),('2ce01155-2d9c-4257-813d-386d10299317',NULL,'idp-email-verification','onesaitplatform','abddf49f-4786-4c02-9ac3-39be66315e45',2,10,'\0',NULL,NULL),('2e7f9af6-8840-48de-8c64-0261d5e435a5',NULL,'idp-username-password-form','onesaitplatform','98e66e2a-d4da-4c0f-acfa-38e8937b4c52',0,10,'\0',NULL,NULL),('30aae04b-1db0-4aa5-af75-90213ada5f7c',NULL,'direct-grant-validate-username','onesaitplatform','e6120580-64ee-4ada-857c-c1d9b03adba0',0,10,'\0',NULL,NULL),('31c11015-8f13-432e-84d5-28a76482a3d2',NULL,'identity-provider-redirector','onesaitplatform','cf48d33f-608f-4fba-9845-8fe3536f89cc',2,25,'\0',NULL,NULL),('34036f45-3266-45ed-b468-ffe4970809ed',NULL,'registration-password-action','onesaitplatform','4b6460bb-5846-46c7-992e-dd5ea4b3317f',0,50,'\0',NULL,NULL),('34113e23-0643-4f68-ab7e-d9b3f07eee5f',NULL,'client-secret-jwt','cadce104-54a0-4956-8ab8-384021f6a4c5','65ea8add-5ff5-42e4-9261-1d96bfacb67d',2,30,'\0',NULL,NULL),('3aacce42-f1ea-4e88-af9d-fae40180fbb2',NULL,'registration-profile-action','onesaitplatform','4b6460bb-5846-46c7-992e-dd5ea4b3317f',0,40,'\0',NULL,NULL),('3d6709bf-8bc6-454d-9a37-52d013d03b78',NULL,'auth-username-password-form','onesaitplatform','a9898c17-df2e-4d14-b5a8-9047b3a596cc',0,0,'\0',NULL,NULL),('4091d0ef-6665-4aad-acaf-69975ba0ce2f',NULL,'auth-otp-form','onesaitplatform','c771b5c4-e9a9-4566-a61b-eaa7995bbb99',0,20,'\0',NULL,NULL),('430da467-5981-4bbe-9a1b-1de4abc24107',NULL,'idp-review-profile','cadce104-54a0-4956-8ab8-384021f6a4c5','cb541ec0-f6cf-4ead-bc7a-124ac723be29',0,10,'\0',NULL,'42cc6acf-1c72-4c8b-bb08-3584e01fb0c0'),('45a8c485-388c-4d16-92f5-b89f081419b5',NULL,'registration-recaptcha-action','onesaitplatform','4b6460bb-5846-46c7-992e-dd5ea4b3317f',3,60,'\0',NULL,NULL),('47db77e0-e437-48dc-abaf-22514541423d',NULL,'registration-user-creation','cadce104-54a0-4956-8ab8-384021f6a4c5','d54158b4-fc50-48e3-a023-9afb9173acaf',0,20,'\0',NULL,NULL),('4a44b0ff-9631-41d2-ac17-78a8973d8083',NULL,'conditional-user-configured','cadce104-54a0-4956-8ab8-384021f6a4c5','91760095-8179-43a1-be64-8878b9179190',0,10,'\0',NULL,NULL),('4ee4a9ec-f1aa-4d21-b051-9ce8a36264b3',NULL,'registration-profile-action','cadce104-54a0-4956-8ab8-384021f6a4c5','d54158b4-fc50-48e3-a023-9afb9173acaf',0,40,'\0',NULL,NULL),('5b929566-841e-41c4-bf2f-0a61d8776c9f',NULL,'auth-otp-form','onesaitplatform','627151dd-79a5-44b2-bca8-991f77e58ef6',0,20,'\0',NULL,NULL),('5caa2e55-1ce8-436d-8185-3b72f6a1659b',NULL,'auth-otp-form','cadce104-54a0-4956-8ab8-384021f6a4c5','91760095-8179-43a1-be64-8878b9179190',0,20,'\0',NULL,NULL),('5d0f1e56-536f-437e-9bca-c5edae872196',NULL,NULL,'onesaitplatform','ed0fc2c9-0ea4-411f-ac55-70f66a2d37d8',2,2,'','a9898c17-df2e-4d14-b5a8-9047b3a596cc',NULL),('5d7dad6d-5ce1-47f6-bfbd-a9a733b79f31',NULL,'registration-page-form','onesaitplatform','f0ec7010-571d-4890-b5fb-576fc8839120',0,10,'','4b6460bb-5846-46c7-992e-dd5ea4b3317f',NULL),('61989f7b-c9a4-4557-8995-7e7ce8d908c0',NULL,'auth-spnego','cadce104-54a0-4956-8ab8-384021f6a4c5','43789076-6f14-42c5-907d-1957e261c48a',3,30,'\0',NULL,NULL),('62dbd801-8b7b-420e-8091-e4bea46aff80',NULL,'auth-spnego','cadce104-54a0-4956-8ab8-384021f6a4c5','e261e7f1-843f-4e5d-b208-5925a5c33fe6',3,20,'\0',NULL,NULL),('665ec347-0e5d-4786-a87f-0e500e1bb51f',NULL,'reset-credential-email','onesaitplatform','67a99acf-9939-4d7a-b6b8-9021d05cff3d',0,20,'\0',NULL,NULL),('68cb4d8a-d9cb-4d71-a746-f373af14b200',NULL,'idp-create-user-if-unique','onesaitplatform','feff7ebb-0850-4c2b-a289-42b64906fc6f',2,10,'\0',NULL,'501be831-72af-421d-884d-bb9b469b94d9'),('6c8e41c8-8fb1-4c67-8a3f-97684d7cd055',NULL,'idp-email-verification','cadce104-54a0-4956-8ab8-384021f6a4c5','10efd549-1639-4ba4-a3eb-87a165ab1192',2,10,'\0',NULL,NULL),('71d9f8b5-faa8-4c62-a102-ea54a36c77bf',NULL,NULL,'onesaitplatform','98e66e2a-d4da-4c0f-acfa-38e8937b4c52',1,20,'','c771b5c4-e9a9-4566-a61b-eaa7995bbb99',NULL),('729b5e85-3b02-43a3-8a28-6805039c3b48',NULL,'reset-password','cadce104-54a0-4956-8ab8-384021f6a4c5','fb423f9b-cf17-41ea-8d44-3e580b750ffb',0,30,'\0',NULL,NULL),('794006d0-7696-4d6a-a33a-9fb529c025a4',NULL,'vertical-choice-authenticator','onesaitplatform','a9898c17-df2e-4d14-b5a8-9047b3a596cc',0,2,'\0',NULL,NULL),('7b48ca8c-1602-455a-a587-ffdeb4802b28',NULL,'direct-grant-validate-password','cadce104-54a0-4956-8ab8-384021f6a4c5','268bdf85-24f4-43d9-9ddf-4177e219e293',0,20,'\0',NULL,NULL),('7c420046-dd5f-411d-b4d4-250635a8ec68',NULL,'basic-auth-otp','onesaitplatform','9346250b-33c6-4223-9cbf-68b9b3bad654',3,20,'\0',NULL,NULL),('83dcfd6e-7419-413f-bfb0-883092f216fd',NULL,NULL,'cadce104-54a0-4956-8ab8-384021f6a4c5','7252b9da-515d-44b8-919e-8f70a0b0e547',0,20,'','10efd549-1639-4ba4-a3eb-87a165ab1192',NULL),('855db597-6451-4bb4-bef3-f9c1a92db14c',NULL,'conditional-user-configured','onesaitplatform','b62e0e05-c08c-4c2d-8fc6-6ecae3ed1add',0,10,'\0',NULL,NULL),('8576f252-2742-455b-8558-14bba48d5097',NULL,'basic-auth-otp','cadce104-54a0-4956-8ab8-384021f6a4c5','43789076-6f14-42c5-907d-1957e261c48a',3,20,'\0',NULL,NULL),('8ca7c700-1f0a-4f07-9fb6-7dfc3de19a54',NULL,'auth-cookie','onesaitplatform','ed0fc2c9-0ea4-411f-ac55-70f66a2d37d8',2,0,'\0',NULL,NULL),('8cfb5d71-c713-4179-91fe-cc16e277d462',NULL,'registration-user-creation','onesaitplatform','4b6460bb-5846-46c7-992e-dd5ea4b3317f',0,20,'\0',NULL,NULL),('8d4d6e96-be04-47e1-9ba5-ed75552e586d',NULL,'basic-auth','cadce104-54a0-4956-8ab8-384021f6a4c5','43789076-6f14-42c5-907d-1957e261c48a',0,10,'\0',NULL,NULL),('90fb95e5-176c-4259-ae01-f0681e8a1af9',NULL,'vertical-choice-rest-authenticator','onesaitplatform','4be72a30-8785-4346-95de-3fdadab18b84',0,3,'\0',NULL,NULL),('952d9880-a2e3-4724-b64d-3b850a25aa07',NULL,'identity-provider-redirector','onesaitplatform','ed0fc2c9-0ea4-411f-ac55-70f66a2d37d8',2,1,'\0',NULL,NULL),('95bbcad6-203e-4327-a853-339412e8e5c3',NULL,'conditional-user-configured','cadce104-54a0-4956-8ab8-384021f6a4c5','6d3da358-6cc9-4322-96e1-1425c527633a',0,10,'\0',NULL,NULL),('9a1b159d-f56a-4344-afa6-10164c153a7b',NULL,'client-jwt','onesaitplatform','00e224b3-14a0-4ecf-99f4-795e82796dd2',2,20,'\0',NULL,NULL),('9adf462b-215c-4b9e-bff7-5e62a29c424f',NULL,'auth-spnego','onesaitplatform','cf48d33f-608f-4fba-9845-8fe3536f89cc',3,20,'\0',NULL,NULL),('9afd82fb-d492-4ca5-8dff-f3019e89bf14',NULL,'docker-http-basic-authenticator','onesaitplatform','181b592a-36f1-4aa8-85ee-94e79946966f',0,10,'\0',NULL,NULL),('9b549167-3c4c-45cd-9424-824f62bec905',NULL,'direct-grant-validate-otp','onesaitplatform','b0041f4e-cdf7-4e13-8db9-ea43ad0c57d3',0,20,'\0',NULL,NULL),('9d396aee-694e-4993-9c75-ee00d3fdaae6',NULL,NULL,'onesaitplatform','cf48d33f-608f-4fba-9845-8fe3536f89cc',2,30,'','1d1c7873-9715-41c2-9c7c-54a400952701',NULL),('9d458fbe-b4c5-4466-b288-184a40bb50b7',NULL,'client-jwt','cadce104-54a0-4956-8ab8-384021f6a4c5','65ea8add-5ff5-42e4-9261-1d96bfacb67d',2,20,'\0',NULL,NULL),('9dfc08af-4fd9-429b-8d2b-9f7fdfade024',NULL,NULL,'cadce104-54a0-4956-8ab8-384021f6a4c5','10efd549-1639-4ba4-a3eb-87a165ab1192',2,20,'','000a93db-5b18-4a2e-9d9c-afd540a82977',NULL),('9f36ca69-8eb1-4952-bfae-08aaa72d2266',NULL,'no-cookie-redirect','cadce104-54a0-4956-8ab8-384021f6a4c5','f0ec16b4-38e3-4412-a653-6434987edc7d',0,10,'\0',NULL,NULL),('a0c78825-cb93-4030-9e76-28f3f6d25445',NULL,'reset-password','onesaitplatform','67a99acf-9939-4d7a-b6b8-9021d05cff3d',0,30,'\0',NULL,NULL),('a0d10452-9cba-4915-b664-c0019869cb45',NULL,'idp-confirm-link','cadce104-54a0-4956-8ab8-384021f6a4c5','7252b9da-515d-44b8-919e-8f70a0b0e547',0,10,'\0',NULL,NULL),('a2502b14-558e-425d-909a-a4241bf4ff01',NULL,'idp-username-password-form','cadce104-54a0-4956-8ab8-384021f6a4c5','000a93db-5b18-4a2e-9d9c-afd540a82977',0,10,'\0',NULL,NULL),('a5597f84-dcc4-41cc-b949-b466bc51988c',NULL,NULL,'onesaitplatform','e6120580-64ee-4ada-857c-c1d9b03adba0',1,30,'','b0041f4e-cdf7-4e13-8db9-ea43ad0c57d3',NULL),('a59f8dc7-319e-4897-80db-17954c84324e',NULL,'auth-username-password-form','onesaitplatform','1d1c7873-9715-41c2-9c7c-54a400952701',0,10,'\0',NULL,NULL),('a6b4cddd-50f5-4b87-abd1-1cb69a7dbb12',NULL,'idp-confirm-link','onesaitplatform','0873bb87-7dee-4d82-b1cc-e2d0afb505bb',0,10,'\0',NULL,NULL),('a9cad123-a1a2-4631-992e-68276d32c290',NULL,NULL,'cadce104-54a0-4956-8ab8-384021f6a4c5','fb423f9b-cf17-41ea-8d44-3e580b750ffb',1,40,'','6d3da358-6cc9-4322-96e1-1425c527633a',NULL),('ac08839c-4102-4c3e-acc7-e73942ad4787',NULL,'http-basic-authenticator','onesaitplatform','588d2385-71a7-4c3b-afc9-6cdc13c9bd16',0,10,'\0',NULL,NULL),('acd924ef-f51a-4ac7-8934-b07f93af4cec',NULL,'idp-create-user-if-unique','cadce104-54a0-4956-8ab8-384021f6a4c5','80314424-20af-4403-b21a-e0b3861d572d',2,10,'\0',NULL,'c65d1aa8-1fed-4109-895c-bd4f00b5e6cd'),('adfc8f2f-c804-42f1-b496-cf652e1be36d',NULL,NULL,'cadce104-54a0-4956-8ab8-384021f6a4c5','cb541ec0-f6cf-4ead-bc7a-124ac723be29',0,20,'','80314424-20af-4403-b21a-e0b3861d572d',NULL),('b4a9102a-1daa-4c19-a73f-a410cb8e4f84',NULL,'user-active-validator','onesaitplatform','a9898c17-df2e-4d14-b5a8-9047b3a596cc',0,1,'\0',NULL,NULL),('b6394d48-ad71-4339-821d-70f2e690ebf5',NULL,'registration-page-form','cadce104-54a0-4956-8ab8-384021f6a4c5','9dc5d586-c960-43fb-bbf6-6940d1f3393f',0,10,'','d54158b4-fc50-48e3-a023-9afb9173acaf',NULL),('bb357bad-f119-4237-8e6e-b40f9f301da4',NULL,'reset-credentials-choose-user','onesaitplatform','67a99acf-9939-4d7a-b6b8-9021d05cff3d',0,10,'\0',NULL,NULL),('bb9b7140-175b-42b1-a71a-b5b6489520ec',NULL,'identity-provider-redirector','cadce104-54a0-4956-8ab8-384021f6a4c5','e261e7f1-843f-4e5d-b208-5925a5c33fe6',2,25,'\0',NULL,NULL),('bcc8aba2-a41d-49f9-aa41-a14d7acebbf0',NULL,'reset-otp','onesaitplatform','b62e0e05-c08c-4c2d-8fc6-6ecae3ed1add',0,20,'\0',NULL,NULL),('bd04e26f-17c9-461a-90e0-cffb8d65bcb7',NULL,NULL,'cadce104-54a0-4956-8ab8-384021f6a4c5','f0ec16b4-38e3-4412-a653-6434987edc7d',0,20,'','43789076-6f14-42c5-907d-1957e261c48a',NULL),('bd200eb1-b256-4fd9-b1eb-b638aa1621a0',NULL,'auth-cookie','onesaitplatform','cf48d33f-608f-4fba-9845-8fe3536f89cc',2,10,'\0',NULL,NULL),('be518024-6956-4ded-8110-598bda642984',NULL,'conditional-user-configured','cadce104-54a0-4956-8ab8-384021f6a4c5','3e05cff5-29a1-4005-bb81-f64dfbd6bc4b',0,10,'\0',NULL,NULL),('c8d071dc-bce6-40ab-89d9-4bf32c0e9eab',NULL,'auth-spnego','onesaitplatform','9346250b-33c6-4223-9cbf-68b9b3bad654',3,30,'\0',NULL,NULL),('c907b058-dc02-4fb7-9f70-a679d4bd8dcc',NULL,'no-cookie-redirect','onesaitplatform','5d7e49e4-147e-44c3-a966-dcff8e307f52',0,10,'\0',NULL,NULL),('d0bce3e8-4de4-4b13-8fea-ac0e6541c2a7',NULL,'reset-otp','cadce104-54a0-4956-8ab8-384021f6a4c5','6d3da358-6cc9-4322-96e1-1425c527633a',0,20,'\0',NULL,NULL),('d1b2d684-2bb4-4fe7-b3c6-cc66cba96f39',NULL,'direct-grant-validate-otp','cadce104-54a0-4956-8ab8-384021f6a4c5','3e05cff5-29a1-4005-bb81-f64dfbd6bc4b',0,20,'\0',NULL,NULL),('d600fa4d-1f11-4bc9-8746-8984186b8315',NULL,NULL,'onesaitplatform','1d1c7873-9715-41c2-9c7c-54a400952701',1,20,'','627151dd-79a5-44b2-bca8-991f77e58ef6',NULL),('de24dac0-923e-4838-bddf-9132e3a3618c',NULL,'reset-credential-email','cadce104-54a0-4956-8ab8-384021f6a4c5','fb423f9b-cf17-41ea-8d44-3e580b750ffb',0,20,'\0',NULL,NULL),('e58a58e5-48d5-4fc0-845e-e93543f7edd4',NULL,'reset-credentials-choose-user','cadce104-54a0-4956-8ab8-384021f6a4c5','fb423f9b-cf17-41ea-8d44-3e580b750ffb',0,10,'\0',NULL,NULL),('ea0aafe8-0777-4ad2-9d56-0606e1b64494',NULL,'client-secret','onesaitplatform','00e224b3-14a0-4ecf-99f4-795e82796dd2',2,10,'\0',NULL,NULL),('ea0ea5bf-4166-4487-a278-d33d44d2fb99',NULL,'docker-http-basic-authenticator','cadce104-54a0-4956-8ab8-384021f6a4c5','a7ee05ef-694d-4e0e-b05c-8d4a617f1f5c',0,10,'\0',NULL,NULL),('ea631a8f-3e68-4674-b5c2-95cb6451163c',NULL,'direct-grant-validate-password','onesaitplatform','e6120580-64ee-4ada-857c-c1d9b03adba0',0,20,'\0',NULL,NULL),('eae61d53-d3c6-407a-af37-6573e1d4fed6',NULL,'direct-grant-validate-password','onesaitplatform','4be72a30-8785-4346-95de-3fdadab18b84',0,1,'\0',NULL,NULL),('eb29e343-7335-4a87-a57d-b307bb49b6fb',NULL,NULL,'cadce104-54a0-4956-8ab8-384021f6a4c5','000a93db-5b18-4a2e-9d9c-afd540a82977',1,20,'','7256e84d-6be5-43db-b7f7-a545707765a0',NULL),('ebf57f27-a6ad-4519-885b-a70c84c9a918',NULL,'user-active-validator','onesaitplatform','4be72a30-8785-4346-95de-3fdadab18b84',0,2,'\0',NULL,NULL),('efd5d260-455b-461f-b15a-73394724ff3d',NULL,'conditional-user-configured','onesaitplatform','b0041f4e-cdf7-4e13-8db9-ea43ad0c57d3',0,10,'\0',NULL,NULL),('f1ad4ade-653f-4f12-a7bd-091b0798dbbb',NULL,'http-basic-authenticator','cadce104-54a0-4956-8ab8-384021f6a4c5','ad5f8e3b-92c3-486e-8711-ccc1ad42bf4a',0,10,'\0',NULL,NULL),('f3fc8f65-a744-40fb-9e64-7179b8805bc1',NULL,'conditional-user-configured','onesaitplatform','627151dd-79a5-44b2-bca8-991f77e58ef6',0,10,'\0',NULL,NULL),('f8bb879b-5b54-4016-be07-c05c823be7d7',NULL,'client-x509','onesaitplatform','00e224b3-14a0-4ecf-99f4-795e82796dd2',2,40,'\0',NULL,NULL),('f8ec20e0-dc82-421b-9d8a-6e691265b6ad',NULL,'conditional-user-configured','onesaitplatform','c771b5c4-e9a9-4566-a61b-eaa7995bbb99',0,10,'\0',NULL,NULL),('fc57f458-5531-426a-880b-681f6d0782e7',NULL,NULL,'cadce104-54a0-4956-8ab8-384021f6a4c5','ebcd7420-1e24-4522-800e-14e7b0cc954a',1,20,'','91760095-8179-43a1-be64-8878b9179190',NULL),('fcb324dc-2d1c-4f48-a7c3-2272a7de75e4',NULL,'auth-username-password-form','cadce104-54a0-4956-8ab8-384021f6a4c5','ebcd7420-1e24-4522-800e-14e7b0cc954a',0,10,'\0',NULL,NULL),('fdbedfc8-c9c8-4e17-b9fc-83f7c6226635',NULL,NULL,'onesaitplatform','feff7ebb-0850-4c2b-a289-42b64906fc6f',2,20,'','0873bb87-7dee-4d82-b1cc-e2d0afb505bb',NULL);
/*!40000 ALTER TABLE `authentication_execution` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authentication_flow` (
  `ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ALIAS` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `REALM_ID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PROVIDER_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'basic-flow',
  `TOP_LEVEL` bit(1) NOT NULL DEFAULT b'0',
  `BUILT_IN` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`ID`),
  KEY `IDX_AUTH_FLOW_REALM` (`REALM_ID`),
  CONSTRAINT `FK_AUTH_FLOW_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `realm` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `authentication_flow` WRITE;
/*!40000 ALTER TABLE `authentication_flow` DISABLE KEYS */;
INSERT INTO `authentication_flow` VALUES ('000a93db-5b18-4a2e-9d9c-afd540a82977','Verify Existing Account by Re-authentication','Reauthentication of existing account','cadce104-54a0-4956-8ab8-384021f6a4c5','basic-flow','\0',''),('00e224b3-14a0-4ecf-99f4-795e82796dd2','clients','Base authentication for clients','onesaitplatform','client-flow','',''),('0873bb87-7dee-4d82-b1cc-e2d0afb505bb','Handle Existing Account','Handle what to do if there is existing account with same email/username like authenticated identity provider','onesaitplatform','basic-flow','\0',''),('10efd549-1639-4ba4-a3eb-87a165ab1192','Account verification options','Method with which to verity the existing account','cadce104-54a0-4956-8ab8-384021f6a4c5','basic-flow','\0',''),('181b592a-36f1-4aa8-85ee-94e79946966f','docker auth','Used by Docker clients to authenticate against the IDP','onesaitplatform','basic-flow','',''),('1d1c7873-9715-41c2-9c7c-54a400952701','forms','Username, password, otp and other auth forms.','onesaitplatform','basic-flow','\0',''),('268bdf85-24f4-43d9-9ddf-4177e219e293','direct grant','OpenID Connect Resource Owner Grant','cadce104-54a0-4956-8ab8-384021f6a4c5','basic-flow','',''),('3e05cff5-29a1-4005-bb81-f64dfbd6bc4b','Direct Grant - Conditional OTP','Flow to determine if the OTP is required for the authentication','cadce104-54a0-4956-8ab8-384021f6a4c5','basic-flow','\0',''),('43789076-6f14-42c5-907d-1957e261c48a','Authentication Options','Authentication options.','cadce104-54a0-4956-8ab8-384021f6a4c5','basic-flow','\0',''),('4b6460bb-5846-46c7-992e-dd5ea4b3317f','registration form','registration form','onesaitplatform','form-flow','\0',''),('4be72a30-8785-4346-95de-3fdadab18b84','Multitenant-implicit-grant-flow','Multitenant-implicit-grant-flow','onesaitplatform','basic-flow','','\0'),('54c3d15c-4df4-47e2-814b-7df77e44c693','first broker login','Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account','onesaitplatform','basic-flow','',''),('588d2385-71a7-4c3b-afc9-6cdc13c9bd16','saml ecp','SAML ECP Profile Authentication Flow','onesaitplatform','basic-flow','',''),('5d7e49e4-147e-44c3-a966-dcff8e307f52','http challenge','An authentication flow based on challenge-response HTTP Authentication Schemes','onesaitplatform','basic-flow','',''),('627151dd-79a5-44b2-bca8-991f77e58ef6','Browser - Conditional OTP','Flow to determine if the OTP is required for the authentication','onesaitplatform','basic-flow','\0',''),('65ea8add-5ff5-42e4-9261-1d96bfacb67d','clients','Base authentication for clients','cadce104-54a0-4956-8ab8-384021f6a4c5','client-flow','',''),('67a99acf-9939-4d7a-b6b8-9021d05cff3d','reset credentials','Reset credentials for a user if they forgot their password or something','onesaitplatform','basic-flow','',''),('6d3da358-6cc9-4322-96e1-1425c527633a','Reset - Conditional OTP','Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.','cadce104-54a0-4956-8ab8-384021f6a4c5','basic-flow','\0',''),('7252b9da-515d-44b8-919e-8f70a0b0e547','Handle Existing Account','Handle what to do if there is existing account with same email/username like authenticated identity provider','cadce104-54a0-4956-8ab8-384021f6a4c5','basic-flow','\0',''),('7256e84d-6be5-43db-b7f7-a545707765a0','First broker login - Conditional OTP','Flow to determine if the OTP is required for the authentication','cadce104-54a0-4956-8ab8-384021f6a4c5','basic-flow','\0',''),('80314424-20af-4403-b21a-e0b3861d572d','User creation or linking','Flow for the existing/non-existing user alternatives','cadce104-54a0-4956-8ab8-384021f6a4c5','basic-flow','\0',''),('91760095-8179-43a1-be64-8878b9179190','Browser - Conditional OTP','Flow to determine if the OTP is required for the authentication','cadce104-54a0-4956-8ab8-384021f6a4c5','basic-flow','\0',''),('9346250b-33c6-4223-9cbf-68b9b3bad654','Authentication Options','Authentication options.','onesaitplatform','basic-flow','\0',''),('98e66e2a-d4da-4c0f-acfa-38e8937b4c52','Verify Existing Account by Re-authentication','Reauthentication of existing account','onesaitplatform','basic-flow','\0',''),('9dc5d586-c960-43fb-bbf6-6940d1f3393f','registration','registration flow','cadce104-54a0-4956-8ab8-384021f6a4c5','basic-flow','',''),('a7ee05ef-694d-4e0e-b05c-8d4a617f1f5c','docker auth','Used by Docker clients to authenticate against the IDP','cadce104-54a0-4956-8ab8-384021f6a4c5','basic-flow','',''),('a9898c17-df2e-4d14-b5a8-9047b3a596cc','Multitenant-browser-form','Multitenant-browser-form','onesaitplatform','basic-flow','\0','\0'),('abddf49f-4786-4c02-9ac3-39be66315e45','Account verification options','Method with which to verity the existing account','onesaitplatform','basic-flow','\0',''),('ad5f8e3b-92c3-486e-8711-ccc1ad42bf4a','saml ecp','SAML ECP Profile Authentication Flow','cadce104-54a0-4956-8ab8-384021f6a4c5','basic-flow','',''),('b0041f4e-cdf7-4e13-8db9-ea43ad0c57d3','Direct Grant - Conditional OTP','Flow to determine if the OTP is required for the authentication','onesaitplatform','basic-flow','\0',''),('b62e0e05-c08c-4c2d-8fc6-6ecae3ed1add','Reset - Conditional OTP','Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.','onesaitplatform','basic-flow','\0',''),('c771b5c4-e9a9-4566-a61b-eaa7995bbb99','First broker login - Conditional OTP','Flow to determine if the OTP is required for the authentication','onesaitplatform','basic-flow','\0',''),('cb541ec0-f6cf-4ead-bc7a-124ac723be29','first broker login','Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account','cadce104-54a0-4956-8ab8-384021f6a4c5','basic-flow','',''),('cf48d33f-608f-4fba-9845-8fe3536f89cc','browser','browser based authentication','onesaitplatform','basic-flow','',''),('d54158b4-fc50-48e3-a023-9afb9173acaf','registration form','registration form','cadce104-54a0-4956-8ab8-384021f6a4c5','form-flow','\0',''),('e261e7f1-843f-4e5d-b208-5925a5c33fe6','browser','browser based authentication','cadce104-54a0-4956-8ab8-384021f6a4c5','basic-flow','',''),('e6120580-64ee-4ada-857c-c1d9b03adba0','direct grant','OpenID Connect Resource Owner Grant','onesaitplatform','basic-flow','',''),('ebcd7420-1e24-4522-800e-14e7b0cc954a','forms','Username, password, otp and other auth forms.','cadce104-54a0-4956-8ab8-384021f6a4c5','basic-flow','\0',''),('ed0fc2c9-0ea4-411f-ac55-70f66a2d37d8','Multitenant-browser-flow','Multitenant-browser-flow','onesaitplatform','basic-flow','','\0'),('f0ec16b4-38e3-4412-a653-6434987edc7d','http challenge','An authentication flow based on challenge-response HTTP Authentication Schemes','cadce104-54a0-4956-8ab8-384021f6a4c5','basic-flow','',''),('f0ec7010-571d-4890-b5fb-576fc8839120','registration','registration flow','onesaitplatform','basic-flow','',''),('fb423f9b-cf17-41ea-8d44-3e580b750ffb','reset credentials','Reset credentials for a user if they forgot their password or something','cadce104-54a0-4956-8ab8-384021f6a4c5','basic-flow','',''),('feff7ebb-0850-4c2b-a289-42b64906fc6f','User creation or linking','Flow for the existing/non-existing user alternatives','onesaitplatform','basic-flow','\0','');
/*!40000 ALTER TABLE `authentication_flow` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authenticator_config` (
  `ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ALIAS` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `REALM_ID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_AUTH_CONFIG_REALM` (`REALM_ID`),
  CONSTRAINT `FK_AUTH_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `realm` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `authenticator_config` WRITE;
/*!40000 ALTER TABLE `authenticator_config` DISABLE KEYS */;
INSERT INTO `authenticator_config` VALUES ('42cc6acf-1c72-4c8b-bb08-3584e01fb0c0','review profile config','cadce104-54a0-4956-8ab8-384021f6a4c5'),('501be831-72af-421d-884d-bb9b469b94d9','create unique user config','onesaitplatform'),('c65d1aa8-1fed-4109-895c-bd4f00b5e6cd','create unique user config','cadce104-54a0-4956-8ab8-384021f6a4c5'),('e709d650-f13d-4393-9ed4-d1610193f94b','review profile config','onesaitplatform');
/*!40000 ALTER TABLE `authenticator_config` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authenticator_config_entry` (
  `AUTHENTICATOR_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `VALUE` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`AUTHENTICATOR_ID`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `authenticator_config_entry` WRITE;
/*!40000 ALTER TABLE `authenticator_config_entry` DISABLE KEYS */;
INSERT INTO `authenticator_config_entry` VALUES ('42cc6acf-1c72-4c8b-bb08-3584e01fb0c0','missing','update.profile.on.first.login'),('501be831-72af-421d-884d-bb9b469b94d9','false','require.password.update.after.registration'),('c65d1aa8-1fed-4109-895c-bd4f00b5e6cd','false','require.password.update.after.registration'),('e709d650-f13d-4393-9ed4-d1610193f94b','missing','update.profile.on.first.login');
/*!40000 ALTER TABLE `authenticator_config_entry` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `broker_link` (
  `IDENTITY_PROVIDER` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `REALM_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `BROKER_USER_ID` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `BROKER_USERNAME` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TOKEN` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `USER_ID` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`IDENTITY_PROVIDER`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `broker_link` WRITE;
/*!40000 ALTER TABLE `broker_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `broker_link` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `client` (
  `ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `FULL_SCOPE_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `CLIENT_ID` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `NOT_BEFORE` int(11) DEFAULT NULL,
  `PUBLIC_CLIENT` bit(1) NOT NULL DEFAULT b'0',
  `SECRET` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `BASE_URL` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `BEARER_ONLY` bit(1) NOT NULL DEFAULT b'0',
  `MANAGEMENT_URL` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SURROGATE_AUTH_REQUIRED` bit(1) NOT NULL DEFAULT b'0',
  `REALM_ID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PROTOCOL` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `NODE_REREG_TIMEOUT` int(11) DEFAULT 0,
  `FRONTCHANNEL_LOGOUT` bit(1) NOT NULL DEFAULT b'0',
  `CONSENT_REQUIRED` bit(1) NOT NULL DEFAULT b'0',
  `NAME` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `SERVICE_ACCOUNTS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `CLIENT_AUTHENTICATOR_TYPE` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ROOT_URL` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `REGISTRATION_TOKEN` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `STANDARD_FLOW_ENABLED` bit(1) NOT NULL DEFAULT b'1',
  `IMPLICIT_FLOW_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `DIRECT_ACCESS_GRANTS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `ALWAYS_DISPLAY_IN_CONSOLE` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_B71CJLBENV945RB6GCON438AT` (`REALM_ID`,`CLIENT_ID`),
  KEY `IDX_CLIENT_ID` (`CLIENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` VALUES ('04580e21-6a8f-43a9-83fd-b5dedb5a85a1','','\0','account',0,'',NULL,'/realms/onesaitplatform/account/','\0',NULL,'\0','onesaitplatform','openid-connect',0,'\0','\0','${client_account}','\0','client-secret','${authBaseUrl}',NULL,NULL,'','\0','\0','\0'),('153fb7aa-5ab1-45d9-91cf-b75bf4ebfc50','','\0','realm-management',0,'\0',NULL,NULL,'',NULL,'\0','onesaitplatform','openid-connect',0,'\0','\0','${client_realm-management}','\0','client-secret',NULL,NULL,NULL,'','\0','\0','\0'),('41853b3e-5c99-496a-9fce-fd1c9d496c71','','\0','broker',0,'\0',NULL,NULL,'',NULL,'\0','onesaitplatform','openid-connect',0,'\0','\0','${client_broker}','\0','client-secret',NULL,NULL,NULL,'','\0','\0','\0'),('540bb75a-fb13-4add-ac4a-a682002355e2','','\0','security-admin-console',0,'',NULL,'/admin/master/console/','\0',NULL,'\0','cadce104-54a0-4956-8ab8-384021f6a4c5','openid-connect',0,'\0','\0','${client_security-admin-console}','\0','client-secret','${authAdminUrl}',NULL,NULL,'','\0','\0','\0'),('6df83b2a-c035-439b-a6b9-658ebf055a0f','','\0','account',0,'',NULL,'/realms/master/account/','\0',NULL,'\0','cadce104-54a0-4956-8ab8-384021f6a4c5','openid-connect',0,'\0','\0','${client_account}','\0','client-secret','${authBaseUrl}',NULL,NULL,'','\0','\0','\0'),('75df4a8f-2a6e-49f3-9a96-e57a1a089a6c','','\0','broker',0,'\0',NULL,NULL,'',NULL,'\0','cadce104-54a0-4956-8ab8-384021f6a4c5','openid-connect',0,'\0','\0','${client_broker}','\0','client-secret',NULL,NULL,NULL,'','\0','\0','\0'),('7a104b35-318c-492d-9c3d-784d22baa735','','\0','account-console',0,'',NULL,'/realms/master/account/','\0',NULL,'\0','cadce104-54a0-4956-8ab8-384021f6a4c5','openid-connect',0,'\0','\0','${client_account-console}','\0','client-secret','${authBaseUrl}',NULL,NULL,'','\0','\0','\0'),('98ed13b8-d6e4-44fa-820f-1967075b06ce','','\0','master-realm',0,'\0',NULL,NULL,'',NULL,'\0','cadce104-54a0-4956-8ab8-384021f6a4c5',NULL,0,'\0','\0','master Realm','\0','client-secret',NULL,NULL,NULL,'','\0','\0','\0'),('b33828e2-3577-43c9-a54e-bf3f63656187','','\0','admin-cli',0,'',NULL,NULL,'\0',NULL,'\0','cadce104-54a0-4956-8ab8-384021f6a4c5','openid-connect',0,'\0','\0','${client_admin-cli}','\0','client-secret',NULL,NULL,NULL,'\0','\0','','\0'),('b437f737-aadd-47b5-a7f7-beb45dd6509b','','\0','onesaitplatform-realm',0,'\0',NULL,NULL,'',NULL,'\0','cadce104-54a0-4956-8ab8-384021f6a4c5',NULL,0,'\0','\0','onesaitplatform Realm','\0','client-secret',NULL,NULL,NULL,'','\0','\0','\0'),('d9523613-ef9c-43f1-a637-9a09e56d6be0','','\0','account-console',0,'',NULL,'/realms/onesaitplatform/account/','\0',NULL,'\0','onesaitplatform','openid-connect',0,'\0','\0','${client_account-console}','\0','client-secret','${authBaseUrl}',NULL,NULL,'','\0','\0','\0'),('e5567ab6-f2f6-4ff1-a13a-f0777d2290f3','','','onesaitplatform',0,'\0','onesaitplatform',NULL,'\0',NULL,'\0','onesaitplatform','openid-connect',-1,'\0','\0',NULL,'','client-secret',NULL,NULL,NULL,'','\0','','\0'),('ec217a27-11a6-43b8-b3f9-ff7af5b1af00','','\0','admin-cli',0,'',NULL,NULL,'\0',NULL,'\0','onesaitplatform','openid-connect',0,'\0','\0','${client_admin-cli}','\0','client-secret',NULL,NULL,NULL,'\0','\0','','\0'),('fbb63a4e-569a-4579-86fa-4f2cb6569836','','\0','security-admin-console',0,'',NULL,'/admin/onesaitplatform/console/','\0',NULL,'\0','onesaitplatform','openid-connect',0,'\0','\0','${client_security-admin-console}','\0','client-secret','${authAdminUrl}',NULL,NULL,'','\0','\0','\0');
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `client_attributes` (
  `CLIENT_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `NAME` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `VALUE` longtext CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`CLIENT_ID`,`NAME`),
  KEY `IDX_CLIENT_ATT_BY_NAME_VALUE` (`NAME`),
  CONSTRAINT `FK3C47C64BEACCA966` FOREIGN KEY (`CLIENT_ID`) REFERENCES `client` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `client_attributes` WRITE;
/*!40000 ALTER TABLE `client_attributes` DISABLE KEYS */;
INSERT INTO `client_attributes` VALUES ('04580e21-6a8f-43a9-83fd-b5dedb5a85a1','post.logout.redirect.uris','+'),('540bb75a-fb13-4add-ac4a-a682002355e2','pkce.code.challenge.method','S256'),('540bb75a-fb13-4add-ac4a-a682002355e2','post.logout.redirect.uris','+'),('6df83b2a-c035-439b-a6b9-658ebf055a0f','post.logout.redirect.uris','+'),('7a104b35-318c-492d-9c3d-784d22baa735','pkce.code.challenge.method','S256'),('7a104b35-318c-492d-9c3d-784d22baa735','post.logout.redirect.uris','+'),('d9523613-ef9c-43f1-a637-9a09e56d6be0','pkce.code.challenge.method','S256'),('d9523613-ef9c-43f1-a637-9a09e56d6be0','post.logout.redirect.uris','+'),('e5567ab6-f2f6-4ff1-a13a-f0777d2290f3','access.token.lifespan','60000'),('e5567ab6-f2f6-4ff1-a13a-f0777d2290f3','backchannel.logout.revoke.offline.tokens','false'),('e5567ab6-f2f6-4ff1-a13a-f0777d2290f3','backchannel.logout.session.required','true'),('fbb63a4e-569a-4579-86fa-4f2cb6569836','pkce.code.challenge.method','S256'),('fbb63a4e-569a-4579-86fa-4f2cb6569836','post.logout.redirect.uris','+');
/*!40000 ALTER TABLE `client_attributes` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `client_auth_flow_bindings` (
  `CLIENT_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `FLOW_ID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `BINDING_NAME` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`BINDING_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `client_auth_flow_bindings` WRITE;
/*!40000 ALTER TABLE `client_auth_flow_bindings` DISABLE KEYS */;
/*!40000 ALTER TABLE `client_auth_flow_bindings` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `client_initial_access` (
  `ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `REALM_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `TIMESTAMP` int(11) DEFAULT NULL,
  `EXPIRATION` int(11) DEFAULT NULL,
  `COUNT` int(11) DEFAULT NULL,
  `REMAINING_COUNT` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_CLIENT_INIT_ACC_REALM` (`REALM_ID`),
  CONSTRAINT `FK_CLIENT_INIT_ACC_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `realm` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `client_initial_access` WRITE;
/*!40000 ALTER TABLE `client_initial_access` DISABLE KEYS */;
/*!40000 ALTER TABLE `client_initial_access` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `client_node_registrations` (
  `CLIENT_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `VALUE` int(11) DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`NAME`),
  CONSTRAINT `FK4129723BA992F594` FOREIGN KEY (`CLIENT_ID`) REFERENCES `client` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `client_node_registrations` WRITE;
/*!40000 ALTER TABLE `client_node_registrations` DISABLE KEYS */;
/*!40000 ALTER TABLE `client_node_registrations` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `client_scope` (
  `ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `NAME` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `REALM_ID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `PROTOCOL` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_CLI_SCOPE` (`REALM_ID`,`NAME`),
  KEY `IDX_REALM_CLSCOPE` (`REALM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `client_scope` WRITE;
/*!40000 ALTER TABLE `client_scope` DISABLE KEYS */;
INSERT INTO `client_scope` VALUES ('14a71407-3857-4bd6-b9f9-0745f8452dbc','acr','cadce104-54a0-4956-8ab8-384021f6a4c5','OpenID Connect scope for add acr (authentication context class reference) to the token','openid-connect'),('1e3a8748-b5e0-42e2-8456-c4dfaa9fc46f','profile','onesaitplatform','OpenID Connect built-in scope: profile','openid-connect'),('21db3614-01d1-4b25-a233-f027b93c4b1e','roles','cadce104-54a0-4956-8ab8-384021f6a4c5','OpenID Connect scope for add user roles to the access token','openid-connect'),('260ef9f7-c1b2-4f7e-a4cf-2567b9f035e3','acr','onesaitplatform','OpenID Connect scope for add acr (authentication context class reference) to the token','openid-connect'),('2cc32519-8821-47d6-9c75-8847561e0c6c','openid','onesaitplatform',NULL,'openid-connect'),('64f51978-8f7a-4b47-a1b9-77e9694d1f70','role_list','cadce104-54a0-4956-8ab8-384021f6a4c5','SAML role list','saml'),('6d04f5c5-6255-4c43-b8ff-aac92b7749fc','web-origins','onesaitplatform','OpenID Connect scope for add allowed web origins to the access token','openid-connect'),('89a0577a-53a3-4019-9d58-5c3d08875909','role_list','onesaitplatform','SAML role list','saml'),('9068e53c-57a8-4227-a463-178fd9d2f938','email','cadce104-54a0-4956-8ab8-384021f6a4c5','OpenID Connect built-in scope: email','openid-connect'),('b64be050-47b4-49be-bc82-395725648497','roles','onesaitplatform','OpenID Connect scope for add user roles to the access token','openid-connect'),('c55b9a6d-dff3-41dd-b9ee-d19c2e329a26','email','onesaitplatform','OpenID Connect built-in scope: email','openid-connect'),('d03d070b-9e65-4606-80bd-89bb84c6f559','phone','onesaitplatform','OpenID Connect built-in scope: phone','openid-connect'),('d933f55b-3263-46b8-ab62-a92c9f4ad084','profile','cadce104-54a0-4956-8ab8-384021f6a4c5','OpenID Connect built-in scope: profile','openid-connect'),('e0372e79-7d76-4ff2-9a78-6264cf470acc','microprofile-jwt','cadce104-54a0-4956-8ab8-384021f6a4c5','Microprofile - JWT built-in scope','openid-connect'),('e2789303-02b6-48d5-886e-fe729628d23d','offline_access','cadce104-54a0-4956-8ab8-384021f6a4c5','OpenID Connect built-in scope: offline_access','openid-connect'),('e2f3db6b-3d7b-4d39-8425-67b7ab8307f5','address','cadce104-54a0-4956-8ab8-384021f6a4c5','OpenID Connect built-in scope: address','openid-connect'),('ecd471d5-020c-4c18-ac02-d5eca98613d9','microprofile-jwt','onesaitplatform','Microprofile - JWT built-in scope','openid-connect'),('edd980cc-997a-478e-a198-6aacc3446e01','web-origins','cadce104-54a0-4956-8ab8-384021f6a4c5','OpenID Connect scope for add allowed web origins to the access token','openid-connect'),('f27a7b40-dbf9-4a2a-b411-29c1f7a06804','phone','cadce104-54a0-4956-8ab8-384021f6a4c5','OpenID Connect built-in scope: phone','openid-connect'),('f3edecac-11d8-46da-a493-1fd283a66f6b','offline_access','onesaitplatform','OpenID Connect built-in scope: offline_access','openid-connect'),('fa9dbcf3-ed64-465f-9d1d-0a650d5023c8','address','onesaitplatform','OpenID Connect built-in scope: address','openid-connect');
/*!40000 ALTER TABLE `client_scope` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `client_scope_attributes` (
  `SCOPE_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `VALUE` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`SCOPE_ID`,`NAME`),
  KEY `IDX_CLSCOPE_ATTRS` (`SCOPE_ID`),
  CONSTRAINT `FK_CL_SCOPE_ATTR_SCOPE` FOREIGN KEY (`SCOPE_ID`) REFERENCES `client_scope` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `client_scope_attributes` WRITE;
/*!40000 ALTER TABLE `client_scope_attributes` DISABLE KEYS */;
INSERT INTO `client_scope_attributes` VALUES ('14a71407-3857-4bd6-b9f9-0745f8452dbc','false','display.on.consent.screen'),('14a71407-3857-4bd6-b9f9-0745f8452dbc','false','include.in.token.scope'),('1e3a8748-b5e0-42e2-8456-c4dfaa9fc46f','${profileScopeConsentText}','consent.screen.text'),('1e3a8748-b5e0-42e2-8456-c4dfaa9fc46f','true','display.on.consent.screen'),('1e3a8748-b5e0-42e2-8456-c4dfaa9fc46f','true','include.in.token.scope'),('21db3614-01d1-4b25-a233-f027b93c4b1e','${rolesScopeConsentText}','consent.screen.text'),('21db3614-01d1-4b25-a233-f027b93c4b1e','true','display.on.consent.screen'),('21db3614-01d1-4b25-a233-f027b93c4b1e','false','include.in.token.scope'),('260ef9f7-c1b2-4f7e-a4cf-2567b9f035e3','false','display.on.consent.screen'),('260ef9f7-c1b2-4f7e-a4cf-2567b9f035e3','false','include.in.token.scope'),('2cc32519-8821-47d6-9c75-8847561e0c6c','false','display.on.consent.screen'),('2cc32519-8821-47d6-9c75-8847561e0c6c','true','include.in.token.scope'),('64f51978-8f7a-4b47-a1b9-77e9694d1f70','${samlRoleListScopeConsentText}','consent.screen.text'),('64f51978-8f7a-4b47-a1b9-77e9694d1f70','true','display.on.consent.screen'),('6d04f5c5-6255-4c43-b8ff-aac92b7749fc','','consent.screen.text'),('6d04f5c5-6255-4c43-b8ff-aac92b7749fc','false','display.on.consent.screen'),('6d04f5c5-6255-4c43-b8ff-aac92b7749fc','false','include.in.token.scope'),('89a0577a-53a3-4019-9d58-5c3d08875909','${samlRoleListScopeConsentText}','consent.screen.text'),('89a0577a-53a3-4019-9d58-5c3d08875909','true','display.on.consent.screen'),('9068e53c-57a8-4227-a463-178fd9d2f938','${emailScopeConsentText}','consent.screen.text'),('9068e53c-57a8-4227-a463-178fd9d2f938','true','display.on.consent.screen'),('9068e53c-57a8-4227-a463-178fd9d2f938','true','include.in.token.scope'),('b64be050-47b4-49be-bc82-395725648497','${rolesScopeConsentText}','consent.screen.text'),('b64be050-47b4-49be-bc82-395725648497','true','display.on.consent.screen'),('b64be050-47b4-49be-bc82-395725648497','false','include.in.token.scope'),('c55b9a6d-dff3-41dd-b9ee-d19c2e329a26','${emailScopeConsentText}','consent.screen.text'),('c55b9a6d-dff3-41dd-b9ee-d19c2e329a26','true','display.on.consent.screen'),('c55b9a6d-dff3-41dd-b9ee-d19c2e329a26','true','include.in.token.scope'),('d03d070b-9e65-4606-80bd-89bb84c6f559','${phoneScopeConsentText}','consent.screen.text'),('d03d070b-9e65-4606-80bd-89bb84c6f559','true','display.on.consent.screen'),('d03d070b-9e65-4606-80bd-89bb84c6f559','true','include.in.token.scope'),('d933f55b-3263-46b8-ab62-a92c9f4ad084','${profileScopeConsentText}','consent.screen.text'),('d933f55b-3263-46b8-ab62-a92c9f4ad084','true','display.on.consent.screen'),('d933f55b-3263-46b8-ab62-a92c9f4ad084','true','include.in.token.scope'),('e0372e79-7d76-4ff2-9a78-6264cf470acc','false','display.on.consent.screen'),('e0372e79-7d76-4ff2-9a78-6264cf470acc','true','include.in.token.scope'),('e2789303-02b6-48d5-886e-fe729628d23d','${offlineAccessScopeConsentText}','consent.screen.text'),('e2789303-02b6-48d5-886e-fe729628d23d','true','display.on.consent.screen'),('e2f3db6b-3d7b-4d39-8425-67b7ab8307f5','${addressScopeConsentText}','consent.screen.text'),('e2f3db6b-3d7b-4d39-8425-67b7ab8307f5','true','display.on.consent.screen'),('e2f3db6b-3d7b-4d39-8425-67b7ab8307f5','true','include.in.token.scope'),('ecd471d5-020c-4c18-ac02-d5eca98613d9','false','display.on.consent.screen'),('ecd471d5-020c-4c18-ac02-d5eca98613d9','true','include.in.token.scope'),('edd980cc-997a-478e-a198-6aacc3446e01','','consent.screen.text'),('edd980cc-997a-478e-a198-6aacc3446e01','false','display.on.consent.screen'),('edd980cc-997a-478e-a198-6aacc3446e01','false','include.in.token.scope'),('f27a7b40-dbf9-4a2a-b411-29c1f7a06804','${phoneScopeConsentText}','consent.screen.text'),('f27a7b40-dbf9-4a2a-b411-29c1f7a06804','true','display.on.consent.screen'),('f27a7b40-dbf9-4a2a-b411-29c1f7a06804','true','include.in.token.scope'),('f3edecac-11d8-46da-a493-1fd283a66f6b','${offlineAccessScopeConsentText}','consent.screen.text'),('f3edecac-11d8-46da-a493-1fd283a66f6b','true','display.on.consent.screen'),('fa9dbcf3-ed64-465f-9d1d-0a650d5023c8','${addressScopeConsentText}','consent.screen.text'),('fa9dbcf3-ed64-465f-9d1d-0a650d5023c8','true','display.on.consent.screen'),('fa9dbcf3-ed64-465f-9d1d-0a650d5023c8','true','include.in.token.scope');
/*!40000 ALTER TABLE `client_scope_attributes` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `client_scope_client` (
  `CLIENT_ID` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `SCOPE_ID` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `DEFAULT_SCOPE` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`CLIENT_ID`,`SCOPE_ID`),
  KEY `IDX_CLSCOPE_CL` (`CLIENT_ID`),
  KEY `IDX_CL_CLSCOPE` (`SCOPE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `client_scope_client` WRITE;
/*!40000 ALTER TABLE `client_scope_client` DISABLE KEYS */;
INSERT INTO `client_scope_client` VALUES ('04580e21-6a8f-43a9-83fd-b5dedb5a85a1','1e3a8748-b5e0-42e2-8456-c4dfaa9fc46f',''),('04580e21-6a8f-43a9-83fd-b5dedb5a85a1','260ef9f7-c1b2-4f7e-a4cf-2567b9f035e3',''),('04580e21-6a8f-43a9-83fd-b5dedb5a85a1','6d04f5c5-6255-4c43-b8ff-aac92b7749fc',''),('04580e21-6a8f-43a9-83fd-b5dedb5a85a1','b64be050-47b4-49be-bc82-395725648497',''),('04580e21-6a8f-43a9-83fd-b5dedb5a85a1','c55b9a6d-dff3-41dd-b9ee-d19c2e329a26',''),('04580e21-6a8f-43a9-83fd-b5dedb5a85a1','d03d070b-9e65-4606-80bd-89bb84c6f559','\0'),('04580e21-6a8f-43a9-83fd-b5dedb5a85a1','ecd471d5-020c-4c18-ac02-d5eca98613d9','\0'),('04580e21-6a8f-43a9-83fd-b5dedb5a85a1','f3edecac-11d8-46da-a493-1fd283a66f6b','\0'),('04580e21-6a8f-43a9-83fd-b5dedb5a85a1','fa9dbcf3-ed64-465f-9d1d-0a650d5023c8','\0'),('153fb7aa-5ab1-45d9-91cf-b75bf4ebfc50','1e3a8748-b5e0-42e2-8456-c4dfaa9fc46f',''),('153fb7aa-5ab1-45d9-91cf-b75bf4ebfc50','260ef9f7-c1b2-4f7e-a4cf-2567b9f035e3',''),('153fb7aa-5ab1-45d9-91cf-b75bf4ebfc50','6d04f5c5-6255-4c43-b8ff-aac92b7749fc',''),('153fb7aa-5ab1-45d9-91cf-b75bf4ebfc50','b64be050-47b4-49be-bc82-395725648497',''),('153fb7aa-5ab1-45d9-91cf-b75bf4ebfc50','c55b9a6d-dff3-41dd-b9ee-d19c2e329a26',''),('153fb7aa-5ab1-45d9-91cf-b75bf4ebfc50','d03d070b-9e65-4606-80bd-89bb84c6f559','\0'),('153fb7aa-5ab1-45d9-91cf-b75bf4ebfc50','ecd471d5-020c-4c18-ac02-d5eca98613d9','\0'),('153fb7aa-5ab1-45d9-91cf-b75bf4ebfc50','f3edecac-11d8-46da-a493-1fd283a66f6b','\0'),('153fb7aa-5ab1-45d9-91cf-b75bf4ebfc50','fa9dbcf3-ed64-465f-9d1d-0a650d5023c8','\0'),('41853b3e-5c99-496a-9fce-fd1c9d496c71','1e3a8748-b5e0-42e2-8456-c4dfaa9fc46f',''),('41853b3e-5c99-496a-9fce-fd1c9d496c71','260ef9f7-c1b2-4f7e-a4cf-2567b9f035e3',''),('41853b3e-5c99-496a-9fce-fd1c9d496c71','6d04f5c5-6255-4c43-b8ff-aac92b7749fc',''),('41853b3e-5c99-496a-9fce-fd1c9d496c71','b64be050-47b4-49be-bc82-395725648497',''),('41853b3e-5c99-496a-9fce-fd1c9d496c71','c55b9a6d-dff3-41dd-b9ee-d19c2e329a26',''),('41853b3e-5c99-496a-9fce-fd1c9d496c71','d03d070b-9e65-4606-80bd-89bb84c6f559','\0'),('41853b3e-5c99-496a-9fce-fd1c9d496c71','ecd471d5-020c-4c18-ac02-d5eca98613d9','\0'),('41853b3e-5c99-496a-9fce-fd1c9d496c71','f3edecac-11d8-46da-a493-1fd283a66f6b','\0'),('41853b3e-5c99-496a-9fce-fd1c9d496c71','fa9dbcf3-ed64-465f-9d1d-0a650d5023c8','\0'),('540bb75a-fb13-4add-ac4a-a682002355e2','14a71407-3857-4bd6-b9f9-0745f8452dbc',''),('540bb75a-fb13-4add-ac4a-a682002355e2','21db3614-01d1-4b25-a233-f027b93c4b1e',''),('540bb75a-fb13-4add-ac4a-a682002355e2','9068e53c-57a8-4227-a463-178fd9d2f938',''),('540bb75a-fb13-4add-ac4a-a682002355e2','d933f55b-3263-46b8-ab62-a92c9f4ad084',''),('540bb75a-fb13-4add-ac4a-a682002355e2','e0372e79-7d76-4ff2-9a78-6264cf470acc','\0'),('540bb75a-fb13-4add-ac4a-a682002355e2','e2789303-02b6-48d5-886e-fe729628d23d','\0'),('540bb75a-fb13-4add-ac4a-a682002355e2','e2f3db6b-3d7b-4d39-8425-67b7ab8307f5','\0'),('540bb75a-fb13-4add-ac4a-a682002355e2','edd980cc-997a-478e-a198-6aacc3446e01',''),('540bb75a-fb13-4add-ac4a-a682002355e2','f27a7b40-dbf9-4a2a-b411-29c1f7a06804','\0'),('6df83b2a-c035-439b-a6b9-658ebf055a0f','14a71407-3857-4bd6-b9f9-0745f8452dbc',''),('6df83b2a-c035-439b-a6b9-658ebf055a0f','21db3614-01d1-4b25-a233-f027b93c4b1e',''),('6df83b2a-c035-439b-a6b9-658ebf055a0f','9068e53c-57a8-4227-a463-178fd9d2f938',''),('6df83b2a-c035-439b-a6b9-658ebf055a0f','d933f55b-3263-46b8-ab62-a92c9f4ad084',''),('6df83b2a-c035-439b-a6b9-658ebf055a0f','e0372e79-7d76-4ff2-9a78-6264cf470acc','\0'),('6df83b2a-c035-439b-a6b9-658ebf055a0f','e2789303-02b6-48d5-886e-fe729628d23d','\0'),('6df83b2a-c035-439b-a6b9-658ebf055a0f','e2f3db6b-3d7b-4d39-8425-67b7ab8307f5','\0'),('6df83b2a-c035-439b-a6b9-658ebf055a0f','edd980cc-997a-478e-a198-6aacc3446e01',''),('6df83b2a-c035-439b-a6b9-658ebf055a0f','f27a7b40-dbf9-4a2a-b411-29c1f7a06804','\0'),('75df4a8f-2a6e-49f3-9a96-e57a1a089a6c','14a71407-3857-4bd6-b9f9-0745f8452dbc',''),('75df4a8f-2a6e-49f3-9a96-e57a1a089a6c','21db3614-01d1-4b25-a233-f027b93c4b1e',''),('75df4a8f-2a6e-49f3-9a96-e57a1a089a6c','9068e53c-57a8-4227-a463-178fd9d2f938',''),('75df4a8f-2a6e-49f3-9a96-e57a1a089a6c','d933f55b-3263-46b8-ab62-a92c9f4ad084',''),('75df4a8f-2a6e-49f3-9a96-e57a1a089a6c','e0372e79-7d76-4ff2-9a78-6264cf470acc','\0'),('75df4a8f-2a6e-49f3-9a96-e57a1a089a6c','e2789303-02b6-48d5-886e-fe729628d23d','\0'),('75df4a8f-2a6e-49f3-9a96-e57a1a089a6c','e2f3db6b-3d7b-4d39-8425-67b7ab8307f5','\0'),('75df4a8f-2a6e-49f3-9a96-e57a1a089a6c','edd980cc-997a-478e-a198-6aacc3446e01',''),('75df4a8f-2a6e-49f3-9a96-e57a1a089a6c','f27a7b40-dbf9-4a2a-b411-29c1f7a06804','\0'),('7a104b35-318c-492d-9c3d-784d22baa735','14a71407-3857-4bd6-b9f9-0745f8452dbc',''),('7a104b35-318c-492d-9c3d-784d22baa735','21db3614-01d1-4b25-a233-f027b93c4b1e',''),('7a104b35-318c-492d-9c3d-784d22baa735','9068e53c-57a8-4227-a463-178fd9d2f938',''),('7a104b35-318c-492d-9c3d-784d22baa735','d933f55b-3263-46b8-ab62-a92c9f4ad084',''),('7a104b35-318c-492d-9c3d-784d22baa735','e0372e79-7d76-4ff2-9a78-6264cf470acc','\0'),('7a104b35-318c-492d-9c3d-784d22baa735','e2789303-02b6-48d5-886e-fe729628d23d','\0'),('7a104b35-318c-492d-9c3d-784d22baa735','e2f3db6b-3d7b-4d39-8425-67b7ab8307f5','\0'),('7a104b35-318c-492d-9c3d-784d22baa735','edd980cc-997a-478e-a198-6aacc3446e01',''),('7a104b35-318c-492d-9c3d-784d22baa735','f27a7b40-dbf9-4a2a-b411-29c1f7a06804','\0'),('98ed13b8-d6e4-44fa-820f-1967075b06ce','14a71407-3857-4bd6-b9f9-0745f8452dbc',''),('98ed13b8-d6e4-44fa-820f-1967075b06ce','21db3614-01d1-4b25-a233-f027b93c4b1e',''),('98ed13b8-d6e4-44fa-820f-1967075b06ce','9068e53c-57a8-4227-a463-178fd9d2f938',''),('98ed13b8-d6e4-44fa-820f-1967075b06ce','d933f55b-3263-46b8-ab62-a92c9f4ad084',''),('98ed13b8-d6e4-44fa-820f-1967075b06ce','e0372e79-7d76-4ff2-9a78-6264cf470acc','\0'),('98ed13b8-d6e4-44fa-820f-1967075b06ce','e2789303-02b6-48d5-886e-fe729628d23d','\0'),('98ed13b8-d6e4-44fa-820f-1967075b06ce','e2f3db6b-3d7b-4d39-8425-67b7ab8307f5','\0'),('98ed13b8-d6e4-44fa-820f-1967075b06ce','edd980cc-997a-478e-a198-6aacc3446e01',''),('98ed13b8-d6e4-44fa-820f-1967075b06ce','f27a7b40-dbf9-4a2a-b411-29c1f7a06804','\0'),('b33828e2-3577-43c9-a54e-bf3f63656187','14a71407-3857-4bd6-b9f9-0745f8452dbc',''),('b33828e2-3577-43c9-a54e-bf3f63656187','21db3614-01d1-4b25-a233-f027b93c4b1e',''),('b33828e2-3577-43c9-a54e-bf3f63656187','9068e53c-57a8-4227-a463-178fd9d2f938',''),('b33828e2-3577-43c9-a54e-bf3f63656187','d933f55b-3263-46b8-ab62-a92c9f4ad084',''),('b33828e2-3577-43c9-a54e-bf3f63656187','e0372e79-7d76-4ff2-9a78-6264cf470acc','\0'),('b33828e2-3577-43c9-a54e-bf3f63656187','e2789303-02b6-48d5-886e-fe729628d23d','\0'),('b33828e2-3577-43c9-a54e-bf3f63656187','e2f3db6b-3d7b-4d39-8425-67b7ab8307f5','\0'),('b33828e2-3577-43c9-a54e-bf3f63656187','edd980cc-997a-478e-a198-6aacc3446e01',''),('b33828e2-3577-43c9-a54e-bf3f63656187','f27a7b40-dbf9-4a2a-b411-29c1f7a06804','\0'),('d9523613-ef9c-43f1-a637-9a09e56d6be0','1e3a8748-b5e0-42e2-8456-c4dfaa9fc46f',''),('d9523613-ef9c-43f1-a637-9a09e56d6be0','260ef9f7-c1b2-4f7e-a4cf-2567b9f035e3',''),('d9523613-ef9c-43f1-a637-9a09e56d6be0','6d04f5c5-6255-4c43-b8ff-aac92b7749fc',''),('d9523613-ef9c-43f1-a637-9a09e56d6be0','b64be050-47b4-49be-bc82-395725648497',''),('d9523613-ef9c-43f1-a637-9a09e56d6be0','c55b9a6d-dff3-41dd-b9ee-d19c2e329a26',''),('d9523613-ef9c-43f1-a637-9a09e56d6be0','d03d070b-9e65-4606-80bd-89bb84c6f559','\0'),('d9523613-ef9c-43f1-a637-9a09e56d6be0','ecd471d5-020c-4c18-ac02-d5eca98613d9','\0'),('d9523613-ef9c-43f1-a637-9a09e56d6be0','f3edecac-11d8-46da-a493-1fd283a66f6b','\0'),('d9523613-ef9c-43f1-a637-9a09e56d6be0','fa9dbcf3-ed64-465f-9d1d-0a650d5023c8','\0'),('e5567ab6-f2f6-4ff1-a13a-f0777d2290f3','2cc32519-8821-47d6-9c75-8847561e0c6c',''),('ec217a27-11a6-43b8-b3f9-ff7af5b1af00','1e3a8748-b5e0-42e2-8456-c4dfaa9fc46f',''),('ec217a27-11a6-43b8-b3f9-ff7af5b1af00','260ef9f7-c1b2-4f7e-a4cf-2567b9f035e3',''),('ec217a27-11a6-43b8-b3f9-ff7af5b1af00','6d04f5c5-6255-4c43-b8ff-aac92b7749fc',''),('ec217a27-11a6-43b8-b3f9-ff7af5b1af00','b64be050-47b4-49be-bc82-395725648497',''),('ec217a27-11a6-43b8-b3f9-ff7af5b1af00','c55b9a6d-dff3-41dd-b9ee-d19c2e329a26',''),('ec217a27-11a6-43b8-b3f9-ff7af5b1af00','d03d070b-9e65-4606-80bd-89bb84c6f559','\0'),('ec217a27-11a6-43b8-b3f9-ff7af5b1af00','ecd471d5-020c-4c18-ac02-d5eca98613d9','\0'),('ec217a27-11a6-43b8-b3f9-ff7af5b1af00','f3edecac-11d8-46da-a493-1fd283a66f6b','\0'),('ec217a27-11a6-43b8-b3f9-ff7af5b1af00','fa9dbcf3-ed64-465f-9d1d-0a650d5023c8','\0'),('fbb63a4e-569a-4579-86fa-4f2cb6569836','1e3a8748-b5e0-42e2-8456-c4dfaa9fc46f',''),('fbb63a4e-569a-4579-86fa-4f2cb6569836','260ef9f7-c1b2-4f7e-a4cf-2567b9f035e3',''),('fbb63a4e-569a-4579-86fa-4f2cb6569836','6d04f5c5-6255-4c43-b8ff-aac92b7749fc',''),('fbb63a4e-569a-4579-86fa-4f2cb6569836','b64be050-47b4-49be-bc82-395725648497',''),('fbb63a4e-569a-4579-86fa-4f2cb6569836','c55b9a6d-dff3-41dd-b9ee-d19c2e329a26',''),('fbb63a4e-569a-4579-86fa-4f2cb6569836','d03d070b-9e65-4606-80bd-89bb84c6f559','\0'),('fbb63a4e-569a-4579-86fa-4f2cb6569836','ecd471d5-020c-4c18-ac02-d5eca98613d9','\0'),('fbb63a4e-569a-4579-86fa-4f2cb6569836','f3edecac-11d8-46da-a493-1fd283a66f6b','\0'),('fbb63a4e-569a-4579-86fa-4f2cb6569836','fa9dbcf3-ed64-465f-9d1d-0a650d5023c8','\0');
/*!40000 ALTER TABLE `client_scope_client` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `client_scope_role_mapping` (
  `SCOPE_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ROLE_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`SCOPE_ID`,`ROLE_ID`),
  KEY `IDX_CLSCOPE_ROLE` (`SCOPE_ID`),
  KEY `IDX_ROLE_CLSCOPE` (`ROLE_ID`),
  CONSTRAINT `FK_CL_SCOPE_RM_SCOPE` FOREIGN KEY (`SCOPE_ID`) REFERENCES `client_scope` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `client_scope_role_mapping` WRITE;
/*!40000 ALTER TABLE `client_scope_role_mapping` DISABLE KEYS */;
INSERT INTO `client_scope_role_mapping` VALUES ('e2789303-02b6-48d5-886e-fe729628d23d','e00a45e0-5049-42dc-9aac-81a89d9e8531'),('f3edecac-11d8-46da-a493-1fd283a66f6b','20a5da22-d527-40f0-9109-a9e45514d115');
/*!40000 ALTER TABLE `client_scope_role_mapping` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `client_session` (
  `ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CLIENT_ID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `REDIRECT_URI` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `STATE` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TIMESTAMP` int(11) DEFAULT NULL,
  `SESSION_ID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `AUTH_METHOD` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `REALM_ID` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `AUTH_USER_ID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CURRENT_ACTION` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_CLIENT_SESSION_SESSION` (`SESSION_ID`),
  CONSTRAINT `FK_B4AO2VCVAT6UKAU74WBWTFQO1` FOREIGN KEY (`SESSION_ID`) REFERENCES `user_session` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `client_session` WRITE;
/*!40000 ALTER TABLE `client_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `client_session` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `client_session_auth_status` (
  `AUTHENTICATOR` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `STATUS` int(11) DEFAULT NULL,
  `CLIENT_SESSION` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`AUTHENTICATOR`),
  CONSTRAINT `AUTH_STATUS_CONSTRAINT` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `client_session` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `client_session_auth_status` WRITE;
/*!40000 ALTER TABLE `client_session_auth_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `client_session_auth_status` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `client_session_note` (
  `NAME` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `VALUE` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CLIENT_SESSION` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`NAME`),
  CONSTRAINT `FK5EDFB00FF51C2736` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `client_session` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `client_session_note` WRITE;
/*!40000 ALTER TABLE `client_session_note` DISABLE KEYS */;
/*!40000 ALTER TABLE `client_session_note` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `client_session_prot_mapper` (
  `PROTOCOL_MAPPER_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CLIENT_SESSION` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`PROTOCOL_MAPPER_ID`),
  CONSTRAINT `FK_33A8SGQW18I532811V7O2DK89` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `client_session` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `client_session_prot_mapper` WRITE;
/*!40000 ALTER TABLE `client_session_prot_mapper` DISABLE KEYS */;
/*!40000 ALTER TABLE `client_session_prot_mapper` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `client_session_role` (
  `ROLE_ID` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CLIENT_SESSION` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`ROLE_ID`),
  CONSTRAINT `FK_11B7SGQW18I532811V7O2DV76` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `client_session` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `client_session_role` WRITE;
/*!40000 ALTER TABLE `client_session_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `client_session_role` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `client_user_session_note` (
  `NAME` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `VALUE` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CLIENT_SESSION` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`NAME`),
  CONSTRAINT `FK_CL_USR_SES_NOTE` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `client_session` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `client_user_session_note` WRITE;
/*!40000 ALTER TABLE `client_user_session_note` DISABLE KEYS */;
/*!40000 ALTER TABLE `client_user_session_note` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `component` (
  `ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `NAME` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PARENT_ID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PROVIDER_ID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PROVIDER_TYPE` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `REALM_ID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SUB_TYPE` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_COMPONENT_REALM` (`REALM_ID`),
  KEY `IDX_COMPONENT_PROVIDER_TYPE` (`PROVIDER_TYPE`),
  CONSTRAINT `FK_COMPONENT_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `realm` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `component` WRITE;
/*!40000 ALTER TABLE `component` DISABLE KEYS */;
INSERT INTO `component` VALUES ('2d73cd6c-a32f-4a47-9e1c-50d2b3c5ba13','Trusted Hosts','cadce104-54a0-4956-8ab8-384021f6a4c5','trusted-hosts','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','cadce104-54a0-4956-8ab8-384021f6a4c5','anonymous'),('2e82a151-8e0b-4954-86e7-a17a1f61220f','Trusted Hosts','onesaitplatform','trusted-hosts','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','onesaitplatform','anonymous'),('36679be2-0f6d-4411-af16-03f00b04a3c5',NULL,'cadce104-54a0-4956-8ab8-384021f6a4c5','declarative-user-profile','org.keycloak.userprofile.UserProfileProvider','cadce104-54a0-4956-8ab8-384021f6a4c5',NULL),('41c61cc2-30b6-427b-9d94-61ac4db51fe7','aes-generated','cadce104-54a0-4956-8ab8-384021f6a4c5','aes-generated','org.keycloak.keys.KeyProvider','cadce104-54a0-4956-8ab8-384021f6a4c5',NULL),('60c688ad-f930-4a76-8ed9-4980bde82ffe','Max Clients Limit','onesaitplatform','max-clients','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','onesaitplatform','anonymous'),('642359c8-e564-47bc-b36c-ce4cd4ee61cc','onesaitplatform-provider','onesaitplatform','onesaitplatform-provider','org.keycloak.storage.UserStorageProvider','onesaitplatform',NULL),('74cf604a-4a1c-4a26-afd8-893777b39895','onesaitplatform-provider','master','onesaitplatform-provider','org.keycloak.storage.UserStorageProvider','cadce104-54a0-4956-8ab8-384021f6a4c5',NULL),('7adb523b-3cde-492c-9716-32fdf15e86bb','Full Scope Disabled','onesaitplatform','scope','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','onesaitplatform','anonymous'),('86f268c6-7ce8-4ea3-bb04-96f7db479559','Allowed Protocol Mapper Types','cadce104-54a0-4956-8ab8-384021f6a4c5','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','cadce104-54a0-4956-8ab8-384021f6a4c5','authenticated'),('879c4e76-4b6e-492e-b72b-421b07200b0c','rsa-enc-generated','cadce104-54a0-4956-8ab8-384021f6a4c5','rsa-enc-generated','org.keycloak.keys.KeyProvider','cadce104-54a0-4956-8ab8-384021f6a4c5',NULL),('94c39978-19bd-4027-a16f-39364eb56e2f','rsa-enc-generated','onesaitplatform','rsa-enc-generated','org.keycloak.keys.KeyProvider','onesaitplatform',NULL),('962ab9c5-a8a2-48dd-b9cb-8074b334bdcc','Full Scope Disabled','cadce104-54a0-4956-8ab8-384021f6a4c5','scope','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','cadce104-54a0-4956-8ab8-384021f6a4c5','anonymous'),('97d21080-c565-4e67-8eb0-63ed0b83e6a8','rsa-generated','onesaitplatform','rsa-generated','org.keycloak.keys.KeyProvider','onesaitplatform',NULL),('a2a6d57f-d0b1-4530-a085-9f068de73f1f','rsa-generated','cadce104-54a0-4956-8ab8-384021f6a4c5','rsa-generated','org.keycloak.keys.KeyProvider','cadce104-54a0-4956-8ab8-384021f6a4c5',NULL),('b2684d0f-7c42-4de0-8bab-d612c2519a3c','Allowed Client Scopes','cadce104-54a0-4956-8ab8-384021f6a4c5','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','cadce104-54a0-4956-8ab8-384021f6a4c5','authenticated'),('b7d2e7a8-4835-4010-836b-6845f629cb47','Allowed Protocol Mapper Types','onesaitplatform','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','onesaitplatform','authenticated'),('bfadbbce-f6bf-4965-8adc-2a9e0bafeb0d','hmac-generated','cadce104-54a0-4956-8ab8-384021f6a4c5','hmac-generated','org.keycloak.keys.KeyProvider','cadce104-54a0-4956-8ab8-384021f6a4c5',NULL),('c2fe8e87-341a-4f10-b80c-6fff8cc6d871','Allowed Protocol Mapper Types','cadce104-54a0-4956-8ab8-384021f6a4c5','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','cadce104-54a0-4956-8ab8-384021f6a4c5','anonymous'),('c7b2f633-8df8-4b2c-bb3f-98c0338f96ae','Consent Required','onesaitplatform','consent-required','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','onesaitplatform','anonymous'),('d6f7beca-5db9-46c5-8394-f3976f0bbe18','Allowed Client Scopes','onesaitplatform','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','onesaitplatform','anonymous'),('dcf2bc3e-7609-4988-af09-90954fad7d6f','hmac-generated','onesaitplatform','hmac-generated','org.keycloak.keys.KeyProvider','onesaitplatform',NULL),('e3df9c7a-1da6-494a-b9d4-3c9c4b5c4543','Max Clients Limit','cadce104-54a0-4956-8ab8-384021f6a4c5','max-clients','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','cadce104-54a0-4956-8ab8-384021f6a4c5','anonymous'),('e4277b0d-a964-424e-bba9-281f63e74503','Allowed Protocol Mapper Types','onesaitplatform','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','onesaitplatform','anonymous'),('eda7fab3-5be3-4582-b9d4-0f2f52490c90','Allowed Client Scopes','onesaitplatform','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','onesaitplatform','authenticated'),('ee3dfbbf-d25f-4102-8fba-ac405f5b3f14','aes-generated','onesaitplatform','aes-generated','org.keycloak.keys.KeyProvider','onesaitplatform',NULL),('f1d94a30-59ba-4b13-b55a-4b150d0328e2','Allowed Client Scopes','cadce104-54a0-4956-8ab8-384021f6a4c5','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','cadce104-54a0-4956-8ab8-384021f6a4c5','anonymous'),('fb03df50-7412-41ad-8c83-b07edabb6f77','Consent Required','cadce104-54a0-4956-8ab8-384021f6a4c5','consent-required','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','cadce104-54a0-4956-8ab8-384021f6a4c5','anonymous');
/*!40000 ALTER TABLE `component` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `component_config` (
  `ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `COMPONENT_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `NAME` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `VALUE` varchar(4000) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_COMPO_CONFIG_COMPO` (`COMPONENT_ID`),
  CONSTRAINT `FK_COMPONENT_CONFIG` FOREIGN KEY (`COMPONENT_ID`) REFERENCES `component` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `component_config` WRITE;
/*!40000 ALTER TABLE `component_config` DISABLE KEYS */;
INSERT INTO `component_config` VALUES ('0196bc10-1b12-4d9f-a24b-ade707fe1619','2d73cd6c-a32f-4a47-9e1c-50d2b3c5ba13','host-sending-registration-request-must-match','true'),('01e303e4-c581-40f8-b7dc-23357934c602','bfadbbce-f6bf-4965-8adc-2a9e0bafeb0d','algorithm','HS256'),('0280cd60-6a2b-4d98-9887-2fcb1ea49d59','a2a6d57f-d0b1-4530-a085-9f068de73f1f','priority','100'),('0571b5e9-07a0-40bd-9f0d-12ac0565cb9e','e4277b0d-a964-424e-bba9-281f63e74503','allowed-protocol-mapper-types','saml-user-attribute-mapper'),('0636238d-05c1-4e4a-8295-fbf1e2f04fd8','41c61cc2-30b6-427b-9d94-61ac4db51fe7','priority','100'),('083ff7a6-0a0c-4a74-9545-590c6850d213','97d21080-c565-4e67-8eb0-63ed0b83e6a8','keyUse','SIG'),('0d2bc60f-312e-4d3a-934b-2d44bd3f6c1b','97d21080-c565-4e67-8eb0-63ed0b83e6a8','priority','100'),('0de2b9da-f16d-4e7b-8768-60670f9d6942','41c61cc2-30b6-427b-9d94-61ac4db51fe7','kid','fe396228-c8e3-4c49-bbf1-2c74d05bf0ce'),('0fb67d37-712a-40f3-8eee-053579d2c86d','e4277b0d-a964-424e-bba9-281f63e74503','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),('1482ab57-1f4a-4be7-8328-ba2107385789','b7d2e7a8-4835-4010-836b-6845f629cb47','allowed-protocol-mapper-types','saml-user-property-mapper'),('1a8f7bf3-8e98-48b8-b174-2a22d5e4322a','ee3dfbbf-d25f-4102-8fba-ac405f5b3f14','priority','100'),('1ad44272-df08-437f-86c4-1b1a9a0836f7','ee3dfbbf-d25f-4102-8fba-ac405f5b3f14','secret','hqdmkhHW7aOm8wOhQ8VZ9g'),('1c89646d-66e4-4c06-8d6b-6ea48bc3c76a','dcf2bc3e-7609-4988-af09-90954fad7d6f','secret','g3M6wU9Bh6k0neLqttEcmKJwKLE1xgyX8-BqE7rsd3IM2zhOQ0O-yS9Re3uHvkG6vP7JlB2O7nrgGC3j_xVmpw'),('1d20bc38-507f-494c-b221-22409a39e96a','86f268c6-7ce8-4ea3-bb04-96f7db479559','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),('1d96d505-9b2e-4438-af64-32810d0c2a37','c2fe8e87-341a-4f10-b80c-6fff8cc6d871','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),('2456a7b1-71e4-43c9-884f-6c170627df61','41c61cc2-30b6-427b-9d94-61ac4db51fe7','secret','7aqLDYjiHHQWHjpj-Lj7rA'),('25c4b660-8166-494c-a83f-5e7c0296b378','c2fe8e87-341a-4f10-b80c-6fff8cc6d871','allowed-protocol-mapper-types','saml-role-list-mapper'),('2699bb85-b5d3-4263-9dec-d3b857c9388e','a2a6d57f-d0b1-4530-a085-9f068de73f1f','certificate','MIICmzCCAYMCBgGeV1HMVjANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjYwNTI0MDAwODU5WhcNMzYwNTI0MDAxMDM5WjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCg9910K96IXITVp+pBbc2/fpVUDn7EHV9xZq73xFuF+yvgZ+nMdBP8FVjtiH0DIr98Fz3h/cT1KLy8xffCPbohsIX1KbPGw2RMMsEIUcikNBhGQDo/RiyzVTvxjNLLqnmye1hyQHApXTqNcjc3ajhGMkRelwBJjN47wJsagrXb4RK/Ezyxk1Q8d8OD0YD1VXPi0G5k9ROu/fod2iVSi6ID4O2bP441IuJyhcCepLfkwZQi42EHSNRBY2DwMOJqJT3Lrnwx9jPjau/H9D8DJuYUfVmX6X18Tc87PHyFryJmMKPO3enp1WTIl9t+QPXvIPKRKP1+mnosuXzIJJ6MzSwvAgMBAAEwDQYJKoZIhvcNAQELBQADggEBACnpxfcE8uwMCg9usnw1JF2jN/P3e8R9APquD3T6fLBjJEVsgRKJ6D22ntnEyR36beEswKD4OZW6sKJCD8uEKfQLBbdIYYmXDhNftayoB598/NHgkmM9/GoTZ8B4CY2zwo6pV99eChIT8WYMzblcwgA5AhxiWSahnyok9HfAfFNznpEG+j2Ojp+FN1viOyELX9Y8erybPVDPTB91m6u5D1U9QGIRzhiT+qwqvQzrt6C/q2h2ChCFkTG/UJxOqo508wYWOl3d/KNUbasdVNMIrRX12adNSkI5Ui/Hsat+/iFm4DFu+c05Ew081Q98+Ug4oLAKzgW5lvvwdo+UENa6xw0='),('292ae5e9-f9ee-4257-a98b-447d8f58716e','e4277b0d-a964-424e-bba9-281f63e74503','allowed-protocol-mapper-types','saml-user-property-mapper'),('2c96bc95-8f3f-430e-9981-513a77016985','b7d2e7a8-4835-4010-836b-6845f629cb47','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),('2efd6003-463f-4e1f-87d7-57283c6b2156','eda7fab3-5be3-4582-b9d4-0f2f52490c90','allow-default-scopes','true'),('2f73de6c-bd63-492d-be71-d2e5b9367172','86f268c6-7ce8-4ea3-bb04-96f7db479559','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),('31c969b0-6ded-4d9b-be24-0feb454d8dee','e4277b0d-a964-424e-bba9-281f63e74503','allowed-protocol-mapper-types','oidc-address-mapper'),('34c5b1e7-e578-417c-9a7f-96700fb2f930','86f268c6-7ce8-4ea3-bb04-96f7db479559','allowed-protocol-mapper-types','saml-role-list-mapper'),('35e5e18c-9074-4ac5-879f-4743cf4ccfc0','bfadbbce-f6bf-4965-8adc-2a9e0bafeb0d','priority','100'),('39d44977-6567-4994-90c6-77601cd391b5','e4277b0d-a964-424e-bba9-281f63e74503','allowed-protocol-mapper-types','saml-role-list-mapper'),('3b14add2-0d18-4e3c-a190-4da98d25c073','60c688ad-f930-4a76-8ed9-4980bde82ffe','max-clients','200'),('40a0c0cf-96ae-4f02-844e-07e81c0756aa','e3df9c7a-1da6-494a-b9d4-3c9c4b5c4543','max-clients','200'),('41429287-eaf9-49cb-83d7-de14cae0fbe4','879c4e76-4b6e-492e-b72b-421b07200b0c','priority','100'),('41fa1510-7c80-4f5f-867c-8a66c30165c2','e4277b0d-a964-424e-bba9-281f63e74503','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),('4cfae653-fc5d-4563-b7a0-8799b044ab43','86f268c6-7ce8-4ea3-bb04-96f7db479559','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),('5514f7f9-f3e6-45c5-bb67-8aaea35e6542','86f268c6-7ce8-4ea3-bb04-96f7db479559','allowed-protocol-mapper-types','oidc-full-name-mapper'),('579c3118-de96-4d98-9ba4-5c24a8cb69e6','b7d2e7a8-4835-4010-836b-6845f629cb47','allowed-protocol-mapper-types','saml-user-attribute-mapper'),('5dff8315-bdbc-4dff-95b7-0a99bfed1e94','74cf604a-4a1c-4a26-afd8-893777b39895','priority','0'),('5ed4ac17-5c45-4d6a-858d-995e9a5e5f00','94c39978-19bd-4027-a16f-39364eb56e2f','certificate','MIICrTCCAZUCBgGeV1+dnjANBgkqhkiG9w0BAQsFADAaMRgwFgYDVQQDDA9vbmVzYWl0cGxhdGZvcm0wHhcNMjYwNTI0MDAyNDA0WhcNMzYwNTI0MDAyNTQ0WjAaMRgwFgYDVQQDDA9vbmVzYWl0cGxhdGZvcm0wggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDAosaZ8uTBBFguxUmppQYmPcmRGa71ykeXO6vkMjqPLJcmWHBv/AWm2EpnOS8NKncamzYLrO7M0y/BXr5fk605miVc16QTKQ4y9aq5L69SqpXdqWfrz83AXE10zwG0hR9LoQUZ6KtcQxQiMOm6m0S4ov9I9pJNgybbvMRMRSAKP9iXsx+bTuml7dKyMvgobQlOJJ4Ic0JzR/sS5qyYC0dPABULUSSFvFgf8D9fiWSAQMJwwmW4PHDduwhW0Mz/Mmk56d5WrtBVDSXlU3V3SapKPGnnRh4D3UJMwjFVLG0K3LBX6hp35Z5S1CKFGLAVwkW7jNwHnv16mkSSdNl8tHD5AgMBAAEwDQYJKoZIhvcNAQELBQADggEBAJ/dC/sQ/Hu+h3vm7a6XnmpQdW7SOBXbLlDhHkDyct7g4YjRUQ0Pyj4yNyHQy0qZ2kwAG0ly2FfqFmilek9wEUNVCUKvN5TqNQQPT29hUyLG8DJhNWht07APdWdvEjM3YJV/XxHySpeKmj/TMdsHPqStpZA3w3W6IpTYg1FI9PSzbOmk5cRRShXlNwTd9esaPdiIHtnrzbE6UczHqGpSwnUnf2hF0gtuVKMGIBFdh+NFq8Aec/FUiUzNwxk+ZwUScoW9FMYid3/FwzwoxBRukIb2GDXBgtWDFXhUc7B7j9RExiG6qkZBALww4y0f0+2d7YAQnWDThWJFSxvNrWCigq8='),('5fdabc49-8585-4961-8b54-d9e670a72e35','879c4e76-4b6e-492e-b72b-421b07200b0c','certificate','MIICmzCCAYMCBgGeV1HNIDANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjYwNTI0MDAwODU5WhcNMzYwNTI0MDAxMDM5WjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCau5R37F1zK37TAWHEueBAkT8GVKnFjysL2tLQZRBdrlP/4htuEOuHZ0sun+F0oFj8shl8jDqaBfXKx1ZLwSpNg7d92vhFm84WNDKrTCi3Ok8r89CRsCHLAUk7DRatAB3Gn4VP02l/cNwnE8G/A1m47IwyT2J0pzyCxMF5EEQgFr+LFL/mo+h3oXDbqe+5wHO26mPYn2BR3FiMG993WHoS0jJC7hOOlMfl2o/Z39EzCUuFL9mueYe1l8htKcCBh7x6rJKwvxUH6Fwh79mnUPoe5Sn3j27dKdUK2BugCq7RnZyJ7DEJOk4Y/Dh9CHyA/BtVamq5mR+FUfxmGqGx1FMNAgMBAAEwDQYJKoZIhvcNAQELBQADggEBAJB3kphp7dxBHo+1NT18BH2LP+OjCZ1E6JDt4lYOS1KzcmcX0ZzEBqPQB163CmneWweT9hzH6B0rn2J2IjMS/bp25cNHQM38sISzWfFfdYFKClL8FW4p8LcP/Qw2mYt9PBb9D64lHCD2GP1FX20pczt2hcoEElM1rbJwXtaLB+8u2+RPu/byTv1nfGkM96hDwVm0MwNgegW8zv+e+sV035CG4QgvjXKRvlAeO3DBC469CzDKP+JMYfFnBggWhfvYbv/KgP/MnB1KTivx2kk79mMJ9JCxHFePxnIMo+CFcJxe1wk5xMWBYZ43VKeEEEUwrTBn7oveCgv8iUf8Vk83yZM='),('66fc2fdb-2dac-46a4-b3e9-69df33e6d9a3','642359c8-e564-47bc-b36c-ce4cd4ee61cc','enabled','true'),('6706db16-7732-4947-80f7-59f546f3ff4e','c2fe8e87-341a-4f10-b80c-6fff8cc6d871','allowed-protocol-mapper-types','oidc-address-mapper'),('6d3e8161-dca0-4900-aac2-f305ad564a08','94c39978-19bd-4027-a16f-39364eb56e2f','algorithm','RSA-OAEP'),('74b27b88-7640-4a0c-8a2a-7becb76e2aaf','b7d2e7a8-4835-4010-836b-6845f629cb47','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),('76dd3f81-79c0-4a23-a11c-d31b1b4278d0','c2fe8e87-341a-4f10-b80c-6fff8cc6d871','allowed-protocol-mapper-types','oidc-full-name-mapper'),('773feec9-ac6b-4ed3-92a8-92f3fe818899','b7d2e7a8-4835-4010-836b-6845f629cb47','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),('77f2e34f-4636-4fab-92d6-4cbc29de7057','2e82a151-8e0b-4954-86e7-a17a1f61220f','host-sending-registration-request-must-match','true'),('7845e174-378d-48b0-85f1-6fb0f1715cc6','97d21080-c565-4e67-8eb0-63ed0b83e6a8','certificate','MIICrTCCAZUCBgGeV1+cujANBgkqhkiG9w0BAQsFADAaMRgwFgYDVQQDDA9vbmVzYWl0cGxhdGZvcm0wHhcNMjYwNTI0MDAyNDA0WhcNMzYwNTI0MDAyNTQ0WjAaMRgwFgYDVQQDDA9vbmVzYWl0cGxhdGZvcm0wggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQC/CY6IVmqb+CJz9Qn2OUHVcOvLoDvJEbZQkUTpfIpXbFKfgFP2mT+jVs84ZzWh0YNMmmF8wZKjUUyPiiPGvrmPVlrgjhSt93AQVT6mjJoQQAv65itKviXVhKAt5uymfJKaeOMDh40rvclCNMh2dBscfB8Qwdt0N8KEi7MKTThLDeLylxz9XnMJfhrvhJ6wiTOkZrvPORbLLbXVSlz5gWb+UGB033krVjpZlMRjliguBraJbwkmknPYSsCpNVIaanIzCNHD8Qeqbb4sdXGIbcPqNex9lIcqSPIkuL5AY6qmdCkB2kI7CBx5Ldml4sBcFxHtZCNTmfYprkpyIYUptmBrAgMBAAEwDQYJKoZIhvcNAQELBQADggEBAKUDtN9NKU7H5gkFvALNJdD0X0KvilVjVdtsHi4Z5vTEg5cuCjVkm/8z/f/XaTFvBX1EmVYR2Nztxbt4sDTMm2wSRD05EflKFtH5ULNeIVOaHZdana2KnLKVXPamCE2r+i8AlyZvMGs4MI7kp/c62R1uulNYPrDmp3VXnZteJ8ARoMlTA5Z7vFPE1DAWZ6/H/vGUZF8i8yTkvoEuUnqGOH1u4cnn8/aiIv6xTMUHNulxzlLEmi34dGzkachH55KF/e2BFNmbI7hjInScudxkP6+VWS1ahztXah+BrYamZ0kkQEeIJVMFSMHCTJedHW+Zp0mWMluocMjAQJXUt2kMO1k='),('7ef9296c-fb84-4588-8927-5fe8e663d6b9','86f268c6-7ce8-4ea3-bb04-96f7db479559','allowed-protocol-mapper-types','oidc-address-mapper'),('7f965a29-7e9d-4c73-b968-6c9d95b8edbf','86f268c6-7ce8-4ea3-bb04-96f7db479559','allowed-protocol-mapper-types','saml-user-attribute-mapper'),('801432b4-7262-4235-bacf-ffb42dd3e13f','ee3dfbbf-d25f-4102-8fba-ac405f5b3f14','kid','9c78f73c-ed71-43a5-b7cb-57c9c5801086'),('827f4765-1639-44fe-9162-1ed364bf40a3','a2a6d57f-d0b1-4530-a085-9f068de73f1f','privateKey','MIIEowIBAAKCAQEAoPfddCveiFyE1afqQW3Nv36VVA5+xB1fcWau98Rbhfsr4GfpzHQT/BVY7Yh9AyK/fBc94f3E9Si8vMX3wj26IbCF9SmzxsNkTDLBCFHIpDQYRkA6P0Yss1U78YzSy6p5sntYckBwKV06jXI3N2o4RjJEXpcASYzeO8CbGoK12+ESvxM8sZNUPHfDg9GA9VVz4tBuZPUTrv36HdolUouiA+Dtmz+ONSLicoXAnqS35MGUIuNhB0jUQWNg8DDiaiU9y658MfYz42rvx/Q/AybmFH1Zl+l9fE3POzx8ha8iZjCjzt3p6dVkyJfbfkD17yDykSj9fpp6LLl8yCSejM0sLwIDAQABAoIBABRJqTuvG8kMACH9m+TLNhdgmOmTOh71pMXiL0NDGFX2pj0OW8VNDAfFmQO3JCp1ArVdKIuHNH/BtqgEO4nbxc3hNcEElIgEsGt6KiImTKeFeVnBVpYK/i9MGtYC7b6Fqfj42tjrjjdobKzPLG5rkNQoGb3iQkMC4i+dwu7AcrNXo5w+VsX+DVphkEggkjQoMt3ZRwwHO56pPmZoknC5fZbUl2MKU4F+tZW+vaixFOL7Veq5ABzda+YTiQZGBBuXbAfaniPldYsyvafPUHrWlLHFew7ilYc5X3kyDPMmGyp+rxF2Jj9Gt8mSkqX+pebbTFgeWYxHYefsvehzXXIccUECgYEAzeWw0PXd45TGkCKOFGTkj5zOoOJcFFLA+O/i3DroN++LMKJA9QfmuCK8k5QZYCpZw5YeCBwZ8ATWcNUwCvljsEoh5rY0sAJKSPwgyUNncmSX1TQXW7RuLiLwWbLfREjUjvLPAWxpK5TWKOlm8pZ8t/Zr4Jqe33BK6V09Csj++rkCgYEAyCNVrqrSt61N8QDJnMQvtpa1KTVLB9sIp+5mlcpIWRXhA0aMGCDkq5lqG9OqCd9Xi+4fI23sypcRHmogYV7Le23BdSxNjsS6uJGnUTwerRMhPtS1HCVhtxUG5M0DvV4joFKJZoYx3LX6GPa/nEeezIlMnptOmOXhUO6lcSGXyicCgYBf/2O9SaU24rrhoPrVj2TxgI7mfCOqZhsK9e2z+NMkoU8oUb4vgIuV9rwtorNiHtzTUD6YUWHWgqro2L0ZoMVWAHpl8zYFikvQU52FuSOWNkiEY1EwtKNaZ3fgmoF2eO6B57uUUlOGulJPqOMS4A8uRnptsim4y8Zhn9NCIAyiIQKBgBqyS+2er7j8jxcEyd/1c3/hnoy+pSGJICB2doyojPoFJxyuvmVBjf8t2a+Yjmf+uMjbnJ+3PAzSFeB+u48BfBcczt94Z2gR6e5Qz4bQhC8GDDs7WGVGv0ASt/axOjx6YDo0iEt6vw/33kKSN4D7NL2H2waVJOjUUTfgfYUXvA2lAoGBAKeLus5ufx28X5XyhJFFHUZ6Ad/+mTOZenuix8qpvXTfL75pCMgwUSg75rCUSD1StYCMiggJZeyT2WllI5W7cQP0K74glojQJ9pVtazHCl9jTNjQpdgQ4cZVQBhYpfLKDxPFlcZlexg2MH67c5JM9ZaU4+zw+QJvgZb6Gv0+jxsy'),('85363227-e49d-4dc7-96ed-db87819215f8','2d73cd6c-a32f-4a47-9e1c-50d2b3c5ba13','client-uris-must-match','true'),('85f90cf1-119c-41d2-b04a-db16e7e6a7be','dcf2bc3e-7609-4988-af09-90954fad7d6f','priority','100'),('862499ef-6fef-4907-b656-2c7e304fbad5','879c4e76-4b6e-492e-b72b-421b07200b0c','keyUse','ENC'),('8f56d5bb-1240-445e-8b20-55aac4990846','c2fe8e87-341a-4f10-b80c-6fff8cc6d871','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),('93539182-6c42-470a-bf55-6ca1b270c62f','74cf604a-4a1c-4a26-afd8-893777b39895','cachePolicy','NO_CACHE'),('98e0ba53-9ec9-4c9e-903d-cc3c68f55546','94c39978-19bd-4027-a16f-39364eb56e2f','keyUse','ENC'),('9a956075-4fb4-4a3b-9bfa-5430a24eda5e','c2fe8e87-341a-4f10-b80c-6fff8cc6d871','allowed-protocol-mapper-types','saml-user-attribute-mapper'),('9f09c590-253f-4ede-b9d4-5e03fa4a1f90','b7d2e7a8-4835-4010-836b-6845f629cb47','allowed-protocol-mapper-types','oidc-address-mapper'),('a204f51d-0ffe-4845-8193-fd0697bf4e69','dcf2bc3e-7609-4988-af09-90954fad7d6f','kid','8fa39580-a831-474f-9e72-87f2ccd2ae01'),('a5217b71-9aa9-4f2d-9670-fe908cdf850c','94c39978-19bd-4027-a16f-39364eb56e2f','priority','100'),('ad047276-d825-489d-a178-adb72d7b065e','94c39978-19bd-4027-a16f-39364eb56e2f','privateKey','MIIEpAIBAAKCAQEAwKLGmfLkwQRYLsVJqaUGJj3JkRmu9cpHlzur5DI6jyyXJlhwb/wFpthKZzkvDSp3Gps2C6zuzNMvwV6+X5OtOZolXNekEykOMvWquS+vUqqV3aln68/NwFxNdM8BtIUfS6EFGeirXEMUIjDpuptEuKL/SPaSTYMm27zETEUgCj/Yl7Mfm07ppe3SsjL4KG0JTiSeCHNCc0f7EuasmAtHTwAVC1EkhbxYH/A/X4lkgEDCcMJluDxw3bsIVtDM/zJpOeneVq7QVQ0l5VN1d0mqSjxp50YeA91CTMIxVSxtCtywV+oad+WeUtQihRiwFcJFu4zcB579eppEknTZfLRw+QIDAQABAoIBAAvkIGlRZpCJoZ3lfMoVjz8eEkq8MKIohenOe6pe9WFwKbZqwCoRfxHRCSq9C2v/IpIIYbovxx/qq2h+3jaNKaTEIKlOAGlUX/WCV7MNv/9U22Ju+iTC05sbt4ZN3veTPh7Phj6Wr7lGxL/lkA/+VKwnF6Yb3mUdgvEOgnmIzNUFB30ObSLJZ3DNw25qJDTCXAuto/QoANCUVJ+gDwhEzcwRGScaNOtfAdGsQQYZWSJC8M9qiwtTRoVCPLvrXekWVGkewmhEtl6XXFN85JNXIZExeqgRtIaBZy2sbntfz4J1njZZRrFrIOWQ9uSODpo8ohkwXdxdVqr3IXfTsGOpzN8CgYEA5jlt42hj6JJaWG+dSIThM+1CxlvcMel/dvWNmAvgsIlLItRug82I8RTJ9KeIdkam/fBhBSAxWl0TZbkULLgM94tQhAQiX28f77ZzoFY9yCIRfQgbETIQ3RzxOlx8u2tr/47obrLVt+q86GcpxEnX6Pqehf1nG1+vSIFj7ojgFycCgYEA1jQBMmCCQtfToPnvOEx38bm/WK8Hc7mE21FKGsKIzxmPR9HeCeLjTzUJVCgk7BkiGadu/C00xIVaVsPTOlYg41YfYObeqjX2I67ob0POSThFAZfL/0u+birvzdHonyjYVShWv6Cfv2HNmmWBoFD6ko2U0rgJTpRtuciJfAgZSt8CgYEA3VqyUUf5Z4/v1b/bFfLNJMQmw9lmqYa7y4DlFx+0dYhL+b0OVSO1WzaFxvmdtzrPLLGGVwtQ6HU9RTziLOz5arlEPOpMsj2CE1T1b1/8HwTCk9jLTYk5tZ8yQM7UDs+GEz0wNd80pZTI9RrbiaMGOTdeW639CNDDE490qdBoxVkCgYA9zleiD5LGcrwPsM5DslzRlMUPc8F0tM0O80+slQEgsMFU+ctVku//xM/iRosQzNe4C0XM4cZeBhRhALQMGxn2Pr1jGnqZJmTVOvy6ThhRrDjNEt271kEmTKFRBAZZFlIFkFQnitNNR40pxaw3c+Y5Lz0H6C5XTCC1AJYbAcM6hQKBgQCh7RhIdNCoYFmBN6EttxsPvf6OrWOP6F3HRVCKJZuhecPY91pHiCreR5KPBcyr5nQfWyHAvlx5hNANY+leszmv03BiJxMFyjdfbxGsYy5HnfqVU9FaB3Yjh11Cf7sUwze36hChswhRjE4P89PevO6X7M8jXdHSVeJB6vUJBIUSwA=='),('b79eaea7-a0cb-4181-b5ac-fd08af34a3d9','97d21080-c565-4e67-8eb0-63ed0b83e6a8','privateKey','MIIEpAIBAAKCAQEAvwmOiFZqm/gic/UJ9jlB1XDry6A7yRG2UJFE6XyKV2xSn4BT9pk/o1bPOGc1odGDTJphfMGSo1FMj4ojxr65j1Za4I4UrfdwEFU+poyaEEAL+uYrSr4l1YSgLebspnySmnjjA4eNK73JQjTIdnQbHHwfEMHbdDfChIuzCk04Sw3i8pcc/V5zCX4a74SesIkzpGa7zzkWyy211Upc+YFm/lBgdN95K1Y6WZTEY5YoLga2iW8JJpJz2ErAqTVSGmpyMwjRw/EHqm2+LHVxiG3D6jXsfZSHKkjyJLi+QGOqpnQpAdpCOwgceS3ZpeLAXBcR7WQjU5n2Ka5KciGFKbZgawIDAQABAoIBAC7Lkv//lxbElf/sjrejN+amRgQ3qF1s+slKhGRjTunyTVznzOlziZyjt5fb5E3SqgR6LpYmPprF3+irUG8vKfocD5/A/fzNR0Sg9PtMJrMDVUvs1L72zAK8/ZWw4tg3XJv9L7KeIi0MTL/seQxXDYsRNnTe37hcrkfUhpNn7fmoLQlgEf2xDfHoC8lYSjMYiAingcUFbsYy+1zL3cdWPatKdSJa5/C5NI8cHWoUwmpZPDm5fDBxG98h0OJny+4LKXN3QT/jG08PMklmhS6nKNy6eTlmrH02lQ8tZVvQEJCa/pn+yO0h/7QFaPjMZOXAlPnjGnxxv/KBYHoiLKqsPt0CgYEA7WqKnOFEYoohaFeA2lmglKmwhQxLDVJHufwpb9lqJizQ16nEZXa8hB5EdDc1qlFteIfDRFfncjC53JLQ7Zl/z1VcQmjPENyLvsVPkLQMr61odX1RgBrhb6dQ0G66Lmawey/+NXFXlhwprdVIiFTsIlVHOGMTU/AWKLvy2+VhT6cCgYEAzf2nZISRWfTdhxvkfKEMkBD07Ol0KvNAzp5y/Jcj9GKqr+//bb8PI4BUAy3+I/wI+rpm43MzeR+LuVbABFDV+jQud1aIywkyRpRR6/ER3yUTmV48uvr5unuEWnXbthvgG83d4pQLzmbzAzw2dhcTKetu3qbhYUcvAu80hlicIZ0CgYEAmuDS9g6abvIPYyMaQtcPQ4wDRHhFibYwZmrSmU2qyqaXwujT3yD7T/Dy1SGjF62xDVz7jF0P9lVFGliIhUeKsjXMTuJSmnxViajsA8kBMaWdLHAJN9nRUOZEeQSS3mxNGr+vRSvgaGOM6QLnI1DLDoa1RFqVpD9OJVqezsavmacCgYAArP9alhDAAcykP9QtEH4xDs0u5ckqxueEhgKMj5Zfm99BeoEVBBZxoF8mL4Vw6sfAwtHJlzwo/pB/yCgTG4zIKFmqrI8AU4RltODb7EuJtt5sl2GNn3soQHV7sn1JCKhgjvlWX/P19mJ/tTfchVDbx1jyxAtjPU+LK+u5MRs6BQKBgQCWkWOaIDki/qQ6dDaLvWQn+KuiK/t/E9L2KSDQZc/OwEkQNfXYzwFIyevEzX+qm9oqi4V9Xxdx9gfnRNMHMCKkNJXMsIv7WbQU3v5QJ3Hm/NPQOTQjozRHFyWQXg5UDRDp+EurFqNl1y5mrLaYTA6FM9JBtfsVxGu5/eNIxeSLuw=='),('b911df00-9dcf-48a3-8d79-12f182e088c8','b7d2e7a8-4835-4010-836b-6845f629cb47','allowed-protocol-mapper-types','oidc-full-name-mapper'),('bdc37a46-5ad6-4d08-a9d2-dbcda02c1301','e4277b0d-a964-424e-bba9-281f63e74503','allowed-protocol-mapper-types','oidc-full-name-mapper'),('beebcf52-4e5a-423c-880b-f5290e04dcee','e4277b0d-a964-424e-bba9-281f63e74503','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),('c252cc23-fdf6-4b4e-87e6-aadb9c188ce6','bfadbbce-f6bf-4965-8adc-2a9e0bafeb0d','secret','mxXu2m4WSxSCHzAevTUzvCu8DbpSXjU_AC3wVU3KNi7ACOpKmnVJJdaq1IE4nJQeD6Kk1RQirQ2MK1NRcTy9xA'),('c700dda2-302d-4590-a4d8-ec92e999d290','dcf2bc3e-7609-4988-af09-90954fad7d6f','algorithm','HS256'),('ca0fec99-3d2a-42b3-8710-5540e823f6a3','bfadbbce-f6bf-4965-8adc-2a9e0bafeb0d','kid','2fa59d10-90ef-4119-a65f-ce7189c8bc1b'),('ce1c1f4c-51ff-4f9d-9872-adb7e6612785','d6f7beca-5db9-46c5-8394-f3976f0bbe18','allow-default-scopes','true'),('d104d404-2604-4cc7-98e4-f2f96ff07585','642359c8-e564-47bc-b36c-ce4cd4ee61cc','priority','0'),('d6c2508e-7a6a-4295-b912-03a79ebc967d','c2fe8e87-341a-4f10-b80c-6fff8cc6d871','allowed-protocol-mapper-types','saml-user-property-mapper'),('d7b0ebc2-f218-436c-bec2-550ac03a268d','879c4e76-4b6e-492e-b72b-421b07200b0c','privateKey','MIIEogIBAAKCAQEAmruUd+xdcyt+0wFhxLngQJE/BlSpxY8rC9rS0GUQXa5T/+IbbhDrh2dLLp/hdKBY/LIZfIw6mgX1ysdWS8EqTYO3fdr4RZvOFjQyq0wotzpPK/PQkbAhywFJOw0WrQAdxp+FT9Npf3DcJxPBvwNZuOyMMk9idKc8gsTBeRBEIBa/ixS/5qPod6Fw26nvucBztupj2J9gUdxYjBvfd1h6EtIyQu4TjpTH5dqP2d/RMwlLhS/ZrnmHtZfIbSnAgYe8eqySsL8VB+hcIe/Zp1D6HuUp949u3SnVCtgboAqu0Z2ciewxCTpOGPw4fQh8gPwbVWpquZkfhVH8ZhqhsdRTDQIDAQABAoIBAAwpcfDVIBPqgh7qrQ5t6mLuJ60t4A7lAxCno/SjpPGAFMki3V4S2rhmADegyHNGxofM0IpaE/cW6ywDlqmrUVG4vdDuHPU3sFn4GK10ddTPsqO1Qm+uZObpvyGdlJUyJ6T81S53ja4UfFwJRla8WC6GpTmvxKt/mOwnCT/57SjfvDl9TruIbv2QEY/oeNSLt7eoZwLC4sMDpMTvcVLdqkMV9r8GbF8ZX1mom6FthNNOEbn8OvqOXStoPnvlXm+ALJPxvdRrdwYLKP7VZlXs6MI84pQOx18BjR74ly+DusOctXEMMSY90O+ZFP+KxqUJraWMv9dY7rYR9YKArNdlrr8CgYEAzTolHUbIkoltL5TC7YQp12YiN/tRSZKgDHMkSLLO+gBxuezGD163zbBQ06AjZzc1Ubui9l2uuSB3XAMKSb30TLmThRfk03dIhsnJGl/jnO3gybImjhIxHJakK/GXsDVw8AnnWcNxJmPlpQS9XXafcICPRBUDVq8LbBi5SPqVpnMCgYEAwQNsSDUynq3zXEWqoYOC947bPQ9Y5ZwFc0WToEtXkqNMznZ8AH/8/kyiA8FHR/D/zI9U9qiVFMALcsK1K1zhAIrBHcpaaYNUVSqkV0M5UDaPO06tVOWYwbRvRGswGKBTWjRyfzQlFi09PoOgndHZIj5AxWnLwugEeGhwi4+eQH8CgYBMCDan2gmFAJULA7oT9NrrilMzGlDLSR8yfZX7uQMla/S2RRo7p4PBGIlZXgK/wpxmY3XEgICy5WxTEm1FVLKlmjslG+0SyyZ7iVaQBuZ0xUx6bR4LlIHNbaH1BdSE28ezpnensdjBuFDkChV+Auye6YIqXv6VptQ8gAxlFTFMMQKBgG0UsCeG2RrQmE63mJ07I9Mgy0qQ19679GCXG71llxJqc8fjMmVd7+8QBCg3HT/NNeO3xX64+7gEaPPsklL1ZLvXrxhU+g/Tht+y/7nJZiStEPmll1P5hgFDJfb21PG1+iVqqqK1J5iG7Kvd2/IVXK97m0N2bQ+z7ILYE3LsMbWlAoGAPj1vs4FUXWuZaDp5IisNJ2cQPdJhpeH/dhro42vusq2akRtHHj8ndGMFPZFut9SkqQriDvjunj3KuABDVilIhEKDgkaQbWy8nclpwEuTmpSyOnwdPloZgZnGiR5ReusVOgpvBrUaSz9rIn6ruQGruRMZm5/N5EPtZSFHHC016Ms='),('d7bc9984-4d2e-4b69-af30-4b820be584a6','642359c8-e564-47bc-b36c-ce4cd4ee61cc','cachePolicy','NO_CACHE'),('de627d0c-8115-4733-80f1-bfa026ea47ca','b7d2e7a8-4835-4010-836b-6845f629cb47','allowed-protocol-mapper-types','saml-role-list-mapper'),('e28e2b6f-4497-4dc5-a193-ee9f9a628295','c2fe8e87-341a-4f10-b80c-6fff8cc6d871','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),('e8b400c6-ad2c-489d-925d-6f25e590d076','2e82a151-8e0b-4954-86e7-a17a1f61220f','client-uris-must-match','true'),('ea0d0979-b632-4d7e-bc33-f77b691504d7','74cf604a-4a1c-4a26-afd8-893777b39895','enabled','true'),('ee69e1ec-c479-4a5f-936e-311a955936b4','86f268c6-7ce8-4ea3-bb04-96f7db479559','allowed-protocol-mapper-types','saml-user-property-mapper'),('f0064d92-ca4c-4fea-a831-f7defe7df460','a2a6d57f-d0b1-4530-a085-9f068de73f1f','keyUse','SIG'),('f1ebbc71-bdf3-4b32-aa94-93c02f3b544f','879c4e76-4b6e-492e-b72b-421b07200b0c','algorithm','RSA-OAEP'),('f4e9e0f1-6172-4090-84d4-ea21c6acc0fa','b2684d0f-7c42-4de0-8bab-d612c2519a3c','allow-default-scopes','true'),('f694273a-5a94-4518-808d-64fb8e22c89d','f1d94a30-59ba-4b13-b55a-4b150d0328e2','allow-default-scopes','true');
/*!40000 ALTER TABLE `component_config` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `composite_role` (
  `COMPOSITE` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CHILD_ROLE` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`COMPOSITE`,`CHILD_ROLE`),
  KEY `IDX_COMPOSITE` (`COMPOSITE`),
  KEY `IDX_COMPOSITE_CHILD` (`CHILD_ROLE`),
  CONSTRAINT `FK_A63WVEKFTU8JO1PNJ81E7MCE2` FOREIGN KEY (`COMPOSITE`) REFERENCES `keycloak_role` (`ID`),
  CONSTRAINT `FK_GR7THLLB9LU8Q4VQA4524JJY8` FOREIGN KEY (`CHILD_ROLE`) REFERENCES `keycloak_role` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `composite_role` WRITE;
/*!40000 ALTER TABLE `composite_role` DISABLE KEYS */;
INSERT INTO `composite_role` VALUES ('08d544b0-26fd-4121-9729-fcf3411256d8','aafd4b0e-baea-48bb-8451-90d194dc0527'),('13339287-c5ac-4e9c-8635-6fcbb1e2f47c','7afbffd8-c7d5-46d3-9477-38f43f8bf83f'),('13339287-c5ac-4e9c-8635-6fcbb1e2f47c','a494e787-27c6-4225-b89c-9c31fc4a0de1'),('5c937c71-2b05-4897-b21d-9e3a44ee3dcc','0a45458b-78a3-4883-bb5c-42d41ac7bb0f'),('5c937c71-2b05-4897-b21d-9e3a44ee3dcc','0aadec3a-4816-4cc9-99f0-5f4775712815'),('5c937c71-2b05-4897-b21d-9e3a44ee3dcc','1622c201-79ca-49c0-976c-42f5bce31ca1'),('5c937c71-2b05-4897-b21d-9e3a44ee3dcc','171822c0-4e48-4bfa-9ca0-cf5e4acfc47b'),('5c937c71-2b05-4897-b21d-9e3a44ee3dcc','1b28960f-d0f2-4214-b8c5-dd07b772a7aa'),('5c937c71-2b05-4897-b21d-9e3a44ee3dcc','2091f963-f219-409f-a429-ac81b9773b5d'),('5c937c71-2b05-4897-b21d-9e3a44ee3dcc','24402df3-a307-41fb-b79c-732e3281a455'),('5c937c71-2b05-4897-b21d-9e3a44ee3dcc','38d4b09d-e537-43c1-b47e-253ba9535d6d'),('5c937c71-2b05-4897-b21d-9e3a44ee3dcc','641c6200-1db7-4163-8dc0-5d51388e1503'),('5c937c71-2b05-4897-b21d-9e3a44ee3dcc','74aa1488-8217-42f4-a4cc-1e3631b6b6d1'),('5c937c71-2b05-4897-b21d-9e3a44ee3dcc','a3b48d44-79aa-4816-805c-0f7b368f181a'),('5c937c71-2b05-4897-b21d-9e3a44ee3dcc','b8130251-ecca-466f-8066-445c9e606319'),('5c937c71-2b05-4897-b21d-9e3a44ee3dcc','c54c2e61-a826-4c82-98c2-2527a4133876'),('5c937c71-2b05-4897-b21d-9e3a44ee3dcc','d9170cac-c860-4a2c-96d3-5ae19202e6be'),('5c937c71-2b05-4897-b21d-9e3a44ee3dcc','ed9c6525-62ba-4598-a263-d809ece9301f'),('5c937c71-2b05-4897-b21d-9e3a44ee3dcc','f1841492-7c83-416a-a28c-3b142f1e025c'),('5c937c71-2b05-4897-b21d-9e3a44ee3dcc','f86072ce-d3dc-4ae2-a661-e8eadce317a5'),('5c937c71-2b05-4897-b21d-9e3a44ee3dcc','fee2a4b2-650e-4f58-8efe-96ed811af9b6'),('7725b58d-d6cd-43e0-b7eb-1d3993349130','3b5f6cc1-2cc3-4b54-82dd-f59d0a3c64ec'),('891d2828-9171-45e0-bad1-1b5cc8ee7a95','5c937c71-2b05-4897-b21d-9e3a44ee3dcc'),('8e8e7784-c989-4920-964a-8ec1b2772990','9e828531-3ed8-402a-9932-f3bae826776f'),('8e8e7784-c989-4920-964a-8ec1b2772990','c9ccfe57-15a2-4ea4-b9e8-4273e10db418'),('904c919a-c118-4bbd-b636-88e1aea8177f','e5e05273-f065-4801-8b6a-e759dfd0ea25'),('9512e584-d929-4500-8422-c0b232706771','c78b8923-70a4-4be5-a3db-861fbe1135aa'),('acda57d8-1f55-49d6-a7e8-6373933279de','f3a33e39-11d5-4371-bfe1-9d56d909659a'),('b4e24d10-efa7-4a4b-945d-2bf38707849d','6eecb5a8-cc75-4995-913b-b9b6675c7c83'),('b8130251-ecca-466f-8066-445c9e606319','f1841492-7c83-416a-a28c-3b142f1e025c'),('d6794eeb-f793-41d9-9931-18d3646c446b','038b09df-74e2-4585-b60d-57ae083e5073'),('d6794eeb-f793-41d9-9931-18d3646c446b','122e4aed-e3c8-4c17-8cd2-74cd0601815c'),('d6794eeb-f793-41d9-9931-18d3646c446b','13339287-c5ac-4e9c-8635-6fcbb1e2f47c'),('d6794eeb-f793-41d9-9931-18d3646c446b','26a0333b-6f87-4ecb-aba4-b67239430ad6'),('d6794eeb-f793-41d9-9931-18d3646c446b','289c7e5d-c7bf-4b80-b84e-3c75c85f8e20'),('d6794eeb-f793-41d9-9931-18d3646c446b','2e8ef798-3672-4fcc-9216-9f302110754e'),('d6794eeb-f793-41d9-9931-18d3646c446b','36b9ad7a-3306-4e4e-8ada-43b265f67cf5'),('d6794eeb-f793-41d9-9931-18d3646c446b','3b5f6cc1-2cc3-4b54-82dd-f59d0a3c64ec'),('d6794eeb-f793-41d9-9931-18d3646c446b','40175bd8-21a1-487e-aa8f-d3dc0579b69a'),('d6794eeb-f793-41d9-9931-18d3646c446b','40b6e0e4-9860-4897-84f7-e20857dfa2a0'),('d6794eeb-f793-41d9-9931-18d3646c446b','528f306b-253d-4475-a904-666fc59cb132'),('d6794eeb-f793-41d9-9931-18d3646c446b','563df0bd-934b-4374-92f0-9e9f93fa4b81'),('d6794eeb-f793-41d9-9931-18d3646c446b','5a2bd4a5-3dba-4ee1-9e92-002e31c6b5f8'),('d6794eeb-f793-41d9-9931-18d3646c446b','64399c77-8f69-4dab-a8bc-f80841b45129'),('d6794eeb-f793-41d9-9931-18d3646c446b','654a352c-89ac-4e07-b993-781086430302'),('d6794eeb-f793-41d9-9931-18d3646c446b','70e210e9-39a8-49ae-a254-7bb82d3c9494'),('d6794eeb-f793-41d9-9931-18d3646c446b','7725b58d-d6cd-43e0-b7eb-1d3993349130'),('d6794eeb-f793-41d9-9931-18d3646c446b','7884f3e4-08da-49e2-916e-9a7f274482fd'),('d6794eeb-f793-41d9-9931-18d3646c446b','7afbffd8-c7d5-46d3-9477-38f43f8bf83f'),('d6794eeb-f793-41d9-9931-18d3646c446b','7ed1e5f0-84a6-4cf3-abc2-478dba5d699d'),('d6794eeb-f793-41d9-9931-18d3646c446b','801f7df6-0898-48f3-9c6e-c8b62ac1174c'),('d6794eeb-f793-41d9-9931-18d3646c446b','8252a2a8-e79f-42d9-ab3c-3120b24e063f'),('d6794eeb-f793-41d9-9931-18d3646c446b','86d00f11-77b7-439e-8718-edbd890d049b'),('d6794eeb-f793-41d9-9931-18d3646c446b','87bf9cfe-3375-45f0-8ce5-b567e2679244'),('d6794eeb-f793-41d9-9931-18d3646c446b','8a2d32f6-feec-49f1-a18a-578ebbcf9e08'),('d6794eeb-f793-41d9-9931-18d3646c446b','8b3afeb7-87e3-4269-a2d8-48447880e215'),('d6794eeb-f793-41d9-9931-18d3646c446b','8e8e7784-c989-4920-964a-8ec1b2772990'),('d6794eeb-f793-41d9-9931-18d3646c446b','90009c6b-c3e4-47b0-8ef4-065f421d42e5'),('d6794eeb-f793-41d9-9931-18d3646c446b','96113d3d-f9a8-4035-b727-2e661365cd9a'),('d6794eeb-f793-41d9-9931-18d3646c446b','9e828531-3ed8-402a-9932-f3bae826776f'),('d6794eeb-f793-41d9-9931-18d3646c446b','a494e787-27c6-4225-b89c-9c31fc4a0de1'),('d6794eeb-f793-41d9-9931-18d3646c446b','ab2d8f66-a112-430f-8f8b-cdd90e43d3de'),('d6794eeb-f793-41d9-9931-18d3646c446b','acda57d8-1f55-49d6-a7e8-6373933279de'),('d6794eeb-f793-41d9-9931-18d3646c446b','c9ccfe57-15a2-4ea4-b9e8-4273e10db418'),('d6794eeb-f793-41d9-9931-18d3646c446b','ed0dacfa-2a2e-4559-a305-76f669bf9f50'),('d6794eeb-f793-41d9-9931-18d3646c446b','ee7c87a4-a519-469b-bb5c-ca335d8ab689'),('d6794eeb-f793-41d9-9931-18d3646c446b','f3a33e39-11d5-4371-bfe1-9d56d909659a'),('f089468b-7691-4e64-a643-14e57176225f','5c937c71-2b05-4897-b21d-9e3a44ee3dcc'),('f8a482fb-98c7-4b2a-96a0-6a4d3fd643a3','7d4d7ebd-4af9-4a25-9150-74d0384a8572'),('f8a482fb-98c7-4b2a-96a0-6a4d3fd643a3','86850c2f-bb44-4bf8-ac3c-1c312577883e'),('f8a482fb-98c7-4b2a-96a0-6a4d3fd643a3','9512e584-d929-4500-8422-c0b232706771'),('f8a482fb-98c7-4b2a-96a0-6a4d3fd643a3','e00a45e0-5049-42dc-9aac-81a89d9e8531'),('fc0f07f5-a090-46ba-bdcf-33a84b0fb373','08ce1a04-6d11-409f-b2ce-f94e60af5af0'),('fc0f07f5-a090-46ba-bdcf-33a84b0fb373','08d544b0-26fd-4121-9729-fcf3411256d8'),('fc0f07f5-a090-46ba-bdcf-33a84b0fb373','20a5da22-d527-40f0-9109-a9e45514d115'),('fc0f07f5-a090-46ba-bdcf-33a84b0fb373','9fa0909e-0dd4-4ca0-9ba4-9e076bd075e7'),('fee2a4b2-650e-4f58-8efe-96ed811af9b6','2091f963-f219-409f-a429-ac81b9773b5d'),('fee2a4b2-650e-4f58-8efe-96ed811af9b6','a3b48d44-79aa-4816-805c-0f7b368f181a');
/*!40000 ALTER TABLE `composite_role` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `credential` (
  `ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `SALT` tinyblob DEFAULT NULL,
  `TYPE` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `USER_ID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CREATED_DATE` bigint(20) DEFAULT NULL,
  `USER_LABEL` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SECRET_DATA` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CREDENTIAL_DATA` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_USER_CREDENTIAL` (`USER_ID`),
  CONSTRAINT `FK_PFYR0GLASQYL0DEI3KL69R6V0` FOREIGN KEY (`USER_ID`) REFERENCES `user_entity` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `credential` WRITE;
/*!40000 ALTER TABLE `credential` DISABLE KEYS */;
INSERT INTO `credential` VALUES ('bf25e2fc-1fe8-491c-8b25-a6d8d4472372',NULL,'password','599dbd5a-9a92-47ab-89f9-4c8661b38e05',1779581439735,NULL,'{\"value\":\"QZIIZOIsu7NZ2I47+4+DbhmEdJ5NIaamq5zVff1n2jU=\",\"salt\":\"u2WSk7V10zB62gXMot3/Jw==\",\"additionalParameters\":{}}','{\"hashIterations\":27500,\"algorithm\":\"pbkdf2-sha256\",\"additionalParameters\":{}}',10);
/*!40000 ALTER TABLE `credential` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `databasechangelog` (
  `ID` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `AUTHOR` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `FILENAME` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `DATEEXECUTED` datetime NOT NULL,
  `ORDEREXECUTED` int(11) NOT NULL,
  `EXECTYPE` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `MD5SUM` varchar(35) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `COMMENTS` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TAG` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `LIQUIBASE` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CONTEXTS` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `LABELS` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DEPLOYMENT_ID` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `databasechangelog` WRITE;
/*!40000 ALTER TABLE `databasechangelog` DISABLE KEYS */;
INSERT INTO `databasechangelog` VALUES ('1.0.0.Final-KEYCLOAK-5461','sthorger@redhat.com','META-INF/jpa-changelog-1.0.0.Final.xml','2026-05-24 00:10:02',1,'EXECUTED','8:bda77d94bf90182a1e30c24f1c155ec7','createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...','',NULL,'4.16.1',NULL,NULL,'9581397399'),('1.0.0.Final-KEYCLOAK-5461','sthorger@redhat.com','META-INF/db2-jpa-changelog-1.0.0.Final.xml','2026-05-24 00:10:02',2,'MARK_RAN','8:1ecb330f30986693d1cba9ab579fa219','createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...','',NULL,'4.16.1',NULL,NULL,'9581397399'),('1.1.0.Beta1','sthorger@redhat.com','META-INF/jpa-changelog-1.1.0.Beta1.xml','2026-05-24 00:10:03',3,'EXECUTED','8:cb7ace19bc6d959f305605d255d4c843','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=CLIENT_ATTRIBUTES; createTable tableName=CLIENT_SESSION_NOTE; createTable tableName=APP_NODE_REGISTRATIONS; addColumn table...','',NULL,'4.16.1',NULL,NULL,'9581397399'),('1.1.0.Final','sthorger@redhat.com','META-INF/jpa-changelog-1.1.0.Final.xml','2026-05-24 00:10:03',4,'EXECUTED','8:80230013e961310e6872e871be424a63','renameColumn newColumnName=EVENT_TIME, oldColumnName=TIME, tableName=EVENT_ENTITY','',NULL,'4.16.1',NULL,NULL,'9581397399'),('1.2.0.Beta1','psilva@redhat.com','META-INF/jpa-changelog-1.2.0.Beta1.xml','2026-05-24 00:10:05',5,'EXECUTED','8:67f4c20929126adc0c8e9bf48279d244','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...','',NULL,'4.16.1',NULL,NULL,'9581397399'),('1.2.0.Beta1','psilva@redhat.com','META-INF/db2-jpa-changelog-1.2.0.Beta1.xml','2026-05-24 00:10:05',6,'MARK_RAN','8:7311018b0b8179ce14628ab412bb6783','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...','',NULL,'4.16.1',NULL,NULL,'9581397399'),('1.2.0.RC1','bburke@redhat.com','META-INF/jpa-changelog-1.2.0.CR1.xml','2026-05-24 00:10:07',7,'EXECUTED','8:037ba1216c3640f8785ee6b8e7c8e3c1','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...','',NULL,'4.16.1',NULL,NULL,'9581397399'),('1.2.0.RC1','bburke@redhat.com','META-INF/db2-jpa-changelog-1.2.0.CR1.xml','2026-05-24 00:10:07',8,'MARK_RAN','8:7fe6ffe4af4df289b3157de32c624263','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...','',NULL,'4.16.1',NULL,NULL,'9581397399'),('1.2.0.Final','keycloak','META-INF/jpa-changelog-1.2.0.Final.xml','2026-05-24 00:10:07',9,'EXECUTED','8:9c136bc3187083a98745c7d03bc8a303','update tableName=CLIENT; update tableName=CLIENT; update tableName=CLIENT','',NULL,'4.16.1',NULL,NULL,'9581397399'),('1.3.0','bburke@redhat.com','META-INF/jpa-changelog-1.3.0.xml','2026-05-24 00:10:12',10,'EXECUTED','8:b5f09474dca81fb56a97cf5b6553d331','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=ADMI...','',NULL,'4.16.1',NULL,NULL,'9581397399'),('1.4.0','bburke@redhat.com','META-INF/jpa-changelog-1.4.0.xml','2026-05-24 00:10:13',11,'EXECUTED','8:ca924f31bd2a3b219fdcfe78c82dacf4','delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...','',NULL,'4.16.1',NULL,NULL,'9581397399'),('1.4.0','bburke@redhat.com','META-INF/db2-jpa-changelog-1.4.0.xml','2026-05-24 00:10:13',12,'MARK_RAN','8:8acad7483e106416bcfa6f3b824a16cd','delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...','',NULL,'4.16.1',NULL,NULL,'9581397399'),('1.5.0','bburke@redhat.com','META-INF/jpa-changelog-1.5.0.xml','2026-05-24 00:10:13',13,'EXECUTED','8:9b1266d17f4f87c78226f5055408fd5e','delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...','',NULL,'4.16.1',NULL,NULL,'9581397399'),('1.6.1_from15','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2026-05-24 00:10:13',14,'EXECUTED','8:d80ec4ab6dbfe573550ff72396c7e910','addColumn tableName=REALM; addColumn tableName=KEYCLOAK_ROLE; addColumn tableName=CLIENT; createTable tableName=OFFLINE_USER_SESSION; createTable tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_US_SES_PK2, tableName=...','',NULL,'4.16.1',NULL,NULL,'9581397399'),('1.6.1_from16-pre','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2026-05-24 00:10:13',15,'MARK_RAN','8:d86eb172171e7c20b9c849b584d147b2','delete tableName=OFFLINE_CLIENT_SESSION; delete tableName=OFFLINE_USER_SESSION','',NULL,'4.16.1',NULL,NULL,'9581397399'),('1.6.1_from16','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2026-05-24 00:10:13',16,'MARK_RAN','8:5735f46f0fa60689deb0ecdc2a0dea22','dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_US_SES_PK, tableName=OFFLINE_USER_SESSION; dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_CL_SES_PK, tableName=OFFLINE_CLIENT_SESSION; addColumn tableName=OFFLINE_USER_SESSION; update tableName=OF...','',NULL,'4.16.1',NULL,NULL,'9581397399'),('1.6.1','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2026-05-24 00:10:13',17,'EXECUTED','8:d41d8cd98f00b204e9800998ecf8427e','empty','',NULL,'4.16.1',NULL,NULL,'9581397399'),('1.7.0','bburke@redhat.com','META-INF/jpa-changelog-1.7.0.xml','2026-05-24 00:10:15',18,'EXECUTED','8:5c1a8fd2014ac7fc43b90a700f117b23','createTable tableName=KEYCLOAK_GROUP; createTable tableName=GROUP_ROLE_MAPPING; createTable tableName=GROUP_ATTRIBUTE; createTable tableName=USER_GROUP_MEMBERSHIP; createTable tableName=REALM_DEFAULT_GROUPS; addColumn tableName=IDENTITY_PROVIDER; ...','',NULL,'4.16.1',NULL,NULL,'9581397399'),('1.8.0','mposolda@redhat.com','META-INF/jpa-changelog-1.8.0.xml','2026-05-24 00:10:16',19,'EXECUTED','8:1f6c2c2dfc362aff4ed75b3f0ef6b331','addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...','',NULL,'4.16.1',NULL,NULL,'9581397399'),('1.8.0-2','keycloak','META-INF/jpa-changelog-1.8.0.xml','2026-05-24 00:10:16',20,'EXECUTED','8:dee9246280915712591f83a127665107','dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL','',NULL,'4.16.1',NULL,NULL,'9581397399'),('1.8.0','mposolda@redhat.com','META-INF/db2-jpa-changelog-1.8.0.xml','2026-05-24 00:10:16',21,'MARK_RAN','8:9eb2ee1fa8ad1c5e426421a6f8fdfa6a','addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...','',NULL,'4.16.1',NULL,NULL,'9581397399'),('1.8.0-2','keycloak','META-INF/db2-jpa-changelog-1.8.0.xml','2026-05-24 00:10:16',22,'MARK_RAN','8:dee9246280915712591f83a127665107','dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL','',NULL,'4.16.1',NULL,NULL,'9581397399'),('1.9.0','mposolda@redhat.com','META-INF/jpa-changelog-1.9.0.xml','2026-05-24 00:10:16',23,'EXECUTED','8:d9fa18ffa355320395b86270680dd4fe','update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=REALM; update tableName=REALM; customChange; dr...','',NULL,'4.16.1',NULL,NULL,'9581397399'),('1.9.1','keycloak','META-INF/jpa-changelog-1.9.1.xml','2026-05-24 00:10:16',24,'EXECUTED','8:90cff506fedb06141ffc1c71c4a1214c','modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=PUBLIC_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM','',NULL,'4.16.1',NULL,NULL,'9581397399'),('1.9.1','keycloak','META-INF/db2-jpa-changelog-1.9.1.xml','2026-05-24 00:10:16',25,'MARK_RAN','8:11a788aed4961d6d29c427c063af828c','modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM','',NULL,'4.16.1',NULL,NULL,'9581397399'),('1.9.2','keycloak','META-INF/jpa-changelog-1.9.2.xml','2026-05-24 00:10:16',26,'EXECUTED','8:a4218e51e1faf380518cce2af5d39b43','createIndex indexName=IDX_USER_EMAIL, tableName=USER_ENTITY; createIndex indexName=IDX_USER_ROLE_MAPPING, tableName=USER_ROLE_MAPPING; createIndex indexName=IDX_USER_GROUP_MAPPING, tableName=USER_GROUP_MEMBERSHIP; createIndex indexName=IDX_USER_CO...','',NULL,'4.16.1',NULL,NULL,'9581397399'),('authz-2.0.0','psilva@redhat.com','META-INF/jpa-changelog-authz-2.0.0.xml','2026-05-24 00:10:18',27,'EXECUTED','8:d9e9a1bfaa644da9952456050f07bbdc','createTable tableName=RESOURCE_SERVER; addPrimaryKey constraintName=CONSTRAINT_FARS, tableName=RESOURCE_SERVER; addUniqueConstraint constraintName=UK_AU8TT6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER; createTable tableName=RESOURCE_SERVER_RESOU...','',NULL,'4.16.1',NULL,NULL,'9581397399'),('authz-2.5.1','psilva@redhat.com','META-INF/jpa-changelog-authz-2.5.1.xml','2026-05-24 00:10:18',28,'EXECUTED','8:d1bf991a6163c0acbfe664b615314505','update tableName=RESOURCE_SERVER_POLICY','',NULL,'4.16.1',NULL,NULL,'9581397399'),('2.1.0-KEYCLOAK-5461','bburke@redhat.com','META-INF/jpa-changelog-2.1.0.xml','2026-05-24 00:10:19',29,'EXECUTED','8:88a743a1e87ec5e30bf603da68058a8c','createTable tableName=BROKER_LINK; createTable tableName=FED_USER_ATTRIBUTE; createTable tableName=FED_USER_CONSENT; createTable tableName=FED_USER_CONSENT_ROLE; createTable tableName=FED_USER_CONSENT_PROT_MAPPER; createTable tableName=FED_USER_CR...','',NULL,'4.16.1',NULL,NULL,'9581397399'),('2.2.0','bburke@redhat.com','META-INF/jpa-changelog-2.2.0.xml','2026-05-24 00:10:20',30,'EXECUTED','8:c5517863c875d325dea463d00ec26d7a','addColumn tableName=ADMIN_EVENT_ENTITY; createTable tableName=CREDENTIAL_ATTRIBUTE; createTable tableName=FED_CREDENTIAL_ATTRIBUTE; modifyDataType columnName=VALUE, tableName=CREDENTIAL; addForeignKeyConstraint baseTableName=FED_CREDENTIAL_ATTRIBU...','',NULL,'4.16.1',NULL,NULL,'9581397399'),('2.3.0','bburke@redhat.com','META-INF/jpa-changelog-2.3.0.xml','2026-05-24 00:10:20',31,'EXECUTED','8:ada8b4833b74a498f376d7136bc7d327','createTable tableName=FEDERATED_USER; addPrimaryKey constraintName=CONSTR_FEDERATED_USER, tableName=FEDERATED_USER; dropDefaultValue columnName=TOTP, tableName=USER_ENTITY; dropColumn columnName=TOTP, tableName=USER_ENTITY; addColumn tableName=IDE...','',NULL,'4.16.1',NULL,NULL,'9581397399'),('2.4.0','bburke@redhat.com','META-INF/jpa-changelog-2.4.0.xml','2026-05-24 00:10:20',32,'EXECUTED','8:b9b73c8ea7299457f99fcbb825c263ba','customChange','',NULL,'4.16.1',NULL,NULL,'9581397399'),('2.5.0','bburke@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2026-05-24 00:10:21',33,'EXECUTED','8:07724333e625ccfcfc5adc63d57314f3','customChange; modifyDataType columnName=USER_ID, tableName=OFFLINE_USER_SESSION','',NULL,'4.16.1',NULL,NULL,'9581397399'),('2.5.0-unicode-oracle','hmlnarik@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2026-05-24 00:10:21',34,'MARK_RAN','8:8b6fd445958882efe55deb26fc541a7b','modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...','',NULL,'4.16.1',NULL,NULL,'9581397399'),('2.5.0-unicode-other-dbs','hmlnarik@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2026-05-24 00:10:22',35,'EXECUTED','8:29b29cfebfd12600897680147277a9d7','modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...','',NULL,'4.16.1',NULL,NULL,'9581397399'),('2.5.0-duplicate-email-support','slawomir@dabek.name','META-INF/jpa-changelog-2.5.0.xml','2026-05-24 00:10:22',36,'EXECUTED','8:73ad77ca8fd0410c7f9f15a471fa52bc','addColumn tableName=REALM','',NULL,'4.16.1',NULL,NULL,'9581397399'),('2.5.0-unique-group-names','hmlnarik@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2026-05-24 00:10:22',37,'EXECUTED','8:64f27a6fdcad57f6f9153210f2ec1bdb','addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP','',NULL,'4.16.1',NULL,NULL,'9581397399'),('2.5.1','bburke@redhat.com','META-INF/jpa-changelog-2.5.1.xml','2026-05-24 00:10:22',38,'EXECUTED','8:27180251182e6c31846c2ddab4bc5781','addColumn tableName=FED_USER_CONSENT','',NULL,'4.16.1',NULL,NULL,'9581397399'),('3.0.0','bburke@redhat.com','META-INF/jpa-changelog-3.0.0.xml','2026-05-24 00:10:22',39,'EXECUTED','8:d56f201bfcfa7a1413eb3e9bc02978f9','addColumn tableName=IDENTITY_PROVIDER','',NULL,'4.16.1',NULL,NULL,'9581397399'),('3.2.0-fix','keycloak','META-INF/jpa-changelog-3.2.0.xml','2026-05-24 00:10:22',40,'MARK_RAN','8:91f5522bf6afdc2077dfab57fbd3455c','addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS','',NULL,'4.16.1',NULL,NULL,'9581397399'),('3.2.0-fix-with-keycloak-5416','keycloak','META-INF/jpa-changelog-3.2.0.xml','2026-05-24 00:10:22',41,'MARK_RAN','8:0f01b554f256c22caeb7d8aee3a1cdc8','dropIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS; addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS; createIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS','',NULL,'4.16.1',NULL,NULL,'9581397399'),('3.2.0-fix-offline-sessions','hmlnarik','META-INF/jpa-changelog-3.2.0.xml','2026-05-24 00:10:22',42,'EXECUTED','8:ab91cf9cee415867ade0e2df9651a947','customChange','',NULL,'4.16.1',NULL,NULL,'9581397399'),('3.2.0-fixed','keycloak','META-INF/jpa-changelog-3.2.0.xml','2026-05-24 00:10:24',43,'EXECUTED','8:ceac9b1889e97d602caf373eadb0d4b7','addColumn tableName=REALM; dropPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_PK2, tableName=OFFLINE_CLIENT_SESSION; dropColumn columnName=CLIENT_SESSION_ID, tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_P...','',NULL,'4.16.1',NULL,NULL,'9581397399'),('3.3.0','keycloak','META-INF/jpa-changelog-3.3.0.xml','2026-05-24 00:10:24',44,'EXECUTED','8:84b986e628fe8f7fd8fd3c275c5259f2','addColumn tableName=USER_ENTITY','',NULL,'4.16.1',NULL,NULL,'9581397399'),('authz-3.4.0.CR1-resource-server-pk-change-part1','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2026-05-24 00:10:24',45,'EXECUTED','8:a164ae073c56ffdbc98a615493609a52','addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_RESOURCE; addColumn tableName=RESOURCE_SERVER_SCOPE','',NULL,'4.16.1',NULL,NULL,'9581397399'),('authz-3.4.0.CR1-resource-server-pk-change-part2-KEYCLOAK-6095','hmlnarik@redhat.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2026-05-24 00:10:24',46,'EXECUTED','8:70a2b4f1f4bd4dbf487114bdb1810e64','customChange','',NULL,'4.16.1',NULL,NULL,'9581397399'),('authz-3.4.0.CR1-resource-server-pk-change-part3-fixed','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2026-05-24 00:10:24',47,'MARK_RAN','8:7be68b71d2f5b94b8df2e824f2860fa2','dropIndex indexName=IDX_RES_SERV_POL_RES_SERV, tableName=RESOURCE_SERVER_POLICY; dropIndex indexName=IDX_RES_SRV_RES_RES_SRV, tableName=RESOURCE_SERVER_RESOURCE; dropIndex indexName=IDX_RES_SRV_SCOPE_RES_SRV, tableName=RESOURCE_SERVER_SCOPE','',NULL,'4.16.1',NULL,NULL,'9581397399'),('authz-3.4.0.CR1-resource-server-pk-change-part3-fixed-nodropindex','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2026-05-24 00:10:26',48,'EXECUTED','8:bab7c631093c3861d6cf6144cd944982','addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_POLICY; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_RESOURCE; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, ...','',NULL,'4.16.1',NULL,NULL,'9581397399'),('authn-3.4.0.CR1-refresh-token-max-reuse','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2026-05-24 00:10:26',49,'EXECUTED','8:fa809ac11877d74d76fe40869916daad','addColumn tableName=REALM','',NULL,'4.16.1',NULL,NULL,'9581397399'),('3.4.0','keycloak','META-INF/jpa-changelog-3.4.0.xml','2026-05-24 00:10:27',50,'EXECUTED','8:fac23540a40208f5f5e326f6ceb4d291','addPrimaryKey constraintName=CONSTRAINT_REALM_DEFAULT_ROLES, tableName=REALM_DEFAULT_ROLES; addPrimaryKey constraintName=CONSTRAINT_COMPOSITE_ROLE, tableName=COMPOSITE_ROLE; addPrimaryKey constraintName=CONSTR_REALM_DEFAULT_GROUPS, tableName=REALM...','',NULL,'4.16.1',NULL,NULL,'9581397399'),('3.4.0-KEYCLOAK-5230','hmlnarik@redhat.com','META-INF/jpa-changelog-3.4.0.xml','2026-05-24 00:10:27',51,'EXECUTED','8:2612d1b8a97e2b5588c346e817307593','createIndex indexName=IDX_FU_ATTRIBUTE, tableName=FED_USER_ATTRIBUTE; createIndex indexName=IDX_FU_CONSENT, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CONSENT_RU, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CREDENTIAL, t...','',NULL,'4.16.1',NULL,NULL,'9581397399'),('3.4.1','psilva@redhat.com','META-INF/jpa-changelog-3.4.1.xml','2026-05-24 00:10:27',52,'EXECUTED','8:9842f155c5db2206c88bcb5d1046e941','modifyDataType columnName=VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'4.16.1',NULL,NULL,'9581397399'),('3.4.2','keycloak','META-INF/jpa-changelog-3.4.2.xml','2026-05-24 00:10:27',53,'EXECUTED','8:2e12e06e45498406db72d5b3da5bbc76','update tableName=REALM','',NULL,'4.16.1',NULL,NULL,'9581397399'),('3.4.2-KEYCLOAK-5172','mkanis@redhat.com','META-INF/jpa-changelog-3.4.2.xml','2026-05-24 00:10:27',54,'EXECUTED','8:33560e7c7989250c40da3abdabdc75a4','update tableName=CLIENT','',NULL,'4.16.1',NULL,NULL,'9581397399'),('4.0.0-KEYCLOAK-6335','bburke@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2026-05-24 00:10:27',55,'EXECUTED','8:87a8d8542046817a9107c7eb9cbad1cd','createTable tableName=CLIENT_AUTH_FLOW_BINDINGS; addPrimaryKey constraintName=C_CLI_FLOW_BIND, tableName=CLIENT_AUTH_FLOW_BINDINGS','',NULL,'4.16.1',NULL,NULL,'9581397399'),('4.0.0-CLEANUP-UNUSED-TABLE','bburke@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2026-05-24 00:10:27',56,'EXECUTED','8:3ea08490a70215ed0088c273d776311e','dropTable tableName=CLIENT_IDENTITY_PROV_MAPPING','',NULL,'4.16.1',NULL,NULL,'9581397399'),('4.0.0-KEYCLOAK-6228','bburke@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2026-05-24 00:10:28',57,'EXECUTED','8:2d56697c8723d4592ab608ce14b6ed68','dropUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHOGM8UEWRT, tableName=USER_CONSENT; dropNotNullConstraint columnName=CLIENT_ID, tableName=USER_CONSENT; addColumn tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHO...','',NULL,'4.16.1',NULL,NULL,'9581397399'),('4.0.0-KEYCLOAK-5579-fixed','mposolda@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2026-05-24 00:10:31',58,'EXECUTED','8:3e423e249f6068ea2bbe48bf907f9d86','dropForeignKeyConstraint baseTableName=CLIENT_TEMPLATE_ATTRIBUTES, constraintName=FK_CL_TEMPL_ATTR_TEMPL; renameTable newTableName=CLIENT_SCOPE_ATTRIBUTES, oldTableName=CLIENT_TEMPLATE_ATTRIBUTES; renameColumn newColumnName=SCOPE_ID, oldColumnName...','',NULL,'4.16.1',NULL,NULL,'9581397399'),('authz-4.0.0.CR1','psilva@redhat.com','META-INF/jpa-changelog-authz-4.0.0.CR1.xml','2026-05-24 00:10:31',59,'EXECUTED','8:15cabee5e5df0ff099510a0fc03e4103','createTable tableName=RESOURCE_SERVER_PERM_TICKET; addPrimaryKey constraintName=CONSTRAINT_FAPMT, tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRHO213XCX4WNKOG82SSPMT...','',NULL,'4.16.1',NULL,NULL,'9581397399'),('authz-4.0.0.Beta3','psilva@redhat.com','META-INF/jpa-changelog-authz-4.0.0.Beta3.xml','2026-05-24 00:10:32',60,'EXECUTED','8:4b80200af916ac54d2ffbfc47918ab0e','addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRPO2128CX4WNKOG82SSRFY, referencedTableName=RESOURCE_SERVER_POLICY','',NULL,'4.16.1',NULL,NULL,'9581397399'),('authz-4.2.0.Final','mhajas@redhat.com','META-INF/jpa-changelog-authz-4.2.0.Final.xml','2026-05-24 00:10:32',61,'EXECUTED','8:66564cd5e168045d52252c5027485bbb','createTable tableName=RESOURCE_URIS; addForeignKeyConstraint baseTableName=RESOURCE_URIS, constraintName=FK_RESOURCE_SERVER_URIS, referencedTableName=RESOURCE_SERVER_RESOURCE; customChange; dropColumn columnName=URI, tableName=RESOURCE_SERVER_RESO...','',NULL,'4.16.1',NULL,NULL,'9581397399'),('authz-4.2.0.Final-KEYCLOAK-9944','hmlnarik@redhat.com','META-INF/jpa-changelog-authz-4.2.0.Final.xml','2026-05-24 00:10:32',62,'EXECUTED','8:1c7064fafb030222be2bd16ccf690f6f','addPrimaryKey constraintName=CONSTRAINT_RESOUR_URIS_PK, tableName=RESOURCE_URIS','',NULL,'4.16.1',NULL,NULL,'9581397399'),('4.2.0-KEYCLOAK-6313','wadahiro@gmail.com','META-INF/jpa-changelog-4.2.0.xml','2026-05-24 00:10:32',63,'EXECUTED','8:2de18a0dce10cdda5c7e65c9b719b6e5','addColumn tableName=REQUIRED_ACTION_PROVIDER','',NULL,'4.16.1',NULL,NULL,'9581397399'),('4.3.0-KEYCLOAK-7984','wadahiro@gmail.com','META-INF/jpa-changelog-4.3.0.xml','2026-05-24 00:10:32',64,'EXECUTED','8:03e413dd182dcbd5c57e41c34d0ef682','update tableName=REQUIRED_ACTION_PROVIDER','',NULL,'4.16.1',NULL,NULL,'9581397399'),('4.6.0-KEYCLOAK-7950','psilva@redhat.com','META-INF/jpa-changelog-4.6.0.xml','2026-05-24 00:10:32',65,'EXECUTED','8:d27b42bb2571c18fbe3fe4e4fb7582a7','update tableName=RESOURCE_SERVER_RESOURCE','',NULL,'4.16.1',NULL,NULL,'9581397399'),('4.6.0-KEYCLOAK-8377','keycloak','META-INF/jpa-changelog-4.6.0.xml','2026-05-24 00:10:32',66,'EXECUTED','8:698baf84d9fd0027e9192717c2154fb8','createTable tableName=ROLE_ATTRIBUTE; addPrimaryKey constraintName=CONSTRAINT_ROLE_ATTRIBUTE_PK, tableName=ROLE_ATTRIBUTE; addForeignKeyConstraint baseTableName=ROLE_ATTRIBUTE, constraintName=FK_ROLE_ATTRIBUTE_ID, referencedTableName=KEYCLOAK_ROLE...','',NULL,'4.16.1',NULL,NULL,'9581397399'),('4.6.0-KEYCLOAK-8555','gideonray@gmail.com','META-INF/jpa-changelog-4.6.0.xml','2026-05-24 00:10:32',67,'EXECUTED','8:ced8822edf0f75ef26eb51582f9a821a','createIndex indexName=IDX_COMPONENT_PROVIDER_TYPE, tableName=COMPONENT','',NULL,'4.16.1',NULL,NULL,'9581397399'),('4.7.0-KEYCLOAK-1267','sguilhen@redhat.com','META-INF/jpa-changelog-4.7.0.xml','2026-05-24 00:10:32',68,'EXECUTED','8:f0abba004cf429e8afc43056df06487d','addColumn tableName=REALM','',NULL,'4.16.1',NULL,NULL,'9581397399'),('4.7.0-KEYCLOAK-7275','keycloak','META-INF/jpa-changelog-4.7.0.xml','2026-05-24 00:10:32',69,'EXECUTED','8:6662f8b0b611caa359fcf13bf63b4e24','renameColumn newColumnName=CREATED_ON, oldColumnName=LAST_SESSION_REFRESH, tableName=OFFLINE_USER_SESSION; addNotNullConstraint columnName=CREATED_ON, tableName=OFFLINE_USER_SESSION; addColumn tableName=OFFLINE_USER_SESSION; customChange; createIn...','',NULL,'4.16.1',NULL,NULL,'9581397399'),('4.8.0-KEYCLOAK-8835','sguilhen@redhat.com','META-INF/jpa-changelog-4.8.0.xml','2026-05-24 00:10:32',70,'EXECUTED','8:9e6b8009560f684250bdbdf97670d39e','addNotNullConstraint columnName=SSO_MAX_LIFESPAN_REMEMBER_ME, tableName=REALM; addNotNullConstraint columnName=SSO_IDLE_TIMEOUT_REMEMBER_ME, tableName=REALM','',NULL,'4.16.1',NULL,NULL,'9581397399'),('authz-7.0.0-KEYCLOAK-10443','psilva@redhat.com','META-INF/jpa-changelog-authz-7.0.0.xml','2026-05-24 00:10:32',71,'EXECUTED','8:4223f561f3b8dc655846562b57bb502e','addColumn tableName=RESOURCE_SERVER','',NULL,'4.16.1',NULL,NULL,'9581397399'),('8.0.0-adding-credential-columns','keycloak','META-INF/jpa-changelog-8.0.0.xml','2026-05-24 00:10:32',72,'EXECUTED','8:215a31c398b363ce383a2b301202f29e','addColumn tableName=CREDENTIAL; addColumn tableName=FED_USER_CREDENTIAL','',NULL,'4.16.1',NULL,NULL,'9581397399'),('8.0.0-updating-credential-data-not-oracle-fixed','keycloak','META-INF/jpa-changelog-8.0.0.xml','2026-05-24 00:10:32',73,'EXECUTED','8:83f7a671792ca98b3cbd3a1a34862d3d','update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL','',NULL,'4.16.1',NULL,NULL,'9581397399'),('8.0.0-updating-credential-data-oracle-fixed','keycloak','META-INF/jpa-changelog-8.0.0.xml','2026-05-24 00:10:32',74,'MARK_RAN','8:f58ad148698cf30707a6efbdf8061aa7','update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL','',NULL,'4.16.1',NULL,NULL,'9581397399'),('8.0.0-credential-cleanup-fixed','keycloak','META-INF/jpa-changelog-8.0.0.xml','2026-05-24 00:10:33',75,'EXECUTED','8:79e4fd6c6442980e58d52ffc3ee7b19c','dropDefaultValue columnName=COUNTER, tableName=CREDENTIAL; dropDefaultValue columnName=DIGITS, tableName=CREDENTIAL; dropDefaultValue columnName=PERIOD, tableName=CREDENTIAL; dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; dropColumn ...','',NULL,'4.16.1',NULL,NULL,'9581397399'),('8.0.0-resource-tag-support','keycloak','META-INF/jpa-changelog-8.0.0.xml','2026-05-24 00:10:33',76,'EXECUTED','8:87af6a1e6d241ca4b15801d1f86a297d','addColumn tableName=MIGRATION_MODEL; createIndex indexName=IDX_UPDATE_TIME, tableName=MIGRATION_MODEL','',NULL,'4.16.1',NULL,NULL,'9581397399'),('9.0.0-always-display-client','keycloak','META-INF/jpa-changelog-9.0.0.xml','2026-05-24 00:10:33',77,'EXECUTED','8:b44f8d9b7b6ea455305a6d72a200ed15','addColumn tableName=CLIENT','',NULL,'4.16.1',NULL,NULL,'9581397399'),('9.0.0-drop-constraints-for-column-increase','keycloak','META-INF/jpa-changelog-9.0.0.xml','2026-05-24 00:10:33',78,'MARK_RAN','8:2d8ed5aaaeffd0cb004c046b4a903ac5','dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5PMT, tableName=RESOURCE_SERVER_PERM_TICKET; dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER_RESOURCE; dropPrimaryKey constraintName=CONSTRAINT_O...','',NULL,'4.16.1',NULL,NULL,'9581397399'),('9.0.0-increase-column-size-federated-fk','keycloak','META-INF/jpa-changelog-9.0.0.xml','2026-05-24 00:10:35',79,'EXECUTED','8:e290c01fcbc275326c511633f6e2acde','modifyDataType columnName=CLIENT_ID, tableName=FED_USER_CONSENT; modifyDataType columnName=CLIENT_REALM_CONSTRAINT, tableName=KEYCLOAK_ROLE; modifyDataType columnName=OWNER, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=CLIENT_ID, ta...','',NULL,'4.16.1',NULL,NULL,'9581397399'),('9.0.0-recreate-constraints-after-column-increase','keycloak','META-INF/jpa-changelog-9.0.0.xml','2026-05-24 00:10:35',80,'MARK_RAN','8:c9db8784c33cea210872ac2d805439f8','addNotNullConstraint columnName=CLIENT_ID, tableName=OFFLINE_CLIENT_SESSION; addNotNullConstraint columnName=OWNER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNullConstraint columnName=REQUESTER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNull...','',NULL,'4.16.1',NULL,NULL,'9581397399'),('9.0.1-add-index-to-client.client_id','keycloak','META-INF/jpa-changelog-9.0.1.xml','2026-05-24 00:10:35',81,'EXECUTED','8:95b676ce8fc546a1fcfb4c92fae4add5','createIndex indexName=IDX_CLIENT_ID, tableName=CLIENT','',NULL,'4.16.1',NULL,NULL,'9581397399'),('9.0.1-KEYCLOAK-12579-drop-constraints','keycloak','META-INF/jpa-changelog-9.0.1.xml','2026-05-24 00:10:35',82,'MARK_RAN','8:38a6b2a41f5651018b1aca93a41401e5','dropUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP','',NULL,'4.16.1',NULL,NULL,'9581397399'),('9.0.1-KEYCLOAK-12579-add-not-null-constraint','keycloak','META-INF/jpa-changelog-9.0.1.xml','2026-05-24 00:10:35',83,'EXECUTED','8:3fb99bcad86a0229783123ac52f7609c','addNotNullConstraint columnName=PARENT_GROUP, tableName=KEYCLOAK_GROUP','',NULL,'4.16.1',NULL,NULL,'9581397399'),('9.0.1-KEYCLOAK-12579-recreate-constraints','keycloak','META-INF/jpa-changelog-9.0.1.xml','2026-05-24 00:10:35',84,'MARK_RAN','8:64f27a6fdcad57f6f9153210f2ec1bdb','addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP','',NULL,'4.16.1',NULL,NULL,'9581397399'),('9.0.1-add-index-to-events','keycloak','META-INF/jpa-changelog-9.0.1.xml','2026-05-24 00:10:35',85,'EXECUTED','8:ab4f863f39adafd4c862f7ec01890abc','createIndex indexName=IDX_EVENT_TIME, tableName=EVENT_ENTITY','',NULL,'4.16.1',NULL,NULL,'9581397399'),('map-remove-ri','keycloak','META-INF/jpa-changelog-11.0.0.xml','2026-05-24 00:10:35',86,'EXECUTED','8:13c419a0eb336e91ee3a3bf8fda6e2a7','dropForeignKeyConstraint baseTableName=REALM, constraintName=FK_TRAF444KK6QRKMS7N56AIWQ5Y; dropForeignKeyConstraint baseTableName=KEYCLOAK_ROLE, constraintName=FK_KJHO5LE2C0RAL09FL8CM9WFW9','',NULL,'4.16.1',NULL,NULL,'9581397399'),('map-remove-ri','keycloak','META-INF/jpa-changelog-12.0.0.xml','2026-05-24 00:10:35',87,'EXECUTED','8:e3fb1e698e0471487f51af1ed80fe3ac','dropForeignKeyConstraint baseTableName=REALM_DEFAULT_GROUPS, constraintName=FK_DEF_GROUPS_GROUP; dropForeignKeyConstraint baseTableName=REALM_DEFAULT_ROLES, constraintName=FK_H4WPD7W4HSOOLNI3H0SW7BTJE; dropForeignKeyConstraint baseTableName=CLIENT...','',NULL,'4.16.1',NULL,NULL,'9581397399'),('12.1.0-add-realm-localization-table','keycloak','META-INF/jpa-changelog-12.0.0.xml','2026-05-24 00:10:35',88,'EXECUTED','8:babadb686aab7b56562817e60bf0abd0','createTable tableName=REALM_LOCALIZATIONS; addPrimaryKey tableName=REALM_LOCALIZATIONS','',NULL,'4.16.1',NULL,NULL,'9581397399'),('default-roles','keycloak','META-INF/jpa-changelog-13.0.0.xml','2026-05-24 00:10:35',89,'EXECUTED','8:72d03345fda8e2f17093d08801947773','addColumn tableName=REALM; customChange','',NULL,'4.16.1',NULL,NULL,'9581397399'),('default-roles-cleanup','keycloak','META-INF/jpa-changelog-13.0.0.xml','2026-05-24 00:10:35',90,'EXECUTED','8:61c9233951bd96ffecd9ba75f7d978a4','dropTable tableName=REALM_DEFAULT_ROLES; dropTable tableName=CLIENT_DEFAULT_ROLES','',NULL,'4.16.1',NULL,NULL,'9581397399'),('13.0.0-KEYCLOAK-16844','keycloak','META-INF/jpa-changelog-13.0.0.xml','2026-05-24 00:10:35',91,'EXECUTED','8:ea82e6ad945cec250af6372767b25525','createIndex indexName=IDX_OFFLINE_USS_PRELOAD, tableName=OFFLINE_USER_SESSION','',NULL,'4.16.1',NULL,NULL,'9581397399'),('map-remove-ri-13.0.0','keycloak','META-INF/jpa-changelog-13.0.0.xml','2026-05-24 00:10:35',92,'EXECUTED','8:d3f4a33f41d960ddacd7e2ef30d126b3','dropForeignKeyConstraint baseTableName=DEFAULT_CLIENT_SCOPE, constraintName=FK_R_DEF_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SCOPE_CLIENT, constraintName=FK_C_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SC...','',NULL,'4.16.1',NULL,NULL,'9581397399'),('13.0.0-KEYCLOAK-17992-drop-constraints','keycloak','META-INF/jpa-changelog-13.0.0.xml','2026-05-24 00:10:35',93,'MARK_RAN','8:1284a27fbd049d65831cb6fc07c8a783','dropPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CLSCOPE_CL, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CL_CLSCOPE, tableName=CLIENT_SCOPE_CLIENT','',NULL,'4.16.1',NULL,NULL,'9581397399'),('13.0.0-increase-column-size-federated','keycloak','META-INF/jpa-changelog-13.0.0.xml','2026-05-24 00:10:36',94,'EXECUTED','8:9d11b619db2ae27c25853b8a37cd0dea','modifyDataType columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; modifyDataType columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT','',NULL,'4.16.1',NULL,NULL,'9581397399'),('13.0.0-KEYCLOAK-17992-recreate-constraints','keycloak','META-INF/jpa-changelog-13.0.0.xml','2026-05-24 00:10:36',95,'MARK_RAN','8:3002bb3997451bb9e8bac5c5cd8d6327','addNotNullConstraint columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; addNotNullConstraint columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT; addPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; createIndex indexName=...','',NULL,'4.16.1',NULL,NULL,'9581397399'),('json-string-accomodation-fixed','keycloak','META-INF/jpa-changelog-13.0.0.xml','2026-05-24 00:10:36',96,'EXECUTED','8:dfbee0d6237a23ef4ccbb7a4e063c163','addColumn tableName=REALM_ATTRIBUTE; update tableName=REALM_ATTRIBUTE; dropColumn columnName=VALUE, tableName=REALM_ATTRIBUTE; renameColumn newColumnName=VALUE, oldColumnName=VALUE_NEW, tableName=REALM_ATTRIBUTE','',NULL,'4.16.1',NULL,NULL,'9581397399'),('14.0.0-KEYCLOAK-11019','keycloak','META-INF/jpa-changelog-14.0.0.xml','2026-05-24 00:10:36',97,'EXECUTED','8:75f3e372df18d38c62734eebb986b960','createIndex indexName=IDX_OFFLINE_CSS_PRELOAD, tableName=OFFLINE_CLIENT_SESSION; createIndex indexName=IDX_OFFLINE_USS_BY_USER, tableName=OFFLINE_USER_SESSION; createIndex indexName=IDX_OFFLINE_USS_BY_USERSESS, tableName=OFFLINE_USER_SESSION','',NULL,'4.16.1',NULL,NULL,'9581397399'),('14.0.0-KEYCLOAK-18286','keycloak','META-INF/jpa-changelog-14.0.0.xml','2026-05-24 00:10:36',98,'MARK_RAN','8:7fee73eddf84a6035691512c85637eef','createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'4.16.1',NULL,NULL,'9581397399'),('14.0.0-KEYCLOAK-18286-revert','keycloak','META-INF/jpa-changelog-14.0.0.xml','2026-05-24 00:10:36',99,'MARK_RAN','8:7a11134ab12820f999fbf3bb13c3adc8','dropIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'4.16.1',NULL,NULL,'9581397399'),('14.0.0-KEYCLOAK-18286-supported-dbs','keycloak','META-INF/jpa-changelog-14.0.0.xml','2026-05-24 00:10:36',100,'EXECUTED','8:f43dfba07ba249d5d932dc489fd2b886','createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'4.16.1',NULL,NULL,'9581397399'),('14.0.0-KEYCLOAK-18286-unsupported-dbs','keycloak','META-INF/jpa-changelog-14.0.0.xml','2026-05-24 00:10:36',101,'MARK_RAN','8:18186f0008b86e0f0f49b0c4d0e842ac','createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'4.16.1',NULL,NULL,'9581397399'),('KEYCLOAK-17267-add-index-to-user-attributes','keycloak','META-INF/jpa-changelog-14.0.0.xml','2026-05-24 00:10:36',102,'EXECUTED','8:09c2780bcb23b310a7019d217dc7b433','createIndex indexName=IDX_USER_ATTRIBUTE_NAME, tableName=USER_ATTRIBUTE','',NULL,'4.16.1',NULL,NULL,'9581397399'),('KEYCLOAK-18146-add-saml-art-binding-identifier','keycloak','META-INF/jpa-changelog-14.0.0.xml','2026-05-24 00:10:36',103,'EXECUTED','8:276a44955eab693c970a42880197fff2','customChange','',NULL,'4.16.1',NULL,NULL,'9581397399'),('15.0.0-KEYCLOAK-18467','keycloak','META-INF/jpa-changelog-15.0.0.xml','2026-05-24 00:10:36',104,'EXECUTED','8:ba8ee3b694d043f2bfc1a1079d0760d7','addColumn tableName=REALM_LOCALIZATIONS; update tableName=REALM_LOCALIZATIONS; dropColumn columnName=TEXTS, tableName=REALM_LOCALIZATIONS; renameColumn newColumnName=TEXTS, oldColumnName=TEXTS_NEW, tableName=REALM_LOCALIZATIONS; addNotNullConstrai...','',NULL,'4.16.1',NULL,NULL,'9581397399'),('17.0.0-9562','keycloak','META-INF/jpa-changelog-17.0.0.xml','2026-05-24 00:10:36',105,'EXECUTED','8:5e06b1d75f5d17685485e610c2851b17','createIndex indexName=IDX_USER_SERVICE_ACCOUNT, tableName=USER_ENTITY','',NULL,'4.16.1',NULL,NULL,'9581397399'),('18.0.0-10625-IDX_ADMIN_EVENT_TIME','keycloak','META-INF/jpa-changelog-18.0.0.xml','2026-05-24 00:10:37',106,'EXECUTED','8:4b80546c1dc550ac552ee7b24a4ab7c0','createIndex indexName=IDX_ADMIN_EVENT_TIME, tableName=ADMIN_EVENT_ENTITY','',NULL,'4.16.1',NULL,NULL,'9581397399'),('19.0.0-10135','keycloak','META-INF/jpa-changelog-19.0.0.xml','2026-05-24 00:10:37',107,'EXECUTED','8:af510cd1bb2ab6339c45372f3e491696','customChange','',NULL,'4.16.1',NULL,NULL,'9581397399'),('20.0.0-12964-supported-dbs','keycloak','META-INF/jpa-changelog-20.0.0.xml','2026-05-24 00:10:37',108,'EXECUTED','8:d00f99ed899c4d2ae9117e282badbef5','createIndex indexName=IDX_GROUP_ATT_BY_NAME_VALUE, tableName=GROUP_ATTRIBUTE','',NULL,'4.16.1',NULL,NULL,'9581397399'),('20.0.0-12964-unsupported-dbs','keycloak','META-INF/jpa-changelog-20.0.0.xml','2026-05-24 00:10:37',109,'MARK_RAN','8:314e803baf2f1ec315b3464e398b8247','createIndex indexName=IDX_GROUP_ATT_BY_NAME_VALUE, tableName=GROUP_ATTRIBUTE','',NULL,'4.16.1',NULL,NULL,'9581397399'),('client-attributes-string-accomodation-fixed','keycloak','META-INF/jpa-changelog-20.0.0.xml','2026-05-24 00:10:37',110,'EXECUTED','8:56e4677e7e12556f70b604c573840100','addColumn tableName=CLIENT_ATTRIBUTES; update tableName=CLIENT_ATTRIBUTES; dropColumn columnName=VALUE, tableName=CLIENT_ATTRIBUTES; renameColumn newColumnName=VALUE, oldColumnName=VALUE_NEW, tableName=CLIENT_ATTRIBUTES','',NULL,'4.16.1',NULL,NULL,'9581397399'),('21.0.2-17277','keycloak','META-INF/jpa-changelog-21.0.2.xml','2026-05-24 00:10:37',111,'EXECUTED','8:8806cb33d2a546ce770384bf98cf6eac','customChange','',NULL,'4.16.1',NULL,NULL,'9581397399'),('21.1.0-19404','keycloak','META-INF/jpa-changelog-21.1.0.xml','2026-05-24 00:10:37',112,'EXECUTED','8:fdb2924649d30555ab3a1744faba4928','modifyDataType columnName=DECISION_STRATEGY, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=LOGIC, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=POLICY_ENFORCE_MODE, tableName=RESOURCE_SERVER','',NULL,'4.16.1',NULL,NULL,'9581397399'),('21.1.0-19404-2','keycloak','META-INF/jpa-changelog-21.1.0.xml','2026-05-24 00:10:37',113,'MARK_RAN','8:1c96cc2b10903bd07a03670098d67fd6','addColumn tableName=RESOURCE_SERVER_POLICY; update tableName=RESOURCE_SERVER_POLICY; dropColumn columnName=DECISION_STRATEGY, tableName=RESOURCE_SERVER_POLICY; renameColumn newColumnName=DECISION_STRATEGY, oldColumnName=DECISION_STRATEGY_NEW, tabl...','',NULL,'4.16.1',NULL,NULL,'9581397399');
/*!40000 ALTER TABLE `databasechangelog` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `databasechangeloglock` (
  `ID` int(11) NOT NULL,
  `LOCKED` bit(1) NOT NULL,
  `LOCKGRANTED` datetime DEFAULT NULL,
  `LOCKEDBY` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `databasechangeloglock` WRITE;
/*!40000 ALTER TABLE `databasechangeloglock` DISABLE KEYS */;
INSERT INTO `databasechangeloglock` VALUES (1,'\0',NULL,NULL),(1000,'\0',NULL,NULL),(1001,'\0',NULL,NULL);
/*!40000 ALTER TABLE `databasechangeloglock` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `default_client_scope` (
  `REALM_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `SCOPE_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `DEFAULT_SCOPE` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`REALM_ID`,`SCOPE_ID`),
  KEY `IDX_DEFCLS_REALM` (`REALM_ID`),
  KEY `IDX_DEFCLS_SCOPE` (`SCOPE_ID`),
  CONSTRAINT `FK_R_DEF_CLI_SCOPE_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `realm` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `default_client_scope` WRITE;
/*!40000 ALTER TABLE `default_client_scope` DISABLE KEYS */;
INSERT INTO `default_client_scope` VALUES ('cadce104-54a0-4956-8ab8-384021f6a4c5','14a71407-3857-4bd6-b9f9-0745f8452dbc',''),('cadce104-54a0-4956-8ab8-384021f6a4c5','21db3614-01d1-4b25-a233-f027b93c4b1e',''),('cadce104-54a0-4956-8ab8-384021f6a4c5','64f51978-8f7a-4b47-a1b9-77e9694d1f70',''),('cadce104-54a0-4956-8ab8-384021f6a4c5','9068e53c-57a8-4227-a463-178fd9d2f938',''),('cadce104-54a0-4956-8ab8-384021f6a4c5','d933f55b-3263-46b8-ab62-a92c9f4ad084',''),('cadce104-54a0-4956-8ab8-384021f6a4c5','e0372e79-7d76-4ff2-9a78-6264cf470acc','\0'),('cadce104-54a0-4956-8ab8-384021f6a4c5','e2789303-02b6-48d5-886e-fe729628d23d','\0'),('cadce104-54a0-4956-8ab8-384021f6a4c5','e2f3db6b-3d7b-4d39-8425-67b7ab8307f5','\0'),('cadce104-54a0-4956-8ab8-384021f6a4c5','edd980cc-997a-478e-a198-6aacc3446e01',''),('cadce104-54a0-4956-8ab8-384021f6a4c5','f27a7b40-dbf9-4a2a-b411-29c1f7a06804','\0'),('onesaitplatform','1e3a8748-b5e0-42e2-8456-c4dfaa9fc46f',''),('onesaitplatform','260ef9f7-c1b2-4f7e-a4cf-2567b9f035e3',''),('onesaitplatform','6d04f5c5-6255-4c43-b8ff-aac92b7749fc',''),('onesaitplatform','89a0577a-53a3-4019-9d58-5c3d08875909',''),('onesaitplatform','b64be050-47b4-49be-bc82-395725648497',''),('onesaitplatform','c55b9a6d-dff3-41dd-b9ee-d19c2e329a26',''),('onesaitplatform','d03d070b-9e65-4606-80bd-89bb84c6f559','\0'),('onesaitplatform','ecd471d5-020c-4c18-ac02-d5eca98613d9','\0'),('onesaitplatform','f3edecac-11d8-46da-a493-1fd283a66f6b','\0'),('onesaitplatform','fa9dbcf3-ed64-465f-9d1d-0a650d5023c8','\0');
/*!40000 ALTER TABLE `default_client_scope` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_entity` (
  `ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CLIENT_ID` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DETAILS_JSON` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ERROR` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `IP_ADDRESS` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `REALM_ID` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SESSION_ID` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `EVENT_TIME` bigint(20) DEFAULT NULL,
  `TYPE` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `USER_ID` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_EVENT_TIME` (`REALM_ID`,`EVENT_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `event_entity` WRITE;
/*!40000 ALTER TABLE `event_entity` DISABLE KEYS */;
INSERT INTO `event_entity` VALUES ('00f81125-d242-4e8e-bf27-1a2e87a6c1ef','onesaitplatform','{\"auth_method\":\"openid-connect\",\"grant_type\":\"password\",\"client_auth_method\":\"client-secret\",\"username\":\"analytics\"}','invalid_user_credentials','172.29.48.13','onesaitplatform',NULL,1781969668963,'LOGIN_ERROR','f:642359c8-e564-47bc-b36c-ce4cd4ee61cc:analytics'),('0854cf96-9000-46d3-9c89-6ea0b0db9fa8','onesaitplatform','{\"auth_method\":\"openid-connect\",\"auth_type\":\"code\",\"redirect_uri\":\"https://localhost/controlpanel/login/oauth2/code/onesaitplatform\",\"code_id\":\"50e1ffc5-6527-4ee2-a586-d79bda738706\",\"username\":\"developer\"}','invalid_user_credentials','172.28.0.1','onesaitplatform',NULL,1779582594821,'LOGIN_ERROR','f:642359c8-e564-47bc-b36c-ce4cd4ee61cc:developer'),('092587b4-823c-4cc5-acc1-9c16c704195b','onesaitplatform','{\"auth_method\":\"openid-connect\",\"auth_type\":\"code\",\"redirect_uri\":\"https://localhost/controlpanel/login/oauth2/code/onesaitplatform\",\"code_id\":\"50e1ffc5-6527-4ee2-a586-d79bda738706\",\"username\":\"administrator\"}','invalid_user_credentials','172.28.0.1','onesaitplatform',NULL,1779582521594,'LOGIN_ERROR','f:642359c8-e564-47bc-b36c-ce4cd4ee61cc:administrator'),('155abae6-db43-4aaa-8985-d8284b4749e9','onesaitplatform','{\"auth_method\":\"openid-connect\",\"grant_type\":\"password\",\"client_auth_method\":\"client-secret\",\"username\":\"analytics\"}','invalid_user_credentials','172.29.48.13','onesaitplatform',NULL,1781969668906,'LOGIN_ERROR','f:642359c8-e564-47bc-b36c-ce4cd4ee61cc:analytics'),('1708f9c1-0838-4ca3-8f83-302d23941786','onesaitplatform','{\"auth_method\":\"openid-connect\",\"auth_type\":\"code\",\"redirect_uri\":\"https://172.29.48.13/controlpanel/login/oauth2/code/onesaitplatform\",\"code_id\":\"90bdedfc-408b-46db-94ad-669e62948bc6\",\"username\":\"anyi\"}','invalid_user_credentials','172.29.48.1','onesaitplatform',NULL,1782328388389,'LOGIN_ERROR','f:642359c8-e564-47bc-b36c-ce4cd4ee61cc:anyi'),('1e6a4f62-c6c3-4e03-8361-0f8ce0ce808b','onesaitplatform','{\"auth_method\":\"openid-connect\",\"auth_type\":\"code\",\"redirect_uri\":\"https://172.29.48.13/controlpanel/login/oauth2/code/onesaitplatform\",\"code_id\":\"c404f2b9-4c08-4c94-8da0-d943ab7ae8cc\",\"username\":\"administrador\"}','user_not_found','172.29.48.1','onesaitplatform',NULL,1781474662223,'LOGIN_ERROR',NULL),('283d91bb-eccb-4d9c-ba87-7b86e6bbc6d4','onesaitplatform','{\"grant_type\":\"password\"}','invalid_client_credentials','172.28.0.1','onesaitplatform',NULL,1779583230110,'LOGIN_ERROR',NULL),('34bd12b8-fd9f-4c20-8e1d-b807c0a0a65e','onesait','{\"grant_type\":\"password\"}','client_not_found','172.29.48.13','onesaitplatform',NULL,1781969580167,'LOGIN_ERROR',NULL),('64f5e738-c87c-4b1f-ab7a-8ef3bffd3492','onesaitplatform','{\"auth_method\":\"openid-connect\",\"grant_type\":\"password\",\"client_auth_method\":\"client-secret\",\"username\":\"isaias\"}','user_not_found','172.28.0.1','onesaitplatform',NULL,1779583390826,'LOGIN_ERROR',NULL),('78d03ba3-9db5-4a83-96d3-a73f6b95e076','onesaitplatform','{\"auth_method\":\"openid-connect\",\"grant_type\":\"password\",\"client_auth_method\":\"client-secret\",\"username\":\"administrator\"}','invalid_user_credentials','172.28.0.1','onesaitplatform',NULL,1779583255667,'LOGIN_ERROR','f:642359c8-e564-47bc-b36c-ce4cd4ee61cc:administrator'),('85b7705b-3b46-4602-ba76-eecbdc549d11','admin-cli','{\"auth_method\":\"openid-connect\",\"grant_type\":\"password\",\"client_auth_method\":\"client-secret\",\"username\":\"admin\"}','invalid_user_credentials','172.28.0.1','cadce104-54a0-4956-8ab8-384021f6a4c5',NULL,1779585153217,'LOGIN_ERROR','599dbd5a-9a92-47ab-89f9-4c8661b38e05'),('8f528cb9-a512-4f65-8569-0d6e1b7c4780','onesaitplatform','{\"auth_method\":\"openid-connect\",\"grant_type\":\"password\",\"client_auth_method\":\"client-secret\",\"username\":\"jairodavis\"}','user_not_found','172.29.48.13','onesaitplatform',NULL,1781969626988,'LOGIN_ERROR',NULL),('928a09ff-a59a-44bc-87dd-eeca60c7d0df','onesaitplatform','{\"auth_method\":\"openid-connect\",\"auth_type\":\"code\",\"redirect_uri\":\"https://172.29.48.13/controlpanel/login/oauth2/code/onesaitplatform\",\"code_id\":\"c404f2b9-4c08-4c94-8da0-d943ab7ae8cc\",\"username\":\"administrador\"}','user_not_found','172.29.48.1','onesaitplatform',NULL,1781474670527,'LOGIN_ERROR',NULL),('9e0d00b7-28da-441c-abb9-e95fe19d6f8b','onesaitplatform','{\"auth_method\":\"openid-connect\",\"grant_type\":\"password\",\"client_auth_method\":\"client-secret\",\"username\":\"analytics\"}','invalid_user_credentials','172.29.48.13','onesaitplatform',NULL,1781969668857,'LOGIN_ERROR','f:642359c8-e564-47bc-b36c-ce4cd4ee61cc:analytics'),('a1cac243-861d-4c88-a551-d402f40e2de7','onesaitplatform','{\"auth_method\":\"openid-connect\",\"auth_type\":\"code\",\"redirect_uri\":\"https://localhost/controlpanel/login/oauth2/code/onesaitplatform\",\"code_id\":\"50e1ffc5-6527-4ee2-a586-d79bda738706\",\"username\":\"administrator\"}','invalid_user_credentials','172.28.0.1','onesaitplatform',NULL,1779582431284,'LOGIN_ERROR','f:642359c8-e564-47bc-b36c-ce4cd4ee61cc:administrator'),('c0edff44-1205-4c74-bcf5-e7ddc8fa4e8b',NULL,'{\"restart_after_timeout\":\"true\"}','expired_code','172.29.48.13','onesaitplatform',NULL,1781965645096,'LOGIN_ERROR',NULL),('c5ba655c-de1a-4202-a505-49b15dd0afc5','onesaitplatform','{\"auth_method\":\"openid-connect\",\"auth_type\":\"code\",\"redirect_uri\":\"https://localhost/controlpanel/login/oauth2/code/onesaitplatform\",\"code_id\":\"50e1ffc5-6527-4ee2-a586-d79bda738706\",\"username\":\"developer\"}','invalid_user_credentials','172.28.0.1','onesaitplatform',NULL,1779582531338,'LOGIN_ERROR','f:642359c8-e564-47bc-b36c-ce4cd4ee61cc:developer'),('c9c05139-1c60-4fd3-b987-59eccba82c6a','admin-cli','{\"auth_method\":\"openid-connect\",\"grant_type\":\"password\",\"client_auth_method\":\"client-secret\",\"username\":\"admin\"}','invalid_user_credentials','172.28.0.1','cadce104-54a0-4956-8ab8-384021f6a4c5',NULL,1779585162874,'LOGIN_ERROR','599dbd5a-9a92-47ab-89f9-4c8661b38e05'),('d426ba5b-2aca-4ef4-bee5-abe1ebda145a','onesaitplatform','{\"auth_method\":\"openid-connect\",\"auth_type\":\"code\",\"redirect_uri\":\"https://localhost/controlpanel/login/oauth2/code/onesaitplatform\",\"code_id\":\"50e1ffc5-6527-4ee2-a586-d79bda738706\",\"username\":\"administrator\"}','invalid_user_credentials','172.28.0.1','onesaitplatform',NULL,1779582645501,'LOGIN_ERROR','f:642359c8-e564-47bc-b36c-ce4cd4ee61cc:administrator'),('e294a5f7-ae86-4064-8850-4b3852591ff3','onesaitplatform','{\"auth_method\":\"openid-connect\",\"auth_type\":\"code\",\"redirect_uri\":\"https://localhost/controlpanel/login/oauth2/code/onesaitplatform\",\"code_id\":\"50e1ffc5-6527-4ee2-a586-d79bda738706\",\"username\":\"developer\"}','invalid_user_credentials','172.28.0.1','onesaitplatform',NULL,1779582595483,'LOGIN_ERROR','f:642359c8-e564-47bc-b36c-ce4cd4ee61cc:developer'),('e767d9bb-08cf-4c68-83e2-5dcba8932679','onesaitplatform','{\"auth_method\":\"openid-connect\",\"grant_type\":\"password\",\"client_auth_method\":\"client-secret\",\"username\":\"analytics\"}','invalid_user_credentials','172.29.48.13','onesaitplatform',NULL,1781969668730,'LOGIN_ERROR','f:642359c8-e564-47bc-b36c-ce4cd4ee61cc:analytics');
/*!40000 ALTER TABLE `event_entity` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fed_user_attribute` (
  `ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `NAME` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `USER_ID` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `REALM_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `VALUE` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_FU_ATTRIBUTE` (`USER_ID`,`REALM_ID`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `fed_user_attribute` WRITE;
/*!40000 ALTER TABLE `fed_user_attribute` DISABLE KEYS */;
INSERT INTO `fed_user_attribute` VALUES ('177e777f-3aeb-4fb4-9303-5c0cd05f9fb3','vertical','f:642359c8-e564-47bc-b36c-ce4cd4ee61cc:administrator','onesaitplatform','642359c8-e564-47bc-b36c-ce4cd4ee61cc','onesaitplatform'),('6b9d57c5-b6f2-4cef-ba6b-493eea67eb40','vertical','f:642359c8-e564-47bc-b36c-ce4cd4ee61cc:anyi','onesaitplatform','642359c8-e564-47bc-b36c-ce4cd4ee61cc','onesaitplatform'),('c8531c47-df49-4b20-857f-78e8a9858fba','vertical','f:642359c8-e564-47bc-b36c-ce4cd4ee61cc:fernando','onesaitplatform','642359c8-e564-47bc-b36c-ce4cd4ee61cc','onesaitplatform'),('c8ded266-8b14-4565-b00f-680959810486','vertical','f:642359c8-e564-47bc-b36c-ce4cd4ee61cc:developer','onesaitplatform','642359c8-e564-47bc-b36c-ce4cd4ee61cc','onesaitplatform');
/*!40000 ALTER TABLE `fed_user_attribute` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fed_user_consent` (
  `ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CLIENT_ID` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `USER_ID` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `REALM_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CREATED_DATE` bigint(20) DEFAULT NULL,
  `LAST_UPDATED_DATE` bigint(20) DEFAULT NULL,
  `CLIENT_STORAGE_PROVIDER` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `EXTERNAL_CLIENT_ID` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_FU_CONSENT` (`USER_ID`,`CLIENT_ID`),
  KEY `IDX_FU_CONSENT_RU` (`REALM_ID`,`USER_ID`),
  KEY `IDX_FU_CNSNT_EXT` (`USER_ID`,`CLIENT_STORAGE_PROVIDER`,`EXTERNAL_CLIENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `fed_user_consent` WRITE;
/*!40000 ALTER TABLE `fed_user_consent` DISABLE KEYS */;
/*!40000 ALTER TABLE `fed_user_consent` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fed_user_consent_cl_scope` (
  `USER_CONSENT_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `SCOPE_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`USER_CONSENT_ID`,`SCOPE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `fed_user_consent_cl_scope` WRITE;
/*!40000 ALTER TABLE `fed_user_consent_cl_scope` DISABLE KEYS */;
/*!40000 ALTER TABLE `fed_user_consent_cl_scope` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fed_user_credential` (
  `ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `SALT` tinyblob DEFAULT NULL,
  `TYPE` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CREATED_DATE` bigint(20) DEFAULT NULL,
  `USER_ID` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `REALM_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `USER_LABEL` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SECRET_DATA` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CREDENTIAL_DATA` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_FU_CREDENTIAL` (`USER_ID`,`TYPE`),
  KEY `IDX_FU_CREDENTIAL_RU` (`REALM_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `fed_user_credential` WRITE;
/*!40000 ALTER TABLE `fed_user_credential` DISABLE KEYS */;
/*!40000 ALTER TABLE `fed_user_credential` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fed_user_group_membership` (
  `GROUP_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `USER_ID` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `REALM_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`GROUP_ID`,`USER_ID`),
  KEY `IDX_FU_GROUP_MEMBERSHIP` (`USER_ID`,`GROUP_ID`),
  KEY `IDX_FU_GROUP_MEMBERSHIP_RU` (`REALM_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `fed_user_group_membership` WRITE;
/*!40000 ALTER TABLE `fed_user_group_membership` DISABLE KEYS */;
/*!40000 ALTER TABLE `fed_user_group_membership` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fed_user_required_action` (
  `REQUIRED_ACTION` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ' ',
  `USER_ID` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `REALM_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`REQUIRED_ACTION`,`USER_ID`),
  KEY `IDX_FU_REQUIRED_ACTION` (`USER_ID`,`REQUIRED_ACTION`),
  KEY `IDX_FU_REQUIRED_ACTION_RU` (`REALM_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `fed_user_required_action` WRITE;
/*!40000 ALTER TABLE `fed_user_required_action` DISABLE KEYS */;
/*!40000 ALTER TABLE `fed_user_required_action` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fed_user_role_mapping` (
  `ROLE_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `USER_ID` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `REALM_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ROLE_ID`,`USER_ID`),
  KEY `IDX_FU_ROLE_MAPPING` (`USER_ID`,`ROLE_ID`),
  KEY `IDX_FU_ROLE_MAPPING_RU` (`REALM_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `fed_user_role_mapping` WRITE;
/*!40000 ALTER TABLE `fed_user_role_mapping` DISABLE KEYS */;
/*!40000 ALTER TABLE `fed_user_role_mapping` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `federated_identity` (
  `IDENTITY_PROVIDER` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `REALM_ID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `FEDERATED_USER_ID` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `FEDERATED_USERNAME` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TOKEN` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `USER_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`IDENTITY_PROVIDER`,`USER_ID`),
  KEY `IDX_FEDIDENTITY_USER` (`USER_ID`),
  KEY `IDX_FEDIDENTITY_FEDUSER` (`FEDERATED_USER_ID`),
  CONSTRAINT `FK404288B92EF007A6` FOREIGN KEY (`USER_ID`) REFERENCES `user_entity` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `federated_identity` WRITE;
/*!40000 ALTER TABLE `federated_identity` DISABLE KEYS */;
/*!40000 ALTER TABLE `federated_identity` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `federated_user` (
  `ID` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `REALM_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `federated_user` WRITE;
/*!40000 ALTER TABLE `federated_user` DISABLE KEYS */;
INSERT INTO `federated_user` VALUES ('f:642359c8-e564-47bc-b36c-ce4cd4ee61cc:administrator','642359c8-e564-47bc-b36c-ce4cd4ee61cc','onesaitplatform'),('f:642359c8-e564-47bc-b36c-ce4cd4ee61cc:anyi','642359c8-e564-47bc-b36c-ce4cd4ee61cc','onesaitplatform'),('f:642359c8-e564-47bc-b36c-ce4cd4ee61cc:developer','642359c8-e564-47bc-b36c-ce4cd4ee61cc','onesaitplatform'),('f:642359c8-e564-47bc-b36c-ce4cd4ee61cc:fernando','642359c8-e564-47bc-b36c-ce4cd4ee61cc','onesaitplatform');
/*!40000 ALTER TABLE `federated_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_attribute` (
  `ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'sybase-needs-something-here',
  `NAME` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `VALUE` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `GROUP_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_GROUP_ATTR_GROUP` (`GROUP_ID`),
  KEY `IDX_GROUP_ATT_BY_NAME_VALUE` (`NAME`,`VALUE`),
  CONSTRAINT `FK_GROUP_ATTRIBUTE_GROUP` FOREIGN KEY (`GROUP_ID`) REFERENCES `keycloak_group` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `group_attribute` WRITE;
/*!40000 ALTER TABLE `group_attribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `group_attribute` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_role_mapping` (
  `ROLE_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `GROUP_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`ROLE_ID`,`GROUP_ID`),
  KEY `IDX_GROUP_ROLE_MAPP_GROUP` (`GROUP_ID`),
  CONSTRAINT `FK_GROUP_ROLE_GROUP` FOREIGN KEY (`GROUP_ID`) REFERENCES `keycloak_group` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `group_role_mapping` WRITE;
/*!40000 ALTER TABLE `group_role_mapping` DISABLE KEYS */;
/*!40000 ALTER TABLE `group_role_mapping` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `identity_provider` (
  `INTERNAL_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `PROVIDER_ALIAS` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PROVIDER_ID` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `STORE_TOKEN` bit(1) NOT NULL DEFAULT b'0',
  `AUTHENTICATE_BY_DEFAULT` bit(1) NOT NULL DEFAULT b'0',
  `REALM_ID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ADD_TOKEN_ROLE` bit(1) NOT NULL DEFAULT b'1',
  `TRUST_EMAIL` bit(1) NOT NULL DEFAULT b'0',
  `FIRST_BROKER_LOGIN_FLOW_ID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `POST_BROKER_LOGIN_FLOW_ID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PROVIDER_DISPLAY_NAME` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `LINK_ONLY` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`INTERNAL_ID`),
  UNIQUE KEY `UK_2DAELWNIBJI49AVXSRTUF6XJ33` (`PROVIDER_ALIAS`,`REALM_ID`),
  KEY `IDX_IDENT_PROV_REALM` (`REALM_ID`),
  CONSTRAINT `FK2B4EBC52AE5C3B34` FOREIGN KEY (`REALM_ID`) REFERENCES `realm` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `identity_provider` WRITE;
/*!40000 ALTER TABLE `identity_provider` DISABLE KEYS */;
/*!40000 ALTER TABLE `identity_provider` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `identity_provider_config` (
  `IDENTITY_PROVIDER_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `VALUE` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`IDENTITY_PROVIDER_ID`,`NAME`),
  CONSTRAINT `FKDC4897CF864C4E43` FOREIGN KEY (`IDENTITY_PROVIDER_ID`) REFERENCES `identity_provider` (`INTERNAL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `identity_provider_config` WRITE;
/*!40000 ALTER TABLE `identity_provider_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `identity_provider_config` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `identity_provider_mapper` (
  `ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `NAME` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `IDP_ALIAS` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `IDP_MAPPER_NAME` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `REALM_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_ID_PROV_MAPP_REALM` (`REALM_ID`),
  CONSTRAINT `FK_IDPM_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `realm` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `identity_provider_mapper` WRITE;
/*!40000 ALTER TABLE `identity_provider_mapper` DISABLE KEYS */;
/*!40000 ALTER TABLE `identity_provider_mapper` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idp_mapper_config` (
  `IDP_MAPPER_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `VALUE` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`IDP_MAPPER_ID`,`NAME`),
  CONSTRAINT `FK_IDPMCONFIG` FOREIGN KEY (`IDP_MAPPER_ID`) REFERENCES `identity_provider_mapper` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `idp_mapper_config` WRITE;
/*!40000 ALTER TABLE `idp_mapper_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `idp_mapper_config` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `keycloak_group` (
  `ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `NAME` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `PARENT_GROUP` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `REALM_ID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `SIBLING_NAMES` (`REALM_ID`,`PARENT_GROUP`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `keycloak_group` WRITE;
/*!40000 ALTER TABLE `keycloak_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `keycloak_group` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `keycloak_role` (
  `ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CLIENT_REALM_CONSTRAINT` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CLIENT_ROLE` bit(1) DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `NAME` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `REALM_ID` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CLIENT` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `REALM` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_J3RWUVD56ONTGSUHOGM184WW2-2` (`NAME`,`CLIENT_REALM_CONSTRAINT`),
  KEY `IDX_KEYCLOAK_ROLE_CLIENT` (`CLIENT`),
  KEY `IDX_KEYCLOAK_ROLE_REALM` (`REALM`),
  CONSTRAINT `FK_6VYQFE4CN4WLQ8R6KT5VDSJ5C` FOREIGN KEY (`REALM`) REFERENCES `realm` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `keycloak_role` WRITE;
/*!40000 ALTER TABLE `keycloak_role` DISABLE KEYS */;
INSERT INTO `keycloak_role` VALUES ('005daee8-8cf2-474c-908a-424daa5ddcb9','onesaitplatform','\0','ROLE_DEVELOPER','ROLE_DEVELOPER','onesaitplatform',NULL,NULL),('038b09df-74e2-4585-b60d-57ae083e5073','cadce104-54a0-4956-8ab8-384021f6a4c5','\0','${role_create-realm}','create-realm','cadce104-54a0-4956-8ab8-384021f6a4c5',NULL,NULL),('057e29be-0147-4c6f-9f24-d929692b10d0','04580e21-6a8f-43a9-83fd-b5dedb5a85a1','','${role_view-groups}','view-groups','onesaitplatform','04580e21-6a8f-43a9-83fd-b5dedb5a85a1',NULL),('0697c22f-e4c7-47c0-9727-fd98ca0550ca','cadce104-54a0-4956-8ab8-384021f6a4c5','\0','ROLE_USER','ROLE_USER','cadce104-54a0-4956-8ab8-384021f6a4c5',NULL,NULL),('08ce1a04-6d11-409f-b2ce-f94e60af5af0','onesaitplatform','\0','${role_uma_authorization}','uma_authorization','onesaitplatform',NULL,NULL),('08d544b0-26fd-4121-9729-fcf3411256d8','04580e21-6a8f-43a9-83fd-b5dedb5a85a1','','${role_manage-account}','manage-account','onesaitplatform','04580e21-6a8f-43a9-83fd-b5dedb5a85a1',NULL),('0a45458b-78a3-4883-bb5c-42d41ac7bb0f','153fb7aa-5ab1-45d9-91cf-b75bf4ebfc50','','${role_view-realm}','view-realm','onesaitplatform','153fb7aa-5ab1-45d9-91cf-b75bf4ebfc50',NULL),('0aadec3a-4816-4cc9-99f0-5f4775712815','153fb7aa-5ab1-45d9-91cf-b75bf4ebfc50','','${role_manage-events}','manage-events','onesaitplatform','153fb7aa-5ab1-45d9-91cf-b75bf4ebfc50',NULL),('0ed7986c-fc95-4b3c-b9da-479d6eaf6517','onesaitplatform','\0','ROLE_PREVERIFIED_TENANT_USER','ROLE_PREVERIFIED_TENANT_USER','onesaitplatform',NULL,NULL),('122e4aed-e3c8-4c17-8cd2-74cd0601815c','b437f737-aadd-47b5-a7f7-beb45dd6509b','','${role_manage-events}','manage-events','cadce104-54a0-4956-8ab8-384021f6a4c5','b437f737-aadd-47b5-a7f7-beb45dd6509b',NULL),('13339287-c5ac-4e9c-8635-6fcbb1e2f47c','b437f737-aadd-47b5-a7f7-beb45dd6509b','','${role_view-users}','view-users','cadce104-54a0-4956-8ab8-384021f6a4c5','b437f737-aadd-47b5-a7f7-beb45dd6509b',NULL),('1622c201-79ca-49c0-976c-42f5bce31ca1','153fb7aa-5ab1-45d9-91cf-b75bf4ebfc50','','${role_manage-users}','manage-users','onesaitplatform','153fb7aa-5ab1-45d9-91cf-b75bf4ebfc50',NULL),('171822c0-4e48-4bfa-9ca0-cf5e4acfc47b','153fb7aa-5ab1-45d9-91cf-b75bf4ebfc50','','${role_view-identity-providers}','view-identity-providers','onesaitplatform','153fb7aa-5ab1-45d9-91cf-b75bf4ebfc50',NULL),('1b28960f-d0f2-4214-b8c5-dd07b772a7aa','153fb7aa-5ab1-45d9-91cf-b75bf4ebfc50','','${role_manage-authorization}','manage-authorization','onesaitplatform','153fb7aa-5ab1-45d9-91cf-b75bf4ebfc50',NULL),('1d8435d9-75d7-4027-8237-c8b5e2dbee3b','cadce104-54a0-4956-8ab8-384021f6a4c5','\0','ROLE_EDGE_DEVELOPER','ROLE_EDGE_DEVELOPER','cadce104-54a0-4956-8ab8-384021f6a4c5',NULL,NULL),('2091f963-f219-409f-a429-ac81b9773b5d','153fb7aa-5ab1-45d9-91cf-b75bf4ebfc50','','${role_query-users}','query-users','onesaitplatform','153fb7aa-5ab1-45d9-91cf-b75bf4ebfc50',NULL),('20a5da22-d527-40f0-9109-a9e45514d115','onesaitplatform','\0','${role_offline-access}','offline_access','onesaitplatform',NULL,NULL),('21f75dc7-d4c3-4957-b9ea-17d8a12f9e14','cadce104-54a0-4956-8ab8-384021f6a4c5','\0','ROLE_OPERATIONS','ROLE_OPERATIONS','cadce104-54a0-4956-8ab8-384021f6a4c5',NULL,NULL),('24402df3-a307-41fb-b79c-732e3281a455','153fb7aa-5ab1-45d9-91cf-b75bf4ebfc50','','${role_impersonation}','impersonation','onesaitplatform','153fb7aa-5ab1-45d9-91cf-b75bf4ebfc50',NULL),('258678ef-b9b9-4ded-8b95-a7e367276dc6','onesaitplatform','\0','ROLE_PREVERIFIED_ADMINISTRATOR','ROLE_PREVERIFIED_ADMINISTRATOR','onesaitplatform',NULL,NULL),('26a0333b-6f87-4ecb-aba4-b67239430ad6','b437f737-aadd-47b5-a7f7-beb45dd6509b','','${role_manage-authorization}','manage-authorization','cadce104-54a0-4956-8ab8-384021f6a4c5','b437f737-aadd-47b5-a7f7-beb45dd6509b',NULL),('26b7ab8c-c6f2-47b4-891e-fdc7365b4440','cadce104-54a0-4956-8ab8-384021f6a4c5','\0','ROLE_PREVERIFIED_TENANT_USER','ROLE_PREVERIFIED_TENANT_USER','cadce104-54a0-4956-8ab8-384021f6a4c5',NULL,NULL),('289c7e5d-c7bf-4b80-b84e-3c75c85f8e20','b437f737-aadd-47b5-a7f7-beb45dd6509b','','${role_manage-clients}','manage-clients','cadce104-54a0-4956-8ab8-384021f6a4c5','b437f737-aadd-47b5-a7f7-beb45dd6509b',NULL),('2e8ef798-3672-4fcc-9216-9f302110754e','98ed13b8-d6e4-44fa-820f-1967075b06ce','','${role_view-realm}','view-realm','cadce104-54a0-4956-8ab8-384021f6a4c5','98ed13b8-d6e4-44fa-820f-1967075b06ce',NULL),('36b9ad7a-3306-4e4e-8ada-43b265f67cf5','b437f737-aadd-47b5-a7f7-beb45dd6509b','','${role_manage-users}','manage-users','cadce104-54a0-4956-8ab8-384021f6a4c5','b437f737-aadd-47b5-a7f7-beb45dd6509b',NULL),('38d4b09d-e537-43c1-b47e-253ba9535d6d','153fb7aa-5ab1-45d9-91cf-b75bf4ebfc50','','${role_manage-clients}','manage-clients','onesaitplatform','153fb7aa-5ab1-45d9-91cf-b75bf4ebfc50',NULL),('3b5f6cc1-2cc3-4b54-82dd-f59d0a3c64ec','b437f737-aadd-47b5-a7f7-beb45dd6509b','','${role_query-clients}','query-clients','cadce104-54a0-4956-8ab8-384021f6a4c5','b437f737-aadd-47b5-a7f7-beb45dd6509b',NULL),('3ff02364-02db-4673-97a1-c6c9426c89df','cadce104-54a0-4956-8ab8-384021f6a4c5','\0','ROLE_DATASCIENTIST','ROLE_DATASCIENTIST','cadce104-54a0-4956-8ab8-384021f6a4c5',NULL,NULL),('40175bd8-21a1-487e-aa8f-d3dc0579b69a','98ed13b8-d6e4-44fa-820f-1967075b06ce','','${role_view-events}','view-events','cadce104-54a0-4956-8ab8-384021f6a4c5','98ed13b8-d6e4-44fa-820f-1967075b06ce',NULL),('40b6e0e4-9860-4897-84f7-e20857dfa2a0','b437f737-aadd-47b5-a7f7-beb45dd6509b','','${role_view-realm}','view-realm','cadce104-54a0-4956-8ab8-384021f6a4c5','b437f737-aadd-47b5-a7f7-beb45dd6509b',NULL),('4cf49eb2-3517-4067-a8e2-07cad5fbf4d1','cadce104-54a0-4956-8ab8-384021f6a4c5','\0','ROLE_EDGE_USER','ROLE_EDGE_USER','cadce104-54a0-4956-8ab8-384021f6a4c5',NULL,NULL),('528f306b-253d-4475-a904-666fc59cb132','98ed13b8-d6e4-44fa-820f-1967075b06ce','','${role_query-realms}','query-realms','cadce104-54a0-4956-8ab8-384021f6a4c5','98ed13b8-d6e4-44fa-820f-1967075b06ce',NULL),('563df0bd-934b-4374-92f0-9e9f93fa4b81','98ed13b8-d6e4-44fa-820f-1967075b06ce','','${role_manage-realm}','manage-realm','cadce104-54a0-4956-8ab8-384021f6a4c5','98ed13b8-d6e4-44fa-820f-1967075b06ce',NULL),('5a2bd4a5-3dba-4ee1-9e92-002e31c6b5f8','b437f737-aadd-47b5-a7f7-beb45dd6509b','','${role_create-client}','create-client','cadce104-54a0-4956-8ab8-384021f6a4c5','b437f737-aadd-47b5-a7f7-beb45dd6509b',NULL),('5c7ed303-7a4a-432d-a1d8-5df2044d1314','6df83b2a-c035-439b-a6b9-658ebf055a0f','','${role_view-groups}','view-groups','cadce104-54a0-4956-8ab8-384021f6a4c5','6df83b2a-c035-439b-a6b9-658ebf055a0f',NULL),('5c937c71-2b05-4897-b21d-9e3a44ee3dcc','153fb7aa-5ab1-45d9-91cf-b75bf4ebfc50','','${role_realm-admin}','realm-admin','onesaitplatform','153fb7aa-5ab1-45d9-91cf-b75bf4ebfc50',NULL),('641c6200-1db7-4163-8dc0-5d51388e1503','153fb7aa-5ab1-45d9-91cf-b75bf4ebfc50','','${role_manage-realm}','manage-realm','onesaitplatform','153fb7aa-5ab1-45d9-91cf-b75bf4ebfc50',NULL),('64399c77-8f69-4dab-a8bc-f80841b45129','98ed13b8-d6e4-44fa-820f-1967075b06ce','','${role_view-identity-providers}','view-identity-providers','cadce104-54a0-4956-8ab8-384021f6a4c5','98ed13b8-d6e4-44fa-820f-1967075b06ce',NULL),('654a352c-89ac-4e07-b993-781086430302','98ed13b8-d6e4-44fa-820f-1967075b06ce','','${role_manage-identity-providers}','manage-identity-providers','cadce104-54a0-4956-8ab8-384021f6a4c5','98ed13b8-d6e4-44fa-820f-1967075b06ce',NULL),('66d55e99-bbbc-434d-b3dd-224c4d9a8e55','cadce104-54a0-4956-8ab8-384021f6a4c5','\0','ROLE_DATAVIEWER','ROLE_DATAVIEWER','cadce104-54a0-4956-8ab8-384021f6a4c5',NULL,NULL),('6eecb5a8-cc75-4995-913b-b9b6675c7c83','6df83b2a-c035-439b-a6b9-658ebf055a0f','','${role_view-consent}','view-consent','cadce104-54a0-4956-8ab8-384021f6a4c5','6df83b2a-c035-439b-a6b9-658ebf055a0f',NULL),('70e210e9-39a8-49ae-a254-7bb82d3c9494','98ed13b8-d6e4-44fa-820f-1967075b06ce','','${role_create-client}','create-client','cadce104-54a0-4956-8ab8-384021f6a4c5','98ed13b8-d6e4-44fa-820f-1967075b06ce',NULL),('74aa1488-8217-42f4-a4cc-1e3631b6b6d1','153fb7aa-5ab1-45d9-91cf-b75bf4ebfc50','','${role_view-authorization}','view-authorization','onesaitplatform','153fb7aa-5ab1-45d9-91cf-b75bf4ebfc50',NULL),('7725b58d-d6cd-43e0-b7eb-1d3993349130','b437f737-aadd-47b5-a7f7-beb45dd6509b','','${role_view-clients}','view-clients','cadce104-54a0-4956-8ab8-384021f6a4c5','b437f737-aadd-47b5-a7f7-beb45dd6509b',NULL),('7884f3e4-08da-49e2-916e-9a7f274482fd','b437f737-aadd-47b5-a7f7-beb45dd6509b','','${role_view-events}','view-events','cadce104-54a0-4956-8ab8-384021f6a4c5','b437f737-aadd-47b5-a7f7-beb45dd6509b',NULL),('78b4e08c-c4b1-4dbf-9b45-8a1445d8b5e9','onesaitplatform','\0','ROLE_DATAVIEWER','ROLE_DATAVIEWER','onesaitplatform',NULL,NULL),('7afbffd8-c7d5-46d3-9477-38f43f8bf83f','b437f737-aadd-47b5-a7f7-beb45dd6509b','','${role_query-users}','query-users','cadce104-54a0-4956-8ab8-384021f6a4c5','b437f737-aadd-47b5-a7f7-beb45dd6509b',NULL),('7d4d7ebd-4af9-4a25-9150-74d0384a8572','6df83b2a-c035-439b-a6b9-658ebf055a0f','','${role_view-profile}','view-profile','cadce104-54a0-4956-8ab8-384021f6a4c5','6df83b2a-c035-439b-a6b9-658ebf055a0f',NULL),('7ed1e5f0-84a6-4cf3-abc2-478dba5d699d','98ed13b8-d6e4-44fa-820f-1967075b06ce','','${role_manage-clients}','manage-clients','cadce104-54a0-4956-8ab8-384021f6a4c5','98ed13b8-d6e4-44fa-820f-1967075b06ce',NULL),('801f7df6-0898-48f3-9c6e-c8b62ac1174c','98ed13b8-d6e4-44fa-820f-1967075b06ce','','${role_impersonation}','impersonation','cadce104-54a0-4956-8ab8-384021f6a4c5','98ed13b8-d6e4-44fa-820f-1967075b06ce',NULL),('8249e871-58a3-47b8-8dce-aaa391d6c2f8','6df83b2a-c035-439b-a6b9-658ebf055a0f','','${role_delete-account}','delete-account','cadce104-54a0-4956-8ab8-384021f6a4c5','6df83b2a-c035-439b-a6b9-658ebf055a0f',NULL),('8252a2a8-e79f-42d9-ab3c-3120b24e063f','98ed13b8-d6e4-44fa-820f-1967075b06ce','','${role_manage-users}','manage-users','cadce104-54a0-4956-8ab8-384021f6a4c5','98ed13b8-d6e4-44fa-820f-1967075b06ce',NULL),('8479a4f6-b753-45e3-913f-662f7a6584e2','04580e21-6a8f-43a9-83fd-b5dedb5a85a1','','${role_view-applications}','view-applications','onesaitplatform','04580e21-6a8f-43a9-83fd-b5dedb5a85a1',NULL),('86850c2f-bb44-4bf8-ac3c-1c312577883e','cadce104-54a0-4956-8ab8-384021f6a4c5','\0','${role_uma_authorization}','uma_authorization','cadce104-54a0-4956-8ab8-384021f6a4c5',NULL,NULL),('86d00f11-77b7-439e-8718-edbd890d049b','98ed13b8-d6e4-44fa-820f-1967075b06ce','','${role_view-authorization}','view-authorization','cadce104-54a0-4956-8ab8-384021f6a4c5','98ed13b8-d6e4-44fa-820f-1967075b06ce',NULL),('875464f0-e030-4bb2-98eb-a1e24161cc3c','onesaitplatform','\0','ROLE_DATASCIENTIST','ROLE_DATASCIENTIST','onesaitplatform',NULL,NULL),('87bf9cfe-3375-45f0-8ce5-b567e2679244','b437f737-aadd-47b5-a7f7-beb45dd6509b','','${role_view-identity-providers}','view-identity-providers','cadce104-54a0-4956-8ab8-384021f6a4c5','b437f737-aadd-47b5-a7f7-beb45dd6509b',NULL),('891d2828-9171-45e0-bad1-1b5cc8ee7a95','onesaitplatform','\0','ROLE_PLATFORM_ADMIN','ROLE_PLATFORM_ADMIN','onesaitplatform',NULL,NULL),('893b3aca-bf41-43a9-89b0-23d33dfa248f','e5567ab6-f2f6-4ff1-a13a-f0777d2290f3','',NULL,'uma_protection','onesaitplatform','e5567ab6-f2f6-4ff1-a13a-f0777d2290f3',NULL),('8a2d32f6-feec-49f1-a18a-578ebbcf9e08','b437f737-aadd-47b5-a7f7-beb45dd6509b','','${role_manage-identity-providers}','manage-identity-providers','cadce104-54a0-4956-8ab8-384021f6a4c5','b437f737-aadd-47b5-a7f7-beb45dd6509b',NULL),('8b3afeb7-87e3-4269-a2d8-48447880e215','b437f737-aadd-47b5-a7f7-beb45dd6509b','','${role_view-authorization}','view-authorization','cadce104-54a0-4956-8ab8-384021f6a4c5','b437f737-aadd-47b5-a7f7-beb45dd6509b',NULL),('8e8e7784-c989-4920-964a-8ec1b2772990','98ed13b8-d6e4-44fa-820f-1967075b06ce','','${role_view-users}','view-users','cadce104-54a0-4956-8ab8-384021f6a4c5','98ed13b8-d6e4-44fa-820f-1967075b06ce',NULL),('90009c6b-c3e4-47b0-8ef4-065f421d42e5','b437f737-aadd-47b5-a7f7-beb45dd6509b','','${role_impersonation}','impersonation','cadce104-54a0-4956-8ab8-384021f6a4c5','b437f737-aadd-47b5-a7f7-beb45dd6509b',NULL),('904c919a-c118-4bbd-b636-88e1aea8177f','04580e21-6a8f-43a9-83fd-b5dedb5a85a1','','${role_manage-consent}','manage-consent','onesaitplatform','04580e21-6a8f-43a9-83fd-b5dedb5a85a1',NULL),('940a2e89-9982-42a7-ad79-00c93198a67f','cadce104-54a0-4956-8ab8-384021f6a4c5','\0','ROLE_PARTNER','ROLE_PARTNER','cadce104-54a0-4956-8ab8-384021f6a4c5',NULL,NULL),('949303e6-03c2-4c59-8d92-83517998a070','onesaitplatform','\0','ROLE_EDGE_DEVELOPER','ROLE_EDGE_DEVELOPER','onesaitplatform',NULL,NULL),('9512e584-d929-4500-8422-c0b232706771','6df83b2a-c035-439b-a6b9-658ebf055a0f','','${role_manage-account}','manage-account','cadce104-54a0-4956-8ab8-384021f6a4c5','6df83b2a-c035-439b-a6b9-658ebf055a0f',NULL),('96113d3d-f9a8-4035-b727-2e661365cd9a','b437f737-aadd-47b5-a7f7-beb45dd6509b','','${role_manage-realm}','manage-realm','cadce104-54a0-4956-8ab8-384021f6a4c5','b437f737-aadd-47b5-a7f7-beb45dd6509b',NULL),('9c29ce2f-1d26-4510-bd8d-75b72b0fa774','cadce104-54a0-4956-8ab8-384021f6a4c5','\0','ROLE_PREVERIFIED_ADMINISTRATOR','ROLE_PREVERIFIED_ADMINISTRATOR','cadce104-54a0-4956-8ab8-384021f6a4c5',NULL,NULL),('9e828531-3ed8-402a-9932-f3bae826776f','98ed13b8-d6e4-44fa-820f-1967075b06ce','','${role_query-groups}','query-groups','cadce104-54a0-4956-8ab8-384021f6a4c5','98ed13b8-d6e4-44fa-820f-1967075b06ce',NULL),('9fa0909e-0dd4-4ca0-9ba4-9e076bd075e7','04580e21-6a8f-43a9-83fd-b5dedb5a85a1','','${role_view-profile}','view-profile','onesaitplatform','04580e21-6a8f-43a9-83fd-b5dedb5a85a1',NULL),('a3b48d44-79aa-4816-805c-0f7b368f181a','153fb7aa-5ab1-45d9-91cf-b75bf4ebfc50','','${role_query-groups}','query-groups','onesaitplatform','153fb7aa-5ab1-45d9-91cf-b75bf4ebfc50',NULL),('a494e787-27c6-4225-b89c-9c31fc4a0de1','b437f737-aadd-47b5-a7f7-beb45dd6509b','','${role_query-groups}','query-groups','cadce104-54a0-4956-8ab8-384021f6a4c5','b437f737-aadd-47b5-a7f7-beb45dd6509b',NULL),('a9cb16d1-233d-49f8-8502-bf5a21de6d6b','onesaitplatform','\0','ROLE_EDGE_USER','ROLE_EDGE_USER','onesaitplatform',NULL,NULL),('aafd4b0e-baea-48bb-8451-90d194dc0527','04580e21-6a8f-43a9-83fd-b5dedb5a85a1','','${role_manage-account-links}','manage-account-links','onesaitplatform','04580e21-6a8f-43a9-83fd-b5dedb5a85a1',NULL),('ab2d8f66-a112-430f-8f8b-cdd90e43d3de','98ed13b8-d6e4-44fa-820f-1967075b06ce','','${role_manage-authorization}','manage-authorization','cadce104-54a0-4956-8ab8-384021f6a4c5','98ed13b8-d6e4-44fa-820f-1967075b06ce',NULL),('ac9941be-38f6-498d-9c40-d5cdc4e3caa9','cadce104-54a0-4956-8ab8-384021f6a4c5','\0','ROLE_DEVELOPER','ROLE_DEVELOPER','cadce104-54a0-4956-8ab8-384021f6a4c5',NULL,NULL),('acda57d8-1f55-49d6-a7e8-6373933279de','98ed13b8-d6e4-44fa-820f-1967075b06ce','','${role_view-clients}','view-clients','cadce104-54a0-4956-8ab8-384021f6a4c5','98ed13b8-d6e4-44fa-820f-1967075b06ce',NULL),('b4e24d10-efa7-4a4b-945d-2bf38707849d','6df83b2a-c035-439b-a6b9-658ebf055a0f','','${role_manage-consent}','manage-consent','cadce104-54a0-4956-8ab8-384021f6a4c5','6df83b2a-c035-439b-a6b9-658ebf055a0f',NULL),('b5a77c61-6e87-4d00-9cc4-d1017d23e5ab','onesaitplatform','\0','ROLE_SYS_ADMIN','ROLE_SYS_ADMIN','onesaitplatform',NULL,NULL),('b8130251-ecca-466f-8066-445c9e606319','153fb7aa-5ab1-45d9-91cf-b75bf4ebfc50','','${role_view-clients}','view-clients','onesaitplatform','153fb7aa-5ab1-45d9-91cf-b75bf4ebfc50',NULL),('baac363b-29ee-41c2-b81b-bcb9b61aa0b0','onesaitplatform','\0','ROLE_USER','ROLE_USER','onesaitplatform',NULL,NULL),('bf95b99a-870c-41ec-b88e-b0d0144357bf','cadce104-54a0-4956-8ab8-384021f6a4c5','\0','ROLE_ADMINISTRATOR','ROLE_ADMINISTRATOR','cadce104-54a0-4956-8ab8-384021f6a4c5',NULL,NULL),('c54c2e61-a826-4c82-98c2-2527a4133876','153fb7aa-5ab1-45d9-91cf-b75bf4ebfc50','','${role_view-events}','view-events','onesaitplatform','153fb7aa-5ab1-45d9-91cf-b75bf4ebfc50',NULL),('c78b8923-70a4-4be5-a3db-861fbe1135aa','6df83b2a-c035-439b-a6b9-658ebf055a0f','','${role_manage-account-links}','manage-account-links','cadce104-54a0-4956-8ab8-384021f6a4c5','6df83b2a-c035-439b-a6b9-658ebf055a0f',NULL),('c9ccfe57-15a2-4ea4-b9e8-4273e10db418','98ed13b8-d6e4-44fa-820f-1967075b06ce','','${role_query-users}','query-users','cadce104-54a0-4956-8ab8-384021f6a4c5','98ed13b8-d6e4-44fa-820f-1967075b06ce',NULL),('d00bf55f-326e-4980-ba09-d90c0720cda3','cadce104-54a0-4956-8ab8-384021f6a4c5','\0','ROLE_DEVOPS','ROLE_DEVOPS','cadce104-54a0-4956-8ab8-384021f6a4c5',NULL,NULL),('d1e91c26-de21-4f66-b52a-109ab7e06ea4','cadce104-54a0-4956-8ab8-384021f6a4c5','\0','ROLE_SYS_ADMIN','ROLE_SYS_ADMIN','cadce104-54a0-4956-8ab8-384021f6a4c5',NULL,NULL),('d6794eeb-f793-41d9-9931-18d3646c446b','cadce104-54a0-4956-8ab8-384021f6a4c5','\0','${role_admin}','admin','cadce104-54a0-4956-8ab8-384021f6a4c5',NULL,NULL),('d9170cac-c860-4a2c-96d3-5ae19202e6be','153fb7aa-5ab1-45d9-91cf-b75bf4ebfc50','','${role_query-realms}','query-realms','onesaitplatform','153fb7aa-5ab1-45d9-91cf-b75bf4ebfc50',NULL),('d93c8925-74ec-43db-8486-d61c64d9d94f','41853b3e-5c99-496a-9fce-fd1c9d496c71','','${role_read-token}','read-token','onesaitplatform','41853b3e-5c99-496a-9fce-fd1c9d496c71',NULL),('da2a6267-d91d-43a8-a9e7-ca9f96b5f49e','onesaitplatform','\0','ROLE_DEVOPS','ROLE_DEVOPS','onesaitplatform',NULL,NULL),('da8113f9-b0e4-4d39-868e-cefe50b7860f','cadce104-54a0-4956-8ab8-384021f6a4c5','\0','ROLE_PLATFORM_ADMIN','ROLE_PLATFORM_ADMIN','cadce104-54a0-4956-8ab8-384021f6a4c5',NULL,NULL),('dd6792de-879b-4221-a8c7-40ae535beb33','cadce104-54a0-4956-8ab8-384021f6a4c5','\0','ROLE_EDGE_ADMINISTRATOR','ROLE_EDGE_ADMINISTRATOR','cadce104-54a0-4956-8ab8-384021f6a4c5',NULL,NULL),('e00a45e0-5049-42dc-9aac-81a89d9e8531','cadce104-54a0-4956-8ab8-384021f6a4c5','\0','${role_offline-access}','offline_access','cadce104-54a0-4956-8ab8-384021f6a4c5',NULL,NULL),('e42a404a-2a57-4843-93bd-b9cd2b4b6cfc','onesaitplatform','\0','ROLE_OPERATIONS','ROLE_OPERATIONS','onesaitplatform',NULL,NULL),('e508fd6a-627f-4d2a-8ff6-672f9346ca0a','04580e21-6a8f-43a9-83fd-b5dedb5a85a1','','${role_delete-account}','delete-account','onesaitplatform','04580e21-6a8f-43a9-83fd-b5dedb5a85a1',NULL),('e5e05273-f065-4801-8b6a-e759dfd0ea25','04580e21-6a8f-43a9-83fd-b5dedb5a85a1','','${role_view-consent}','view-consent','onesaitplatform','04580e21-6a8f-43a9-83fd-b5dedb5a85a1',NULL),('ed0dacfa-2a2e-4559-a305-76f669bf9f50','98ed13b8-d6e4-44fa-820f-1967075b06ce','','${role_manage-events}','manage-events','cadce104-54a0-4956-8ab8-384021f6a4c5','98ed13b8-d6e4-44fa-820f-1967075b06ce',NULL),('ed8eb505-0a8b-4e09-8881-02ab33cc22e0','6df83b2a-c035-439b-a6b9-658ebf055a0f','','${role_view-applications}','view-applications','cadce104-54a0-4956-8ab8-384021f6a4c5','6df83b2a-c035-439b-a6b9-658ebf055a0f',NULL),('ed9c6525-62ba-4598-a263-d809ece9301f','153fb7aa-5ab1-45d9-91cf-b75bf4ebfc50','','${role_manage-identity-providers}','manage-identity-providers','onesaitplatform','153fb7aa-5ab1-45d9-91cf-b75bf4ebfc50',NULL),('ee7c87a4-a519-469b-bb5c-ca335d8ab689','b437f737-aadd-47b5-a7f7-beb45dd6509b','','${role_query-realms}','query-realms','cadce104-54a0-4956-8ab8-384021f6a4c5','b437f737-aadd-47b5-a7f7-beb45dd6509b',NULL),('efaeb41d-124b-4cf5-aeb4-8e047a6f361d','onesaitplatform','\0','ROLE_PARTNER','ROLE_PARTNER','onesaitplatform',NULL,NULL),('f089468b-7691-4e64-a643-14e57176225f','onesaitplatform','\0','ROLE_ADMINISTRATOR','ROLE_ADMINISTRATOR','onesaitplatform',NULL,NULL),('f1841492-7c83-416a-a28c-3b142f1e025c','153fb7aa-5ab1-45d9-91cf-b75bf4ebfc50','','${role_query-clients}','query-clients','onesaitplatform','153fb7aa-5ab1-45d9-91cf-b75bf4ebfc50',NULL),('f3a33e39-11d5-4371-bfe1-9d56d909659a','98ed13b8-d6e4-44fa-820f-1967075b06ce','','${role_query-clients}','query-clients','cadce104-54a0-4956-8ab8-384021f6a4c5','98ed13b8-d6e4-44fa-820f-1967075b06ce',NULL),('f78e50c0-963e-4546-9086-b4066a214b52','75df4a8f-2a6e-49f3-9a96-e57a1a089a6c','','${role_read-token}','read-token','cadce104-54a0-4956-8ab8-384021f6a4c5','75df4a8f-2a6e-49f3-9a96-e57a1a089a6c',NULL),('f86072ce-d3dc-4ae2-a661-e8eadce317a5','153fb7aa-5ab1-45d9-91cf-b75bf4ebfc50','','${role_create-client}','create-client','onesaitplatform','153fb7aa-5ab1-45d9-91cf-b75bf4ebfc50',NULL),('f8a482fb-98c7-4b2a-96a0-6a4d3fd643a3','cadce104-54a0-4956-8ab8-384021f6a4c5','\0','${role_default-roles}','default-roles-master','cadce104-54a0-4956-8ab8-384021f6a4c5',NULL,NULL),('fc0f07f5-a090-46ba-bdcf-33a84b0fb373','onesaitplatform','\0','${role_default-roles}','default-roles-onesaitplatform','onesaitplatform',NULL,NULL),('fc472a71-28f8-46b1-80c7-675523e3f684','onesaitplatform','\0','ROLE_EDGE_ADMINISTRATOR','ROLE_EDGE_ADMINISTRATOR','onesaitplatform',NULL,NULL),('fee2a4b2-650e-4f58-8efe-96ed811af9b6','153fb7aa-5ab1-45d9-91cf-b75bf4ebfc50','','${role_view-users}','view-users','onesaitplatform','153fb7aa-5ab1-45d9-91cf-b75bf4ebfc50',NULL);
/*!40000 ALTER TABLE `keycloak_role` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migration_model` (
  `ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `VERSION` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UPDATE_TIME` bigint(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`ID`),
  KEY `IDX_UPDATE_TIME` (`UPDATE_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `migration_model` WRITE;
/*!40000 ALTER TABLE `migration_model` DISABLE KEYS */;
INSERT INTO `migration_model` VALUES ('w195p','21.1.1',1779581437);
/*!40000 ALTER TABLE `migration_model` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offline_client_session` (
  `USER_SESSION_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CLIENT_ID` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `OFFLINE_FLAG` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `TIMESTAMP` int(11) DEFAULT NULL,
  `DATA` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CLIENT_STORAGE_PROVIDER` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'local',
  `EXTERNAL_CLIENT_ID` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'local',
  PRIMARY KEY (`USER_SESSION_ID`,`CLIENT_ID`,`CLIENT_STORAGE_PROVIDER`,`EXTERNAL_CLIENT_ID`,`OFFLINE_FLAG`),
  KEY `IDX_US_SESS_ID_ON_CL_SESS` (`USER_SESSION_ID`),
  KEY `IDX_OFFLINE_CSS_PRELOAD` (`CLIENT_ID`,`OFFLINE_FLAG`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `offline_client_session` WRITE;
/*!40000 ALTER TABLE `offline_client_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `offline_client_session` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offline_user_session` (
  `USER_SESSION_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `USER_ID` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `REALM_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CREATED_ON` int(11) NOT NULL,
  `OFFLINE_FLAG` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `DATA` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `LAST_SESSION_REFRESH` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`USER_SESSION_ID`,`OFFLINE_FLAG`),
  KEY `IDX_OFFLINE_USS_CREATEDON` (`CREATED_ON`),
  KEY `IDX_OFFLINE_USS_PRELOAD` (`OFFLINE_FLAG`,`CREATED_ON`,`USER_SESSION_ID`),
  KEY `IDX_OFFLINE_USS_BY_USER` (`USER_ID`,`REALM_ID`,`OFFLINE_FLAG`),
  KEY `IDX_OFFLINE_USS_BY_USERSESS` (`REALM_ID`,`OFFLINE_FLAG`,`USER_SESSION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `offline_user_session` WRITE;
/*!40000 ALTER TABLE `offline_user_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `offline_user_session` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `policy_config` (
  `POLICY_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `NAME` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `VALUE` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`POLICY_ID`,`NAME`),
  CONSTRAINT `FKDC34197CF864C4E43` FOREIGN KEY (`POLICY_ID`) REFERENCES `resource_server_policy` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `policy_config` WRITE;
/*!40000 ALTER TABLE `policy_config` DISABLE KEYS */;
INSERT INTO `policy_config` VALUES ('55279fac-62a3-4396-b3af-f0768b1f299d','code','// by default, grants any permission associated with this policy\n$evaluation.grant();\n'),('59604f2b-440d-4bed-918f-85b4d1dd6ddf','defaultResourceType','urn:onesaitplatform:resources:default');
/*!40000 ALTER TABLE `policy_config` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `protocol_mapper` (
  `ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `NAME` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `PROTOCOL` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `PROTOCOL_MAPPER_NAME` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CLIENT_ID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CLIENT_SCOPE_ID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_PROTOCOL_MAPPER_CLIENT` (`CLIENT_ID`),
  KEY `IDX_CLSCOPE_PROTMAP` (`CLIENT_SCOPE_ID`),
  CONSTRAINT `FK_CLI_SCOPE_MAPPER` FOREIGN KEY (`CLIENT_SCOPE_ID`) REFERENCES `client_scope` (`ID`),
  CONSTRAINT `FK_PCM_REALM` FOREIGN KEY (`CLIENT_ID`) REFERENCES `client` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `protocol_mapper` WRITE;
/*!40000 ALTER TABLE `protocol_mapper` DISABLE KEYS */;
INSERT INTO `protocol_mapper` VALUES ('046ae6f4-84a4-424f-bb7b-8bb89148620a','role list','saml','saml-role-list-mapper',NULL,'89a0577a-53a3-4019-9d58-5c3d08875909'),('0470198d-7d40-48e0-8eda-2737d3566569','zoneinfo','openid-connect','oidc-usermodel-attribute-mapper',NULL,'d933f55b-3263-46b8-ab62-a92c9f4ad084'),('069cd906-7a8e-4d79-b6d6-1e2efde5cb4a','tenant','openid-connect','oidc-usermodel-attribute-mapper',NULL,'2cc32519-8821-47d6-9c75-8847561e0c6c'),('0931ef1e-4694-49cd-acee-2a9079044352','audience resolve','openid-connect','oidc-audience-resolve-mapper','7a104b35-318c-492d-9c3d-784d22baa735',NULL),('0d59ad9e-a658-41bf-8662-641161c93398','role list','saml','saml-role-list-mapper',NULL,'64f51978-8f7a-4b47-a1b9-77e9694d1f70'),('0fad9dc8-934d-44d2-a749-f9b48b9a65a4','preferred_username','openid-connect','oidc-usermodel-attribute-mapper',NULL,'2cc32519-8821-47d6-9c75-8847561e0c6c'),('0fdb2cde-df5a-4d67-bf72-9f1ec2d209da','phone number','openid-connect','oidc-usermodel-attribute-mapper',NULL,'f27a7b40-dbf9-4a2a-b411-29c1f7a06804'),('139e6373-f78b-4dfe-877f-7050d6ca4aee','full name','openid-connect','oidc-full-name-mapper',NULL,'1e3a8748-b5e0-42e2-8456-c4dfaa9fc46f'),('16ad9bd5-7fc1-4dea-b088-66858456c169','Client IP Address','openid-connect','oidc-usersessionmodel-note-mapper','e5567ab6-f2f6-4ff1-a13a-f0777d2290f3',NULL),('1ca70bc6-3383-4edd-97c9-e5e8fb7a766b','locale','openid-connect','oidc-usermodel-attribute-mapper',NULL,'1e3a8748-b5e0-42e2-8456-c4dfaa9fc46f'),('1cca9515-3950-45d3-843c-6db4c404a248','locale','openid-connect','oidc-usermodel-attribute-mapper','fbb63a4e-569a-4579-86fa-4f2cb6569836',NULL),('1f3ad909-06c5-4394-b421-32f7ac5801fb','name','openid-connect','oidc-usermodel-attribute-mapper',NULL,'2cc32519-8821-47d6-9c75-8847561e0c6c'),('1fc4b7bf-d93e-4604-a851-b9deac6cef30','Client ID','openid-connect','oidc-usersessionmodel-note-mapper','e5567ab6-f2f6-4ff1-a13a-f0777d2290f3',NULL),('2057f888-6ef2-4cf1-abae-be698141d26d','updated at','openid-connect','oidc-usermodel-attribute-mapper',NULL,'1e3a8748-b5e0-42e2-8456-c4dfaa9fc46f'),('23c7cad3-3268-45ab-882d-0b390b21f41c','locale','openid-connect','oidc-usermodel-attribute-mapper','540bb75a-fb13-4add-ac4a-a682002355e2',NULL),('28e21222-e60b-4505-8f4f-e583b0e119d3','upn','openid-connect','oidc-usermodel-property-mapper',NULL,'e0372e79-7d76-4ff2-9a78-6264cf470acc'),('2c635c6b-74aa-4118-9d05-9725b384a3bd','gender','openid-connect','oidc-usermodel-attribute-mapper',NULL,'1e3a8748-b5e0-42e2-8456-c4dfaa9fc46f'),('3895fb41-f8cf-4041-b14f-b79b4401e36a','verticals','openid-connect','oidc-usermodel-attribute-mapper',NULL,'2cc32519-8821-47d6-9c75-8847561e0c6c'),('3bdff566-2228-4271-8d44-c8b0c0d30862','audience resolve','openid-connect','oidc-audience-resolve-mapper','d9523613-ef9c-43f1-a637-9a09e56d6be0',NULL),('4e86956e-2a0c-432a-bcdb-3663487a82eb','birthdate','openid-connect','oidc-usermodel-attribute-mapper',NULL,'d933f55b-3263-46b8-ab62-a92c9f4ad084'),('4eb98075-b007-47f4-b475-044716876417','acr loa level','openid-connect','oidc-acr-mapper',NULL,'260ef9f7-c1b2-4f7e-a4cf-2567b9f035e3'),('516aff27-3a21-4dde-aeaf-ea718b3bd8b8','full name','openid-connect','oidc-full-name-mapper',NULL,'d933f55b-3263-46b8-ab62-a92c9f4ad084'),('52bfd487-57cc-4009-9eff-eebdb7816182','email','openid-connect','oidc-usermodel-property-mapper',NULL,'c55b9a6d-dff3-41dd-b9ee-d19c2e329a26'),('55e51ced-88de-4c51-a64e-63c04ca47cd6','vertical','openid-connect','oidc-usermodel-attribute-mapper',NULL,'2cc32519-8821-47d6-9c75-8847561e0c6c'),('5aaca68e-9f1d-4290-8000-00e9fa274d8a','groups','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'e0372e79-7d76-4ff2-9a78-6264cf470acc'),('5b8b0fee-f700-4515-b147-1bfdf3434b5b','zoneinfo','openid-connect','oidc-usermodel-attribute-mapper',NULL,'1e3a8748-b5e0-42e2-8456-c4dfaa9fc46f'),('5dc7c6fb-35dc-4473-a8aa-a0d6425f128b','principal','openid-connect','oidc-usermodel-attribute-mapper',NULL,'2cc32519-8821-47d6-9c75-8847561e0c6c'),('5fe84fd1-850d-446c-894a-7dd8a7cf89bd','username','openid-connect','oidc-usermodel-property-mapper',NULL,'d933f55b-3263-46b8-ab62-a92c9f4ad084'),('6380aed8-4a1b-47f3-9457-1494584a39c9','Client Host','openid-connect','oidc-usersessionmodel-note-mapper','e5567ab6-f2f6-4ff1-a13a-f0777d2290f3',NULL),('650bd353-f5c9-4d0b-aa1c-17954205296e','authorities','openid-connect','oidc-usermodel-attribute-mapper',NULL,'2cc32519-8821-47d6-9c75-8847561e0c6c'),('65c891c5-9240-46c0-bd53-a9e18a5c9d72','updated at','openid-connect','oidc-usermodel-attribute-mapper',NULL,'d933f55b-3263-46b8-ab62-a92c9f4ad084'),('6f0617f8-bd3b-4286-bb96-b57f38cb9e63','given name','openid-connect','oidc-usermodel-property-mapper',NULL,'d933f55b-3263-46b8-ab62-a92c9f4ad084'),('70ef2e49-9cee-4bc1-965e-8e7c55828354','address','openid-connect','oidc-address-mapper',NULL,'e2f3db6b-3d7b-4d39-8425-67b7ab8307f5'),('70ff337e-4f15-4ef4-9670-2efed8805ddb','nickname','openid-connect','oidc-usermodel-attribute-mapper',NULL,'1e3a8748-b5e0-42e2-8456-c4dfaa9fc46f'),('728a57a5-d7f4-45f2-a4fb-b8bce49a2716','phone number','openid-connect','oidc-usermodel-attribute-mapper',NULL,'d03d070b-9e65-4606-80bd-89bb84c6f559'),('7752a4db-887b-4cd9-bb02-67bad3d7844c','phone number verified','openid-connect','oidc-usermodel-attribute-mapper',NULL,'d03d070b-9e65-4606-80bd-89bb84c6f559'),('793c083f-24ec-4ba7-baed-e716131147a7','middle name','openid-connect','oidc-usermodel-attribute-mapper',NULL,'1e3a8748-b5e0-42e2-8456-c4dfaa9fc46f'),('7ab3181d-ce3a-43a5-879b-665495f1f9d0','realm roles','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'21db3614-01d1-4b25-a233-f027b93c4b1e'),('7da8ac78-7d70-4460-a4c4-415eb3c9666b','email','openid-connect','oidc-usermodel-property-mapper',NULL,'2cc32519-8821-47d6-9c75-8847561e0c6c'),('7e287f33-b91e-4aae-9d74-00e7f1dca25d','website','openid-connect','oidc-usermodel-attribute-mapper',NULL,'1e3a8748-b5e0-42e2-8456-c4dfaa9fc46f'),('85baa053-5b72-4799-b227-0c3f21f441e9','address','openid-connect','oidc-address-mapper',NULL,'fa9dbcf3-ed64-465f-9d1d-0a650d5023c8'),('87ad95bf-4303-4c47-a972-b4d495bfb5b3','acr loa level','openid-connect','oidc-acr-mapper',NULL,'14a71407-3857-4bd6-b9f9-0745f8452dbc'),('891ccd72-abc3-46dc-9970-6312b4fb17ec','gender','openid-connect','oidc-usermodel-attribute-mapper',NULL,'d933f55b-3263-46b8-ab62-a92c9f4ad084'),('8d8ccffd-5192-4cbe-83ec-036f2351fa36','profile','openid-connect','oidc-usermodel-attribute-mapper',NULL,'d933f55b-3263-46b8-ab62-a92c9f4ad084'),('8e036514-fa1c-45d6-93aa-1d12e2f08f7d','username','openid-connect','oidc-usermodel-property-mapper',NULL,'2cc32519-8821-47d6-9c75-8847561e0c6c'),('905f1489-8fb2-48d5-97f4-fe61f066e3bd','profile','openid-connect','oidc-usermodel-attribute-mapper',NULL,'1e3a8748-b5e0-42e2-8456-c4dfaa9fc46f'),('9444a540-4010-4d7d-9977-c992b8c94ee2','client roles','openid-connect','oidc-usermodel-client-role-mapper',NULL,'21db3614-01d1-4b25-a233-f027b93c4b1e'),('94bc3dbd-6529-4d0d-b844-1e703e2dbf09','picture','openid-connect','oidc-usermodel-attribute-mapper',NULL,'1e3a8748-b5e0-42e2-8456-c4dfaa9fc46f'),('a2a912b5-cfe5-484f-9523-a2e3f563e756','given_name','openid-connect','oidc-usermodel-attribute-mapper',NULL,'2cc32519-8821-47d6-9c75-8847561e0c6c'),('a2ee4571-d0de-46d5-8af2-55e354b42a01','role','openid-connect','oidc-usermodel-attribute-mapper',NULL,'2cc32519-8821-47d6-9c75-8847561e0c6c'),('a5ff2f23-be90-40f8-be8f-e18219669639','family name','openid-connect','oidc-usermodel-property-mapper',NULL,'1e3a8748-b5e0-42e2-8456-c4dfaa9fc46f'),('aff1b7d8-e468-4743-a70d-de2fb7241e96','audience resolve','openid-connect','oidc-audience-resolve-mapper',NULL,'b64be050-47b4-49be-bc82-395725648497'),('b020be7d-37f8-4345-84f7-6455d54d56a7','middle name','openid-connect','oidc-usermodel-attribute-mapper',NULL,'d933f55b-3263-46b8-ab62-a92c9f4ad084'),('b034058c-7a5c-4b61-813f-a2646435f3d4','allowed web origins','openid-connect','oidc-allowed-origins-mapper',NULL,'edd980cc-997a-478e-a198-6aacc3446e01'),('b3e0adc6-3dcb-4f72-8008-71329f83aeb2','family name','openid-connect','oidc-usermodel-property-mapper',NULL,'d933f55b-3263-46b8-ab62-a92c9f4ad084'),('baeb4318-4f74-4916-84e5-1a50476bb58a','locale','openid-connect','oidc-usermodel-attribute-mapper',NULL,'d933f55b-3263-46b8-ab62-a92c9f4ad084'),('c32db8bb-6e43-49a5-9393-be42fcee42cf','upn','openid-connect','oidc-usermodel-property-mapper',NULL,'ecd471d5-020c-4c18-ac02-d5eca98613d9'),('cee6a2a5-b57c-4693-8243-07358dab2736','realm roles','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'b64be050-47b4-49be-bc82-395725648497'),('d0a46b6f-e66e-4859-9ccc-cda4647e081a','allowed web origins','openid-connect','oidc-allowed-origins-mapper',NULL,'6d04f5c5-6255-4c43-b8ff-aac92b7749fc'),('d2d50cd2-781f-43d6-a3e9-be13ed39b57b','birthdate','openid-connect','oidc-usermodel-attribute-mapper',NULL,'1e3a8748-b5e0-42e2-8456-c4dfaa9fc46f'),('d6771aca-bccf-417b-b905-efac2b63d50e','email verified','openid-connect','oidc-usermodel-property-mapper',NULL,'9068e53c-57a8-4227-a463-178fd9d2f938'),('d769d9a7-7474-4434-aa5e-991ee87fc368','given name','openid-connect','oidc-usermodel-property-mapper',NULL,'1e3a8748-b5e0-42e2-8456-c4dfaa9fc46f'),('d7f3496b-c9e7-4946-83eb-ee2b7b5d1fdb','website','openid-connect','oidc-usermodel-attribute-mapper',NULL,'d933f55b-3263-46b8-ab62-a92c9f4ad084'),('de427038-9bb7-42b3-9a24-3489ac847ae6','picture','openid-connect','oidc-usermodel-attribute-mapper',NULL,'d933f55b-3263-46b8-ab62-a92c9f4ad084'),('e038cbb1-2b61-4d0e-8d6b-8ddb9d980df3','apps','openid-connect','oidc-usermodel-attribute-mapper',NULL,'2cc32519-8821-47d6-9c75-8847561e0c6c'),('e0be1ce8-044b-4faf-a538-1b547949f929','username','openid-connect','oidc-usermodel-property-mapper',NULL,'1e3a8748-b5e0-42e2-8456-c4dfaa9fc46f'),('e302eaaa-17c3-43ad-91f1-fa3923a039d0','nickname','openid-connect','oidc-usermodel-attribute-mapper',NULL,'d933f55b-3263-46b8-ab62-a92c9f4ad084'),('ead4ba96-8287-4591-bd4c-40f4b92adbfd','groups','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'ecd471d5-020c-4c18-ac02-d5eca98613d9'),('eb0d3d37-de96-4693-98cc-54d4f4a5a346','client roles','openid-connect','oidc-usermodel-client-role-mapper',NULL,'b64be050-47b4-49be-bc82-395725648497'),('ee93a114-385c-4f6d-9238-36c1ca05d880','email','openid-connect','oidc-usermodel-property-mapper',NULL,'9068e53c-57a8-4227-a463-178fd9d2f938'),('f640bc73-f1a1-4f17-96db-84b91817c035','audience resolve','openid-connect','oidc-audience-resolve-mapper',NULL,'21db3614-01d1-4b25-a233-f027b93c4b1e'),('f79c754d-6998-4e2f-b6aa-557c5ba5afc5','phone number verified','openid-connect','oidc-usermodel-attribute-mapper',NULL,'f27a7b40-dbf9-4a2a-b411-29c1f7a06804'),('fab2f87e-4335-4fb5-8e56-7c42ebf5b4a3','email verified','openid-connect','oidc-usermodel-property-mapper',NULL,'c55b9a6d-dff3-41dd-b9ee-d19c2e329a26');
/*!40000 ALTER TABLE `protocol_mapper` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `protocol_mapper_config` (
  `PROTOCOL_MAPPER_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `VALUE` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`PROTOCOL_MAPPER_ID`,`NAME`),
  CONSTRAINT `FK_PMCONFIG` FOREIGN KEY (`PROTOCOL_MAPPER_ID`) REFERENCES `protocol_mapper` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `protocol_mapper_config` WRITE;
/*!40000 ALTER TABLE `protocol_mapper_config` DISABLE KEYS */;
INSERT INTO `protocol_mapper_config` VALUES ('046ae6f4-84a4-424f-bb7b-8bb89148620a','Role','attribute.name'),('046ae6f4-84a4-424f-bb7b-8bb89148620a','Basic','attribute.nameformat'),('046ae6f4-84a4-424f-bb7b-8bb89148620a','false','single'),('0470198d-7d40-48e0-8eda-2737d3566569','true','access.token.claim'),('0470198d-7d40-48e0-8eda-2737d3566569','zoneinfo','claim.name'),('0470198d-7d40-48e0-8eda-2737d3566569','true','id.token.claim'),('0470198d-7d40-48e0-8eda-2737d3566569','String','jsonType.label'),('0470198d-7d40-48e0-8eda-2737d3566569','zoneinfo','user.attribute'),('0470198d-7d40-48e0-8eda-2737d3566569','true','userinfo.token.claim'),('069cd906-7a8e-4d79-b6d6-1e2efde5cb4a','true','access.token.claim'),('069cd906-7a8e-4d79-b6d6-1e2efde5cb4a','tenant','claim.name'),('069cd906-7a8e-4d79-b6d6-1e2efde5cb4a','true','id.token.claim'),('069cd906-7a8e-4d79-b6d6-1e2efde5cb4a','tenant','user.attribute'),('069cd906-7a8e-4d79-b6d6-1e2efde5cb4a','true','userinfo.token.claim'),('0d59ad9e-a658-41bf-8662-641161c93398','Role','attribute.name'),('0d59ad9e-a658-41bf-8662-641161c93398','Basic','attribute.nameformat'),('0d59ad9e-a658-41bf-8662-641161c93398','false','single'),('0fad9dc8-934d-44d2-a749-f9b48b9a65a4','true','access.token.claim'),('0fad9dc8-934d-44d2-a749-f9b48b9a65a4','preferred_username','claim.name'),('0fad9dc8-934d-44d2-a749-f9b48b9a65a4','true','id.token.claim'),('0fad9dc8-934d-44d2-a749-f9b48b9a65a4','String','jsonType.label'),('0fad9dc8-934d-44d2-a749-f9b48b9a65a4','preferredUsername','user.attribute'),('0fad9dc8-934d-44d2-a749-f9b48b9a65a4','true','userinfo.token.claim'),('0fdb2cde-df5a-4d67-bf72-9f1ec2d209da','true','access.token.claim'),('0fdb2cde-df5a-4d67-bf72-9f1ec2d209da','phone_number','claim.name'),('0fdb2cde-df5a-4d67-bf72-9f1ec2d209da','true','id.token.claim'),('0fdb2cde-df5a-4d67-bf72-9f1ec2d209da','String','jsonType.label'),('0fdb2cde-df5a-4d67-bf72-9f1ec2d209da','phoneNumber','user.attribute'),('0fdb2cde-df5a-4d67-bf72-9f1ec2d209da','true','userinfo.token.claim'),('139e6373-f78b-4dfe-877f-7050d6ca4aee','true','access.token.claim'),('139e6373-f78b-4dfe-877f-7050d6ca4aee','true','id.token.claim'),('139e6373-f78b-4dfe-877f-7050d6ca4aee','true','userinfo.token.claim'),('16ad9bd5-7fc1-4dea-b088-66858456c169','true','access.token.claim'),('16ad9bd5-7fc1-4dea-b088-66858456c169','clientAddress','claim.name'),('16ad9bd5-7fc1-4dea-b088-66858456c169','true','id.token.claim'),('16ad9bd5-7fc1-4dea-b088-66858456c169','String','jsonType.label'),('16ad9bd5-7fc1-4dea-b088-66858456c169','clientAddress','user.session.note'),('1ca70bc6-3383-4edd-97c9-e5e8fb7a766b','true','access.token.claim'),('1ca70bc6-3383-4edd-97c9-e5e8fb7a766b','locale','claim.name'),('1ca70bc6-3383-4edd-97c9-e5e8fb7a766b','true','id.token.claim'),('1ca70bc6-3383-4edd-97c9-e5e8fb7a766b','String','jsonType.label'),('1ca70bc6-3383-4edd-97c9-e5e8fb7a766b','locale','user.attribute'),('1ca70bc6-3383-4edd-97c9-e5e8fb7a766b','true','userinfo.token.claim'),('1cca9515-3950-45d3-843c-6db4c404a248','true','access.token.claim'),('1cca9515-3950-45d3-843c-6db4c404a248','locale','claim.name'),('1cca9515-3950-45d3-843c-6db4c404a248','true','id.token.claim'),('1cca9515-3950-45d3-843c-6db4c404a248','String','jsonType.label'),('1cca9515-3950-45d3-843c-6db4c404a248','locale','user.attribute'),('1cca9515-3950-45d3-843c-6db4c404a248','true','userinfo.token.claim'),('1f3ad909-06c5-4394-b421-32f7ac5801fb','true','access.token.claim'),('1f3ad909-06c5-4394-b421-32f7ac5801fb','name','claim.name'),('1f3ad909-06c5-4394-b421-32f7ac5801fb','true','id.token.claim'),('1f3ad909-06c5-4394-b421-32f7ac5801fb','name','user.attribute'),('1f3ad909-06c5-4394-b421-32f7ac5801fb','true','userinfo.token.claim'),('1fc4b7bf-d93e-4604-a851-b9deac6cef30','true','access.token.claim'),('1fc4b7bf-d93e-4604-a851-b9deac6cef30','client_id','claim.name'),('1fc4b7bf-d93e-4604-a851-b9deac6cef30','true','id.token.claim'),('1fc4b7bf-d93e-4604-a851-b9deac6cef30','String','jsonType.label'),('1fc4b7bf-d93e-4604-a851-b9deac6cef30','client_id','user.session.note'),('2057f888-6ef2-4cf1-abae-be698141d26d','true','access.token.claim'),('2057f888-6ef2-4cf1-abae-be698141d26d','updated_at','claim.name'),('2057f888-6ef2-4cf1-abae-be698141d26d','true','id.token.claim'),('2057f888-6ef2-4cf1-abae-be698141d26d','long','jsonType.label'),('2057f888-6ef2-4cf1-abae-be698141d26d','updatedAt','user.attribute'),('2057f888-6ef2-4cf1-abae-be698141d26d','true','userinfo.token.claim'),('23c7cad3-3268-45ab-882d-0b390b21f41c','true','access.token.claim'),('23c7cad3-3268-45ab-882d-0b390b21f41c','locale','claim.name'),('23c7cad3-3268-45ab-882d-0b390b21f41c','true','id.token.claim'),('23c7cad3-3268-45ab-882d-0b390b21f41c','String','jsonType.label'),('23c7cad3-3268-45ab-882d-0b390b21f41c','locale','user.attribute'),('23c7cad3-3268-45ab-882d-0b390b21f41c','true','userinfo.token.claim'),('28e21222-e60b-4505-8f4f-e583b0e119d3','true','access.token.claim'),('28e21222-e60b-4505-8f4f-e583b0e119d3','upn','claim.name'),('28e21222-e60b-4505-8f4f-e583b0e119d3','true','id.token.claim'),('28e21222-e60b-4505-8f4f-e583b0e119d3','String','jsonType.label'),('28e21222-e60b-4505-8f4f-e583b0e119d3','username','user.attribute'),('28e21222-e60b-4505-8f4f-e583b0e119d3','true','userinfo.token.claim'),('2c635c6b-74aa-4118-9d05-9725b384a3bd','true','access.token.claim'),('2c635c6b-74aa-4118-9d05-9725b384a3bd','gender','claim.name'),('2c635c6b-74aa-4118-9d05-9725b384a3bd','true','id.token.claim'),('2c635c6b-74aa-4118-9d05-9725b384a3bd','String','jsonType.label'),('2c635c6b-74aa-4118-9d05-9725b384a3bd','gender','user.attribute'),('2c635c6b-74aa-4118-9d05-9725b384a3bd','true','userinfo.token.claim'),('3895fb41-f8cf-4041-b14f-b79b4401e36a','true','access.token.claim'),('3895fb41-f8cf-4041-b14f-b79b4401e36a','verticals','claim.name'),('3895fb41-f8cf-4041-b14f-b79b4401e36a','true','id.token.claim'),('3895fb41-f8cf-4041-b14f-b79b4401e36a','JSON','jsonType.label'),('3895fb41-f8cf-4041-b14f-b79b4401e36a','verticals','user.attribute'),('3895fb41-f8cf-4041-b14f-b79b4401e36a','true','userinfo.token.claim'),('4e86956e-2a0c-432a-bcdb-3663487a82eb','true','access.token.claim'),('4e86956e-2a0c-432a-bcdb-3663487a82eb','birthdate','claim.name'),('4e86956e-2a0c-432a-bcdb-3663487a82eb','true','id.token.claim'),('4e86956e-2a0c-432a-bcdb-3663487a82eb','String','jsonType.label'),('4e86956e-2a0c-432a-bcdb-3663487a82eb','birthdate','user.attribute'),('4e86956e-2a0c-432a-bcdb-3663487a82eb','true','userinfo.token.claim'),('4eb98075-b007-47f4-b475-044716876417','true','access.token.claim'),('4eb98075-b007-47f4-b475-044716876417','true','id.token.claim'),('516aff27-3a21-4dde-aeaf-ea718b3bd8b8','true','access.token.claim'),('516aff27-3a21-4dde-aeaf-ea718b3bd8b8','true','id.token.claim'),('516aff27-3a21-4dde-aeaf-ea718b3bd8b8','true','userinfo.token.claim'),('52bfd487-57cc-4009-9eff-eebdb7816182','true','access.token.claim'),('52bfd487-57cc-4009-9eff-eebdb7816182','email','claim.name'),('52bfd487-57cc-4009-9eff-eebdb7816182','true','id.token.claim'),('52bfd487-57cc-4009-9eff-eebdb7816182','String','jsonType.label'),('52bfd487-57cc-4009-9eff-eebdb7816182','email','user.attribute'),('52bfd487-57cc-4009-9eff-eebdb7816182','true','userinfo.token.claim'),('55e51ced-88de-4c51-a64e-63c04ca47cd6','true','access.token.claim'),('55e51ced-88de-4c51-a64e-63c04ca47cd6','vertical','claim.name'),('55e51ced-88de-4c51-a64e-63c04ca47cd6','true','id.token.claim'),('55e51ced-88de-4c51-a64e-63c04ca47cd6','vertical','user.attribute'),('55e51ced-88de-4c51-a64e-63c04ca47cd6','true','userinfo.token.claim'),('5aaca68e-9f1d-4290-8000-00e9fa274d8a','true','access.token.claim'),('5aaca68e-9f1d-4290-8000-00e9fa274d8a','groups','claim.name'),('5aaca68e-9f1d-4290-8000-00e9fa274d8a','true','id.token.claim'),('5aaca68e-9f1d-4290-8000-00e9fa274d8a','String','jsonType.label'),('5aaca68e-9f1d-4290-8000-00e9fa274d8a','true','multivalued'),('5aaca68e-9f1d-4290-8000-00e9fa274d8a','foo','user.attribute'),('5b8b0fee-f700-4515-b147-1bfdf3434b5b','true','access.token.claim'),('5b8b0fee-f700-4515-b147-1bfdf3434b5b','zoneinfo','claim.name'),('5b8b0fee-f700-4515-b147-1bfdf3434b5b','true','id.token.claim'),('5b8b0fee-f700-4515-b147-1bfdf3434b5b','String','jsonType.label'),('5b8b0fee-f700-4515-b147-1bfdf3434b5b','zoneinfo','user.attribute'),('5b8b0fee-f700-4515-b147-1bfdf3434b5b','true','userinfo.token.claim'),('5dc7c6fb-35dc-4473-a8aa-a0d6425f128b','true','access.token.claim'),('5dc7c6fb-35dc-4473-a8aa-a0d6425f128b','principal','claim.name'),('5dc7c6fb-35dc-4473-a8aa-a0d6425f128b','true','id.token.claim'),('5dc7c6fb-35dc-4473-a8aa-a0d6425f128b','String','jsonType.label'),('5dc7c6fb-35dc-4473-a8aa-a0d6425f128b','username','user.attribute'),('5dc7c6fb-35dc-4473-a8aa-a0d6425f128b','true','userinfo.token.claim'),('5fe84fd1-850d-446c-894a-7dd8a7cf89bd','true','access.token.claim'),('5fe84fd1-850d-446c-894a-7dd8a7cf89bd','preferred_username','claim.name'),('5fe84fd1-850d-446c-894a-7dd8a7cf89bd','true','id.token.claim'),('5fe84fd1-850d-446c-894a-7dd8a7cf89bd','String','jsonType.label'),('5fe84fd1-850d-446c-894a-7dd8a7cf89bd','username','user.attribute'),('5fe84fd1-850d-446c-894a-7dd8a7cf89bd','true','userinfo.token.claim'),('6380aed8-4a1b-47f3-9457-1494584a39c9','true','access.token.claim'),('6380aed8-4a1b-47f3-9457-1494584a39c9','clientHost','claim.name'),('6380aed8-4a1b-47f3-9457-1494584a39c9','true','id.token.claim'),('6380aed8-4a1b-47f3-9457-1494584a39c9','String','jsonType.label'),('6380aed8-4a1b-47f3-9457-1494584a39c9','clientHost','user.session.note'),('650bd353-f5c9-4d0b-aa1c-17954205296e','true','access.token.claim'),('650bd353-f5c9-4d0b-aa1c-17954205296e','authorities','claim.name'),('650bd353-f5c9-4d0b-aa1c-17954205296e','true','id.token.claim'),('650bd353-f5c9-4d0b-aa1c-17954205296e','JSON','jsonType.label'),('650bd353-f5c9-4d0b-aa1c-17954205296e','authorities','user.attribute'),('650bd353-f5c9-4d0b-aa1c-17954205296e','true','userinfo.token.claim'),('65c891c5-9240-46c0-bd53-a9e18a5c9d72','true','access.token.claim'),('65c891c5-9240-46c0-bd53-a9e18a5c9d72','updated_at','claim.name'),('65c891c5-9240-46c0-bd53-a9e18a5c9d72','true','id.token.claim'),('65c891c5-9240-46c0-bd53-a9e18a5c9d72','long','jsonType.label'),('65c891c5-9240-46c0-bd53-a9e18a5c9d72','updatedAt','user.attribute'),('65c891c5-9240-46c0-bd53-a9e18a5c9d72','true','userinfo.token.claim'),('6f0617f8-bd3b-4286-bb96-b57f38cb9e63','true','access.token.claim'),('6f0617f8-bd3b-4286-bb96-b57f38cb9e63','given_name','claim.name'),('6f0617f8-bd3b-4286-bb96-b57f38cb9e63','true','id.token.claim'),('6f0617f8-bd3b-4286-bb96-b57f38cb9e63','String','jsonType.label'),('6f0617f8-bd3b-4286-bb96-b57f38cb9e63','firstName','user.attribute'),('6f0617f8-bd3b-4286-bb96-b57f38cb9e63','true','userinfo.token.claim'),('70ef2e49-9cee-4bc1-965e-8e7c55828354','true','access.token.claim'),('70ef2e49-9cee-4bc1-965e-8e7c55828354','true','id.token.claim'),('70ef2e49-9cee-4bc1-965e-8e7c55828354','country','user.attribute.country'),('70ef2e49-9cee-4bc1-965e-8e7c55828354','formatted','user.attribute.formatted'),('70ef2e49-9cee-4bc1-965e-8e7c55828354','locality','user.attribute.locality'),('70ef2e49-9cee-4bc1-965e-8e7c55828354','postal_code','user.attribute.postal_code'),('70ef2e49-9cee-4bc1-965e-8e7c55828354','region','user.attribute.region'),('70ef2e49-9cee-4bc1-965e-8e7c55828354','street','user.attribute.street'),('70ef2e49-9cee-4bc1-965e-8e7c55828354','true','userinfo.token.claim'),('70ff337e-4f15-4ef4-9670-2efed8805ddb','true','access.token.claim'),('70ff337e-4f15-4ef4-9670-2efed8805ddb','nickname','claim.name'),('70ff337e-4f15-4ef4-9670-2efed8805ddb','true','id.token.claim'),('70ff337e-4f15-4ef4-9670-2efed8805ddb','String','jsonType.label'),('70ff337e-4f15-4ef4-9670-2efed8805ddb','nickname','user.attribute'),('70ff337e-4f15-4ef4-9670-2efed8805ddb','true','userinfo.token.claim'),('728a57a5-d7f4-45f2-a4fb-b8bce49a2716','true','access.token.claim'),('728a57a5-d7f4-45f2-a4fb-b8bce49a2716','phone_number','claim.name'),('728a57a5-d7f4-45f2-a4fb-b8bce49a2716','true','id.token.claim'),('728a57a5-d7f4-45f2-a4fb-b8bce49a2716','String','jsonType.label'),('728a57a5-d7f4-45f2-a4fb-b8bce49a2716','phoneNumber','user.attribute'),('728a57a5-d7f4-45f2-a4fb-b8bce49a2716','true','userinfo.token.claim'),('7752a4db-887b-4cd9-bb02-67bad3d7844c','true','access.token.claim'),('7752a4db-887b-4cd9-bb02-67bad3d7844c','phone_number_verified','claim.name'),('7752a4db-887b-4cd9-bb02-67bad3d7844c','true','id.token.claim'),('7752a4db-887b-4cd9-bb02-67bad3d7844c','boolean','jsonType.label'),('7752a4db-887b-4cd9-bb02-67bad3d7844c','phoneNumberVerified','user.attribute'),('7752a4db-887b-4cd9-bb02-67bad3d7844c','true','userinfo.token.claim'),('793c083f-24ec-4ba7-baed-e716131147a7','true','access.token.claim'),('793c083f-24ec-4ba7-baed-e716131147a7','middle_name','claim.name'),('793c083f-24ec-4ba7-baed-e716131147a7','true','id.token.claim'),('793c083f-24ec-4ba7-baed-e716131147a7','String','jsonType.label'),('793c083f-24ec-4ba7-baed-e716131147a7','middleName','user.attribute'),('793c083f-24ec-4ba7-baed-e716131147a7','true','userinfo.token.claim'),('7ab3181d-ce3a-43a5-879b-665495f1f9d0','true','access.token.claim'),('7ab3181d-ce3a-43a5-879b-665495f1f9d0','realm_access.roles','claim.name'),('7ab3181d-ce3a-43a5-879b-665495f1f9d0','String','jsonType.label'),('7ab3181d-ce3a-43a5-879b-665495f1f9d0','true','multivalued'),('7ab3181d-ce3a-43a5-879b-665495f1f9d0','foo','user.attribute'),('7da8ac78-7d70-4460-a4c4-415eb3c9666b','true','access.token.claim'),('7da8ac78-7d70-4460-a4c4-415eb3c9666b','email','claim.name'),('7da8ac78-7d70-4460-a4c4-415eb3c9666b','true','id.token.claim'),('7da8ac78-7d70-4460-a4c4-415eb3c9666b','email','user.attribute'),('7da8ac78-7d70-4460-a4c4-415eb3c9666b','true','userinfo.token.claim'),('7e287f33-b91e-4aae-9d74-00e7f1dca25d','true','access.token.claim'),('7e287f33-b91e-4aae-9d74-00e7f1dca25d','website','claim.name'),('7e287f33-b91e-4aae-9d74-00e7f1dca25d','true','id.token.claim'),('7e287f33-b91e-4aae-9d74-00e7f1dca25d','String','jsonType.label'),('7e287f33-b91e-4aae-9d74-00e7f1dca25d','website','user.attribute'),('7e287f33-b91e-4aae-9d74-00e7f1dca25d','true','userinfo.token.claim'),('85baa053-5b72-4799-b227-0c3f21f441e9','true','access.token.claim'),('85baa053-5b72-4799-b227-0c3f21f441e9','true','id.token.claim'),('85baa053-5b72-4799-b227-0c3f21f441e9','country','user.attribute.country'),('85baa053-5b72-4799-b227-0c3f21f441e9','formatted','user.attribute.formatted'),('85baa053-5b72-4799-b227-0c3f21f441e9','locality','user.attribute.locality'),('85baa053-5b72-4799-b227-0c3f21f441e9','postal_code','user.attribute.postal_code'),('85baa053-5b72-4799-b227-0c3f21f441e9','region','user.attribute.region'),('85baa053-5b72-4799-b227-0c3f21f441e9','street','user.attribute.street'),('85baa053-5b72-4799-b227-0c3f21f441e9','true','userinfo.token.claim'),('87ad95bf-4303-4c47-a972-b4d495bfb5b3','true','access.token.claim'),('87ad95bf-4303-4c47-a972-b4d495bfb5b3','true','id.token.claim'),('891ccd72-abc3-46dc-9970-6312b4fb17ec','true','access.token.claim'),('891ccd72-abc3-46dc-9970-6312b4fb17ec','gender','claim.name'),('891ccd72-abc3-46dc-9970-6312b4fb17ec','true','id.token.claim'),('891ccd72-abc3-46dc-9970-6312b4fb17ec','String','jsonType.label'),('891ccd72-abc3-46dc-9970-6312b4fb17ec','gender','user.attribute'),('891ccd72-abc3-46dc-9970-6312b4fb17ec','true','userinfo.token.claim'),('8d8ccffd-5192-4cbe-83ec-036f2351fa36','true','access.token.claim'),('8d8ccffd-5192-4cbe-83ec-036f2351fa36','profile','claim.name'),('8d8ccffd-5192-4cbe-83ec-036f2351fa36','true','id.token.claim'),('8d8ccffd-5192-4cbe-83ec-036f2351fa36','String','jsonType.label'),('8d8ccffd-5192-4cbe-83ec-036f2351fa36','profile','user.attribute'),('8d8ccffd-5192-4cbe-83ec-036f2351fa36','true','userinfo.token.claim'),('8e036514-fa1c-45d6-93aa-1d12e2f08f7d','true','access.token.claim'),('8e036514-fa1c-45d6-93aa-1d12e2f08f7d','username','claim.name'),('8e036514-fa1c-45d6-93aa-1d12e2f08f7d','true','id.token.claim'),('8e036514-fa1c-45d6-93aa-1d12e2f08f7d','username','user.attribute'),('8e036514-fa1c-45d6-93aa-1d12e2f08f7d','true','userinfo.token.claim'),('905f1489-8fb2-48d5-97f4-fe61f066e3bd','true','access.token.claim'),('905f1489-8fb2-48d5-97f4-fe61f066e3bd','profile','claim.name'),('905f1489-8fb2-48d5-97f4-fe61f066e3bd','true','id.token.claim'),('905f1489-8fb2-48d5-97f4-fe61f066e3bd','String','jsonType.label'),('905f1489-8fb2-48d5-97f4-fe61f066e3bd','profile','user.attribute'),('905f1489-8fb2-48d5-97f4-fe61f066e3bd','true','userinfo.token.claim'),('9444a540-4010-4d7d-9977-c992b8c94ee2','true','access.token.claim'),('9444a540-4010-4d7d-9977-c992b8c94ee2','resource_access.${client_id}.roles','claim.name'),('9444a540-4010-4d7d-9977-c992b8c94ee2','String','jsonType.label'),('9444a540-4010-4d7d-9977-c992b8c94ee2','true','multivalued'),('9444a540-4010-4d7d-9977-c992b8c94ee2','foo','user.attribute'),('94bc3dbd-6529-4d0d-b844-1e703e2dbf09','true','access.token.claim'),('94bc3dbd-6529-4d0d-b844-1e703e2dbf09','picture','claim.name'),('94bc3dbd-6529-4d0d-b844-1e703e2dbf09','true','id.token.claim'),('94bc3dbd-6529-4d0d-b844-1e703e2dbf09','String','jsonType.label'),('94bc3dbd-6529-4d0d-b844-1e703e2dbf09','picture','user.attribute'),('94bc3dbd-6529-4d0d-b844-1e703e2dbf09','true','userinfo.token.claim'),('a2a912b5-cfe5-484f-9523-a2e3f563e756','true','access.token.claim'),('a2a912b5-cfe5-484f-9523-a2e3f563e756','given_name','claim.name'),('a2a912b5-cfe5-484f-9523-a2e3f563e756','true','id.token.claim'),('a2a912b5-cfe5-484f-9523-a2e3f563e756','givenName','user.attribute'),('a2a912b5-cfe5-484f-9523-a2e3f563e756','true','userinfo.token.claim'),('a2ee4571-d0de-46d5-8af2-55e354b42a01','true','access.token.claim'),('a2ee4571-d0de-46d5-8af2-55e354b42a01','role','claim.name'),('a2ee4571-d0de-46d5-8af2-55e354b42a01','true','id.token.claim'),('a2ee4571-d0de-46d5-8af2-55e354b42a01','String','jsonType.label'),('a2ee4571-d0de-46d5-8af2-55e354b42a01','role','user.attribute'),('a2ee4571-d0de-46d5-8af2-55e354b42a01','true','userinfo.token.claim'),('a5ff2f23-be90-40f8-be8f-e18219669639','true','access.token.claim'),('a5ff2f23-be90-40f8-be8f-e18219669639','family_name','claim.name'),('a5ff2f23-be90-40f8-be8f-e18219669639','true','id.token.claim'),('a5ff2f23-be90-40f8-be8f-e18219669639','String','jsonType.label'),('a5ff2f23-be90-40f8-be8f-e18219669639','lastName','user.attribute'),('a5ff2f23-be90-40f8-be8f-e18219669639','true','userinfo.token.claim'),('b020be7d-37f8-4345-84f7-6455d54d56a7','true','access.token.claim'),('b020be7d-37f8-4345-84f7-6455d54d56a7','middle_name','claim.name'),('b020be7d-37f8-4345-84f7-6455d54d56a7','true','id.token.claim'),('b020be7d-37f8-4345-84f7-6455d54d56a7','String','jsonType.label'),('b020be7d-37f8-4345-84f7-6455d54d56a7','middleName','user.attribute'),('b020be7d-37f8-4345-84f7-6455d54d56a7','true','userinfo.token.claim'),('b3e0adc6-3dcb-4f72-8008-71329f83aeb2','true','access.token.claim'),('b3e0adc6-3dcb-4f72-8008-71329f83aeb2','family_name','claim.name'),('b3e0adc6-3dcb-4f72-8008-71329f83aeb2','true','id.token.claim'),('b3e0adc6-3dcb-4f72-8008-71329f83aeb2','String','jsonType.label'),('b3e0adc6-3dcb-4f72-8008-71329f83aeb2','lastName','user.attribute'),('b3e0adc6-3dcb-4f72-8008-71329f83aeb2','true','userinfo.token.claim'),('baeb4318-4f74-4916-84e5-1a50476bb58a','true','access.token.claim'),('baeb4318-4f74-4916-84e5-1a50476bb58a','locale','claim.name'),('baeb4318-4f74-4916-84e5-1a50476bb58a','true','id.token.claim'),('baeb4318-4f74-4916-84e5-1a50476bb58a','String','jsonType.label'),('baeb4318-4f74-4916-84e5-1a50476bb58a','locale','user.attribute'),('baeb4318-4f74-4916-84e5-1a50476bb58a','true','userinfo.token.claim'),('c32db8bb-6e43-49a5-9393-be42fcee42cf','true','access.token.claim'),('c32db8bb-6e43-49a5-9393-be42fcee42cf','upn','claim.name'),('c32db8bb-6e43-49a5-9393-be42fcee42cf','true','id.token.claim'),('c32db8bb-6e43-49a5-9393-be42fcee42cf','String','jsonType.label'),('c32db8bb-6e43-49a5-9393-be42fcee42cf','username','user.attribute'),('c32db8bb-6e43-49a5-9393-be42fcee42cf','true','userinfo.token.claim'),('cee6a2a5-b57c-4693-8243-07358dab2736','true','access.token.claim'),('cee6a2a5-b57c-4693-8243-07358dab2736','realm_access.roles','claim.name'),('cee6a2a5-b57c-4693-8243-07358dab2736','String','jsonType.label'),('cee6a2a5-b57c-4693-8243-07358dab2736','true','multivalued'),('cee6a2a5-b57c-4693-8243-07358dab2736','foo','user.attribute'),('d2d50cd2-781f-43d6-a3e9-be13ed39b57b','true','access.token.claim'),('d2d50cd2-781f-43d6-a3e9-be13ed39b57b','birthdate','claim.name'),('d2d50cd2-781f-43d6-a3e9-be13ed39b57b','true','id.token.claim'),('d2d50cd2-781f-43d6-a3e9-be13ed39b57b','String','jsonType.label'),('d2d50cd2-781f-43d6-a3e9-be13ed39b57b','birthdate','user.attribute'),('d2d50cd2-781f-43d6-a3e9-be13ed39b57b','true','userinfo.token.claim'),('d6771aca-bccf-417b-b905-efac2b63d50e','true','access.token.claim'),('d6771aca-bccf-417b-b905-efac2b63d50e','email_verified','claim.name'),('d6771aca-bccf-417b-b905-efac2b63d50e','true','id.token.claim'),('d6771aca-bccf-417b-b905-efac2b63d50e','boolean','jsonType.label'),('d6771aca-bccf-417b-b905-efac2b63d50e','emailVerified','user.attribute'),('d6771aca-bccf-417b-b905-efac2b63d50e','true','userinfo.token.claim'),('d769d9a7-7474-4434-aa5e-991ee87fc368','true','access.token.claim'),('d769d9a7-7474-4434-aa5e-991ee87fc368','given_name','claim.name'),('d769d9a7-7474-4434-aa5e-991ee87fc368','true','id.token.claim'),('d769d9a7-7474-4434-aa5e-991ee87fc368','String','jsonType.label'),('d769d9a7-7474-4434-aa5e-991ee87fc368','firstName','user.attribute'),('d769d9a7-7474-4434-aa5e-991ee87fc368','true','userinfo.token.claim'),('d7f3496b-c9e7-4946-83eb-ee2b7b5d1fdb','true','access.token.claim'),('d7f3496b-c9e7-4946-83eb-ee2b7b5d1fdb','website','claim.name'),('d7f3496b-c9e7-4946-83eb-ee2b7b5d1fdb','true','id.token.claim'),('d7f3496b-c9e7-4946-83eb-ee2b7b5d1fdb','String','jsonType.label'),('d7f3496b-c9e7-4946-83eb-ee2b7b5d1fdb','website','user.attribute'),('d7f3496b-c9e7-4946-83eb-ee2b7b5d1fdb','true','userinfo.token.claim'),('de427038-9bb7-42b3-9a24-3489ac847ae6','true','access.token.claim'),('de427038-9bb7-42b3-9a24-3489ac847ae6','picture','claim.name'),('de427038-9bb7-42b3-9a24-3489ac847ae6','true','id.token.claim'),('de427038-9bb7-42b3-9a24-3489ac847ae6','String','jsonType.label'),('de427038-9bb7-42b3-9a24-3489ac847ae6','picture','user.attribute'),('de427038-9bb7-42b3-9a24-3489ac847ae6','true','userinfo.token.claim'),('e038cbb1-2b61-4d0e-8d6b-8ddb9d980df3','true','access.token.claim'),('e038cbb1-2b61-4d0e-8d6b-8ddb9d980df3','apps','claim.name'),('e038cbb1-2b61-4d0e-8d6b-8ddb9d980df3','true','id.token.claim'),('e038cbb1-2b61-4d0e-8d6b-8ddb9d980df3','JSON','jsonType.label'),('e038cbb1-2b61-4d0e-8d6b-8ddb9d980df3','apps','user.attribute'),('e038cbb1-2b61-4d0e-8d6b-8ddb9d980df3','true','userinfo.token.claim'),('e0be1ce8-044b-4faf-a538-1b547949f929','true','access.token.claim'),('e0be1ce8-044b-4faf-a538-1b547949f929','preferred_username','claim.name'),('e0be1ce8-044b-4faf-a538-1b547949f929','true','id.token.claim'),('e0be1ce8-044b-4faf-a538-1b547949f929','String','jsonType.label'),('e0be1ce8-044b-4faf-a538-1b547949f929','username','user.attribute'),('e0be1ce8-044b-4faf-a538-1b547949f929','true','userinfo.token.claim'),('e302eaaa-17c3-43ad-91f1-fa3923a039d0','true','access.token.claim'),('e302eaaa-17c3-43ad-91f1-fa3923a039d0','nickname','claim.name'),('e302eaaa-17c3-43ad-91f1-fa3923a039d0','true','id.token.claim'),('e302eaaa-17c3-43ad-91f1-fa3923a039d0','String','jsonType.label'),('e302eaaa-17c3-43ad-91f1-fa3923a039d0','nickname','user.attribute'),('e302eaaa-17c3-43ad-91f1-fa3923a039d0','true','userinfo.token.claim'),('ead4ba96-8287-4591-bd4c-40f4b92adbfd','true','access.token.claim'),('ead4ba96-8287-4591-bd4c-40f4b92adbfd','groups','claim.name'),('ead4ba96-8287-4591-bd4c-40f4b92adbfd','true','id.token.claim'),('ead4ba96-8287-4591-bd4c-40f4b92adbfd','String','jsonType.label'),('ead4ba96-8287-4591-bd4c-40f4b92adbfd','true','multivalued'),('ead4ba96-8287-4591-bd4c-40f4b92adbfd','foo','user.attribute'),('eb0d3d37-de96-4693-98cc-54d4f4a5a346','true','access.token.claim'),('eb0d3d37-de96-4693-98cc-54d4f4a5a346','resource_access.${client_id}.roles','claim.name'),('eb0d3d37-de96-4693-98cc-54d4f4a5a346','String','jsonType.label'),('eb0d3d37-de96-4693-98cc-54d4f4a5a346','true','multivalued'),('eb0d3d37-de96-4693-98cc-54d4f4a5a346','foo','user.attribute'),('ee93a114-385c-4f6d-9238-36c1ca05d880','true','access.token.claim'),('ee93a114-385c-4f6d-9238-36c1ca05d880','email','claim.name'),('ee93a114-385c-4f6d-9238-36c1ca05d880','true','id.token.claim'),('ee93a114-385c-4f6d-9238-36c1ca05d880','String','jsonType.label'),('ee93a114-385c-4f6d-9238-36c1ca05d880','email','user.attribute'),('ee93a114-385c-4f6d-9238-36c1ca05d880','true','userinfo.token.claim'),('f79c754d-6998-4e2f-b6aa-557c5ba5afc5','true','access.token.claim'),('f79c754d-6998-4e2f-b6aa-557c5ba5afc5','phone_number_verified','claim.name'),('f79c754d-6998-4e2f-b6aa-557c5ba5afc5','true','id.token.claim'),('f79c754d-6998-4e2f-b6aa-557c5ba5afc5','boolean','jsonType.label'),('f79c754d-6998-4e2f-b6aa-557c5ba5afc5','phoneNumberVerified','user.attribute'),('f79c754d-6998-4e2f-b6aa-557c5ba5afc5','true','userinfo.token.claim'),('fab2f87e-4335-4fb5-8e56-7c42ebf5b4a3','true','access.token.claim'),('fab2f87e-4335-4fb5-8e56-7c42ebf5b4a3','email_verified','claim.name'),('fab2f87e-4335-4fb5-8e56-7c42ebf5b4a3','true','id.token.claim'),('fab2f87e-4335-4fb5-8e56-7c42ebf5b4a3','boolean','jsonType.label'),('fab2f87e-4335-4fb5-8e56-7c42ebf5b4a3','emailVerified','user.attribute'),('fab2f87e-4335-4fb5-8e56-7c42ebf5b4a3','true','userinfo.token.claim');
/*!40000 ALTER TABLE `protocol_mapper_config` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `realm` (
  `ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ACCESS_CODE_LIFESPAN` int(11) DEFAULT NULL,
  `USER_ACTION_LIFESPAN` int(11) DEFAULT NULL,
  `ACCESS_TOKEN_LIFESPAN` int(11) DEFAULT NULL,
  `ACCOUNT_THEME` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ADMIN_THEME` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `EMAIL_THEME` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `EVENTS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `EVENTS_EXPIRATION` bigint(20) DEFAULT NULL,
  `LOGIN_THEME` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `NOT_BEFORE` int(11) DEFAULT NULL,
  `PASSWORD_POLICY` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `REGISTRATION_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `REMEMBER_ME` bit(1) NOT NULL DEFAULT b'0',
  `RESET_PASSWORD_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `SOCIAL` bit(1) NOT NULL DEFAULT b'0',
  `SSL_REQUIRED` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SSO_IDLE_TIMEOUT` int(11) DEFAULT NULL,
  `SSO_MAX_LIFESPAN` int(11) DEFAULT NULL,
  `UPDATE_PROFILE_ON_SOC_LOGIN` bit(1) NOT NULL DEFAULT b'0',
  `VERIFY_EMAIL` bit(1) NOT NULL DEFAULT b'0',
  `MASTER_ADMIN_CLIENT` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `LOGIN_LIFESPAN` int(11) DEFAULT NULL,
  `INTERNATIONALIZATION_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `DEFAULT_LOCALE` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `REG_EMAIL_AS_USERNAME` bit(1) NOT NULL DEFAULT b'0',
  `ADMIN_EVENTS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `ADMIN_EVENTS_DETAILS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `EDIT_USERNAME_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `OTP_POLICY_COUNTER` int(11) DEFAULT 0,
  `OTP_POLICY_WINDOW` int(11) DEFAULT 1,
  `OTP_POLICY_PERIOD` int(11) DEFAULT 30,
  `OTP_POLICY_DIGITS` int(11) DEFAULT 6,
  `OTP_POLICY_ALG` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT 'HmacSHA1',
  `OTP_POLICY_TYPE` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT 'totp',
  `BROWSER_FLOW` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `REGISTRATION_FLOW` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DIRECT_GRANT_FLOW` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `RESET_CREDENTIALS_FLOW` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CLIENT_AUTH_FLOW` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `OFFLINE_SESSION_IDLE_TIMEOUT` int(11) DEFAULT 0,
  `REVOKE_REFRESH_TOKEN` bit(1) NOT NULL DEFAULT b'0',
  `ACCESS_TOKEN_LIFE_IMPLICIT` int(11) DEFAULT 0,
  `LOGIN_WITH_EMAIL_ALLOWED` bit(1) NOT NULL DEFAULT b'1',
  `DUPLICATE_EMAILS_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `DOCKER_AUTH_FLOW` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `REFRESH_TOKEN_MAX_REUSE` int(11) DEFAULT 0,
  `ALLOW_USER_MANAGED_ACCESS` bit(1) NOT NULL DEFAULT b'0',
  `SSO_MAX_LIFESPAN_REMEMBER_ME` int(11) NOT NULL,
  `SSO_IDLE_TIMEOUT_REMEMBER_ME` int(11) NOT NULL,
  `DEFAULT_ROLE` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_ORVSDMLA56612EAEFIQ6WL5OI` (`NAME`),
  KEY `IDX_REALM_MASTER_ADM_CLI` (`MASTER_ADMIN_CLIENT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `realm` WRITE;
/*!40000 ALTER TABLE `realm` DISABLE KEYS */;
INSERT INTO `realm` VALUES ('cadce104-54a0-4956-8ab8-384021f6a4c5',60,300,60,NULL,NULL,NULL,'','\0',0,NULL,'master',0,NULL,'\0','\0','\0','\0','EXTERNAL',1800,36000,'\0','\0','98ed13b8-d6e4-44fa-820f-1967075b06ce',1800,'\0',NULL,'\0','\0','\0','\0',0,1,30,6,'HmacSHA1','totp','e261e7f1-843f-4e5d-b208-5925a5c33fe6','9dc5d586-c960-43fb-bbf6-6940d1f3393f','268bdf85-24f4-43d9-9ddf-4177e219e293','fb423f9b-cf17-41ea-8d44-3e580b750ffb','65ea8add-5ff5-42e4-9261-1d96bfacb67d',2592000,'\0',900,'','\0','a7ee05ef-694d-4e0e-b05c-8d4a617f1f5c',0,'\0',0,0,'f8a482fb-98c7-4b2a-96a0-6a4d3fd643a3'),('onesaitplatform',60,300,300,NULL,NULL,NULL,'','\0',0,NULL,'onesaitplatform',0,NULL,'\0','\0','\0','\0','EXTERNAL',36000,36000,'\0','\0','b437f737-aadd-47b5-a7f7-beb45dd6509b',1800,'\0',NULL,'\0','\0','\0','\0',0,1,30,6,'HmacSHA1','totp','ed0fc2c9-0ea4-411f-ac55-70f66a2d37d8','f0ec7010-571d-4890-b5fb-576fc8839120','4be72a30-8785-4346-95de-3fdadab18b84','67a99acf-9939-4d7a-b6b8-9021d05cff3d','00e224b3-14a0-4ecf-99f4-795e82796dd2',2592000,'\0',900,'','\0','181b592a-36f1-4aa8-85ee-94e79946966f',0,'\0',0,0,'fc0f07f5-a090-46ba-bdcf-33a84b0fb373');
/*!40000 ALTER TABLE `realm` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `realm_attribute` (
  `NAME` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `REALM_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `VALUE` longtext CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`NAME`,`REALM_ID`),
  KEY `IDX_REALM_ATTR_REALM` (`REALM_ID`),
  CONSTRAINT `FK_8SHXD6L3E9ATQUKACXGPFFPTW` FOREIGN KEY (`REALM_ID`) REFERENCES `realm` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `realm_attribute` WRITE;
/*!40000 ALTER TABLE `realm_attribute` DISABLE KEYS */;
INSERT INTO `realm_attribute` VALUES ('_browser_header.contentSecurityPolicy','cadce104-54a0-4956-8ab8-384021f6a4c5',''),('_browser_header.contentSecurityPolicy','onesaitplatform',''),('_browser_header.contentSecurityPolicyReportOnly','cadce104-54a0-4956-8ab8-384021f6a4c5',''),('_browser_header.contentSecurityPolicyReportOnly','onesaitplatform',''),('_browser_header.strictTransportSecurity','cadce104-54a0-4956-8ab8-384021f6a4c5','max-age=31536000; includeSubDomains'),('_browser_header.strictTransportSecurity','onesaitplatform','max-age=31536000; includeSubDomains'),('_browser_header.xContentTypeOptions','cadce104-54a0-4956-8ab8-384021f6a4c5','nosniff'),('_browser_header.xContentTypeOptions','onesaitplatform','nosniff'),('_browser_header.xFrameOptions','cadce104-54a0-4956-8ab8-384021f6a4c5',''),('_browser_header.xFrameOptions','onesaitplatform',''),('_browser_header.xRobotsTag','cadce104-54a0-4956-8ab8-384021f6a4c5','none'),('_browser_header.xRobotsTag','onesaitplatform','none'),('_browser_header.xXSSProtection','cadce104-54a0-4956-8ab8-384021f6a4c5','1; mode=block'),('_browser_header.xXSSProtection','onesaitplatform','1; mode=block'),('actionTokenGeneratedByAdminLifespan','cadce104-54a0-4956-8ab8-384021f6a4c5','43200'),('actionTokenGeneratedByAdminLifespan','onesaitplatform','43200'),('actionTokenGeneratedByUserLifespan','cadce104-54a0-4956-8ab8-384021f6a4c5','300'),('actionTokenGeneratedByUserLifespan','onesaitplatform','300'),('bruteForceProtected','cadce104-54a0-4956-8ab8-384021f6a4c5','false'),('bruteForceProtected','onesaitplatform','false'),('cibaAuthRequestedUserHint','cadce104-54a0-4956-8ab8-384021f6a4c5','login_hint'),('cibaAuthRequestedUserHint','onesaitplatform','login_hint'),('cibaBackchannelTokenDeliveryMode','cadce104-54a0-4956-8ab8-384021f6a4c5','poll'),('cibaBackchannelTokenDeliveryMode','onesaitplatform','poll'),('cibaExpiresIn','cadce104-54a0-4956-8ab8-384021f6a4c5','120'),('cibaExpiresIn','onesaitplatform','120'),('cibaInterval','cadce104-54a0-4956-8ab8-384021f6a4c5','5'),('cibaInterval','onesaitplatform','5'),('client-policies.policies','cadce104-54a0-4956-8ab8-384021f6a4c5','{\"policies\":[]}'),('client-policies.policies','onesaitplatform','{\"policies\":[]}'),('client-policies.profiles','cadce104-54a0-4956-8ab8-384021f6a4c5','{\"profiles\":[]}'),('client-policies.profiles','onesaitplatform','{\"profiles\":[]}'),('clientOfflineSessionIdleTimeout','cadce104-54a0-4956-8ab8-384021f6a4c5','0'),('clientOfflineSessionIdleTimeout','onesaitplatform','0'),('clientOfflineSessionMaxLifespan','cadce104-54a0-4956-8ab8-384021f6a4c5','0'),('clientOfflineSessionMaxLifespan','onesaitplatform','0'),('clientSessionIdleTimeout','cadce104-54a0-4956-8ab8-384021f6a4c5','0'),('clientSessionIdleTimeout','onesaitplatform','0'),('clientSessionMaxLifespan','cadce104-54a0-4956-8ab8-384021f6a4c5','0'),('clientSessionMaxLifespan','onesaitplatform','0'),('defaultSignatureAlgorithm','cadce104-54a0-4956-8ab8-384021f6a4c5','RS256'),('defaultSignatureAlgorithm','onesaitplatform','RS256'),('displayName','cadce104-54a0-4956-8ab8-384021f6a4c5','Keycloak'),('displayName','onesaitplatform','onesaitplatform'),('displayNameHtml','cadce104-54a0-4956-8ab8-384021f6a4c5','<div class=\"kc-logo-text\"><span>Keycloak</span></div>'),('failureFactor','cadce104-54a0-4956-8ab8-384021f6a4c5','30'),('failureFactor','onesaitplatform','30'),('maxDeltaTimeSeconds','cadce104-54a0-4956-8ab8-384021f6a4c5','43200'),('maxDeltaTimeSeconds','onesaitplatform','43200'),('maxFailureWaitSeconds','cadce104-54a0-4956-8ab8-384021f6a4c5','900'),('maxFailureWaitSeconds','onesaitplatform','900'),('minimumQuickLoginWaitSeconds','cadce104-54a0-4956-8ab8-384021f6a4c5','60'),('minimumQuickLoginWaitSeconds','onesaitplatform','60'),('oauth2DeviceCodeLifespan','cadce104-54a0-4956-8ab8-384021f6a4c5','600'),('oauth2DeviceCodeLifespan','onesaitplatform','600'),('oauth2DevicePollingInterval','cadce104-54a0-4956-8ab8-384021f6a4c5','5'),('oauth2DevicePollingInterval','onesaitplatform','5'),('offlineSessionMaxLifespan','cadce104-54a0-4956-8ab8-384021f6a4c5','5184000'),('offlineSessionMaxLifespan','onesaitplatform','5184000'),('offlineSessionMaxLifespanEnabled','cadce104-54a0-4956-8ab8-384021f6a4c5','false'),('offlineSessionMaxLifespanEnabled','onesaitplatform','false'),('parRequestUriLifespan','cadce104-54a0-4956-8ab8-384021f6a4c5','60'),('parRequestUriLifespan','onesaitplatform','60'),('permanentLockout','cadce104-54a0-4956-8ab8-384021f6a4c5','false'),('permanentLockout','onesaitplatform','false'),('quickLoginCheckMilliSeconds','cadce104-54a0-4956-8ab8-384021f6a4c5','1000'),('quickLoginCheckMilliSeconds','onesaitplatform','1000'),('realmReusableOtpCode','cadce104-54a0-4956-8ab8-384021f6a4c5','false'),('realmReusableOtpCode','onesaitplatform','false'),('waitIncrementSeconds','cadce104-54a0-4956-8ab8-384021f6a4c5','60'),('waitIncrementSeconds','onesaitplatform','60'),('webAuthnPolicyAttestationConveyancePreference','cadce104-54a0-4956-8ab8-384021f6a4c5','not specified'),('webAuthnPolicyAttestationConveyancePreference','onesaitplatform','not specified'),('webAuthnPolicyAttestationConveyancePreferencePasswordless','cadce104-54a0-4956-8ab8-384021f6a4c5','not specified'),('webAuthnPolicyAttestationConveyancePreferencePasswordless','onesaitplatform','not specified'),('webAuthnPolicyAuthenticatorAttachment','cadce104-54a0-4956-8ab8-384021f6a4c5','not specified'),('webAuthnPolicyAuthenticatorAttachment','onesaitplatform','not specified'),('webAuthnPolicyAuthenticatorAttachmentPasswordless','cadce104-54a0-4956-8ab8-384021f6a4c5','not specified'),('webAuthnPolicyAuthenticatorAttachmentPasswordless','onesaitplatform','not specified'),('webAuthnPolicyAvoidSameAuthenticatorRegister','cadce104-54a0-4956-8ab8-384021f6a4c5','false'),('webAuthnPolicyAvoidSameAuthenticatorRegister','onesaitplatform','false'),('webAuthnPolicyAvoidSameAuthenticatorRegisterPasswordless','cadce104-54a0-4956-8ab8-384021f6a4c5','false'),('webAuthnPolicyAvoidSameAuthenticatorRegisterPasswordless','onesaitplatform','false'),('webAuthnPolicyCreateTimeout','cadce104-54a0-4956-8ab8-384021f6a4c5','0'),('webAuthnPolicyCreateTimeout','onesaitplatform','0'),('webAuthnPolicyCreateTimeoutPasswordless','cadce104-54a0-4956-8ab8-384021f6a4c5','0'),('webAuthnPolicyCreateTimeoutPasswordless','onesaitplatform','0'),('webAuthnPolicyRequireResidentKey','cadce104-54a0-4956-8ab8-384021f6a4c5','not specified'),('webAuthnPolicyRequireResidentKey','onesaitplatform','not specified'),('webAuthnPolicyRequireResidentKeyPasswordless','cadce104-54a0-4956-8ab8-384021f6a4c5','not specified'),('webAuthnPolicyRequireResidentKeyPasswordless','onesaitplatform','not specified'),('webAuthnPolicyRpEntityName','cadce104-54a0-4956-8ab8-384021f6a4c5','keycloak'),('webAuthnPolicyRpEntityName','onesaitplatform','keycloak'),('webAuthnPolicyRpEntityNamePasswordless','cadce104-54a0-4956-8ab8-384021f6a4c5','keycloak'),('webAuthnPolicyRpEntityNamePasswordless','onesaitplatform','keycloak'),('webAuthnPolicyRpId','cadce104-54a0-4956-8ab8-384021f6a4c5',''),('webAuthnPolicyRpId','onesaitplatform',''),('webAuthnPolicyRpIdPasswordless','cadce104-54a0-4956-8ab8-384021f6a4c5',''),('webAuthnPolicyRpIdPasswordless','onesaitplatform',''),('webAuthnPolicySignatureAlgorithms','cadce104-54a0-4956-8ab8-384021f6a4c5','ES256'),('webAuthnPolicySignatureAlgorithms','onesaitplatform','ES256'),('webAuthnPolicySignatureAlgorithmsPasswordless','cadce104-54a0-4956-8ab8-384021f6a4c5','ES256'),('webAuthnPolicySignatureAlgorithmsPasswordless','onesaitplatform','ES256'),('webAuthnPolicyUserVerificationRequirement','cadce104-54a0-4956-8ab8-384021f6a4c5','not specified'),('webAuthnPolicyUserVerificationRequirement','onesaitplatform','not specified'),('webAuthnPolicyUserVerificationRequirementPasswordless','cadce104-54a0-4956-8ab8-384021f6a4c5','not specified'),('webAuthnPolicyUserVerificationRequirementPasswordless','onesaitplatform','not specified');
/*!40000 ALTER TABLE `realm_attribute` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `realm_default_groups` (
  `REALM_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `GROUP_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`REALM_ID`,`GROUP_ID`),
  UNIQUE KEY `CON_GROUP_ID_DEF_GROUPS` (`GROUP_ID`),
  KEY `IDX_REALM_DEF_GRP_REALM` (`REALM_ID`),
  CONSTRAINT `FK_DEF_GROUPS_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `realm` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `realm_default_groups` WRITE;
/*!40000 ALTER TABLE `realm_default_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `realm_default_groups` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `realm_enabled_event_types` (
  `REALM_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `VALUE` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`REALM_ID`,`VALUE`),
  KEY `IDX_REALM_EVT_TYPES_REALM` (`REALM_ID`),
  CONSTRAINT `FK_H846O4H0W8EPX5NWEDRF5Y69J` FOREIGN KEY (`REALM_ID`) REFERENCES `realm` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `realm_enabled_event_types` WRITE;
/*!40000 ALTER TABLE `realm_enabled_event_types` DISABLE KEYS */;
INSERT INTO `realm_enabled_event_types` VALUES ('onesaitplatform','AUTHREQID_TO_TOKEN'),('onesaitplatform','AUTHREQID_TO_TOKEN_ERROR'),('onesaitplatform','CLIENT_DELETE'),('onesaitplatform','CLIENT_DELETE_ERROR'),('onesaitplatform','CLIENT_INITIATED_ACCOUNT_LINKING'),('onesaitplatform','CLIENT_INITIATED_ACCOUNT_LINKING_ERROR'),('onesaitplatform','CLIENT_LOGIN'),('onesaitplatform','CLIENT_LOGIN_ERROR'),('onesaitplatform','CLIENT_REGISTER'),('onesaitplatform','CLIENT_REGISTER_ERROR'),('onesaitplatform','CLIENT_UPDATE'),('onesaitplatform','CLIENT_UPDATE_ERROR'),('onesaitplatform','CODE_TO_TOKEN'),('onesaitplatform','CODE_TO_TOKEN_ERROR'),('onesaitplatform','CUSTOM_REQUIRED_ACTION'),('onesaitplatform','CUSTOM_REQUIRED_ACTION_ERROR'),('onesaitplatform','DELETE_ACCOUNT'),('onesaitplatform','DELETE_ACCOUNT_ERROR'),('onesaitplatform','EXECUTE_ACTION_TOKEN'),('onesaitplatform','EXECUTE_ACTION_TOKEN_ERROR'),('onesaitplatform','EXECUTE_ACTIONS'),('onesaitplatform','EXECUTE_ACTIONS_ERROR'),('onesaitplatform','FEDERATED_IDENTITY_LINK'),('onesaitplatform','FEDERATED_IDENTITY_LINK_ERROR'),('onesaitplatform','GRANT_CONSENT'),('onesaitplatform','GRANT_CONSENT_ERROR'),('onesaitplatform','IDENTITY_PROVIDER_FIRST_LOGIN'),('onesaitplatform','IDENTITY_PROVIDER_FIRST_LOGIN_ERROR'),('onesaitplatform','IDENTITY_PROVIDER_LINK_ACCOUNT'),('onesaitplatform','IDENTITY_PROVIDER_LINK_ACCOUNT_ERROR'),('onesaitplatform','IDENTITY_PROVIDER_POST_LOGIN'),('onesaitplatform','IDENTITY_PROVIDER_POST_LOGIN_ERROR'),('onesaitplatform','IMPERSONATE'),('onesaitplatform','IMPERSONATE_ERROR'),('onesaitplatform','LOGIN'),('onesaitplatform','LOGIN_ERROR'),('onesaitplatform','LOGOUT'),('onesaitplatform','LOGOUT_ERROR'),('onesaitplatform','OAUTH2_DEVICE_AUTH'),('onesaitplatform','OAUTH2_DEVICE_AUTH_ERROR'),('onesaitplatform','OAUTH2_DEVICE_CODE_TO_TOKEN'),('onesaitplatform','OAUTH2_DEVICE_CODE_TO_TOKEN_ERROR'),('onesaitplatform','OAUTH2_DEVICE_VERIFY_USER_CODE'),('onesaitplatform','OAUTH2_DEVICE_VERIFY_USER_CODE_ERROR'),('onesaitplatform','PERMISSION_TOKEN'),('onesaitplatform','REGISTER'),('onesaitplatform','REGISTER_ERROR'),('onesaitplatform','REMOVE_FEDERATED_IDENTITY'),('onesaitplatform','REMOVE_FEDERATED_IDENTITY_ERROR'),('onesaitplatform','REMOVE_TOTP'),('onesaitplatform','REMOVE_TOTP_ERROR'),('onesaitplatform','RESET_PASSWORD'),('onesaitplatform','RESET_PASSWORD_ERROR'),('onesaitplatform','RESTART_AUTHENTICATION'),('onesaitplatform','RESTART_AUTHENTICATION_ERROR'),('onesaitplatform','REVOKE_GRANT'),('onesaitplatform','REVOKE_GRANT_ERROR'),('onesaitplatform','SEND_IDENTITY_PROVIDER_LINK'),('onesaitplatform','SEND_IDENTITY_PROVIDER_LINK_ERROR'),('onesaitplatform','SEND_RESET_PASSWORD'),('onesaitplatform','SEND_RESET_PASSWORD_ERROR'),('onesaitplatform','SEND_VERIFY_EMAIL'),('onesaitplatform','SEND_VERIFY_EMAIL_ERROR'),('onesaitplatform','TOKEN_EXCHANGE'),('onesaitplatform','TOKEN_EXCHANGE_ERROR'),('onesaitplatform','UPDATE_CONSENT'),('onesaitplatform','UPDATE_CONSENT_ERROR'),('onesaitplatform','UPDATE_EMAIL'),('onesaitplatform','UPDATE_EMAIL_ERROR'),('onesaitplatform','UPDATE_PASSWORD'),('onesaitplatform','UPDATE_PASSWORD_ERROR'),('onesaitplatform','UPDATE_PROFILE'),('onesaitplatform','UPDATE_PROFILE_ERROR'),('onesaitplatform','UPDATE_TOTP'),('onesaitplatform','UPDATE_TOTP_ERROR'),('onesaitplatform','VERIFY_EMAIL'),('onesaitplatform','VERIFY_EMAIL_ERROR'),('onesaitplatform','VERIFY_PROFILE'),('onesaitplatform','VERIFY_PROFILE_ERROR');
/*!40000 ALTER TABLE `realm_enabled_event_types` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `realm_events_listeners` (
  `REALM_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `VALUE` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`REALM_ID`,`VALUE`),
  KEY `IDX_REALM_EVT_LIST_REALM` (`REALM_ID`),
  CONSTRAINT `FK_H846O4H0W8EPX5NXEV9F5Y69J` FOREIGN KEY (`REALM_ID`) REFERENCES `realm` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `realm_events_listeners` WRITE;
/*!40000 ALTER TABLE `realm_events_listeners` DISABLE KEYS */;
INSERT INTO `realm_events_listeners` VALUES ('cadce104-54a0-4956-8ab8-384021f6a4c5','jboss-logging'),('onesaitplatform','onesaitplatform_audit_listener');
/*!40000 ALTER TABLE `realm_events_listeners` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `realm_localizations` (
  `REALM_ID` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `LOCALE` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `TEXTS` longtext CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`REALM_ID`,`LOCALE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `realm_localizations` WRITE;
/*!40000 ALTER TABLE `realm_localizations` DISABLE KEYS */;
/*!40000 ALTER TABLE `realm_localizations` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `realm_required_credential` (
  `TYPE` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `FORM_LABEL` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `INPUT` bit(1) NOT NULL DEFAULT b'0',
  `SECRET` bit(1) NOT NULL DEFAULT b'0',
  `REALM_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`REALM_ID`,`TYPE`),
  CONSTRAINT `FK_5HG65LYBEVAVKQFKI3KPONH9V` FOREIGN KEY (`REALM_ID`) REFERENCES `realm` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `realm_required_credential` WRITE;
/*!40000 ALTER TABLE `realm_required_credential` DISABLE KEYS */;
INSERT INTO `realm_required_credential` VALUES ('password','password','','','cadce104-54a0-4956-8ab8-384021f6a4c5'),('password','password','','','onesaitplatform');
/*!40000 ALTER TABLE `realm_required_credential` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `realm_smtp_config` (
  `REALM_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `VALUE` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`REALM_ID`,`NAME`),
  CONSTRAINT `FK_70EJ8XDXGXD0B9HH6180IRR0O` FOREIGN KEY (`REALM_ID`) REFERENCES `realm` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `realm_smtp_config` WRITE;
/*!40000 ALTER TABLE `realm_smtp_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `realm_smtp_config` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `realm_supported_locales` (
  `REALM_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `VALUE` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`REALM_ID`,`VALUE`),
  KEY `IDX_REALM_SUPP_LOCAL_REALM` (`REALM_ID`),
  CONSTRAINT `FK_SUPPORTED_LOCALES_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `realm` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `realm_supported_locales` WRITE;
/*!40000 ALTER TABLE `realm_supported_locales` DISABLE KEYS */;
/*!40000 ALTER TABLE `realm_supported_locales` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `redirect_uris` (
  `CLIENT_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `VALUE` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`VALUE`),
  KEY `IDX_REDIR_URI_CLIENT` (`CLIENT_ID`),
  CONSTRAINT `FK_1BURS8PB4OUJ97H5WUPPAHV9F` FOREIGN KEY (`CLIENT_ID`) REFERENCES `client` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `redirect_uris` WRITE;
/*!40000 ALTER TABLE `redirect_uris` DISABLE KEYS */;
INSERT INTO `redirect_uris` VALUES ('04580e21-6a8f-43a9-83fd-b5dedb5a85a1','/realms/onesaitplatform/account/*'),('540bb75a-fb13-4add-ac4a-a682002355e2','/admin/master/console/*'),('6df83b2a-c035-439b-a6b9-658ebf055a0f','/realms/master/account/*'),('7a104b35-318c-492d-9c3d-784d22baa735','/realms/master/account/*'),('d9523613-ef9c-43f1-a637-9a09e56d6be0','/realms/onesaitplatform/account/*'),('e5567ab6-f2f6-4ff1-a13a-f0777d2290f3','*'),('fbb63a4e-569a-4579-86fa-4f2cb6569836','/admin/onesaitplatform/console/*');
/*!40000 ALTER TABLE `redirect_uris` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `required_action_config` (
  `REQUIRED_ACTION_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `VALUE` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`REQUIRED_ACTION_ID`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `required_action_config` WRITE;
/*!40000 ALTER TABLE `required_action_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `required_action_config` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `required_action_provider` (
  `ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ALIAS` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `REALM_ID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `DEFAULT_ACTION` bit(1) NOT NULL DEFAULT b'0',
  `PROVIDER_ID` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_REQ_ACT_PROV_REALM` (`REALM_ID`),
  CONSTRAINT `FK_REQ_ACT_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `realm` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `required_action_provider` WRITE;
/*!40000 ALTER TABLE `required_action_provider` DISABLE KEYS */;
INSERT INTO `required_action_provider` VALUES ('0bb8504e-4c02-4acd-b356-2b363df70289','webauthn-register','Webauthn Register','cadce104-54a0-4956-8ab8-384021f6a4c5','','\0','webauthn-register',70),('0e5a7d22-84b3-4405-9868-d1663e4d69e9','webauthn-register','Webauthn Register','onesaitplatform','','\0','webauthn-register',70),('509d9e12-5eeb-474f-a631-aa91d2c499e0','VERIFY_EMAIL','Verify Email','onesaitplatform','','\0','VERIFY_EMAIL',50),('569cee7a-e648-4f4c-965a-a08dd5e0dfe6','TERMS_AND_CONDITIONS','Terms and Conditions','cadce104-54a0-4956-8ab8-384021f6a4c5','\0','\0','TERMS_AND_CONDITIONS',20),('6cc03114-072c-4a8d-820e-cf86000a5d8f','CONFIGURE_TOTP','Configure OTP','onesaitplatform','','\0','CONFIGURE_TOTP',10),('6dd7fa9d-f26b-463d-88b1-e10b2e9f5967','webauthn-register-passwordless','Webauthn Register Passwordless','cadce104-54a0-4956-8ab8-384021f6a4c5','','\0','webauthn-register-passwordless',80),('6e3827a7-5316-4e34-8ff3-b9aa3cb9317c','TERMS_AND_CONDITIONS','Terms and Conditions','onesaitplatform','\0','\0','TERMS_AND_CONDITIONS',20),('8766ab14-7f54-4e91-9005-1fd487004559','webauthn-register-passwordless','Webauthn Register Passwordless','onesaitplatform','','\0','webauthn-register-passwordless',80),('8972b80f-de0e-44d0-99ac-4bf4f45ef14e','update_user_locale','Update User Locale','cadce104-54a0-4956-8ab8-384021f6a4c5','','\0','update_user_locale',1000),('993dd0dc-12a3-4ed2-9b2e-4ea227348d53','CONFIGURE_TOTP','Configure OTP','cadce104-54a0-4956-8ab8-384021f6a4c5','','\0','CONFIGURE_TOTP',10),('aa027f3c-bc3d-43ab-8f9f-8e6b13dc6840','VERIFY_EMAIL','Verify Email','cadce104-54a0-4956-8ab8-384021f6a4c5','','\0','VERIFY_EMAIL',50),('b38ca652-60ba-4841-8687-f645f500a0c0','delete_account','Delete Account','cadce104-54a0-4956-8ab8-384021f6a4c5','\0','\0','delete_account',60),('b48da7ea-ef0a-4287-bf5c-c1a7552d95d1','UPDATE_PROFILE','Update Profile','onesaitplatform','','\0','UPDATE_PROFILE',40),('bdaae63a-013e-4601-b36b-415d4ea86228','update_user_locale','Update User Locale','onesaitplatform','','\0','update_user_locale',1000),('c80f4197-653a-4a36-bd73-2b739066e1db','UPDATE_PROFILE','Update Profile','cadce104-54a0-4956-8ab8-384021f6a4c5','','\0','UPDATE_PROFILE',40),('d8a2f4c7-c733-45b2-89c1-3ce9a2153b3b','UPDATE_PASSWORD','Update Password','cadce104-54a0-4956-8ab8-384021f6a4c5','','\0','UPDATE_PASSWORD',30),('db653847-df0f-4e2f-b27b-4723c41439eb','delete_account','Delete Account','onesaitplatform','\0','\0','delete_account',60),('fd192aeb-4567-409f-856a-861919975289','UPDATE_PASSWORD','Update Password','onesaitplatform','','\0','UPDATE_PASSWORD',30);
/*!40000 ALTER TABLE `required_action_provider` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resource_attribute` (
  `ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'sybase-needs-something-here',
  `NAME` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `VALUE` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `RESOURCE_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_5HRM2VLF9QL5FU022KQEPOVBR` (`RESOURCE_ID`),
  CONSTRAINT `FK_5HRM2VLF9QL5FU022KQEPOVBR` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `resource_server_resource` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `resource_attribute` WRITE;
/*!40000 ALTER TABLE `resource_attribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `resource_attribute` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resource_policy` (
  `RESOURCE_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `POLICY_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`RESOURCE_ID`,`POLICY_ID`),
  KEY `IDX_RES_POLICY_POLICY` (`POLICY_ID`),
  CONSTRAINT `FK_FRSRPOS53XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `resource_server_resource` (`ID`),
  CONSTRAINT `FK_FRSRPP213XCX4WNKOG82SSRFY` FOREIGN KEY (`POLICY_ID`) REFERENCES `resource_server_policy` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `resource_policy` WRITE;
/*!40000 ALTER TABLE `resource_policy` DISABLE KEYS */;
/*!40000 ALTER TABLE `resource_policy` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resource_scope` (
  `RESOURCE_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `SCOPE_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`RESOURCE_ID`,`SCOPE_ID`),
  KEY `IDX_RES_SCOPE_SCOPE` (`SCOPE_ID`),
  CONSTRAINT `FK_FRSRPOS13XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `resource_server_resource` (`ID`),
  CONSTRAINT `FK_FRSRPS213XCX4WNKOG82SSRFY` FOREIGN KEY (`SCOPE_ID`) REFERENCES `resource_server_scope` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `resource_scope` WRITE;
/*!40000 ALTER TABLE `resource_scope` DISABLE KEYS */;
/*!40000 ALTER TABLE `resource_scope` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resource_server` (
  `ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ALLOW_RS_REMOTE_MGMT` bit(1) NOT NULL DEFAULT b'0',
  `POLICY_ENFORCE_MODE` tinyint(4) DEFAULT NULL,
  `DECISION_STRATEGY` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `resource_server` WRITE;
/*!40000 ALTER TABLE `resource_server` DISABLE KEYS */;
INSERT INTO `resource_server` VALUES ('e5567ab6-f2f6-4ff1-a13a-f0777d2290f3','',0,1);
/*!40000 ALTER TABLE `resource_server` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resource_server_perm_ticket` (
  `ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `OWNER` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `REQUESTER` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CREATED_TIMESTAMP` bigint(20) NOT NULL,
  `GRANTED_TIMESTAMP` bigint(20) DEFAULT NULL,
  `RESOURCE_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `SCOPE_ID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `RESOURCE_SERVER_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `POLICY_ID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_FRSR6T700S9V50BU18WS5PMT` (`OWNER`,`REQUESTER`,`RESOURCE_SERVER_ID`,`RESOURCE_ID`,`SCOPE_ID`),
  KEY `FK_FRSRHO213XCX4WNKOG82SSPMT` (`RESOURCE_SERVER_ID`),
  KEY `FK_FRSRHO213XCX4WNKOG83SSPMT` (`RESOURCE_ID`),
  KEY `FK_FRSRHO213XCX4WNKOG84SSPMT` (`SCOPE_ID`),
  KEY `FK_FRSRPO2128CX4WNKOG82SSRFY` (`POLICY_ID`),
  CONSTRAINT `FK_FRSRHO213XCX4WNKOG82SSPMT` FOREIGN KEY (`RESOURCE_SERVER_ID`) REFERENCES `resource_server` (`ID`),
  CONSTRAINT `FK_FRSRHO213XCX4WNKOG83SSPMT` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `resource_server_resource` (`ID`),
  CONSTRAINT `FK_FRSRHO213XCX4WNKOG84SSPMT` FOREIGN KEY (`SCOPE_ID`) REFERENCES `resource_server_scope` (`ID`),
  CONSTRAINT `FK_FRSRPO2128CX4WNKOG82SSRFY` FOREIGN KEY (`POLICY_ID`) REFERENCES `resource_server_policy` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `resource_server_perm_ticket` WRITE;
/*!40000 ALTER TABLE `resource_server_perm_ticket` DISABLE KEYS */;
/*!40000 ALTER TABLE `resource_server_perm_ticket` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resource_server_policy` (
  `ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `NAME` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `TYPE` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `DECISION_STRATEGY` tinyint(4) DEFAULT NULL,
  `LOGIC` tinyint(4) DEFAULT NULL,
  `RESOURCE_SERVER_ID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `OWNER` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_FRSRPT700S9V50BU18WS5HA6` (`NAME`,`RESOURCE_SERVER_ID`),
  KEY `IDX_RES_SERV_POL_RES_SERV` (`RESOURCE_SERVER_ID`),
  CONSTRAINT `FK_FRSRPO213XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_SERVER_ID`) REFERENCES `resource_server` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `resource_server_policy` WRITE;
/*!40000 ALTER TABLE `resource_server_policy` DISABLE KEYS */;
INSERT INTO `resource_server_policy` VALUES ('55279fac-62a3-4396-b3af-f0768b1f299d','Default Policy','A policy that grants access only for users within this realm','js',0,0,'e5567ab6-f2f6-4ff1-a13a-f0777d2290f3',NULL),('59604f2b-440d-4bed-918f-85b4d1dd6ddf','Default Permission','A permission that applies to the default resource type','resource',1,0,'e5567ab6-f2f6-4ff1-a13a-f0777d2290f3',NULL);
/*!40000 ALTER TABLE `resource_server_policy` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resource_server_resource` (
  `ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `NAME` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `TYPE` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ICON_URI` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `OWNER` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `RESOURCE_SERVER_ID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `OWNER_MANAGED_ACCESS` bit(1) NOT NULL DEFAULT b'0',
  `DISPLAY_NAME` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_FRSR6T700S9V50BU18WS5HA6` (`NAME`,`OWNER`,`RESOURCE_SERVER_ID`),
  KEY `IDX_RES_SRV_RES_RES_SRV` (`RESOURCE_SERVER_ID`),
  CONSTRAINT `FK_FRSRHO213XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_SERVER_ID`) REFERENCES `resource_server` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `resource_server_resource` WRITE;
/*!40000 ALTER TABLE `resource_server_resource` DISABLE KEYS */;
INSERT INTO `resource_server_resource` VALUES ('bba63497-f922-473f-8946-1bc979fcb642','Default Resource','urn:onesaitplatform:resources:default',NULL,'e5567ab6-f2f6-4ff1-a13a-f0777d2290f3','e5567ab6-f2f6-4ff1-a13a-f0777d2290f3','\0',NULL);
/*!40000 ALTER TABLE `resource_server_resource` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resource_server_scope` (
  `ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `NAME` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ICON_URI` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `RESOURCE_SERVER_ID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DISPLAY_NAME` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_FRSRST700S9V50BU18WS5HA6` (`NAME`,`RESOURCE_SERVER_ID`),
  KEY `IDX_RES_SRV_SCOPE_RES_SRV` (`RESOURCE_SERVER_ID`),
  CONSTRAINT `FK_FRSRSO213XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_SERVER_ID`) REFERENCES `resource_server` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `resource_server_scope` WRITE;
/*!40000 ALTER TABLE `resource_server_scope` DISABLE KEYS */;
/*!40000 ALTER TABLE `resource_server_scope` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resource_uris` (
  `RESOURCE_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `VALUE` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`RESOURCE_ID`,`VALUE`),
  CONSTRAINT `FK_RESOURCE_SERVER_URIS` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `resource_server_resource` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `resource_uris` WRITE;
/*!40000 ALTER TABLE `resource_uris` DISABLE KEYS */;
INSERT INTO `resource_uris` VALUES ('bba63497-f922-473f-8946-1bc979fcb642','/*');
/*!40000 ALTER TABLE `resource_uris` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_attribute` (
  `ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ROLE_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `NAME` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `VALUE` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_ROLE_ATTRIBUTE` (`ROLE_ID`),
  CONSTRAINT `FK_ROLE_ATTRIBUTE_ID` FOREIGN KEY (`ROLE_ID`) REFERENCES `keycloak_role` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `role_attribute` WRITE;
/*!40000 ALTER TABLE `role_attribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `role_attribute` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scope_mapping` (
  `CLIENT_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ROLE_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`ROLE_ID`),
  KEY `IDX_SCOPE_MAPPING_ROLE` (`ROLE_ID`),
  CONSTRAINT `FK_OUSE064PLMLR732LXJCN1Q5F1` FOREIGN KEY (`CLIENT_ID`) REFERENCES `client` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `scope_mapping` WRITE;
/*!40000 ALTER TABLE `scope_mapping` DISABLE KEYS */;
INSERT INTO `scope_mapping` VALUES ('7a104b35-318c-492d-9c3d-784d22baa735','5c7ed303-7a4a-432d-a1d8-5df2044d1314'),('7a104b35-318c-492d-9c3d-784d22baa735','9512e584-d929-4500-8422-c0b232706771'),('d9523613-ef9c-43f1-a637-9a09e56d6be0','057e29be-0147-4c6f-9f24-d929692b10d0'),('d9523613-ef9c-43f1-a637-9a09e56d6be0','08d544b0-26fd-4121-9729-fcf3411256d8');
/*!40000 ALTER TABLE `scope_mapping` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scope_policy` (
  `SCOPE_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `POLICY_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`SCOPE_ID`,`POLICY_ID`),
  KEY `IDX_SCOPE_POLICY_POLICY` (`POLICY_ID`),
  CONSTRAINT `FK_FRSRASP13XCX4WNKOG82SSRFY` FOREIGN KEY (`POLICY_ID`) REFERENCES `resource_server_policy` (`ID`),
  CONSTRAINT `FK_FRSRPASS3XCX4WNKOG82SSRFY` FOREIGN KEY (`SCOPE_ID`) REFERENCES `resource_server_scope` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `scope_policy` WRITE;
/*!40000 ALTER TABLE `scope_policy` DISABLE KEYS */;
/*!40000 ALTER TABLE `scope_policy` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_attribute` (
  `NAME` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `VALUE` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `USER_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'sybase-needs-something-here',
  PRIMARY KEY (`ID`),
  KEY `IDX_USER_ATTRIBUTE` (`USER_ID`),
  KEY `IDX_USER_ATTRIBUTE_NAME` (`NAME`,`VALUE`),
  CONSTRAINT `FK_5HRM2VLF9QL5FU043KQEPOVBR` FOREIGN KEY (`USER_ID`) REFERENCES `user_entity` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `user_attribute` WRITE;
/*!40000 ALTER TABLE `user_attribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_attribute` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_consent` (
  `ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CLIENT_ID` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `USER_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CREATED_DATE` bigint(20) DEFAULT NULL,
  `LAST_UPDATED_DATE` bigint(20) DEFAULT NULL,
  `CLIENT_STORAGE_PROVIDER` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `EXTERNAL_CLIENT_ID` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_JKUWUVD56ONTGSUHOGM8UEWRT` (`CLIENT_ID`,`CLIENT_STORAGE_PROVIDER`,`EXTERNAL_CLIENT_ID`,`USER_ID`),
  KEY `IDX_USER_CONSENT` (`USER_ID`),
  CONSTRAINT `FK_GRNTCSNT_USER` FOREIGN KEY (`USER_ID`) REFERENCES `user_entity` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `user_consent` WRITE;
/*!40000 ALTER TABLE `user_consent` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_consent` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_consent_client_scope` (
  `USER_CONSENT_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `SCOPE_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`USER_CONSENT_ID`,`SCOPE_ID`),
  KEY `IDX_USCONSENT_CLSCOPE` (`USER_CONSENT_ID`),
  CONSTRAINT `FK_GRNTCSNT_CLSC_USC` FOREIGN KEY (`USER_CONSENT_ID`) REFERENCES `user_consent` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `user_consent_client_scope` WRITE;
/*!40000 ALTER TABLE `user_consent_client_scope` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_consent_client_scope` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_entity` (
  `ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `EMAIL` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `EMAIL_CONSTRAINT` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `EMAIL_VERIFIED` bit(1) NOT NULL DEFAULT b'0',
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `FEDERATION_LINK` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `FIRST_NAME` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `LAST_NAME` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `REALM_ID` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `USERNAME` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `CREATED_TIMESTAMP` bigint(20) DEFAULT NULL,
  `SERVICE_ACCOUNT_CLIENT_LINK` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `NOT_BEFORE` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_DYKN684SL8UP1CRFEI6ECKHD7` (`REALM_ID`,`EMAIL_CONSTRAINT`),
  UNIQUE KEY `UK_RU8TT6T700S9V50BU18WS5HA6` (`REALM_ID`,`USERNAME`),
  KEY `IDX_USER_EMAIL` (`EMAIL`),
  KEY `IDX_USER_SERVICE_ACCOUNT` (`REALM_ID`,`SERVICE_ACCOUNT_CLIENT_LINK`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `user_entity` WRITE;
/*!40000 ALTER TABLE `user_entity` DISABLE KEYS */;
INSERT INTO `user_entity` VALUES ('599dbd5a-9a92-47ab-89f9-4c8661b38e05',NULL,'b5ec362f-5508-487c-bc7d-e9ac4a859cbc','\0','',NULL,NULL,NULL,'cadce104-54a0-4956-8ab8-384021f6a4c5','admin',1779581439651,NULL,0),('7499d5fa-0db5-431f-b342-540a5c8da6f7',NULL,'4226db89-c933-44bf-8891-13bd05ce4200','\0','',NULL,NULL,NULL,'onesaitplatform','service-account-onesaitplatform',1779582345776,'e5567ab6-f2f6-4ff1-a13a-f0777d2290f3',0);
/*!40000 ALTER TABLE `user_entity` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_federation_config` (
  `USER_FEDERATION_PROVIDER_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `VALUE` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`USER_FEDERATION_PROVIDER_ID`,`NAME`),
  CONSTRAINT `FK_T13HPU1J94R2EBPEKR39X5EU5` FOREIGN KEY (`USER_FEDERATION_PROVIDER_ID`) REFERENCES `user_federation_provider` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `user_federation_config` WRITE;
/*!40000 ALTER TABLE `user_federation_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_federation_config` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_federation_mapper` (
  `ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `NAME` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `FEDERATION_PROVIDER_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `FEDERATION_MAPPER_TYPE` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `REALM_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_USR_FED_MAP_FED_PRV` (`FEDERATION_PROVIDER_ID`),
  KEY `IDX_USR_FED_MAP_REALM` (`REALM_ID`),
  CONSTRAINT `FK_FEDMAPPERPM_FEDPRV` FOREIGN KEY (`FEDERATION_PROVIDER_ID`) REFERENCES `user_federation_provider` (`ID`),
  CONSTRAINT `FK_FEDMAPPERPM_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `realm` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `user_federation_mapper` WRITE;
/*!40000 ALTER TABLE `user_federation_mapper` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_federation_mapper` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_federation_mapper_config` (
  `USER_FEDERATION_MAPPER_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `VALUE` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`USER_FEDERATION_MAPPER_ID`,`NAME`),
  CONSTRAINT `FK_FEDMAPPER_CFG` FOREIGN KEY (`USER_FEDERATION_MAPPER_ID`) REFERENCES `user_federation_mapper` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `user_federation_mapper_config` WRITE;
/*!40000 ALTER TABLE `user_federation_mapper_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_federation_mapper_config` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_federation_provider` (
  `ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CHANGED_SYNC_PERIOD` int(11) DEFAULT NULL,
  `DISPLAY_NAME` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `FULL_SYNC_PERIOD` int(11) DEFAULT NULL,
  `LAST_SYNC` int(11) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `PROVIDER_NAME` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `REALM_ID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_USR_FED_PRV_REALM` (`REALM_ID`),
  CONSTRAINT `FK_1FJ32F6PTOLW2QY60CD8N01E8` FOREIGN KEY (`REALM_ID`) REFERENCES `realm` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `user_federation_provider` WRITE;
/*!40000 ALTER TABLE `user_federation_provider` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_federation_provider` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_group_membership` (
  `GROUP_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `USER_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`GROUP_ID`,`USER_ID`),
  KEY `IDX_USER_GROUP_MAPPING` (`USER_ID`),
  CONSTRAINT `FK_USER_GROUP_USER` FOREIGN KEY (`USER_ID`) REFERENCES `user_entity` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `user_group_membership` WRITE;
/*!40000 ALTER TABLE `user_group_membership` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_group_membership` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_required_action` (
  `USER_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `REQUIRED_ACTION` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ' ',
  PRIMARY KEY (`REQUIRED_ACTION`,`USER_ID`),
  KEY `IDX_USER_REQACTIONS` (`USER_ID`),
  CONSTRAINT `FK_6QJ3W1JW9CVAFHE19BWSIUVMD` FOREIGN KEY (`USER_ID`) REFERENCES `user_entity` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `user_required_action` WRITE;
/*!40000 ALTER TABLE `user_required_action` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_required_action` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_role_mapping` (
  `ROLE_ID` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `USER_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`ROLE_ID`,`USER_ID`),
  KEY `IDX_USER_ROLE_MAPPING` (`USER_ID`),
  CONSTRAINT `FK_C4FQV34P1MBYLLOXANG7B1Q3L` FOREIGN KEY (`USER_ID`) REFERENCES `user_entity` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `user_role_mapping` WRITE;
/*!40000 ALTER TABLE `user_role_mapping` DISABLE KEYS */;
INSERT INTO `user_role_mapping` VALUES ('122e4aed-e3c8-4c17-8cd2-74cd0601815c','599dbd5a-9a92-47ab-89f9-4c8661b38e05'),('13339287-c5ac-4e9c-8635-6fcbb1e2f47c','599dbd5a-9a92-47ab-89f9-4c8661b38e05'),('26a0333b-6f87-4ecb-aba4-b67239430ad6','599dbd5a-9a92-47ab-89f9-4c8661b38e05'),('289c7e5d-c7bf-4b80-b84e-3c75c85f8e20','599dbd5a-9a92-47ab-89f9-4c8661b38e05'),('36b9ad7a-3306-4e4e-8ada-43b265f67cf5','599dbd5a-9a92-47ab-89f9-4c8661b38e05'),('3b5f6cc1-2cc3-4b54-82dd-f59d0a3c64ec','599dbd5a-9a92-47ab-89f9-4c8661b38e05'),('40b6e0e4-9860-4897-84f7-e20857dfa2a0','599dbd5a-9a92-47ab-89f9-4c8661b38e05'),('5a2bd4a5-3dba-4ee1-9e92-002e31c6b5f8','599dbd5a-9a92-47ab-89f9-4c8661b38e05'),('7725b58d-d6cd-43e0-b7eb-1d3993349130','599dbd5a-9a92-47ab-89f9-4c8661b38e05'),('7884f3e4-08da-49e2-916e-9a7f274482fd','599dbd5a-9a92-47ab-89f9-4c8661b38e05'),('7afbffd8-c7d5-46d3-9477-38f43f8bf83f','599dbd5a-9a92-47ab-89f9-4c8661b38e05'),('87bf9cfe-3375-45f0-8ce5-b567e2679244','599dbd5a-9a92-47ab-89f9-4c8661b38e05'),('893b3aca-bf41-43a9-89b0-23d33dfa248f','7499d5fa-0db5-431f-b342-540a5c8da6f7'),('8a2d32f6-feec-49f1-a18a-578ebbcf9e08','599dbd5a-9a92-47ab-89f9-4c8661b38e05'),('8b3afeb7-87e3-4269-a2d8-48447880e215','599dbd5a-9a92-47ab-89f9-4c8661b38e05'),('96113d3d-f9a8-4035-b727-2e661365cd9a','599dbd5a-9a92-47ab-89f9-4c8661b38e05'),('a494e787-27c6-4225-b89c-9c31fc4a0de1','599dbd5a-9a92-47ab-89f9-4c8661b38e05'),('d6794eeb-f793-41d9-9931-18d3646c446b','599dbd5a-9a92-47ab-89f9-4c8661b38e05'),('ee7c87a4-a519-469b-bb5c-ca335d8ab689','599dbd5a-9a92-47ab-89f9-4c8661b38e05'),('f8a482fb-98c7-4b2a-96a0-6a4d3fd643a3','599dbd5a-9a92-47ab-89f9-4c8661b38e05'),('fc0f07f5-a090-46ba-bdcf-33a84b0fb373','7499d5fa-0db5-431f-b342-540a5c8da6f7');
/*!40000 ALTER TABLE `user_role_mapping` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_session` (
  `ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `AUTH_METHOD` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `IP_ADDRESS` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `LAST_SESSION_REFRESH` int(11) DEFAULT NULL,
  `LOGIN_USERNAME` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `REALM_ID` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `REMEMBER_ME` bit(1) NOT NULL DEFAULT b'0',
  `STARTED` int(11) DEFAULT NULL,
  `USER_ID` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `USER_SESSION_STATE` int(11) DEFAULT NULL,
  `BROKER_SESSION_ID` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `BROKER_USER_ID` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `user_session` WRITE;
/*!40000 ALTER TABLE `user_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_session` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_session_note` (
  `USER_SESSION` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `NAME` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `VALUE` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`USER_SESSION`,`NAME`),
  CONSTRAINT `FK5EDFB00FF51D3472` FOREIGN KEY (`USER_SESSION`) REFERENCES `user_session` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `user_session_note` WRITE;
/*!40000 ALTER TABLE `user_session_note` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_session_note` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `username_login_failure` (
  `REALM_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `USERNAME` varchar(255) CHARACTER SET utf8 NOT NULL,
  `FAILED_LOGIN_NOT_BEFORE` int(11) DEFAULT NULL,
  `LAST_FAILURE` bigint(20) DEFAULT NULL,
  `LAST_IP_FAILURE` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `NUM_FAILURES` int(11) DEFAULT NULL,
  PRIMARY KEY (`REALM_ID`,`USERNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `username_login_failure` WRITE;
/*!40000 ALTER TABLE `username_login_failure` DISABLE KEYS */;
/*!40000 ALTER TABLE `username_login_failure` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_origins` (
  `CLIENT_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `VALUE` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`VALUE`),
  KEY `IDX_WEB_ORIG_CLIENT` (`CLIENT_ID`),
  CONSTRAINT `FK_LOJPHO213XCX4WNKOG82SSRFY` FOREIGN KEY (`CLIENT_ID`) REFERENCES `client` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `web_origins` WRITE;
/*!40000 ALTER TABLE `web_origins` DISABLE KEYS */;
INSERT INTO `web_origins` VALUES ('540bb75a-fb13-4add-ac4a-a682002355e2','+'),('e5567ab6-f2f6-4ff1-a13a-f0777d2290f3','*'),('fbb63a4e-569a-4579-86fa-4f2cb6569836','+');
/*!40000 ALTER TABLE `web_origins` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

