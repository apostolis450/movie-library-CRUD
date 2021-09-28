CREATE DATABASE  IF NOT EXISTS `idm` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `idm`;
-- MySQL dump 10.13  Distrib 8.0.26, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: idm
-- ------------------------------------------------------
-- Server version	5.7.35

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
-- Table structure for table `SequelizeMeta`
--

DROP TABLE IF EXISTS `SequelizeMeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SequelizeMeta` (
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`name`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SequelizeMeta`
--

LOCK TABLES `SequelizeMeta` WRITE;
/*!40000 ALTER TABLE `SequelizeMeta` DISABLE KEYS */;
INSERT INTO `SequelizeMeta` VALUES ('201802190000-CreateUserTable.js'),('201802190003-CreateUserRegistrationProfileTable.js'),('201802190005-CreateOrganizationTable.js'),('201802190008-CreateOAuthClientTable.js'),('201802190009-CreateUserAuthorizedApplicationTable.js'),('201802190010-CreateRoleTable.js'),('201802190015-CreatePermissionTable.js'),('201802190020-CreateRoleAssignmentTable.js'),('201802190025-CreateRolePermissionTable.js'),('201802190030-CreateUserOrganizationTable.js'),('201802190035-CreateIotTable.js'),('201802190040-CreatePepProxyTable.js'),('201802190045-CreateAuthZForceTable.js'),('201802190050-CreateAuthTokenTable.js'),('201802190060-CreateOAuthAuthorizationCodeTable.js'),('201802190065-CreateOAuthAccessTokenTable.js'),('201802190070-CreateOAuthRefreshTokenTable.js'),('201802190075-CreateOAuthScopeTable.js'),('20180405125424-CreateUserTourAttribute.js'),('20180612134640-CreateEidasTable.js'),('20180727101745-CreateUserEidasIdAttribute.js'),('20180730094347-CreateTrustedApplicationsTable.js'),('20180828133454-CreatePasswordSalt.js'),('20180921104653-CreateEidasNifColumn.js'),('20180922140934-CreateOauthTokenType.js'),('20181022103002-CreateEidasTypeAndAttributes.js'),('20181108144720-RevokeToken.js'),('20181113121450-FixExtraAndScopeAttribute.js'),('20181203120316-FixTokenTypesLength.js'),('20190116101526-CreateSignOutUrl.js'),('20190316203230-CreatePermissionIsRegex.js'),('20190429164755-CreateUsagePolicyTable.js'),('20190507112246-CreateRoleUsagePolicyTable.js'),('20190507112259-CreatePtpTable.js'),('20191019153205-UpdateUserAuthorizedApplicationTable.js'),('20200107102154-CreatePermissionFiwareService.js'),('20200107102154-CreatePermissionUseFiwareService.js'),('20200928134556-AddDisable2faKey.js'),('20210422214057-init-visible_attributes.js'),('20210423161823-AddOidcNonce.js.js'),('20210603073911-hashed-access-tokens.js'),('20210607162019-CreateDelegationEvidenceTable.js');
/*!40000 ALTER TABLE `SequelizeMeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_token`
--

DROP TABLE IF EXISTS `auth_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_token` (
  `access_token` varchar(255) NOT NULL,
  `expires` datetime DEFAULT NULL,
  `valid` tinyint(1) DEFAULT NULL,
  `user_id` varchar(36) DEFAULT NULL,
  `pep_proxy_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`access_token`),
  UNIQUE KEY `access_token` (`access_token`),
  KEY `user_id` (`user_id`),
  KEY `pep_proxy_id` (`pep_proxy_id`),
  CONSTRAINT `auth_token_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  CONSTRAINT `auth_token_ibfk_2` FOREIGN KEY (`pep_proxy_id`) REFERENCES `pep_proxy` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_token`
--

