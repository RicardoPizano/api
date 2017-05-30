-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 30-05-2017 a las 17:21:39
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

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`cat_id`, `cat_nombre`, `cat_descripcion`) VALUES
(1, 'Concierto', ''),
(2, 'Teatro', ''),
(3, 'Deportes', ''),
(4, 'Culturales', '');

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

--
-- Volcado de datos para la tabla `eventos`
--

INSERT INTO `eventos` (`eve_id`, `eve_nombre`, `eve_estado`, `eve_ciudad`, `eve_direccion`, `eve_lugar`, `eve_fecha`, `eve_hora`, `eve_foto`, `eve_descripcion`, `cat_id`) VALUES
(1, 'Boletos para The Legend Of Zelda Symphony Of The Goddesses', 'CDMX', 'CDMX', 'Paseo de la Reforma # 50 Col Polanco V Sección, Del. Miguel Hidalgo,  Ciudad de México,  DF  11560', 'Auditorio Nacional', '2017-06-11', '18:00', 'http://s1.ticketm.net/tm/es-mx/dam/a/079/57dcff16-1feb-4e28-ac77-1548c4d77079_362471_CUSTOM.jpg', 'Es un excelente e imperdible concierto para cualquier fan de the legend of zelda, abarcando la mayoría de las aventuras vividas en los videojuegos y recordando los momentos mas simpáticos, épicos, tristes y divertidos. Combinando una orquesta de talla mun', 1);

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

--
-- Volcado de datos para la tabla `secciones`
--

INSERT INTO `secciones` (`sec_id`, `sec_nombre`, `sec_costo`, `sec_lugares`, `eve_id`) VALUES
(1, 'General', '1500.00', 200, 1),
(2, 'VIP', '500.00', 50, 1),
(3, 'Palcos', '2500.00', 100, 1);

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

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`usu_id`, `usu_nombre`, `usu_correo`, `usu_contrasena`, `usu_tipo`, `usu_direccion`, `usu_telefono`) VALUES
(1, 'Ricardo Antonio Pizano Pérez', 'rikymon2@hotmail.com', '827ccb0eea8a706c4c34a16891f84e7b', 'a', '', ''),
(2, 'Maria Monica Sánchez Martínez', 'monica@hotmail.com', '827ccb0eea8a706c4c34a16891f84e7b', 'u', 'Col. centro Prospero C. vega No.57', '4424655796');

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

--
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`ven_id`, `usu_id`, `sec_id`, `ven_pago_realizado`) VALUES
(1, 1, 1, '1');

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
,`eve_fecha` date
,`eve_hora` varchar(30)
,`cat_nombre` varchar(50)
,`usu_id` int(11)
,`usu_correo` varchar(100)
);

-- --------------------------------------------------------

--
-- Estructura para la vista `ver_ventas_usuario`
--
DROP TABLE IF EXISTS `ver_ventas_usuario`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `ver_ventas_usuario`  AS  select `v`.`ven_id` AS `ven_id`,`v`.`ven_pago_realizado` AS `ven_pago_realizado`,`s`.`sec_id` AS `sec_id`,`s`.`sec_nombre` AS `sec_nombre`,`s`.`sec_costo` AS `sec_costo`,`e`.`eve_id` AS `eve_id`,`e`.`eve_nombre` AS `eve_nombre`,`e`.`eve_fecha` AS `eve_fecha`,`e`.`eve_hora` AS `eve_hora`,`c`.`cat_nombre` AS `cat_nombre`,`u`.`usu_id` AS `usu_id`,`u`.`usu_correo` AS `usu_correo` from ((((`ventas` `v` join `secciones` `s`) join `usuarios` `u`) join `eventos` `e`) join `categorias` `c`) where ((`v`.`sec_id` = `s`.`sec_id`) and (`v`.`usu_id` = `u`.`usu_id`) and (`s`.`eve_id` = `e`.`eve_id`) and (`e`.`cat_id` = `c`.`cat_id`)) ;

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
  MODIFY `eve_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `secciones`
--
ALTER TABLE `secciones`
  MODIFY `sec_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `usu_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `ven_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
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
