CREATE DATABASE  IF NOT EXISTS `db_107403023` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `db_107403023`;
-- MySQL dump 10.13  Distrib 8.0.16, for Win64 (x86_64)
--
-- Host: 192.168.56.102    Database: db_107403023
-- ------------------------------------------------------
-- Server version	5.7.30-0ubuntu0.18.04.1

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
-- Table structure for table `tbl_Seat`
--

DROP TABLE IF EXISTS `tbl_Seat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_Seat` (
  `idtbl_Seat` varchar(10) NOT NULL,
  PRIMARY KEY (`idtbl_Seat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_Seat`
--

LOCK TABLES `tbl_Seat` WRITE;
/*!40000 ALTER TABLE `tbl_Seat` DISABLE KEYS */;
INSERT INTO `tbl_Seat` VALUES ('10A'),('10B'),('10C'),('10D'),('1A'),('1B'),('1C'),('1D'),('2A'),('2B'),('2C'),('2D'),('3A'),('3B'),('3C'),('3D'),('4A'),('4B'),('4C'),('4D'),('5A'),('5B'),('5C'),('5D'),('6A'),('6B'),('6C'),('6D'),('7A'),('7B'),('7C'),('7D'),('8A'),('8B'),('8C'),('8D'),('9A'),('9B'),('9C'),('9D');
/*!40000 ALTER TABLE `tbl_Seat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_Station`
--

DROP TABLE IF EXISTS `tbl_Station`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_Station` (
  `idtbl_Station` int(11) NOT NULL AUTO_INCREMENT,
  `Station_name` varchar(10) NOT NULL,
  `Location_marker` int(11) NOT NULL,
  `Time_marker` int(11) NOT NULL,
  PRIMARY KEY (`idtbl_Station`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_Station`
--

LOCK TABLES `tbl_Station` WRITE;
/*!40000 ALTER TABLE `tbl_Station` DISABLE KEYS */;
INSERT INTO `tbl_Station` VALUES (1,'台北',1,0),(2,'桃園',3,20),(3,'新竹',4,30),(4,'台中',8,60),(5,'高雄',15,120);
/*!40000 ALTER TABLE `tbl_Station` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_Ticket`
--

DROP TABLE IF EXISTS `tbl_Ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_Ticket` (
  `idtbl_Ticket` int(11) NOT NULL AUTO_INCREMENT,
  `User_ID` int(11) NOT NULL,
  `Train_date` date NOT NULL,
  `Train_ID` int(11) NOT NULL,
  `Departure_station` int(11) NOT NULL,
  `Arrival_station` int(11) NOT NULL,
  `Seat_ID` varchar(10) NOT NULL,
  `Price` int(11) NOT NULL,
  `Book_time` datetime NOT NULL,
  `Pay_time` datetime DEFAULT NULL,
  `isDelete` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idtbl_Ticket`,`User_ID`,`Train_ID`,`Seat_ID`),
  KEY `ticket_train_id_fk_idx` (`Train_ID`),
  KEY `ticket_seat_id_fk_idx` (`Seat_ID`),
  KEY `ticket_user_id_fk_idx` (`User_ID`),
  CONSTRAINT `ticket_seat_id_fk` FOREIGN KEY (`Seat_ID`) REFERENCES `tbl_Seat` (`idtbl_Seat`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `ticket_train_id_fk` FOREIGN KEY (`Train_ID`) REFERENCES `tbl_Train` (`idtbl_Train`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `ticket_user_id_fk` FOREIGN KEY (`User_ID`) REFERENCES `tbl_User` (`idtbl_User`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_Ticket`
--

LOCK TABLES `tbl_Ticket` WRITE;
/*!40000 ALTER TABLE `tbl_Ticket` DISABLE KEYS */;
INSERT INTO `tbl_Ticket` VALUES (1,1,'2020-06-10',1,1,2,'1D',200,'2020-06-10 07:00:00','2020-06-10 07:15:00',0),(2,1,'2020-06-10',1,2,5,'3B',1200,'2020-06-10 07:00:00','2020-06-10 07:15:00',0),(3,2,'2020-06-10',2,2,5,'2A',1200,'2020-06-10 07:00:00','2020-06-10 07:15:00',0),(4,2,'2020-06-12',2,3,4,'2A',400,'2020-06-11 17:30:00','2020-06-11 17:35:00',0),(5,3,'2020-06-13',3,1,5,'3D',1400,'2020-06-12 20:30:00','2020-06-13 07:35:00',0),(6,4,'2020-06-13',3,2,3,'4B',100,'2020-06-12 14:30:00','2020-06-12 17:35:00',0),(7,5,'2020-06-15',4,5,2,'1A',1200,'2020-06-15 10:22:00',NULL,0),(8,6,'2020-06-15',4,5,1,'2A',1400,'2020-06-11 17:30:00','2020-06-11 17:35:00',0),(9,7,'2020-06-16',5,4,2,'5A',500,'2020-06-12 10:31:00',NULL,1),(10,7,'2020-06-16',5,4,2,'5B',500,'2020-06-11 10:31:00',NULL,0),(11,7,'2020-06-16',5,4,2,'5C',500,'2020-06-11 10:31:00','2020-06-11 11:35:00',0),(12,8,'2020-06-16',6,3,2,'6C',500,'2020-06-16 10:30:00','2020-06-16 10:36:00',0),(15,2,'2012-12-12',6,3,5,'5D',1100,'2020-06-26 17:01:18',NULL,0),(16,2,'1984-12-31',4,2,4,'9A',500,'2020-06-26 17:21:25',NULL,0),(17,2,'1999-10-10',2,2,3,'4A',100,'2020-06-26 17:34:43',NULL,0),(18,3,'1999-11-11',1,2,4,'7D',500,'2020-06-26 17:36:22',NULL,0),(19,1,'1999-11-13',3,1,3,'8B',300,'2020-06-26 18:09:08',NULL,0),(20,1,'2020-06-27',1,1,3,'9A',300,'2020-06-26 19:02:03','2020-06-26 20:32:25',0);
/*!40000 ALTER TABLE `tbl_Ticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_Train`
--

DROP TABLE IF EXISTS `tbl_Train`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_Train` (
  `idtbl_Train` int(11) NOT NULL,
  `Off_date` date DEFAULT NULL,
  `On_date` date DEFAULT NULL,
  PRIMARY KEY (`idtbl_Train`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_Train`
--

LOCK TABLES `tbl_Train` WRITE;
/*!40000 ALTER TABLE `tbl_Train` DISABLE KEYS */;
INSERT INTO `tbl_Train` VALUES (1,'2020-06-17','2020-01-01'),(2,NULL,'2020-01-01'),(3,NULL,'2020-02-01'),(4,NULL,'2020-02-01'),(5,NULL,'2020-02-01'),(6,NULL,'2020-01-01');
/*!40000 ALTER TABLE `tbl_Train` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_Train_with_Station`
--

DROP TABLE IF EXISTS `tbl_Train_with_Station`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_Train_with_Station` (
  `Train_ID` int(11) NOT NULL,
  `Station_ID` int(11) NOT NULL,
  `Arrival_time` time DEFAULT NULL,
  `Departure_time` time DEFAULT NULL,
  PRIMARY KEY (`Train_ID`,`Station_ID`),
  KEY `fk_tbl_Train_has_tbl_Station_tbl_Station1_idx` (`Station_ID`),
  KEY `fk_tbl_Train_has_tbl_Station_tbl_Train1_idx` (`Train_ID`),
  CONSTRAINT `fk_tbl_Train_has_tbl_Station_tbl_Station1` FOREIGN KEY (`Station_ID`) REFERENCES `tbl_Station` (`idtbl_Station`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_Train_has_tbl_Station_tbl_Train1` FOREIGN KEY (`Train_ID`) REFERENCES `tbl_Train` (`idtbl_Train`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_Train_with_Station`
--

LOCK TABLES `tbl_Train_with_Station` WRITE;
/*!40000 ALTER TABLE `tbl_Train_with_Station` DISABLE KEYS */;
INSERT INTO `tbl_Train_with_Station` VALUES (1,1,NULL,'07:00:00'),(1,2,'07:20:00','07:22:00'),(1,3,'07:32:00','07:34:00'),(1,4,'08:04:00','08:06:00'),(1,5,'09:06:00',NULL),(2,1,NULL,'10:00:00'),(2,2,'10:20:00','10:22:00'),(2,3,'10:32:00','10:34:00'),(2,4,'11:04:00',NULL),(3,1,NULL,'13:00:00'),(3,2,'13:20:00','13:22:00'),(3,3,'13:32:00','13:34:00'),(3,4,'14:04:00','14:06:00'),(3,5,'15:06:00',NULL),(4,1,'10:06:00',NULL),(4,2,'09:44:00','09:46:00'),(4,3,'09:32:00','09:34:00'),(4,4,'09:00:00','09:02:00'),(4,5,NULL,'08:00:00'),(5,1,'13:04:00',NULL),(5,2,'12:42:00','12:44:00'),(5,3,'12:30:00','12:32:00'),(5,4,NULL,'12:00:00'),(6,1,'19:06:00',NULL),(6,2,'18:44:00','18:46:00'),(6,3,'18:32:00','18:34:00'),(6,4,'18:00:00','18:02:00'),(6,5,NULL,'17:00:00');
/*!40000 ALTER TABLE `tbl_Train_with_Station` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_User`
--

DROP TABLE IF EXISTS `tbl_User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_User` (
  `idtbl_User` int(10) NOT NULL AUTO_INCREMENT,
  `Email` varchar(255) NOT NULL,
  `First_name` varchar(100) NOT NULL,
  `Last_name` varchar(100) NOT NULL,
  `Salt` char(64) NOT NULL,
  `Date_of_birth` date NOT NULL,
  `Registered_datetime` date NOT NULL,
  `isDelete` int(11) DEFAULT '0',
  PRIMARY KEY (`idtbl_User`),
  UNIQUE KEY `Email_UNIQUE` (`Email`),
  UNIQUE KEY `Salt_UNIQUE` (`Salt`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_User`
--

LOCK TABLES `tbl_User` WRITE;
/*!40000 ALTER TABLE `tbl_User` DISABLE KEYS */;
INSERT INTO `tbl_User` VALUES (1,'Steve','Rogers','Marvel_Steve@gmail.com','63652315D22919A8EC76F58F982EC08A6244474F8082B8E75A1271B3C63948E9','1918-07-04','2019-06-06',0),(2,'Tony','Stark','Marvel_Tony@gmail.com','AA52032EAB8CC92F7B77CCE828940F95C2369F18DDF1C6B3A80A8A6195D137FB','1970-05-29','2019-06-07',0),(3,'Thor','God','Marvel_Thor@gmail.com','3C567E0EA40F26755BB221C96AB02CC726DE673E85016EC1D949D14E5B16B223','1911-01-01','2019-06-08',0),(4,'Peter','Parker','Marvel_Peter@gmail.com','95B79B147E492681F98C749E3AC329C1A975D3F4000FF25D0643D8D55A4E4E2B','2000-08-10','2019-06-09',0),(5,'David','Banner','Marvel_David @gmail.com','EB7F11AE33003238D3FF14094E3BC569F077B8F39DF472423FD339CE22B5F050','1980-11-22','2019-06-10',0),(6,'Natasha','Romanoff','Marvel_Natasha@gmail.com','5F79D14FB8A43CA9350E781EA1067B14B197D36671182C4C15E9EDBD921791DD','1984-11-22','2019-06-11',0),(7,'Wanda','Maximoff','Marvel_Wanda@gmail.com','9C681B6D73E80D3C1F10E06BDEB48914ABE207ADA83405DC14485B6AD060C021','1980-08-02','2019-06-12',0),(8,'Carol','Danvers','Marvel_Carol@gmail.com','6C40F0CC5D46DCE7D1A0E1D118E0750A7874087FC7199DDA34D171131002DCA9','1980-08-01','2019-06-13',0),(9,'Stephen','Strange','Marvel_Stephen@gmail.com','039FB5567A6B559BE9999BF854BEF1699A14CB912AF431CCF90D9941900D8788','1930-07-01','2019-06-14',0),(10,'Clint','Barton','Marvel_Clint@gmail.com','ABC1523C0333408EFF2B8CCF4248A0B2175723EBC65C8D05940B9D434B7A39A2','1971-01-07','2019-06-15',0),(12,'asdasdf','fdsafads','afdsafds','rweasdfx','2000-01-01','2020-06-25',1),(13,'32132@gmail','123','654','ewt','2000-12-12','2020-06-25',0),(14,'123','fdsafdsa','fdsafdsa','fdsafdsa','2000-01-12','2020-06-25',0);
/*!40000 ALTER TABLE `tbl_User` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_UserCredential`
--

DROP TABLE IF EXISTS `tbl_UserCredential`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_UserCredential` (
  `idtbl_UserCredential` int(11) NOT NULL AUTO_INCREMENT,
  `Hashed_Pwd` char(255) NOT NULL,
  `Create_datetime` datetime NOT NULL,
  PRIMARY KEY (`idtbl_UserCredential`),
  UNIQUE KEY `Hashed_Pwd_UNIQUE` (`Hashed_Pwd`),
  CONSTRAINT `userCredential_user_id_fk` FOREIGN KEY (`idtbl_UserCredential`) REFERENCES `tbl_User` (`idtbl_User`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_UserCredential`
--

LOCK TABLES `tbl_UserCredential` WRITE;
/*!40000 ALTER TABLE `tbl_UserCredential` DISABLE KEYS */;
INSERT INTO `tbl_UserCredential` VALUES (1,'pfNFnTx50OjhU','2019-06-06 00:00:00'),(2,'brpgOmotwsnkA','2019-06-07 00:00:00'),(3,'brCHXrfmx/hRs','2019-06-08 00:00:00'),(4,'broklWTNGanYM','2019-06-09 00:00:00'),(5,'brrQ/CUvMgDMI','2019-06-10 00:00:00'),(6,'brCAXrfmx/hRs','2019-06-11 00:00:00'),(7,'bretXExZ676DI','2019-06-12 00:00:00'),(8,'brhAsn.S9pHfM','2019-06-13 00:00:00'),(9,'brv2uIUQT8QN2','2019-06-14 00:00:00'),(10,'brtnGNHRCIzXY','2019-06-15 00:00:00'),(12,'rewsadfxzc','2020-06-25 00:00:00'),(13,'twt','2020-06-25 00:00:00'),(14,'123','2020-06-25 00:00:00');
/*!40000 ALTER TABLE `tbl_UserCredential` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'db_107403023'
--
/*!50003 DROP PROCEDURE IF EXISTS `sp_BookTicket` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`107403023`@`192.168.56.1` PROCEDURE `sp_BookTicket`(
	IN in_userid int(10),
    IN in_trainid int(11),
    IN in_dep_station int,
    IN in_arr_station int,
    IN in_train_date date,
    OUT out_num_row int(100)
)
sp_BookTicket : BEGIN
#算price的參數
DECLARE dep_location int;
DECLARE arr_location int;
DECLARE price int;

#存入seat的參數
DECLARE seat varchar(10);

#算價錢,存入price參數
SET dep_location = (SELECT Location_marker FROM tbl_Station WHERE idtbl_Station = in_dep_station);
SET arr_location = (SELECT Location_marker FROM tbl_Station WHERE idtbl_Station = in_arr_station);
SET price = ABS(dep_location - arr_location ) * 100 ;

#一個train id的一個座位只能賣一次，所以不能有兩欄相同的trainID和相同的seatID出現在ticket table上

SET seat = ( 
	SELECT * FROM tbl_Seat 
	WHERE idtbl_Seat 
	NOT IN (SELECT Seat_ID FROM tbl_Ticket WHERE Train_ID = in_trainid)  
    ORDER BY RAND() 
    LIMIT 1 
);

#將輸入的值insert進ticket table
INSERT INTO tbl_Ticket(
	User_ID, 
    Train_date, 
    Train_ID, 
    Departure_Station, 
    Arrival_Station, 
    Seat_ID,
    Price, 
    Book_time, 
    Pay_time
    )
VALUES(
	in_userid,
    in_train_date,
    in_trainid,
    in_dep_station,
    in_arr_station,
    seat,
	price,
    NOW(),
    NULL
);

SET out_num_row = (SELECT COUNT(*) FROM tbl_Ticket
WHERE
	User_ID = in_userid AND
    Train_ID = in_trainid AND
    Departure_Station = in_dep_station AND
    Arrival_Station = in_arr_station AND
    Train_date = in_train_date AND
    Seat_ID = seat
    );

#select result set
SELECT DISTINCT
	idtbl_Ticket AS ticket_id,
    User_ID AS user_id,
    Train_ID AS train_id,
    Departure_Station AS departure_station,
    Arrival_Station AS arrival_station,
	Seat_ID AS seat_id,
    Book_time AS book_time,
    Train_date AS train_date
FROM 
	tbl_Ticket
WHERE
	User_ID = in_userid AND
    Train_ID = in_trainid AND
    Departure_Station = in_dep_station AND
    Arrival_Station = in_arr_station AND
    Train_date = in_train_date AND
    Seat_ID = seat;

LEAVE sp_BookTicket;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_CreateNewPassword` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`107403023`@`192.168.56.1` PROCEDURE `sp_CreateNewPassword`(
	IN in_userID int(10),
    IN in_salt char(64),
	IN in_hashedPwd char(255),
    OUT out_affected_row_num int(100)
)
sp_CreateNewPassword : BEGIN
    # 輸入userID、新salt、新hashedPwd
    # 改user table的salt 和credential table的hashPwd
    
    UPDATE tbl_User
		SET Salt = in_salt
        WHERE idtbl_User = in_userID;
    
    UPDATE tbl_UserCredential
		SET Hashed_Pwd = in_hashedPwd 
        WHERE idtbl_UserCredential = in_userID;
        
	SET out_affected_row_num = (
		SELECT idtbl_UserCredential 
        FROM tbl_UserCredential 
        WHERE idtbl_UserCredential = in_userID
	);
    
LEAVE sp_CreateNewPassword;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_DeleteUserByUserID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`107403023`@`192.168.56.1` PROCEDURE `sp_DeleteUserByUserID`(
	IN in_userID int(11),
    OUT affected_row_num int(100)
)
sp_DeleteUserByUserID : BEGIN
 -- SET id = ( SELECT User_ID FROM tbl_Ticket WHERE User_ID = in_userID); # id = 你輸入的id，如果有id有值代表他有買票，不能刪除
 -- SET isDelete = (SELECT isDelete FROM tbl_User WHERE idtbl_User = in_userID);  # isDelete = 你輸入id那欄的isDelete

# 如果if條件為true，就不能刪除
IF EXISTS( SELECT User_Id FROM tbl_Ticket WHERE User_ID = in_userID) THEN
	LEAVE sp_DeleteUserByUserID;

# 將輸入id那欄的isDelete 改為1
ELSE
	UPDATE tbl_User
	SET isDelete = 1
	WHERE idtbl_User = in_userID;
    
	SET affected_row_num = row_count();
END IF;

LEAVE sp_DeleteUserByUserID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_Delete_bookticket` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`107403023`@`192.168.56.1` PROCEDURE `sp_Delete_bookticket`(
	IN in_userid int(10),
    IN in_ticket_id int(11),
    OUT out_affected_row_num int(100)
)
sp_Delete_bookticket : BEGIN
 # 會動到ticket table，要判斷pay time是否有值，有值就無法刪除
 # 成功刪除 -> SET isDelect = 1
 
 # 達到刪除條件：輸入的userID,ticketID都符合，且還沒被刪除過(isDelect = 0)
IF ( SELECT Pay_time FROM tbl_Ticket WHERE idtbl_Ticket = in_ticket_id AND User_ID = in_userid AND isDelete = 0 ) IS NULL
THEN
	UPDATE tbl_Ticket
    SET tbl_Ticket.isDelete = 1
    WHERE idtbl_Ticket = in_ticket_id 
    AND User_ID = in_userid;
    
    # 一次只能刪除一欄
	SET out_affected_row_num = 1;

ELSE 
	SET out_affected_row_num = 0;
    LEAVE sp_Delete_bookticket;
END IF;
 
LEAVE sp_Delete_bookticket;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_GetBookTicketByUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`107403023`@`192.168.56.1` PROCEDURE `sp_GetBookTicketByUser`(
	IN in_userid int(10),
    OUT out_num_row int(100)
)
sp_GetBookTicketByUser : BEGIN
#透過 sp_GetBookTicket(會員 ID),可以獲得其使用者還未付款的訂票紀錄(要去判斷pay_time是否為空)。
SET out_num_row = (SELECT COUNT(*) FROM tbl_Ticket WHERE Pay_time IS NULL AND User_ID = in_userid) ;

SELECT idtbl_Ticket AS ticket_id,
	   User_ID AS userID,
	   Train_ID AS train_id,
	   Seat_ID AS seat_id,
	   Book_time AS book_time
	FROM tbl_Ticket
	WHERE Pay_time IS NULL 
	AND User_ID = in_userid;

LEAVE sp_GetBookTicketByUser;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_Getstation` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`107403023`@`192.168.56.1` PROCEDURE `sp_Getstation`(
	out out_row_num int
)
sp_Getstation : BEGIN

	SELECT  idtbl_Station AS station_id, 
			Station_name AS station_name
	FROM tbl_Station; #result set
    
    SELECT COUNT(idtbl_Station) INTO out_row_num 
    FROM tbl_Station; #output
    
LEAVE sp_Getstation;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_PayTicket` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`107403023`@`192.168.56.1` PROCEDURE `sp_PayTicket`(
	IN in_userid int(10),
    IN in_ticketid int(11),
    OUT out_affected_row_num int(100)
)
sp_PayTicket : BEGIN

DECLARE bkDatetime DATETIME;
DECLARE bkDate DATE;

#原本的book_time是datetime形式，分別改成date,time比較好運算
SET bkDatetime = (SELECT Book_time FROM tbl_Ticket WHERE idtbl_Ticket = in_ticketid);
SET bkDate = DATE(bkDatetime);

#判斷bkTime是否在發車3天內，且不得在發車前30分鐘之後付款
# dep_time的30分鐘前 && train_date的三天內才可以付款

# 判斷商業邏輯，第一個是3天內，第二個是30分鐘前(好長= =)
IF ( DATE_ADD(bkDate,INTERVAL 3 DAY) >= (SELECT Train_date FROM tbl_Ticket WHERE idtbl_Ticket = in_ticketid) AND
	DATE_ADD(bkDatetime, INTERVAL 30 MINUTE) <= concat( (SELECT Train_date FROM tbl_Ticket WHERE idtbl_Ticket = in_ticketid), ' ',(
		SELECT Departure_time FROM tbl_Train_with_Station 
		WHERE Train_ID = (SELECT Train_ID FROM tbl_Ticket WHERE idtbl_Ticket = in_ticketid) AND
		Station_ID = (SELECT Departure_station FROM tbl_Ticket WHERE idtbl_Ticket = in_ticketid) ) )
) 
THEN
	#update pay_time
	UPDATE tbl_Ticket
    SET Pay_time = current_timestamp()
    WHERE idtbl_Ticket = in_ticketid;
    
    SET out_affected_row_num =  row_count();
    
    #select result set
	SELECT 
		tbl_Ticket.idtbl_Ticket AS ticket_id,
		tbl_Ticket.User_ID AS user_id,
		tbl_Ticket.Train_ID AS train_id,
		tbl_Ticket.Departure_Station AS departure_station,
		tbl_Ticket.Arrival_Station AS arrival_station,
		tbl_Ticket.Seat_ID AS seat_id,
		tbl_Ticket.Book_time AS book_time,
		tbl_Train_with_Station.Departure_time AS departure_time,
		tbl_Train_with_Station.Arrival_time AS arrival_time,
		tbl_Ticket.Price AS price,
		tbl_Ticket.Pay_time AS pay_time
	FROM 
		tbl_Ticket INNER JOIN tbl_Train_with_Station
	ON 
		tbl_Ticket.Train_ID = tbl_Train_with_Station.Train_ID
	WHERE
		tbl_Ticket.User_ID = in_userid AND
		tbl_Ticket.idtbl_Ticket = in_ticketid AND         -- ticket, user ID要等於輸入的
		tbl_Ticket.Departure_Station = (                  -- dep_station 等於票上面的
				SELECT Departure_Station 
				FROM tbl_Ticket 
				WHERE idtbl_Ticket = in_ticketid 
				AND User_ID = in_userid  ) AND
		tbl_Train_with_Station.Departure_time = (         -- dep_time跟票上一樣的 我用station跟train id 判斷
				SELECT Departure_time 
				FROM tbl_Train_with_Station 
				WHERE 
					Station_ID = tbl_Ticket.Departure_Station  AND
					Train_ID = (SELECT Train_ID FROM tbl_Ticket WHERE idtbl_Ticket = in_ticketid AND User_ID = in_userid)
				);
ELSE #失敗
	LEAVE sp_PayTicket;
END IF;


LEAVE sp_PayTicket;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_QueryTicket` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`107403023`@`192.168.56.1` PROCEDURE `sp_QueryTicket`(
	IN in_departure_time time,
    IN in_departure_station int,
    IN in_arrival_station int,
    OUT out_num_row int
)
sp_QueryTicket : BEGIN

#算price的參數
DECLARE dep_location int;
DECLARE arr_location int;
DECLARE price int;

#算價錢,存入price參數
SET dep_location = (SELECT Location_marker FROM tbl_Station WHERE idtbl_Station = in_departure_station);
SET arr_location = (SELECT Location_marker FROM tbl_Station WHERE idtbl_Station = in_arrival_station);
SET price = ABS(dep_location - arr_location ) * 100 ;

#建立一個temp table 等等比較好select result set
DROP TABLE IF EXISTS `tbl_temp`;

CREATE TEMPORARY TABLE `tbl_temp`(
    `dep_station` INT NOT NULL,
    `arr_station` INT NOT NULL,
    `price` INT
);
#把東西insert進去
INSERT INTO tbl_temp
VALUES(
	in_departure_station,
    in_arrival_station,
    price
);

SELECT DISTINCT
	tbl_Train_with_Station.Train_ID AS train_id, 
	tbl_temp.dep_station AS departure_station,
    tbl_temp.arr_station AS arrival_station,
    tbl_Train_with_Station.Departure_time AS departure_time,
    tbl_Train_with_Station.Arrival_time AS arrival_time,
    tbl_temp.price
FROM 
	tbl_Train_with_Station, tbl_temp, tbl_Ticket
WHERE
	tbl_Train_with_Station.Departure_time >= in_departure_time AND
    tbl_temp.arr_station = in_arrival_station AND
	tbl_Ticket.Arrival_station = in_arrival_station AND
-- 	Departure_time < Arrival_time AND  這行有問題
    tbl_temp.dep_station = in_departure_station AND
	tbl_Train_with_Station.Station_ID = in_departure_station ;

SET out_num_row = found_rows();

LEAVE sp_QueryTicket;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_RegisterUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`107403023`@`192.168.56.1` PROCEDURE `sp_RegisterUser`(
	IN in_email varchar(255),
    IN in_firstname varchar(100),
    IN in_lastname varchar(100),
	IN in_salt char(64),
    IN in_Dob date,
    IN in_hashedPwd char(255),
	OUT out_row_num int(100)
)
sp_RegisterUser : BEGIN
	IF EXISTS (SELECT in_email FROM tbl_User where Email = in_email) THEN
		SET out_row_num = ROW_COUNT(); #確認email是否重複
    
    ELSE
		INSERT INTO tbl_User (Email, First_name, Last_name, Salt, Date_of_birth, Registered_datetime, isDelete)
		VALUES (
			in_email, 
            in_firstname, 
            in_lastname, 
            in_salt, 
            in_Dob, 
            CURDATE(), 
            0
		);
        
		SET @last_id_in_tblUser = LAST_INSERT_ID();
        
		INSERT INTO tbl_UserCredential
		VALUES (
			@last_id_in_tblUser,
			in_hashedPwd,
			CURDATE()
		);
        
        SET out_row_num = (SELECT idtbl_User FROM tbl_User WHERE idtbl_User = @last_id_in_tblUser);
	END IF;
LEAVE sp_RegisterUser;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_UserLogin` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`107403023`@`192.168.56.1` PROCEDURE `sp_UserLogin`(
	IN in_email varchar(255),
    IN in_hashedPwd char(255),
    OUT out_row_num int(100)
)
sp_UserLogin : BEGIN
#輸入email,pwd後，檢查user table 中的email存在否 & 檢查userCredential table中的pwd是否正確

DECLARE id int;
set id = 0; #初始值

IF EXISTS ( SELECT Email FROM tbl_User WHERE Email = in_email )  # 檢查email是否存在 
THEN
	SET id = (SELECT idtbl_User FROM tbl_User WHERE Email = in_email); # SELCET你輸入的email 那欄的userid 存入 id
	IF (in_hashedPwd = (SELECT Hashed_Pwd FROM tbl_UserCredential WHERE idtbl_UserCredential = id) ) #如果輸入的密碼 = 該id的正確hashedPwd 就可以設output值
    THEN
		SET out_row_num = id;
	END IF;
    
ELSE # email不存在
	LEAVE sp_UserLogin;
END IF;


LEAVE sp_UserLogin;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-06-26 21:26:02
