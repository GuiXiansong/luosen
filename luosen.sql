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

/*Table structure for table `commodity_purchase` */

DROP TABLE IF EXISTS `commodity_purchase`;

CREATE TABLE `commodity_purchase` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `goods_id` bigint(20) DEFAULT NULL,
  `quantity` double DEFAULT NULL,
  `purchase_date` varchar(255) DEFAULT NULL,
  `total_purchase_price` double DEFAULT NULL,
  `supplier_information` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_commodity_purchase_goods_id` (`goods_id`),
  CONSTRAINT `FK_commodity_purchase_goods_id` FOREIGN KEY (`goods_id`) REFERENCES `goods` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `commodity_purchase` */

insert  into `commodity_purchase`(`id`,`goods_id`,`quantity`,`purchase_date`,`total_purchase_price`,`supplier_information`) values (1,12,150,'2020-03-27',1500,'西藏葡萄种植有限责任公司'),(2,10,1000,'2020-04-01',5000,'深圳口香糖供应有限责任公司'),(5,6,3434,'2020-04-27',3234255,'湖北皮皮桂康师傅有限公司');

/*Table structure for table `employee` */

DROP TABLE IF EXISTS `employee`;

CREATE TABLE `employee` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `store_id` bigint(20) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `position` varchar(255) DEFAULT NULL,
  `sales` double DEFAULT NULL,
  `sales_commission` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_employee` (`store_id`),
  CONSTRAINT `FK_employee` FOREIGN KEY (`store_id`) REFERENCES `store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

/*Data for the table `employee` */

insert  into `employee`(`id`,`store_id`,`name`,`sex`,`phone`,`position`,`sales`,`sales_commission`) values (1,1,'蜡笔小新','男','13902976158','副店长',10000,1000),(2,2,'漩涡鸣人','男','13902920386','前台',20000,2500),(3,1,'宇智波佐助','男','18002573587','店长',340000,3000),(5,1,'油女志乃','男','13538279675','陈列员',30000,1350),(10,2,'夜叉丸','男','13058160585','副店长',3242,2438),(13,2,'角都','男','15692083489','收银',34232,2349),(16,1,'鲁班大师','男','15623279830','仓管',40000,800),(17,1,'貂蝉','女','15623329830','陈列员',10323,244),(19,1,'甜甜','男','13927279830','前台',2132,1233),(20,2,'皮皮虾','男','15529203729','陈列员',2345,230),(21,2,'刘备','男','15629281294','后勤',2333,100),(23,2,'刘健','男','15529293920','仓管',0,0),(25,2,'孙尚香','女','15529283218','收银',0,0);

/*Table structure for table `goods` */

DROP TABLE IF EXISTS `goods`;

CREATE TABLE `goods` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `unit` varchar(255) DEFAULT NULL,
  `purchase_price` double DEFAULT NULL,
  `price` double DEFAULT NULL,
  `integral` bigint(20) DEFAULT NULL,
  `satisfaction` varchar(255) DEFAULT NULL,
  `discount_rate` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

/*Data for the table `goods` */

insert  into `goods`(`id`,`name`,`unit`,`purchase_price`,`price`,`integral`,`satisfaction`,`discount_rate`) values (2,'橘子罐头','瓶',6,7,7,'中',0.9),(3,'苹果手机','斤',3,4,4,'低',0.5),(4,'仓鼠','只',40,80,80,'中',0.8),(6,'康师傅泡面','桶',2.5,3.5,4,'高',1),(9,'蜂蜜','斤',20,25,25,'中',1),(10,'花生','斤',8,10,10,'低',1),(11,'话梅','袋',3,6,6,'中',1),(12,'蒙牛纯牛奶','斤',2,3,3,'高',1),(13,'伊利酸奶','斤',4,5,5,'高',1),(14,'雀巢咖啡','袋',1,2,2,'低',1);

/*Table structure for table `logistics` */

DROP TABLE IF EXISTS `logistics`;

CREATE TABLE `logistics` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `start_store_id` bigint(20) DEFAULT NULL,
  `end_store_id` bigint(20) DEFAULT NULL,
  `goods_id` bigint(20) DEFAULT NULL,
  `count` double DEFAULT NULL,
  `distance` double DEFAULT NULL,
  `weight` double DEFAULT NULL,
  `freight` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_end_logistics` (`end_store_id`),
  KEY `FK_start_logistics` (`start_store_id`),
  KEY `FK_logistics_goods_id` (`goods_id`),
  CONSTRAINT `FK_end_logistics` FOREIGN KEY (`end_store_id`) REFERENCES `store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_logistics_goods_id` FOREIGN KEY (`goods_id`) REFERENCES `goods` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_start_logistics` FOREIGN KEY (`start_store_id`) REFERENCES `store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

