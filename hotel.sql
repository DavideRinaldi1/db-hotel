-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Creato il: Gen 13, 2021 alle 16:03
-- Versione del server: 5.7.24
-- Versione PHP: 7.4.1

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
-- Struttura della tabella `camere`
--

CREATE TABLE `camere` (
  `camere_ID` int(11) NOT NULL,
  `numero_camera` smallint(6) NOT NULL,
  `piano` tinyint(4) NOT NULL,
  `libera` tinyint(4) NOT NULL,
  `tipo` varchar(10) NOT NULL,
  `posti_letto` tinyint(4) NOT NULL,
  `prezzo_notte` float(3,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `clienti`
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

-- --------------------------------------------------------

--
-- Struttura della tabella `prenotazioni`
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
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `camere`
--
ALTER TABLE `camere`
  ADD PRIMARY KEY (`camere_ID`);

--
-- Indici per le tabelle `clienti`
--
ALTER TABLE `clienti`
  ADD PRIMARY KEY (`cliente_id`);

--
-- Indici per le tabelle `prenotazioni`
--
ALTER TABLE `prenotazioni`
  ADD PRIMARY KEY (`prenotazione_id`),
  ADD KEY `cliente_prenotazione` (`cliente_prenotazione`),
  ADD KEY `camera_prenotata` (`camera_prenotata`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `camere`
--
ALTER TABLE `camere`
  MODIFY `camere_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `clienti`
--
ALTER TABLE `clienti`
  MODIFY `cliente_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `prenotazioni`
--
ALTER TABLE `prenotazioni`
  MODIFY `prenotazione_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `prenotazioni`
--
ALTER TABLE `prenotazioni`
  ADD CONSTRAINT `prenotazioni_ibfk_1` FOREIGN KEY (`cliente_prenotazione`) REFERENCES `clienti` (`cliente_id`),
  ADD CONSTRAINT `prenotazioni_ibfk_2` FOREIGN KEY (`camera_prenotata`) REFERENCES `camere` (`camere_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
