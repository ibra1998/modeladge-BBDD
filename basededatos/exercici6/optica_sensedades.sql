-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 15-04-2020 a las 18:42:31
-- Versión del servidor: 10.4.11-MariaDB
-- Versión de PHP: 7.4.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `optica`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `quien vendio las gafas` (IN `id_ullera` INT)  READS SQL DATA
SELECT empleats.nom as empleat, ulleres.marca, clients.nom FROM compres JOIN empleats ON compres.id_vendedor = empleats.id_empleat JOIN clients ON clients.id = compres.id_client JOIN ulleres ON ulleres.id_ullera = compres.id_ullera WHERE compres.id_ullera = id_ullera$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `registrar client` (IN `direccio` VARCHAR(30), IN `noms` VARCHAR(30), IN `numero` INT, IN `data` DATE, IN `recomanacio` VARCHAR(30), IN `mail` VARCHAR(30))  NO SQL
INSERT INTO clients (adreça, nom, telefon, recomanat, email, registre) VALUES (direccio, noms, numero, recomanacio, mail , data)$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clients`
--

CREATE TABLE `clients` (
  `id` int(11) NOT NULL,
  `nom` varchar(30) NOT NULL,
  `adreça` varchar(30) NOT NULL,
  `telefon` int(11) NOT NULL,
  `email` varchar(20) NOT NULL,
  `registre` date NOT NULL DEFAULT current_timestamp(),
  `recomanat` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compres`
--

CREATE TABLE `compres` (
  `id_factura` int(11) NOT NULL,
  `id_client` int(11) NOT NULL,
  `id_ullera` int(11) NOT NULL,
  `id_vendedor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleats`
--

CREATE TABLE `empleats` (
  `id_empleat` int(11) NOT NULL,
  `nom` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `origen`
--

CREATE TABLE `origen` (
  `id_compra` int(11) NOT NULL,
  `id_ullera` int(11) NOT NULL,
  `id_proveidor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Esta tabla guarda que proveedor trae cada gafas';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveidors`
--

CREATE TABLE `proveidors` (
  `id` int(11) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `carrer` varchar(50) NOT NULL,
  `numero` varchar(50) NOT NULL,
  `pis` varchar(50) DEFAULT NULL,
  `porta` varchar(50) DEFAULT NULL,
  `ciutat` varchar(50) NOT NULL,
  `codipostal` int(5) NOT NULL,
  `pais` varchar(50) DEFAULT 'Espanya',
  `telefon` int(11) NOT NULL,
  `fax` int(11) NOT NULL,
  `NIF` char(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ulleres`
--

CREATE TABLE `ulleres` (
  `id_ullera` int(11) NOT NULL,
  `marca` varchar(11) NOT NULL,
  `graduacio_vd` decimal(4,2) NOT NULL COMMENT 'graduacion del vidrio derecho',
  `graduacio_vi` decimal(4,2) NOT NULL COMMENT 'graduacion del vidrio izquierdo',
  `montura_tipus` set('flotant','pasta','metalica') NOT NULL,
  `montura_color` varchar(10) NOT NULL,
  `vidre_color` varchar(10) NOT NULL,
  `preu` decimal(7,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indices de la tabla `compres`
--
ALTER TABLE `compres`
  ADD PRIMARY KEY (`id_factura`);

--
-- Indices de la tabla `empleats`
--
ALTER TABLE `empleats`
  ADD PRIMARY KEY (`id_empleat`),
  ADD UNIQUE KEY `nom` (`nom`);

--
-- Indices de la tabla `origen`
--
ALTER TABLE `origen`
  ADD PRIMARY KEY (`id_compra`);

--
-- Indices de la tabla `proveidors`
--
ALTER TABLE `proveidors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `telefon` (`telefon`),
  ADD UNIQUE KEY `fax` (`fax`);

--
-- Indices de la tabla `ulleres`
--
ALTER TABLE `ulleres`
  ADD PRIMARY KEY (`id_ullera`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `clients`
--
ALTER TABLE `clients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `compres`
--
ALTER TABLE `compres`
  MODIFY `id_factura` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `empleats`
--
ALTER TABLE `empleats`
  MODIFY `id_empleat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `origen`
--
ALTER TABLE `origen`
  MODIFY `id_compra` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `proveidors`
--
ALTER TABLE `proveidors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `ulleres`
--
ALTER TABLE `ulleres`
  MODIFY `id_ullera` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