/*Data for the table `logistics` */

insert  into `logistics`(`id`,`start_store_id`,`end_store_id`,`goods_id`,`count`,`distance`,`weight`,`freight`) values (17,1,13,3,NULL,10000,333,233),(19,1,2,4,NULL,10000,2000,2000),(21,10,13,6,NULL,10000,3234,233),(24,10,13,12,NULL,3430000,84318,324445),(28,1,2,2,NULL,10000,2000,2000),(29,1,2,6,NULL,300,20,300);

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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

/*Data for the table `member` */

insert  into `member`(`id`,`card_number`,`name`,`sex`,`phone`,`integral`,`grade`) values (1,'420703199304300317','朱传瑾','女','13822197539',1000,'一'),(2,'420703198906307634','徐勤业','男','13822196739',1000,'一'),(3,'42070319971130039X','龚文伟','男','13822196379',1000,'一'),(4,'420703198603316752','徐立红','女','13822197139',1000,'一'),(5,'42070319941130601X','朱奇伟','男','13928873802',4000,'四'),(6,'420703198002295730','忻兆忠','男','13928872975',2000,'二'),(7,'420703198908311776','张道海','男','15323335558',3000,'三'),(8,'420703199111304979','刘轩非','男','15323333688',3000,'三'),(9,'42070319880930460X','范晓伟','男','13928873065',3000,'三'),(10,'420703198301316247','丁晓墅','女','13928873075',3000,'三'),(11,'420703199701312223','钟玉怡','女','13928873096',3000,'三'),(12,'420703200003317989','于美静','女','13928873175',4000,'四'),(13,'420703199709304965','朱海宜','女','13928873207',4000,'四'),(14,'420703199801312204','胡向红','女','13928873310',4000,'四'),(15,'420703199904306528','汪文闻','女','13928873537',4000,'四'),(16,'420703198508310889','汤艳梅','女','13928873562',4000,'四'),(17,'420703198904306101','左燕霞','女','13928873597',5000,'五'),(18,'420703198103310805','林伊凡','女','13928873617',5000,'五'),(19,'420703198512313767','周禹彤','女','13928873597',5000,'五'),(20,'4542424543','简单','男','1553239332',3253,'四'),(21,'420222199710026892','吕布','男','17629288721',2000,'二');

/*Table structure for table `merchandising` */

DROP TABLE IF EXISTS `merchandising`;

CREATE TABLE `merchandising` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `store_id` bigint(20) DEFAULT NULL,
  `goods_id` bigint(20) DEFAULT NULL,
  `employee_id` bigint(20) DEFAULT NULL,
  `count` double DEFAULT NULL,
  `sales` double DEFAULT NULL,
  `sales_date` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_store_id_merchandising` (`store_id`),
  KEY `FK_merchandising_goods_id` (`goods_id`),
  KEY `FK_merchandising_employee_id` (`employee_id`),
  CONSTRAINT `FK_merchandising_employee_id` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_merchandising_goods_id` FOREIGN KEY (`goods_id`) REFERENCES `goods` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_store_id_merchandising` FOREIGN KEY (`store_id`) REFERENCES `store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

/*Data for the table `merchandising` */

