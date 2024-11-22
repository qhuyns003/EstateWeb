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
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assignmentbuilding`
--

LOCK TABLES `assignmentbuilding` WRITE;
/*!40000 ALTER TABLE `assignmentbuilding` DISABLE KEYS */;
INSERT INTO `assignmentbuilding` VALUES (66,2,1,NULL,NULL,NULL,NULL),(67,5,1,NULL,NULL,NULL,NULL),(68,4,2,NULL,NULL,NULL,NULL),(69,4,35,NULL,NULL,NULL,NULL),(70,5,35,NULL,NULL,NULL,NULL),(71,5,36,NULL,NULL,NULL,NULL),(72,2,40,NULL,NULL,NULL,NULL),(73,2,42,NULL,NULL,NULL,NULL),(74,4,42,NULL,NULL,NULL,NULL),(75,2,44,NULL,NULL,NULL,NULL),(76,4,44,NULL,NULL,NULL,NULL),(77,5,44,NULL,NULL,NULL,NULL),(78,5,46,NULL,NULL,NULL,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assignmentcustomer`
--

LOCK TABLES `assignmentcustomer` WRITE;
/*!40000 ALTER TABLE `assignmentcustomer` DISABLE KEYS */;
INSERT INTO `assignmentcustomer` VALUES (20,5,10,NULL,NULL,NULL,NULL),(29,4,7,NULL,NULL,NULL,NULL),(30,5,7,NULL,NULL,NULL,NULL),(31,2,8,NULL,NULL,NULL,NULL),(32,4,8,NULL,NULL,NULL,NULL),(33,5,8,NULL,NULL,NULL,NULL),(34,2,9,NULL,NULL,NULL,NULL),(35,4,13,NULL,NULL,NULL,NULL),(36,4,15,NULL,NULL,NULL,NULL),(37,5,15,NULL,NULL,NULL,NULL),(38,2,22,NULL,NULL,NULL,NULL),(39,5,23,NULL,NULL,NULL,NULL),(41,4,1,NULL,NULL,NULL,NULL);
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
INSERT INTO `building` VALUES (1,'LunaGalaxy.','Đào Tấn','Ngọc Khánh','BA_DINH',NULL,2,14000,'Bắc','A',400,'400 nghìn/m2/tháng',NULL,'2,5 triệu/ tháng','150 nghìn/tháng','200 nghìn/giờ',NULL,'4 nghìn/kWh','10%',NULL,'>6 tháng','7 ngày',0.50,'TANG_TRET,NGUYEN_CAN','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Nam Linh','0915354727'),(2,'ACM Tower','Bùi Xương Trạch','Định Công','THANH_XUAN',NULL,2,10500,'Đông','B',250,'250 nghìn/m2/tháng',NULL,'1,5 triệu/ tháng','100 nghìn/tháng','150 nghìn/giờ',NULL,'4 nghìn/kWh','10%',NULL,'>6 tháng','7 ngày',1.70,'NOI_THAT,NGUYEN_CAN','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Chú Thuận','0173546263'),(35,'BID Residence','Phúc La','Kiến Hưng','HA_DONG',NULL,1,9600,'Tây Bắc','C',150,'150 nghìn/m2/tháng',NULL,'1 triệu/ tháng','50 nghìn/tháng','100 nghìn/giờ',NULL,'3,5 nghìn/kWh','20%',NULL,'>6 tháng','10 ngày',0.50,'TANG_TRET,NGUYEN_CAN','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Đức Mỹ','0839555756'),(36,'MipecTower','Nguyễn Cơ Thạch','Mỹ Đình','NAM_TU_LIEM',NULL,1,11200,'Đông Nam','A',350,'350 nghìn/m2/tháng',NULL,'2,5 triệu/ tháng','150 nghìn/tháng','220 nghìn/giờ',NULL,'4 nghìn/kWh','10%',NULL,'>12 tháng','7 ngày',0.80,'NOI_THAT','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Nguyễn Thanh Tuấn','0987263542'),(40,'TechnoPark Tower','Vũ Xuân Thiều','Sài Đồng','LONG_BIEN',NULL,2,12000,'Tây','B',160,'160 nghìn/m2/tháng',NULL,'1,5 triệu/ tháng','100 nghìn/tháng','200 nghìn/giờ',NULL,'3 nghìn/kWh','10%',NULL,'>6 tháng','10 ngày',1.00,'NOI_THAT','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Vũ Ngọc Anh','0938225654'),(42,'Keangnam','Hồ Tùng Mậu','Mai Dịch','CAU_GIAY',NULL,1,15000,'Nam','A',380,'380 nghìn/m2/tháng',NULL,'2,5 triệu/ tháng','150 nghìn/tháng','200 nghìn/giờ',NULL,'4 nghìn/kWh','10%',NULL,'>6 tháng','14 ngày',1.00,'TANG_TRET','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Lã Quốc Đạt','0933457263'),(44,'KwangdongFreegs','Nguyên Hồng','Láng Hạ','DONG_DA',NULL,1,13500,'Đông Bắc','B',180,'180 nghìn/m2/tháng',NULL,'1,7 triệu/ tháng','120 nghìn/tháng','180 nghìn/giờ',NULL,'4 nghìn/kWh','15%',NULL,'>12 tháng','14 ngày',0.40,'NGUYEN_CAN','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Shrimzy','0900293111'),(46,'Millennium Tower','Nguyễn Đình Thi','Thụy Khuê','TAY_HO',NULL,2,21000,'Bắc','A',500,'500 nghìn/m2/tháng',NULL,'3 triệu/ tháng','250 nghìn/tháng','300 nghìn/giờ',NULL,'5 nghìn/kWh','10%',NULL,'>12 tháng','21 ngày',0.50,'NOI_THAT,NGUYEN_CAN','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Aixleft','0900567897');
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
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'Đỗ Nam Trung','0905671232','hailv@gmail.com',NULL,'Quan tâm','DA_XU_LY',1,NULL,'2024-11-22 20:38:20',NULL,'nguyenvana'),(2,'Đặng Hoài Bắc','0205671231','hongxuanng@gmail.com',NULL,'quan tâm','DA_XU_LY',1,NULL,'2024-11-22 17:46:17',NULL,'nguyenvana'),(3,'Tập Cận Bình','0912121231','cucthita1@gmail.com',NULL,'quan tâm','DANG_XU_LY',1,NULL,'2024-11-22 20:43:48',NULL,'nguyenvana'),(4,'Cô Hai Báo','0334839575','dungta@gmail.com',NULL,'quan tâm','DA_XU_LY',1,NULL,'2024-11-22 17:46:31',NULL,'nguyenvana'),(5,'Bùi Hải Đăng','0893736151','haidangbui@gmail.com',NULL,'quan tâm','CHUA_XU_LY',1,NULL,'2024-11-22 20:44:14',NULL,'nguyenvana'),(6,'Đặng Đức Long','0893736151','longdd@gmail.com',NULL,'quan tâm','DANG_XU_LY',1,NULL,'2024-11-22 17:45:52',NULL,'nguyenvana'),(7,'Vũ Sỹ Ngọc Hiếu','0893736273','hieuvsn@gmail.com','AnThi1','mua nhà lầu','CHUA_XU_LY',1,'2024-10-25 20:36:54','2024-11-22 17:15:41','nguyenvana','nguyenvana'),(8,'Trần Lả Lướt','0334839575','laluottran@gmail.com',NULL,'quan tâm','DANG_XU_LY',1,'2024-10-25 21:57:19','2024-11-22 17:16:25','anonymousUser','nguyenvana'),(9,'Chi Dân','0983554124','youngpuppy@gmail.com',NULL,'quan tâm','DANG_XU_LY',1,NULL,'2024-11-22 17:16:30',NULL,'nguyenvana'),(10,'Trần Hải Băng','0839442681','coldsea@gmail.com','IsnumGroup','thuê nhà ','CHUA_XU_LY',1,'2024-10-27 15:56:27','2024-10-30 23:03:46','nguyenvana','nguyenvana'),(11,'Lê Đức Phú','0839222111','phuducgang@gmail.com',NULL,'quan tâm','CHUA_XU_LY',0,'2024-10-27 15:57:44','2024-10-30 23:01:48','nguyenvana','nguyenvana'),(12,'Phạm Hoàng Khoa','0981245631','krikkonix@gmail.com','Kentertainment','mua nhà','CHUA_XU_LY',0,'2024-10-27 16:13:43','2024-10-30 23:01:48','nguyenvana','nguyenvana'),(13,'Nhật Hoàng','0900789568','sunshinejp@gmail.com','KOR','quan tâm','DANG_XU_LY',1,NULL,'2024-11-22 17:16:40',NULL,'nguyenvana'),(14,'Trần Thiện Thanh Bảo','0123456789','evbRecord@gmail.com','EvBLabels','quan tâm','CHUA_XU_LY',0,NULL,'2024-10-30 23:21:36',NULL,'nguyenvana'),(15,'Hàng Lâm Trang Anh','0334867465','suboiondamic@gmail.com','SB','quan tâm','DANG_XU_LY',1,'2024-10-30 23:24:48','2024-11-22 17:16:47','nguyenvana','nguyenvana'),(22,'Khúc Văn Khuỷu','0900789568','khuctuan@gmail.com',NULL,'hello','DANG_XU_LY',1,'2024-11-02 16:34:55','2024-11-22 17:16:52','anonymousUser','nguyenvana'),(23,'Mason Nguyễn','0659742121','rzmas@gmail.com',NULL,'quan tâm','DANG_XU_LY',1,'2024-11-17 20:11:27','2024-11-22 17:16:56','masonnguyen','nguyenvana'),(24,'Tôi','0983605605','abc@gmail.com',NULL,'hello','DANG_XU_LY',0,'2024-11-22 15:29:35','2024-11-22 15:30:07','masonnguyen','nguyenvana'),(25,'Nguyễn Chí Tôn','0933456789','chitonnguyn@gmail.com','abc','quan tâm','DANG_XU_LY',0,'2024-11-22 15:31:46','2024-11-22 15:31:53','nguyenvana','nguyenvana');
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
) ENGINE=InnoDB AUTO_INCREMENT=535 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rentarea`
--

LOCK TABLES `rentarea` WRITE;
/*!40000 ALTER TABLE `rentarea` DISABLE KEYS */;
INSERT INTO `rentarea` VALUES (338,40,2,NULL,NULL,NULL,NULL),(339,50,2,NULL,NULL,NULL,NULL),(340,100,2,NULL,NULL,NULL,NULL),(341,200,2,NULL,NULL,NULL,NULL),(342,40,35,NULL,NULL,NULL,NULL),(343,60,35,NULL,NULL,NULL,NULL),(344,250,35,NULL,NULL,NULL,NULL),(345,85,36,NULL,NULL,NULL,NULL),(346,100,36,NULL,NULL,NULL,NULL),(347,200,36,NULL,NULL,NULL,NULL),(348,400,36,NULL,NULL,NULL,NULL),(349,70,40,NULL,NULL,NULL,NULL),(350,90,40,NULL,NULL,NULL,NULL),(351,90,42,NULL,NULL,NULL,NULL),(352,125,42,NULL,NULL,NULL,NULL),(353,300,42,NULL,NULL,NULL,NULL),(354,75,44,NULL,NULL,NULL,NULL),(355,95,44,NULL,NULL,NULL,NULL),(356,250,44,NULL,NULL,NULL,NULL),(357,90,46,NULL,NULL,NULL,NULL),(358,100,46,NULL,NULL,NULL,NULL),(359,125,46,NULL,NULL,NULL,NULL),(360,140,46,NULL,NULL,NULL,NULL),(361,250,46,NULL,NULL,NULL,NULL),(362,400,46,NULL,NULL,NULL,NULL),(531,80,1,NULL,NULL,NULL,NULL),(532,120,1,NULL,NULL,NULL,NULL),(533,200,1,NULL,NULL,NULL,NULL),(534,5000,1,NULL,NULL,NULL,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction`
--

