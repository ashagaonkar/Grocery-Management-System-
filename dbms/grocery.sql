SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `supermarketdb`
--


-- --------------------------------------------------------


DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `totalAmount` (IN `billno` INT(9) UNSIGNED)  SELECT SUM(amount) FROM cart WHERE bill_no = billno$$

DELIMITER ;

--
-- Table structure for table `billing_counter`
--

CREATE TABLE `billing_counter` (
  `bill_no` int(9) NOT NULL,
  `customer_id` int(4) NOT NULL,
  `employee_id` int(3) NOT NULL,
  `bdate` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `billing_counter`
--

INSERT INTO `billing_counter` (`bill_no`, `customer_id`, `employee_id`, `bdate`) VALUES
(70, 1, 123, '2021-01-01 05:53:34'),
(72, 2, 234, '2021-01-03 11:43:07'),
(79, 3, 345, '2021-01-01 14:49:20'),
(80, 4, 456, '2021-01-02 16:06:14'),
(115, 5, 567, '2021-01-02 10:05:18'),
(120, 6, 234, '2021-01-03 09:22:49');


-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customer_id` int(4) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone_no` bigint(10) NOT NULL,
  `zipcode` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customer_id`, `name`, `email`, `phone_no`, `zipcode`) VALUES
(1, 'Virat', 'virat@gmail.com', 9632587410,581329),
(2, 'Rohit', 'rohit@gmail.com', 8965231470,560003 ),
(3, 'Dev', 'dev@gmail.com', 8523987410,581329 ),
(4, 'Rahul', 'rahul@gmail.com', 8563256989, 581325),
(5, 'Shikhar', 'shikhar@gmail.com', 9532568956,591304),
(6, 'Dinesh', 'dinesh@gmail.com', 9532568956,580021);

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `employee_id` int(3) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone_no` bigint(10) NOT NULL,
  `role` varchar(255) NOT NULL,
  `zipcode` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`employee_id`, `name`, `email`, `phone_no`, `role`, `zipcode`) VALUES
(123, 'Kartik', 'kartik@gmail.com', 9955117755, 'Biller', 581325),
(234, 'Vicky', 'vicky@gmail.com', 9658325614, 'Volunteer',581329),
(345, 'Vinod', 'vinod@gmail.com', 8695352665, 'Security guard', 581325),
(456, 'Amit', 'amit@gmail.com', 6369856325, 'Manager', 581325),
(567, 'Harsh', 'harsh@gmail.com', 6369856325, 'Biller', 581329);

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `payment_id` int(8) NOT NULL,
  `customer_id` int(4) NOT NULL,
  `pdate` datetime NOT NULL DEFAULT current_timestamp(),
  `amount` int(8) NOT NULL,
  `mode` varchar(255) NOT NULL,
  `bill_no` int(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`payment_id`, `customer_id`, `pdate`, `amount`, `mode`, `bill_no`) VALUES
(1, 1, '2021-01-01 05:53:53', 90, 'Cash', 70),
(2, 2, '2021-01-03 11:44:01', 190, 'Cash', 72),
(3, 3, '2021-01-01 14:49:52', 250, 'Cash', 79),
(4, 4, '2021-01-02 16:06:50', 600, 'Card', 80),
(5, 5, '2021-01-02 10:05:54', 1140, 'Card', 115),
(6, 6, '2021-01-03 09:23:21', 506, 'Cash', 120);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `model_id` int(5) NOT NULL,
  `type` varchar(255) NOT NULL,
  `name_id` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`model_id`, `type`, `name_id`) VALUES
(12111, 'Tea Powder', 1),
(12122, 'Dry Fruits', 2),
(12133, 'Chocolate', 3),
(12144,'Grains', 4),
(12155,'Oil',5);


-- --------------------------------------------------------

--
-- Table structure for table `product_shelves`
--

