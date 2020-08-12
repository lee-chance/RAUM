-- MySQL dump 10.13  Distrib 8.0.17, for macos10.14 (x86_64)
--
-- Host: 192.168.0.80    Database: RAUM
-- ------------------------------------------------------
-- Server version	8.0.17

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
-- Table structure for table `Address`
--

DROP TABLE IF EXISTS `Address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Address` (
  `seq` int(11) NOT NULL AUTO_INCREMENT,
  `User_seq` int(11) NOT NULL,
  `addressName` varchar(45) DEFAULT NULL,
  `address` varchar(45) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`seq`),
  UNIQUE KEY `seq_UNIQUE` (`seq`),
  KEY `fk_Address_User1_idx` (`User_seq`),
  CONSTRAINT `fk_Address_User1` FOREIGN KEY (`User_seq`) REFERENCES `user` (`seq`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Address`
--

LOCK TABLES `Address` WRITE;
/*!40000 ALTER TABLE `Address` DISABLE KEYS */;
INSERT INTO `Address` VALUES (3,1,'우리집','06000_서울 강남구 강남대로 708_123456','신경환','010-2614-3391'),(19,22,'집','06000_서울 강남구 강남대로 708_123','qwe','010-9999-8888'),(20,23,'집','48060_부산 해운대구 우동 1514_ttwt','asd','010-3597-4655'),(21,24,'회사','07810_서울 강서구 마곡동 749-8_ㅋㅋㅋ','xzc','010-7988-1523'),(24,3,'회사','07810_서울 강서구 마곡동 749-8_302호','사무실','010-1524-3389'),(25,22,'회사','07810_서울 강서구 마곡동 749-8_ㅋㅋㅋ','문씨','010-1234-5789'),(26,19,'내이름','07810_서울 강서구 마곡동 749-8_302호','다음','010-4659-7894'),(27,5,'친구','06000_서울 강남구 강남대로 708_123','문비단','010-4659-1249');
/*!40000 ALTER TABLE `Address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cart`
--

DROP TABLE IF EXISTS `Cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Cart` (
  `seq` int(11) NOT NULL AUTO_INCREMENT,
  `User_seq` int(11) NOT NULL,
  `Product_seq` int(11) NOT NULL,
  `size` varchar(45) DEFAULT NULL,
  `qty` varchar(45) DEFAULT NULL,
  `startDate` varchar(45) DEFAULT NULL,
  `endDate` varchar(45) DEFAULT NULL,
  `rentDay` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`seq`),
  UNIQUE KEY `seq_UNIQUE` (`seq`),
  KEY `fk_Cart_User1_idx` (`User_seq`),
  KEY `fk_Cart_Product1_idx` (`Product_seq`),
  CONSTRAINT `fk_Cart_Product1` FOREIGN KEY (`Product_seq`) REFERENCES `product` (`seq`),
  CONSTRAINT `fk_Cart_User1` FOREIGN KEY (`User_seq`) REFERENCES `user` (`seq`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cart`
--

LOCK TABLES `Cart` WRITE;
/*!40000 ALTER TABLE `Cart` DISABLE KEYS */;
INSERT INTO `Cart` VALUES (5,20,4,'250','2','2020-08-09','2020-08-11','2'),(6,1,5,'260','1','2020-08-11','2020-08-12','1'),(7,1,3,'245','2','2020-08-11','2020-08-13','2'),(9,1,5,'230','1','2020-08-04','2020-08-05','1'),(11,1,3,'245','1','2020-08-04','2020-08-11','7'),(13,19,5,'230','1','2020-08-19','2020-08-27','8'),(14,22,5,'230','1','2020-08-23','2020-08-31','8'),(15,22,5,'230','1','2020-08-23','2020-08-31','8'),(16,19,6,'270','1','2020-08-15','2020-08-24','9'),(17,19,6,'230','1','2020-08-14','2020-08-18','4'),(18,19,6,'230','1','2020-08-15','2020-08-18','3'),(19,19,5,'230','1','2020-08-15','2020-08-18','3'),(20,19,6,'230','1','2020-08-22','2020-08-24','2'),(21,24,8,'230','1','2020-08-15','2020-08-17','2'),(22,24,5,'230','1','2020-08-15','2020-08-26','11');
/*!40000 ALTER TABLE `Cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CartStatus`
--

DROP TABLE IF EXISTS `CartStatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CartStatus` (
  `seq` int(11) NOT NULL AUTO_INCREMENT,
  `Cart_seq` int(11) NOT NULL,
  `CartStatusRef_seq` int(11) NOT NULL,
  PRIMARY KEY (`seq`,`Cart_seq`,`CartStatusRef_seq`),
  UNIQUE KEY `seq_UNIQUE` (`seq`),
  KEY `fk_CartStatus_Cart1_idx` (`Cart_seq`),
  KEY `fk_CartStatus_CartStatusRef1_idx` (`CartStatusRef_seq`),
  CONSTRAINT `fk_CartStatus_Cart1` FOREIGN KEY (`Cart_seq`) REFERENCES `cart` (`seq`),
  CONSTRAINT `fk_CartStatus_CartStatusRef1` FOREIGN KEY (`CartStatusRef_seq`) REFERENCES `cartstatusref` (`seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CartStatus`
--

LOCK TABLES `CartStatus` WRITE;
/*!40000 ALTER TABLE `CartStatus` DISABLE KEYS */;
/*!40000 ALTER TABLE `CartStatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CartStatusRef`
--

DROP TABLE IF EXISTS `CartStatusRef`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CartStatusRef` (
  `seq` int(11) NOT NULL AUTO_INCREMENT,
  `status` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`seq`),
  UNIQUE KEY `seq_UNIQUE` (`seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CartStatusRef`
--

LOCK TABLES `CartStatusRef` WRITE;
/*!40000 ALTER TABLE `CartStatusRef` DISABLE KEYS */;
/*!40000 ALTER TABLE `CartStatusRef` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Contract`
--

DROP TABLE IF EXISTS `Contract`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Contract` (
  `seq` int(11) NOT NULL AUTO_INCREMENT,
  `Product_seq` int(11) NOT NULL,
  `ContractOffice_seq` int(11) NOT NULL,
  `size` varchar(45) DEFAULT NULL,
  `qty` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`seq`,`Product_seq`,`ContractOffice_seq`),
  UNIQUE KEY `seq_UNIQUE` (`seq`),
  KEY `fk_Contract_Product1_idx` (`Product_seq`),
  KEY `fk_Contract_ContractOffice1_idx` (`ContractOffice_seq`),
  CONSTRAINT `fk_Contract_ContractOffice1` FOREIGN KEY (`ContractOffice_seq`) REFERENCES `contractoffice` (`seq`),
  CONSTRAINT `fk_Contract_Product1` FOREIGN KEY (`Product_seq`) REFERENCES `product` (`seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Contract`
--

LOCK TABLES `Contract` WRITE;
/*!40000 ALTER TABLE `Contract` DISABLE KEYS */;
/*!40000 ALTER TABLE `Contract` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ContractOffice`
--

DROP TABLE IF EXISTS `ContractOffice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ContractOffice` (
  `seq` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`seq`),
  UNIQUE KEY `seq_UNIQUE` (`seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ContractOffice`
--

LOCK TABLES `ContractOffice` WRITE;
/*!40000 ALTER TABLE `ContractOffice` DISABLE KEYS */;
/*!40000 ALTER TABLE `ContractOffice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Deposit`
--

DROP TABLE IF EXISTS `Deposit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Deposit` (
  `seq` int(11) NOT NULL AUTO_INCREMENT,
  `Payment_seq` int(11) NOT NULL,
  `account` varchar(45) DEFAULT NULL,
  `accountName` varchar(45) DEFAULT NULL,
  `deposit` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`seq`,`Payment_seq`),
  UNIQUE KEY `seq_UNIQUE` (`seq`),
  KEY `fk_Deposit_Payment1_idx` (`Payment_seq`),
  CONSTRAINT `fk_Deposit_Payment1` FOREIGN KEY (`Payment_seq`) REFERENCES `payment` (`seq`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Deposit`
--

LOCK TABLES `Deposit` WRITE;
/*!40000 ALTER TABLE `Deposit` DISABLE KEYS */;
INSERT INTO `Deposit` VALUES (1,11,'1','1','1'),(2,5,'110-233546-46','문단비','20000'),(3,10,'123456789','aaa','3000'),(4,12,'9549','123456','90000'),(5,12,'11111111111','ㅁㅁㅁ','200000'),(6,27,'1','1','20000'),(7,27,'계좌','1','20000'),(8,27,'계좌','1','20000'),(9,28,NULL,NULL,'20000'),(10,29,NULL,NULL,'20000'),(11,30,NULL,NULL,'20000'),(12,31,NULL,NULL,'20000'),(13,32,'이름','1111111111','20000'),(14,33,'121345678','이름','20000'),(15,34,'30410204204892','문단비','20000'),(16,22,'zzz','zxcv','100'),(17,35,'1111111111','이름','20000'),(18,36,'99999994548','123456','20000');
/*!40000 ALTER TABLE `Deposit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Grade`
--

DROP TABLE IF EXISTS `Grade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Grade` (
  `seq` int(11) NOT NULL AUTO_INCREMENT,
  `Grade` varchar(45) DEFAULT NULL,
  `Criteria` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`seq`),
  UNIQUE KEY `seq_UNIQUE` (`seq`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Grade`
--

LOCK TABLES `Grade` WRITE;
/*!40000 ALTER TABLE `Grade` DISABLE KEYS */;
INSERT INTO `Grade` VALUES (0,'관리자',NULL),(1,'브론즈',NULL),(2,'실버',NULL),(3,'골드',NULL),(4,'플래티넘',NULL),(5,'블랙',NULL);
/*!40000 ALTER TABLE `Grade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Login`
--

DROP TABLE IF EXISTS `Login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Login` (
  `seq` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `status` varchar(45) DEFAULT '1',
  PRIMARY KEY (`seq`),
  UNIQUE KEY `seq_UNIQUE` (`seq`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Login`
--

LOCK TABLES `Login` WRITE;
/*!40000 ALTER TABLE `Login` DISABLE KEYS */;
INSERT INTO `Login` VALUES (1,'test','test','1'),(2,'abc@abc.om','qwer1234@','1'),(3,'new','123','1'),(4,'email0','password0','1'),(19,'abc@abc.com','123','1'),(20,'1234','123','1'),(21,'12345','123','1'),(22,'123456','123','1'),(23,'A123','asdf','1'),(24,'hello','asdf','1');
/*!40000 ALTER TABLE `Login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Notice`
--

DROP TABLE IF EXISTS `Notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Notice` (
  `seq` int(11) NOT NULL AUTO_INCREMENT,
  `User_seq` int(11) NOT NULL,
  `title` varchar(45) DEFAULT NULL,
  `content` varchar(45) DEFAULT NULL,
  `write_Date` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`seq`),
  UNIQUE KEY `seq_UNIQUE` (`seq`),
  KEY `fk_Notice_User1_idx` (`User_seq`),
  CONSTRAINT `fk_Notice_User1` FOREIGN KEY (`User_seq`) REFERENCES `user` (`seq`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Notice`
--

LOCK TABLES `Notice` WRITE;
/*!40000 ALTER TABLE `Notice` DISABLE KEYS */;
INSERT INTO `Notice` VALUES (1,1,'회원가입시 1,000원 적립금 제공!','회원가입시 바로 사용하실 수 있는 1,000원 적립금 제공해드립니다.','2020-08-06 16:39:04'),(2,1,'주말, 공휴일 주문 건 처리 관련','택배발송이 주 5일제로 인하여 주말 또는 공휴일에는 택배발송이 안됩니다.','2020-08-06 16:39:34');
/*!40000 ALTER TABLE `Notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `NoticeQuestion`
--

DROP TABLE IF EXISTS `NoticeQuestion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `NoticeQuestion` (
  `seq` int(11) NOT NULL AUTO_INCREMENT,
  `User_seq` int(11) NOT NULL,
  `title` varchar(45) DEFAULT NULL,
  `content` varchar(45) DEFAULT NULL,
  `type` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`seq`),
  UNIQUE KEY `seq_UNIQUE` (`seq`),
  KEY `fk_NoticeQuestion_User1_idx` (`User_seq`),
  CONSTRAINT `fk_NoticeQuestion_User1` FOREIGN KEY (`User_seq`) REFERENCES `user` (`seq`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `NoticeQuestion`
--

LOCK TABLES `NoticeQuestion` WRITE;
/*!40000 ALTER TABLE `NoticeQuestion` DISABLE KEYS */;
INSERT INTO `NoticeQuestion` VALUES (1,1,'현금영수증 발급 가능한가요?','계좌이체로 결제하신 경우 현금영수증 발급이 가능합니다.','영수증'),(2,1,'배송(포장) 박스는 버려도 되나요?','상품의 배송(포장) 박스는 잘 보관하셨다가 반납 포장시 재사용을 부탁드립니다.','배송');
/*!40000 ALTER TABLE `NoticeQuestion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Payment`
--

DROP TABLE IF EXISTS `Payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Payment` (
  `seq` int(11) NOT NULL AUTO_INCREMENT,
  `User_seq` int(11) NOT NULL,
  `Rent_seq` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `address` varchar(45) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `payment` varchar(45) DEFAULT NULL,
  `receiveMethod` varchar(45) DEFAULT NULL,
  `returnMethod` varchar(45) DEFAULT NULL,
  `accountName` varchar(45) DEFAULT NULL,
  `paymentMethod` varchar(45) DEFAULT NULL,
  `optional` varchar(45) DEFAULT NULL,
  `orderDate` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`seq`),
  UNIQUE KEY `seq_UNIQUE` (`seq`),
  KEY `fk_Payment_User1_idx` (`User_seq`),
  KEY `fk_Payment_Rent1_idx` (`Rent_seq`),
  CONSTRAINT `fk_Payment_Rent1` FOREIGN KEY (`Rent_seq`) REFERENCES `rent` (`seq`),
  CONSTRAINT `fk_Payment_User1` FOREIGN KEY (`User_seq`) REFERENCES `user` (`seq`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Payment`
--

LOCK TABLES `Payment` WRITE;
/*!40000 ALTER TABLE `Payment` DISABLE KEYS */;
INSERT INTO `Payment` VALUES (3,1,8,NULL,'48060_부산 해운대구 APEC로 17_Aa','123-345-678','23000','오토퀵','오토퀵','Zzz','계좌',NULL,'2020-08-07 12:43:45'),(4,1,8,'Aa','06027_서울 강남구 신사동 527-4_Asdf','123-123-4134','23000','오토퀵','오토퀵','Zz','계좌','Zz','2020-08-07 12:47:40'),(5,1,8,'이창수','34672_대전 동구 판암동 497-7_111','010-5158-8072','23000','직접방문','직접방문','이차웃','계좌','배고파','2020-08-07 12:52:45'),(6,1,8,'aaa','48060_부산 해운대구 우동 1413-4_zz','123-1234-123','3000','오토퀵','직접방문','','카드','Aa','2020-08-07 13:34:59'),(7,1,8,'aa','01014_서울 강북구 4.19로11길 6_Zz','123-234-345','3000','직접방문','직접방문','','카드','Zz','2020-08-07 13:36:55'),(8,3,8,'Asd','48060_부산 해운대구 APEC로 17_1`23','123-123-123','23000','택배','택배','123','계좌','123','2020-08-07 13:41:34'),(9,3,8,'aaa','03900_서울 마포구 가양대로 1_qwe','010-1231-1231','23000','직접방문','직접방문','홍길동','계좌','dasd','2020-08-07 13:54:38'),(10,1,9,'1','18111_경기 오산시 외삼미로 50-5_99899','123-123-1111','53000','직접방문','직접방문','Aaa','계좌','qqqq','2020-08-07 15:57:31'),(11,3,9,'이창수','28787_충북 청주시 상당구 1순환로 1202-1_ㄷㅊ','000-0000-0001','33000','직접방문','직접방문','1','카드','11','2020-08-07 16:00:41'),(12,20,9,'111','48060_부산 해운대구 우동 1514_Xxcv','010-010-010','12000','직접방문','직접방문','','카드','9999','2020-08-10 15:39:48'),(13,19,8,'받으시는 분','01000_서울 강북구 우이동 337_123','123-1231-2132',NULL,'택배','택배','123','계좌','ewqrqw','2020-08-11 15:23:45'),(14,19,8,'aaa','48060_부산 해운대구 우동 1514_qqwe','123-1232-2321','40000','택배','택배','홍길동','계좌','3123123123','2020-08-11 15:24:42'),(17,19,8,'qwe','06362_서울 강남구 밤고개로 76-2_상세주소','010-1234-1231','40000','직접방문','직접방문','입금예정자','계좌','ㅁㄴㅇㄴㅇㅁㄴㅇ','2020-08-11 15:46:19'),(18,19,8,'받으시는 분','48060_부산 해운대구 APEC로 17_qwe','010-1234-1527','40000','택배','택배','입금예정자','계좌','qweqwe','2020-08-11 15:53:04'),(19,19,8,'케이뱅크1111111111','03900_서울 마포구 가양대로 3_qweqwe','231-1234-1527','40000','택배','택배','홍길동','계좌','qwewqeasdfasdxzcvcxz','2020-08-11 16:50:17'),(20,19,8,'네이버','10030_경기 김포시 통진읍 가현로 41_202동 202호','010-8736-1234','40000','택배','택배','외환은행 _ 1111111111','계좌','도착전에 전화주세요','2020-08-11 16:53:20'),(21,19,8,'asd','06362_서울 강남구 밤고개로 76-2_네이버','010-8736-1234','40000','택배','택배','카카오뱅크 _ 1111111111','계좌','요청','2020-08-11 17:15:19'),(22,19,8,'신경환','08705_서울 관악구 신림동 503-42_205호','010-2614-3391','35000','오토퀵','택배','카카오뱅크 _ 1234567896','계좌','빨리 보내주세요 ㅠㅠ','2020-08-12 12:20:42'),(23,19,8,'aaa','48060_부산 해운대구 APEC로 17_asd','010-1234-1527','40000','택배','택배','케이뱅크 _ 1111111111','계좌','dycjdtkgkd','2020-08-12 12:36:53'),(24,19,8,'qwe','28787_충북 청주시 상당구 방서동 227-11_202동 202호','010-1123-1010','40000','택배','택배','케이뱅크 _ 23165456654','계좌','배달전 연락주세요','2020-08-12 12:39:47'),(25,19,8,'qwe','06362_서울 강남구 밤고개로 76-2_202동 202호','010-8736-1231','40000','택배','택배','케이뱅크 _ 1212121212121212','계좌','요청사항 입니다','2020-08-12 12:41:00'),(26,19,8,'신경환1','08705_서울 관악구 조원로 119_203호','010-2614-3391','26000','택배','직접방문','케이뱅크 _ 1234567896','계좌','다음다음','2020-08-12 12:41:52'),(27,19,8,'aaa','48060_부산 해운대구 APEC로 30_주소','010-1231-2456','40000','택배','택배','케이뱅크 _ 1111111111','계좌','요청','2020-08-12 12:42:50'),(28,19,8,'123123123','06362_서울 강남구 밤고개로 76-2_123','123-1231-2131','40000','택배','택배','케이뱅크 _ 1111111111','계좌','12323','2020-08-12 14:08:44'),(29,19,8,'asd','06362_서울 강남구 수서동 728_123동','010-1111-2222','40000','택배','택배','케이뱅크 _ 1111111111','계좌','빨리주세요','2020-08-12 14:13:10'),(30,19,8,'aaa','06362_서울 강남구 밤고개로 76-2_123','010-8736-1234','40000','택배','택배','케이뱅크 _ 1111111111','계좌','asd','2020-08-12 14:20:38'),(31,19,8,'asd','06362_서울 강남구 밤고개로 76-2_202동 202호','010-8736-1231','40000','택배','택배','케이뱅크 _ 1111111111','계좌','qwe','2020-08-12 14:23:23'),(32,19,8,'asd','48060_부산 해운대구 우동 1413-4_123','123-3123-3123','40000','택배','택배','케이뱅크 _ 1111111111','계좌','123123','2020-08-12 14:25:10'),(33,19,8,'asd','06362_서울 강남구 밤고개로 76-2_123','010-1234-1527','40000','택배','택배','국민은행 _ 121345678','계좌','asd','2020-08-12 14:26:34'),(34,19,8,'문단비','22608_인천 서구 가현로 41_202동 904호','010-4147-5296','40000','택배','택배','국민은행 _ 30410204204892','계좌','배달 빨리해주세요','2020-08-12 14:36:46'),(35,1,38,'asd','06362_서울 강남구 밤고개로 76-2_202동 202호','010-1234-1527','30000','택배','택배','케이뱅크 _ 1111111111','계좌','ajklsd','2020-08-12 14:56:36'),(36,19,40,'모른척','07803_서울 강서구 마곡동 723-1_그만해','010-0000-1234','27000','오토퀵','직접방문','케이뱅크 _ 99999994548','계좌','안녕하세요','2020-08-12 15:33:01');
/*!40000 ALTER TABLE `Payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PaymentStatus`
--

DROP TABLE IF EXISTS `PaymentStatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PaymentStatus` (
  `seq` int(11) NOT NULL AUTO_INCREMENT,
  `Payment_seq` int(11) NOT NULL,
  `PaymentStatusRef_seq` int(11) NOT NULL,
  PRIMARY KEY (`seq`),
  UNIQUE KEY `seq_UNIQUE` (`seq`),
  KEY `fk_PaymentStatus_Payment1_idx` (`Payment_seq`),
  KEY `fk_PaymentStatus_PaymentStatusRef1_idx` (`PaymentStatusRef_seq`),
  CONSTRAINT `fk_PaymentStatus_Payment1` FOREIGN KEY (`Payment_seq`) REFERENCES `payment` (`seq`),
  CONSTRAINT `fk_PaymentStatus_PaymentStatusRef1` FOREIGN KEY (`PaymentStatusRef_seq`) REFERENCES `paymentstatusref` (`seq`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PaymentStatus`
--

LOCK TABLES `PaymentStatus` WRITE;
/*!40000 ALTER TABLE `PaymentStatus` DISABLE KEYS */;
INSERT INTO `PaymentStatus` VALUES (1,10,1),(2,11,2),(5,12,1),(6,22,2),(7,33,2),(8,34,2),(9,35,2),(10,36,2);
/*!40000 ALTER TABLE `PaymentStatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PaymentStatusRef`
--

DROP TABLE IF EXISTS `PaymentStatusRef`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PaymentStatusRef` (
  `seq` int(11) NOT NULL AUTO_INCREMENT,
  `status` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`seq`),
  UNIQUE KEY `seq_UNIQUE` (`seq`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PaymentStatusRef`
--

LOCK TABLES `PaymentStatusRef` WRITE;
/*!40000 ALTER TABLE `PaymentStatusRef` DISABLE KEYS */;
INSERT INTO `PaymentStatusRef` VALUES (1,'결제전'),(2,'결제완료');
/*!40000 ALTER TABLE `PaymentStatusRef` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Point`
--

DROP TABLE IF EXISTS `Point`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Point` (
  `seq` int(11) NOT NULL AUTO_INCREMENT,
  `point` varchar(45) DEFAULT NULL,
  `User_seq` int(11) NOT NULL,
  PRIMARY KEY (`seq`,`User_seq`),
  UNIQUE KEY `seq_UNIQUE` (`seq`),
  KEY `fk_Point_User1_idx` (`User_seq`),
  CONSTRAINT `fk_Point_User1` FOREIGN KEY (`User_seq`) REFERENCES `user` (`seq`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Point`
--

LOCK TABLES `Point` WRITE;
/*!40000 ALTER TABLE `Point` DISABLE KEYS */;
INSERT INTO `Point` VALUES (1,'3000',3),(2,'120000',1),(3,'5000',19),(4,'5600',5),(5,'15000',7),(6,'4500',20),(7,'7000',21),(8,'8000',22),(9,'10000',23),(10,'12000',24);
/*!40000 ALTER TABLE `Point` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PointList`
--

DROP TABLE IF EXISTS `PointList`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PointList` (
  `seq` int(11) NOT NULL AUTO_INCREMENT,
  `Point_seq` int(11) NOT NULL,
  `content` varchar(45) DEFAULT NULL,
  `point` int(11) DEFAULT NULL,
  PRIMARY KEY (`seq`,`Point_seq`),
  UNIQUE KEY `seq_UNIQUE` (`seq`),
  KEY `fk_PointList_Point1_idx` (`Point_seq`),
  CONSTRAINT `fk_PointList_Point1` FOREIGN KEY (`Point_seq`) REFERENCES `point` (`seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PointList`
--

LOCK TABLES `PointList` WRITE;
/*!40000 ALTER TABLE `PointList` DISABLE KEYS */;
/*!40000 ALTER TABLE `PointList` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Product`
--

DROP TABLE IF EXISTS `Product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Product` (
  `seq` int(11) NOT NULL AUTO_INCREMENT,
  `ProductCategory_seq` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `price` varchar(45) DEFAULT NULL,
  `uploadDate` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`seq`,`ProductCategory_seq`),
  UNIQUE KEY `seq_UNIQUE` (`seq`),
  KEY `fk_Product_ProductCategory1_idx` (`ProductCategory_seq`),
  CONSTRAINT `fk_Product_ProductCategory1` FOREIGN KEY (`ProductCategory_seq`) REFERENCES `productcategory` (`seq`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Product`
--

LOCK TABLES `Product` WRITE;
/*!40000 ALTER TABLE `Product` DISABLE KEYS */;
INSERT INTO `Product` VALUES (3,5,'워커','6000','2020-08-10 12:18:15'),(4,3,'실내화','1000','2020-08-10 13:46:43'),(5,4,'꽃신','9000','2020-08-10 13:50:11'),(6,3,'슬리퍼','1000','2020-08-10 14:21:44'),(8,5,'워커','5000','2020-08-12 14:02:56'),(9,3,'슬리퍼','4000','2020-08-12 14:38:39');
/*!40000 ALTER TABLE `Product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ProductCategory`
--

DROP TABLE IF EXISTS `ProductCategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ProductCategory` (
  `seq` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`seq`),
  UNIQUE KEY `seq_UNIQUE` (`seq`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ProductCategory`
--

LOCK TABLES `ProductCategory` WRITE;
/*!40000 ALTER TABLE `ProductCategory` DISABLE KEYS */;
INSERT INTO `ProductCategory` VALUES (1,'구두(정장/행사)'),(2,'운동화/스니커즈'),(3,'실내화/슬리퍼'),(4,'고무/무도/꽃신(기능)'),(5,'워커/부츠/장화');
/*!40000 ALTER TABLE `ProductCategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ProductImage`
--

DROP TABLE IF EXISTS `ProductImage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ProductImage` (
  `seq` int(11) NOT NULL AUTO_INCREMENT,
  `Product_seq` int(11) NOT NULL,
  `image` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`seq`,`Product_seq`),
  UNIQUE KEY `seq_UNIQUE` (`seq`),
  KEY `fk_ProductImage_Product1_idx` (`Product_seq`),
  CONSTRAINT `fk_ProductImage_Product1` FOREIGN KEY (`Product_seq`) REFERENCES `product` (`seq`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ProductImage`
--

LOCK TABLES `ProductImage` WRITE;
/*!40000 ALTER TABLE `ProductImage` DISABLE KEYS */;
INSERT INTO `ProductImage` VALUES (4,3,'워커.jpeg'),(5,4,'실내화2.jpeg'),(6,5,'꽃신.jpeg'),(7,6,'슬리퍼3.jpeg'),(9,8,'워커2.jpeg'),(10,9,'슬리퍼1.jpeg');
/*!40000 ALTER TABLE `ProductImage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ProductInformation`
--

DROP TABLE IF EXISTS `ProductInformation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ProductInformation` (
  `seq` int(11) NOT NULL AUTO_INCREMENT,
  `Product_seq` int(11) NOT NULL,
  `content` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`seq`,`Product_seq`),
  UNIQUE KEY `seq_UNIQUE` (`seq`),
  KEY `fk_ProductInformation_Product1_idx` (`Product_seq`),
  CONSTRAINT `fk_ProductInformation_Product1` FOREIGN KEY (`Product_seq`) REFERENCES `product` (`seq`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ProductInformation`
--

LOCK TABLES `ProductInformation` WRITE;
/*!40000 ALTER TABLE `ProductInformation` DISABLE KEYS */;
INSERT INTO `ProductInformation` VALUES (1,3,'testtestesetset'),(2,4,'testtestesetset'),(3,5,'testtestesetset'),(4,6,'testtestesetset'),(8,8,'testtestesetset'),(9,9,'test\r\nㅁㅅㄷ\r\n123\r\n!@#!@#\r\n');
/*!40000 ALTER TABLE `ProductInformation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ProductStock`
--

DROP TABLE IF EXISTS `ProductStock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ProductStock` (
  `seq` int(11) NOT NULL AUTO_INCREMENT,
  `Product_seq` int(11) NOT NULL,
  `size` varchar(45) DEFAULT NULL,
  `qty` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`seq`),
  UNIQUE KEY `seq_UNIQUE` (`seq`),
  KEY `fk_ProductStock_Product1_idx` (`Product_seq`),
  CONSTRAINT `fk_ProductStock_Product1` FOREIGN KEY (`Product_seq`) REFERENCES `product` (`seq`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ProductStock`
--

LOCK TABLES `ProductStock` WRITE;
/*!40000 ALTER TABLE `ProductStock` DISABLE KEYS */;
INSERT INTO `ProductStock` VALUES (1,5,'460','1'),(2,5,'690','1'),(3,5,'920','1'),(4,5,'1150','1'),(5,5,'1380','1'),(6,5,'1610','1'),(7,5,'1840','1'),(8,5,'2070','0'),(9,5,'2300','1'),(10,5,'2530','1'),(11,5,'2760','1'),(12,5,'2990','1'),(13,5,'3220','1'),(14,5,'3450','1'),(15,5,'3680','1'),(16,6,'5','3'),(17,6,'5','3'),(18,6,'5','0'),(19,6,'5','0'),(20,6,'5','0'),(21,6,'5','0'),(22,6,'5','0'),(23,6,'5','0'),(24,6,'5','0'),(25,6,'5','0'),(26,6,'5','0'),(27,6,'5','0'),(28,6,'5','0'),(29,6,'5','0'),(30,6,'5','0'),(46,8,'5','0'),(47,8,'5','0'),(48,8,'5','0'),(49,8,'5','0'),(50,8,'5','0'),(51,8,'5','0'),(52,8,'5','0'),(53,8,'5','0'),(54,8,'5','0'),(55,8,'5','3'),(56,8,'5','0'),(57,8,'5','0'),(58,8,'5','0'),(59,8,'5','0'),(60,8,'5','0'),(61,9,'5','2'),(62,9,'5','0'),(63,9,'5','0'),(64,9,'5','0'),(65,9,'5','0'),(66,9,'5','0'),(67,9,'5','0'),(68,9,'5','0'),(69,9,'5','0'),(70,9,'5','0'),(71,9,'5','0'),(72,9,'5','0'),(73,9,'5','0'),(74,9,'5','0'),(75,9,'5','0');
/*!40000 ALTER TABLE `ProductStock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QA`
--

DROP TABLE IF EXISTS `QA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `QA` (
  `seq` int(11) NOT NULL AUTO_INCREMENT,
  `User_seq` int(11) NOT NULL,
  `QACategory_seq` int(11) NOT NULL,
  `title` varchar(45) DEFAULT NULL,
  `content` text,
  `answer` text,
  `writeTime` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`seq`),
  UNIQUE KEY `seq_UNIQUE` (`seq`),
  KEY `fk_QA_QACategory1_idx` (`QACategory_seq`),
  KEY `fk_QA_User1_idx` (`User_seq`),
  CONSTRAINT `fk_QA_QACategory1` FOREIGN KEY (`QACategory_seq`) REFERENCES `qacategory` (`seq`),
  CONSTRAINT `fk_QA_QAUser1` FOREIGN KEY (`User_seq`) REFERENCES `user` (`seq`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QA`
--

LOCK TABLES `QA` WRITE;
/*!40000 ALTER TABLE `QA` DISABLE KEYS */;
INSERT INTO `QA` VALUES (1,1,1,'123','234','질문이 뭔가요?','2020-08-06 16:06:52'),(2,3,2,'문의-제목','문의-내용',NULL,'2020-08-07 10:49:15'),(3,3,7,'문의제목','문의내용',NULL,'2020-08-07 10:58:10'),(4,5,4,'문의제목','문의내용',NULL,'2020-08-10 16:55:38'),(5,5,5,'sd','sd','aaaaaaa','2020-08-10 17:46:06');
/*!40000 ALTER TABLE `QA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QACategory`
--

DROP TABLE IF EXISTS `QACategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `QACategory` (
  `seq` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`seq`),
  UNIQUE KEY `seq_UNIQUE` (`seq`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QACategory`
--

LOCK TABLES `QACategory` WRITE;
/*!40000 ALTER TABLE `QACategory` DISABLE KEYS */;
INSERT INTO `QACategory` VALUES (1,'상품문의'),(2,'입금확인'),(3,'현금영수증'),(4,'배송문의'),(5,'교환/반품'),(6,'주문취소/환불'),(7,'기타');
/*!40000 ALTER TABLE `QACategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QAStatus`
--

DROP TABLE IF EXISTS `QAStatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `QAStatus` (
  `seq` int(11) NOT NULL AUTO_INCREMENT,
  `QA_seq` int(11) NOT NULL,
  `QAStatusRef_seq` int(11) NOT NULL,
  PRIMARY KEY (`seq`),
  UNIQUE KEY `seq_UNIQUE` (`seq`),
  KEY `fk_QA_has_QAStatusRef_QAStatusRef1_idx` (`QAStatusRef_seq`),
  KEY `fk_QA_has_QAStatusRef_QA_idx` (`QA_seq`),
  CONSTRAINT `fk_QA_has_QAStatusRef_QA` FOREIGN KEY (`QA_seq`) REFERENCES `qa` (`seq`),
  CONSTRAINT `fk_QA_has_QAStatusRef_QAStatusRef1` FOREIGN KEY (`QAStatusRef_seq`) REFERENCES `qastatusref` (`seq`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QAStatus`
--

LOCK TABLES `QAStatus` WRITE;
/*!40000 ALTER TABLE `QAStatus` DISABLE KEYS */;
INSERT INTO `QAStatus` VALUES (1,1,2),(2,2,1),(3,3,1),(4,4,1),(5,5,2);
/*!40000 ALTER TABLE `QAStatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QAStatusRef`
--

DROP TABLE IF EXISTS `QAStatusRef`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `QAStatusRef` (
  `seq` int(11) NOT NULL AUTO_INCREMENT,
  `status` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`seq`),
  UNIQUE KEY `seq_UNIQUE` (`seq`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QAStatusRef`
--

LOCK TABLES `QAStatusRef` WRITE;
/*!40000 ALTER TABLE `QAStatusRef` DISABLE KEYS */;
INSERT INTO `QAStatusRef` VALUES (1,'답변대기'),(2,'답변완료');
/*!40000 ALTER TABLE `QAStatusRef` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Rent`
--

DROP TABLE IF EXISTS `Rent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Rent` (
  `seq` int(11) NOT NULL AUTO_INCREMENT,
  `Cart_seq` int(11) NOT NULL,
  `orderDate` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`seq`),
  UNIQUE KEY `seq_UNIQUE` (`seq`),
  KEY `fk_Rent_Cart1_idx` (`Cart_seq`),
  CONSTRAINT `fk_Rent_Cart1` FOREIGN KEY (`Cart_seq`) REFERENCES `cart` (`seq`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Rent`
--

LOCK TABLES `Rent` WRITE;
/*!40000 ALTER TABLE `Rent` DISABLE KEYS */;
INSERT INTO `Rent` VALUES (4,7,'2020-08-11 12:16:17'),(6,11,'2020-08-11 12:21:33'),(8,13,'2020-08-11 14:43:12'),(9,15,'2020-08-11 17:43:19'),(10,11,'2020-08-11 18:33:42'),(11,11,'2020-08-11 18:38:29'),(12,17,'2020-08-12 12:14:01'),(13,18,'2020-08-12 12:15:48'),(14,19,'2020-08-12 12:16:27'),(15,19,'2020-08-12 12:35:07'),(16,19,'2020-08-12 12:35:47'),(17,19,'2020-08-12 12:36:00'),(18,19,'2020-08-12 12:36:15'),(19,19,'2020-08-12 12:39:02'),(20,19,'2020-08-12 12:40:28'),(21,20,'2020-08-12 12:40:31'),(22,20,'2020-08-12 12:42:26'),(23,20,'2020-08-12 13:56:33'),(24,20,'2020-08-12 14:08:20'),(25,20,'2020-08-12 14:12:28'),(26,20,'2020-08-12 14:20:01'),(27,20,'2020-08-12 14:23:00'),(28,20,'2020-08-12 14:24:48'),(29,20,'2020-08-12 14:26:10'),(30,21,'2020-08-12 14:29:44'),(31,20,'2020-08-12 14:34:58'),(32,20,'2020-08-12 14:39:39'),(33,20,'2020-08-12 14:40:28'),(34,20,'2020-08-12 14:40:29'),(35,20,'2020-08-12 14:41:47'),(36,20,'2020-08-12 14:43:37'),(37,22,'2020-08-12 14:50:10'),(38,11,'2020-08-12 14:56:10'),(40,20,'2020-08-12 15:31:02');
/*!40000 ALTER TABLE `Rent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Review`
--

DROP TABLE IF EXISTS `Review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Review` (
  `seq` int(11) NOT NULL AUTO_INCREMENT,
  `User_seq` int(11) NOT NULL,
  `Payment_seq` int(11) NOT NULL,
  `title` varchar(45) DEFAULT NULL,
  `content` text,
  `writeDate` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`seq`),
  UNIQUE KEY `seq_UNIQUE` (`seq`),
  KEY `fk_Review_User1_idx` (`User_seq`),
  KEY `fk_Review_Payment1_idx` (`Payment_seq`),
  CONSTRAINT `fk_Review_Payment1` FOREIGN KEY (`Payment_seq`) REFERENCES `payment` (`seq`),
  CONSTRAINT `fk_Review_User1` FOREIGN KEY (`User_seq`) REFERENCES `user` (`seq`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Review`
--

LOCK TABLES `Review` WRITE;
/*!40000 ALTER TABLE `Review` DISABLE KEYS */;
INSERT INTO `Review` VALUES (2,3,8,'대여 후기','꽃신을 구매하기에는 부담스러워서 대여를 했는데, \n신발 상태도 좋고 배송도 빨라서 만족스러웠습니다.','2020-08-10 14:17:20');
/*!40000 ALTER TABLE `Review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ReviewImage`
--

DROP TABLE IF EXISTS `ReviewImage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ReviewImage` (
  `seq` int(11) NOT NULL AUTO_INCREMENT,
  `Review_seq` int(11) NOT NULL,
  `image` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`seq`),
  UNIQUE KEY `seq_UNIQUE` (`seq`),
  KEY `fk_ReviewImage_Review1_idx` (`Review_seq`),
  CONSTRAINT `fk_ReviewImage_Review1` FOREIGN KEY (`Review_seq`) REFERENCES `review` (`seq`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ReviewImage`
--

LOCK TABLES `ReviewImage` WRITE;
/*!40000 ALTER TABLE `ReviewImage` DISABLE KEYS */;
INSERT INTO `ReviewImage` VALUES (1,2,'꽃신.jpeg');
/*!40000 ALTER TABLE `ReviewImage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ReviewViews`
--

DROP TABLE IF EXISTS `ReviewViews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ReviewViews` (
  `seq` int(11) NOT NULL AUTO_INCREMENT,
  `Review_seq` int(11) NOT NULL,
  `views` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`seq`),
  UNIQUE KEY `seq_UNIQUE` (`seq`),
  KEY `fk_ReviewViews_Review1_idx` (`Review_seq`),
  CONSTRAINT `fk_ReviewViews_Review1` FOREIGN KEY (`Review_seq`) REFERENCES `review` (`seq`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ReviewViews`
--

LOCK TABLES `ReviewViews` WRITE;
/*!40000 ALTER TABLE `ReviewViews` DISABLE KEYS */;
INSERT INTO `ReviewViews` VALUES (2,2,'39');
/*!40000 ALTER TABLE `ReviewViews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User`
--

DROP TABLE IF EXISTS `User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `User` (
  `seq` int(11) NOT NULL AUTO_INCREMENT,
  `Login_seq` int(11) NOT NULL,
  `Grade_seq` int(11) NOT NULL DEFAULT '1',
  `nickname` varchar(45) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `birthday` varchar(45) DEFAULT NULL,
  `createDate` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`seq`),
  UNIQUE KEY `seq_UNIQUE` (`seq`),
  KEY `fk_User_Login1_idx` (`Login_seq`),
  KEY `fk_User_Grade1_idx` (`Grade_seq`),
  CONSTRAINT `fk_User_Grade1` FOREIGN KEY (`Grade_seq`) REFERENCES `grade` (`seq`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_User_Login1` FOREIGN KEY (`Login_seq`) REFERENCES `login` (`seq`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User`
--

LOCK TABLES `User` WRITE;
/*!40000 ALTER TABLE `User` DISABLE KEYS */;
INSERT INTO `User` VALUES (1,1,0,'Administer','010-5158-0721','0729','2020-08-06 13:45:52'),(3,2,1,'신경환123','010-2614-3390','1986-08-06','2020-08-06 17:44:17'),(5,3,1,'ninkname','010-4657-1346','birth','2020-08-06 17:49:56'),(7,4,1,'Nickname','010-4653-1149','birthday','2020-08-07 10:26:46'),(19,19,1,'문단비','010-2614-3391','2000-01-01','2020-08-07 16:50:04'),(20,20,1,'닉네임','010-1234-1234','2013-1-1','2020-08-07 16:59:34'),(21,21,1,'테스트닉네임','010-1234-1234','2013-1-1','2020-08-07 17:03:32'),(22,22,1,'닉네임테스트2','010-1234-1234','2013-1-1','2020-08-07 17:05:52'),(23,23,1,'Aaa123','010-0101-2323','2003-9-28','2020-08-07 17:12:58'),(24,24,1,'안녕','010-1235-3479','2013-6-1','2020-08-07 17:30:50');
/*!40000 ALTER TABLE `User` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-08-12 18:09:32
