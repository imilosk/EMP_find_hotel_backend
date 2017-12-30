-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Dec 30, 2017 at 08:56 PM
-- Server version: 10.1.29-MariaDB-1~xenial
-- PHP Version: 7.0.22-0ubuntu0.16.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `emp`
--

-- --------------------------------------------------------

--
-- Table structure for table `Countries`
--

CREATE TABLE `Countries` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Countries`
--

INSERT INTO `Countries` (`id`, `name`) VALUES
(2, 'Slovenia'),
(3, 'Italy');

-- --------------------------------------------------------

--
-- Table structure for table `Hotels`
--

CREATE TABLE `Hotels` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `rating` int(11) NOT NULL,
  `description` text NOT NULL,
  `wifi` int(11) NOT NULL,
  `parking` int(11) NOT NULL,
  `pet_allowed` int(11) NOT NULL,
  `fitness` int(11) NOT NULL,
  `food` int(11) NOT NULL,
  `countryID` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `img1` varchar(255) NOT NULL,
  `img2` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Hotels`
--

INSERT INTO `Hotels` (`id`, `name`, `address`, `rating`, `description`, `wifi`, `parking`, `pet_allowed`, `fitness`, `food`, `countryID`, `price`, `img1`, `img2`) VALUES
(1, 'Slon', 'Slovenska Cesta 34, Ljubljana', 4, 'The elegant Hotel Lev is in the heart of Ljubljana. It includes tastefully decorated and comfortable rooms, with views of Tivoli Park or the center of the city.\r\n\r\nThe property is a 5-minute walk from the many interesting sites in the historic quarter, close to the attractive historic center and the business district.\r\n\r\nHotel Lev provides 10 meeting and conference rooms on the 13th floor, with beautiful views around the city. On the ground floor, there is a conference and event hall which can host up to 400 participants. In this hall, working breakfasts, business lunches, gala dinners, receptions and parties can be organized.\r\n\r\nSavor modern cuisine with a Mediterranean touch in the exclusive à la carte restaurant Pri Levu or relax and enjoy casual conversation in the lobby bar.\r\n\r\nThere is a shuttle bus service to and from the airport which can be reached in a 25-minute drive, for an additional fee. \r\n\r\nThis is our guests\' favorite part of Ljubljana, according to independent reviews.\r\n\r\nCouples in particular like the location – they rated it 8.9 for a two-person trip.\r\n\r\nWe speak your language!', 1, 1, 1, 0, 1, 2, 110, 'slon1.jpg', 'slon2.jpg'),
(2, 'Lev', 'Vosnjakova 1, Ljubljana', 4, 'The elegant Hotel Lev is in the heart of Ljubljana. It includes tastefully decorated and comfortable rooms, with views of Tivoli Park or the center of the city.\r\n\r\nThe property is a 5-minute walk from the many interesting sites in the historic quarter, close to the attractive historic center and the business district.\r\n\r\nHotel Lev provides 10 meeting and conference rooms on the 13th floor, with beautiful views around the city. On the ground floor, there is a conference and event hall which can host up to 400 participants. In this hall, working breakfasts, business lunches, gala dinners, receptions and parties can be organized.\r\n\r\nSavor modern cuisine with a Mediterranean touch in the exclusive à la carte restaurant Pri Levu or relax and enjoy casual conversation in the lobby bar.\r\n\r\nThere is a shuttle bus service to and from the airport which can be reached in a 25-minute drive, for an additional fee. \r\n\r\nThis is our guests\' favorite part of Ljubljana, according to independent reviews.\r\n\r\nCouples in particular like the location – they rated it 8.9 for a two-person trip.\r\n\r\nWe speak your language!', 1, 1, 1, 1, 1, 2, 90, 'lev1.jpg', 'lev2.jpg'),
(3, 'Perla', 'Kidriceva Ulica 7, Nova Gorica', 4, 'Featuring free WiFi and a fitness center, Perla Casino & Hotel offers accommodations in Nova Gorica. There is a casino on site and guests can enjoy the on-site restaurant. Free private parking is available on site.\r\n\r\nCertain rooms have a private bathroom with a spa tub, and others have bathrobes and free toiletries. Certain accommodations include a sitting area where you can relax. A flat-screen TV is available.\r\n\r\nYou will find a 24-hour front desk, gift shop, and shops at the property.\r\n\r\nThe hotel also provides bike rental. Trieste is 35.4 km from Perla Casino & Hotel, and Portorož is 49.9 km away. The nearest airport is Brnik Airport, 69.2 km from the property. \r\n\r\nCouples in particular like the location – they rated it 8.5 for a two-person trip.\r\n\r\nWe speak your language!', 1, 1, 0, 1, 1, 2, 150, 'perla1.jpg', 'perla2.jpg'),
(5, 'Corte Contarina', 'Castello 1931, Via Garibaldi, Castello, Venice', 3, 'Hotel Corte Contarina offers pet-friendly accommodations in Venice. Guests can enjoy the on-site bar.\r\n\r\nSome accommodations feature a private bathroom with a spa tub, and others have free toiletries and a hairdryer. A terrace or balcony are featured in certain rooms. A flat-screen TV is featured.\r\n\r\nYou will find a 24-hour front desk at the property.\r\n\r\nSt. Mark\'s Basilica is 1.1 km from Hotel Corte Contarina, and Teatro La Fenice is one kilometer away. The nearest airport is Marco Polo Airport, 8 km from Hotel Corte Contarina. \r\n\r\nCastello is a great choice for travelers interested in museums, culture and old-town exploration.\r\n\r\nThis is our guests\' favorite part of Venice, according to independent reviews.\r\n\r\nCouples in particular like the location – they rated it 8.0 for a two-person trip.\r\n\r\nWe speak your language!', 1, 0, 1, 0, 1, 3, 55, 'corte1.jpg', 'corte2.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `Reservation`
--

CREATE TABLE `Reservation` (
  `id` int(11) NOT NULL,
  `dateFrom` date NOT NULL,
  `dateTo` date NOT NULL,
  `roomID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Reservation`
--

INSERT INTO `Reservation` (`id`, `dateFrom`, `dateTo`, `roomID`) VALUES
(12, '2017-12-30', '2017-12-31', 0);

-- --------------------------------------------------------

--
-- Table structure for table `Rooms`
--

CREATE TABLE `Rooms` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `price` int(11) NOT NULL,
  `img` varchar(255) NOT NULL,
  `hotelID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Rooms`
--

INSERT INTO `Rooms` (`id`, `name`, `description`, `price`, `img`, `hotelID`) VALUES
(1, 'Executive Queen Room', '? Personal bathroom\r\nRoom Size 18 m²\r\nThis double room features a minibar, air conditioning and bathrobe.\r\n\r\nRoom Facilities:\r\n\r\n• Minibar\r\n• Bathtub\r\n• Safe\r\n• Telephone\r\n• Air conditioning\r\n• Hairdryer\r\n• Suit press\r\n• Bathrobe\r\n• Radio\r\n• Desk\r\n• Free toiletries\r\n• Toilet\r\n• Bathroom\r\n• Extra long beds (> 6.5 ft)\r\n• Heating\r\n• Slippers\r\n• Cable channels\r\n• Carpeted\r\n• Flat-screen TV\r\n• Soundproof\r\n• View\r\n• Wake-up service\r\n• Wardrobe/Closet\r\n• Towels\r\n• Linens\r\nFree WiFi!', 110, 'lev_room1.jpg', 2),
(2, 'Classic Single Room', ' Personal bathroom\r\n\r\nRoom Size 18 m²\r\n\r\nThe single rooms are 194 ft² in size and feature a queen bed of 47 x 79 inches and city views.\r\n\r\nRoom Facilities:\r\n\r\n• Minibar\r\n• Shower\r\n• Bathtub\r\n• Safe\r\n• Telephone\r\n• Air conditioning\r\n• Hairdryer\r\n• Bathrobe\r\n• Radio\r\n• Desk\r\n• Free toiletries\r\n• Toilet\r\n• Bathroom\r\n• Heating\r\n• Slippers\r\n• Cable channels\r\n• Carpeted\r\n• Flat-screen TV\r\n• Wake-up service\r\n• Wardrobe/Closet\r\n• Towels\r\n• Linens\r\nFree WiFi!\r\n\r\n', 85, 'lev_room2.jpg', 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Countries`
--
ALTER TABLE `Countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Hotels`
--
ALTER TABLE `Hotels`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Reservation`
--
ALTER TABLE `Reservation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Rooms`
--
ALTER TABLE `Rooms`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Countries`
--
ALTER TABLE `Countries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `Hotels`
--
ALTER TABLE `Hotels`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `Reservation`
--
ALTER TABLE `Reservation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `Rooms`
--
ALTER TABLE `Rooms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