CREATE TABLE `product_shelves` (
  `shelf_id` int(2) NOT NULL,
  `type` varchar(255) NOT NULL,
  `category` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product_shelves`
--

INSERT INTO `product_shelves` (`shelf_id`, `type`, `category`) VALUES
(1, 'Tea Powder', 'Daily Needs'),
(2, 'Dry Fruits', 'Packet Food Item'),
(3, 'Chocolate', 'Sweets'),
(4, 'Grains', 'Cooking Item'),
(5, 'Oil','Cooking Item');

-- --------------------------------------------------------

--
-- Table structure for table `p_name`
--

CREATE TABLE `p_name` (
  `name_id` int(5) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` int(8) NOT NULL,
  `quantity` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `p_name`
--

INSERT INTO `p_name` (`name_id`, `name`, `price`, `quantity`) VALUES
(1, 'Red Label', 80, 200),
(2, 'Almond', 150, 150),
(3, 'Dairy Milk', 100, 100),
(4, 'Rice', 300, 500),
(5, 'Olive Oil', 350, 250);


-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`username`, `password`) VALUES
('admin', 'admin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `billing_counter`
--
ALTER TABLE `billing_counter`
  ADD PRIMARY KEY (`bill_no`),
  ADD UNIQUE KEY `bill_no` (`bill_no`),
  ADD KEY `fk_bcid` (`customer_id`),
  ADD KEY `fk_beid` (`employee_id`);


--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`),
  ADD KEY `fk_zipcode` (`zipcode`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`employee_id`),
  ADD KEY `fk_ezip` (`zipcode`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `fk_pbno` (`bill_no`),
  ADD KEY `fk_pcid` (`customer_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`model_id`),
  ADD KEY `fk_pnid` (`name_id`),
  ADD KEY `fk_ptype` (`type`);

--
-- Indexes for table `product_shelves`
--
ALTER TABLE `product_shelves`
  ADD PRIMARY KEY (`shelf_id`,`type`),
  ADD UNIQUE KEY `type` (`type`);

--
-- Indexes for table `p_name`
--
ALTER TABLE `p_name`
  ADD PRIMARY KEY (`name_id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `billing_counter`
--
ALTER TABLE `billing_counter`
  MODIFY `bill_no` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `customer_id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `employee_id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `payment_id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `model_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12166;

--
-- AUTO_INCREMENT for table `product_shelves`
--
ALTER TABLE `product_shelves`
  MODIFY `shelf_id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `p_name`
--
ALTER TABLE `p_name`
  MODIFY `name_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `billing_counter`
--
ALTER TABLE `billing_counter`
  ADD CONSTRAINT `fk_bcid` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_beid` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`) ON DELETE CASCADE ON UPDATE CASCADE;


-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `fk_pbno` FOREIGN KEY (`bill_no`) REFERENCES `billing_counter` (`bill_no`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_pcid` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `fk_pnid` FOREIGN KEY (`name_id`) REFERENCES `p_name` (`name_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_ptype` FOREIGN KEY (`type`) REFERENCES `product_shelves` (`type`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

Desc users;
Desc Customer;
Desc employee;
Desc Product;
Desc product_shelves;
Desc p_name;
Desc billing_counter;
Desc Payment;

select* from users;
select* from customer;
select*from employee;
select*from product;
select*from product_shelves;
select*from p_name;
select*from billing_counter;
select*from payment;

select name,email,phone_no
from customer As C ,payment As P
where P.mode='card' AND
      P.customer_id = C.customer_id;
	
select *
from employee
where zipcode= 581329;

select name,price,quantity,model_id
from p_name As p1, product As p, product_shelves As ps
where p1.name_id = p.name_id AND
      ps.category ='Sweets' AND
      ps.type =p.type;

select bdate, bill_no,e.email,e.name,c.name,c.email
from billing_counter As b,customer As c,employee As e
where b.customer_id = 4 AND
	   c.customer_id=b.customer_id AND
       e.employee_id=b.employee_id;
       
select bdate,pdate,amount,mode,email,zipcode
from  billing_counter As b, Payment As p, customer As c
where c.name='Virat' AND
      c.customer_id=p.customer_id AND
      b.bill_no=p.bill_no;