CREATE database `kulinatest` ;

USE `kulinatest`;

DROP TABLE IF EXISTS `orders`;

CREATE TABLE `orders` (
  `order_id` int(5) DEFAULT NULL,
  `user_id` int(4) DEFAULT NULL,
  `lunch_type` varchar(30) DEFAULT NULL,
  `days_of_subscription` INT DEFAULT null,
  `box` INT DEFAULT null
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `deliveries`;

CREATE TABLE `deliveries` (
  `delivery_id` int(6) DEFAULT NULL,
  `order_id` int(5) DEFAULT NULL,
  `delivery_date` DATE DEFAULT NULL,
  `box` INT DEFAULT null
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `cashbacks`;

CREATE TABLE `cashbacks` (
  `delivery_id` int(6) DEFAULT NULL,
  `cashback` INT DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


insert  into `orders`(`order_id`,`user_id`,`lunch_type`,`days_of_subscription`, `box`) values 
(91881,1011,'Basic Lunch',2,10),
(82191,1012,'Deluxe Lunch',5,8),
(73817,1011,'Healthy Lunch',3,3),
(91289,1013,'Healthy Lunch',10,1),
(81828,1012,'Deluxe Lunch',2,2),
(82917,1012,'Healthy Lunch',2,1);

insert  into `deliveries`(`delivery_id`,`order_id`,`delivery_date`, `box`) values 
(101910,91881,'2018-08-01',10),
(101891,82191,'2018-08-01',8),
(110000,91881,'2018-08-02',10),
(110011,82191,'2018-08-02',8),
(110200,72817,'2018-08-02',3),
(142932,91289,'2018-08-10',1),
(169281,81828,'2018-08-20',2),
(187181,81828,'2018-08-25',2) ;

insert  into `cashbacks`(`delivery_id`,`cashback` ) values
(101910,50000),
(101891,38400),
(110000,50000),
(110000,38400),
(110011,10500),
(110200,10500),
(169281,3000),
(187181,3000) ;
