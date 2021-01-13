-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 13, 2021 at 09:38 PM
-- Server version: 5.7.24
-- PHP Version: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hotel`
--

-- --------------------------------------------------------

--
-- Table structure for table `camere`
--

CREATE TABLE `camere` (
  `camere_ID` int(11) NOT NULL,
  `numero_camera` smallint(6) NOT NULL,
  `piano` tinyint(4) NOT NULL,
  `libera` tinyint(4) NOT NULL,
  `tipo` varchar(10) NOT NULL,
  `posti_letto` tinyint(4) NOT NULL,
  `prezzo_notte` float(5,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `camere`
--

INSERT INTO `camere` (`camere_ID`, `numero_camera`, `piano`, `libera`, `tipo`, `posti_letto`, `prezzo_notte`) VALUES
(1, 101, 1, 0, 'suite', 2, 115.21),
(2, 101, 1, 0, 'suite', 2, 115.21);

-- --------------------------------------------------------

--
-- Table structure for table `clienti`
--

CREATE TABLE `clienti` (
  `cliente_id` int(11) NOT NULL,
  `ospiti` smallint(6) NOT NULL,
  `nome` varchar(20) NOT NULL,
  `cognome` varchar(20) NOT NULL,
  `data_nascita` date DEFAULT NULL,
  `numero_documento` varchar(30) NOT NULL,
  `tipo_documento` varchar(50) NOT NULL,
  `saldo` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `clienti`
--

INSERT INTO `clienti` (`cliente_id`, `ospiti`, `nome`, `cognome`, `data_nascita`, `numero_documento`, `tipo_documento`, `saldo`) VALUES
(1, 2, 'Davide', 'Rinaldi', '2019-03-13', 'ab12345', 'Carta d\'identità', 1),
(2, 2, 'Davide', 'Rinaldi', '2019-03-13', 'ab12345', 'Carta d\'identità', 1);

-- --------------------------------------------------------

--
-- Table structure for table `prenotazioni`
--

CREATE TABLE `prenotazioni` (
  `prenotazione_id` int(11) NOT NULL,
  `cliente_prenotazione` int(11) DEFAULT NULL,
  `camera_prenotata` int(11) DEFAULT NULL,
  `data_check_in` datetime NOT NULL,
  `data_check_out_prevista` date DEFAULT NULL,
  `data_check_out_reale` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `prenotazioni`
--

INSERT INTO `prenotazioni` (`prenotazione_id`, `cliente_prenotazione`, `camera_prenotata`, `data_check_in`, `data_check_out_prevista`, `data_check_out_reale`) VALUES
(1, 1, 1, '2021-01-13 22:36:41', '2021-01-15', '2021-01-15 09:36:41'),
(2, 1, 1, '2021-01-13 22:36:41', '2021-01-15', '2021-01-15 09:36:41');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `camere`
--
ALTER TABLE `camere`
  ADD PRIMARY KEY (`camere_ID`);

--
-- Indexes for table `clienti`
--
ALTER TABLE `clienti`
  ADD PRIMARY KEY (`cliente_id`);

--
-- Indexes for table `prenotazioni`
--
ALTER TABLE `prenotazioni`
  ADD PRIMARY KEY (`prenotazione_id`),
  ADD KEY `cliente_prenotazione` (`cliente_prenotazione`),
  ADD KEY `camera_prenotata` (`camera_prenotata`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `camere`
--
ALTER TABLE `camere`
  MODIFY `camere_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `clienti`
--
ALTER TABLE `clienti`
  MODIFY `cliente_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `prenotazioni`
--
ALTER TABLE `prenotazioni`
  MODIFY `prenotazione_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `prenotazioni`
--
ALTER TABLE `prenotazioni`
  ADD CONSTRAINT `prenotazioni_ibfk_1` FOREIGN KEY (`cliente_prenotazione`) REFERENCES `clienti` (`cliente_id`),
  ADD CONSTRAINT `prenotazioni_ibfk_2` FOREIGN KEY (`camera_prenotata`) REFERENCES `camere` (`camere_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