insert  into `merchandising`(`id`,`store_id`,`goods_id`,`employee_id`,`count`,`sales`,`sales_date`) values (3,2,6,20,4,20,'2020-04-23'),(12,2,6,20,66,330,'2020-04-23'),(13,2,4,20,300,6000,'2020-04-29'),(14,2,3,21,4000,20000,'2020-05-03'),(15,1,3,3,200,1000000,'2020-04-28'),(16,1,2,1,500,2500,'2020-04-30'),(17,1,4,17,5000,100000,'2020-05-05');

/*Table structure for table `stock` */

DROP TABLE IF EXISTS `stock`;

CREATE TABLE `stock` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `store_id` bigint(20) DEFAULT NULL,
  `goods_id` bigint(20) DEFAULT NULL,
  `sum` double DEFAULT NULL,
  `stock_date` varchar(255) DEFAULT NULL,
  `flag` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_stock_store_id` (`store_id`),
  KEY `FK_stock_goods_id` (`goods_id`),
  CONSTRAINT `FK_stock_goods_id` FOREIGN KEY (`goods_id`) REFERENCES `goods` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_stock_store_id` FOREIGN KEY (`store_id`) REFERENCES `store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

/*Data for the table `stock` */

insert  into `stock`(`id`,`store_id`,`goods_id`,`sum`,`stock_date`,`flag`) values (1,1,3,23,'2020-04-26',1),(2,2,4,288,'2020-04-26',0),(4,1,4,342,'2020-04-26',0),(5,2,12,323,'2020-04-26',0),(6,1,12,3232,'2020-04-26',0),(7,2,4,30000,'2020-04-30',1),(8,1,4,200,'2020-06-30',0),(9,2,12,600,'2020-04-28',0),(10,2,10,500,'2020-04-29',0),(11,2,4,300,'2020-04-28',0),(12,1,4,400,'2020-04-29',0),(13,2,4,400,'2020-04-30',1),(14,2,3,5000,'2020-04-28',0),(15,2,4,2000,'2020-04-28',1),(16,1,3,4000,'2020-05-02',1),(17,2,11,3000,'2020-05-02',0),(18,2,6,20,'2020-04-30',1),(19,2,6,43,'2020-04-30',1),(20,2,6,25,'2020-04-28',1),(21,2,3,46,'2020-05-11',1);

/*Table structure for table `stock_info` */

DROP TABLE IF EXISTS `stock_info`;

CREATE TABLE `stock_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `store_id` bigint(20) NOT NULL,
  `goods_id` bigint(20) NOT NULL,
  `sum` double NOT NULL,
  `warning_value` double NOT NULL,
  `stock_warning` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_stock_info_store_id` (`store_id`),
  KEY `FK_stock_info_goods_id` (`goods_id`),
  CONSTRAINT `FK_stock_info_goods_id` FOREIGN KEY (`goods_id`) REFERENCES `goods` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_stock_info_store_id` FOREIGN KEY (`store_id`) REFERENCES `store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `stock_info` */

insert  into `stock_info`(`id`,`store_id`,`goods_id`,`sum`,`warning_value`,`stock_warning`) values (1,2,3,1398,2000,'过少'),(2,1,2,555,2000,'过低'),(3,2,4,0,2000,'过少'),(4,2,6,28800,2000,'正常'),(5,2,2,3000,2000,'正常'),(6,1,3,400,2000,'过少'),(7,1,4,36000,2000,'过少'),(8,1,6,7209,2000,'过少');

/*Table structure for table `store` */

DROP TABLE IF EXISTS `store`;

CREATE TABLE `store` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `roles` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

/*Data for the table `store` */

insert  into `store`(`id`,`name`,`address`,`roles`) values (1,'罗森','伦敦','总店'),(2,'罗森','新疆','分店'),(10,'罗森','湖北省黄石市大冶市','分店'),(11,'罗森','巴黎','分店'),(13,'罗森','德国','分店'),(16,'罗森','巴西','分店');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `store_id` bigint(20) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_user` (`store_id`),
  CONSTRAINT `FK_user` FOREIGN KEY (`store_id`) REFERENCES `store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`id`,`store_id`,`username`,`password`) values (1,1,'gxs','guixiansong'),(2,2,'gxs1','gxs:::666');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
