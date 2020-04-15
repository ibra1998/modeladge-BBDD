-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 15-04-2020 a las 18:37:58
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
-- Base de datos: `cul_ampolla`
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

--
-- Volcado de datos para la tabla `clients`
--

INSERT INTO `clients` (`id`, `nom`, `adreça`, `telefon`, `email`, `registre`, `recomanat`) VALUES
(1, 'juana', 'calle de les corts catalanes, ', 977894564, 'juana@hotmail.es', '2020-04-07', NULL),
(2, 'juan', 'calle de la generalitat', 977654669, '987nhda@gmail.com', '2020-04-08', NULL),
(3, 'albert', 'calle del coronavirus', 654555456, 'corona@gmail.com', '2020-03-17', NULL),
(4, 'claudia', 'calle de valls, 98', 666323333, 'valls@gmail.com', '2020-04-14', NULL),
(5, 'julia', 'calle de badalona, 98, Sabadel', 654654654, 'julia@hotmail.es', '2020-04-06', NULL),
(9, 'pol', 'calle don candelario', 666555444, 'pol@gmail.com', '0000-00-00', 'NULL');

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

--
-- Volcado de datos para la tabla `compres`
--

INSERT INTO `compres` (`id_factura`, `id_client`, `id_ullera`, `id_vendedor`) VALUES
(1, 1, 2, 1),
(2, 1, 1, 2),
(3, 1, 3, 3),
(4, 3, 11, 2),
(5, 2, 8, 1),
(6, 3, 9, 2),
(7, 4, 4, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleats`
--

CREATE TABLE `empleats` (
  `id_empleat` int(11) NOT NULL,
  `nom` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `empleats`
--

INSERT INTO `empleats` (`id_empleat`, `nom`) VALUES
(3, 'benjamin'),
(8, 'fatima'),
(4, 'julio'),
(6, 'laia'),
(5, 'marta'),
(7, 'mireia'),
(1, 'pedro'),
(2, 'rebeca');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `origen`
--

CREATE TABLE `origen` (
  `id_compra` int(11) NOT NULL,
  `id_ullera` int(11) NOT NULL,
  `id_proveidor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Esta tabla guarda que proveedor trae cada gafas';

--
-- Volcado de datos para la tabla `origen`
--

INSERT INTO `origen` (`id_compra`, `id_ullera`, `id_proveidor`) VALUES
(1, 1, 2),
(2, 1, 1),
(3, 2, 1),
(4, 1, 3),
(5, 2, 3),
(6, 4, 1),
(7, 5, 1),
(8, 6, 1),
(9, 7, 1),
(10, 8, 2),
(11, 7, 2),
(12, 9, 3),
(13, 10, 3),
(14, 11, 3),
(15, 11, 2),
(16, 10, 2);

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

--
-- Volcado de datos para la tabla `proveidors`
--

INSERT INTO `proveidors` (`id`, `nom`, `carrer`, `numero`, `pis`, `porta`, `ciutat`, `codipostal`, `pais`, `telefon`, `fax`, `NIF`) VALUES
(1, 'empresa1', 'jfaji', '98', '4A', NULL, 'barna', 98766, 'Espanya', 999888888, 897774546, '98765632S'),
(2, 'numero2', 'tonteria', 'ha hbadbda', NULL, NULL, 'girona', 987669, 'Espanya', 987998654, 987669543, '656565983'),
(3, 'ultim', 'sanarbrh', '98', '5', '6', 'toulouse', 9876654, 'Francia', 988741151, 947669543, '12312556S');

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
-- Volcado de datos para la tabla `ulleres`
--

INSERT INTO `ulleres` (`id_ullera`, `marca`, `graduacio_vd`, `graduacio_vi`, `montura_tipus`, `montura_color`, `vidre_color`, `preu`) VALUES
(1, 'dior', '1.25', '1.50', 'pasta', 'blau', 'blau', '87.99'),
(2, 'dior', '1.75', '1.75', 'flotant', 'blau', 'transparen', '25.65'),
(3, 'dior', '1.00', '1.25', 'metalica', 'rosa', 'negre', '65.25'),
(4, 'dior', '1.50', '1.50', 'pasta', 'blau', 'transparen', '65.29'),
(5, 'oakley', '1.75', '1.75', 'pasta', 'blau', 'transparen', '102.75'),
(6, 'oakley', '0.75', '1.00', 'metalica', 'rosa', 'transparen', '65.25'),
(7, 'dior', '1.25', '1.25', 'pasta', 'blau', 'taronja', '201.32'),
(8, 'oakley', '2.25', '2.50', 'pasta', 'vermell', 'transparen', '71.99'),
(9, 'polaroid', '1.75', '2.25', 'metalica', 'blau', 'negre', '65.23'),
(10, 'persol', '1.25', '1.25', 'metalica', 'vermell', 'negres', '250.00'),
(11, 'arnette', '1.75', '1.50', 'flotant', 'negres', 'negres', '69.60');

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
