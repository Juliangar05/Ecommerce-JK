-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 11-05-2023 a las 03:28:22
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `jkropa`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `ID` int(12) NOT NULL,
  `NOMBRE_APELLIDOS` varchar(40) NOT NULL,
  `FECHA_NACIMIENTO` date NOT NULL,
  `CONTRASENA` varchar(13) NOT NULL,
  `DIRECCION` varchar(40) NOT NULL,
  `CIUDAD` varchar(40) NOT NULL,
  `TELEFONO` float NOT NULL,
  `CORREO_ELECTRONICO` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`ID`, `NOMBRE_APELLIDOS`, `FECHA_NACIMIENTO`, `CONTRASENA`, `DIRECCION`, `CIUDAD`, `TELEFONO`, `CORREO_ELECTRONICO`) VALUES
(31478695, 'MARIA GUTIERREZ', '0000-00-00', 'm4R142020$', 'CR 5 78 20 ', 'BOGOTA', 3134790000, 'MARIAG@GMAIL.COM'),
(39876043, 'CAROLINA GONZALEZ PINEDA', '1999-11-07', 'Carolina303%*', 'cl 70 sur 25 04', 'soacha', 3226790000, 'CAROGONZALEZ@HOTMAIL.COM'),
(1000453679, 'DIEGO GIRALDO CARVAJAL', '2002-04-05', 'D1eg0202#', 'cl 67 sur 30 b 69 ', 'BOGOTA', 3125780000, 'diggirado@gmail.com'),
(1032758906, 'PEDRO ALVAREZ', '0200-05-02', 'Pedro2022*', 'dg 67 31 c 60 ', 'CALI', 3167900000, 'PEDROALVAREZ303@GMAL.COM');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `COD` int(10) NOT NULL,
  `COLOR` varchar(10) DEFAULT NULL,
  `TALLA` varchar(3) DEFAULT NULL,
  `STOCK` int(30) DEFAULT NULL,
  `VALOR_UNITARIO` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`COD`, `COLOR`, `TALLA`, `STOCK`, `VALOR_UNITARIO`) VALUES
(109284, 'GRIS', 'S', 10, 10000),
(109285, 'NEGRO', 'XS', 30, 100000),
(109286, 'BLANCO', 'M', 15, 50000),
(112478, 'ROSADO', 'L', 100, 75000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta`
--

CREATE TABLE `venta` (
  `COD_VENTA` int(5) NOT NULL,
  `COD` int(5) NOT NULL,
  `CANTIDAD` int(3) NOT NULL,
  `VALOR_UNITARIO` int(4) NOT NULL,
  `VALOR_TOTAL` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `venta`
--

INSERT INTO `venta` (`COD_VENTA`, `COD`, `CANTIDAD`, `VALOR_UNITARIO`, `VALOR_TOTAL`) VALUES
(8569, 112478, 1, 70000, 70000),
(9635, 109285, 2, 100000, 200000),
(10523, 109284, 3, 100000, 300000),
(10527, 109286, 2, 50000, 100000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `COD_VENTA` int(5) NOT NULL,
  `COD` int(5) NOT NULL,
  `ID` int(12) NOT NULL,
  `CANTIDAD` int(4) NOT NULL,
  `VALOR_UNITARIO` int(10) DEFAULT NULL,
  `VALOR_TOTAL` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`COD_VENTA`, `COD`, `ID`, `CANTIDAD`, `VALOR_UNITARIO`, `VALOR_TOTAL`) VALUES
(23658, 109286, 39876043, 2, 100000, 200000),
(27569, 112478, 39876043, 7, 50000, 350000),
(35698, 109285, 39876043, 1, 150000, 150000),
(45298, 109286, 1000453679, 2, 70000, 140000),
(58693, 109286, 1000453679, 100, 10000, 1000000),
(472587, 109285, 31478695, 5, 700000, 3500000);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`COD`);

--
-- Indices de la tabla `venta`
--
ALTER TABLE `venta`
  ADD PRIMARY KEY (`COD_VENTA`),
  ADD KEY `COD` (`COD`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`COD_VENTA`),
  ADD KEY `COD` (`COD`),
  ADD KEY `ID` (`ID`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `venta`
--
ALTER TABLE `venta`
  ADD CONSTRAINT `venta_ibfk_1` FOREIGN KEY (`COD`) REFERENCES `productos` (`COD`);

--
-- Filtros para la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD CONSTRAINT `ventas_ibfk_1` FOREIGN KEY (`COD`) REFERENCES `productos` (`COD`),
  ADD CONSTRAINT `ventas_ibfk_2` FOREIGN KEY (`ID`) REFERENCES `clientes` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