LOCK TABLES `transaction` WRITE;
/*!40000 ALTER TABLE `transaction` DISABLE KEYS */;
INSERT INTO `transaction` VALUES (19,'CSKH','gọi điện tư vấn',1,'2024-11-22 20:43:09','2024-11-22 20:43:09','nguyenvana','nguyenvana',NULL),(20,'DDX','đi xem tòa ACM',1,'2024-11-22 20:43:30','2024-11-22 20:43:30','nguyenvana','nguyenvana',NULL),(21,'CSKH','tư vấn trực tiếp',3,'2024-11-22 20:43:46','2024-11-22 20:43:46','nguyenvana','nguyenvana',NULL),(22,'CSKH','gọi điện tư vấn',5,'2024-11-22 20:44:00','2024-11-22 20:44:00','nguyenvana','nguyenvana',NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'nguyenvana','$2a$10$/RUbuT9KIqk6f8enaTQiLOXzhnUkiwEJRdtzdrMXXwU7dgnLKTCYG','nguyen van a',NULL,NULL,1,NULL,NULL,NULL,NULL),(2,'nguyenvanb','$2a$10$a3e.C7zCg/BCHd63xA3UbupyVQKXaNyVD8BSgkeogtQR3s7/JPV7a','nguyen van b',NULL,NULL,1,NULL,'2024-11-22 15:19:48',NULL,'nguyenvana'),(3,'nguyenvanc','$2a$10$/RUbuT9KIqk6f8enaTQiLOXzhnUkiwEJRdtzdrMXXwU7dgnLKTCYG','nguyen van c',NULL,NULL,1,NULL,NULL,NULL,NULL),(4,'nguyenvand','$2a$10$/RUbuT9KIqk6f8enaTQiLOXzhnUkiwEJRdtzdrMXXwU7dgnLKTCYG','nguyen van d',NULL,NULL,1,NULL,NULL,NULL,NULL),(5,'salilvan','$2a$10$q624kNhErPVswJL1pDAOXudFL4OaW7y.qkilJzlEEdx1J.FfvotNq','Lưu Vân',NULL,NULL,1,'2024-10-28 17:09:51','2024-10-28 17:09:51','anonymousUser','anonymousUser'),(6,'masonnguyen','$2a$10$D2Fr75UzSuTVLXrC2z7sO.dQSB1Yt/Oq/jXDa1k6O1wFazUQgxNxG','Nguyễn Xuân Bách',NULL,NULL,1,'2024-10-28 22:12:46','2024-10-28 22:12:46','anonymousUser','anonymousUser'),(7,'ngockhanhnguyen','$2a$10$lyw2DZVhAkEIhh6QwXnueeymzNuF1hnSTBDMV5AKJbeG096Wu/m7G','Nguyễn Ngọc Khánh',NULL,NULL,0,'2024-11-01 16:25:04','2024-11-05 16:58:42','anonymousUser','nguyenvana'),(8,'hieudc','$2a$10$vb/epjLzEwNKxLStZYDMC.4Pg63v1xOhaQUoRTeFMYB8sgf.yBzzm','Đinh Chí Hiếu',NULL,NULL,1,'2024-11-04 16:35:17','2024-11-04 16:35:17','anonymousUser','anonymousUser');
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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` VALUES (1,1,1,NULL,NULL,NULL,NULL),(4,2,4,NULL,NULL,NULL,NULL),(5,2,5,NULL,NULL,NULL,NULL),(6,3,6,NULL,NULL,NULL,NULL),(13,3,7,NULL,NULL,NULL,NULL),(15,3,3,NULL,NULL,NULL,NULL),(17,3,8,NULL,NULL,NULL,NULL),(19,2,2,NULL,NULL,NULL,NULL);
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

-- Dump completed on 2024-11-22 20:44:43
