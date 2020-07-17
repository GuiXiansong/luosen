/*
SQLyog Ultimate v8.32 
MySQL - 5.7.11 : Database - luosen
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`luosen` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `luosen`;

/*Table structure for table `goods` */

DROP TABLE IF EXISTS `goods`;

CREATE TABLE `goods` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `purchase_price` double DEFAULT NULL,
  `price` double DEFAULT NULL,
  `integral` bigint(20) DEFAULT NULL,
  `satisfaction` varchar(255) DEFAULT NULL,
  `discount_rate` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `goods` */

insert  into `goods`(`id`,`name`,`purchase_price`,`price`,`integral`,`satisfaction`,`discount_rate`) values (1,'茄子',2,3,3,'高',0.9),(2,'大辣棒',4,5,5,'高',0.8),(3,'橘子罐头',6,7,7,'中',0.9),(4,'苹果',3,4,4,'低',0.7),(5,'火龙果',3,3.5,4,'高',1),(6,'毛绒大衣',400,600,600,'低',0.7),(7,'皮鞋',200,300,300,'中',0.9),(8,'耐克鞋',1300,1500,1500,'低',0.8),(9,'鼠标',30,40,40,'中',0.9),(10,'键盘',70,90,90,'高',0.9);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
