-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.0.22-community-nt


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema key1
--

CREATE DATABASE IF NOT EXISTS key1;
USE key1;

--
-- Definition of table `downloads`
--

DROP TABLE IF EXISTS `downloads`;
CREATE TABLE `downloads` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `filename` varchar(45) NOT NULL,
  `username` varchar(45) NOT NULL,
  `time` varchar(45) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `downloads`
--

/*!40000 ALTER TABLE `downloads` DISABLE KEYS */;
INSERT INTO `downloads` (`id`,`filename`,`username`,`time`) VALUES 
 (3,'record.txt','Ajmal','2017/10/09 09:12:27');
/*!40000 ALTER TABLE `downloads` ENABLE KEYS */;


--
-- Definition of table `reg`
--

DROP TABLE IF EXISTS `reg`;
CREATE TABLE `reg` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `uname` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `pass` varchar(100) NOT NULL,
  `phone` varchar(100) NOT NULL,
  `gender` varchar(100) NOT NULL,
  `dob` varchar(100) NOT NULL,
  `state` varchar(100) NOT NULL,
  `country` varchar(100) NOT NULL,
  `role` varchar(45) NOT NULL,
  `activate` varchar(45) NOT NULL default 'waiting',
  `skey` varchar(100) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reg`
--

/*!40000 ALTER TABLE `reg` DISABLE KEYS */;
INSERT INTO `reg` (`id`,`uname`,`email`,`pass`,`phone`,`gender`,`dob`,`state`,`country`,`role`,`activate`,`skey`) VALUES 
 (4,'Anbu','Anbu.jpinfotech@gmail.com','123','9043418902','Female','10/17/2017','tamil nadu','india','Data owner','Accept','123'),
 (5,'Ajmal','Anbu.jpinfotech@gmail.com','123','9025070773','Male','10/25/2017','Tamilnadu','india','User','Accept','123'),
 (6,'gomathi','Anbu.jpinfotech@gmail.com','123','9025070773','Male','10/26/2017','Tamilnadu','india','User','Accept','123');
/*!40000 ALTER TABLE `reg` ENABLE KEYS */;


--
-- Definition of table `request`
--

DROP TABLE IF EXISTS `request`;
CREATE TABLE `request` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `user_name` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `file_name` varchar(45) NOT NULL,
  `status` varchar(45) NOT NULL default 'No',
  `state` varchar(45) NOT NULL,
  `country` varchar(45) NOT NULL,
  `secret_key` varchar(45) NOT NULL,
  `stime` varchar(45) NOT NULL,
  `etime` varchar(45) NOT NULL,
  `private_key` varchar(45) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `request`
--

/*!40000 ALTER TABLE `request` DISABLE KEYS */;
INSERT INTO `request` (`id`,`user_name`,`email`,`file_name`,`status`,`state`,`country`,`secret_key`,`stime`,`etime`,`private_key`) VALUES 
 (3,'Ajmal','Anbu.jpinfotech@gmail.com','record.txt','Permission Granted','Tamilnadu','india','fRKhitRwfP1Dy/A2owhYhw==','2017.10.10 at 09:09:01','2017.10.10 at 09:09:01','26858');
/*!40000 ALTER TABLE `request` ENABLE KEYS */;


--
-- Definition of table `upload`
--

DROP TABLE IF EXISTS `upload`;
CREATE TABLE `upload` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `filename` varchar(45) NOT NULL,
  `content` longblob NOT NULL,
  `owner_name` varchar(45) NOT NULL,
  `start_time` varchar(45) NOT NULL,
  `end_time` varchar(45) NOT NULL,
  `secret_key` varchar(45) NOT NULL,
  `filekey` varchar(45) NOT NULL,
  `pkey` varchar(100) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `upload`
--

/*!40000 ALTER TABLE `upload` DISABLE KEYS */;
INSERT INTO `upload` (`id`,`filename`,`content`,`owner_name`,`start_time`,`end_time`,`secret_key`,`filekey`,`pkey`) VALUES 
 (1,'record.txt',0x316B5A635070766B4B425642444D66563969534348514A4753636C6230536A71724C3072586F48436F6B513D,'Anbu','2017.10.09 at 09:09:01','2017.10.10 at 09:09:01','fRKhitRwfP1Dy/A2owhYhw==','cloud','26858');
/*!40000 ALTER TABLE `upload` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
