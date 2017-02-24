/*
SQLyog Community v12.2.1 (64 bit)
MySQL - 10.1.10-MariaDB : Database - db_baron
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`db_baron` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `db_baron`;

/*Table structure for table `clientes` */

DROP TABLE IF EXISTS `clientes`;

CREATE TABLE `clientes` (
  `codcliente` int(10) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) DEFAULT NULL,
  `endereco` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`codcliente`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `clientes` */

/*Table structure for table `estoques` */

DROP TABLE IF EXISTS `estoques`;

CREATE TABLE `estoques` (
  `codestoque` int(10) NOT NULL AUTO_INCREMENT,
  `dia` date DEFAULT NULL,
  `qtd` int(100) DEFAULT NULL,
  `obs` varchar(255) DEFAULT NULL,
  `tipo` enum('P13','P20','P45') DEFAULT NULL,
  PRIMARY KEY (`codestoque`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

/*Data for the table `estoques` */

insert  into `estoques`(`codestoque`,`dia`,`qtd`,`obs`,`tipo`) values 
(6,'2017-01-23',5,'NFE 5456','P45'),
(7,'2017-01-02',50,'NFE 5456','P13'),
(12,'2017-01-02',20,'NFE 987123','P20'),
(13,'2017-02-06',20,'asd','P13'),
(14,'2017-02-07',20,'ASD','P13'),
(15,'2017-02-06',20,'ASD','P20'),
(16,'2017-02-23',20,'NFE 123','P13'),
(17,'2017-02-23',20,'asdasd','P45'),
(18,'2017-02-21',20,'AI SIM PARTAO ME','P45'),
(19,'2017-02-06',20,'qqqqqqqqqqqqqqq','P13');

/*Table structure for table `pedidos` */

DROP TABLE IF EXISTS `pedidos`;

CREATE TABLE `pedidos` (
  `codpedido` int(10) NOT NULL AUTO_INCREMENT,
  `coduser` int(11) NOT NULL,
  `dia` date DEFAULT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `endereco` varchar(255) DEFAULT NULL,
  `telefone` varchar(15) DEFAULT NULL,
  `qtd` int(10) DEFAULT NULL,
  `dtcadastro` date DEFAULT NULL,
  `previsao` date DEFAULT NULL,
  `entrega` enum('pendente','entregue') DEFAULT 'pendente',
  `pagamento` enum('pago','fiado') DEFAULT 'pago',
  `tipo` enum('P13','P20','P45') DEFAULT 'P13',
  `preco` float DEFAULT NULL,
  PRIMARY KEY (`codpedido`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=latin1;

/*Data for the table `pedidos` */

insert  into `pedidos`(`codpedido`,`coduser`,`dia`,`nome`,`endereco`,`telefone`,`qtd`,`dtcadastro`,`previsao`,`entrega`,`pagamento`,`tipo`,`preco`) values 
(15,1,'2017-01-22','Lucas','Rua Pedro','11 5485 8596',1,'0000-00-00','2017-01-06','entregue','fiado','P20',80),
(16,1,'2017-01-25','Maria','Rua Jose','11 6548 9875',1,NULL,'2017-02-04','entregue','fiado','P20',80),
(18,1,'2017-01-25','Débora','Rua Miguel','01233511',1,'0000-00-00','2017-02-12','entregue','fiado','P20',80),
(19,1,'2017-02-04','Carlos','Rua Marajá','116465465465',1,'0000-00-00','2017-02-24','entregue','fiado','P20',80),
(36,1,'2017-02-10','Lucas','Rua Miguel','116546546',1,NULL,NULL,'pendente','pago','P13',55),
(37,1,'2017-02-11','Joao Maria','Rua darling','5465465456',1,NULL,NULL,'pendente','pago','P13',55),
(38,1,'2017-02-06','asd','asd','123',1,NULL,NULL,'pendente','pago','P13',55),
(39,1,'2017-02-06','asd','asd','asd',1,NULL,NULL,'pendente','pago','P13',55),
(40,1,'2017-02-06','123','123','123',1,NULL,NULL,'pendente','pago','P13',55),
(41,1,'2017-02-06','asd','ad',NULL,1,NULL,NULL,'pendente','pago','P45',120),
(42,1,'2017-02-06','asd','asd','123123123',1,NULL,NULL,'pendente','pago','P13',55),
(43,1,'2017-02-06','123','123','123',1,NULL,NULL,'pendente','pago','P13',55),
(44,1,'2017-02-07','asd','asd','asd',1,NULL,NULL,'pendente','pago','P45',120),
(45,1,'2017-02-06','asd','asd','asd',1,NULL,NULL,'pendente','pago','P13',55),
(46,1,'2017-02-09','ASD','ASD','ASD',1,NULL,NULL,'pendente','pago','P20',80),
(47,1,'2017-02-06','ASD','ASD','AD',1,NULL,NULL,'pendente','pago','P20',80),
(49,1,'2017-02-06','123','123','123',1,NULL,NULL,'pendente','pago','P13',55),
(50,1,'2017-02-13','123','123','123',1,NULL,NULL,'pendente','pago','P13',55),
(51,1,'2017-02-06','asd','asd','asd',1,NULL,NULL,'pendente','pago','P13',55),
(52,1,'2017-02-01','123','123','123',1,NULL,NULL,'pendente','pago','P13',55),
(53,1,'2017-02-01','asd','asd','asd',1,NULL,NULL,'pendente','pago','P13',55),
(54,1,'2017-02-01','123','123','123',1,NULL,NULL,'pendente','pago','P13',55),
(55,1,'2017-02-23','Lucas','Rua Mihuel Munhoz','11 65465 4654',1,NULL,NULL,'pendente','pago','P13',55),
(56,1,'2017-02-22','Joao Maria','Rua legal','165 4564 6545',1,NULL,NULL,'pendente','pago','P13',55),
(57,1,'2017-02-28','Joao Maria','Rua legal','165 4564 6545',1,'0000-00-00','2017-02-27','entregue','fiado','P13',55),
(58,1,'2017-02-08','Joao Maria','Rua legal','165 4564 6545',1,NULL,NULL,'pendente','pago','P13',55),
(59,1,'2017-02-14','Joao Maria','Rua legal','165 4564 6545',1,NULL,NULL,'pendente','pago','P13',55),
(60,1,'2017-02-12','Joao Maria','Rua legal','165 4564 6545',1,NULL,NULL,'pendente','pago','P13',55),
(61,1,'2017-02-10','Joao Maria','Rua legal','165 4564 6545',1,NULL,NULL,'pendente','pago','P13',55),
(62,1,'2017-02-18','Joao Maria','Rua legal','165 4564 6545',1,NULL,NULL,'pendente','pago','P13',55),
(63,1,'2017-02-27','Joao Maria','Rua legal','165 4564 6545',1,NULL,NULL,'pendente','pago','P13',55),
(64,1,'2017-02-21','Joao Maria','Rua legal','165 4564 6545',1,NULL,NULL,'entregue','pago','P13',55),
(65,1,'2017-02-05','lucao','do caminhao','465446545',1,NULL,NULL,'pendente','pago','P45',120),
(66,1,'2017-02-27','AD','AD','654654',1,NULL,NULL,'pendente','pago','P20',80),
(67,1,'2017-02-27','ADASDASD','ADASDASD','654654123',1,NULL,NULL,'entregue','pago','P45',120),
(68,1,'2017-02-15','Debora','legal','545645',1,NULL,NULL,'entregue','fiado','P13',55),
(69,1,'2017-02-14','Rogerio legal','Rua melesquente','54 654 6545 4',7,NULL,NULL,'pendente','pago','P13',NULL);

/*Table structure for table `precos` */

DROP TABLE IF EXISTS `precos`;

CREATE TABLE `precos` (
  `codpreco` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(5) DEFAULT NULL,
  `preco` float DEFAULT NULL,
  PRIMARY KEY (`codpreco`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `precos` */

insert  into `precos`(`codpreco`,`tipo`,`preco`) values 
(1,'P13',55),
(2,'P20',70),
(3,'P45',120);

/*Table structure for table `usuarios` */

DROP TABLE IF EXISTS `usuarios`;

CREATE TABLE `usuarios` (
  `coduser` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `tema` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`coduser`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `usuarios` */

insert  into `usuarios`(`coduser`,`email`,`password`,`tema`) values 
(1,'lucas','123','blue darken-3');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