LOCK TABLES `auth_token` WRITE;
/*!40000 ALTER TABLE `auth_token` DISABLE KEYS */;
INSERT INTO `auth_token` VALUES ('014ccc95-d616-40ef-ad10-576bd5a5e1a4','2021-09-18 14:15:40',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('01fb3c3c-7612-42ba-a78c-6dcfbbb5d762','2021-08-19 16:50:12',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('020dc209-ec9c-4e3a-946b-857f1480501a','2021-08-19 16:50:13',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('03591b34-25ed-444d-8c77-0751eb9c473f','2021-08-19 14:50:00',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('03cd82b2-575c-4de3-9985-2f51ec423265','2021-08-24 22:34:20',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('046737d5-ffce-4412-bf21-b8db85c70f07','2021-09-25 20:41:27',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('04f02bd6-aae5-4315-be34-df27b861b572','2021-08-19 16:23:30',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('0574528f-7c1b-4e32-9766-d89d62030c69','2021-09-25 20:36:34',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('06f2ed18-9fc8-451c-89a1-622a1af3c0b7','2021-08-19 16:21:07',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('0790250b-20c9-4aa0-ad5a-dbd480830c55','2021-09-25 23:32:41',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('07ee53fc-c112-419b-b207-c8cb26986955','2021-08-09 22:36:26',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('083fc851-c2eb-48dc-84c0-9a7c8519f473','2021-09-26 09:20:17',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('084137f0-e549-47b4-9c62-4caf9ab95703','2021-08-25 14:12:55',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('08553149-1381-48d4-8196-09d306a3a20d','2021-09-25 23:00:56',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('086927ea-5896-4c54-8db7-9b2111b00b86','2021-09-25 22:41:49',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('08966d1f-2af5-417d-91d2-060228f4e41a','2021-09-25 22:34:27',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('08f413ac-4960-4e9b-ba3c-1c28b6de83fa','2021-09-19 13:33:54',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('093e453f-fa85-4363-9239-173d17e1e8d5','2021-08-19 16:57:34',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('09fa48c9-9292-4a9b-9c69-a112d204c7d9','2021-08-19 14:53:03',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('0a2ac1cf-33a6-4452-a7b2-41884bca74fd','2021-08-22 13:43:44',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('0aae6230-6fab-4c27-b3db-de5096d34c2a','2021-08-19 14:50:52',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('0b929731-52f8-41b6-b5c2-5e7738fbe79a','2021-09-25 22:29:56',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('0c6da657-cc78-4aaf-9f9b-d7043988813b','2021-09-25 20:41:27',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('0d0eb196-f6fb-497a-b96e-b86dd11c3b2f','2021-08-28 22:01:30',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('0e48e6a2-2ae1-4432-add8-3e3fa272345c','2021-08-24 22:34:20',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('0ea50aed-590d-4d24-b185-9fc9f49f88ae','2021-08-19 14:50:00',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('0eab74f0-8830-4f36-9b57-0056b007e20b','2021-08-19 14:50:00',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('0f6e3bf9-5220-45cd-9e12-b48aa226ad35','2021-09-26 09:26:20',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('0f918dcf-9c86-4eb1-b1bc-03e9c7e16c8d','2021-09-25 22:53:35',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('104498ae-7499-402b-b363-4d9191e03a93','2021-09-25 23:00:56',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('1104a428-d382-4087-b355-d2ba808e6273','2021-09-25 22:29:56',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('111bd84f-59f5-4a71-80b6-0054ac8b038c','2021-09-25 22:41:49',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('111fe82e-b7c6-4a3c-84b2-5a4042e5cb62','2021-08-24 14:04:42',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('117fec63-e0c3-4b97-a5d6-2fb979b81f67','2021-09-25 22:34:28',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('120df224-47f1-4d1c-8da8-d3b755c42e92','2021-09-25 23:00:56',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('1296c075-7cfc-49da-8fba-a2470dd3db19','2021-08-25 10:03:32',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('12c8a6b3-3b8e-48d3-af44-488e79c3737c','2021-08-19 14:53:03',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('12f8d9ce-fa51-40e7-9224-c6652c0edb9c','2021-08-30 19:33:16',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('1464e663-aa87-4e16-adba-7d422c151d7b','2021-08-25 14:17:29',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('14ba8cb6-2bf7-4305-b110-47e07b0c44e8','2021-09-26 09:25:04',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('15657966-f2a8-467f-a8fe-07cadb2722c8','2021-08-19 16:57:35',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('15ed8164-7e51-45a3-b7a8-29c96ae5448e','2021-08-25 10:03:32',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('16434b49-22e2-4602-80c8-f8ed8a13f4e3','2021-08-19 11:24:49',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('180592b8-ee9a-4548-a06d-d2e7627b4c8d','2021-09-25 20:41:27',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('1889881a-927d-4c4e-91ca-a4880d6dd575','2021-08-29 22:28:07',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('1894b268-8d00-4ca0-8f15-cd4e43313894','2021-08-19 14:50:00',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('19ab42f6-603c-44d8-9f12-41a0c67225b4','2021-09-25 20:36:34',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('1b3f031d-07d3-4e0c-8fbd-648dc67846b0','2021-09-26 09:20:17',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('1d55226d-c16d-42bb-adf1-843f40573d29','2021-08-19 14:50:52',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('1fe939f7-fe1c-4254-aa28-2155e0b1741c','2021-08-19 16:21:07',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('20757b56-1e1a-4e75-a425-58f85489d632','2021-08-25 14:17:29',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('20e1106e-2677-4774-8b8e-c04a292fd7fd','2021-08-25 14:17:29',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('214577f4-a587-4ea4-bf28-3ce8b161392f','2021-09-25 20:16:33',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('21ed6df8-7948-4f6f-a3bc-88fa25667bf7','2021-09-18 14:15:40',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('2223d8a2-83e3-4b00-bfe6-fc4674a198c0','2021-08-19 11:24:49',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('2253d78d-4454-4572-8ef3-3a78fe5f43a0','2021-08-30 19:33:16',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('24525336-c732-4e70-bc87-1279c5669ffb','2021-09-25 22:56:21',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('25080fc3-a0c7-447b-9408-9a4cd6bf45fe','2021-09-25 22:53:35',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('25f0d84e-8990-48e3-81d5-a8d4085e55c1','2021-08-28 22:01:30',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('269ca13e-aeb1-4f4c-937e-cc5030532c85','2021-09-26 09:25:04',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('27896108-7ab1-4eb8-a8a4-d060c699945e','2021-08-30 19:33:16',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('27fd34fc-132d-4241-b3b7-ee86c34bfa04','2021-08-19 11:24:49',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('29bf20b1-48dc-4acc-b28f-2a327c67bef3','2021-08-25 14:17:29',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('2b352f61-be4b-4205-a2df-4e9462581207','2021-08-19 16:23:30',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('2c03559a-976d-4c2d-ace9-4d4ceb8f983e','2021-08-19 11:24:49',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('2c88dd42-997a-4b86-b12d-bceacc203149','2021-08-19 16:50:13',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('2d40af98-68ee-4b91-9fbd-69221615393a','2021-08-19 15:04:28',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('2d6c5e8e-a6bb-4458-81aa-2227893b3c92','2021-08-19 16:57:35',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('2d7c82cf-de69-462c-8468-d4aaabfdf093','2021-09-25 20:16:33',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('2df343f7-60d5-41db-87ee-81bf03ea172e','2021-08-19 16:34:48',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('2efbdd3e-557a-4289-a00c-c547811f8d7e','2021-08-28 22:01:30',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('2f933db2-1397-4c3d-a465-01023a28ec51','2021-08-19 16:52:09',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('30c4cf40-3cb4-4721-a8f0-3409ea5b2771','2021-08-29 22:28:07',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('3111cc12-1cd8-4e3c-9172-cef4785139f0','2021-09-25 22:53:35',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('312ed400-e2b0-450d-afcd-09dd77f52987','2021-08-24 22:34:20',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('32b5a9fd-827b-4407-95e1-f4c718afb2d4','2021-09-25 23:32:41',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('3362a5d4-938c-45aa-ac3d-c046350a511c','2021-09-25 19:27:06',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('351ac411-5f17-4c38-bbfe-2e347a43f16f','2021-08-25 14:12:55',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('355fe760-e45d-423c-b9a0-836db86a88d5','2021-09-20 13:05:24',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('35b6ac79-c533-413d-b363-8828439be0ff','2021-09-25 22:56:21',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('35c73634-aeb4-4cf6-b94b-bfc58cc50426','2021-09-25 22:53:35',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('35efcd4a-71b6-425e-9479-44e8ed09c2ec','2021-08-19 16:34:48',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('362dc836-7e1d-4c79-8d9d-0dca8e8e1d9b','2021-09-25 23:09:05',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('3651949f-05c9-41c4-9553-8a9f85e12b69','2021-08-19 16:50:13',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('36f2191a-7ad4-4eb5-873b-c45fd7ff5c44','2021-09-20 21:59:56',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('3760a5e9-1d08-4ff7-8cfd-e46267254f16','2021-08-19 14:50:52',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('37c5e501-b354-4b05-8e88-55f4004b6104','2021-08-09 22:36:26',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('397418ce-179f-44a0-9eaa-9d83bad3a9d6','2021-08-24 22:34:20',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('399cfe4e-6152-4986-9c51-8ef6a9d33c7d','2021-09-26 09:26:20',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('39a65170-83b4-410a-824e-89353126aca8','2021-08-19 16:34:48',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('3bb85bdc-04f5-426e-b045-7840a3bb5bcf','2021-09-25 23:09:05',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('3bfb5d23-3024-4eff-8d37-24903f0e1486','2021-08-29 22:28:07',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('3c29e6e3-7fd0-4d5b-8336-d5aec1b53694','2021-09-25 19:27:06',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('3d4b4c91-2d4c-4fd2-a12f-11c1f2e532fd','2021-08-24 22:34:20',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('3dc6e0d2-599e-4661-a163-41ffafac7b9f','2021-08-19 11:24:49',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('3ee8f295-f297-4380-acf4-67ec185726d3','2021-09-02 18:50:49',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('3f7a94a8-d981-47fb-9c28-06d43cad6a66','2021-08-09 22:36:26',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('3f7c1660-e8fa-4255-9a7e-df621fc2ead1','2021-09-18 14:15:40',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('4001512d-b842-4486-996a-9936fa521aa1','2021-09-25 19:27:06',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('408ef3fd-6216-4487-bc09-7f22acf34601','2021-08-26 10:23:53',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('40cd9bbd-00c7-4fc4-8531-c79fbde97f42','2021-09-25 23:09:05',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('419e4dbd-f66f-4e99-a992-97251c49693c','2021-09-25 22:34:28',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('41e7d7c0-f611-4a1e-b08b-7bfb42715e34','2021-08-19 16:21:07',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('4286a726-02ed-422b-a1ea-fd77a8274b00','2021-08-26 10:23:53',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('4481146c-b127-484e-971b-3489411729ae','2021-08-25 10:03:32',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('44d4b0f1-5992-47a5-a5bc-a3f3a3067062','2021-08-29 22:28:07',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('44d642d2-e79a-41b8-b5d1-f58a0115087a','2021-08-19 14:50:51',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('450ca3ee-c09c-4c49-ad45-f4953467db29','2021-08-24 22:34:20',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('45cd6dad-ad62-4e38-823a-62b946deb3e0','2021-09-25 20:16:33',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('45f93e6f-0bd3-4b89-b98f-d8a24a38a3fc','2021-09-02 18:50:49',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('464758fc-a6a3-4547-9830-048c6d3d17da','2021-08-30 19:33:16',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('46d3814d-8b68-4aa4-a73d-33e8be3deda4','2021-09-18 14:15:40',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('47b59d7c-0af9-43fb-9694-da2adb7dd6d9','2021-09-18 14:15:40',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('4826cc5a-1ae1-4d74-b0b5-3d193088dc15','2021-08-19 14:53:03',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('484cffeb-0f51-419e-bdb8-f75be85ef1af','2021-08-26 10:23:54',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('48cb9c54-af02-4584-8c06-c38ca618b35a','2021-09-25 22:29:56',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('497648f1-a428-4c69-a633-7e8255a38f2f','2021-09-25 23:09:05',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('4aba2ecc-4e09-4120-b861-14bbb65e6ae3','2021-08-19 16:56:20',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('4acf06df-2554-4ba8-b7e6-5102527e0de3','2021-08-19 16:21:07',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('4adb7eb2-b835-4824-a8e0-28fb5843ad57','2021-09-20 13:05:24',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('4adba801-2135-4595-95cc-b588f36cf091','2021-08-28 22:01:30',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('4ade1cb5-5200-4830-82c9-93b8c712f091','2021-08-19 16:57:35',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('4bf5dc2b-304e-4f2a-9c21-8b8fd126fe96','2021-09-25 22:29:55',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('4d480fc0-f40c-4816-8316-5f7ebfddca04','2021-09-25 23:01:35',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('4d70bdb3-dbe9-4656-a4b7-be6d7ec3ed22','2021-08-24 22:34:20',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('4de47c16-b21d-46d4-b9be-c76161f23b7e','2021-09-20 21:59:56',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('4faa9b00-5fa3-4c47-935d-4f54c384283e','2021-08-22 13:43:44',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('50ab9d30-ee4a-4c2c-af28-0319effd8307','2021-08-19 14:53:03',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('50dda69b-5cb9-418d-abe4-9866a8636f54','2021-09-25 20:16:33',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('5228dfb5-8605-4cc7-86ee-8d30571b9ae9','2021-08-19 11:24:49',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('5234a391-dfde-4fc9-ae98-7160f80d18bc','2021-09-25 22:56:21',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('53605e9c-2ea2-4cb9-ac94-2f8f8356c9f9','2021-08-22 13:43:44',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('550e1ac1-0bfb-4a78-81eb-df5261562614','2021-08-22 13:43:43',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('55962a26-c715-419e-866e-e2dd23e18db3','2021-09-25 20:16:33',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('56a4099a-8916-4fed-9490-c15df65552e6','2021-09-02 18:50:49',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('57134c41-a12f-41b1-967e-6bba68d8c649','2021-09-25 20:41:27',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('577eff86-59e1-4038-88b0-80c3e241c28d','2021-09-25 20:41:27',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('57887280-7ce6-40ca-85e7-84db6f9d0b4b','2021-09-26 09:20:17',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('579add4f-1a33-4820-a6e5-9eb5530acedc','2021-08-19 16:52:09',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('5a717446-9753-4e43-acf2-3e31484a4a87','2021-09-25 23:32:41',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('5b0ddf4d-a9c1-499c-bfcf-3d5681efaebe','2021-08-22 13:43:44',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('5b2a5ee8-c2b8-4b06-8366-028fd3a78cd3','2021-09-25 23:01:35',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('5bfc4d5b-325a-4cb1-b2f8-3257135ded09','2021-08-19 14:53:03',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('5c1fe1ed-ef8c-4ad2-827d-050a2d29f31f','2021-08-24 14:04:42',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('5c916327-060c-4911-a253-1627a68193da','2021-09-26 09:26:20',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('5d53ce60-cdaf-406c-9b74-a87d3e6abe97','2021-08-28 22:01:30',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('5d832756-4147-456c-a068-d75e8e99a3b6','2021-09-25 19:27:06',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('5fb3bcbe-4172-44c2-b554-7007cff20033','2021-08-25 14:12:55',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('5ff79e60-87e0-4caf-ad96-bc32a162338e','2021-08-25 10:03:31',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('62673b52-92bb-446d-b4b4-18b63076c6fb','2021-09-25 23:00:56',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('635cf3f5-7374-474e-8c2f-57cf04b4e208','2021-08-09 22:36:26',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('637bb8dc-cb50-4076-a752-273a99c1d6a4','2021-09-25 22:41:48',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('63f756f8-754c-4c61-81d2-7755ed109233','2021-08-19 15:04:28',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('6444796e-48c6-4775-ac52-efb04f48fe62','2021-08-25 14:17:28',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('65d2f819-b973-48b1-bfdd-2d166a030fe8','2021-08-24 14:04:42',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('6721ded0-af38-4007-8f62-3d755dbbb6c7','2021-09-25 22:53:34',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('67e50d54-b4d3-4d64-8186-e95fbea83e50','2021-08-19 14:50:00',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('681a847d-a8b7-47fe-b284-fa7c3d74c570','2021-08-19 14:50:00',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('6910ee36-a88f-45b8-bfda-48a6e1674673','2021-08-26 10:23:54',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('6917086b-a03b-43fc-81cd-bad2e0c375b1','2021-09-25 23:32:41',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('6a81f3f8-3b64-4bc2-8ebe-90c4a12bc410','2021-09-19 13:33:54',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('6a9a6bcf-3b06-4f94-b22b-d7cd807fca4b','2021-08-19 16:56:20',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('6ba6c0ce-b3bf-4718-a54e-6bab250d4b8b','2021-09-25 23:00:56',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('6c0c06c6-dd6d-445c-ac77-66dcfcf49045','2021-09-25 22:41:49',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('6c54735d-272b-4af1-80fb-75f4f34f7dee','2021-08-19 16:34:48',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('6c5cf64c-90dd-412e-9f6e-f7e05740cf70','2021-09-25 22:41:49',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('6ccb475e-4aeb-4ec3-b502-1d42a1f44bd1','2021-08-29 22:28:07',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('6cdee689-9883-450e-b85b-0f15f2a4f333','2021-09-25 22:56:21',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('6ce110b4-991e-4bf5-8f77-ac2d649abaac','2021-08-19 16:56:20',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('6cff688b-1210-4faf-b04d-f0c74e093f58','2021-09-26 09:26:20',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('6d51519c-9063-4bd6-98b5-ebf77f383307','2021-08-26 10:23:53',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('6db83b8b-f4d7-4f39-a7b7-4d084af39db3','2021-08-19 15:04:28',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('6db9cdeb-62d3-4de6-bb85-a2253827c685','2021-08-30 19:33:16',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('6dbc1020-6173-4a3b-a9f6-62fed09902ec','2021-09-25 20:16:33',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('6e150da9-34b6-4695-97d9-a2efbe36a1ab','2021-08-19 16:56:19',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('6f33bf21-4cbf-4ab8-9a17-10481434213e','2021-08-19 16:56:20',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('7110039a-1435-4f8f-a383-7b778624f2c3','2021-09-25 19:27:06',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('71f51bd6-8985-4236-8569-a1dbc93d3bff','2021-08-19 16:52:09',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('72980042-49e6-483d-8c1a-1cf5f2227964','2021-09-26 09:25:04',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('733a3a20-9edc-410e-aea6-7066409136f4','2021-08-19 14:53:03',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('746cdfa6-9a0a-4a1a-96be-b09e43a7e0bf','2021-09-20 21:59:56',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('75dfd96a-2b81-4504-9ee9-e18c75721602','2021-09-02 18:50:49',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('766d2a68-2883-4d45-a22b-73b23a58dc4d','2021-08-24 14:04:42',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('766e1a09-a14a-4638-ace9-e373831d487a','2021-08-24 22:34:20',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('77804eb6-e135-4d26-8b97-c456099498c2','2021-08-19 16:56:20',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('782fda4d-e742-4a7c-9bc0-c4f632417068','2021-09-25 23:09:05',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('78498eaa-33e2-4474-abc7-e0380f766bff','2021-08-19 16:50:13',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('7878f6dc-75a9-4b8e-94c5-d6164cb59f1f','2021-08-29 22:28:07',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('796e2a86-a9e6-410f-b49f-83e1420e0b32','2021-09-19 13:33:54',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('7acea6da-cc5c-429f-b2f9-efad1d362582','2021-09-25 22:34:28',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('7b10d60d-6128-4d4d-8cca-4badbad5c701','2021-09-25 19:27:06',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('7b78005d-a93f-4380-9e68-401fd03e6d81','2021-08-24 14:04:42',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('7c252aef-a26c-451a-965d-1db3c5578d0b','2021-08-19 16:23:30',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('7c413987-04a3-4777-a791-c74fe0011725','2021-09-25 22:41:49',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('7cd009ee-948a-462c-9b4f-200e0494e63f','2021-08-19 16:23:30',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('7cf89be4-0d96-4a3e-8af7-47e23649701d','2021-09-25 23:09:05',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('7d4ec752-27c9-4323-a21e-c8b9504829c4','2021-09-25 23:01:35',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('7e75dfb9-c664-4f26-a3f3-8cf9b6995d6c','2021-08-19 16:57:35',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('82185dcd-47e9-4dc9-a9a2-64fe7f91ee8a','2021-09-25 20:36:34',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('82751662-2e83-4c64-a449-0e1a8b999943','2021-09-25 22:34:28',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('82b12c4d-6881-4bec-a3b2-1cf0b71b07d4','2021-09-19 13:33:54',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('82e93f9a-555d-41e0-a991-9d13fb00ff74','2021-09-25 20:16:33',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('83517126-aade-4d31-97bd-810704d5b00b','2021-08-25 14:17:29',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('85c40b07-df75-44b5-a6a4-519dae26bf88','2021-09-25 23:09:05',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('863ac0d3-f4d3-4a65-bea6-cacc82b3a37b','2021-09-25 20:41:27',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('8647e807-83d0-409d-a128-f89a068e51c4','2021-08-19 16:52:09',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('8767e6ad-3a02-4172-9af9-3cb37f77f9b5','2021-08-25 14:12:55',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('876b825f-16b7-4806-ae49-7feede955860','2021-08-22 13:43:44',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('887b086b-70e6-4216-9f2f-16bec0eedcfa','2021-08-19 16:23:30',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('88be1c05-9b45-4cf3-a0b4-b143447314b5','2021-09-25 20:36:34',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('89297b75-2aab-4918-9d43-050d31c00f4b','2021-08-29 22:28:07',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('894f94a1-ab3e-44d0-b25d-1f62040d31f4','2021-09-19 13:33:54',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('8952c449-c151-418c-99f5-fb237ec6ac0c','2021-09-25 22:29:56',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('89713d58-dab0-4a49-a3bc-a05dc79e6d9d','2021-08-25 10:03:32',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('8ae7df60-04f9-48d1-8e2f-28ac2baaddee','2021-08-19 14:50:00',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('8b13ea1f-6aa6-4bbb-ad99-885d18b8a3fb','2021-08-24 14:04:42',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('8e6c83ee-9263-4ebb-9aa4-48eb6d1b1abc','2021-09-26 09:26:20',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('8e76932a-db4d-4373-9830-88d5c24ea312','2021-08-25 14:12:55',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('8fc05333-174a-4363-9c54-040e34914331','2021-08-19 14:50:52',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('9082497a-de2e-41c0-8b71-869ab434bc39','2021-08-25 14:17:29',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('910c86b4-bfc7-4f75-b036-d5cbd0a2e38b','2021-09-25 22:34:27',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('91329617-ec98-4bd9-9ca0-5803199c0b4d','2021-09-25 22:34:28',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('916315e1-aa16-4048-ab1f-227feb39245d','2021-08-09 22:36:26',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('9184819f-c7ea-41ca-97c6-15d4e6354028','2021-09-25 23:00:56',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('91a065f2-8338-4d4d-aff2-0ff7d426f5ae','2021-09-25 22:29:56',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('91f8f184-d7ab-44ac-8400-af19bca69fb5','2021-09-02 18:50:49',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('928389a3-e2e3-4d72-b693-00f10c62c710','2021-08-19 16:57:35',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('9345f83e-43ff-483b-8086-e83235d29785','2021-09-02 18:50:49',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('939df14f-4e2c-4631-a29e-5bd2cae3e034','2021-09-25 22:41:49',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('94a9a6e3-562b-4165-acfd-f55be43bdae7','2021-09-18 14:15:40',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('94aebe78-d22a-4577-81b4-199d66ad09ac','2021-09-20 21:59:56',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('953411ae-8a67-4a74-baac-6bcab8a1a978','2021-09-25 20:16:32',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('955ad019-2dbc-4134-9f50-49b0eb68314e','2021-09-20 21:59:56',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('95c3deba-f0ea-4543-9282-35e5d464269e','2021-08-19 14:50:00',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('9784cc2f-5b59-4ab0-8d23-53ea80aaf154','2021-08-28 22:01:29',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('9a62718d-9b79-40ef-a445-904f0a76f5f2','2021-09-19 13:33:54',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('9ac07805-68f0-4436-b4ce-11cf468d7df8','2021-09-25 22:56:21',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('9b12dbf4-a951-45ac-b0b1-95689e0bcc56','2021-08-26 10:23:53',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('9b365897-8d4d-4893-9c6a-4f133df0fbbb','2021-09-18 14:15:40',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('9b68f824-1535-4982-9d5f-c0dafe260079','2021-08-09 22:36:26',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('9bcc80cc-f8ff-4769-b4fd-9237caa873e9','2021-08-19 16:52:09',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('9c370110-af7f-49d4-9849-6ae703d924a5','2021-09-25 23:32:41',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('9e459222-ab0a-4095-bd12-138766804c9f','2021-09-25 23:01:35',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('9ed5e23d-273a-4ca2-9c07-16ca60d486a0','2021-09-26 09:25:04',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('9edd54cf-67d4-4af0-949d-5110742db88a','2021-08-19 11:24:49',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('9fc1221d-aaf1-43b3-ba4d-98c037b07125','2021-09-25 22:29:56',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('a01c1f4f-5ed2-421e-8c7f-9bc68a76f6db','2021-08-30 19:33:16',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('a0b656fe-17df-4afd-9672-25cba8677f28','2021-09-18 14:15:40',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('a12e54b6-7ecb-4ae5-a1b9-1771f2c57d29','2021-08-09 22:36:25',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('a1e5ea3c-4f40-4963-831b-9f1d20f2af49','2021-09-25 22:34:27',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('a32456e6-1422-4b23-ac03-5f9177204740','2021-08-19 16:52:09',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('a3807674-fb9b-48cc-a8a8-25ae2d900616','2021-08-19 15:04:28',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('a3a882f4-3b17-40da-aeb4-85f14f4a3bd6','2021-08-19 16:50:13',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('a4c017d2-c610-4c0b-8886-ccff7b4e0b1e','2021-08-29 22:28:07',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('a5074bf8-d961-4c59-9dc7-a4196823d496','2021-09-25 23:01:35',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('a600f0e9-77fa-436e-9013-650a5f927fc8','2021-09-25 22:53:35',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('a68469ad-ff59-4df8-8940-4d3dfdff354a','2021-08-25 14:12:55',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('a7412e47-2d1a-4ce9-8178-b67e4663c1a4','2021-08-28 22:01:30',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('a76f82cf-224a-4d41-a576-dc8318a9f4ca','2021-08-19 16:34:48',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('a80ae0d3-dc85-42c4-a41a-df9111449802','2021-09-25 23:32:40',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('a92b4228-bb3d-4583-b9aa-43a44ded4ddb','2021-08-19 15:04:28',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('ab3e6ada-0081-4072-8890-3d2334988b6e','2021-09-26 09:26:20',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('ab6def7c-1e34-43b0-83c0-63cac87fe7a5','2021-09-26 09:25:04',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('ab92b63c-db47-4018-b5d9-3ee6468ea0fa','2021-09-02 18:50:49',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('ac821b73-79e2-48c8-874c-1dff9b6bf932','2021-08-24 22:34:20',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('acae9996-5005-4742-8289-8052559cacbf','2021-09-02 18:50:49',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('ad2aec58-0d3a-4fdc-b796-c9e3227b1ec9','2021-09-20 13:05:24',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('ad780431-cc33-4b11-8466-46b02d2748af','2021-09-26 09:20:17',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('ad7f5e67-b1a1-403f-a54d-42c3e1716084','2021-08-19 16:50:13',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('ae0ed9d4-e4a1-4397-b70f-79c1d3b44a69','2021-08-25 14:17:29',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('aed973cc-19d5-4229-84bc-237a59339c57','2021-09-20 21:59:56',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('aedec3c0-d5d3-427e-a55a-a729e8664ba0','2021-08-19 16:57:35',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('af36549d-b761-420c-8781-faf3bd168a25','2021-08-19 15:04:28',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('afd8f713-82bf-43be-ba99-ac093c7da770','2021-09-25 20:16:33',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('b0a378e2-bd19-4d0b-8dd3-7a19dc86b26d','2021-09-25 20:36:34',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('b0fe8871-74a3-45f6-9c66-8eae5aeb48e6','2021-08-19 16:57:35',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('b1707db2-5788-4772-bb6d-d0902cf90ec7','2021-09-25 22:56:21',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('b209f753-208f-428f-a1a3-002cd156dfd3','2021-09-25 22:29:56',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('b3d5eef0-38da-47d7-9209-14d161a86c0b','2021-09-02 18:50:49',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('b3ef6c92-823b-4c2f-bb73-f9c7b2e1336b','2021-08-19 16:34:48',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('b485dca2-9165-4b78-9636-87e827f65825','2021-09-20 13:05:23',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('b4c43be1-3a8f-4c72-9ab2-3b9ade4a5992','2021-08-22 13:43:44',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('b6695e99-a071-48ea-9d8f-1b3df29e7f4a','2021-08-29 22:28:07',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('b6dc787c-d5d8-4893-8aa4-025ea4d58410','2021-08-19 16:34:48',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('b764a631-ee5f-47e3-b7cb-434543782af0','2021-09-25 22:53:35',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('b972811c-5af1-499f-8595-5285860c5380','2021-08-25 10:03:32',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('b9fbe5dc-0d13-49a2-9c81-31016774ecaf','2021-09-25 23:32:41',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('ba2d668c-742b-4408-be4e-31ac61d2f449','2021-09-26 09:25:04',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('badab836-7248-4c5a-a030-b9e8fe2fcd16','2021-09-25 22:56:21',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('bc462c1f-2116-49ab-ad70-50b3bfe813eb','2021-09-26 09:20:17',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('bc718922-c4d3-45b4-be05-46b6b720dbf2','2021-08-30 19:33:16',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('bd891fd4-b9ff-4532-9616-db22d5e1f473','2021-09-20 13:05:24',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('bd934581-6624-4ac6-aa98-4bc5caea6d4b','2021-09-25 19:27:06',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('bda30ba0-177e-4013-8225-20447c96cda6','2021-08-28 22:01:30',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('bdda53e4-bd7f-4a5e-81f0-22c20c154ffe','2021-08-22 13:43:44',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('be382a54-cf7f-41b6-ad18-6f9afe2e81b8','2021-08-19 16:23:30',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('be4cf2e1-3d9e-485b-a033-7cd2fc809679','2021-08-26 10:23:53',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('bed72f88-ecb6-470a-80c9-d350f0cdfa9f','2021-09-25 22:41:49',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('c0b8d3f3-7fcc-43dc-9fe7-7c31549a386d','2021-09-25 20:36:34',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('c17992bc-1f26-45b7-84c4-70884d17f828','2021-08-19 16:34:48',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('c1871b80-ffd2-4b14-8fb6-97c478b17f8b','2021-09-26 09:26:20',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('c237fb36-c9d0-4758-b123-4bf29051b94a','2021-09-26 09:20:17',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('c2afedf5-d148-4dfa-9bb0-d2ad6e31576f','2021-08-19 14:50:52',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('c2c05fd8-bf99-438b-9036-9ef71aa38d8e','2021-09-25 23:00:56',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('c32fc887-901e-42ec-a33d-08b266320c03','2021-08-25 14:17:29',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('c33a520b-df68-424f-b229-184bf57404a5','2021-09-20 21:59:56',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('c3b5f923-1aea-4479-8438-af3e1b1eab45','2021-08-19 16:52:09',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('c3b72b0d-c7bb-4e34-9a37-081f9462470b','2021-09-25 23:01:35',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('c3bf3d53-2063-418a-baa1-546aaf29e4a8','2021-09-25 22:41:49',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('c4e8739c-95f4-40ad-94c7-a95a3466978f','2021-08-19 16:23:30',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('c63af6fa-64b2-4d6a-b836-9801599fec63','2021-08-19 15:04:28',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('c6601dd6-7d06-4f78-8981-c57e0adf02f3','2021-08-19 14:53:03',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('c6a4c6f1-bcc0-477e-93c2-e00df6e7f90b','2021-08-25 14:12:54',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('c9002812-32d7-4177-bc84-b624c2cc9707','2021-08-19 16:52:09',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('c93e3dc7-e1f5-4c90-9e43-b7e0df783813','2021-09-20 21:59:56',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('c950b4ac-1c29-411e-b4c7-bf18b67d6aa6','2021-08-26 10:23:53',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('c95709ae-880f-4333-8096-9fdcdd9f32df','2021-09-25 22:56:21',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('c968f191-85e6-4a7a-9c6e-57843477e3cb','2021-08-19 16:56:20',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('c9695529-6c4c-464c-8b9b-1adf9f3b07da','2021-08-25 10:03:31',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('cb1471c7-b745-4d27-9ce8-253103cc9970','2021-09-25 23:00:56',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('cb435cb8-9e10-4856-855c-52ca27e8bf25','2021-09-26 09:20:17',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('cc89d434-19f9-434a-a3b3-db845e174807','2021-09-25 19:27:06',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('cd0b18a5-4e60-4896-a013-9f8182cf0682','2021-09-26 09:25:04',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('cd25eff4-8b18-4600-a935-71d3b75beca6','2021-09-19 13:33:54',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('cd3efa31-7de4-49fa-a0e0-a089334ff4bd','2021-08-25 10:03:32',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('cec5d4db-5cbc-42e4-ab9d-92738cb482d8','2021-08-30 19:33:16',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('cf572e4d-1262-4070-b71f-929c85fcad95','2021-09-25 23:01:35',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('d0900ea4-3f21-4bac-b108-bae2535fc6d9','2021-09-25 23:32:41',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('d0dfd46e-57a3-4e4f-a943-704e3c64bb8e','2021-09-25 22:29:56',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('d1e27e83-98f5-4273-acf4-b56836610ebd','2021-09-19 13:33:54',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('d260c77a-6b02-42f1-afc2-bd2b3bde03a1','2021-09-20 13:05:24',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('d316c525-c426-4f93-b148-ea4801d9e1fa','2021-09-26 09:25:04',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('d373c02b-d650-40a0-bcf1-0ef71e4a1f59','2021-09-25 23:01:35',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('d49284f3-7bab-484a-8d00-6ba9b158c55b','2021-09-25 23:09:05',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('d4bd083f-cce3-4911-b32c-9c038c0f3cca','2021-08-19 11:24:49',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('d6d12c5b-9a22-408d-8e69-3e0909934d0f','2021-08-30 19:33:16',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('d7c2633a-effd-4242-8c42-1601db5860ae','2021-08-19 11:24:49',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('d81e3299-2319-4b82-8874-c826f21bcda6','2021-08-19 16:56:20',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('d81ff781-855f-4d21-9992-a669b07f4cbc','2021-08-19 16:23:30',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('d823addc-53ba-4bd9-8f64-488eb3a47415','2021-08-09 22:36:26',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('d95c2b2c-67f8-4c06-8fbe-3fc9523f8bde','2021-09-25 20:36:34',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('db325e6a-6eb1-47fa-800c-ef0a5c25eea2','2021-08-25 10:03:31',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('dc96e9ba-2b2e-40dd-adce-595b1a8d1f71','2021-09-25 22:53:35',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('dceca758-6b09-490f-a933-a4d4ecca9a10','2021-09-26 09:20:17',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('dd37b8f8-a5c7-42ab-bc48-024bdbde0e9e','2021-09-25 23:09:05',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('dd4a77d4-413e-411d-9c08-55f701970e0e','2021-09-25 22:56:21',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('dd85d899-8c21-4022-9ac4-9dcdf7846a3c','2021-08-19 16:21:07',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('df5ad1bf-0856-447f-9bd2-25bee4fa1e99','2021-08-19 16:21:07',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('e02521a2-fb19-42d8-b6cf-16478691570d','2021-09-25 23:32:41',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('e2812572-303d-4c54-97e7-2b6e466db70f','2021-08-19 15:04:28',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('e2d66583-de52-45ce-92de-bf03eeda6086','2021-08-19 16:21:07',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('e2f0818d-fa29-4529-bb41-0039d762d75b','2021-08-26 10:23:53',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('e330b261-5e72-40a6-99a4-4f090b00fa4b','2021-08-19 14:50:52',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('e338942d-df5c-41fe-99b0-7411ff88d238','2021-08-19 16:50:13',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('e39687f9-eaea-47f9-8e74-f51d410ce76c','2021-08-19 16:34:48',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('e3998b07-344a-4a26-a256-dd51b01ed829','2021-08-19 14:53:02',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('e41a3c3f-b687-4693-a264-600421c7e168','2021-09-20 13:05:24',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('e4e2026f-7737-43c5-956f-0fe30889b438','2021-08-19 14:50:52',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('e6011085-1633-4d2c-a3e3-7349fc9ed962','2021-08-19 14:50:00',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('e63cf03a-699a-47fd-bcaa-c6dd63178368','2021-09-25 23:00:56',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('e84f77d3-217c-4a98-af11-17f2661172f1','2021-08-22 13:43:44',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('e9516f36-5774-4d3b-9187-9f63189dfe1d','2021-08-09 22:36:26',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('e98d2ace-4900-4bee-96f8-66296f5f04d9','2021-08-19 15:04:28',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('eb4b0b9c-d62a-4435-b6fc-c4130053f1e0','2021-09-19 13:33:53',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('eb7574c8-b363-49af-8e29-3055bcf95037','2021-09-25 20:41:27',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('eb806f36-9da1-40bc-85f7-baf019530f0c','2021-08-25 14:12:55',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('ebb9cb85-1715-4c6f-872c-3879159f1cda','2021-09-25 23:01:35',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('edd18e8d-fb27-41cd-be6e-958dceb4668b','2021-08-24 14:04:42',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('edfcdaf7-8e25-4a48-8752-5eff8f02b76f','2021-09-25 20:36:33',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('ee77c22b-dc8f-458e-9e12-dbc1b4af0f54','2021-08-24 14:04:42',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('eeb6d048-a9be-4b4e-8776-728723a1f0cd','2021-08-19 16:23:29',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('eec9193b-a47b-4ecd-a16a-e65d9053236d','2021-09-20 13:05:24',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('ef298e45-efb4-4af7-b240-2fe3370adf3a','2021-08-19 16:21:07',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('ef623313-4dc4-47b4-bf4a-d3523684fdcd','2021-09-25 22:53:35',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('f0447f97-2a63-4afc-93ee-3bc5371aca74','2021-08-19 16:21:07',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('f115a0ad-7312-4f10-8b0b-e04e61f1bddb','2021-09-25 20:41:27',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('f1bc68c1-5390-479a-b661-e0f5734dfbd4','2021-09-25 20:41:27',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('f2703219-dfc7-4346-bd98-767ff29d27d5','2021-08-19 16:57:35',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('f407fdec-96e8-4789-8885-3c46b41e81c1','2021-09-26 09:20:17',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('f422c53d-9426-4cb2-b4cf-e88583b8a719','2021-08-25 14:12:55',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('f4af96ac-f8a6-4f28-ab53-f4606f077cc5','2021-09-26 09:25:04',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('f4dd4b0a-4bfb-4127-8ed0-5ae9c4dfb819','2021-09-20 13:05:24',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('f514b5da-ab53-4c13-8c43-ffa354889779','2021-09-25 19:27:06',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('f544ee34-429f-4fd1-a313-d5cc04b189e4','2021-09-26 09:26:20',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('f5fae5a6-def2-43b7-a052-f7f4d43342f0','2021-08-19 16:50:13',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('f70a532e-d4aa-4c7c-957a-8b0607ae4d64','2021-09-26 09:26:20',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('f72dde3f-02c7-4050-8f0c-ecbc2ee56c21','2021-09-25 22:34:28',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('f826e8dc-5d18-4797-b297-7e04276da669','2021-08-28 22:01:30',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('f9b5e416-88b8-45ea-8f86-7afa7fdf4d02','2021-09-25 20:36:34',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('fa0bc4fe-4cff-4792-9ea1-b456a7904fe2','2021-08-19 16:52:09',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('fae50cb6-e020-42e8-b754-9c96293ff788','2021-08-19 16:56:20',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('fb4bc1e0-0128-4e14-bf8e-2758f3b1919c','2021-09-20 21:59:56',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('fb7f08a6-d074-43d5-a705-9d46c7d6aa18','2021-09-18 14:15:39',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('fcb0f27e-9ef0-460b-8afb-93cd69e737de','2021-08-19 14:50:52',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('fd9406f1-2010-4086-8cea-9ef768db1f19','2021-08-19 14:53:03',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4'),('ffde2e93-669a-4354-87bf-d47acbb042c0','2021-08-24 14:04:42',1,NULL,'pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4');
/*!40000 ALTER TABLE `auth_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authzforce`
--

DROP TABLE IF EXISTS `authzforce`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authzforce` (
  `az_domain` varchar(255) NOT NULL,
  `policy` char(36) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `oauth_client_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`az_domain`),
  KEY `oauth_client_id` (`oauth_client_id`),
  CONSTRAINT `authzforce_ibfk_1` FOREIGN KEY (`oauth_client_id`) REFERENCES `oauth_client` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authzforce`
--

LOCK TABLES `authzforce` WRITE;
/*!40000 ALTER TABLE `authzforce` DISABLE KEYS */;
/*!40000 ALTER TABLE `authzforce` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delegation_evidence`
--

DROP TABLE IF EXISTS `delegation_evidence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `delegation_evidence` (
  `policy_issuer` varchar(255) NOT NULL,
  `access_subject` varchar(255) NOT NULL,
  `policy` json NOT NULL,
  PRIMARY KEY (`policy_issuer`,`access_subject`),
  UNIQUE KEY `policy_issuer_access_subject_unique` (`policy_issuer`,`access_subject`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delegation_evidence`
--

LOCK TABLES `delegation_evidence` WRITE;
/*!40000 ALTER TABLE `delegation_evidence` DISABLE KEYS */;
/*!40000 ALTER TABLE `delegation_evidence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eidas_credentials`
--

DROP TABLE IF EXISTS `eidas_credentials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eidas_credentials` (
  `id` varchar(36) NOT NULL,
  `support_contact_person_name` varchar(255) DEFAULT NULL,
  `support_contact_person_surname` varchar(255) DEFAULT NULL,
  `support_contact_person_email` varchar(255) DEFAULT NULL,
  `support_contact_person_telephone_number` varchar(255) DEFAULT NULL,
  `support_contact_person_company` varchar(255) DEFAULT NULL,
  `technical_contact_person_name` varchar(255) DEFAULT NULL,
  `technical_contact_person_surname` varchar(255) DEFAULT NULL,
  `technical_contact_person_email` varchar(255) DEFAULT NULL,
  `technical_contact_person_telephone_number` varchar(255) DEFAULT NULL,
  `technical_contact_person_company` varchar(255) DEFAULT NULL,
  `organization_name` varchar(255) DEFAULT NULL,
  `organization_url` varchar(255) DEFAULT NULL,
  `oauth_client_id` varchar(36) DEFAULT NULL,
  `organization_nif` varchar(255) DEFAULT NULL,
  `sp_type` varchar(255) DEFAULT 'private',
  `attributes_list` json DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `oauth_client_id` (`oauth_client_id`),
  CONSTRAINT `eidas_credentials_ibfk_1` FOREIGN KEY (`oauth_client_id`) REFERENCES `oauth_client` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eidas_credentials`
--

LOCK TABLES `eidas_credentials` WRITE;
/*!40000 ALTER TABLE `eidas_credentials` DISABLE KEYS */;
/*!40000 ALTER TABLE `eidas_credentials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `iot`
--

DROP TABLE IF EXISTS `iot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `iot` (
  `id` varchar(255) NOT NULL,
  `password` varchar(40) DEFAULT NULL,
  `oauth_client_id` varchar(36) DEFAULT NULL,
  `salt` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_client_id` (`oauth_client_id`),
  CONSTRAINT `iot_ibfk_1` FOREIGN KEY (`oauth_client_id`) REFERENCES `oauth_client` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `iot`
--

LOCK TABLES `iot` WRITE;
/*!40000 ALTER TABLE `iot` DISABLE KEYS */;
/*!40000 ALTER TABLE `iot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_access_token`
--

DROP TABLE IF EXISTS `oauth_access_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_access_token` (
  `access_token` text NOT NULL,
  `expires` datetime DEFAULT NULL,
  `scope` varchar(2000) DEFAULT NULL,
  `refresh_token` varchar(255) DEFAULT NULL,
  `valid` tinyint(1) DEFAULT NULL,
  `extra` json DEFAULT NULL,
  `oauth_client_id` varchar(36) DEFAULT NULL,
  `user_id` varchar(36) DEFAULT NULL,
  `iot_id` varchar(255) DEFAULT NULL,
  `authorization_code` varchar(255) DEFAULT NULL,
  `hash` char(64) NOT NULL,
  PRIMARY KEY (`hash`),
  UNIQUE KEY `oauth_access_token_hash_uk` (`hash`),
  KEY `oauth_client_id` (`oauth_client_id`),
  KEY `user_id` (`user_id`),
  KEY `iot_id` (`iot_id`),
  KEY `refresh_token` (`refresh_token`),
  KEY `authorization_code_at` (`authorization_code`),
  CONSTRAINT `authorization_code_at` FOREIGN KEY (`authorization_code`) REFERENCES `oauth_authorization_code` (`authorization_code`) ON DELETE CASCADE,
  CONSTRAINT `oauth_access_token_ibfk_1` FOREIGN KEY (`oauth_client_id`) REFERENCES `oauth_client` (`id`) ON DELETE CASCADE,
  CONSTRAINT `oauth_access_token_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  CONSTRAINT `oauth_access_token_ibfk_3` FOREIGN KEY (`iot_id`) REFERENCES `iot` (`id`) ON DELETE CASCADE,
  CONSTRAINT `refresh_token` FOREIGN KEY (`refresh_token`) REFERENCES `oauth_refresh_token` (`refresh_token`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_access_token`
--

LOCK TABLES `oauth_access_token` WRITE;
/*!40000 ALTER TABLE `oauth_access_token` DISABLE KEYS */;
INSERT INTO `oauth_access_token` VALUES ('5e2fa5601a1954c74107ee84fe141843693a6624',NULL,'token,permanent',NULL,1,NULL,'47d89a60-79f3-423a-8898-1bfe823c3769','9ff94f95-9d51-41f3-8923-318704678c83',NULL,'adde6e01322d74fb6f595940b4cba859314d2170','10154cab9cf90794d3db87a60cea2402681510a47e6ce0b4a60018fcf143a0b6'),('961d574545e621430e856b5e03343d0057b92ee1',NULL,'token,permanent',NULL,1,NULL,'47d89a60-79f3-423a-8898-1bfe823c3769','9ff94f95-9d51-41f3-8923-318704678c83',NULL,'ccf6fbc015852adde92b068e903b794e5dada58d','11f15f95d07169d10e1d50cca24a6995d5f7816b519cf904ee1ea0f26d284652'),('818b388d9523d931d9c44d7e9a0d5a4bd21aff55',NULL,'token,permanent',NULL,1,NULL,'47d89a60-79f3-423a-8898-1bfe823c3769','9ff94f95-9d51-41f3-8923-318704678c83',NULL,'608f9386fa72d92e5010ecce388fbf6b3562cf8e','166cbb647cf540fc31c93bee3bad0fc13985fb5bdf0dcb92012da7ffcf4060a9'),('c82c3b9e7c697d0d00ab3234a52b874744c9b9d9',NULL,'token,permanent',NULL,1,NULL,'47d89a60-79f3-423a-8898-1bfe823c3769','37ff7ea9-e8c1-416b-82f1-5ce3c5e68ed5',NULL,'05441b8660b22312b9b07ed245e66969dd23b2d1','22c9c14720c9600037b8b3e666702afb9f171812b4afde30af156b3809ffb7b9'),('72a6fb932a12eb9eceac2772fd844cb73195ee54',NULL,'token,permanent',NULL,1,NULL,'47d89a60-79f3-423a-8898-1bfe823c3769','9ff94f95-9d51-41f3-8923-318704678c83',NULL,'92f49e48f83ce2dd63b96cf809504e43d359010a','23368901527f34c07a5acebbe56756ab13f2350d9f8f641b29c8ace12fb98544'),('d827ad522567fd241f2e8f5ad4efa2f36cfb94b4',NULL,'token,permanent',NULL,1,NULL,'47d89a60-79f3-423a-8898-1bfe823c3769','9ff94f95-9d51-41f3-8923-318704678c83',NULL,'39438b1b4607fc5747308de46718607bb3075b7a','2805f878445dcd705ef4344190528caae3a5e9925f0db6c27bdaf75317abd7f8'),('ef070bba3e31fec5c730dc5abcd955a5afbcabb8',NULL,'token,permanent',NULL,1,NULL,'47d89a60-79f3-423a-8898-1bfe823c3769','37ff7ea9-e8c1-416b-82f1-5ce3c5e68ed5',NULL,'d7ea352fb70c04a3b2b5ad29e6f791bdc63a5146','2bfd83c59bc5b226ed0eb37a79869479af2bab5ecc2f1042b3c8a36fb69ce77f'),('2758f18aafd96b0fa9609a8a74bbe4249b318632',NULL,'token,permanent',NULL,1,NULL,'47d89a60-79f3-423a-8898-1bfe823c3769','admin',NULL,'59e447d36b4fe381b379d65dd5037a19b3fd5945','3b5b552dc99586e4875861389cfdb0e3509a72ad4b60c684f25d2a84ffdc8591'),('174f4835d8e4c00df2d68508b5aa34e009125716',NULL,'token,permanent',NULL,1,NULL,'47d89a60-79f3-423a-8898-1bfe823c3769','9ff94f95-9d51-41f3-8923-318704678c83',NULL,'0e6e2816c8016d3c9b7f7bba26c9e6c7df480fa9','41d72d4023fd0fcbfffbe74850f8c99186626b848dabc52a8f6c5be51fb2581f'),('978616c94d8010cfbc24bbb8e671a0e0bd3a1c41',NULL,'token,permanent',NULL,1,NULL,'47d89a60-79f3-423a-8898-1bfe823c3769','9ff94f95-9d51-41f3-8923-318704678c83',NULL,'38fa6b8c97665a2dc58e503bf2073f6a90c9c6be','465ede06ad4bc1190fc5e077a65f023c557e473e418f5a99a167585aed3e1253'),('d3a9c3a6fc52cc73c19edbd6d8fa2c1842d8d917',NULL,'token,permanent',NULL,1,NULL,'47d89a60-79f3-423a-8898-1bfe823c3769','37ff7ea9-e8c1-416b-82f1-5ce3c5e68ed5',NULL,'20cd52e80cd609b89bdcc375221031f860747cb2','54dc978f6feca149ed0970cf927e5fd998e6b2516a3ad46f92a7338dfe005496'),('1ea389bfdb5d784007d0baccadeaac3abb17096a',NULL,'token,permanent',NULL,1,NULL,'47d89a60-79f3-423a-8898-1bfe823c3769','37ff7ea9-e8c1-416b-82f1-5ce3c5e68ed5',NULL,'3bca3392413f708512d0ae6f925b47949f72514e','68ae11ab3c9b08844b02103f8f018af7d66f5433a69948f3c2b188e62616288b'),('aac63d4e6734cb33d43de77bed07c446beb86668',NULL,'token,permanent',NULL,1,NULL,'47d89a60-79f3-423a-8898-1bfe823c3769','9ff94f95-9d51-41f3-8923-318704678c83',NULL,'695e978f845fa4d130619cb54e24a5297f5a1210','71749e4f6a9989d49a4fcc3cb35cdccd9624e5971f7a879cedca469b1305dede'),('6ac83f7b5999bfb71b80f183e59738d10f47af4a',NULL,'token,permanent',NULL,1,NULL,'47d89a60-79f3-423a-8898-1bfe823c3769','37ff7ea9-e8c1-416b-82f1-5ce3c5e68ed5',NULL,'8efaffaf8986cf3e3cb50be5a64f67f49099fd71','7b39cd22dd88cdf1a4a795c88543722b8d608712d3f8f52f64b86974dac31003'),('9c953c1ce6bca1c1da13701fb7b1df935feb93ec',NULL,'token,permanent',NULL,1,NULL,'47d89a60-79f3-423a-8898-1bfe823c3769','9ff94f95-9d51-41f3-8923-318704678c83',NULL,'2c2e7e59190a0c40150f84ac91eeda46c8c53136','7dac02ad8ea092a91a64a86e33b68a920e2f69f8f039220b799e86310a66e515'),('944d99a31331a33d3849b6ac4e15bea54092b746',NULL,'token,permanent',NULL,1,NULL,'47d89a60-79f3-423a-8898-1bfe823c3769','9ff94f95-9d51-41f3-8923-318704678c83',NULL,'c01c51ff3921435914654c26657ce78b95b9f1fb','885927ff7c27cd3d56dadc7b87d55e9a93778ff69cc0525a3789526e990a07d0'),('671e1188db4f9b7e6778ab2bbe8486baf31b5282',NULL,'token,permanent',NULL,1,NULL,'47d89a60-79f3-423a-8898-1bfe823c3769','9ff94f95-9d51-41f3-8923-318704678c83',NULL,'bc53890d129af67ebdca4fd887660f49e0f3769e','8f4a77a81cd337eb87c4906fd5a166b28764985a259b84326e798a8199c53934'),('635958d19abbcf7eb2139c7cfa8ed7fc6707b719',NULL,'token,permanent',NULL,1,NULL,'47d89a60-79f3-423a-8898-1bfe823c3769','9ff94f95-9d51-41f3-8923-318704678c83',NULL,'84aea9dd9e2c6ba696c775fe057d661c9e8a606a','94c8819b26a7c7a9294cb81b5cf20549880cb63639179240dcb951e2da0233fd'),('bd287babac5c1b63719fee999c65ee19cb51aab0',NULL,'token,permanent',NULL,1,NULL,'47d89a60-79f3-423a-8898-1bfe823c3769','9ff94f95-9d51-41f3-8923-318704678c83',NULL,'7e2a6e14d1833dea04d1ac215835d7b7badceb35','97916d0b9ad8d19b4d90f5be85fffc2d2f877e8d0fc1a1e4bf287a3fbde4bb45'),('6a991035f61afa3f9a4a4c4cb388ad293ccfa1ca',NULL,'token,permanent',NULL,1,NULL,'47d89a60-79f3-423a-8898-1bfe823c3769','9ff94f95-9d51-41f3-8923-318704678c83',NULL,'417df437ab45f15486f18fa5dbf4c8afc4c03e24','98ca0f1a44e1f0162bbc5c9aef9349eac18202751b4643efe867f5760650d3fa'),('28a165e8d9fc9742bc49c5d304af5db37208c651',NULL,'token,permanent',NULL,1,NULL,'47d89a60-79f3-423a-8898-1bfe823c3769','admin',NULL,'0875908f53d661a499066bbe050f87c6ce1f4a14','98f02dd7bac34bfc12bc20f7d50476ab6367dc26b6d303ca4cdb843661137fca'),('07e5d87b0f22850794403b8096e98549f81188f8',NULL,'token,permanent',NULL,1,NULL,'47d89a60-79f3-423a-8898-1bfe823c3769','9ff94f95-9d51-41f3-8923-318704678c83',NULL,'a3e4a87bacce8f67deb87a8211be9bca878a1a40','a21921f7dd2d700e2b1880c4ed4b4f430e27a87bf32f9de5b0582bbe3075e6dc'),('9a1c84c960353962c9a14d3c5d8748b544a2aa0f',NULL,'token,permanent',NULL,1,NULL,'47d89a60-79f3-423a-8898-1bfe823c3769','37ff7ea9-e8c1-416b-82f1-5ce3c5e68ed5',NULL,'78a96f03f25d29f0a321c911e71114c0ca34232e','a93d4d24bdaae51d1870324db5d4b355de2538a732f64c5b9ec9909bab8b468d'),('c73baabedb1e635913296dd6aed9d37ef6986c2a',NULL,'token,permanent',NULL,1,NULL,'47d89a60-79f3-423a-8898-1bfe823c3769','37ff7ea9-e8c1-416b-82f1-5ce3c5e68ed5',NULL,'dc1f0be256dd133ab946b2338aeb4ce122794d0a','c16d7059fa4ab9f127e677292e70bafa017e966efcc8cef963bc625e310e0888'),('6c663bc47075da30ea8f284fd239a8c3d0d341be',NULL,'token,permanent',NULL,1,NULL,'47d89a60-79f3-423a-8898-1bfe823c3769','9ff94f95-9d51-41f3-8923-318704678c83',NULL,'399f1c2a7dc1f635e135b9fe297aff20238ff235','c9584dbf712283eb1147d41b644f74124ec5566f74f6a08a9a76d506bac51f70'),('9a8fa51926d65341124d7a88c1261c5243d2b2a8',NULL,'token,permanent',NULL,1,NULL,'47d89a60-79f3-423a-8898-1bfe823c3769','9ff94f95-9d51-41f3-8923-318704678c83',NULL,'c75be989e4ece33c66e4eeb3cbc7cda519706d0b','cfdb7d2f362eb4eab68f26b0e08ea356989ce7acae17ac5e3864a9e7a66b7fcb'),('90594d83af18f1c750270c1bcb5aedc2bc495455',NULL,'token,permanent',NULL,1,NULL,'47d89a60-79f3-423a-8898-1bfe823c3769','37ff7ea9-e8c1-416b-82f1-5ce3c5e68ed5',NULL,'8ea7fececfc704d17740cb8a8db790c7af3cf342','e50190ef165766b768d2c5cab3b83eda2634c781c945581ed699360c61cf7a5c'),('3bdf24543e86aef7b6856949a3e7f697babcb627',NULL,'token,permanent',NULL,1,NULL,'47d89a60-79f3-423a-8898-1bfe823c3769','37ff7ea9-e8c1-416b-82f1-5ce3c5e68ed5',NULL,'c5a5515fa7a2eae807b8ce42233ea85c5a3704a5','ee2271575331680382f3ab9e17c19fa080b094b0d284b2a408143cacc8d77a8e');
/*!40000 ALTER TABLE `oauth_access_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_authorization_code`
--

DROP TABLE IF EXISTS `oauth_authorization_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_authorization_code` (
  `authorization_code` varchar(256) NOT NULL,
  `expires` datetime DEFAULT NULL,
  `redirect_uri` varchar(2000) DEFAULT NULL,
  `scope` varchar(2000) DEFAULT NULL,
  `valid` tinyint(1) DEFAULT NULL,
  `extra` json DEFAULT NULL,
  `oauth_client_id` varchar(36) DEFAULT NULL,
  `user_id` varchar(36) DEFAULT NULL,
  `nonce` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`authorization_code`),
  UNIQUE KEY `authorization_code` (`authorization_code`),
  KEY `oauth_client_id` (`oauth_client_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `oauth_authorization_code_ibfk_1` FOREIGN KEY (`oauth_client_id`) REFERENCES `oauth_client` (`id`) ON DELETE CASCADE,
  CONSTRAINT `oauth_authorization_code_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_authorization_code`
--

LOCK TABLES `oauth_authorization_code` WRITE;
/*!40000 ALTER TABLE `oauth_authorization_code` DISABLE KEYS */;
INSERT INTO `oauth_authorization_code` VALUES ('05441b8660b22312b9b07ed245e66969dd23b2d1','2021-09-25 18:33:37','http://127.0.0.1:8000/auth','token,permanent',0,'{\"iat\": \"2021-09-25T18:28:37.752Z\"}','47d89a60-79f3-423a-8898-1bfe823c3769','37ff7ea9-e8c1-416b-82f1-5ce3c5e68ed5',NULL),('0875908f53d661a499066bbe050f87c6ce1f4a14','2021-08-04 23:06:45','http://127.0.0.1:8000/auth','token,permanent',0,'{\"iat\": \"2021-08-04T23:01:45.597Z\"}','47d89a60-79f3-423a-8898-1bfe823c3769','admin',NULL),('0e6e2816c8016d3c9b7f7bba26c9e6c7df480fa9','2021-08-22 16:12:53','http://127.0.0.1:8000/auth','token,permanent',0,'{\"iat\": \"2021-08-22T16:07:53.394Z\"}','47d89a60-79f3-423a-8898-1bfe823c3769','9ff94f95-9d51-41f3-8923-318704678c83',NULL),('20cd52e80cd609b89bdcc375221031f860747cb2','2021-08-28 21:09:14','http://127.0.0.1:8000/auth','token,permanent',0,'{\"iat\": \"2021-08-28T21:04:14.193Z\"}','47d89a60-79f3-423a-8898-1bfe823c3769','37ff7ea9-e8c1-416b-82f1-5ce3c5e68ed5',NULL),('2c2e7e59190a0c40150f84ac91eeda46c8c53136','2021-09-25 21:40:14','http://127.0.0.1:8000/auth','token,permanent',0,'{\"iat\": \"2021-09-25T21:35:14.429Z\"}','47d89a60-79f3-423a-8898-1bfe823c3769','9ff94f95-9d51-41f3-8923-318704678c83',NULL),('38fa6b8c97665a2dc58e503bf2073f6a90c9c6be','2021-08-24 21:39:36','http://127.0.0.1:8000/auth','token,permanent',0,'{\"iat\": \"2021-08-24T21:34:36.985Z\"}','47d89a60-79f3-423a-8898-1bfe823c3769','9ff94f95-9d51-41f3-8923-318704678c83',NULL),('39438b1b4607fc5747308de46718607bb3075b7a','2021-09-25 22:06:43','http://127.0.0.1:8000/auth','token,permanent',0,'{\"iat\": \"2021-09-25T22:01:43.920Z\"}','47d89a60-79f3-423a-8898-1bfe823c3769','9ff94f95-9d51-41f3-8923-318704678c83',NULL),('399f1c2a7dc1f635e135b9fe297aff20238ff235','2021-08-24 14:38:43','http://127.0.0.1:8000/auth','token,permanent',0,'{\"iat\": \"2021-08-24T14:33:43.929Z\"}','47d89a60-79f3-423a-8898-1bfe823c3769','9ff94f95-9d51-41f3-8923-318704678c83',NULL),('3bca3392413f708512d0ae6f925b47949f72514e','2021-08-26 19:34:06','http://127.0.0.1:8000/auth','token,permanent',0,'{\"iat\": \"2021-08-26T19:29:06.862Z\"}','47d89a60-79f3-423a-8898-1bfe823c3769','37ff7ea9-e8c1-416b-82f1-5ce3c5e68ed5',NULL),('417df437ab45f15486f18fa5dbf4c8afc4c03e24','2021-08-28 21:09:26','http://127.0.0.1:8000/auth','token,permanent',0,'{\"iat\": \"2021-08-28T21:04:26.282Z\"}','47d89a60-79f3-423a-8898-1bfe823c3769','9ff94f95-9d51-41f3-8923-318704678c83',NULL),('59e447d36b4fe381b379d65dd5037a19b3fd5945','2021-08-09 21:46:44','http://127.0.0.1:8000/auth','token,permanent',0,'{\"iat\": \"2021-08-09T21:41:44.757Z\"}','47d89a60-79f3-423a-8898-1bfe823c3769','admin',NULL),('608f9386fa72d92e5010ecce388fbf6b3562cf8e','2021-08-24 16:42:40','http://127.0.0.1:8000/auth','token,permanent',0,'{\"iat\": \"2021-08-24T16:37:40.382Z\"}','47d89a60-79f3-423a-8898-1bfe823c3769','9ff94f95-9d51-41f3-8923-318704678c83',NULL),('695e978f845fa4d130619cb54e24a5297f5a1210','2021-09-20 19:31:26','http://127.0.0.1:8000/auth','token,permanent',0,'{\"iat\": \"2021-09-20T19:26:26.571Z\"}','47d89a60-79f3-423a-8898-1bfe823c3769','9ff94f95-9d51-41f3-8923-318704678c83',NULL),('78a96f03f25d29f0a321c911e71114c0ca34232e','2021-08-29 21:59:32','http://127.0.0.1:8000/auth','token,permanent',0,'{\"iat\": \"2021-08-29T21:54:32.981Z\"}','47d89a60-79f3-423a-8898-1bfe823c3769','37ff7ea9-e8c1-416b-82f1-5ce3c5e68ed5',NULL),('7e2a6e14d1833dea04d1ac215835d7b7badceb35','2021-09-25 18:32:40','http://127.0.0.1:8000/auth','token,permanent',0,'{\"iat\": \"2021-09-25T18:27:40.790Z\"}','47d89a60-79f3-423a-8898-1bfe823c3769','9ff94f95-9d51-41f3-8923-318704678c83',NULL),('84aea9dd9e2c6ba696c775fe057d661c9e8a606a','2021-09-25 21:58:03','http://127.0.0.1:8000/auth','token,permanent',0,'{\"iat\": \"2021-09-25T21:53:03.798Z\"}','47d89a60-79f3-423a-8898-1bfe823c3769','9ff94f95-9d51-41f3-8923-318704678c83',NULL),('8ea7fececfc704d17740cb8a8db790c7af3cf342','2021-08-29 01:24:00','http://127.0.0.1:8000/auth','token,permanent',0,'{\"iat\": \"2021-08-29T01:19:00.459Z\"}','47d89a60-79f3-423a-8898-1bfe823c3769','37ff7ea9-e8c1-416b-82f1-5ce3c5e68ed5',NULL),('8efaffaf8986cf3e3cb50be5a64f67f49099fd71','2021-08-26 19:30:17','http://127.0.0.1:8000/auth','token,permanent',0,'{\"iat\": \"2021-08-26T19:25:17.560Z\"}','47d89a60-79f3-423a-8898-1bfe823c3769','37ff7ea9-e8c1-416b-82f1-5ce3c5e68ed5',NULL),('92f49e48f83ce2dd63b96cf809504e43d359010a','2021-08-19 14:14:21','http://127.0.0.1:8000/auth','token,permanent',0,'{\"iat\": \"2021-08-19T14:09:21.672Z\"}','47d89a60-79f3-423a-8898-1bfe823c3769','9ff94f95-9d51-41f3-8923-318704678c83',NULL),('a3e4a87bacce8f67deb87a8211be9bca878a1a40','2021-09-25 18:35:42','http://127.0.0.1:8000/auth','token,permanent',0,'{\"iat\": \"2021-09-25T18:30:42.179Z\"}','47d89a60-79f3-423a-8898-1bfe823c3769','9ff94f95-9d51-41f3-8923-318704678c83',NULL),('adde6e01322d74fb6f595940b4cba859314d2170','2021-09-25 22:14:14','http://127.0.0.1:8000/auth','token,permanent',0,'{\"iat\": \"2021-09-25T22:09:14.788Z\"}','47d89a60-79f3-423a-8898-1bfe823c3769','9ff94f95-9d51-41f3-8923-318704678c83',NULL),('bc53890d129af67ebdca4fd887660f49e0f3769e','2021-08-25 16:27:12','http://127.0.0.1:8000/auth','token,permanent',0,'{\"iat\": \"2021-08-25T16:22:12.179Z\"}','47d89a60-79f3-423a-8898-1bfe823c3769','9ff94f95-9d51-41f3-8923-318704678c83',NULL),('c01c51ff3921435914654c26657ce78b95b9f1fb','2021-09-25 21:58:45','http://127.0.0.1:8000/auth','token,permanent',0,'{\"iat\": \"2021-09-25T21:53:45.400Z\"}','47d89a60-79f3-423a-8898-1bfe823c3769','9ff94f95-9d51-41f3-8923-318704678c83',NULL),('c5a5515fa7a2eae807b8ce42233ea85c5a3704a5','2021-09-20 12:12:44','http://127.0.0.1:8000/auth','token,permanent',0,'{\"iat\": \"2021-09-20T12:07:44.632Z\"}','47d89a60-79f3-423a-8898-1bfe823c3769','37ff7ea9-e8c1-416b-82f1-5ce3c5e68ed5',NULL),('c75be989e4ece33c66e4eeb3cbc7cda519706d0b','2021-08-26 22:05:22','http://127.0.0.1:8000/auth','token,permanent',0,'{\"iat\": \"2021-08-26T22:00:22.996Z\"}','47d89a60-79f3-423a-8898-1bfe823c3769','9ff94f95-9d51-41f3-8923-318704678c83',NULL),('ccf6fbc015852adde92b068e903b794e5dada58d','2021-09-25 21:47:01','http://127.0.0.1:8000/auth','token,permanent',0,'{\"iat\": \"2021-09-25T21:42:01.660Z\"}','47d89a60-79f3-423a-8898-1bfe823c3769','9ff94f95-9d51-41f3-8923-318704678c83',NULL),('d7ea352fb70c04a3b2b5ad29e6f791bdc63a5146','2021-09-02 17:56:28','http://127.0.0.1:8000/auth','token,permanent',0,'{\"iat\": \"2021-09-02T17:51:28.688Z\"}','47d89a60-79f3-423a-8898-1bfe823c3769','37ff7ea9-e8c1-416b-82f1-5ce3c5e68ed5',NULL),('dc1f0be256dd133ab946b2338aeb4ce122794d0a','2021-09-18 13:26:01','http://127.0.0.1:8000/auth','token,permanent',0,'{\"iat\": \"2021-09-18T13:21:01.513Z\"}','47d89a60-79f3-423a-8898-1bfe823c3769','37ff7ea9-e8c1-416b-82f1-5ce3c5e68ed5',NULL),('ddc1cbd3fbe8da73ac00b7467736a4049a6548b2','2021-08-04 23:05:54','http://127.0.0.1:8000/auth','token,permanent',0,'{\"iat\": \"2021-08-04T23:00:54.828Z\"}','47d89a60-79f3-423a-8898-1bfe823c3769','admin',NULL);
/*!40000 ALTER TABLE `oauth_authorization_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_client`
--

DROP TABLE IF EXISTS `oauth_client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_client` (
  `id` varchar(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `secret` char(36) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `url` varchar(2000) DEFAULT NULL,
  `redirect_uri` varchar(2000) DEFAULT NULL,
  `image` varchar(255) DEFAULT 'default',
  `grant_type` varchar(255) DEFAULT NULL,
  `response_type` varchar(255) DEFAULT NULL,
  `client_type` varchar(15) DEFAULT NULL,
  `scope` varchar(2000) DEFAULT NULL,
  `extra` json DEFAULT NULL,
  `token_types` varchar(2000) DEFAULT NULL,
  `jwt_secret` varchar(255) DEFAULT NULL,
  `redirect_sign_out_uri` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_client`
--

LOCK TABLES `oauth_client` WRITE;
/*!40000 ALTER TABLE `oauth_client` DISABLE KEYS */;
INSERT INTO `oauth_client` VALUES ('47d89a60-79f3-423a-8898-1bfe823c3769','Movie Library','All movies in one place!','2bbd6ede-b454-4e64-8009-377a7a4c29df','http://127.0.0.1:8000','http://127.0.0.1:8000/auth','default','authorization_code,implicit,password,client_credentials,refresh_token,hybrid','code,token',NULL,NULL,NULL,'permanent,bearer',NULL,'http://127.0.0.1:8000/signout'),('idm_admin_app','idm','idm',NULL,'','','default','','',NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `oauth_client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_refresh_token`
--

DROP TABLE IF EXISTS `oauth_refresh_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_refresh_token` (
  `refresh_token` varchar(256) NOT NULL,
  `expires` datetime DEFAULT NULL,
  `scope` varchar(2000) DEFAULT NULL,
  `oauth_client_id` varchar(36) DEFAULT NULL,
  `user_id` varchar(36) DEFAULT NULL,
  `iot_id` varchar(255) DEFAULT NULL,
  `authorization_code` varchar(255) DEFAULT NULL,
  `valid` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`refresh_token`),
  UNIQUE KEY `refresh_token` (`refresh_token`),
  KEY `oauth_client_id` (`oauth_client_id`),
  KEY `user_id` (`user_id`),
  KEY `iot_id` (`iot_id`),
  KEY `authorization_code_rt` (`authorization_code`),
  CONSTRAINT `authorization_code_rt` FOREIGN KEY (`authorization_code`) REFERENCES `oauth_authorization_code` (`authorization_code`) ON DELETE CASCADE,
  CONSTRAINT `oauth_refresh_token_ibfk_1` FOREIGN KEY (`oauth_client_id`) REFERENCES `oauth_client` (`id`) ON DELETE CASCADE,
  CONSTRAINT `oauth_refresh_token_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  CONSTRAINT `oauth_refresh_token_ibfk_3` FOREIGN KEY (`iot_id`) REFERENCES `iot` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_refresh_token`
--

LOCK TABLES `oauth_refresh_token` WRITE;
/*!40000 ALTER TABLE `oauth_refresh_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_refresh_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_scope`
--

DROP TABLE IF EXISTS `oauth_scope`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_scope` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `scope` varchar(255) DEFAULT NULL,
  `is_default` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_scope`
--

LOCK TABLES `oauth_scope` WRITE;
/*!40000 ALTER TABLE `oauth_scope` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_scope` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organization`
--

DROP TABLE IF EXISTS `organization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `organization` (
  `id` varchar(36) NOT NULL,
  `name` varchar(64) DEFAULT NULL,
  `description` text,
  `website` varchar(2000) DEFAULT NULL,
  `image` varchar(255) DEFAULT 'default',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organization`
--

LOCK TABLES `organization` WRITE;
/*!40000 ALTER TABLE `organization` DISABLE KEYS */;
/*!40000 ALTER TABLE `organization` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pep_proxy`
--

DROP TABLE IF EXISTS `pep_proxy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pep_proxy` (
  `id` varchar(255) NOT NULL,
  `password` varchar(40) DEFAULT NULL,
  `oauth_client_id` varchar(36) DEFAULT NULL,
  `salt` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_client_id` (`oauth_client_id`),
  CONSTRAINT `pep_proxy_ibfk_1` FOREIGN KEY (`oauth_client_id`) REFERENCES `oauth_client` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pep_proxy`
--

LOCK TABLES `pep_proxy` WRITE;
/*!40000 ALTER TABLE `pep_proxy` DISABLE KEYS */;
INSERT INTO `pep_proxy` VALUES ('pep_proxy_dae61432-4291-43b3-a183-cbd5418b2fb4','242304ec72907b1be12879fcd802b896774853d5','47d89a60-79f3-423a-8898-1bfe823c3769','eb9a8d502329e45a');
/*!40000 ALTER TABLE `pep_proxy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permission`
--

DROP TABLE IF EXISTS `permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permission` (
  `id` varchar(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `is_internal` tinyint(1) DEFAULT '0',
  `action` varchar(255) DEFAULT NULL,
  `resource` varchar(255) DEFAULT NULL,
  `xml` text,
  `oauth_client_id` varchar(36) DEFAULT NULL,
  `is_regex` tinyint(1) NOT NULL DEFAULT '0',
  `authorization_service_header` varchar(255) DEFAULT NULL,
  `use_authorization_service_header` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `oauth_client_id` (`oauth_client_id`),
  CONSTRAINT `permission_ibfk_1` FOREIGN KEY (`oauth_client_id`) REFERENCES `oauth_client` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permission`
--

LOCK TABLES `permission` WRITE;
/*!40000 ALTER TABLE `permission` DISABLE KEYS */;
INSERT INTO `permission` VALUES ('1','Get and assign all internal application roles',NULL,1,NULL,NULL,NULL,'idm_admin_app',0,NULL,0),('2','Manage the application',NULL,1,NULL,NULL,NULL,'idm_admin_app',0,NULL,0),('3','Manage roles',NULL,1,NULL,NULL,NULL,'idm_admin_app',0,NULL,0),('4','Manage authorizations',NULL,1,NULL,NULL,NULL,'idm_admin_app',0,NULL,0),('5','Get and assign all public application roles',NULL,1,NULL,NULL,NULL,'idm_admin_app',0,NULL,0),('6','Get and assign only public owned roles',NULL,1,NULL,NULL,NULL,'idm_admin_app',0,NULL,0);
/*!40000 ALTER TABLE `permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ptp`
--

DROP TABLE IF EXISTS `ptp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ptp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `previous_job_id` varchar(255) NOT NULL,
  `oauth_client_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`,`previous_job_id`),
  KEY `oauth_client_id` (`oauth_client_id`),
  CONSTRAINT `ptp_ibfk_1` FOREIGN KEY (`oauth_client_id`) REFERENCES `oauth_client` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ptp`
--

LOCK TABLES `ptp` WRITE;
/*!40000 ALTER TABLE `ptp` DISABLE KEYS */;
/*!40000 ALTER TABLE `ptp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `id` varchar(36) NOT NULL,
  `name` varchar(64) DEFAULT NULL,
  `is_internal` tinyint(1) DEFAULT '0',
  `oauth_client_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `oauth_client_id` (`oauth_client_id`),
  CONSTRAINT `role_ibfk_1` FOREIGN KEY (`oauth_client_id`) REFERENCES `oauth_client` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES ('881a07ec-13ad-40e1-bdc3-f67c5f384e98','user',0,'47d89a60-79f3-423a-8898-1bfe823c3769'),('faf55167-5d53-45c3-b27f-15c1ec885321','cinemaowner',0,'47d89a60-79f3-423a-8898-1bfe823c3769'),('provider','Provider',1,'idm_admin_app'),('purchaser','Purchaser',1,'idm_admin_app');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_assignment`
--

DROP TABLE IF EXISTS `role_assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_assignment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_organization` varchar(255) DEFAULT NULL,
  `oauth_client_id` varchar(36) DEFAULT NULL,
  `role_id` varchar(36) DEFAULT NULL,
  `organization_id` varchar(36) DEFAULT NULL,
  `user_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_client_id` (`oauth_client_id`),
  KEY `role_id` (`role_id`),
  KEY `organization_id` (`organization_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `role_assignment_ibfk_1` FOREIGN KEY (`oauth_client_id`) REFERENCES `oauth_client` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_assignment_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_assignment_ibfk_3` FOREIGN KEY (`organization_id`) REFERENCES `organization` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_assignment_ibfk_4` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_assignment`
--

LOCK TABLES `role_assignment` WRITE;
/*!40000 ALTER TABLE `role_assignment` DISABLE KEYS */;
INSERT INTO `role_assignment` VALUES (2,NULL,'47d89a60-79f3-423a-8898-1bfe823c3769','provider',NULL,'admin'),(3,NULL,'47d89a60-79f3-423a-8898-1bfe823c3769','881a07ec-13ad-40e1-bdc3-f67c5f384e98',NULL,'9ff94f95-9d51-41f3-8923-318704678c83'),(4,NULL,'47d89a60-79f3-423a-8898-1bfe823c3769','faf55167-5d53-45c3-b27f-15c1ec885321',NULL,'37ff7ea9-e8c1-416b-82f1-5ce3c5e68ed5');
/*!40000 ALTER TABLE `role_assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_permission`
--

DROP TABLE IF EXISTS `role_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` varchar(36) DEFAULT NULL,
  `permission_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `role_id` (`role_id`),
  KEY `permission_id` (`permission_id`),
  CONSTRAINT `role_permission_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_permission_ibfk_2` FOREIGN KEY (`permission_id`) REFERENCES `permission` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_permission`
--

LOCK TABLES `role_permission` WRITE;
/*!40000 ALTER TABLE `role_permission` DISABLE KEYS */;
INSERT INTO `role_permission` VALUES (1,'provider','1'),(2,'provider','2'),(3,'provider','3'),(4,'provider','4'),(5,'provider','5'),(6,'provider','6'),(7,'purchaser','5');
/*!40000 ALTER TABLE `role_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_usage_policy`
--

DROP TABLE IF EXISTS `role_usage_policy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_usage_policy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` varchar(36) DEFAULT NULL,
  `usage_policy_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `role_id` (`role_id`),
  KEY `usage_policy_id` (`usage_policy_id`),
  CONSTRAINT `role_usage_policy_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_usage_policy_ibfk_2` FOREIGN KEY (`usage_policy_id`) REFERENCES `usage_policy` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_usage_policy`
--

LOCK TABLES `role_usage_policy` WRITE;
/*!40000 ALTER TABLE `role_usage_policy` DISABLE KEYS */;
/*!40000 ALTER TABLE `role_usage_policy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trusted_application`
--

DROP TABLE IF EXISTS `trusted_application`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trusted_application` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `oauth_client_id` varchar(36) DEFAULT NULL,
  `trusted_oauth_client_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_client_id` (`oauth_client_id`),
  KEY `trusted_oauth_client_id` (`trusted_oauth_client_id`),
  CONSTRAINT `trusted_application_ibfk_1` FOREIGN KEY (`oauth_client_id`) REFERENCES `oauth_client` (`id`) ON DELETE CASCADE,
  CONSTRAINT `trusted_application_ibfk_2` FOREIGN KEY (`trusted_oauth_client_id`) REFERENCES `oauth_client` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trusted_application`
--

LOCK TABLES `trusted_application` WRITE;
/*!40000 ALTER TABLE `trusted_application` DISABLE KEYS */;
/*!40000 ALTER TABLE `trusted_application` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usage_policy`
--

DROP TABLE IF EXISTS `usage_policy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usage_policy` (
  `id` varchar(36) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `type` enum('COUNT_POLICY','AGGREGATION_POLICY','CUSTOM_POLICY') DEFAULT NULL,
  `parameters` json DEFAULT NULL,
  `punishment` enum('KILL_JOB','UNSUBSCRIBE','MONETIZE') DEFAULT NULL,
  `from` time DEFAULT NULL,
  `to` time DEFAULT NULL,
  `odrl` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `oauth_client_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_client_id` (`oauth_client_id`),
  CONSTRAINT `usage_policy_ibfk_1` FOREIGN KEY (`oauth_client_id`) REFERENCES `oauth_client` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usage_policy`
--

LOCK TABLES `usage_policy` WRITE;
/*!40000 ALTER TABLE `usage_policy` DISABLE KEYS */;
/*!40000 ALTER TABLE `usage_policy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` varchar(36) NOT NULL,
  `username` varchar(64) DEFAULT NULL,
  `description` text,
  `website` varchar(2000) DEFAULT NULL,
  `image` varchar(255) DEFAULT 'default',
  `gravatar` tinyint(1) DEFAULT '0',
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(40) DEFAULT NULL,
  `date_password` datetime DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT '0',
  `admin` tinyint(1) DEFAULT '0',
  `extra` json DEFAULT NULL,
  `scope` varchar(2000) DEFAULT NULL,
  `starters_tour_ended` tinyint(1) DEFAULT '0',
  `eidas_id` varchar(255) DEFAULT NULL,
  `salt` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('37ff7ea9-e8c1-416b-82f1-5ce3c5e68ed5','Michalis','','','default',0,'michalis@test.com','335bf2f5a5e92b20addc2305793ce4f6a6fe7f09','2021-08-04 22:59:46',1,0,'{\"visible_attributes\": [\"username\", \"description\", \"website\", \"identity_attributes\", \"image\", \"gravatar\"]}',NULL,0,NULL,'d97ce1645905765a'),('9ff94f95-9d51-41f3-8923-318704678c83','nikolakis','','','default',0,'nikolakis@test.com','f46a62c0901c5dd880b8bac2026a7d04c29b1b82','2021-08-04 22:59:23',1,0,'{\"visible_attributes\": [\"username\", \"description\", \"website\", \"identity_attributes\", \"image\", \"gravatar\"]}',NULL,0,NULL,'70f331011f6a4549'),('admin','admin',NULL,NULL,'default',0,'admin@test.com','a24466bfc2f9f3c3311ffa823ca6a76fe6abe099','2021-08-04 22:32:27',1,1,'{\"visible_attributes\": [\"username\", \"description\"]}',NULL,0,NULL,'bf5f25aac306b138');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_authorized_application`
--

DROP TABLE IF EXISTS `user_authorized_application`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_authorized_application` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(36) DEFAULT NULL,
  `oauth_client_id` varchar(36) DEFAULT NULL,
  `shared_attributes` varchar(255) DEFAULT NULL,
  `login_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `oauth_client_id` (`oauth_client_id`),
  CONSTRAINT `user_authorized_application_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_authorized_application_ibfk_2` FOREIGN KEY (`oauth_client_id`) REFERENCES `oauth_client` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_authorized_application`
--

LOCK TABLES `user_authorized_application` WRITE;
/*!40000 ALTER TABLE `user_authorized_application` DISABLE KEYS */;
INSERT INTO `user_authorized_application` VALUES (1,'admin','47d89a60-79f3-423a-8898-1bfe823c3769','username,email,identity_attributes,image,gravatar,eidas_profile','2021-08-04 23:00:54'),(2,'9ff94f95-9d51-41f3-8923-318704678c83','47d89a60-79f3-423a-8898-1bfe823c3769','username,email,identity_attributes,image,gravatar,eidas_profile','2021-08-19 14:09:21'),(3,'37ff7ea9-e8c1-416b-82f1-5ce3c5e68ed5','47d89a60-79f3-423a-8898-1bfe823c3769','username,email,identity_attributes,image,gravatar,eidas_profile','2021-08-26 19:25:17');
/*!40000 ALTER TABLE `user_authorized_application` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_organization`
--

DROP TABLE IF EXISTS `user_organization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_organization` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role` varchar(10) DEFAULT NULL,
  `user_id` varchar(36) DEFAULT NULL,
  `organization_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `organization_id` (`organization_id`),
  CONSTRAINT `user_organization_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_organization_ibfk_2` FOREIGN KEY (`organization_id`) REFERENCES `organization` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_organization`
--

LOCK TABLES `user_organization` WRITE;
/*!40000 ALTER TABLE `user_organization` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_organization` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_registration_profile`
--

DROP TABLE IF EXISTS `user_registration_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_registration_profile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activation_key` varchar(255) DEFAULT NULL,
  `activation_expires` datetime DEFAULT NULL,
  `reset_key` varchar(255) DEFAULT NULL,
  `reset_expires` datetime DEFAULT NULL,
  `verification_key` varchar(255) DEFAULT NULL,
  `verification_expires` datetime DEFAULT NULL,
  `user_email` varchar(255) DEFAULT NULL,
  `disable_2fa_key` varchar(255) DEFAULT NULL,
  `disable_2fa_expires` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_email` (`user_email`),
  CONSTRAINT `user_registration_profile_ibfk_1` FOREIGN KEY (`user_email`) REFERENCES `user` (`email`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_registration_profile`
--

LOCK TABLES `user_registration_profile` WRITE;
/*!40000 ALTER TABLE `user_registration_profile` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_registration_profile` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-09-26 11:58:04
