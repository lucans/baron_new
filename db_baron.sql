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
  `telefone` varchar(20) DEFAULT NULL,
  `ultima_compra` date DEFAULT NULL,
  `ativo` varchar(1) DEFAULT 'S',
  PRIMARY KEY (`codcliente`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

/*Data for the table `clientes` */

insert  into `clientes`(`codcliente`,`nome`,`endereco`,`telefone`,`ultima_compra`,`ativo`) values 
(1,'Lucas','Rua Miguel Munhoz','11 4585 9685','2017-02-02','S'),
(2,'Débora','Rua Nami Azen','11 5454 8585','2017-03-02','S'),
(3,'Eliane','Rua Brasil','11 5646 4565','2017-03-01','S'),
(6,'lucas 3','asdasd rau','11 54 65465 4','2017-03-01','S'),
(9,'JOSE FA PHILVA','RUA ALABARDO','11 4585 9696','2017-03-01','S'),
(10,'AQUELE PILANTRA','NA RUA SAFADA','11 5454 8585','2017-01-03','S'),
(11,'JOAO DO CAMINHAO','RUA MARABARES','11 5454 8585','2017-03-04','S'),
(12,'CLIENTE 1','RUA CLIENTE 1','11 5454 8585','2017-03-02','S'),
(13,'asd','asd','4585 8585','2017-03-15','S');

/*Table structure for table `estoques` */

DROP TABLE IF EXISTS `estoques`;

CREATE TABLE `estoques` (
  `codestoque` int(10) NOT NULL AUTO_INCREMENT,
  `dia` date DEFAULT NULL,
  `qtd` int(100) DEFAULT NULL,
  `obs` varchar(255) DEFAULT NULL,
  `tipo` enum('P13','P20','P45') DEFAULT NULL,
  `preco` int(11) DEFAULT NULL,
  PRIMARY KEY (`codestoque`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

/*Data for the table `estoques` */

insert  into `estoques`(`codestoque`,`dia`,`qtd`,`obs`,`tipo`,`preco`) values 
(6,'2017-01-23',5,'NFE 5456','P45',120),
(7,'2017-01-02',50,'NFE 5456','P13',60),
(12,'2017-01-02',20,'NFE 987123','P20',70),
(13,'2017-02-06',20,'asd','P13',60),
(14,'2017-02-07',20,'ASD','P13',60),
(15,'2017-02-06',20,'ASD','P20',70),
(16,'2017-02-23',20,'NFE 123','P13',60),
(17,'2017-02-23',20,'asdasd','P45',120),
(18,'2017-02-21',20,'AI SIM PARTAO ME','P45',120),
(19,'2017-02-06',20,'qqqqqqqqqqqqqqq','P13',60),
(20,'2017-02-28',20,'NFE: 6487','P13',60),
(21,'2017-02-28',10,'NFE: 123','P20',0),
(22,'2017-02-28',10,'NFE: 123','P20',0),
(23,'2017-02-28',10,'NFE: 123','P45',90),
(24,'2017-03-30',55,'NFE: 123123','P13',45);

/*Table structure for table `pedidos` */

DROP TABLE IF EXISTS `pedidos`;

CREATE TABLE `pedidos` (
  `codpedido` int(10) NOT NULL AUTO_INCREMENT,
  `coduser` int(11) NOT NULL,
  `codcliente` int(10) DEFAULT NULL,
  `dia` date DEFAULT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `endereco` varchar(255) DEFAULT NULL,
  `telefone` varchar(15) DEFAULT NULL,
  `qtd` int(10) DEFAULT NULL,
  `dtcadastro` date DEFAULT NULL,
  `dtpagamento` date DEFAULT NULL,
  `previsao` date DEFAULT NULL,
  `entrega` enum('pendente','entregue') DEFAULT 'pendente',
  `pagamento` enum('pago','fiado') DEFAULT 'pago',
  `tipo` enum('P13','P20','P45') DEFAULT 'P13',
  `preco` float DEFAULT NULL,
  PRIMARY KEY (`codpedido`)
) ENGINE=InnoDB AUTO_INCREMENT=119 DEFAULT CHARSET=latin1;

/*Data for the table `pedidos` */

insert  into `pedidos`(`codpedido`,`coduser`,`codcliente`,`dia`,`nome`,`endereco`,`telefone`,`qtd`,`dtcadastro`,`dtpagamento`,`previsao`,`entrega`,`pagamento`,`tipo`,`preco`) values 
(15,1,NULL,'2017-01-22','Lucas','Rua Pedro','11 5485 8596',1,'0000-00-00',NULL,'2017-01-06','entregue','fiado','P20',80),
(16,1,NULL,'2017-01-25','Maria','Rua Jose','11 6548 9875',1,NULL,NULL,'2017-02-04','entregue','fiado','P20',80),
(18,1,NULL,'2017-01-25','Débora','Rua Miguel','01233511',1,'0000-00-00',NULL,'2017-02-12','entregue','fiado','P20',80),
(19,1,NULL,'2017-02-04','Carlos','Rua Marajá','116465465465',1,'0000-00-00',NULL,'2017-02-24','entregue','fiado','P20',80),
(36,1,NULL,'2017-02-10','Lucas','Rua Miguel','116546546',1,NULL,'2017-02-10',NULL,'pendente','pago','P13',55),
(37,1,NULL,'2017-02-11','Joao Maria','Rua darling','5465465456',1,NULL,'2017-02-11',NULL,'pendente','pago','P13',55),
(38,1,NULL,'2017-02-06','asd','asd','123',1,NULL,'2017-02-06',NULL,'pendente','pago','P13',55),
(39,1,NULL,'2017-02-06','asd','asd','asd',1,NULL,'2017-02-06',NULL,'pendente','pago','P13',55),
(40,1,NULL,'2017-02-06','123','123','123',1,NULL,'2017-02-06',NULL,'pendente','pago','P13',55),
(41,1,NULL,'2017-02-06','asd','ad',NULL,1,NULL,'2017-02-06',NULL,'pendente','pago','P45',120),
(42,1,NULL,'2017-02-06','asd','asd','123123123',1,NULL,'2017-02-06',NULL,'pendente','pago','P13',55),
(43,1,NULL,'2017-02-06','123','123','123',1,NULL,'2017-02-06',NULL,'pendente','pago','P13',55),
(44,1,NULL,'2017-02-07','asd','asd','asd',1,NULL,'2017-02-07',NULL,'pendente','pago','P45',120),
(45,1,NULL,'2017-02-06','asd','asd','asd',1,NULL,'2017-02-06',NULL,'pendente','pago','P13',55),
(46,1,NULL,'2017-02-09','ASD','ASD','ASD',1,NULL,'2017-02-09',NULL,'pendente','pago','P20',80),
(47,1,NULL,'2017-02-06','ASD','ASD','AD',1,NULL,'2017-02-06',NULL,'pendente','pago','P20',80),
(49,1,NULL,'2017-02-06','123','123','123',1,NULL,'2017-02-06',NULL,'pendente','pago','P13',55),
(50,1,NULL,'2017-02-13','123','123','123',1,NULL,'2017-02-13',NULL,'pendente','pago','P13',55),
(51,1,NULL,'2017-02-06','asd','asd','asd',1,NULL,'2017-02-06',NULL,'pendente','pago','P13',55),
(52,1,NULL,'2017-02-01','123','123','123',1,NULL,'2017-02-01',NULL,'pendente','pago','P13',55),
(53,1,NULL,'2017-02-01','asd','asd','asd',1,NULL,'2017-02-01',NULL,'pendente','pago','P13',55),
(54,1,NULL,'2017-02-01','123','123','123',1,NULL,'2017-02-01',NULL,'pendente','pago','P13',55),
(55,1,NULL,'2017-02-23','Lucas','Rua Mihuel Munhoz','11 65465 4654',1,NULL,'2017-02-23',NULL,'pendente','pago','P13',55),
(56,1,NULL,'2017-02-22','Joao Maria','Rua legal','165 4564 6545',1,NULL,'2017-02-22',NULL,'pendente','pago','P13',55),
(58,1,NULL,'2017-02-08','Joao Maria','Rua legal','165 4564 6545',1,NULL,'2017-02-08',NULL,'pendente','pago','P13',55),
(59,1,NULL,'2017-02-14','Joao Maria','Rua legal','165 4564 6545',1,NULL,'2017-02-14',NULL,'pendente','pago','P13',55),
(60,1,NULL,'2017-02-12','Joao Maria','Rua legal','165 4564 6545',1,NULL,'2017-02-12',NULL,'pendente','pago','P13',55),
(61,1,NULL,'2017-02-10','Joao Maria','Rua legal','165 4564 6545',1,NULL,'2017-02-10',NULL,'pendente','pago','P13',55),
(62,1,NULL,'2017-02-18','Joao Maria','Rua legal','165 4564 6545',1,NULL,'2017-02-18',NULL,'pendente','pago','P13',55),
(63,1,NULL,'2017-02-27','Joao Maria','Rua legal','165 4564 6545',1,NULL,'2017-02-27',NULL,'pendente','pago','P13',55),
(64,1,NULL,'2017-02-21','Joao Maria','Rua legal','165 4564 6545',1,NULL,'2017-02-21',NULL,'entregue','pago','P13',55),
(65,1,NULL,'2017-02-05','lucao','do caminhao','465446545',1,NULL,'2017-02-05',NULL,'pendente','pago','P45',120),
(66,1,NULL,'2017-02-27','AD','AD','654654',1,NULL,'2017-02-27',NULL,'pendente','pago','P20',80),
(67,1,NULL,'2017-02-27','ADASDASD','ADASDASD','654654123',1,NULL,'2017-02-27',NULL,'entregue','pago','P45',120),
(68,1,NULL,'2017-02-15','Debora','legal','545645',1,NULL,NULL,NULL,'entregue','fiado','P13',55),
(69,1,NULL,'2017-02-14','Rogerio legal','Rua melesquente','54 654 6545 4',7,NULL,'2017-02-14',NULL,'pendente','pago','P13',NULL),
(70,1,NULL,'2017-02-25','asdasd','eoqqqqq','5456465',1,NULL,'2017-02-25',NULL,'pendente','pago','P45',NULL),
(71,1,NULL,'2017-02-28','Maria do carmo','rua joao maria','11 654654 65456',1,NULL,'2017-02-28',NULL,'pendente','pago','P13',0),
(72,1,NULL,'2017-02-28','Maria do carmo','rua joao maria','11 654654 65456',1,NULL,'2017-02-28',NULL,'pendente','pago','P45',0),
(73,1,NULL,'2017-02-28','Maria do carmo 2','rua joao maria 2','11 654654 65456',1,NULL,'2017-02-28',NULL,'pendente','pago','P20',0),
(74,1,NULL,'2017-02-28','Maria do carmo 23','rua joao maria 23','11 654654 65456',1,NULL,'2017-02-28',NULL,'pendente','pago','P20',0),
(75,1,NULL,'2017-02-28','Maria do carmo 23','rua joao maria 23','11 654654 65456',1,NULL,'2017-02-28',NULL,'pendente','pago','P20',0),
(76,1,NULL,'2017-02-28','123123123','123123123','123123123',1,NULL,'2017-02-28',NULL,'pendente','pago','P20',0),
(77,1,NULL,'2017-02-28','123123123','123123123','123123123',1,NULL,'2017-02-28',NULL,'pendente','pago','P20',0),
(78,1,NULL,'2017-02-28','123123123','123123123','123123123',1,NULL,'2017-02-28',NULL,'pendente','pago','P20',0),
(79,1,NULL,'2017-02-28','123123123','123123123','123123123',1,NULL,'2017-02-28',NULL,'pendente','pago','P20',0),
(80,1,NULL,'2017-02-28','123123123','123123123','123123123',1,NULL,'2017-02-28',NULL,'pendente','pago','P20',0),
(81,1,NULL,'2017-02-28','123123123','123123123','123123123',1,NULL,'2017-02-28',NULL,'pendente','pago','P20',0),
(82,1,NULL,'2017-02-28','123123123','123123123','123123123',1,NULL,'2017-02-28',NULL,'pendente','pago','P13',60),
(83,1,NULL,'2017-02-28','123123123','123123123','123123123',1,NULL,'2017-02-28',NULL,'pendente','pago','P13',60),
(84,1,NULL,'2017-03-01','MARIO','DA','5646546545',1,NULL,'2017-03-01',NULL,'entregue','pago','P13',60),
(94,1,NULL,'2017-03-09','JOSE DA PHILVA','RUA MARMELO','11 654 654564',2,'0000-00-00','2017-02-24','2017-04-01','entregue','pago','P13',60),
(95,1,NULL,'2017-03-04','RUA EMI','EMINAS','123 12 312 3',1,'2017-02-25','2017-02-25',NULL,'entregue','pago','P13',60),
(96,1,NULL,'2017-02-27','debora','rua tal','3515645',1,'2017-02-28',NULL,NULL,'pendente','pago','P13',60),
(101,0,NULL,'0000-00-00','JOSE FA PHILVA','RUA ALABARDO','11 4585 9696',1,NULL,NULL,NULL,'pendente','pago','P13',NULL),
(103,0,NULL,'0000-00-00','JOSE FA PHILVA','RUA ALABARDO','11 4585 9696',1,NULL,NULL,NULL,'pendente','pago','P13',NULL),
(105,0,NULL,'0000-00-00','JOSE FA PHILVA','RUA ALABARDO','11 4585 9696',1,NULL,NULL,NULL,'pendente','pago','P13',NULL),
(114,1,3,'2017-03-10','Eliane','Rua Brasil','11 5646 4565',1,'2017-03-02',NULL,NULL,'pendente','pago','P13',60),
(116,1,NULL,'2017-03-04','JOAO DO CAMINHAO','RUA MARABARES','11 5454 8585',1,'2017-03-02',NULL,NULL,'pendente','pago','P20',70),
(117,1,NULL,'2017-03-02','CLIENTE 1','RUA CLIENTE 1','11 5454 8585',1,'2017-03-02',NULL,NULL,'pendente','pago','P13',60),
(118,1,NULL,'2017-03-15','asd','asd','4585 8585',1,'2017-03-02','2017-03-01',NULL,'entregue','pago','P13',60);

/*Table structure for table `precos` */

DROP TABLE IF EXISTS `precos`;

CREATE TABLE `precos` (
  `codpreco` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(5) DEFAULT NULL,
  `preco_custo` float DEFAULT '0',
  `preco_venda` float DEFAULT '0',
  PRIMARY KEY (`codpreco`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `precos` */

insert  into `precos`(`codpreco`,`tipo`,`preco_custo`,`preco_venda`) values 
(1,'P13',45,60),
(2,'P20',55,70),
(3,'P45',90,120);

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
