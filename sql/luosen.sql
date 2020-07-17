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

/*Table structure for table `employee` */

DROP TABLE IF EXISTS `employee`;

CREATE TABLE `employee` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `sales_commission` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

/*Data for the table `employee` */

insert  into `employee`(`id`,`name`,`sex`,`phone`,`sales_commission`) values (1,'蜡笔小新','男','13902976158','1000'),(2,'漩涡鸣人','男','13902920386','2500'),(3,'宇智波佐助','男','18002573587','3000'),(4,'春野樱','女','13113861185','1500'),(5,'犬冢牙','男','13058150285','2000'),(6,'油女志乃','男','13538279675','1350'),(7,'日向雏田','女','13538267519','1290'),(8,'奈良鹿丸','男','13538259037','3208'),(9,'比如霸王丸','男','13538251973','2346'),(10,'秋道丁次','男','19842759903','1320'),(11,'山中井野','女','13538260673','2420'),(12,'凯','男','13538279875','2135'),(13,'月光疾风','男','13168030685','3224'),(14,'赤丸','男','13113861185','2937'),(15,'手鞠','女','13048811866','2254'),(16,'勘九郎','男','13128924133','2490'),(17,'夜叉丸','男','13058160585','2438'),(18,'药师兜','男','15602918487','5424'),(19,'大蛇丸','男','15692080487','2533'),(20,'山椒鱼半藏','男','15622875487','1883'),(21,'角都','男','15692083489','2349');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `goods` */

/*Table structure for table `member` */

DROP TABLE IF EXISTS `member`;

CREATE TABLE `member` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `card_number` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `integral` bigint(20) DEFAULT NULL,
  `grade` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

/*Data for the table `member` */

insert  into `member`(`id`,`card_number`,`name`,`sex`,`phone`,`integral`,`grade`) values (1,'420703199304300317','朱传瑾','女','13822197539',1000,'一'),(2,'420703198906307634','徐勤业','男','13822196739',1000,'一'),(3,'42070319971130039X','龚文伟','男','13822196379',1000,'一'),(4,'420703198603316752','徐立红','男','13822197139',1000,'一'),(5,'420703198505319917','尹海边','男','13822197359',1000,'一'),(6,'420703199310310212','聂明智','男','13928873310',2000,'二'),(7,'420703198108315373','孔令凯','男','13928873597',2000,'二'),(8,'420703198005312196','黄轶凡','男','13928873602',2000,'二'),(9,'42070319941130601X','朱奇伟','男','13928873802',2000,'二'),(10,'420703198002295730','忻兆忠','男','13928872975',2000,'二'),(11,'420703198908311776','张道海','男','15323335558',3000,'三'),(12,'420703199111304979','刘轩非','男','15323333688',3000,'三'),(13,'42070319880930460X','范晓伟','男','13928873065',3000,'三'),(14,'420703198301316247','丁晓墅','女','13928873075',3000,'三'),(15,'420703199701312223','钟玉怡','女','13928873096',3000,'三'),(16,'420703200003317989','于美静','女','13928873175',4000,'四'),(17,'420703199709304965','朱海宜','女','13928873207',4000,'四'),(18,'420703199801312204','胡向红','女','13928873310',4000,'四'),(19,'420703199904306528','汪文闻','女','13928873537',4000,'四'),(20,'420703198508310889','汤艳梅','女','13928873562',4000,'四'),(21,'420703198904306101','左燕霞','女','13928873597',5000,'五'),(22,'420703198103310805','林伊凡','女','13928873617',5000,'五'),(23,'420703198512313767','周禹彤','女','13928873597',5000,'五');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`id`,`username`,`password`) values (1,'gxs','gxs');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
