-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 03-06-2017 a las 02:53:12
-- Versión del servidor: 10.1.21-MariaDB
-- Versión de PHP: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `venta_tickets`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `cat_id` int(11) NOT NULL,
  `cat_nombre` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `cat_descripcion` varchar(255) COLLATE utf8_spanish2_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `eventos`
--

CREATE TABLE `eventos` (
  `eve_id` int(11) NOT NULL,
  `eve_nombre` varchar(100) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `eve_estado` varchar(50) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `eve_ciudad` varchar(50) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `eve_direccion` varchar(100) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `eve_lugar` varchar(100) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `eve_fecha` date DEFAULT NULL,
  `eve_hora` varchar(30) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `eve_foto` varchar(255) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `eve_descripcion` text COLLATE utf8_spanish2_ci,
  `cat_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `secciones`
--

CREATE TABLE `secciones` (
  `sec_id` int(11) NOT NULL,
  `sec_nombre` varchar(50) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `sec_costo` decimal(10,2) DEFAULT NULL,
  `sec_lugares` int(5) DEFAULT NULL,
  `eve_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `usu_id` int(11) NOT NULL,
  `usu_nombre` varchar(100) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `usu_correo` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `usu_contrasena` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `usu_tipo` varchar(1) COLLATE utf8_spanish2_ci NOT NULL,
  `usu_direccion` varchar(255) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `usu_telefono` varchar(15) COLLATE utf8_spanish2_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `ven_id` int(11) NOT NULL,
  `usu_id` int(11) NOT NULL,
  `sec_id` int(11) NOT NULL,
  `ven_pago_realizado` varchar(1) COLLATE utf8_spanish2_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `ver_ventas_usuario`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `ver_ventas_usuario` (
`ven_id` int(11)
,`ven_pago_realizado` varchar(1)
,`sec_id` int(11)
,`sec_nombre` varchar(50)
,`sec_costo` decimal(10,2)
,`eve_id` int(11)
,`eve_nombre` varchar(100)
,`eve_estado` varchar(50)
,`eve_ciudad` varchar(50)
,`eve_direccion` varchar(100)
,`eve_lugar` varchar(100)
,`eve_fecha` date
,`eve_hora` varchar(30)
,`eve_foto` varchar(255)
,`eve_descripcion` text
,`cat_nombre` varchar(50)
,`usu_id` int(11)
,`usu_correo` varchar(100)
);

-- --------------------------------------------------------

--
-- Estructura para la vista `ver_ventas_usuario`
--
DROP TABLE IF EXISTS `ver_ventas_usuario`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `ver_ventas_usuario`  AS  select `v`.`ven_id` AS `ven_id`,`v`.`ven_pago_realizado` AS `ven_pago_realizado`,`s`.`sec_id` AS `sec_id`,`s`.`sec_nombre` AS `sec_nombre`,`s`.`sec_costo` AS `sec_costo`,`e`.`eve_id` AS `eve_id`,`e`.`eve_nombre` AS `eve_nombre`,`e`.`eve_estado` AS `eve_estado`,`e`.`eve_ciudad` AS `eve_ciudad`,`e`.`eve_direccion` AS `eve_direccion`,`e`.`eve_lugar` AS `eve_lugar`,`e`.`eve_fecha` AS `eve_fecha`,`e`.`eve_hora` AS `eve_hora`,`e`.`eve_foto` AS `eve_foto`,`e`.`eve_descripcion` AS `eve_descripcion`,`c`.`cat_nombre` AS `cat_nombre`,`u`.`usu_id` AS `usu_id`,`u`.`usu_correo` AS `usu_correo` from ((((`ventas` `v` join `secciones` `s`) join `usuarios` `u`) join `eventos` `e`) join `categorias` `c`) where ((`v`.`sec_id` = `s`.`sec_id`) and (`v`.`usu_id` = `u`.`usu_id`) and (`s`.`eve_id` = `e`.`eve_id`) and (`e`.`cat_id` = `c`.`cat_id`)) ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indices de la tabla `eventos`
--
ALTER TABLE `eventos`
  ADD PRIMARY KEY (`eve_id`),
  ADD KEY `fk_eventos_categorias_1` (`cat_id`);

--
-- Indices de la tabla `secciones`
--
ALTER TABLE `secciones`
  ADD PRIMARY KEY (`sec_id`),
  ADD KEY `fk_secciones_eventos_1` (`eve_id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`usu_id`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`ven_id`),
  ADD KEY `fk_ventas_usuarios_1` (`usu_id`),
  ADD KEY `fk_ventas_secciones_1` (`sec_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `cat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `eventos`
--
ALTER TABLE `eventos`
  MODIFY `eve_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT de la tabla `secciones`
--
ALTER TABLE `secciones`
  MODIFY `sec_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `usu_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `ven_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `eventos`
--
ALTER TABLE `eventos`
  ADD CONSTRAINT `fk_eventos_categorias_1` FOREIGN KEY (`cat_id`) REFERENCES `categorias` (`cat_id`);

--
-- Filtros para la tabla `secciones`
--
ALTER TABLE `secciones`
  ADD CONSTRAINT `fk_secciones_eventos_1` FOREIGN KEY (`eve_id`) REFERENCES `eventos` (`eve_id`);

--
-- Filtros para la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD CONSTRAINT `fk_ventas_secciones_1` FOREIGN KEY (`sec_id`) REFERENCES `secciones` (`sec_id`),
  ADD CONSTRAINT `fk_ventas_usuarios_1` FOREIGN KEY (`usu_id`) REFERENCES `usuarios` (`usu_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
