-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: estateadvance
-- ------------------------------------------------------
-- Server version	8.0.39

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
-- Table structure for table `assignmentbuilding`
--

DROP TABLE IF EXISTS `assignmentbuilding`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assignmentbuilding` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `staffid` bigint NOT NULL,
  `buildingid` bigint NOT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `modifiedby` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_building` (`staffid`),
  KEY `fk_building_user` (`buildingid`),
  CONSTRAINT `fk_building_user` FOREIGN KEY (`buildingid`) REFERENCES `building` (`id`),
  CONSTRAINT `fk_user_building` FOREIGN KEY (`staffid`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assignmentbuilding`
--

LOCK TABLES `assignmentbuilding` WRITE;
/*!40000 ALTER TABLE `assignmentbuilding` DISABLE KEYS */;
/*!40000 ALTER TABLE `assignmentbuilding` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assignmentcustomer`
--

DROP TABLE IF EXISTS `assignmentcustomer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assignmentcustomer` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `staffid` bigint NOT NULL,
  `customerid` bigint NOT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `modifiedby` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_customer` (`staffid`),
  KEY `fk_customer_user` (`customerid`),
  CONSTRAINT `fk_customer_user` FOREIGN KEY (`customerid`) REFERENCES `customer` (`id`),
  CONSTRAINT `fk_user_customer` FOREIGN KEY (`staffid`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assignmentcustomer`
--

LOCK TABLES `assignmentcustomer` WRITE;
/*!40000 ALTER TABLE `assignmentcustomer` DISABLE KEYS */;
INSERT INTO `assignmentcustomer` VALUES (10,2,3,NULL,NULL,NULL,NULL),(12,3,5,NULL,NULL,NULL,NULL),(13,4,5,NULL,NULL,NULL,NULL),(14,2,6,NULL,NULL,NULL,NULL),(15,3,6,NULL,NULL,NULL,NULL),(16,3,4,NULL,NULL,NULL,NULL),(17,2,2,NULL,NULL,NULL,NULL),(20,5,10,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `assignmentcustomer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `building`
--

DROP TABLE IF EXISTS `building`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `building` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `street` varchar(255) DEFAULT NULL,
  `ward` varchar(255) DEFAULT NULL,
  `district` varchar(255) DEFAULT NULL,
  `structure` varchar(255) DEFAULT NULL,
  `numberofbasement` int DEFAULT NULL,
  `floorarea` int DEFAULT NULL,
  `direction` varchar(255) DEFAULT NULL,
  `level` varchar(255) DEFAULT NULL,
  `rentprice` int DEFAULT NULL,
  `rentpricedescription` text,
  `servicefee` varchar(255) DEFAULT NULL,
  `carfee` varchar(255) DEFAULT NULL,
  `motofee` varchar(255) DEFAULT NULL,
  `overtimefee` varchar(255) DEFAULT NULL,
  `waterfee` varchar(255) DEFAULT NULL,
  `electricityfee` varchar(255) DEFAULT NULL,
  `deposit` varchar(255) DEFAULT NULL,
  `payment` varchar(255) DEFAULT NULL,
  `renttime` varchar(255) DEFAULT NULL,
  `decorationtime` varchar(255) DEFAULT NULL,
  `brokeragefee` decimal(13,2) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `linkofbuilding` varchar(255) DEFAULT NULL,
  `map` varchar(255) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `modifiedby` varchar(255) DEFAULT NULL,
  `managername` varchar(255) DEFAULT NULL,
  `managerphone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `building`
--

LOCK TABLES `building` WRITE;
/*!40000 ALTER TABLE `building` DISABLE KEYS */;
INSERT INTO `building` VALUES (1,'LunaGalaxy','Đào Tấn','Ngọc Khánh','BA_DINH','',2,500,'','',15,'15 triệu/m2','','','',NULL,NULL,NULL,'','','',NULL,NULL,'TANG_TRET,NGUYEN_CAN','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Anh Nam-Chị Linh','0915354727'),(2,'ACM Tower','Bùi Xương Trạch','Định Công','THANH_XUAN','',2,650,'','',18,'18 triệu/m2','','','',NULL,NULL,NULL,'','','',NULL,NULL,'NOI_THAT,NGUYEN_CAN','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Chú Thuận','0173546263'),(35,'EuroWindow','Phúc La','Kiến Hưng','HA_DONG','',3,1000,'','',NULL,'','','','',NULL,NULL,NULL,'','','',NULL,NULL,'NOI_THAT,TANG_TRET','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Đức Mỹ','0839555756'),(36,'MipecTower','Nguyễn Cơ Thạch','Mỹ Đình','NAM_TU_LIEM','',1,800,'','',NULL,'','','','',NULL,NULL,NULL,'','','',NULL,NULL,'NOI_THAT','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Nguyễn Thanh Tuấn','0987263542'),(40,'TheerathonFive','Vũ Xuân Thiều','Sài Đồng','LONG_BIEN','',3,1000,'','',NULL,'','','','',NULL,NULL,NULL,'','','',NULL,NULL,'NOI_THAT','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Vũ Ngọc Anh','0938225654'),(42,'TheExpendables','Hồ Tùng Mậu','Mai Dịch','CAU_GIAY','',1,1300,'','',NULL,'','','','',NULL,NULL,NULL,'','','',NULL,NULL,'TANG_TRET','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Lã Quốc Đạt','0'),(44,'KwangdongFreegs','Nguyên Hồng','Láng Hạ','DONG_DA','',1,1000,'','',NULL,'','','','',NULL,NULL,NULL,'','','',NULL,NULL,'NGUYEN_CAN','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Shrimzy','0900293111'),(46,'PetrichorRoad','Nguyễn Đình Thi','Thụy Khuê','TAY_HO','',2,500,'','',NULL,'','','','',NULL,NULL,NULL,'','','',NULL,NULL,'NOI_THAT,NGUYEN_CAN','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Aixleft','0900567897');
/*!40000 ALTER TABLE `building` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `fullname` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `companyname` varchar(255) DEFAULT NULL,
  `demand` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `modifiedby` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'Luc Van Hai','0905671232','hailv@gmail.com','','',NULL,1,NULL,'2024-10-30 23:10:20',NULL,'nguyenvana'),(2,'Nguyen Xuan Hung','0205671231','hongxuanng@gmail.com','','','xử lý xong',1,NULL,NULL,NULL,NULL),(3,'Ta Thi Cuc','0912121231','cucthita1@gmail.com','','','đang xử lý',1,NULL,NULL,NULL,NULL),(4,'Trần Anh Dũng','0334839575','dungta@gmail.com','PolygonGroup','','chờ xử lý',1,NULL,NULL,NULL,NULL),(5,'Bùi Hải Đăng','0893736151','haidangbui@gmail.com','Solseven','','đang xử lý',1,NULL,NULL,NULL,NULL),(6,'Đặng Đức Long','0893736151','longdd@gmail.com','','','chờ xử lý',1,NULL,NULL,NULL,NULL),(7,'Vũ Sỹ Ngọc Hiếu','0893736273','hieuvsn@gmail.com','AnThi1','mua nhà lầu','chưa xử lý',1,'2024-10-25 20:36:54','2024-10-25 20:36:54','nguyenvana','nguyenvana'),(8,'Trần Lả Lướt','0334839575','laluottran@gmail.com',NULL,'quan tâm',NULL,1,'2024-10-25 21:57:19','2024-10-25 21:57:19','anonymousUser','anonymousUser'),(9,'Dăng Pắp Py','0983554124','youngpuppy@gmail.com','','quan tâm','đã xử lý ',1,NULL,'2024-10-30 23:04:28',NULL,'nguyenvana'),(10,'Trần Hải Băng','0839442681','coldsea@gmail.com','IsnumGroup','thuê nhà ','chưa xử lý',1,'2024-10-27 15:56:27','2024-10-30 23:03:46','nguyenvana','nguyenvana'),(11,'Lê Đức Phú','0839222111','phuducgang@gmail.com',NULL,'quan tâm','chưa xử lý',0,'2024-10-27 15:57:44','2024-10-30 23:01:48','nguyenvana','nguyenvana'),(12,'Phạm Hoàng Khoa','0981245631','krikkonix@gmail.com','Kentertainment','mua nhà','Chưa xử lý ',0,'2024-10-27 16:13:43','2024-10-30 23:01:48','nguyenvana','nguyenvana'),(13,'Nhật Hoàng','0900789568','sunshinejp@gmail.com','KOR','quan tâm','đang xử lý ',1,NULL,'2024-10-30 23:26:38',NULL,'nguyenvana'),(14,'Trần Thiện Thanh Bảo','0123456789','evbRecord@gmail.com','EvBLabels','quan tâm',NULL,0,NULL,'2024-10-30 23:21:36',NULL,'nguyenvana'),(15,'Hàng Lâm Trang Anh','0334867465','suboiondamic@gmail.com','SB','quan tâm','đang xử lý ',1,'2024-10-30 23:24:48','2024-10-30 23:25:35','nguyenvana','nguyenvana');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rentarea`
--

DROP TABLE IF EXISTS `rentarea`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rentarea` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `value` int DEFAULT NULL,
  `buildingid` bigint DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `modifiedby` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rentarea_building` (`buildingid`),
  CONSTRAINT `rentarea_building` FOREIGN KEY (`buildingid`) REFERENCES `building` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=302 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rentarea`
--

LOCK TABLES `rentarea` WRITE;
/*!40000 ALTER TABLE `rentarea` DISABLE KEYS */;
INSERT INTO `rentarea` VALUES (281,200,2,NULL,NULL,NULL,NULL),(282,300,2,NULL,NULL,NULL,NULL),(283,400,2,NULL,NULL,NULL,NULL),(284,300,35,NULL,NULL,NULL,NULL),(285,500,35,NULL,NULL,NULL,NULL),(286,600,35,NULL,NULL,NULL,NULL),(287,300,36,NULL,NULL,NULL,NULL),(288,400,36,NULL,NULL,NULL,NULL),(289,500,36,NULL,NULL,NULL,NULL),(290,300,40,NULL,NULL,NULL,NULL),(291,500,40,NULL,NULL,NULL,NULL),(292,500,42,NULL,NULL,NULL,NULL),(293,750,42,NULL,NULL,NULL,NULL),(294,1200,42,NULL,NULL,NULL,NULL),(295,300,44,NULL,NULL,NULL,NULL),(296,500,44,NULL,NULL,NULL,NULL),(297,600,44,NULL,NULL,NULL,NULL),(298,100,46,NULL,NULL,NULL,NULL),(299,400,46,NULL,NULL,NULL,NULL),(300,100,1,NULL,NULL,NULL,NULL),(301,200,1,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `rentarea` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `modifiedby` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'Quản lý','MANAGER',NULL,NULL,NULL,NULL),(2,'Nhân viên','STAFF',NULL,NULL,NULL,NULL),(3,'Người dùng','USER',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaction`
--

DROP TABLE IF EXISTS `transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transaction` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `customerid` bigint NOT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `modifiedby` varchar(255) DEFAULT NULL,
  `staffid` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_customer_transaction` (`customerid`),
  CONSTRAINT `fk_customer_transaction` FOREIGN KEY (`customerid`) REFERENCES `customer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction`
--

LOCK TABLES `transaction` WRITE;
/*!40000 ALTER TABLE `transaction` DISABLE KEYS */;
INSERT INTO `transaction` VALUES (10,'CSKH','tư vấn trực tiếp',6,'2024-10-21 23:22:38',NULL,'nguyen van a',NULL,NULL),(12,'CSKH','tư vấn trực tiếp',4,'2024-10-22 11:00:03',NULL,'nguyen van a',NULL,NULL),(14,'CSKH','tư vấn trực tiếp',2,'2024-10-22 11:22:54','2024-10-22 11:23:51','nguyen van b','nguyen van a',NULL),(15,'CSKH','tư vấn online',3,'2024-10-25 17:55:48','2024-10-25 17:56:09','nguyenvana','nguyenvana',NULL),(16,'CSKH','gọi điện tư vấn',8,'2024-10-30 23:05:00','2024-10-30 23:05:00','nguyenvana','nguyenvana',NULL),(17,'DDX','di an trua',2,'2024-10-31 10:50:24','2024-10-31 10:50:24','nguyenvana','nguyenvana',NULL),(18,'DDX','đi ăn tối',2,'2024-10-31 10:51:10','2024-10-31 10:51:10','nguyenvana','nguyenvana',NULL);
/*!40000 ALTER TABLE `transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `fullname` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `status` int NOT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `modifiedby` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'nguyenvana','$2a$10$/RUbuT9KIqk6f8enaTQiLOXzhnUkiwEJRdtzdrMXXwU7dgnLKTCYG','nguyen van a',NULL,NULL,1,NULL,NULL,NULL,NULL),(2,'nguyenvanb','$2a$10$/RUbuT9KIqk6f8enaTQiLOXzhnUkiwEJRdtzdrMXXwU7dgnLKTCYG','nguyen van b',NULL,NULL,1,NULL,'2024-10-29 16:17:21',NULL,'nguyenvana'),(3,'nguyenvanc','$2a$10$/RUbuT9KIqk6f8enaTQiLOXzhnUkiwEJRdtzdrMXXwU7dgnLKTCYG','nguyen van c',NULL,NULL,1,NULL,NULL,NULL,NULL),(4,'nguyenvand','$2a$10$/RUbuT9KIqk6f8enaTQiLOXzhnUkiwEJRdtzdrMXXwU7dgnLKTCYG','nguyen van d',NULL,NULL,1,NULL,NULL,NULL,NULL),(5,'salilvan','$2a$10$q624kNhErPVswJL1pDAOXudFL4OaW7y.qkilJzlEEdx1J.FfvotNq','Lưu Vân',NULL,NULL,1,'2024-10-28 17:09:51','2024-10-28 17:09:51','anonymousUser','anonymousUser'),(6,'masonnguyen','$2a$10$D2Fr75UzSuTVLXrC2z7sO.dQSB1Yt/Oq/jXDa1k6O1wFazUQgxNxG','Nguyễn Xuân Bách',NULL,NULL,1,'2024-10-28 22:12:46','2024-10-28 22:12:46','anonymousUser','anonymousUser');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_role` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `role_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `modifiedby` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_role` (`user_id`),
  KEY `fk_role_user` (`role_id`),
  CONSTRAINT `fk_role_user` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`),
  CONSTRAINT `fk_user_role` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` VALUES (1,1,1,NULL,NULL,NULL,NULL),(3,2,3,NULL,NULL,NULL,NULL),(4,2,4,NULL,NULL,NULL,NULL),(5,2,5,NULL,NULL,NULL,NULL),(6,3,6,NULL,NULL,NULL,NULL),(8,2,2,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-01 11:06:05
