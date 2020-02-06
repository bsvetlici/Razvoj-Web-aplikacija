-- phpMyAdmin SQL Dump
-- version 4.2.12deb2+deb8u2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Nov 20, 2017 at 09:16 PM
-- Server version: 5.5.58-0+deb8u1
-- PHP Version: 5.6.30-0+deb8u1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `bsvetlicic`
--

-- --------------------------------------------------------

--
-- Table structure for table `Artikl`
--

CREATE TABLE IF NOT EXISTS `Artikl` (
  `Naziv_art` varchar(32) DEFAULT NULL,
  `Mjerna jedinica` varchar(8) DEFAULT NULL,
  `Sifra_art` decimal(3,0) NOT NULL DEFAULT '0',
  `OPIS` varchar(35) NOT NULL,
  `Kategorija` varchar(35) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Artikl`
--

INSERT INTO `Artikl` (`Naziv_art`, `Mjerna jedinica`, `Sifra_art`, `OPIS`, `Kategorija`) VALUES
('Prirodni sok', 'Lit', '111', '', ''),
('Kava', 'Kg', '222', '', ''),
('Pivo', 'Lit', '333', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `Konobar`
--

CREATE TABLE IF NOT EXISTS `Konobar` (
  `Sifra_konob` decimal(2,0) NOT NULL DEFAULT '0',
  `Ime_konob` varchar(24) NOT NULL DEFAULT '',
  `Prezime_konob` varchar(32) NOT NULL DEFAULT '',
  `Beneficije` varchar(72) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Konobar`
--

INSERT INTO `Konobar` (`Sifra_konob`, `Ime_konob`, `Prezime_konob`, `Beneficije`) VALUES
('11', 'Pero', 'Peric', ''),
('22', 'Maja', 'Majic', ''),
('33', 'Lara', 'Laric', '');

-- --------------------------------------------------------

--
-- Table structure for table `Korisnik`
--

CREATE TABLE IF NOT EXISTS `Korisnik` (
  `Ime` varchar(10) NOT NULL,
  `Prezime` varchar(10) NOT NULL,
`Sifra_korisnika` int(3) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Korisnik`
--

INSERT INTO `Korisnik` (`Ime`, `Prezime`, `Sifra_korisnika`) VALUES
('Marko', 'Marki?', 1);

-- --------------------------------------------------------

--
-- Table structure for table `Misljenje`
--

CREATE TABLE IF NOT EXISTS `Misljenje` (
  `Sifra_korisnika` int(3) NOT NULL,
`Sifra_misljenja` int(3) NOT NULL,
  `Opis` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Narudzba`
--

CREATE TABLE IF NOT EXISTS `Narudzba` (
  `Sifra_narud` decimal(1,0) NOT NULL DEFAULT '0',
  `Dat_narud` date DEFAULT NULL,
  `Sifra_konob` decimal(2,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Narudzba`
--

INSERT INTO `Narudzba` (`Sifra_narud`, `Dat_narud`, `Sifra_konob`) VALUES
('1', '2016-12-11', '11'),
('2', '2016-12-12', '22'),
('3', '2016-11-15', '33');

-- --------------------------------------------------------

--
-- Table structure for table `Ocjena`
--

CREATE TABLE IF NOT EXISTS `Ocjena` (
  `Sifra_korisnika` int(3) NOT NULL,
`Sifra_ocjene` int(3) NOT NULL,
  `Ocjena` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Artikl`
--
ALTER TABLE `Artikl`
 ADD PRIMARY KEY (`Sifra_art`);

--
-- Indexes for table `Konobar`
--
ALTER TABLE `Konobar`
 ADD PRIMARY KEY (`Sifra_konob`,`Ime_konob`,`Prezime_konob`,`Beneficije`);

--
-- Indexes for table `Korisnik`
--
ALTER TABLE `Korisnik`
 ADD PRIMARY KEY (`Sifra_korisnika`);

--
-- Indexes for table `Misljenje`
--
ALTER TABLE `Misljenje`
 ADD PRIMARY KEY (`Sifra_misljenja`), ADD KEY `V_Sifra_korisnika1` (`Sifra_korisnika`);

--
-- Indexes for table `Narudzba`
--
ALTER TABLE `Narudzba`
 ADD PRIMARY KEY (`Sifra_narud`), ADD KEY `V_Konobar` (`Sifra_konob`);

--
-- Indexes for table `Ocjena`
--
ALTER TABLE `Ocjena`
 ADD PRIMARY KEY (`Sifra_ocjene`), ADD KEY `V_Sifra_korisnika` (`Sifra_korisnika`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Korisnik`
--
ALTER TABLE `Korisnik`
MODIFY `Sifra_korisnika` int(3) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `Misljenje`
--
ALTER TABLE `Misljenje`
MODIFY `Sifra_misljenja` int(3) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `Ocjena`
--
ALTER TABLE `Ocjena`
MODIFY `Sifra_ocjene` int(3) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `Misljenje`
--
ALTER TABLE `Misljenje`
ADD CONSTRAINT `V_Sifra_korisnika1` FOREIGN KEY (`Sifra_korisnika`) REFERENCES `Korisnik` (`Sifra_korisnika`) ON UPDATE CASCADE;

--
-- Constraints for table `Narudzba`
--
ALTER TABLE `Narudzba`
ADD CONSTRAINT `V_Konobar` FOREIGN KEY (`Sifra_konob`) REFERENCES `Konobar` (`Sifra_konob`) ON UPDATE CASCADE;

--
-- Constraints for table `Ocjena`
--
ALTER TABLE `Ocjena`
ADD CONSTRAINT `V_Sifra_korisnika` FOREIGN KEY (`Sifra_korisnika`) REFERENCES `Korisnik` (`Sifra_korisnika`) ON UPDATE CASCADE,
ADD CONSTRAINT `F_key_sifra_korisnika` FOREIGN KEY (`Sifra_ocjene`) REFERENCES `Korisnik` (`Sifra_korisnika`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
