-- MySQL dump 10.13  Distrib 5.7.19, for Linux (x86_64)
--
-- Host: localhost    Database: gfsg
-- ------------------------------------------------------
-- Server version	5.7.19-0ubuntu0.16.04.1

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
-- Table structure for table `CachedCalendarEntry`
--

DROP TABLE IF EXISTS `CachedCalendarEntry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CachedCalendarEntry` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('CachedCalendarEntry') CHARACTER SET utf8 DEFAULT 'CachedCalendarEntry',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `StartDate` date DEFAULT NULL,
  `StartTime` time DEFAULT NULL,
  `EndDate` date DEFAULT NULL,
  `EndTime` time DEFAULT NULL,
  `AllDay` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `Announcement` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `DateRange` mediumtext CHARACTER SET utf8,
  `TimeRange` mediumtext CHARACTER SET utf8,
  `ICSLink` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `Title` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Content` mediumtext CHARACTER SET utf8,
  `CachedCalendarID` int(11) NOT NULL DEFAULT '0',
  `CalendarID` int(11) NOT NULL DEFAULT '0',
  `EventID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `CachedCalendarID` (`CachedCalendarID`),
  KEY `CalendarID` (`CalendarID`),
  KEY `EventID` (`EventID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CachedCalendarEntry`
--

LOCK TABLES `CachedCalendarEntry` WRITE;
/*!40000 ALTER TABLE `CachedCalendarEntry` DISABLE KEYS */;
/*!40000 ALTER TABLE `CachedCalendarEntry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Calendar`
--

DROP TABLE IF EXISTS `Calendar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Calendar` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DefaultDateHeader` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `OtherDatesCount` int(11) NOT NULL DEFAULT '0',
  `RSSTitle` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `DefaultFutureMonths` int(11) NOT NULL DEFAULT '0',
  `EventsPerPage` int(11) NOT NULL DEFAULT '0',
  `DefaultView` enum('today','week','month','weekend','upcoming') CHARACTER SET utf8 DEFAULT 'upcoming',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Calendar`
--

LOCK TABLES `Calendar` WRITE;
/*!40000 ALTER TABLE `Calendar` DISABLE KEYS */;
INSERT INTO `Calendar` VALUES (7,'Upcoming Events',3,NULL,6,10,'upcoming');
/*!40000 ALTER TABLE `Calendar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CalendarAnnouncement`
--

DROP TABLE IF EXISTS `CalendarAnnouncement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CalendarAnnouncement` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Title` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Content` mediumtext CHARACTER SET utf8,
  `CalendarID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `CalendarID` (`CalendarID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CalendarAnnouncement`
--

LOCK TABLES `CalendarAnnouncement` WRITE;
/*!40000 ALTER TABLE `CalendarAnnouncement` DISABLE KEYS */;
/*!40000 ALTER TABLE `CalendarAnnouncement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CalendarDateTime`
--

DROP TABLE IF EXISTS `CalendarDateTime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CalendarDateTime` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('CalendarDateTime','CalendarAnnouncement','RegistrableDateTime') CHARACTER SET utf8 DEFAULT 'CalendarDateTime',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `StartDate` date DEFAULT NULL,
  `StartTime` time DEFAULT NULL,
  `EndDate` date DEFAULT NULL,
  `EndTime` time DEFAULT NULL,
  `AllDay` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `EventID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `EventID` (`EventID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CalendarDateTime`
--

LOCK TABLES `CalendarDateTime` WRITE;
/*!40000 ALTER TABLE `CalendarDateTime` DISABLE KEYS */;
INSERT INTO `CalendarDateTime` VALUES (1,'CalendarDateTime','2017-04-11 11:52:00','2017-04-11 11:52:00','2017-04-12',NULL,'2017-04-12',NULL,1,8);
/*!40000 ALTER TABLE `CalendarDateTime` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CalendarEvent`
--

DROP TABLE IF EXISTS `CalendarEvent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CalendarEvent` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Location` mediumtext CHARACTER SET utf8,
  `Recursion` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `CustomRecursionType` int(11) NOT NULL DEFAULT '0',
  `DailyInterval` int(11) NOT NULL DEFAULT '0',
  `WeeklyInterval` int(11) NOT NULL DEFAULT '0',
  `MonthlyInterval` int(11) NOT NULL DEFAULT '0',
  `MonthlyRecursionType1` int(11) NOT NULL DEFAULT '0',
  `MonthlyRecursionType2` int(11) NOT NULL DEFAULT '0',
  `MonthlyIndex` int(11) NOT NULL DEFAULT '0',
  `MonthlyDayOfWeek` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CalendarEvent`
--

LOCK TABLES `CalendarEvent` WRITE;
/*!40000 ALTER TABLE `CalendarEvent` DISABLE KEYS */;
INSERT INTO `CalendarEvent` VALUES (8,NULL,0,0,1,1,1,0,0,0,0),(9,NULL,0,0,0,0,0,0,0,0,0);
/*!40000 ALTER TABLE `CalendarEvent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CalendarEvent_Live`
--

DROP TABLE IF EXISTS `CalendarEvent_Live`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CalendarEvent_Live` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Location` mediumtext CHARACTER SET utf8,
  `Recursion` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `CustomRecursionType` int(11) NOT NULL DEFAULT '0',
  `DailyInterval` int(11) NOT NULL DEFAULT '0',
  `WeeklyInterval` int(11) NOT NULL DEFAULT '0',
  `MonthlyInterval` int(11) NOT NULL DEFAULT '0',
  `MonthlyRecursionType1` int(11) NOT NULL DEFAULT '0',
  `MonthlyRecursionType2` int(11) NOT NULL DEFAULT '0',
  `MonthlyIndex` int(11) NOT NULL DEFAULT '0',
  `MonthlyDayOfWeek` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CalendarEvent_Live`
--

LOCK TABLES `CalendarEvent_Live` WRITE;
/*!40000 ALTER TABLE `CalendarEvent_Live` DISABLE KEYS */;
INSERT INTO `CalendarEvent_Live` VALUES (8,NULL,0,0,1,1,1,0,0,0,0);
/*!40000 ALTER TABLE `CalendarEvent_Live` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CalendarEvent_RecurringDaysOfMonth`
--

DROP TABLE IF EXISTS `CalendarEvent_RecurringDaysOfMonth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CalendarEvent_RecurringDaysOfMonth` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CalendarEventID` int(11) NOT NULL DEFAULT '0',
  `RecurringDayOfMonthID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `CalendarEventID` (`CalendarEventID`),
  KEY `RecurringDayOfMonthID` (`RecurringDayOfMonthID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CalendarEvent_RecurringDaysOfMonth`
--

LOCK TABLES `CalendarEvent_RecurringDaysOfMonth` WRITE;
/*!40000 ALTER TABLE `CalendarEvent_RecurringDaysOfMonth` DISABLE KEYS */;
/*!40000 ALTER TABLE `CalendarEvent_RecurringDaysOfMonth` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CalendarEvent_RecurringDaysOfWeek`
--

DROP TABLE IF EXISTS `CalendarEvent_RecurringDaysOfWeek`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CalendarEvent_RecurringDaysOfWeek` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CalendarEventID` int(11) NOT NULL DEFAULT '0',
  `RecurringDayOfWeekID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `CalendarEventID` (`CalendarEventID`),
  KEY `RecurringDayOfWeekID` (`RecurringDayOfWeekID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CalendarEvent_RecurringDaysOfWeek`
--

LOCK TABLES `CalendarEvent_RecurringDaysOfWeek` WRITE;
/*!40000 ALTER TABLE `CalendarEvent_RecurringDaysOfWeek` DISABLE KEYS */;
/*!40000 ALTER TABLE `CalendarEvent_RecurringDaysOfWeek` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CalendarEvent_versions`
--

DROP TABLE IF EXISTS `CalendarEvent_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CalendarEvent_versions` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RecordID` int(11) NOT NULL DEFAULT '0',
  `Version` int(11) NOT NULL DEFAULT '0',
  `Location` mediumtext CHARACTER SET utf8,
  `Recursion` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `CustomRecursionType` int(11) NOT NULL DEFAULT '0',
  `DailyInterval` int(11) NOT NULL DEFAULT '0',
  `WeeklyInterval` int(11) NOT NULL DEFAULT '0',
  `MonthlyInterval` int(11) NOT NULL DEFAULT '0',
  `MonthlyRecursionType1` int(11) NOT NULL DEFAULT '0',
  `MonthlyRecursionType2` int(11) NOT NULL DEFAULT '0',
  `MonthlyIndex` int(11) NOT NULL DEFAULT '0',
  `MonthlyDayOfWeek` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `RecordID_Version` (`RecordID`,`Version`),
  KEY `RecordID` (`RecordID`),
  KEY `Version` (`Version`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CalendarEvent_versions`
--

LOCK TABLES `CalendarEvent_versions` WRITE;
/*!40000 ALTER TABLE `CalendarEvent_versions` DISABLE KEYS */;
INSERT INTO `CalendarEvent_versions` VALUES (1,8,1,NULL,0,0,0,0,0,0,0,0,0),(2,8,2,NULL,0,0,1,1,1,0,0,0,0),(3,9,1,NULL,0,0,0,0,0,0,0,0,0);
/*!40000 ALTER TABLE `CalendarEvent_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Calendar_Live`
--

DROP TABLE IF EXISTS `Calendar_Live`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Calendar_Live` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DefaultDateHeader` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `OtherDatesCount` int(11) NOT NULL DEFAULT '0',
  `RSSTitle` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `DefaultFutureMonths` int(11) NOT NULL DEFAULT '0',
  `EventsPerPage` int(11) NOT NULL DEFAULT '0',
  `DefaultView` enum('today','week','month','weekend','upcoming') CHARACTER SET utf8 DEFAULT 'upcoming',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Calendar_Live`
--

LOCK TABLES `Calendar_Live` WRITE;
/*!40000 ALTER TABLE `Calendar_Live` DISABLE KEYS */;
INSERT INTO `Calendar_Live` VALUES (7,'Upcoming Events',3,NULL,6,10,'upcoming');
/*!40000 ALTER TABLE `Calendar_Live` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Calendar_NestedCalendars`
--

DROP TABLE IF EXISTS `Calendar_NestedCalendars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Calendar_NestedCalendars` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CalendarID` int(11) NOT NULL DEFAULT '0',
  `ChildID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `CalendarID` (`CalendarID`),
  KEY `ChildID` (`ChildID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Calendar_NestedCalendars`
--

LOCK TABLES `Calendar_NestedCalendars` WRITE;
/*!40000 ALTER TABLE `Calendar_NestedCalendars` DISABLE KEYS */;
/*!40000 ALTER TABLE `Calendar_NestedCalendars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Calendar_versions`
--

DROP TABLE IF EXISTS `Calendar_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Calendar_versions` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RecordID` int(11) NOT NULL DEFAULT '0',
  `Version` int(11) NOT NULL DEFAULT '0',
  `DefaultDateHeader` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `OtherDatesCount` int(11) NOT NULL DEFAULT '0',
  `RSSTitle` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `DefaultFutureMonths` int(11) NOT NULL DEFAULT '0',
  `EventsPerPage` int(11) NOT NULL DEFAULT '0',
  `DefaultView` enum('today','week','month','weekend','upcoming') CHARACTER SET utf8 DEFAULT 'upcoming',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `RecordID_Version` (`RecordID`,`Version`),
  KEY `RecordID` (`RecordID`),
  KEY `Version` (`Version`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Calendar_versions`
--

LOCK TABLES `Calendar_versions` WRITE;
/*!40000 ALTER TABLE `Calendar_versions` DISABLE KEYS */;
INSERT INTO `Calendar_versions` VALUES (1,7,1,'Upcoming Events',3,NULL,6,10,'upcoming'),(2,7,2,'Upcoming Events',3,NULL,6,10,'upcoming'),(3,7,3,'Upcoming Events',3,NULL,6,10,'upcoming');
/*!40000 ALTER TABLE `Calendar_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ErrorPage`
--

DROP TABLE IF EXISTS `ErrorPage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ErrorPage` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ErrorCode` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ErrorPage`
--

LOCK TABLES `ErrorPage` WRITE;
/*!40000 ALTER TABLE `ErrorPage` DISABLE KEYS */;
INSERT INTO `ErrorPage` VALUES (4,404),(5,500);
/*!40000 ALTER TABLE `ErrorPage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ErrorPage_Live`
--

DROP TABLE IF EXISTS `ErrorPage_Live`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ErrorPage_Live` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ErrorCode` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ErrorPage_Live`
--

LOCK TABLES `ErrorPage_Live` WRITE;
/*!40000 ALTER TABLE `ErrorPage_Live` DISABLE KEYS */;
INSERT INTO `ErrorPage_Live` VALUES (4,404),(5,500);
/*!40000 ALTER TABLE `ErrorPage_Live` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ErrorPage_versions`
--

DROP TABLE IF EXISTS `ErrorPage_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ErrorPage_versions` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RecordID` int(11) NOT NULL DEFAULT '0',
  `Version` int(11) NOT NULL DEFAULT '0',
  `ErrorCode` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `RecordID_Version` (`RecordID`,`Version`),
  KEY `RecordID` (`RecordID`),
  KEY `Version` (`Version`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ErrorPage_versions`
--

LOCK TABLES `ErrorPage_versions` WRITE;
/*!40000 ALTER TABLE `ErrorPage_versions` DISABLE KEYS */;
INSERT INTO `ErrorPage_versions` VALUES (1,4,1,404),(2,5,1,500);
/*!40000 ALTER TABLE `ErrorPage_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EventInvitation`
--

DROP TABLE IF EXISTS `EventInvitation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EventInvitation` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('EventInvitation') CHARACTER SET utf8 DEFAULT 'EventInvitation',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `Name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Email` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `EventID` int(11) NOT NULL DEFAULT '0',
  `TimeID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `EventID` (`EventID`),
  KEY `TimeID` (`TimeID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EventInvitation`
--

LOCK TABLES `EventInvitation` WRITE;
/*!40000 ALTER TABLE `EventInvitation` DISABLE KEYS */;
/*!40000 ALTER TABLE `EventInvitation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EventRegisterFormSession`
--

DROP TABLE IF EXISTS `EventRegisterFormSession`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EventRegisterFormSession` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RegistrationID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `RegistrationID` (`RegistrationID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EventRegisterFormSession`
--

LOCK TABLES `EventRegisterFormSession` WRITE;
/*!40000 ALTER TABLE `EventRegisterFormSession` DISABLE KEYS */;
/*!40000 ALTER TABLE `EventRegisterFormSession` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EventRegistration`
--

DROP TABLE IF EXISTS `EventRegistration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EventRegistration` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('EventRegistration') CHARACTER SET utf8 DEFAULT 'EventRegistration',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `Name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Email` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Status` enum('Unsubmitted','Unconfirmed','Valid','Canceled') CHARACTER SET utf8 DEFAULT 'Unsubmitted',
  `Token` varchar(40) CHARACTER SET utf8 DEFAULT NULL,
  `TotalCurrency` varchar(3) CHARACTER SET utf8 DEFAULT NULL,
  `TotalAmount` decimal(19,4) NOT NULL DEFAULT '0.0000',
  `TimeID` int(11) NOT NULL DEFAULT '0',
  `MemberID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `TimeID` (`TimeID`),
  KEY `MemberID` (`MemberID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EventRegistration`
--

LOCK TABLES `EventRegistration` WRITE;
/*!40000 ALTER TABLE `EventRegistration` DISABLE KEYS */;
/*!40000 ALTER TABLE `EventRegistration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EventRegistration_Tickets`
--

DROP TABLE IF EXISTS `EventRegistration_Tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EventRegistration_Tickets` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `EventRegistrationID` int(11) NOT NULL DEFAULT '0',
  `EventTicketID` int(11) NOT NULL DEFAULT '0',
  `Quantity` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `EventRegistrationID` (`EventRegistrationID`),
  KEY `EventTicketID` (`EventTicketID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EventRegistration_Tickets`
--

LOCK TABLES `EventRegistration_Tickets` WRITE;
/*!40000 ALTER TABLE `EventRegistration_Tickets` DISABLE KEYS */;
/*!40000 ALTER TABLE `EventRegistration_Tickets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EventTicket`
--

DROP TABLE IF EXISTS `EventTicket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EventTicket` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('EventTicket') CHARACTER SET utf8 DEFAULT 'EventTicket',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `Title` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Type` enum('Free','Price') CHARACTER SET utf8 DEFAULT 'Free',
  `Description` mediumtext CHARACTER SET utf8,
  `StartType` enum('Date','TimeBefore') CHARACTER SET utf8 DEFAULT 'Date',
  `StartDate` datetime DEFAULT NULL,
  `StartDays` int(11) NOT NULL DEFAULT '0',
  `StartHours` int(11) NOT NULL DEFAULT '0',
  `StartMins` int(11) NOT NULL DEFAULT '0',
  `EndType` enum('Date','TimeBefore') CHARACTER SET utf8 DEFAULT 'Date',
  `EndDate` datetime DEFAULT NULL,
  `EndDays` int(11) NOT NULL DEFAULT '0',
  `EndHours` int(11) NOT NULL DEFAULT '0',
  `EndMins` int(11) NOT NULL DEFAULT '0',
  `MinTickets` int(11) NOT NULL DEFAULT '0',
  `MaxTickets` int(11) NOT NULL DEFAULT '0',
  `PriceCurrency` varchar(3) CHARACTER SET utf8 DEFAULT NULL,
  `PriceAmount` decimal(19,4) NOT NULL DEFAULT '0.0000',
  `EventID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `EventID` (`EventID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EventTicket`
--

LOCK TABLES `EventTicket` WRITE;
/*!40000 ALTER TABLE `EventTicket` DISABLE KEYS */;
/*!40000 ALTER TABLE `EventTicket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `File`
--

DROP TABLE IF EXISTS `File`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `File` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('File','Folder','Image','Image_Cached') CHARACTER SET utf8 DEFAULT 'File',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `Name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Title` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Filename` mediumtext CHARACTER SET utf8,
  `Content` mediumtext CHARACTER SET utf8,
  `ShowInSearch` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `ParentID` int(11) NOT NULL DEFAULT '0',
  `OwnerID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `ParentID` (`ParentID`),
  KEY `OwnerID` (`OwnerID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `File`
--

LOCK TABLES `File` WRITE;
/*!40000 ALTER TABLE `File` DISABLE KEYS */;
INSERT INTO `File` VALUES (1,'Folder','2017-03-11 23:57:45','2017-03-11 23:57:45','Uploads','Uploads','assets/Uploads/',NULL,1,0,0),(2,'Image','2017-03-11 23:57:45','2017-03-11 23:57:45','SilverStripeLogo.png','SilverStripeLogo.png','assets/Uploads/SilverStripeLogo.png',NULL,1,1,0);
/*!40000 ALTER TABLE `File` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Group`
--

DROP TABLE IF EXISTS `Group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Group` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('Group') CHARACTER SET utf8 DEFAULT 'Group',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `Title` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Description` mediumtext CHARACTER SET utf8,
  `Code` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Locked` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `Sort` int(11) NOT NULL DEFAULT '0',
  `HtmlEditorConfig` mediumtext CHARACTER SET utf8,
  `ParentID` int(11) NOT NULL DEFAULT '0',
  `IsPaidMembership` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `ParentID` (`ParentID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Group`
--

LOCK TABLES `Group` WRITE;
/*!40000 ALTER TABLE `Group` DISABLE KEYS */;
INSERT INTO `Group` VALUES (1,'Group','2017-03-12 10:57:44','2017-03-12 10:57:44','Content Authors',NULL,'content-authors',0,1,NULL,0,0),(2,'Group','2017-03-12 10:57:44','2017-03-12 10:57:44','Administrators',NULL,'administrators',0,0,NULL,0,0),(3,'Group','2017-07-19 18:48:52','2017-07-16 15:36:36','Paid Member','Fully Paid Member','paid-member',0,0,NULL,0,1);
/*!40000 ALTER TABLE `Group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Group_Members`
--

DROP TABLE IF EXISTS `Group_Members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Group_Members` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `GroupID` int(11) NOT NULL DEFAULT '0',
  `MemberID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `GroupID` (`GroupID`),
  KEY `MemberID` (`MemberID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Group_Members`
--

LOCK TABLES `Group_Members` WRITE;
/*!40000 ALTER TABLE `Group_Members` DISABLE KEYS */;
INSERT INTO `Group_Members` VALUES (1,2,1),(2,2,2),(3,2,3),(4,3,1);
/*!40000 ALTER TABLE `Group_Members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Group_Roles`
--

DROP TABLE IF EXISTS `Group_Roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Group_Roles` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `GroupID` int(11) NOT NULL DEFAULT '0',
  `PermissionRoleID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `GroupID` (`GroupID`),
  KEY `PermissionRoleID` (`PermissionRoleID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Group_Roles`
--

LOCK TABLES `Group_Roles` WRITE;
/*!40000 ALTER TABLE `Group_Roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `Group_Roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ICSFeed`
--

DROP TABLE IF EXISTS `ICSFeed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ICSFeed` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('ICSFeed') CHARACTER SET utf8 DEFAULT 'ICSFeed',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `Title` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `URL` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `CalendarID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `CalendarID` (`CalendarID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ICSFeed`
--

LOCK TABLES `ICSFeed` WRITE;
/*!40000 ALTER TABLE `ICSFeed` DISABLE KEYS */;
/*!40000 ALTER TABLE `ICSFeed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LoginAttempt`
--

DROP TABLE IF EXISTS `LoginAttempt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `LoginAttempt` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('LoginAttempt') CHARACTER SET utf8 DEFAULT 'LoginAttempt',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `Email` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Status` enum('Success','Failure') CHARACTER SET utf8 DEFAULT 'Success',
  `IP` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `MemberID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `MemberID` (`MemberID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LoginAttempt`
--

LOCK TABLES `LoginAttempt` WRITE;
/*!40000 ALTER TABLE `LoginAttempt` DISABLE KEYS */;
INSERT INTO `LoginAttempt` VALUES (1,'LoginAttempt','2017-07-13 20:07:18','2017-07-13 20:07:18','admin','Success','124.169.104.80',1),(2,'LoginAttempt','2017-07-14 10:40:27','2017-07-14 10:40:27','ben@benbillbob.com','Success','124.169.104.80',4),(3,'LoginAttempt','2017-07-14 12:37:37','2017-07-14 12:37:37','ben@benbillbob.com','Success','124.169.104.80',4),(4,'LoginAttempt','2017-07-14 14:12:30','2017-07-14 14:12:30','ben@benbillbob.com','Success','124.169.104.80',4),(5,'LoginAttempt','2017-07-16 09:19:58','2017-07-16 09:19:58','admin','Success','124.169.104.80',1),(6,'LoginAttempt','2017-07-16 09:51:43','2017-07-16 09:51:43','admin','Success','124.169.104.80',1),(7,'LoginAttempt','2017-07-16 09:52:25','2017-07-16 09:52:25','admin','Success','124.169.104.80',1),(8,'LoginAttempt','2017-07-16 10:03:39','2017-07-16 10:03:39','admin','Failure','124.169.104.80',1),(9,'LoginAttempt','2017-07-16 10:03:44','2017-07-16 10:03:44','admin','Success','124.169.104.80',1),(10,'LoginAttempt','2017-07-16 15:10:19','2017-07-16 15:10:19','ben@benbillbob.com','Success','124.169.104.80',4),(11,'LoginAttempt','2017-07-16 15:48:44','2017-07-16 15:48:44','admin','Success','124.169.104.80',1),(12,'LoginAttempt','2017-07-16 15:49:09','2017-07-16 15:49:09','admin','Success','124.169.104.80',1),(13,'LoginAttempt','2017-07-16 15:49:27','2017-07-16 15:49:27','admin','Success','124.169.104.80',1),(14,'LoginAttempt','2017-07-19 09:04:00','2017-07-19 09:04:00','admin','Success','124.169.104.80',1),(15,'LoginAttempt','2017-07-19 12:01:29','2017-07-19 12:01:29','admin','Success','124.169.104.80',1),(16,'LoginAttempt','2017-07-19 12:27:42','2017-07-19 12:27:42','admin','Success','124.169.104.80',1),(17,'LoginAttempt','2017-07-19 13:28:23','2017-07-19 13:28:23','admin','Success','124.169.104.80',1),(18,'LoginAttempt','2017-07-19 13:36:09','2017-07-19 13:36:09','admin','Success','124.169.104.80',1),(19,'LoginAttempt','2017-07-19 17:58:38','2017-07-19 17:58:38','root','Failure','124.169.104.80',0),(20,'LoginAttempt','2017-07-19 17:58:51','2017-07-19 17:58:51','admin','Success','124.169.104.80',1),(21,'LoginAttempt','2017-07-20 12:05:01','2017-07-20 12:05:01','viviers@tpg.com.au','Success','60.242.127.112',3),(22,'LoginAttempt','2017-07-23 11:12:59','2017-07-23 11:12:59','root','Failure','124.169.104.80',0),(23,'LoginAttempt','2017-07-23 11:13:07','2017-07-23 11:13:07','admin','Failure','124.169.104.80',1),(24,'LoginAttempt','2017-07-23 11:13:11','2017-07-23 11:13:11','admin','Success','124.169.104.80',1),(25,'LoginAttempt','2017-07-23 12:44:22','2017-07-23 12:44:22','admin','Success','124.169.104.80',1),(26,'LoginAttempt','2017-07-23 13:01:35','2017-07-23 13:01:35','admin','Success','124.169.104.80',1),(27,'LoginAttempt','2017-07-23 13:04:02','2017-07-23 13:04:02','admin','Success','124.169.104.80',1),(28,'LoginAttempt','2017-07-23 13:42:39','2017-07-23 13:42:39','admin','Success','124.169.104.80',1),(29,'LoginAttempt','2017-07-23 15:31:51','2017-07-23 15:31:51','admin','Success','124.169.104.80',1),(30,'LoginAttempt','2017-07-23 16:12:16','2017-07-23 16:12:16','admin','Success','124.169.104.80',1);
/*!40000 ALTER TABLE `LoginAttempt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Member`
--

DROP TABLE IF EXISTS `Member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Member` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('Member') CHARACTER SET utf8 DEFAULT 'Member',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `FirstName` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `Surname` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `Email` varchar(254) CHARACTER SET utf8 DEFAULT NULL,
  `TempIDHash` varchar(160) CHARACTER SET utf8 DEFAULT NULL,
  `TempIDExpired` datetime DEFAULT NULL,
  `Password` varchar(160) CHARACTER SET utf8 DEFAULT NULL,
  `RememberLoginToken` varchar(160) CHARACTER SET utf8 DEFAULT NULL,
  `NumVisit` int(11) NOT NULL DEFAULT '0',
  `LastVisited` datetime DEFAULT NULL,
  `AutoLoginHash` varchar(160) CHARACTER SET utf8 DEFAULT NULL,
  `AutoLoginExpired` datetime DEFAULT NULL,
  `PasswordEncryption` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `Salt` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `PasswordExpiry` date DEFAULT NULL,
  `LockedOutUntil` datetime DEFAULT NULL,
  `Locale` varchar(6) CHARACTER SET utf8 DEFAULT NULL,
  `FailedLoginCount` int(11) NOT NULL DEFAULT '0',
  `DateFormat` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `TimeFormat` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `ValidationKey` varchar(40) CHARACTER SET utf8 DEFAULT NULL,
  `NeedsValidation` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `NeedsApproval` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `PublicFieldsRaw` mediumtext CHARACTER SET utf8,
  `ProfilePageID` int(11) NOT NULL DEFAULT '0',
  `PhoneNumber` mediumtext CHARACTER SET utf8,
  `Membership` varchar(8) CHARACTER SET utf8 DEFAULT NULL,
  `MembershipExpiry` date DEFAULT NULL,
  `TxnId` varchar(60) CHARACTER SET utf8 DEFAULT NULL,
  `MembershipID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `Email` (`Email`),
  KEY `ClassName` (`ClassName`),
  KEY `ProfilePageID` (`ProfilePageID`),
  KEY `MembershipID` (`MembershipID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Member`
--

LOCK TABLES `Member` WRITE;
/*!40000 ALTER TABLE `Member` DISABLE KEYS */;
INSERT INTO `Member` VALUES (1,'Member','2017-07-23 17:08:50','2017-03-12 10:57:45','Default Admin',NULL,'admin','e2d2a073d8c15cdd29f4d3f49bdac087b75aae3a','2017-07-26 16:12:16','$2y$10$3e8605704a14f702bf45ceYOHbIuH6gaiBhO4Y6qo2lY49xK5AZ8G',NULL,28,'2017-07-23 10:33:56',NULL,NULL,'blowfish','10$3e8605704a14f702bf45ce',NULL,NULL,'en_US',0,NULL,NULL,NULL,0,0,NULL,0,NULL,NULL,'2019-07-23','3WX83335L7588684P',0),(2,'Member','2017-05-14 17:36:03','2017-04-10 10:47:26','Rebecca','McKeon','becmckeon@telstra.com','f77612267e687b8ff9e88c9e8526c2d93d55112d','2017-05-17 17:36:03','$2y$10$0d74db51d8681976ab391uRk6I94E12QVUJ8mY.1Dy8c0ivCFR5t6',NULL,7,'2017-05-14 07:36:16',NULL,NULL,'blowfish','10$0d74db51d8681976ab3913',NULL,NULL,'en_GB',0,'yyyy-MM-dd','h:mm a',NULL,0,0,NULL,0,NULL,NULL,NULL,NULL,0),(3,'Member','2017-07-20 12:05:01','2017-05-01 12:43:10','Katie','Viviers','viviers@tpg.com.au','651c0f59180c17bb7c1f21d8bb99b2a2b1898db9','2017-07-23 12:05:01','$2y$10$fd942578e15bb923c6df2uk3NjCrWIJvxpjO1ykQ9sgRmTdhClD46',NULL,5,'2017-07-20 02:05:43',NULL,NULL,'blowfish','10$fd942578e15bb923c6df22',NULL,NULL,'en_GB',0,'yyyy-MM-dd','h:mm a','49d6ec8339162c6992da06bdbe3a92840c4a54e1',0,0,NULL,0,NULL,NULL,NULL,NULL,0),(4,'Member','2017-07-19 12:28:10','2017-07-13 15:26:52','Ben','Woodcock','ben@benbillbob.com','c42def956a3af59bb30cf113e8ac9798fe210d91','2017-07-19 15:10:19','$2y$10$aee73dc590191b43d7775eCEQEgHxUHJD5RWtXAk5bbiwYu1snGBK',NULL,4,'2017-07-16 05:56:58',NULL,NULL,'blowfish','10$aee73dc590191b43d7775f',NULL,NULL,'en_GB',0,'yyyy-MM-dd','H:mm','a1bffe6a77cc0ee9e33d113027b3be458d3bd5ca',0,0,'a:3:{i:0;b:0;i:1;s:9:\"FirstName\";i:2;s:9:\"FirstName\";}',0,NULL,'Gold','2017-07-09','4J733950EP288391E',0),(5,'Member','2017-07-19 21:28:42','2017-07-16 15:57:19','Test','User','ben@playedinane.com','30df50c7fa456ab17fa1b58cd45048580cfe55fd','2017-07-19 15:57:19','$2y$10$e025aefc870d2bb3f29feuYqo43JMTlUWf4nVjEjKPhaQx4Yx3AXy',NULL,1,'2017-07-16 06:04:56',NULL,NULL,'blowfish','10$e025aefc870d2bb3f29fe5',NULL,NULL,'en_US',0,'yyyy-MM-dd','H:mm','a536f2740560b54ba5ab9f0724a219cc7b6e87da',0,0,'a:3:{i:0;b:0;i:1;s:9:\"FirstName\";i:2;s:7:\"Surname\";}',6,NULL,NULL,NULL,NULL,2);
/*!40000 ALTER TABLE `Member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MemberPassword`
--

DROP TABLE IF EXISTS `MemberPassword`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MemberPassword` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('MemberPassword') CHARACTER SET utf8 DEFAULT 'MemberPassword',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `Password` varchar(160) CHARACTER SET utf8 DEFAULT NULL,
  `Salt` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `PasswordEncryption` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `MemberID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `MemberID` (`MemberID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MemberPassword`
--

LOCK TABLES `MemberPassword` WRITE;
/*!40000 ALTER TABLE `MemberPassword` DISABLE KEYS */;
INSERT INTO `MemberPassword` VALUES (1,'MemberPassword','2017-03-12 10:57:45','2017-03-12 10:57:45','$2y$10$3e8605704a14f702bf45ceYOHbIuH6gaiBhO4Y6qo2lY49xK5AZ8G','10$3e8605704a14f702bf45ce','blowfish',1),(2,'MemberPassword','2017-04-10 10:47:26','2017-04-10 10:47:26','$2y$10$0d74db51d8681976ab391uRk6I94E12QVUJ8mY.1Dy8c0ivCFR5t6','10$0d74db51d8681976ab3913','blowfish',2),(3,'MemberPassword','2017-05-01 12:43:10','2017-05-01 12:43:10','$2y$10$fd942578e15bb923c6df2uk3NjCrWIJvxpjO1ykQ9sgRmTdhClD46','10$fd942578e15bb923c6df22','blowfish',3),(4,'MemberPassword','2017-07-13 15:26:52','2017-07-13 15:26:52','$2y$10$aee73dc590191b43d7775eCEQEgHxUHJD5RWtXAk5bbiwYu1snGBK','10$aee73dc590191b43d7775f','blowfish',4),(5,'MemberPassword','2017-07-16 15:57:19','2017-07-16 15:57:19','$2y$10$e025aefc870d2bb3f29feuYqo43JMTlUWf4nVjEjKPhaQx4Yx3AXy','10$e025aefc870d2bb3f29fe5','blowfish',5);
/*!40000 ALTER TABLE `MemberPassword` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MemberProfileField`
--

DROP TABLE IF EXISTS `MemberProfileField`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MemberProfileField` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('MemberProfileField') CHARACTER SET utf8 DEFAULT 'MemberProfileField',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `ProfileVisibility` enum('Edit','Readonly','Hidden') CHARACTER SET utf8 DEFAULT 'Hidden',
  `RegistrationVisibility` enum('Edit','Readonly','Hidden') CHARACTER SET utf8 DEFAULT 'Hidden',
  `MemberListVisible` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `PublicVisibility` enum('Display','MemberChoice','Hidden') CHARACTER SET utf8 DEFAULT 'Hidden',
  `PublicVisibilityDefault` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `MemberField` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `CustomTitle` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `DefaultValue` mediumtext CHARACTER SET utf8,
  `Note` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `CustomError` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Unique` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `Required` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `Sort` int(11) NOT NULL DEFAULT '0',
  `ProfilePageID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `ProfilePageID` (`ProfilePageID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MemberProfileField`
--

LOCK TABLES `MemberProfileField` WRITE;
/*!40000 ALTER TABLE `MemberProfileField` DISABLE KEYS */;
INSERT INTO `MemberProfileField` VALUES (1,'MemberProfileField','2017-04-11 11:36:24','2017-04-11 11:36:24','Edit','Edit',1,'Display',0,'FirstName',NULL,NULL,NULL,NULL,0,0,1,6),(2,'MemberProfileField','2017-04-11 11:36:24','2017-04-11 11:36:24','Edit','Edit',1,'MemberChoice',1,'Surname',NULL,NULL,NULL,NULL,0,0,2,6),(3,'MemberProfileField','2017-04-11 11:36:24','2017-04-11 11:36:24','Edit','Edit',0,'MemberChoice',0,'Email',NULL,NULL,NULL,NULL,0,0,3,6),(4,'MemberProfileField','2017-04-11 11:36:24','2017-04-11 11:36:24','Edit','Edit',0,'Hidden',0,'Password',NULL,NULL,NULL,NULL,0,0,4,6),(5,'MemberProfileField','2017-04-11 11:36:24','2017-04-11 11:36:24','Hidden','Hidden',0,'Hidden',0,'Locale',NULL,NULL,NULL,NULL,0,0,5,6),(6,'MemberProfileField','2017-04-11 11:36:24','2017-04-11 11:36:24','Hidden','Hidden',0,'Hidden',0,'DateFormat',NULL,NULL,NULL,NULL,0,0,6,6),(7,'MemberProfileField','2017-04-11 11:36:24','2017-04-11 11:36:24','Hidden','Hidden',0,'Hidden',0,'TimeFormat',NULL,NULL,NULL,NULL,0,0,7,6),(8,'MemberProfileField','2017-04-11 11:36:24','2017-04-11 11:36:24','Hidden','Hidden',0,'Hidden',0,'Groups',NULL,NULL,NULL,NULL,0,0,8,6),(11,'MemberProfileField','2017-07-14 13:25:10','2017-07-14 13:17:39','Readonly','Hidden',0,'Hidden',0,'MembershipExpiry',NULL,NULL,NULL,NULL,0,0,11,6),(12,'MemberProfileField','2017-07-16 15:10:04','2017-07-16 15:10:04','Hidden','Hidden',0,'Hidden',0,'TxnId',NULL,NULL,NULL,NULL,0,0,12,6),(13,'MemberProfileField','2017-07-19 21:10:46','2017-07-19 21:10:46','Hidden','Hidden',0,'Hidden',0,'MembershipID',NULL,NULL,NULL,NULL,0,0,13,6),(14,'MemberProfileField','2017-07-23 20:33:51','2017-07-23 20:30:37','Readonly','Hidden',0,'Hidden',0,'WithJournal',NULL,NULL,NULL,NULL,0,0,14,6);
/*!40000 ALTER TABLE `MemberProfileField` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MemberProfilePage`
--

DROP TABLE IF EXISTS `MemberProfilePage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MemberProfilePage` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ProfileTitle` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `RegistrationTitle` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `AfterRegistrationTitle` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `ProfileContent` mediumtext CHARACTER SET utf8,
  `RegistrationContent` mediumtext CHARACTER SET utf8,
  `AfterRegistrationContent` mediumtext CHARACTER SET utf8,
  `AllowRegistration` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `AllowProfileViewing` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `AllowProfileEditing` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `AllowAdding` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `RegistrationRedirect` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `RequireApproval` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `EmailType` enum('Validation','Confirmation','None') CHARACTER SET utf8 DEFAULT 'None',
  `EmailFrom` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `EmailSubject` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `EmailTemplate` mediumtext CHARACTER SET utf8,
  `ConfirmationTitle` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `ConfirmationContent` mediumtext CHARACTER SET utf8,
  `PostRegistrationTargetID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `PostRegistrationTargetID` (`PostRegistrationTargetID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MemberProfilePage`
--

LOCK TABLES `MemberProfilePage` WRITE;
/*!40000 ALTER TABLE `MemberProfilePage` DISABLE KEYS */;
INSERT INTO `MemberProfilePage` VALUES (6,'Edit Profile','Register / Log In','Registration Successful',NULL,NULL,'<p>Thank you for registering!</p>',1,1,1,0,1,0,'None',NULL,'$SiteName Member Activation','<p>\r\n	Dear $Member.Email,\r\n</p>\r\n\r\n<p>\r\n	Thank you for registering at $SiteName! In order to use your account you must first confirm your\r\n	email address by clicking on the link below. Until you do this you will not be able to log in.\r\n</p>\r\n\r\n<h3>Account Confirmation</h3>\r\n\r\n<p>\r\n	Please <a href=\"$ConfirmLink\">confirm your email</a>, or copy and paste the following URL into\r\n	your browser to confirm this is your real email address:\r\n</p>\r\n\r\n<pre>$ConfirmLink</pre>\r\n\r\n<p>\r\n	If you were not the person who signed up using this email address, please ignore this email. The\r\n	user account will not become active.\r\n</p>\r\n\r\n<h3>Log-In Details</h3>\r\n\r\n<p>\r\n	Once your account has been activated you will automatically be logged in. You can also log in\r\n	<a href=\"$LoginLink\">here</a>. If you have lost your password you can generate a new one\r\n	on the <a href=\"$LostPasswordLink\">lost password</a> page.\r\n</p>\r\n','Account Confirmed','<p>Your account is now active, and you have been logged in. Thankyou!</p>',21);
/*!40000 ALTER TABLE `MemberProfilePage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MemberProfilePage_ApprovalGroups`
--

DROP TABLE IF EXISTS `MemberProfilePage_ApprovalGroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MemberProfilePage_ApprovalGroups` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `MemberProfilePageID` int(11) NOT NULL DEFAULT '0',
  `GroupID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `MemberProfilePageID` (`MemberProfilePageID`),
  KEY `GroupID` (`GroupID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MemberProfilePage_ApprovalGroups`
--

LOCK TABLES `MemberProfilePage_ApprovalGroups` WRITE;
/*!40000 ALTER TABLE `MemberProfilePage_ApprovalGroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `MemberProfilePage_ApprovalGroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MemberProfilePage_Groups`
--

DROP TABLE IF EXISTS `MemberProfilePage_Groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MemberProfilePage_Groups` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `MemberProfilePageID` int(11) NOT NULL DEFAULT '0',
  `GroupID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `MemberProfilePageID` (`MemberProfilePageID`),
  KEY `GroupID` (`GroupID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MemberProfilePage_Groups`
--

LOCK TABLES `MemberProfilePage_Groups` WRITE;
/*!40000 ALTER TABLE `MemberProfilePage_Groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `MemberProfilePage_Groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MemberProfilePage_Live`
--

DROP TABLE IF EXISTS `MemberProfilePage_Live`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MemberProfilePage_Live` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ProfileTitle` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `RegistrationTitle` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `AfterRegistrationTitle` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `ProfileContent` mediumtext CHARACTER SET utf8,
  `RegistrationContent` mediumtext CHARACTER SET utf8,
  `AfterRegistrationContent` mediumtext CHARACTER SET utf8,
  `AllowRegistration` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `AllowProfileViewing` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `AllowProfileEditing` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `AllowAdding` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `RegistrationRedirect` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `RequireApproval` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `EmailType` enum('Validation','Confirmation','None') CHARACTER SET utf8 DEFAULT 'None',
  `EmailFrom` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `EmailSubject` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `EmailTemplate` mediumtext CHARACTER SET utf8,
  `ConfirmationTitle` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `ConfirmationContent` mediumtext CHARACTER SET utf8,
  `PostRegistrationTargetID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `PostRegistrationTargetID` (`PostRegistrationTargetID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MemberProfilePage_Live`
--

LOCK TABLES `MemberProfilePage_Live` WRITE;
/*!40000 ALTER TABLE `MemberProfilePage_Live` DISABLE KEYS */;
INSERT INTO `MemberProfilePage_Live` VALUES (6,'Edit Profile','Register / Log In','Registration Successful',NULL,NULL,'<p>Thank you for registering!</p>',1,1,1,0,1,0,'None',NULL,'$SiteName Member Activation','<p>\r\n	Dear $Member.Email,\r\n</p>\r\n\r\n<p>\r\n	Thank you for registering at $SiteName! In order to use your account you must first confirm your\r\n	email address by clicking on the link below. Until you do this you will not be able to log in.\r\n</p>\r\n\r\n<h3>Account Confirmation</h3>\r\n\r\n<p>\r\n	Please <a href=\"$ConfirmLink\">confirm your email</a>, or copy and paste the following URL into\r\n	your browser to confirm this is your real email address:\r\n</p>\r\n\r\n<pre>$ConfirmLink</pre>\r\n\r\n<p>\r\n	If you were not the person who signed up using this email address, please ignore this email. The\r\n	user account will not become active.\r\n</p>\r\n\r\n<h3>Log-In Details</h3>\r\n\r\n<p>\r\n	Once your account has been activated you will automatically be logged in. You can also log in\r\n	<a href=\"$LoginLink\">here</a>. If you have lost your password you can generate a new one\r\n	on the <a href=\"$LostPasswordLink\">lost password</a> page.\r\n</p>\r\n','Account Confirmed','<p>Your account is now active, and you have been logged in. Thankyou!</p>',21);
/*!40000 ALTER TABLE `MemberProfilePage_Live` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MemberProfilePage_SelectableGroups`
--

DROP TABLE IF EXISTS `MemberProfilePage_SelectableGroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MemberProfilePage_SelectableGroups` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `MemberProfilePageID` int(11) NOT NULL DEFAULT '0',
  `GroupID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `MemberProfilePageID` (`MemberProfilePageID`),
  KEY `GroupID` (`GroupID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MemberProfilePage_SelectableGroups`
--

LOCK TABLES `MemberProfilePage_SelectableGroups` WRITE;
/*!40000 ALTER TABLE `MemberProfilePage_SelectableGroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `MemberProfilePage_SelectableGroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MemberProfilePage_versions`
--

DROP TABLE IF EXISTS `MemberProfilePage_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MemberProfilePage_versions` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RecordID` int(11) NOT NULL DEFAULT '0',
  `Version` int(11) NOT NULL DEFAULT '0',
  `ProfileTitle` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `RegistrationTitle` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `AfterRegistrationTitle` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `ProfileContent` mediumtext CHARACTER SET utf8,
  `RegistrationContent` mediumtext CHARACTER SET utf8,
  `AfterRegistrationContent` mediumtext CHARACTER SET utf8,
  `AllowRegistration` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `AllowProfileViewing` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `AllowProfileEditing` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `AllowAdding` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `RegistrationRedirect` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `RequireApproval` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `EmailType` enum('Validation','Confirmation','None') CHARACTER SET utf8 DEFAULT 'None',
  `EmailFrom` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `EmailSubject` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `EmailTemplate` mediumtext CHARACTER SET utf8,
  `ConfirmationTitle` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `ConfirmationContent` mediumtext CHARACTER SET utf8,
  `PostRegistrationTargetID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `RecordID_Version` (`RecordID`,`Version`),
  KEY `RecordID` (`RecordID`),
  KEY `Version` (`Version`),
  KEY `PostRegistrationTargetID` (`PostRegistrationTargetID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MemberProfilePage_versions`
--

LOCK TABLES `MemberProfilePage_versions` WRITE;
/*!40000 ALTER TABLE `MemberProfilePage_versions` DISABLE KEYS */;
INSERT INTO `MemberProfilePage_versions` VALUES (1,6,1,'Edit Profile','Register / Log In','Registration Successful',NULL,NULL,'<p>Thank you for registering!</p>',1,1,1,0,0,0,'None',NULL,NULL,NULL,'Account Confirmed','<p>Your account is now active, and you have been logged in. Thankyou!</p>',0),(2,6,2,'Edit Profile','Register / Log In','Registration Successful',NULL,NULL,'<p>Thank you for registering!</p>',1,1,1,0,0,0,'None',NULL,'$SiteName Member Activation','<p>\r\n	Dear $Member.Email,\r\n</p>\r\n\r\n<p>\r\n	Thank you for registering at $SiteName! In order to use your account you must first confirm your\r\n	email address by clicking on the link below. Until you do this you will not be able to log in.\r\n</p>\r\n\r\n<h3>Account Confirmation</h3>\r\n\r\n<p>\r\n	Please <a href=\"$ConfirmLink\">confirm your email</a>, or copy and paste the following URL into\r\n	your browser to confirm this is your real email address:\r\n</p>\r\n\r\n<pre>$ConfirmLink</pre>\r\n\r\n<p>\r\n	If you were not the person who signed up using this email address, please ignore this email. The\r\n	user account will not become active.\r\n</p>\r\n\r\n<h3>Log-In Details</h3>\r\n\r\n<p>\r\n	Once your account has been activated you will automatically be logged in. You can also log in\r\n	<a href=\"$LoginLink\">here</a>. If you have lost your password you can generate a new one\r\n	on the <a href=\"$LostPasswordLink\">lost password</a> page.\r\n</p>\r\n','Account Confirmed','<p>Your account is now active, and you have been logged in. Thankyou!</p>',0),(3,6,3,'Edit Profile','Register / Log In','Registration Successful',NULL,NULL,'<p>Thank you for registering!</p>',1,1,1,0,1,0,'None',NULL,'$SiteName Member Activation','<p>\r\n	Dear $Member.Email,\r\n</p>\r\n\r\n<p>\r\n	Thank you for registering at $SiteName! In order to use your account you must first confirm your\r\n	email address by clicking on the link below. Until you do this you will not be able to log in.\r\n</p>\r\n\r\n<h3>Account Confirmation</h3>\r\n\r\n<p>\r\n	Please <a href=\"$ConfirmLink\">confirm your email</a>, or copy and paste the following URL into\r\n	your browser to confirm this is your real email address:\r\n</p>\r\n\r\n<pre>$ConfirmLink</pre>\r\n\r\n<p>\r\n	If you were not the person who signed up using this email address, please ignore this email. The\r\n	user account will not become active.\r\n</p>\r\n\r\n<h3>Log-In Details</h3>\r\n\r\n<p>\r\n	Once your account has been activated you will automatically be logged in. You can also log in\r\n	<a href=\"$LoginLink\">here</a>. If you have lost your password you can generate a new one\r\n	on the <a href=\"$LostPasswordLink\">lost password</a> page.\r\n</p>\r\n','Account Confirmed','<p>Your account is now active, and you have been logged in. Thankyou!</p>',10),(4,6,4,'Edit Profile','Register / Log In','Registration Successful',NULL,NULL,'<p>Thank you for registering!</p>',1,1,1,0,1,0,'None',NULL,'$SiteName Member Activation','<p>\r\n	Dear $Member.Email,\r\n</p>\r\n\r\n<p>\r\n	Thank you for registering at $SiteName! In order to use your account you must first confirm your\r\n	email address by clicking on the link below. Until you do this you will not be able to log in.\r\n</p>\r\n\r\n<h3>Account Confirmation</h3>\r\n\r\n<p>\r\n	Please <a href=\"$ConfirmLink\">confirm your email</a>, or copy and paste the following URL into\r\n	your browser to confirm this is your real email address:\r\n</p>\r\n\r\n<pre>$ConfirmLink</pre>\r\n\r\n<p>\r\n	If you were not the person who signed up using this email address, please ignore this email. The\r\n	user account will not become active.\r\n</p>\r\n\r\n<h3>Log-In Details</h3>\r\n\r\n<p>\r\n	Once your account has been activated you will automatically be logged in. You can also log in\r\n	<a href=\"$LoginLink\">here</a>. If you have lost your password you can generate a new one\r\n	on the <a href=\"$LostPasswordLink\">lost password</a> page.\r\n</p>\r\n','Account Confirmed','<p>Your account is now active, and you have been logged in. Thankyou!</p>',10),(5,6,5,'Edit Profile','Register / Log In','Registration Successful',NULL,NULL,'<p>Thank you for registering!</p>',1,1,1,0,1,0,'None',NULL,'$SiteName Member Activation','<p>\r\n	Dear $Member.Email,\r\n</p>\r\n\r\n<p>\r\n	Thank you for registering at $SiteName! In order to use your account you must first confirm your\r\n	email address by clicking on the link below. Until you do this you will not be able to log in.\r\n</p>\r\n\r\n<h3>Account Confirmation</h3>\r\n\r\n<p>\r\n	Please <a href=\"$ConfirmLink\">confirm your email</a>, or copy and paste the following URL into\r\n	your browser to confirm this is your real email address:\r\n</p>\r\n\r\n<pre>$ConfirmLink</pre>\r\n\r\n<p>\r\n	If you were not the person who signed up using this email address, please ignore this email. The\r\n	user account will not become active.\r\n</p>\r\n\r\n<h3>Log-In Details</h3>\r\n\r\n<p>\r\n	Once your account has been activated you will automatically be logged in. You can also log in\r\n	<a href=\"$LoginLink\">here</a>. If you have lost your password you can generate a new one\r\n	on the <a href=\"$LostPasswordLink\">lost password</a> page.\r\n</p>\r\n','Account Confirmed','<p>Your account is now active, and you have been logged in. Thankyou!</p>',10),(6,6,6,'Edit Profile','Register / Log In','Registration Successful',NULL,NULL,'<p>Thank you for registering!</p>',1,1,1,0,1,0,'None',NULL,'$SiteName Member Activation','<p>\r\n	Dear $Member.Email,\r\n</p>\r\n\r\n<p>\r\n	Thank you for registering at $SiteName! In order to use your account you must first confirm your\r\n	email address by clicking on the link below. Until you do this you will not be able to log in.\r\n</p>\r\n\r\n<h3>Account Confirmation</h3>\r\n\r\n<p>\r\n	Please <a href=\"$ConfirmLink\">confirm your email</a>, or copy and paste the following URL into\r\n	your browser to confirm this is your real email address:\r\n</p>\r\n\r\n<pre>$ConfirmLink</pre>\r\n\r\n<p>\r\n	If you were not the person who signed up using this email address, please ignore this email. The\r\n	user account will not become active.\r\n</p>\r\n\r\n<h3>Log-In Details</h3>\r\n\r\n<p>\r\n	Once your account has been activated you will automatically be logged in. You can also log in\r\n	<a href=\"$LoginLink\">here</a>. If you have lost your password you can generate a new one\r\n	on the <a href=\"$LostPasswordLink\">lost password</a> page.\r\n</p>\r\n','Account Confirmed','<p>Your account is now active, and you have been logged in. Thankyou!</p>',21);
/*!40000 ALTER TABLE `MemberProfilePage_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MemberProfileSection`
--

DROP TABLE IF EXISTS `MemberProfileSection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MemberProfileSection` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('MemberProfileSection','MemberProfileFieldsSection') CHARACTER SET utf8 DEFAULT 'MemberProfileSection',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `CustomTitle` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `ParentID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `ParentID` (`ParentID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MemberProfileSection`
--

LOCK TABLES `MemberProfileSection` WRITE;
/*!40000 ALTER TABLE `MemberProfileSection` DISABLE KEYS */;
INSERT INTO `MemberProfileSection` VALUES (1,'MemberProfileFieldsSection','2017-04-11 11:37:09','2017-04-11 11:36:24',NULL,6);
/*!40000 ALTER TABLE `MemberProfileSection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Membership`
--

DROP TABLE IF EXISTS `Membership`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Membership` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('Membership') CHARACTER SET utf8 DEFAULT 'Membership',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `ItemName` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `ItemNumber` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `Amount` decimal(9,2) NOT NULL DEFAULT '0.00',
  `MembershipMonths` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `NewField` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `MembershipContainerPageID` int(11) NOT NULL DEFAULT '0',
  `GroupID` int(11) NOT NULL DEFAULT '0',
  `MembershipID` int(11) NOT NULL DEFAULT '0',
  `Description` mediumtext CHARACTER SET utf8,
  `DescriptionContent` mediumtext CHARACTER SET utf8,
  `Journal` decimal(9,2) NOT NULL DEFAULT '0.00',
  `ItemNumberWithJournal` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `AmountWithJournal` decimal(9,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`ID`),
  KEY `MembershipContainerPageID` (`MembershipContainerPageID`),
  KEY `GroupID` (`GroupID`),
  KEY `ClassName` (`ClassName`),
  KEY `MembershipID` (`MembershipID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Membership`
--

LOCK TABLES `Membership` WRITE;
/*!40000 ALTER TABLE `Membership` DISABLE KEYS */;
INSERT INTO `Membership` VALUES (2,'Membership','2017-07-23 12:49:10','2017-07-19 20:35:24','Full Membership 24 Months','FM24',0.02,'24',NULL,21,3,0,NULL,'<p>per family for 2 years (up to 2 adults and their children)</p><p>Entitles you to:</p><ul><li>Discounts on seminars, games night, excursions, ladies retreats and any other GFSG events</li>\n<li>Quarterly e-newsletter</li>\n<li>Email updates about seminars &amp; upcoming events</li>\n<li>Children can join the “GFSG Kids Edmodo group” for GFSG members only</li>\n<li>Parents/Caregivers (Mums &amp; Dads) can join the new private facebook support group</li>\n<li>Library – borrowing of books and other resources (Postage at member’s cost)</li>\n</ul>',0.00,'FM24J',0.03),(3,'Membership','2017-07-23 12:49:29','2017-07-19 20:36:26','Professional Membership 12 Months','PM12',0.03,'12',NULL,21,3,0,NULL,'<p>per professional or teacher</p><p>Entitles you to:</p><ul><li>Discounts at seminars</li>\n<li>Quarterly e-newsletter</li>\n<li>Library – borrowing of books and other resources (Postage at member’s cost)</li>\n<li>Email updates about seminars &amp; upcoming events</li>\n<li>Affiliated membership with AAEGT plus the opportunity to receive the twice-yearly AAEGT journal at a discount</li>\n</ul>',0.00,'PM12J',0.15),(4,'Membership','2017-07-23 12:50:19','2017-07-19 20:37:23','Professional Membership 24 months','PM24',0.04,'24',NULL,21,3,0,NULL,'<p>per professional or teacher</p><p>Entitles you to:</p><ul><li>Discounts at seminars</li>\n<li>Quarterly e-newsletter</li>\n<li>Library – borrowing of books and other resources (Postage at member’s cost)</li>\n<li>Email updates about seminars &amp; upcoming events</li>\n<li>Affiliated membership with AAEGT plus the opportunity to receive the twice-yearly AAEGT journal at a discount</li>\n</ul>',0.00,'PM24J',0.06),(5,'Membership','2017-07-23 12:49:53','2017-07-19 20:33:46','Full Membership 12 Months','FM12',0.03,'12','rr',21,3,0,NULL,'<p><span>per family per year</span> (up to 2 adults and their children)</p><p>Entitles you to:</p><ul><li>Discounts on seminars, games night, excursions, ladies retreats and any other GFSG events</li>\n<li>Quarterly e-newsletter</li>\n<li>Email updates about seminars &amp; upcoming events</li>\n<li>Children can join the “GFSG Kids Edmodo group” for GFSG members only</li>\n<li>Parents/Caregivers (Mums &amp; Dads) can join the new private facebook support group</li>\n<li>Library – borrowing of books and other resources (Postage at member’s cost)</li>\n</ul>',0.00,'FM12J',0.05);
/*!40000 ALTER TABLE `Membership` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MultiFormSession`
--

DROP TABLE IF EXISTS `MultiFormSession`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MultiFormSession` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('MultiFormSession','EventRegisterFormSession') CHARACTER SET utf8 DEFAULT 'MultiFormSession',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `Hash` varchar(40) CHARACTER SET utf8 DEFAULT NULL,
  `IsComplete` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `SubmitterID` int(11) NOT NULL DEFAULT '0',
  `CurrentStepID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `SubmitterID` (`SubmitterID`),
  KEY `CurrentStepID` (`CurrentStepID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MultiFormSession`
--

LOCK TABLES `MultiFormSession` WRITE;
/*!40000 ALTER TABLE `MultiFormSession` DISABLE KEYS */;
/*!40000 ALTER TABLE `MultiFormSession` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MultiFormStep`
--

DROP TABLE IF EXISTS `MultiFormStep`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MultiFormStep` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('MultiFormStep','EventRegisterFreeConfirmationStep','EventRegisterPaymentStep','EventRegisterTicketsStep') CHARACTER SET utf8 DEFAULT 'MultiFormStep',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `Data` mediumtext CHARACTER SET utf8,
  `SessionID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `SessionID` (`SessionID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MultiFormStep`
--

LOCK TABLES `MultiFormStep` WRITE;
/*!40000 ALTER TABLE `MultiFormStep` DISABLE KEYS */;
/*!40000 ALTER TABLE `MultiFormStep` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PayPalReturnPage`
--

DROP TABLE IF EXISTS `PayPalReturnPage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PayPalReturnPage` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SuccessContent` mediumtext CHARACTER SET utf8,
  `FailureContent` mediumtext CHARACTER SET utf8,
  `PendingContent` mediumtext CHARACTER SET utf8,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PayPalReturnPage`
--

LOCK TABLES `PayPalReturnPage` WRITE;
/*!40000 ALTER TABLE `PayPalReturnPage` DISABLE KEYS */;
INSERT INTO `PayPalReturnPage` VALUES (12,'<p>Success</p>','<p>Faildsada</p>','<p>Pending</p>');
/*!40000 ALTER TABLE `PayPalReturnPage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PayPalReturnPage_Live`
--

DROP TABLE IF EXISTS `PayPalReturnPage_Live`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PayPalReturnPage_Live` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SuccessContent` mediumtext CHARACTER SET utf8,
  `FailureContent` mediumtext CHARACTER SET utf8,
  `PendingContent` mediumtext CHARACTER SET utf8,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PayPalReturnPage_Live`
--

LOCK TABLES `PayPalReturnPage_Live` WRITE;
/*!40000 ALTER TABLE `PayPalReturnPage_Live` DISABLE KEYS */;
INSERT INTO `PayPalReturnPage_Live` VALUES (12,'<p>Success</p>','<p>Faildsada</p>','<p>Pending</p>');
/*!40000 ALTER TABLE `PayPalReturnPage_Live` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PayPalReturnPage_versions`
--

DROP TABLE IF EXISTS `PayPalReturnPage_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PayPalReturnPage_versions` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RecordID` int(11) NOT NULL DEFAULT '0',
  `Version` int(11) NOT NULL DEFAULT '0',
  `SuccessContent` mediumtext CHARACTER SET utf8,
  `FailureContent` mediumtext CHARACTER SET utf8,
  `PendingContent` mediumtext CHARACTER SET utf8,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `RecordID_Version` (`RecordID`,`Version`),
  KEY `RecordID` (`RecordID`),
  KEY `Version` (`Version`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PayPalReturnPage_versions`
--

LOCK TABLES `PayPalReturnPage_versions` WRITE;
/*!40000 ALTER TABLE `PayPalReturnPage_versions` DISABLE KEYS */;
INSERT INTO `PayPalReturnPage_versions` VALUES (1,12,2,'<p>Success</p>','<p>Fail</p>','<p>Pending</p>'),(2,12,3,'<p>Success</p>','<p>Faildsada</p>','<p>Pending</p>'),(3,12,4,'<p>Success</p>','<p>Faildsada</p>','<p>Pending</p>'),(4,12,5,'<p>Success</p>','<p>Faildsada</p>','<p>Pending</p>');
/*!40000 ALTER TABLE `PayPalReturnPage_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Permission`
--

DROP TABLE IF EXISTS `Permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Permission` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('Permission') CHARACTER SET utf8 DEFAULT 'Permission',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `Code` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Arg` int(11) NOT NULL DEFAULT '0',
  `Type` int(11) NOT NULL DEFAULT '1',
  `GroupID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `GroupID` (`GroupID`),
  KEY `Code` (`Code`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Permission`
--

LOCK TABLES `Permission` WRITE;
/*!40000 ALTER TABLE `Permission` DISABLE KEYS */;
INSERT INTO `Permission` VALUES (1,'Permission','2017-03-12 10:57:44','2017-03-12 10:57:44','CMS_ACCESS_CMSMain',0,1,1),(2,'Permission','2017-03-12 10:57:44','2017-03-12 10:57:44','CMS_ACCESS_AssetAdmin',0,1,1),(3,'Permission','2017-03-12 10:57:44','2017-03-12 10:57:44','CMS_ACCESS_ReportAdmin',0,1,1),(4,'Permission','2017-03-12 10:57:44','2017-03-12 10:57:44','SITETREE_REORGANISE',0,1,1),(5,'Permission','2017-03-12 10:57:44','2017-03-12 10:57:44','ADMIN',0,1,2);
/*!40000 ALTER TABLE `Permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PermissionRole`
--

DROP TABLE IF EXISTS `PermissionRole`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PermissionRole` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('PermissionRole') CHARACTER SET utf8 DEFAULT 'PermissionRole',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `Title` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `OnlyAdminCanApply` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PermissionRole`
--

LOCK TABLES `PermissionRole` WRITE;
/*!40000 ALTER TABLE `PermissionRole` DISABLE KEYS */;
/*!40000 ALTER TABLE `PermissionRole` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PermissionRoleCode`
--

DROP TABLE IF EXISTS `PermissionRoleCode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PermissionRoleCode` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('PermissionRoleCode') CHARACTER SET utf8 DEFAULT 'PermissionRoleCode',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `Code` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `RoleID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `RoleID` (`RoleID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PermissionRoleCode`
--

LOCK TABLES `PermissionRoleCode` WRITE;
/*!40000 ALTER TABLE `PermissionRoleCode` DISABLE KEYS */;
/*!40000 ALTER TABLE `PermissionRoleCode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RecurringDayOfMonth`
--

DROP TABLE IF EXISTS `RecurringDayOfMonth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RecurringDayOfMonth` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('RecurringDayOfMonth') CHARACTER SET utf8 DEFAULT 'RecurringDayOfMonth',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `Value` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RecurringDayOfMonth`
--

LOCK TABLES `RecurringDayOfMonth` WRITE;
/*!40000 ALTER TABLE `RecurringDayOfMonth` DISABLE KEYS */;
INSERT INTO `RecurringDayOfMonth` VALUES (1,'RecurringDayOfMonth','2017-04-11 11:49:56','2017-04-11 11:49:56',1),(2,'RecurringDayOfMonth','2017-04-11 11:49:56','2017-04-11 11:49:56',2),(3,'RecurringDayOfMonth','2017-04-11 11:49:56','2017-04-11 11:49:56',3),(4,'RecurringDayOfMonth','2017-04-11 11:49:56','2017-04-11 11:49:56',4),(5,'RecurringDayOfMonth','2017-04-11 11:49:56','2017-04-11 11:49:56',5),(6,'RecurringDayOfMonth','2017-04-11 11:49:56','2017-04-11 11:49:56',6),(7,'RecurringDayOfMonth','2017-04-11 11:49:56','2017-04-11 11:49:56',7),(8,'RecurringDayOfMonth','2017-04-11 11:49:56','2017-04-11 11:49:56',8),(9,'RecurringDayOfMonth','2017-04-11 11:49:56','2017-04-11 11:49:56',9),(10,'RecurringDayOfMonth','2017-04-11 11:49:56','2017-04-11 11:49:56',10),(11,'RecurringDayOfMonth','2017-04-11 11:49:56','2017-04-11 11:49:56',11),(12,'RecurringDayOfMonth','2017-04-11 11:49:56','2017-04-11 11:49:56',12),(13,'RecurringDayOfMonth','2017-04-11 11:49:56','2017-04-11 11:49:56',13),(14,'RecurringDayOfMonth','2017-04-11 11:49:56','2017-04-11 11:49:56',14),(15,'RecurringDayOfMonth','2017-04-11 11:49:56','2017-04-11 11:49:56',15),(16,'RecurringDayOfMonth','2017-04-11 11:49:56','2017-04-11 11:49:56',16),(17,'RecurringDayOfMonth','2017-04-11 11:49:56','2017-04-11 11:49:56',17),(18,'RecurringDayOfMonth','2017-04-11 11:49:56','2017-04-11 11:49:56',18),(19,'RecurringDayOfMonth','2017-04-11 11:49:56','2017-04-11 11:49:56',19),(20,'RecurringDayOfMonth','2017-04-11 11:49:56','2017-04-11 11:49:56',20),(21,'RecurringDayOfMonth','2017-04-11 11:49:56','2017-04-11 11:49:56',21),(22,'RecurringDayOfMonth','2017-04-11 11:49:56','2017-04-11 11:49:56',22),(23,'RecurringDayOfMonth','2017-04-11 11:49:56','2017-04-11 11:49:56',23),(24,'RecurringDayOfMonth','2017-04-11 11:49:56','2017-04-11 11:49:56',24),(25,'RecurringDayOfMonth','2017-04-11 11:49:56','2017-04-11 11:49:56',25),(26,'RecurringDayOfMonth','2017-04-11 11:49:56','2017-04-11 11:49:56',26),(27,'RecurringDayOfMonth','2017-04-11 11:49:56','2017-04-11 11:49:56',27),(28,'RecurringDayOfMonth','2017-04-11 11:49:56','2017-04-11 11:49:56',28),(29,'RecurringDayOfMonth','2017-04-11 11:49:56','2017-04-11 11:49:56',29),(30,'RecurringDayOfMonth','2017-04-11 11:49:56','2017-04-11 11:49:56',30),(31,'RecurringDayOfMonth','2017-04-11 11:49:56','2017-04-11 11:49:56',31);
/*!40000 ALTER TABLE `RecurringDayOfMonth` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RecurringDayOfWeek`
--

DROP TABLE IF EXISTS `RecurringDayOfWeek`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RecurringDayOfWeek` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('RecurringDayOfWeek') CHARACTER SET utf8 DEFAULT 'RecurringDayOfWeek',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `Value` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RecurringDayOfWeek`
--

LOCK TABLES `RecurringDayOfWeek` WRITE;
/*!40000 ALTER TABLE `RecurringDayOfWeek` DISABLE KEYS */;
INSERT INTO `RecurringDayOfWeek` VALUES (1,'RecurringDayOfWeek','2017-04-11 11:49:56','2017-04-11 11:49:56',0),(2,'RecurringDayOfWeek','2017-04-11 11:49:56','2017-04-11 11:49:56',1),(3,'RecurringDayOfWeek','2017-04-11 11:49:57','2017-04-11 11:49:57',2),(4,'RecurringDayOfWeek','2017-04-11 11:49:57','2017-04-11 11:49:57',3),(5,'RecurringDayOfWeek','2017-04-11 11:49:57','2017-04-11 11:49:57',4),(6,'RecurringDayOfWeek','2017-04-11 11:49:57','2017-04-11 11:49:57',5),(7,'RecurringDayOfWeek','2017-04-11 11:49:57','2017-04-11 11:49:57',6);
/*!40000 ALTER TABLE `RecurringDayOfWeek` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RecurringException`
--

DROP TABLE IF EXISTS `RecurringException`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RecurringException` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('RecurringException') CHARACTER SET utf8 DEFAULT 'RecurringException',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `ExceptionDate` date DEFAULT NULL,
  `CalendarEventID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `CalendarEventID` (`CalendarEventID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RecurringException`
--

LOCK TABLES `RecurringException` WRITE;
/*!40000 ALTER TABLE `RecurringException` DISABLE KEYS */;
/*!40000 ALTER TABLE `RecurringException` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RedirectorPage`
--

DROP TABLE IF EXISTS `RedirectorPage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RedirectorPage` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RedirectionType` enum('Internal','External') CHARACTER SET utf8 DEFAULT 'Internal',
  `ExternalURL` varchar(2083) CHARACTER SET utf8 DEFAULT NULL,
  `LinkToID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `LinkToID` (`LinkToID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RedirectorPage`
--

LOCK TABLES `RedirectorPage` WRITE;
/*!40000 ALTER TABLE `RedirectorPage` DISABLE KEYS */;
/*!40000 ALTER TABLE `RedirectorPage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RedirectorPage_Live`
--

DROP TABLE IF EXISTS `RedirectorPage_Live`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RedirectorPage_Live` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RedirectionType` enum('Internal','External') CHARACTER SET utf8 DEFAULT 'Internal',
  `ExternalURL` varchar(2083) CHARACTER SET utf8 DEFAULT NULL,
  `LinkToID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `LinkToID` (`LinkToID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RedirectorPage_Live`
--

LOCK TABLES `RedirectorPage_Live` WRITE;
/*!40000 ALTER TABLE `RedirectorPage_Live` DISABLE KEYS */;
/*!40000 ALTER TABLE `RedirectorPage_Live` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RedirectorPage_versions`
--

DROP TABLE IF EXISTS `RedirectorPage_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RedirectorPage_versions` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RecordID` int(11) NOT NULL DEFAULT '0',
  `Version` int(11) NOT NULL DEFAULT '0',
  `RedirectionType` enum('Internal','External') CHARACTER SET utf8 DEFAULT 'Internal',
  `ExternalURL` varchar(2083) CHARACTER SET utf8 DEFAULT NULL,
  `LinkToID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `RecordID_Version` (`RecordID`,`Version`),
  KEY `RecordID` (`RecordID`),
  KEY `Version` (`Version`),
  KEY `LinkToID` (`LinkToID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RedirectorPage_versions`
--

LOCK TABLES `RedirectorPage_versions` WRITE;
/*!40000 ALTER TABLE `RedirectorPage_versions` DISABLE KEYS */;
INSERT INTO `RedirectorPage_versions` VALUES (1,15,1,'Internal',NULL,0),(2,15,2,'External','http:///Security/logout',0),(3,15,3,'External',NULL,0);
/*!40000 ALTER TABLE `RedirectorPage_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RegistrableDateTime`
--

DROP TABLE IF EXISTS `RegistrableDateTime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RegistrableDateTime` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Capacity` int(11) NOT NULL DEFAULT '0',
  `EmailReminder` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `RemindDays` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RegistrableDateTime`
--

LOCK TABLES `RegistrableDateTime` WRITE;
/*!40000 ALTER TABLE `RegistrableDateTime` DISABLE KEYS */;
/*!40000 ALTER TABLE `RegistrableDateTime` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RegistrableDateTime_Tickets`
--

DROP TABLE IF EXISTS `RegistrableDateTime_Tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RegistrableDateTime_Tickets` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RegistrableDateTimeID` int(11) NOT NULL DEFAULT '0',
  `EventTicketID` int(11) NOT NULL DEFAULT '0',
  `Available` int(11) NOT NULL DEFAULT '0',
  `Sort` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `RegistrableDateTimeID` (`RegistrableDateTimeID`),
  KEY `EventTicketID` (`EventTicketID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RegistrableDateTime_Tickets`
--

LOCK TABLES `RegistrableDateTime_Tickets` WRITE;
/*!40000 ALTER TABLE `RegistrableDateTime_Tickets` DISABLE KEYS */;
/*!40000 ALTER TABLE `RegistrableDateTime_Tickets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RegistrableEvent`
--

DROP TABLE IF EXISTS `RegistrableEvent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RegistrableEvent` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TicketGenerator` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `OneRegPerEmail` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `RequireLoggedIn` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `RegistrationTimeLimit` int(11) NOT NULL DEFAULT '0',
  `RegEmailConfirm` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `EmailConfirmMessage` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `ConfirmTimeLimit` int(11) NOT NULL DEFAULT '0',
  `AfterConfirmTitle` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `AfterConfirmContent` mediumtext CHARACTER SET utf8,
  `UnRegEmailConfirm` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `AfterConfUnregTitle` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `AfterConfUnregContent` mediumtext CHARACTER SET utf8,
  `EmailNotifyChanges` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `NotifyChangeFields` mediumtext CHARACTER SET utf8,
  `AfterRegTitle` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `AfterRegContent` mediumtext CHARACTER SET utf8,
  `AfterUnregTitle` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `AfterUnregContent` mediumtext CHARACTER SET utf8,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RegistrableEvent`
--

LOCK TABLES `RegistrableEvent` WRITE;
/*!40000 ALTER TABLE `RegistrableEvent` DISABLE KEYS */;
INSERT INTO `RegistrableEvent` VALUES (9,NULL,0,0,900,0,'Important: You must check your emails and confirm your registration before it is valid.',21600,'Registration Confirmed','<p>Thanks! Your registration has been confirmed</p>',0,'Un-Registration Confirmed','<p>Your registration has been canceled.</p>',0,'StartDate,EndDate,StartTime,EndTime','Thanks For Registering','<p>Thanks for registering! We look forward to seeing you.</p>','Registration Canceled','<p>Your registration has been canceled.</p>');
/*!40000 ALTER TABLE `RegistrableEvent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RegistrableEvent_Live`
--

DROP TABLE IF EXISTS `RegistrableEvent_Live`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RegistrableEvent_Live` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TicketGenerator` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `OneRegPerEmail` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `RequireLoggedIn` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `RegistrationTimeLimit` int(11) NOT NULL DEFAULT '0',
  `RegEmailConfirm` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `EmailConfirmMessage` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `ConfirmTimeLimit` int(11) NOT NULL DEFAULT '0',
  `AfterConfirmTitle` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `AfterConfirmContent` mediumtext CHARACTER SET utf8,
  `UnRegEmailConfirm` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `AfterConfUnregTitle` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `AfterConfUnregContent` mediumtext CHARACTER SET utf8,
  `EmailNotifyChanges` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `NotifyChangeFields` mediumtext CHARACTER SET utf8,
  `AfterRegTitle` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `AfterRegContent` mediumtext CHARACTER SET utf8,
  `AfterUnregTitle` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `AfterUnregContent` mediumtext CHARACTER SET utf8,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RegistrableEvent_Live`
--

LOCK TABLES `RegistrableEvent_Live` WRITE;
/*!40000 ALTER TABLE `RegistrableEvent_Live` DISABLE KEYS */;
/*!40000 ALTER TABLE `RegistrableEvent_Live` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RegistrableEvent_versions`
--

DROP TABLE IF EXISTS `RegistrableEvent_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RegistrableEvent_versions` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RecordID` int(11) NOT NULL DEFAULT '0',
  `Version` int(11) NOT NULL DEFAULT '0',
  `TicketGenerator` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `OneRegPerEmail` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `RequireLoggedIn` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `RegistrationTimeLimit` int(11) NOT NULL DEFAULT '0',
  `RegEmailConfirm` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `EmailConfirmMessage` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `ConfirmTimeLimit` int(11) NOT NULL DEFAULT '0',
  `AfterConfirmTitle` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `AfterConfirmContent` mediumtext CHARACTER SET utf8,
  `UnRegEmailConfirm` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `AfterConfUnregTitle` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `AfterConfUnregContent` mediumtext CHARACTER SET utf8,
  `EmailNotifyChanges` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `NotifyChangeFields` mediumtext CHARACTER SET utf8,
  `AfterRegTitle` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `AfterRegContent` mediumtext CHARACTER SET utf8,
  `AfterUnregTitle` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `AfterUnregContent` mediumtext CHARACTER SET utf8,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `RecordID_Version` (`RecordID`,`Version`),
  KEY `RecordID` (`RecordID`),
  KEY `Version` (`Version`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RegistrableEvent_versions`
--

LOCK TABLES `RegistrableEvent_versions` WRITE;
/*!40000 ALTER TABLE `RegistrableEvent_versions` DISABLE KEYS */;
INSERT INTO `RegistrableEvent_versions` VALUES (1,9,1,NULL,0,0,900,0,'Important: You must check your emails and confirm your registration before it is valid.',21600,'Registration Confirmed','<p>Thanks! Your registration has been confirmed</p>',0,'Un-Registration Confirmed','<p>Your registration has been canceled.</p>',0,'StartDate,EndDate,StartTime,EndTime','Thanks For Registering','<p>Thanks for registering! We look forward to seeing you.</p>','Registration Canceled','<p>Your registration has been canceled.</p>');
/*!40000 ALTER TABLE `RegistrableEvent_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SiteConfig`
--

DROP TABLE IF EXISTS `SiteConfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SiteConfig` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('SiteConfig') CHARACTER SET utf8 DEFAULT 'SiteConfig',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `Title` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Tagline` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Theme` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `CanViewType` enum('Anyone','LoggedInUsers','OnlyTheseUsers') CHARACTER SET utf8 DEFAULT 'Anyone',
  `CanEditType` enum('LoggedInUsers','OnlyTheseUsers') CHARACTER SET utf8 DEFAULT 'LoggedInUsers',
  `CanCreateTopLevelType` enum('LoggedInUsers','OnlyTheseUsers') CHARACTER SET utf8 DEFAULT 'LoggedInUsers',
  `MiniCartEmail` mediumtext CHARACTER SET utf8,
  `MiniCartCurrency` mediumtext CHARACTER SET utf8,
  `MiniCartTestMode` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `MiniCartReturnPageID` int(11) NOT NULL DEFAULT '0',
  `MiniCartCancelPageID` int(11) NOT NULL DEFAULT '0',
  `MiniCartAuthToken` mediumtext CHARACTER SET utf8,
  PRIMARY KEY (`ID`),
  KEY `ClassName` (`ClassName`),
  KEY `MiniCartReturnPageID` (`MiniCartReturnPageID`),
  KEY `MiniCartCancelPageID` (`MiniCartCancelPageID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SiteConfig`
--

LOCK TABLES `SiteConfig` WRITE;
/*!40000 ALTER TABLE `SiteConfig` DISABLE KEYS */;
INSERT INTO `SiteConfig` VALUES (1,'SiteConfig','2017-07-23 13:31:40','2017-03-12 10:57:44','GFSG','Gifted Families Support Group','simple2','Anyone','LoggedInUsers','LoggedInUsers','treasurer@gfsg.org.au','AUD',0,12,12,'5dIpIn0ctzcmUN72E1mxmo1YsixEcNKGlPGI2Db2EDFE5uZXOnFcTbe-qSe');
/*!40000 ALTER TABLE `SiteConfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SiteConfig_CreateTopLevelGroups`
--

DROP TABLE IF EXISTS `SiteConfig_CreateTopLevelGroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SiteConfig_CreateTopLevelGroups` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SiteConfigID` int(11) NOT NULL DEFAULT '0',
  `GroupID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `SiteConfigID` (`SiteConfigID`),
  KEY `GroupID` (`GroupID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SiteConfig_CreateTopLevelGroups`
--

LOCK TABLES `SiteConfig_CreateTopLevelGroups` WRITE;
/*!40000 ALTER TABLE `SiteConfig_CreateTopLevelGroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `SiteConfig_CreateTopLevelGroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SiteConfig_EditorGroups`
--

DROP TABLE IF EXISTS `SiteConfig_EditorGroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SiteConfig_EditorGroups` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SiteConfigID` int(11) NOT NULL DEFAULT '0',
  `GroupID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `SiteConfigID` (`SiteConfigID`),
  KEY `GroupID` (`GroupID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SiteConfig_EditorGroups`
--

LOCK TABLES `SiteConfig_EditorGroups` WRITE;
/*!40000 ALTER TABLE `SiteConfig_EditorGroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `SiteConfig_EditorGroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SiteConfig_ViewerGroups`
--

DROP TABLE IF EXISTS `SiteConfig_ViewerGroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SiteConfig_ViewerGroups` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SiteConfigID` int(11) NOT NULL DEFAULT '0',
  `GroupID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `SiteConfigID` (`SiteConfigID`),
  KEY `GroupID` (`GroupID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SiteConfig_ViewerGroups`
--

LOCK TABLES `SiteConfig_ViewerGroups` WRITE;
/*!40000 ALTER TABLE `SiteConfig_ViewerGroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `SiteConfig_ViewerGroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SiteTree`
--

DROP TABLE IF EXISTS `SiteTree`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SiteTree` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('SiteTree','Page','MemberProfilePage','MembershipContainerPage','PayPalReturnPage','Calendar','CalendarEvent','RegistrableEvent','ErrorPage','RedirectorPage','VirtualPage') CHARACTER SET utf8 DEFAULT 'SiteTree',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `URLSegment` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Title` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `MenuTitle` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `Content` mediumtext CHARACTER SET utf8,
  `MetaDescription` mediumtext CHARACTER SET utf8,
  `ExtraMeta` mediumtext CHARACTER SET utf8,
  `ShowInMenus` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ShowInSearch` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `Sort` int(11) NOT NULL DEFAULT '0',
  `HasBrokenFile` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `HasBrokenLink` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ReportClass` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `CanViewType` enum('Anyone','LoggedInUsers','OnlyTheseUsers','Inherit') CHARACTER SET utf8 DEFAULT 'Inherit',
  `CanEditType` enum('LoggedInUsers','OnlyTheseUsers','Inherit') CHARACTER SET utf8 DEFAULT 'Inherit',
  `Version` int(11) NOT NULL DEFAULT '0',
  `ParentID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `ParentID` (`ParentID`),
  KEY `URLSegment` (`URLSegment`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SiteTree`
--

LOCK TABLES `SiteTree` WRITE;
/*!40000 ALTER TABLE `SiteTree` DISABLE KEYS */;
INSERT INTO `SiteTree` VALUES (1,'Page','2017-07-19 12:27:42','2017-03-12 10:57:44','home','Home',NULL,'<p>Gifted Families Support Group Incorporated is a not for profit association designed to support families and educators of gifted children. Run solely by volunteers, GFSG Inc. focusses on bringing together ‘like-minds’, providing a vast array of supportive events and highlighting the needs of gifted children within our community.</p><p class=\"p1\"><span class=\"s1\">GFSG Inc. is affiliated with the Australian Association for the Education of Gifted and Talented Children (AAEGT) and represents NSW on the AAEGT Board. Through this affiliation, GFSG Inc. is able to expand the support we give to our members by taking their concerns to a national level and open up new opportunities. All our members automatically become members of the AAEGT, with options to subscribe to their biannual journal at members rates, and to receive discounts to events hosted by other gifted associations.</span></p><p class=\"p1\"><span class=\"s1\">GFSG Inc. is also affiliated with GLD Australia; a national online learning community responding to the needs of gifted children and gifted adults with specific learning disability and other learning challenges.</span></p><p class=\"p1\"><span class=\"s1\">To attend a GFSG Inc. event, children are not required to sit an IQ test.  Given our current website upgrade, it may be easiest to view the events calendar, including South-Coast Sub Branch events, here: <a href=\"https://www.gfsg.org.au/images/calendar_jan-june.pdf\">EVENTS CALENDAR JAN-JUNE 2017.</a>  (Be sure to check regularly for updates and changes.)  Be sure to also check out the \"news and events\" section below for our upcoming celebrations, and the \"sub branch\" tab above for more from the south coast!</span></p><p class=\"p1\"><span class=\"s1\">GFSG Inc. is a place where we hope you can feel ‘at home’ in a world where our children often seem the ‘odd ones out’.</span></p><p class=\"p1\"><span class=\"s1\">Melinda Gindy- President of GFSG Inc.</span></p>',NULL,NULL,1,1,1,0,0,NULL,'Inherit','Inherit',2,0),(3,'Page','2017-07-19 12:27:43','2017-03-12 10:57:44','contact-us','Contact Us',NULL,'<div class=\"page-header\">\n<h2>Who are We?</h2>\n</div><div class=\"widget-wrapper widget-element free-text diy-resizable \">\n<div id=\"\" class=\"widget-body \">\n<div class=\"freetextarea\">\n<div><strong>GFSG Inc. Committee</strong><br><br></div>\n<div><span><span>President : Melinda Gindy -  </span></span><span><span id=\"cloak86f043309e0d8eb4ea82f94f756a20fd\"><a href=\"mailto:president@gfsg.org.au\">president@gfsg.org.au</a></span> <br></span><span>Vice President: Rebecca McKeon -  </span><span id=\"cloak4a00ab9847af6849dbcd8dd4f5407bc9\"><a href=\"mailto:vicepresident@gfsg.org.au\">vicepresident@gfsg.org.au</a></span><span> <br></span><span>Secretary: Kylieanne Derwent -  </span><span id=\"cloak0dcb4608c73a99db935ac49678905a7a\"><a href=\"mailto:secretary@gfsg.org.au\">secretary@gfsg.org.au</a></span><span> <br></span><span>Treasurer: Cindy Lousada -  </span><span id=\"cloak9ddd99c51205742cf1f149bd00690227\"><a href=\"mailto:treasurer@gfsg.org.au\">treasurer@gfsg.org.au</a></span><span> <br></span><span>Public Officer: Helen Wastie -  </span><span id=\"cloak7e11f5fbce30224965683f26544ac194\"><a href=\"mailto:publicofficer@gfsg.org.au\">publicofficer@gfsg.org.au</a></span><span> <br></span><span>Library Manager: Elizabeth Barns -  </span><span id=\"cloak8786d91dfd472be8d2cf3249dde3fbcf\"><a href=\"mailto:library@gfsg.org.au\">library@gfsg.org.au</a></span><span> <br></span><span>Little GEMs Co-ordinator: Alison Therkildsen -  </span><span id=\"cloak5e21a0e26c7361dbc4be0ed53a367982\"><a href=\"mailto:littlegems@gfsg.org.au\">littlegems@gfsg.org.au</a></span><span><br></span><span>Sub-branch Liaison: Rebecca McKeon -  </span><span><span id=\"cloaka8b3773332084371be26d0a2f08f5c23\"><a href=\"mailto:subbranchliaison@gfsg.org.au\">subbranchliaison@gfsg.org.au</a></span> </span></div>\n<div><span>Web administrator: Katie Viviers - <a href=\"mailto:webadmin@gfsg.org.au?subject=Contact%20us\">webadmin@gfsg.org.au</a></span></div>\n</div>\n</div>\n</div><div class=\"widget-wrapper widget-element free-text diy-resizable \">\n<div id=\"\" class=\"widget-body \">\n<div class=\"freetextarea\">\n<div><span>AAEGT NSW State Board Representative and AAEGT Vice President: Melinda Gindy</span></div>\n<div> </div>\n<div> </div>\n<div><strong>Sub-Branches</strong></div>\n<div><span>South Coast -  </span><span id=\"cloakf69753077d4233d2d5066767f93bd04f\"><a href=\"mailto:subbranchliaison@gfsg.org.au\">southcoast@gfsg.org.au</a></span></div>\n<div><span>Illawarra - <a href=\"mailto:illawarra@gfsg.org.au\">illawarra@gfsg.org.au</a></span></div>\n</div>\n</div>\n</div>',NULL,NULL,1,1,2,0,0,NULL,'Inherit','Inherit',3,0),(4,'ErrorPage','2017-07-19 12:27:43','2017-03-12 10:57:44','page-not-found','Page not found',NULL,'<p>Sorry, it seems you were trying to access a page that doesn\'t exist.</p><p>Please check the spelling of the URL you were trying to access and try again.</p>',NULL,NULL,0,0,3,0,0,NULL,'Inherit','Inherit',1,0),(5,'ErrorPage','2017-07-19 12:27:43','2017-03-12 10:57:45','server-error','Server error',NULL,'<p>Sorry, there was a problem with handling your request.</p>',NULL,NULL,0,0,4,0,0,NULL,'Inherit','Inherit',1,0),(6,'MemberProfilePage','2017-07-23 20:32:01','2017-04-11 11:36:24','register','Register',NULL,NULL,NULL,NULL,1,1,5,0,0,NULL,'Inherit','Inherit',6,0),(7,'Calendar','2017-07-23 13:03:12','2017-04-11 11:50:23','gfsg-events','GFSG Events',NULL,NULL,NULL,NULL,1,1,7,0,0,NULL,'Inherit','Inherit',3,0),(8,'CalendarEvent','2017-07-19 12:27:42','2017-04-11 11:51:22','website-opening','Website opening',NULL,NULL,NULL,NULL,1,1,1,0,0,NULL,'Inherit','Inherit',2,7),(9,'RegistrableEvent','2017-07-19 12:27:42','2017-04-11 11:52:45','new-registrable-event','New Registrable Event',NULL,NULL,NULL,NULL,1,1,2,0,0,NULL,'Inherit','Inherit',1,7),(12,'PayPalReturnPage','2017-07-23 12:52:01','2017-07-14 12:39:20','new-pay-pal-return-page','New Pay Pal Return Page',NULL,NULL,NULL,NULL,0,0,8,0,0,NULL,'Inherit','Inherit',5,0),(13,'Page','2017-07-19 12:27:43','2017-07-16 15:38:28','members-only','Members Only',NULL,NULL,NULL,NULL,1,1,6,0,0,NULL,'LoggedInUsers','Inherit',4,0),(21,'MembershipContainerPage','2017-07-23 12:59:33','2017-07-19 13:49:05','purchase-membership','Purchase Membership',NULL,'<p>Please choose from one of the following memberships</p>',NULL,NULL,1,1,3,0,0,NULL,'Inherit','Inherit',6,13);
/*!40000 ALTER TABLE `SiteTree` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SiteTree_EditorGroups`
--

DROP TABLE IF EXISTS `SiteTree_EditorGroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SiteTree_EditorGroups` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SiteTreeID` int(11) NOT NULL DEFAULT '0',
  `GroupID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `SiteTreeID` (`SiteTreeID`),
  KEY `GroupID` (`GroupID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SiteTree_EditorGroups`
--

LOCK TABLES `SiteTree_EditorGroups` WRITE;
/*!40000 ALTER TABLE `SiteTree_EditorGroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `SiteTree_EditorGroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SiteTree_ImageTracking`
--

DROP TABLE IF EXISTS `SiteTree_ImageTracking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SiteTree_ImageTracking` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SiteTreeID` int(11) NOT NULL DEFAULT '0',
  `FileID` int(11) NOT NULL DEFAULT '0',
  `FieldName` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `SiteTreeID` (`SiteTreeID`),
  KEY `FileID` (`FileID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SiteTree_ImageTracking`
--

LOCK TABLES `SiteTree_ImageTracking` WRITE;
/*!40000 ALTER TABLE `SiteTree_ImageTracking` DISABLE KEYS */;
/*!40000 ALTER TABLE `SiteTree_ImageTracking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SiteTree_LinkTracking`
--

DROP TABLE IF EXISTS `SiteTree_LinkTracking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SiteTree_LinkTracking` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SiteTreeID` int(11) NOT NULL DEFAULT '0',
  `ChildID` int(11) NOT NULL DEFAULT '0',
  `FieldName` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `SiteTreeID` (`SiteTreeID`),
  KEY `ChildID` (`ChildID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SiteTree_LinkTracking`
--

LOCK TABLES `SiteTree_LinkTracking` WRITE;
/*!40000 ALTER TABLE `SiteTree_LinkTracking` DISABLE KEYS */;
/*!40000 ALTER TABLE `SiteTree_LinkTracking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SiteTree_Live`
--

DROP TABLE IF EXISTS `SiteTree_Live`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SiteTree_Live` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('SiteTree','Page','MemberProfilePage','MembershipContainerPage','PayPalReturnPage','Calendar','CalendarEvent','RegistrableEvent','ErrorPage','RedirectorPage','VirtualPage') CHARACTER SET utf8 DEFAULT 'SiteTree',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `URLSegment` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Title` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `MenuTitle` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `Content` mediumtext CHARACTER SET utf8,
  `MetaDescription` mediumtext CHARACTER SET utf8,
  `ExtraMeta` mediumtext CHARACTER SET utf8,
  `ShowInMenus` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ShowInSearch` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `Sort` int(11) NOT NULL DEFAULT '0',
  `HasBrokenFile` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `HasBrokenLink` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ReportClass` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `CanViewType` enum('Anyone','LoggedInUsers','OnlyTheseUsers','Inherit') CHARACTER SET utf8 DEFAULT 'Inherit',
  `CanEditType` enum('LoggedInUsers','OnlyTheseUsers','Inherit') CHARACTER SET utf8 DEFAULT 'Inherit',
  `Version` int(11) NOT NULL DEFAULT '0',
  `ParentID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `ParentID` (`ParentID`),
  KEY `URLSegment` (`URLSegment`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SiteTree_Live`
--

LOCK TABLES `SiteTree_Live` WRITE;
/*!40000 ALTER TABLE `SiteTree_Live` DISABLE KEYS */;
INSERT INTO `SiteTree_Live` VALUES (1,'Page','2017-04-23 23:42:12','2017-03-12 10:57:44','home','Home',NULL,'<p>Gifted Families Support Group Incorporated is a not for profit association designed to support families and educators of gifted children. Run solely by volunteers, GFSG Inc. focusses on bringing together ‘like-minds’, providing a vast array of supportive events and highlighting the needs of gifted children within our community.</p><p class=\"p1\"><span class=\"s1\">GFSG Inc. is affiliated with the Australian Association for the Education of Gifted and Talented Children (AAEGT) and represents NSW on the AAEGT Board. Through this affiliation, GFSG Inc. is able to expand the support we give to our members by taking their concerns to a national level and open up new opportunities. All our members automatically become members of the AAEGT, with options to subscribe to their biannual journal at members rates, and to receive discounts to events hosted by other gifted associations.</span></p><p class=\"p1\"><span class=\"s1\">GFSG Inc. is also affiliated with GLD Australia; a national online learning community responding to the needs of gifted children and gifted adults with specific learning disability and other learning challenges.</span></p><p class=\"p1\"><span class=\"s1\">To attend a GFSG Inc. event, children are not required to sit an IQ test.  Given our current website upgrade, it may be easiest to view the events calendar, including South-Coast Sub Branch events, here: <a href=\"https://www.gfsg.org.au/images/calendar_jan-june.pdf\">EVENTS CALENDAR JAN-JUNE 2017.</a>  (Be sure to check regularly for updates and changes.)  Be sure to also check out the \"news and events\" section below for our upcoming celebrations, and the \"sub branch\" tab above for more from the south coast!</span></p><p class=\"p1\"><span class=\"s1\">GFSG Inc. is a place where we hope you can feel ‘at home’ in a world where our children often seem the ‘odd ones out’.</span></p><p class=\"p1\"><span class=\"s1\">Melinda Gindy- President of GFSG Inc.</span></p>',NULL,NULL,1,1,1,0,0,NULL,'Inherit','Inherit',2,0),(3,'Page','2017-04-23 23:43:58','2017-03-12 10:57:44','contact-us','Contact Us',NULL,'<div class=\"page-header\">\n<h2>Who are We?</h2>\n</div><div class=\"widget-wrapper widget-element free-text diy-resizable \">\n<div id=\"\" class=\"widget-body \">\n<div class=\"freetextarea\">\n<div>GFSG Inc. Committee<br><br></div>\n<div><span><span>President : Melinda Gindy -  </span></span><span><span id=\"cloak86f043309e0d8eb4ea82f94f756a20fd\"><a href=\"mailto:president@gfsg.org.au\">president@gfsg.org.au</a></span> <br></span><span>Vice President: Rebecca McKeon -  </span><span id=\"cloak4a00ab9847af6849dbcd8dd4f5407bc9\"><a href=\"mailto:vicepresident@gfsg.org.au\">vicepresident@gfsg.org.au</a></span><span> <br></span><span>Secretary: Kylieanne Derwent -  </span><span id=\"cloak0dcb4608c73a99db935ac49678905a7a\"><a href=\"mailto:secretary@gfsg.org.au\">secretary@gfsg.org.au</a></span><span> <br></span><span>Treasurer: Cindy Lousada -  </span><span id=\"cloak9ddd99c51205742cf1f149bd00690227\"><a href=\"mailto:treasurer@gfsg.org.au\">treasurer@gfsg.org.au</a></span><span> <br></span><span>Public Officer: Helen Wastie -  </span><span id=\"cloak7e11f5fbce30224965683f26544ac194\"><a href=\"mailto:publicofficer@gfsg.org.au\">publicofficer@gfsg.org.au</a></span><span> <br></span><span>Library Manager: Elizabeth Barns -  </span><span id=\"cloak8786d91dfd472be8d2cf3249dde3fbcf\"><a href=\"mailto:library@gfsg.org.au\">library@gfsg.org.au</a></span><span> <br></span><span>Little GEMs Co-ordinator: Alison Therkildsen -  </span><span id=\"cloak5e21a0e26c7361dbc4be0ed53a367982\"><a href=\"mailto:littlegems@gfsg.org.au\">littlegems@gfsg.org.au</a></span><span><br></span><span>Sub-branch Liaison: Rebecca McKeon -  </span><span><span id=\"cloaka8b3773332084371be26d0a2f08f5c23\"><a href=\"mailto:subbranchliaison@gfsg.org.au\">subbranchliaison@gfsg.org.au</a></span> </span></div>\n</div>\n</div>\n</div><div class=\"widget-wrapper widget-element free-text diy-resizable \">\n<div id=\"\" class=\"widget-body \">\n<div class=\"freetextarea\">\n<div><span>AAEGT NSW State Board Representative and AAEGT Vice President: Melinda Gindy</span></div>\n<div> </div>\n<div> </div>\n<div>Sub-branches</div>\n<div><span>South Coast -  </span><span id=\"cloakf69753077d4233d2d5066767f93bd04f\"><a href=\"mailto:subbranchliaison@gfsg.org.au\">southcoast@gfsg.org.au</a></span></div>\n</div>\n</div>\n</div>',NULL,NULL,1,1,2,0,0,NULL,'Inherit','Inherit',2,0),(4,'ErrorPage','2017-03-12 10:57:49','2017-03-12 10:57:44','page-not-found','Page not found',NULL,'<p>Sorry, it seems you were trying to access a page that doesn\'t exist.</p><p>Please check the spelling of the URL you were trying to access and try again.</p>',NULL,NULL,0,0,3,0,0,NULL,'Inherit','Inherit',1,0),(5,'ErrorPage','2017-03-12 10:57:45','2017-03-12 10:57:45','server-error','Server error',NULL,'<p>Sorry, there was a problem with handling your request.</p>',NULL,NULL,0,0,4,0,0,NULL,'Inherit','Inherit',1,0),(6,'MemberProfilePage','2017-07-23 20:32:01','2017-04-11 11:36:24','register','Register',NULL,NULL,NULL,NULL,1,1,5,0,0,NULL,'Inherit','Inherit',6,0),(7,'Calendar','2017-07-23 13:03:12','2017-04-11 11:50:23','gfsg-events','GFSG Events',NULL,NULL,NULL,NULL,1,1,7,0,0,NULL,'Inherit','Inherit',3,0),(8,'CalendarEvent','2017-04-11 11:52:11','2017-04-11 11:51:22','website-opening','Website opening',NULL,NULL,NULL,NULL,1,1,1,0,0,NULL,'Inherit','Inherit',2,7),(12,'PayPalReturnPage','2017-07-23 12:51:57','2017-07-14 12:39:20','new-pay-pal-return-page','New Pay Pal Return Page',NULL,NULL,NULL,NULL,0,0,8,0,0,NULL,'Inherit','Inherit',4,0),(13,'Page','2017-07-16 15:51:51','2017-07-16 15:38:28','members-only','Members Only',NULL,NULL,NULL,NULL,1,1,6,0,0,NULL,'LoggedInUsers','Inherit',4,0),(21,'MembershipContainerPage','2017-07-23 12:59:33','2017-07-19 13:49:05','purchase-membership','Purchase Membership',NULL,'<p>Please choose from one of the following memberships</p>',NULL,NULL,1,1,3,0,0,NULL,'Inherit','Inherit',6,13);
/*!40000 ALTER TABLE `SiteTree_Live` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SiteTree_ViewerGroups`
--

DROP TABLE IF EXISTS `SiteTree_ViewerGroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SiteTree_ViewerGroups` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SiteTreeID` int(11) NOT NULL DEFAULT '0',
  `GroupID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `SiteTreeID` (`SiteTreeID`),
  KEY `GroupID` (`GroupID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SiteTree_ViewerGroups`
--

LOCK TABLES `SiteTree_ViewerGroups` WRITE;
/*!40000 ALTER TABLE `SiteTree_ViewerGroups` DISABLE KEYS */;
INSERT INTO `SiteTree_ViewerGroups` VALUES (2,16,3);
/*!40000 ALTER TABLE `SiteTree_ViewerGroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SiteTree_versions`
--

DROP TABLE IF EXISTS `SiteTree_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SiteTree_versions` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RecordID` int(11) NOT NULL DEFAULT '0',
  `Version` int(11) NOT NULL DEFAULT '0',
  `WasPublished` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `AuthorID` int(11) NOT NULL DEFAULT '0',
  `PublisherID` int(11) NOT NULL DEFAULT '0',
  `ClassName` enum('SiteTree','Page','MemberProfilePage','MembershipContainerPage','PayPalReturnPage','Calendar','CalendarEvent','RegistrableEvent','ErrorPage','RedirectorPage','VirtualPage') CHARACTER SET utf8 DEFAULT 'SiteTree',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `URLSegment` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Title` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `MenuTitle` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `Content` mediumtext CHARACTER SET utf8,
  `MetaDescription` mediumtext CHARACTER SET utf8,
  `ExtraMeta` mediumtext CHARACTER SET utf8,
  `ShowInMenus` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ShowInSearch` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `Sort` int(11) NOT NULL DEFAULT '0',
  `HasBrokenFile` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `HasBrokenLink` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ReportClass` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `CanViewType` enum('Anyone','LoggedInUsers','OnlyTheseUsers','Inherit') CHARACTER SET utf8 DEFAULT 'Inherit',
  `CanEditType` enum('LoggedInUsers','OnlyTheseUsers','Inherit') CHARACTER SET utf8 DEFAULT 'Inherit',
  `ParentID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `RecordID_Version` (`RecordID`,`Version`),
  KEY `RecordID` (`RecordID`),
  KEY `Version` (`Version`),
  KEY `AuthorID` (`AuthorID`),
  KEY `PublisherID` (`PublisherID`),
  KEY `ParentID` (`ParentID`),
  KEY `URLSegment` (`URLSegment`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SiteTree_versions`
--

LOCK TABLES `SiteTree_versions` WRITE;
/*!40000 ALTER TABLE `SiteTree_versions` DISABLE KEYS */;
INSERT INTO `SiteTree_versions` VALUES (1,1,1,1,0,0,'Page','2017-03-12 10:57:44','2017-03-12 10:57:44','home','Home',NULL,'<p>Welcome to SilverStripe! This is the default homepage. You can edit this page by opening <a href=\"admin/\">the CMS</a>.</p><p>You can now access the <a href=\"http://docs.silverstripe.org\">developer documentation</a>, or begin the <a href=\"http://www.silverstripe.org/learn/lessons\">SilverStripe lessons</a>.</p>',NULL,NULL,1,1,1,0,0,NULL,'Inherit','Inherit',0),(2,2,1,1,0,0,'Page','2017-03-12 10:57:44','2017-03-12 10:57:44','about-us','About Us',NULL,'<p>You can fill this page out with your own content, or delete it and create your own pages.<br></p>',NULL,NULL,1,1,2,0,0,NULL,'Inherit','Inherit',0),(3,3,1,1,0,0,'Page','2017-03-12 10:57:44','2017-03-12 10:57:44','contact-us','Contact Us',NULL,'<p>You can fill this page out with your own content, or delete it and create your own pages.<br></p>',NULL,NULL,1,1,3,0,0,NULL,'Inherit','Inherit',0),(4,4,1,1,0,0,'ErrorPage','2017-03-12 10:57:44','2017-03-12 10:57:44','page-not-found','Page not found',NULL,'<p>Sorry, it seems you were trying to access a page that doesn\'t exist.</p><p>Please check the spelling of the URL you were trying to access and try again.</p>',NULL,NULL,0,0,4,0,0,NULL,'Inherit','Inherit',0),(5,5,1,1,0,0,'ErrorPage','2017-03-12 10:57:45','2017-03-12 10:57:45','server-error','Server error',NULL,'<p>Sorry, there was a problem with handling your request.</p>',NULL,NULL,0,0,5,0,0,NULL,'Inherit','Inherit',0),(6,6,1,0,2,0,'MemberProfilePage','2017-04-11 11:36:24','2017-04-11 11:36:24','new-member-profile-page','New Member Profile Page',NULL,NULL,NULL,NULL,1,1,6,0,0,NULL,'Inherit','Inherit',0),(7,6,2,1,2,2,'MemberProfilePage','2017-04-11 11:37:48','2017-04-11 11:36:24','new-member-profile-page','New Member Profile Page',NULL,NULL,NULL,NULL,1,1,6,0,0,NULL,'Inherit','Inherit',0),(8,7,1,0,2,0,'Calendar','2017-04-11 11:50:23','2017-04-11 11:50:23','new-calendar','New Calendar',NULL,NULL,NULL,NULL,1,1,7,0,0,NULL,'Inherit','Inherit',0),(9,7,2,1,2,2,'Calendar','2017-04-11 11:50:45','2017-04-11 11:50:23','gfsg-events','GFSG Events',NULL,NULL,NULL,NULL,1,1,7,0,0,NULL,'Inherit','Inherit',0),(10,8,1,0,2,0,'CalendarEvent','2017-04-11 11:51:22','2017-04-11 11:51:22','new-calendar-event','New Calendar Event',NULL,NULL,NULL,NULL,1,1,1,0,0,NULL,'Inherit','Inherit',7),(11,8,2,1,2,2,'CalendarEvent','2017-04-11 11:51:46','2017-04-11 11:51:22','website-opening','Website opening',NULL,NULL,NULL,NULL,1,1,1,0,0,NULL,'Inherit','Inherit',7),(12,9,1,0,2,0,'RegistrableEvent','2017-04-11 11:52:45','2017-04-11 11:52:45','new-registrable-event','New Registrable Event',NULL,NULL,NULL,NULL,1,1,2,0,0,NULL,'Inherit','Inherit',7),(13,1,2,1,2,2,'Page','2017-04-23 23:42:12','2017-03-12 10:57:44','home','Home',NULL,'<p>Gifted Families Support Group Incorporated is a not for profit association designed to support families and educators of gifted children. Run solely by volunteers, GFSG Inc. focusses on bringing together ‘like-minds’, providing a vast array of supportive events and highlighting the needs of gifted children within our community.</p><p class=\"p1\"><span class=\"s1\">GFSG Inc. is affiliated with the Australian Association for the Education of Gifted and Talented Children (AAEGT) and represents NSW on the AAEGT Board. Through this affiliation, GFSG Inc. is able to expand the support we give to our members by taking their concerns to a national level and open up new opportunities. All our members automatically become members of the AAEGT, with options to subscribe to their biannual journal at members rates, and to receive discounts to events hosted by other gifted associations.</span></p><p class=\"p1\"><span class=\"s1\">GFSG Inc. is also affiliated with GLD Australia; a national online learning community responding to the needs of gifted children and gifted adults with specific learning disability and other learning challenges.</span></p><p class=\"p1\"><span class=\"s1\">To attend a GFSG Inc. event, children are not required to sit an IQ test.  Given our current website upgrade, it may be easiest to view the events calendar, including South-Coast Sub Branch events, here: <a href=\"https://www.gfsg.org.au/images/calendar_jan-june.pdf\">EVENTS CALENDAR JAN-JUNE 2017.</a>  (Be sure to check regularly for updates and changes.)  Be sure to also check out the \"news and events\" section below for our upcoming celebrations, and the \"sub branch\" tab above for more from the south coast!</span></p><p class=\"p1\"><span class=\"s1\">GFSG Inc. is a place where we hope you can feel ‘at home’ in a world where our children often seem the ‘odd ones out’.</span></p><p class=\"p1\"><span class=\"s1\">Melinda Gindy- President of GFSG Inc.</span></p>',NULL,NULL,1,1,1,0,0,NULL,'Inherit','Inherit',0),(14,3,2,1,2,2,'Page','2017-04-23 23:43:58','2017-03-12 10:57:44','contact-us','Contact Us',NULL,'<div class=\"page-header\">\n<h2>Who are We?</h2>\n</div><div class=\"widget-wrapper widget-element free-text diy-resizable \">\n<div id=\"\" class=\"widget-body \">\n<div class=\"freetextarea\">\n<div>GFSG Inc. Committee<br><br></div>\n<div><span><span>President : Melinda Gindy -  </span></span><span><span id=\"cloak86f043309e0d8eb4ea82f94f756a20fd\"><a href=\"mailto:president@gfsg.org.au\">president@gfsg.org.au</a></span> <br></span><span>Vice President: Rebecca McKeon -  </span><span id=\"cloak4a00ab9847af6849dbcd8dd4f5407bc9\"><a href=\"mailto:vicepresident@gfsg.org.au\">vicepresident@gfsg.org.au</a></span><span> <br></span><span>Secretary: Kylieanne Derwent -  </span><span id=\"cloak0dcb4608c73a99db935ac49678905a7a\"><a href=\"mailto:secretary@gfsg.org.au\">secretary@gfsg.org.au</a></span><span> <br></span><span>Treasurer: Cindy Lousada -  </span><span id=\"cloak9ddd99c51205742cf1f149bd00690227\"><a href=\"mailto:treasurer@gfsg.org.au\">treasurer@gfsg.org.au</a></span><span> <br></span><span>Public Officer: Helen Wastie -  </span><span id=\"cloak7e11f5fbce30224965683f26544ac194\"><a href=\"mailto:publicofficer@gfsg.org.au\">publicofficer@gfsg.org.au</a></span><span> <br></span><span>Library Manager: Elizabeth Barns -  </span><span id=\"cloak8786d91dfd472be8d2cf3249dde3fbcf\"><a href=\"mailto:library@gfsg.org.au\">library@gfsg.org.au</a></span><span> <br></span><span>Little GEMs Co-ordinator: Alison Therkildsen -  </span><span id=\"cloak5e21a0e26c7361dbc4be0ed53a367982\"><a href=\"mailto:littlegems@gfsg.org.au\">littlegems@gfsg.org.au</a></span><span><br></span><span>Sub-branch Liaison: Rebecca McKeon -  </span><span><span id=\"cloaka8b3773332084371be26d0a2f08f5c23\"><a href=\"mailto:subbranchliaison@gfsg.org.au\">subbranchliaison@gfsg.org.au</a></span> </span></div>\n</div>\n</div>\n</div><div class=\"widget-wrapper widget-element free-text diy-resizable \">\n<div id=\"\" class=\"widget-body \">\n<div class=\"freetextarea\">\n<div><span>AAEGT NSW State Board Representative and AAEGT Vice President: Melinda Gindy</span></div>\n<div> </div>\n<div> </div>\n<div>Sub-branches</div>\n<div><span>South Coast -  </span><span id=\"cloakf69753077d4233d2d5066767f93bd04f\"><a href=\"mailto:subbranchliaison@gfsg.org.au\">southcoast@gfsg.org.au</a></span></div>\n</div>\n</div>\n</div>',NULL,NULL,1,1,3,0,0,NULL,'Inherit','Inherit',0),(15,3,3,0,3,0,'Page','2017-06-06 19:46:38','2017-03-12 10:57:44','contact-us','Contact Us',NULL,'<div class=\"page-header\">\n<h2>Who are We?</h2>\n</div><div class=\"widget-wrapper widget-element free-text diy-resizable \">\n<div id=\"\" class=\"widget-body \">\n<div class=\"freetextarea\">\n<div><strong>GFSG Inc. Committee</strong><br><br></div>\n<div><span><span>President : Melinda Gindy -  </span></span><span><span id=\"cloak86f043309e0d8eb4ea82f94f756a20fd\"><a href=\"mailto:president@gfsg.org.au\">president@gfsg.org.au</a></span> <br></span><span>Vice President: Rebecca McKeon -  </span><span id=\"cloak4a00ab9847af6849dbcd8dd4f5407bc9\"><a href=\"mailto:vicepresident@gfsg.org.au\">vicepresident@gfsg.org.au</a></span><span> <br></span><span>Secretary: Kylieanne Derwent -  </span><span id=\"cloak0dcb4608c73a99db935ac49678905a7a\"><a href=\"mailto:secretary@gfsg.org.au\">secretary@gfsg.org.au</a></span><span> <br></span><span>Treasurer: Cindy Lousada -  </span><span id=\"cloak9ddd99c51205742cf1f149bd00690227\"><a href=\"mailto:treasurer@gfsg.org.au\">treasurer@gfsg.org.au</a></span><span> <br></span><span>Public Officer: Helen Wastie -  </span><span id=\"cloak7e11f5fbce30224965683f26544ac194\"><a href=\"mailto:publicofficer@gfsg.org.au\">publicofficer@gfsg.org.au</a></span><span> <br></span><span>Library Manager: Elizabeth Barns -  </span><span id=\"cloak8786d91dfd472be8d2cf3249dde3fbcf\"><a href=\"mailto:library@gfsg.org.au\">library@gfsg.org.au</a></span><span> <br></span><span>Little GEMs Co-ordinator: Alison Therkildsen -  </span><span id=\"cloak5e21a0e26c7361dbc4be0ed53a367982\"><a href=\"mailto:littlegems@gfsg.org.au\">littlegems@gfsg.org.au</a></span><span><br></span><span>Sub-branch Liaison: Rebecca McKeon -  </span><span><span id=\"cloaka8b3773332084371be26d0a2f08f5c23\"><a href=\"mailto:subbranchliaison@gfsg.org.au\">subbranchliaison@gfsg.org.au</a></span> </span></div>\n<div><span>Web administrator: Katie Viviers - <a href=\"mailto:webadmin@gfsg.org.au?subject=Contact%20us\">webadmin@gfsg.org.au</a></span></div>\n</div>\n</div>\n</div><div class=\"widget-wrapper widget-element free-text diy-resizable \">\n<div id=\"\" class=\"widget-body \">\n<div class=\"freetextarea\">\n<div><span>AAEGT NSW State Board Representative and AAEGT Vice President: Melinda Gindy</span></div>\n<div> </div>\n<div> </div>\n<div><strong>Sub-Branches</strong></div>\n<div><span>South Coast -  </span><span id=\"cloakf69753077d4233d2d5066767f93bd04f\"><a href=\"mailto:subbranchliaison@gfsg.org.au\">southcoast@gfsg.org.au</a></span></div>\n<div><span>Illawarra - <a href=\"mailto:illawarra@gfsg.org.au\">illawarra@gfsg.org.au</a></span></div>\n</div>\n</div>\n</div>',NULL,NULL,1,1,3,0,0,NULL,'Inherit','Inherit',0),(16,10,1,0,1,0,'Page','2017-07-13 13:36:30','2017-07-13 13:36:30','new-page','New Page',NULL,NULL,NULL,NULL,1,1,8,0,0,NULL,'Inherit','Inherit',0),(17,10,2,0,1,0,'Page','2017-07-13 13:53:11','2017-07-13 13:36:30','new-page','New Page',NULL,'<p><span>[mini_cart_item StudentName=\"true\" name=\"Allegro\" price=\"504.70\" tax=\"50.47\"] Add To Cart [/mini_cart_item]</span></p>',NULL,NULL,1,1,8,0,0,NULL,'Inherit','Inherit',0),(18,10,3,1,1,1,'Page','2017-07-13 14:23:01','2017-07-13 13:36:30','new-page','New Page',NULL,'<p><span>[mini_cart_item name=\"ITEM NAME\" price=\"0.00\"]</span></p>',NULL,NULL,1,1,8,0,0,NULL,'Inherit','Inherit',0),(19,10,4,1,1,1,'Page','2017-07-13 14:28:14','2017-07-13 13:36:30','new-page','New Page',NULL,NULL,NULL,NULL,1,1,8,0,0,NULL,'Inherit','Inherit',0),(20,10,5,1,1,1,'Page','2017-07-13 14:28:17','2017-07-13 13:36:30','new-page','New Page',NULL,'<p>[mini_cart_item name=\"ITEM NAME\" price=\"0.00\"]</p>',NULL,NULL,1,1,8,0,0,NULL,'Inherit','Inherit',0),(21,10,6,1,1,1,'Page','2017-07-13 14:29:22','2017-07-13 13:36:30','new-page','New Page',NULL,'<p><span>[mini_cart_item StudentName=\"true\" name=\"Allegro\" price=\"504.70\" tax=\"50.47\"] Add To Cart [/mini_cart_item]</span></p>',NULL,NULL,1,1,8,0,0,NULL,'Inherit','Inherit',0),(22,10,7,1,1,1,'Page','2017-07-13 14:50:08','2017-07-13 13:36:30','new-page','New Page',NULL,'<p><span>[mini_cart_item name=\"Allegro\" price=\"504.70\"]</span></p>',NULL,NULL,1,1,8,0,0,NULL,'Inherit','Inherit',0),(23,10,8,1,1,1,'Page','2017-07-13 20:36:36','2017-07-13 13:36:30','new-page','New Page',NULL,'<p><span>[minicart_item name=\"Allegro\" price=\"504.70\"]</span></p>',NULL,NULL,1,1,8,0,0,NULL,'Inherit','Inherit',0),(24,10,9,1,1,1,'Page','2017-07-13 20:58:33','2017-07-13 13:36:30','new-page','New Page',NULL,'<p><span>[minicart_item paypalsource=\"-----BEGIN PKCS7-----MIIHdwYJKoZIhvcNAQcEoIIHaDCCB2QCAQExggEwMIIBLAIBADCBlDCBjjELMAkGA1UEBhMCVVMxCzAJBgNVBAgTAkNBMRYwFAYDVQQHEw1Nb3VudGFpbiBWaWV3MRQwEgYDVQQKEwtQYXlQYWwgSW5jLjETMBEGA1UECxQKbGl2ZV9jZXJ0czERMA8GA1UEAxQIbGl2ZV9hcGkxHDAaBgkqhkiG9w0BCQEWDXJlQHBheXBhbC5jb20CAQAwDQYJKoZIhvcNAQEBBQAEgYA1ua7eGdUrDOp0U/kwwwvV463GWLNRMuR+2OKmBM4jYrMWOSVnIoItlmdKlWnA3zzUCSAvl8ZwaPUT3rA4V9vdrW94DNikmx/jbmTrkX+XZ/fPYb8dImfLXU3FzdnRUtsxkdb4WtetQBhWPMaIvwG4AEupUl7dTgsV1jp64l8PJTELMAkGBSsOAwIaBQAwgfQGCSqGSIb3DQEHATAUBggqhkiG9w0DBwQIABIdcdcyvX2AgdDdP3nKIA0McPKvJJjb+qRELPNmhc8XGRXknZtnwPl6xJbDNHawXZaNSSMJVZVkqK9FJhI8w+uuFU64yIsJrHV2OKyQ8wDqAnoEEGK36BrF/ccvyBERBpBgj9atNDhT2JQMP/UCArM797lL12A979pvn7zCYH1/Mh/OSKC8h4Di2BjQ1mbKemk0sexuwucnG3ezfOseRdWvUIh2xk8QXsLXy0XMUc0hx7Hqkly3evOMpo+BPGe22EE1k06b9NYck/faqooaQqGIhyA/FBXhHGIvoIIDhzCCA4MwggLsoAMCAQICAQAwDQYJKoZIhvcNAQEFBQAwgY4xCzAJBgNVBAYTAlVTMQswCQYDVQQIEwJDQTEWMBQGA1UEBxMNTW91bnRhaW4gVmlldzEUMBIGA1UEChMLUGF5UGFsIEluYy4xEzARBgNVBAsUCmxpdmVfY2VydHMxETAPBgNVBAMUCGxpdmVfYXBpMRwwGgYJKoZIhvcNAQkBFg1yZUBwYXlwYWwuY29tMB4XDTA0MDIxMzEwMTMxNVoXDTM1MDIxMzEwMTMxNVowgY4xCzAJBgNVBAYTAlVTMQswCQYDVQQIEwJDQTEWMBQGA1UEBxMNTW91bnRhaW4gVmlldzEUMBIGA1UEChMLUGF5UGFsIEluYy4xEzARBgNVBAsUCmxpdmVfY2VydHMxETAPBgNVBAMUCGxpdmVfYXBpMRwwGgYJKoZIhvcNAQkBFg1yZUBwYXlwYWwuY29tMIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDBR07d/ETMS1ycjtkpkvjXZe9k+6CieLuLsPumsJ7QC1odNz3sJiCbs2wC0nLE0uLGaEtXynIgRqIddYCHx88pb5HTXv4SZeuv0Rqq4+axW9PLAAATU8w04qqjaSXgbGLP3NmohqM6bV9kZZwZLR/klDaQGo1u9uDb9lr4Yn+rBQIDAQABo4HuMIHrMB0GA1UdDgQWBBSWn3y7xm8XvVk/UtcKG+wQ1mSUazCBuwYDVR0jBIGzMIGwgBSWn3y7xm8XvVk/UtcKG+wQ1mSUa6GBlKSBkTCBjjELMAkGA1UEBhMCVVMxCzAJBgNVBAgTAkNBMRYwFAYDVQQHEw1Nb3VudGFpbiBWaWV3MRQwEgYDVQQKEwtQYXlQYWwgSW5jLjETMBEGA1UECxQKbGl2ZV9jZXJ0czERMA8GA1UEAxQIbGl2ZV9hcGkxHDAaBgkqhkiG9w0BCQEWDXJlQHBheXBhbC5jb22CAQAwDAYDVR0TBAUwAwEB/zANBgkqhkiG9w0BAQUFAAOBgQCBXzpWmoBa5e9fo6ujionW1hUhPkOBakTr3YCDjbYfvJEiv/2P+IobhOGJr85+XHhN0v4gUkEDI8r2/rNk1m0GA8HKddvTjyGw/XqXa+LSTlDYkqI8OwR8GEYj4efEtcRpRYBxV8KxAW93YDWzFGvruKnnLbDAF6VR5w/cCMn5hzGCAZowggGWAgEBMIGUMIGOMQswCQYDVQQGEwJVUzELMAkGA1UECBMCQ0ExFjAUBgNVBAcTDU1vdW50YWluIFZpZXcxFDASBgNVBAoTC1BheVBhbCBJbmMuMRMwEQYDVQQLFApsaXZlX2NlcnRzMREwDwYDVQQDFAhsaXZlX2FwaTEcMBoGCSqGSIb3DQEJARYNcmVAcGF5cGFsLmNvbQIBADAJBgUrDgMCGgUAoF0wGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEHATAcBgkqhkiG9w0BCQUxDxcNMTcwNzEzMTA0OTI5WjAjBgkqhkiG9w0BCQQxFgQUglbROM872eLHBfDLw8daxFGFhOQwDQYJKoZIhvcNAQEBBQAEgYCdrctoPzLaXqy8PVtcSTAsFCW7wYbuipFkkYCPHHWp/JBLLh38TAMwu1ddsafabsXZVvje6A4lMOFKdvigz+npd82+4MUnRUUEf2lcndgtMru0XVORRRy85XUiTg3H34ysjvhIHIYYC/Rus75j1Fcm3jP5cBMF+73vGYTevz30Gg==-----END PKCS7-----\"]</span></p>',NULL,NULL,1,1,8,0,0,NULL,'Inherit','Inherit',0),(25,10,10,1,1,1,'Page','2017-07-14 10:19:57','2017-07-13 13:36:30','new-page','New Page',NULL,'<p><span>[minicart_item business=\"fsdafas\" itemname=\"item\" itemcode=\"code\" itemprice=\"2.45\"]</span></p>',NULL,NULL,1,1,8,0,0,NULL,'Inherit','Inherit',0),(26,10,11,1,1,1,'Page','2017-07-14 10:25:15','2017-07-13 13:36:30','new-page','New Page',NULL,'<p><span>[minicart_item business=\"66VFMXW3N5WN6\" itemname=\"item\" itemcode=\"code\" itemprice=\"2.45\"]</span></p>',NULL,NULL,1,1,8,0,0,NULL,'Inherit','Inherit',0),(27,10,12,1,1,1,'Page','2017-07-14 10:38:15','2017-07-13 13:36:30','new-page','New Page',NULL,'<p><span>[minicart_item business=\"66VFMXW3N5WN6\" name=\"item\" sku=\"code\" price=\"2.45\"]</span></p>',NULL,NULL,1,1,8,0,0,NULL,'Inherit','Inherit',0),(28,11,1,0,1,0,'VirtualPage','2017-07-14 11:00:49','2017-07-14 11:00:49','new-virtual-page','New Virtual Page',NULL,NULL,NULL,NULL,1,1,1,0,1,NULL,'Inherit','Inherit',10),(29,11,2,0,1,0,'VirtualPage','2017-07-14 11:01:20','2017-07-14 11:00:49','home','Home',NULL,'<p>Gifted Families Support Group Incorporated is a not for profit association designed to support families and educators of gifted children. Run solely by volunteers, GFSG Inc. focusses on bringing together ‘like-minds’, providing a vast array of supportive events and highlighting the needs of gifted children within our community.</p><p class=\"p1\"><span class=\"s1\">GFSG Inc. is affiliated with the Australian Association for the Education of Gifted and Talented Children (AAEGT) and represents NSW on the AAEGT Board. Through this affiliation, GFSG Inc. is able to expand the support we give to our members by taking their concerns to a national level and open up new opportunities. All our members automatically become members of the AAEGT, with options to subscribe to their biannual journal at members rates, and to receive discounts to events hosted by other gifted associations.</span></p><p class=\"p1\"><span class=\"s1\">GFSG Inc. is also affiliated with GLD Australia; a national online learning community responding to the needs of gifted children and gifted adults with specific learning disability and other learning challenges.</span></p><p class=\"p1\"><span class=\"s1\">To attend a GFSG Inc. event, children are not required to sit an IQ test.  Given our current website upgrade, it may be easiest to view the events calendar, including South-Coast Sub Branch events, here: <a href=\"https://www.gfsg.org.au/images/calendar_jan-june.pdf\">EVENTS CALENDAR JAN-JUNE 2017.</a>  (Be sure to check regularly for updates and changes.)  Be sure to also check out the \"news and events\" section below for our upcoming celebrations, and the \"sub branch\" tab above for more from the south coast!</span></p><p class=\"p1\"><span class=\"s1\">GFSG Inc. is a place where we hope you can feel ‘at home’ in a world where our children often seem the ‘odd ones out’.</span></p><p class=\"p1\"><span class=\"s1\">Melinda Gindy- President of GFSG Inc.</span></p>',NULL,NULL,1,1,1,0,0,NULL,'Inherit','Inherit',10),(30,12,1,1,1,1,'PayPalReturnPage','2017-07-14 12:39:20','2017-07-14 12:39:20','new-pay-pal-return-page','New Pay Pal Return Page',NULL,NULL,NULL,NULL,1,1,9,0,0,NULL,'Inherit','Inherit',0),(31,12,2,1,1,1,'PayPalReturnPage','2017-07-14 13:55:51','2017-07-14 12:39:20','new-pay-pal-return-page','New Pay Pal Return Page',NULL,NULL,NULL,NULL,1,1,9,0,0,NULL,'Inherit','Inherit',0),(32,12,3,1,1,1,'PayPalReturnPage','2017-07-14 14:39:31','2017-07-14 12:39:20','new-pay-pal-return-page','New Pay Pal Return Page',NULL,NULL,NULL,NULL,1,1,9,0,0,NULL,'Inherit','Inherit',0),(33,10,13,1,1,1,'Page','2017-07-16 11:49:46','2017-07-13 13:36:30','new-page','New Page',NULL,'<p><span>[minicart_item business=\"66VFMXW3N5WN6\" name=\"item\" sku=\"code\" price=\"0.01\"]</span></p>',NULL,NULL,1,1,8,0,0,NULL,'Inherit','Inherit',0),(34,10,14,1,1,1,'Page','2017-07-16 15:05:25','2017-07-13 13:36:30','new-page','New Page',NULL,'<p><span>[minicart_item business=\"66VFMXW3N5WN6\" name=\"Gold Membership\" sku=\"GM\" custom=\"$MemberID\" price=\"0.01\"]</span></p>',NULL,NULL,1,1,8,0,0,NULL,'Inherit','Inherit',0),(35,10,15,1,1,1,'Page','2017-07-16 15:09:53','2017-07-13 13:36:30','new-page','New Page',NULL,'<p><span>[minicart_item business=\"66VFMXW3N5WN6\" name=\"Gold Membership\" sku=\"GM\" custom=\"$MemberID\" price=\"0.01\"]</span></p>',NULL,NULL,1,1,8,0,0,NULL,'LoggedInUsers','Inherit',0),(36,13,1,0,1,0,'Page','2017-07-16 15:38:28','2017-07-16 15:38:28','new-page-2','New Page',NULL,NULL,NULL,NULL,1,1,10,0,0,NULL,'Inherit','Inherit',0),(37,13,2,1,1,1,'Page','2017-07-16 15:38:48','2017-07-16 15:38:28','members-only','Members Only',NULL,NULL,NULL,NULL,1,1,10,0,0,NULL,'Inherit','Inherit',0),(38,13,3,1,1,1,'Page','2017-07-16 15:39:05','2017-07-16 15:38:28','members-only','Members Only',NULL,NULL,NULL,NULL,1,1,10,0,0,NULL,'OnlyTheseUsers','Inherit',0),(39,14,1,0,1,0,'Page','2017-07-16 15:41:53','2017-07-16 15:41:53','new-page-2','New Page',NULL,NULL,NULL,NULL,1,1,11,0,0,NULL,'Inherit','Inherit',0),(40,15,1,0,1,0,'RedirectorPage','2017-07-16 15:42:34','2017-07-16 15:42:34','new-redirector-page','New Redirector Page',NULL,NULL,NULL,NULL,1,1,11,0,1,NULL,'Inherit','Inherit',0),(41,15,2,0,1,0,'RedirectorPage','2017-07-16 15:43:43','2017-07-16 15:42:34','logout','Logout',NULL,NULL,NULL,NULL,1,1,11,0,0,NULL,'Inherit','Inherit',0),(42,15,3,1,1,1,'RedirectorPage','2017-07-16 15:43:43','2017-07-16 15:42:34','logout','Logout',NULL,NULL,NULL,NULL,1,1,11,0,0,NULL,'Inherit','Inherit',0),(43,10,16,1,1,1,'Page','2017-07-16 15:51:07','2017-07-13 13:36:30','purchase-membership','Purchase Membership',NULL,'<p><span>[minicart_item business=\"66VFMXW3N5WN6\" name=\"Gold Membership\" sku=\"GM\" custom=\"$MemberID\" price=\"0.01\"]</span></p>',NULL,NULL,1,1,8,0,0,NULL,'LoggedInUsers','Inherit',0),(44,13,4,1,1,1,'Page','2017-07-16 15:51:36','2017-07-16 15:38:28','members-only','Members Only',NULL,NULL,NULL,NULL,1,1,10,0,0,NULL,'LoggedInUsers','Inherit',0),(45,16,1,0,1,0,'Page','2017-07-16 15:52:01','2017-07-16 15:52:01','new-page','New Page',NULL,NULL,NULL,NULL,1,1,1,0,0,NULL,'Inherit','Inherit',13),(46,16,2,1,1,1,'Page','2017-07-16 15:52:11','2017-07-16 15:52:01','paid-member-page','Paid Member Page',NULL,NULL,NULL,NULL,1,1,1,0,0,NULL,'Inherit','Inherit',13),(47,16,3,1,1,1,'Page','2017-07-16 15:52:28','2017-07-16 15:52:01','paid-member-page','Paid Member Page',NULL,NULL,NULL,NULL,1,1,1,0,0,NULL,'OnlyTheseUsers','Inherit',13),(48,10,17,0,1,0,'Page','2017-07-16 15:54:02','2017-07-13 13:36:30','purchase-membership','Purchase Membership',NULL,'<p><span>[minicart_item business=\"66VFMXW3N5WN6\" name=\"Gold Membership\" sku=\"GM\" custom=\"$MemberID\" price=\"0.01\"]</span></p>',NULL,NULL,1,1,8,0,0,NULL,'LoggedInUsers','Inherit',13),(49,10,18,1,1,1,'Page','2017-07-16 15:54:02','2017-07-13 13:36:30','purchase-membership','Purchase Membership',NULL,'<p><span>[minicart_item business=\"66VFMXW3N5WN6\" name=\"Gold Membership\" sku=\"GM\" custom=\"$MemberID\" price=\"0.01\"]</span></p>',NULL,NULL,1,1,1,0,0,NULL,'LoggedInUsers','Inherit',13),(50,10,19,1,1,1,'Page','2017-07-16 15:54:50','2017-07-13 13:36:30','purchase-membership','Purchase Membership',NULL,'<p><span>[minicart_item business=\"66VFMXW3N5WN6\" name=\"Gold Membership\" sku=\"GM\" custom=\"$MemberID\" price=\"0.01\"]</span></p>',NULL,NULL,1,1,1,0,0,NULL,'Inherit','Inherit',13),(51,6,3,1,1,1,'MemberProfilePage','2017-07-16 15:56:41','2017-04-11 11:36:24','new-member-profile-page','New Member Profile Page',NULL,NULL,NULL,NULL,1,1,6,0,0,NULL,'Inherit','Inherit',0),(52,17,1,0,1,0,'','2017-07-19 13:14:36','2017-07-19 13:14:36','new-membership-holder-page','New Membership Holder Page',NULL,NULL,NULL,NULL,1,1,3,0,0,NULL,'Inherit','Inherit',13),(53,10,20,1,1,1,'Page','2017-07-19 13:15:15','2017-07-13 13:36:30','purchase-membership-minicart','Purchase Membership minicart',NULL,'<p><span>[minicart_item business=\"66VFMXW3N5WN6\" name=\"Gold Membership\" sku=\"GM\" custom=\"$MemberID\" price=\"0.01\"]</span></p>',NULL,NULL,1,1,1,0,0,NULL,'Inherit','Inherit',13),(54,17,2,1,1,1,'','2017-07-19 13:15:36','2017-07-19 13:14:36','purchase-membership','Purchase Membership',NULL,'<p>Holder Content</p>',NULL,NULL,1,1,3,0,0,NULL,'Inherit','Inherit',13),(55,18,1,0,1,0,'','2017-07-19 13:15:44','2017-07-19 13:15:44','new-membership-page','New Membership Page',NULL,NULL,NULL,NULL,1,1,1,0,0,NULL,'Inherit','Inherit',17),(56,18,2,1,1,1,'','2017-07-19 13:16:09','2017-07-19 13:15:44','new-membership-page','New Membership Page',NULL,'<p>Member 1 content</p>',NULL,NULL,1,1,1,0,0,NULL,'Inherit','Inherit',17),(57,19,1,0,1,0,'','2017-07-19 13:16:15','2017-07-19 13:16:15','new-membership-page-2','New Membership Page',NULL,NULL,NULL,NULL,1,1,2,0,0,NULL,'Inherit','Inherit',17),(58,19,2,1,1,1,'','2017-07-19 13:16:31','2017-07-19 13:16:15','new-membership-page-2','New Membership Page',NULL,'<p>Member 2 conbtent</p>',NULL,NULL,1,1,2,0,0,NULL,'Inherit','Inherit',17),(59,17,3,0,1,0,'','2017-07-19 13:26:00','2017-07-19 13:14:36','purchase-membership','Purchase Membership',NULL,'<p>Holder Content</p>',NULL,NULL,1,1,3,0,0,NULL,'Inherit','Inherit',0),(60,17,4,1,1,1,'','2017-07-19 13:26:00','2017-07-19 13:14:36','purchase-membership','Purchase Membership',NULL,'<p>Holder Content</p>',NULL,NULL,1,1,8,0,0,NULL,'Inherit','Inherit',0),(61,20,1,1,1,1,'','2017-07-19 13:39:58','2017-07-19 13:39:58','new-membership-holder-page','New Membership Holder Page',NULL,NULL,NULL,NULL,1,1,10,0,0,NULL,'Inherit','Inherit',0),(62,21,1,0,1,0,'MembershipContainerPage','2017-07-19 13:49:05','2017-07-19 13:49:05','new-membership-container-page','New Membership Container Page',NULL,NULL,NULL,NULL,1,1,10,0,0,NULL,'Inherit','Inherit',0),(63,21,2,1,1,1,'MembershipContainerPage','2017-07-19 13:49:11','2017-07-19 13:49:05','new-membership-container-page','New Membership Container Page',NULL,'<p>ggg</p>',NULL,NULL,1,1,10,0,0,NULL,'Inherit','Inherit',0),(64,22,1,1,1,1,'','2017-07-19 13:55:38','2017-07-19 13:55:38','new-membership-page','New Membership Page',NULL,NULL,NULL,NULL,1,1,1,0,0,NULL,'Inherit','Inherit',21),(65,23,1,1,1,1,'','2017-07-19 14:01:16','2017-07-19 14:01:16','new-membership-page-2','New Membership Page',NULL,NULL,NULL,NULL,1,1,2,0,0,NULL,'Inherit','Inherit',21),(66,23,2,1,1,1,'','2017-07-19 14:01:52','2017-07-19 14:01:16','new-membership-page-2','New Membership Page',NULL,'<p>2</p>',NULL,NULL,1,1,2,0,0,NULL,'Inherit','Inherit',21),(67,22,2,1,1,1,'','2017-07-19 14:01:56','2017-07-19 13:55:38','new-membership-page','New Membership Page',NULL,'<p>1</p>',NULL,NULL,1,1,1,0,0,NULL,'Inherit','Inherit',21),(68,22,3,1,1,1,'','2017-07-19 14:02:10','2017-07-19 13:55:38','new-membership-page','New Membership Page',NULL,'<p>1</p>',NULL,NULL,0,0,1,0,0,NULL,'Inherit','Inherit',21),(69,23,3,1,1,1,'','2017-07-19 14:02:18','2017-07-19 14:01:16','new-membership-page-2','New Membership Page',NULL,'<p>2</p>',NULL,NULL,0,0,2,0,0,NULL,'Inherit','Inherit',21),(70,21,3,1,1,1,'MembershipContainerPage','2017-07-19 20:14:20','2017-07-19 13:49:05','purchase-membership','Purchase Membership',NULL,NULL,NULL,NULL,1,1,10,0,0,NULL,'Inherit','Inherit',0),(71,12,4,1,1,1,'PayPalReturnPage','2017-07-23 12:51:57','2017-07-14 12:39:20','new-pay-pal-return-page','New Pay Pal Return Page',NULL,NULL,NULL,NULL,0,0,7,0,0,NULL,'Inherit','Inherit',0),(72,12,5,0,1,0,'PayPalReturnPage','2017-07-23 12:52:01','2017-07-14 12:39:20','new-pay-pal-return-page','New Pay Pal Return Page',NULL,NULL,NULL,NULL,0,0,9,0,0,NULL,'Inherit','Inherit',0),(73,21,4,0,1,0,'MembershipContainerPage','2017-07-23 12:52:38','2017-07-19 13:49:05','purchase-membership','Purchase Membership',NULL,NULL,NULL,NULL,1,1,8,0,0,NULL,'Inherit','Inherit',13),(74,21,5,0,1,0,'MembershipContainerPage','2017-07-23 12:52:38','2017-07-19 13:49:05','purchase-membership','Purchase Membership',NULL,NULL,NULL,NULL,1,1,3,0,0,NULL,'Inherit','Inherit',13),(75,21,6,1,1,1,'MembershipContainerPage','2017-07-23 12:59:33','2017-07-19 13:49:05','purchase-membership','Purchase Membership',NULL,'<p>Please choose from one of the following memberships</p>',NULL,NULL,1,1,3,0,0,NULL,'Inherit','Inherit',13),(76,6,4,1,1,1,'MemberProfilePage','2017-07-23 13:01:54','2017-04-11 11:36:24','loginregister','Login/Register',NULL,NULL,NULL,NULL,1,1,5,0,0,NULL,'Inherit','Inherit',0),(77,7,3,1,1,1,'Calendar','2017-07-23 13:03:01','2017-04-11 11:50:23','gfsg-events','GFSG Events',NULL,NULL,NULL,NULL,1,1,7,0,0,NULL,'Inherit','Inherit',0),(78,6,5,1,1,1,'MemberProfilePage','2017-07-23 13:03:08','2017-04-11 11:36:24','register','Register',NULL,NULL,NULL,NULL,1,1,5,0,0,NULL,'Inherit','Inherit',0),(79,6,6,1,1,1,'MemberProfilePage','2017-07-23 20:32:01','2017-04-11 11:36:24','register','Register',NULL,NULL,NULL,NULL,1,1,5,0,0,NULL,'Inherit','Inherit',0);
/*!40000 ALTER TABLE `SiteTree_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `VirtualPage`
--

DROP TABLE IF EXISTS `VirtualPage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `VirtualPage` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `VersionID` int(11) NOT NULL DEFAULT '0',
  `CopyContentFromID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `CopyContentFromID` (`CopyContentFromID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `VirtualPage`
--

LOCK TABLES `VirtualPage` WRITE;
/*!40000 ALTER TABLE `VirtualPage` DISABLE KEYS */;
/*!40000 ALTER TABLE `VirtualPage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `VirtualPage_Live`
--

DROP TABLE IF EXISTS `VirtualPage_Live`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `VirtualPage_Live` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `VersionID` int(11) NOT NULL DEFAULT '0',
  `CopyContentFromID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `CopyContentFromID` (`CopyContentFromID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `VirtualPage_Live`
--

LOCK TABLES `VirtualPage_Live` WRITE;
/*!40000 ALTER TABLE `VirtualPage_Live` DISABLE KEYS */;
/*!40000 ALTER TABLE `VirtualPage_Live` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `VirtualPage_versions`
--

DROP TABLE IF EXISTS `VirtualPage_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `VirtualPage_versions` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RecordID` int(11) NOT NULL DEFAULT '0',
  `Version` int(11) NOT NULL DEFAULT '0',
  `VersionID` int(11) NOT NULL DEFAULT '0',
  `CopyContentFromID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `RecordID_Version` (`RecordID`,`Version`),
  KEY `RecordID` (`RecordID`),
  KEY `Version` (`Version`),
  KEY `CopyContentFromID` (`CopyContentFromID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `VirtualPage_versions`
--

LOCK TABLES `VirtualPage_versions` WRITE;
/*!40000 ALTER TABLE `VirtualPage_versions` DISABLE KEYS */;
INSERT INTO `VirtualPage_versions` VALUES (1,11,1,0,0),(2,11,2,0,1);
/*!40000 ALTER TABLE `VirtualPage_versions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-07-23 11:18:25
