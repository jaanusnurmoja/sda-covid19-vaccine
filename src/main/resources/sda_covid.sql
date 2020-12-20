-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Loomise aeg: Dets 20, 2020 kell 11:53 EL
-- Serveri versioon: 10.4.11-MariaDB
-- PHP versioon: 7.4.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Andmebaas: `sda_covid`
--

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `appointments`
--

CREATE TABLE `appointments` (
  `appointmentId` int(11) NOT NULL,
  `dateTime` datetime(6) DEFAULT NULL,
  `doctorId` int(11) DEFAULT NULL,
  `patientId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_estonian_ci;

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `doctors`
--

CREATE TABLE `doctors` (
  `doctorId` int(11) NOT NULL,
  `regNr` int(11) NOT NULL,
  `personId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_estonian_ci;

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `patients`
--

CREATE TABLE `patients` (
  `patientId` int(11) NOT NULL,
  `regNr` int(11) NOT NULL,
  `personId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_estonian_ci;

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `persons`
--

CREATE TABLE `persons` (
  `personId` int(11) NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_estonian_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8mb4_estonian_ci DEFAULT NULL,
  `dateOfBirth` date DEFAULT NULL,
  `firstName` varchar(255) COLLATE utf8mb4_estonian_ci DEFAULT NULL,
  `lastName` varchar(255) COLLATE utf8mb4_estonian_ci DEFAULT NULL,
  `sex` varchar(255) COLLATE utf8mb4_estonian_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_estonian_ci;

--
-- Indeksid tõmmistatud tabelitele
--

--
-- Indeksid tabelile `appointments`
--
ALTER TABLE `appointments`
  ADD PRIMARY KEY (`appointmentId`),
  ADD KEY `FKfr6ryn81fr0cw9nr6ndeh83j4` (`doctorId`),
  ADD KEY `FK2cmes5mhnur5v94homivrcxml` (`patientId`);

--
-- Indeksid tabelile `doctors`
--
ALTER TABLE `doctors`
  ADD PRIMARY KEY (`doctorId`),
  ADD KEY `FK1kx7ajk4p6g96ydldknsx2gux` (`personId`);

--
-- Indeksid tabelile `patients`
--
ALTER TABLE `patients`
  ADD PRIMARY KEY (`patientId`),
  ADD KEY `FK2tai7ue8vruliy0i6mjdr81r4` (`personId`);

--
-- Indeksid tabelile `persons`
--
ALTER TABLE `persons`
  ADD PRIMARY KEY (`personId`);

--
-- AUTO_INCREMENT tõmmistatud tabelitele
--

--
-- AUTO_INCREMENT tabelile `appointments`
--
ALTER TABLE `appointments`
  MODIFY `appointmentId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT tabelile `doctors`
--
ALTER TABLE `doctors`
  MODIFY `doctorId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT tabelile `patients`
--
ALTER TABLE `patients`
  MODIFY `patientId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT tabelile `persons`
--
ALTER TABLE `persons`
  MODIFY `personId` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tõmmistatud tabelite piirangud
--

--
-- Piirangud tabelile `appointments`
--
ALTER TABLE `appointments`
  ADD CONSTRAINT `FK2cmes5mhnur5v94homivrcxml` FOREIGN KEY (`patientId`) REFERENCES `patients` (`patientId`),
  ADD CONSTRAINT `FKfr6ryn81fr0cw9nr6ndeh83j4` FOREIGN KEY (`doctorId`) REFERENCES `doctors` (`doctorId`);

--
-- Piirangud tabelile `doctors`
--
ALTER TABLE `doctors`
  ADD CONSTRAINT `FK1kx7ajk4p6g96ydldknsx2gux` FOREIGN KEY (`personId`) REFERENCES `persons` (`personId`);

--
-- Piirangud tabelile `patients`
--
ALTER TABLE `patients`
  ADD CONSTRAINT `FK2tai7ue8vruliy0i6mjdr81r4` FOREIGN KEY (`personId`) REFERENCES `persons` (`personId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
