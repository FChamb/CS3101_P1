/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19  Distrib 10.5.27-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: fc84_P1BritishRails
-- ------------------------------------------------------
-- Server version	10.5.27-MariaDB

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
-- Table structure for table `Carriage`
--

DROP TABLE IF EXISTS `Carriage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Carriage` (
  `CarriageID` int(11) NOT NULL AUTO_INCREMENT,
  `TrainID` int(11) NOT NULL,
  `Seats` int(11) NOT NULL,
  PRIMARY KEY (`CarriageID`),
  KEY `TrainID` (`TrainID`),
  CONSTRAINT `Carriage_ibfk_1` FOREIGN KEY (`TrainID`) REFERENCES `Train` (`TrainID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Carriage`
--

LOCK TABLES `Carriage` WRITE;
/*!40000 ALTER TABLE `Carriage` DISABLE KEYS */;
/*!40000 ALTER TABLE `Carriage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CarriageFeature`
--

DROP TABLE IF EXISTS `CarriageFeature`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CarriageFeature` (
  `CarriageID` int(11) NOT NULL,
  `FeatureID` int(11) NOT NULL,
  PRIMARY KEY (`CarriageID`,`FeatureID`),
  KEY `FeatureID` (`FeatureID`),
  CONSTRAINT `CarriageFeature_ibfk_1` FOREIGN KEY (`CarriageID`) REFERENCES `Carriage` (`CarriageID`),
  CONSTRAINT `CarriageFeature_ibfk_2` FOREIGN KEY (`FeatureID`) REFERENCES `Feature` (`FeatureID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CarriageFeature`
--

LOCK TABLES `CarriageFeature` WRITE;
/*!40000 ALTER TABLE `CarriageFeature` DISABLE KEYS */;
/*!40000 ALTER TABLE `CarriageFeature` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Destination`
--

DROP TABLE IF EXISTS `Destination`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Destination` (
  `DestinationID` int(11) NOT NULL,
  `ArrivalTime` time NOT NULL,
  PRIMARY KEY (`DestinationID`),
  CONSTRAINT `Destination_ibfk_1` FOREIGN KEY (`DestinationID`) REFERENCES `Location` (`LocationID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Destination`
--

LOCK TABLES `Destination` WRITE;
/*!40000 ALTER TABLE `Destination` DISABLE KEYS */;
/*!40000 ALTER TABLE `Destination` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Feature`
--

DROP TABLE IF EXISTS `Feature`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Feature` (
  `FeatureID` int(11) NOT NULL AUTO_INCREMENT,
  `FeatureName` varchar(50) NOT NULL,
  `Description` text DEFAULT NULL,
  PRIMARY KEY (`FeatureID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Feature`
--

LOCK TABLES `Feature` WRITE;
/*!40000 ALTER TABLE `Feature` DISABLE KEYS */;
/*!40000 ALTER TABLE `Feature` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Location`
--

DROP TABLE IF EXISTS `Location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Location` (
  `LocationID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL,
  PRIMARY KEY (`LocationID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Location`
--

LOCK TABLES `Location` WRITE;
/*!40000 ALTER TABLE `Location` DISABLE KEYS */;
/*!40000 ALTER TABLE `Location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Locomotive`
--

DROP TABLE IF EXISTS `Locomotive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Locomotive` (
  `LocomotiveID` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`LocomotiveID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Locomotive`
--

LOCK TABLES `Locomotive` WRITE;
/*!40000 ALTER TABLE `Locomotive` DISABLE KEYS */;
/*!40000 ALTER TABLE `Locomotive` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Origin`
--

DROP TABLE IF EXISTS `Origin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Origin` (
  `OriginID` int(11) NOT NULL,
  `DepartureTime` time NOT NULL,
  PRIMARY KEY (`OriginID`),
  CONSTRAINT `Origin_ibfk_1` FOREIGN KEY (`OriginID`) REFERENCES `Location` (`LocationID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Origin`
--

LOCK TABLES `Origin` WRITE;
/*!40000 ALTER TABLE `Origin` DISABLE KEYS */;
/*!40000 ALTER TABLE `Origin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Pass`
--

DROP TABLE IF EXISTS `Pass`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Pass` (
  `PassID` int(11) NOT NULL AUTO_INCREMENT,
  `ServiceID` int(11) NOT NULL,
  `LocationID` int(11) NOT NULL,
  `DepartureTime` time NOT NULL,
  PRIMARY KEY (`PassID`),
  KEY `ServiceID` (`ServiceID`),
  KEY `LocationID` (`LocationID`),
  CONSTRAINT `Pass_ibfk_1` FOREIGN KEY (`ServiceID`) REFERENCES `Service` (`ServiceID`),
  CONSTRAINT `Pass_ibfk_2` FOREIGN KEY (`LocationID`) REFERENCES `Location` (`LocationID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Pass`
--

LOCK TABLES `Pass` WRITE;
/*!40000 ALTER TABLE `Pass` DISABLE KEYS */;
/*!40000 ALTER TABLE `Pass` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Schedule`
--

DROP TABLE IF EXISTS `Schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Schedule` (
  `ScheduleID` int(11) NOT NULL AUTO_INCREMENT,
  `ServiceID` int(11) NOT NULL,
  `LocationID` int(11) NOT NULL,
  PRIMARY KEY (`ScheduleID`),
  KEY `ServiceID` (`ServiceID`),
  KEY `LocationID` (`LocationID`),
  CONSTRAINT `Schedule_ibfk_1` FOREIGN KEY (`ServiceID`) REFERENCES `Service` (`ServiceID`),
  CONSTRAINT `Schedule_ibfk_2` FOREIGN KEY (`LocationID`) REFERENCES `Location` (`LocationID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Schedule`
--

LOCK TABLES `Schedule` WRITE;
/*!40000 ALTER TABLE `Schedule` DISABLE KEYS */;
/*!40000 ALTER TABLE `Schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Service`
--

DROP TABLE IF EXISTS `Service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Service` (
  `ServiceID` int(11) NOT NULL AUTO_INCREMENT,
  `HeadCode` varchar(10) NOT NULL,
  `StartDate` date NOT NULL,
  `EndDate` date NOT NULL,
  `DaysOfWeek` varchar(20) NOT NULL,
  `OriginID` int(11) NOT NULL,
  `DestinationID` int(11) NOT NULL,
  PRIMARY KEY (`ServiceID`),
  KEY `OriginID` (`OriginID`),
  KEY `DestinationID` (`DestinationID`),
  CONSTRAINT `Service_ibfk_1` FOREIGN KEY (`OriginID`) REFERENCES `Location` (`LocationID`),
  CONSTRAINT `Service_ibfk_2` FOREIGN KEY (`DestinationID`) REFERENCES `Location` (`LocationID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Service`
--

LOCK TABLES `Service` WRITE;
/*!40000 ALTER TABLE `Service` DISABLE KEYS */;
/*!40000 ALTER TABLE `Service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ServiceStop`
--

DROP TABLE IF EXISTS `ServiceStop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ServiceStop` (
  `StopID` int(11) NOT NULL AUTO_INCREMENT,
  `ServiceID` int(11) NOT NULL,
  `LocationID` int(11) NOT NULL,
  `OrderNumber` int(11) NOT NULL,
  `Platform` varchar(10) DEFAULT NULL,
  `ArrivalTime` time DEFAULT NULL,
  `DepartureTime` time DEFAULT NULL,
  PRIMARY KEY (`StopID`),
  KEY `ServiceID` (`ServiceID`),
  KEY `LocationID` (`LocationID`),
  CONSTRAINT `ServiceStop_ibfk_1` FOREIGN KEY (`ServiceID`) REFERENCES `Service` (`ServiceID`),
  CONSTRAINT `ServiceStop_ibfk_2` FOREIGN KEY (`LocationID`) REFERENCES `Location` (`LocationID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ServiceStop`
--

LOCK TABLES `ServiceStop` WRITE;
/*!40000 ALTER TABLE `ServiceStop` DISABLE KEYS */;
/*!40000 ALTER TABLE `ServiceStop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Station`
--

DROP TABLE IF EXISTS `Station`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Station` (
  `Code` char(3) NOT NULL,
  `Name` varchar(100) NOT NULL,
  PRIMARY KEY (`Code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Station`
--

LOCK TABLES `Station` WRITE;
/*!40000 ALTER TABLE `Station` DISABLE KEYS */;
/*!40000 ALTER TABLE `Station` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Stop`
--

DROP TABLE IF EXISTS `Stop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Stop` (
  `StopID` int(11) NOT NULL,
  `ArrivalTime` time DEFAULT NULL,
  `DepartureTime` time DEFAULT NULL,
  PRIMARY KEY (`StopID`),
  CONSTRAINT `Stop_ibfk_1` FOREIGN KEY (`StopID`) REFERENCES `ServiceStop` (`StopID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Stop`
--

LOCK TABLES `Stop` WRITE;
/*!40000 ALTER TABLE `Stop` DISABLE KEYS */;
/*!40000 ALTER TABLE `Stop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Train`
--

DROP TABLE IF EXISTS `Train`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Train` (
  `TrainID` int(11) NOT NULL AUTO_INCREMENT,
  `LocomotiveID` int(11) NOT NULL,
  `LocomotiveType` varchar(50) NOT NULL,
  PRIMARY KEY (`TrainID`),
  KEY `LocomotiveID` (`LocomotiveID`),
  CONSTRAINT `Train_ibfk_1` FOREIGN KEY (`LocomotiveID`) REFERENCES `Locomotive` (`LocomotiveID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Train`
--

LOCK TABLES `Train` WRITE;
/*!40000 ALTER TABLE `Train` DISABLE KEYS */;
/*!40000 ALTER TABLE `Train` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'fc84_P1BritishRails'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-03-19 15:04:28
