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
(1, 'Boletos para The Legend Of Zelda Symphony Of The Goddesses', 'CDMX', 'CDMX', 'Paseo de la Reforma # 50 Col Polanco V Sección, Del. Miguel Hidalgo,  Ciudad de México,  DF  11560', 'Auditorio Nacional', '2017-06-11', '18:00', 'http://s1.ticketm.net/tm/es-mx/dam/a/079/57dcff16-1feb-4e28-ac77-1548c4d77079_362471_CUSTOM.jpg', 'Es un excelente e imperdible concierto para cualquier fan de the legend of zelda, abarcando la mayoría de las aventuras vividas en los videojuegos y recordando los momentos mas simpáticos, épicos, tristes y divertidos. Combinando una orquesta de talla mun', 1),
(2, 'Boletos para Banda MS', 'CDMX', 'CDMX', 'Paseo de la Reforma 50, Miguel Hidalgo, Bosque de Chapultepec I Secc, 11580 Ciudad de México, CDMX', 'Auditorio Nacional', '2017-06-01', '20:30', 'http://s1.ticketm.net/tm/es-mx/dam/a/407/dd5bc658-b734-4a1d-b282-5988bc02d407_288441_CUSTOM.jpg', 'La banda viene precedida de exitosos conciertos en los principales teatros y arenas de México y Estados Unidos \r\n\r\nPresentará un nuevo espectáculo totalmente renovado, con lo más sofisticado en escenografía, audio e iluminación\r\n\r\nLa BANDA MS presentará un espectáculo totalmente renovado, en el cual el común denominador es la moderna tecnología en cuanto a audio, video y música se refiere. Este show, ha sido objeto de comentarios muy positivos por parte de la crítica especializada en México y los Estados Unidos. \r\n\r\nPantallas gigantes de alta definición (HD), en las cuales paralelamente con el espectáculo musical, se comienza a representar una breve historia, que, como si fuera una telenovela, es el hilo conductor a lo largo de más de 2 horas de música continua. \r\n\r\nLa BANDA MS DE SERGIO LIZÁRRAGA, esta rompiendo parámetros y haciendo historia, pues éste concepto tecnológico es algo totalmente novedoso, nunca antes visto entre los exponentes del género regional mexicano. \r\n\r\nCon una capacidad para más 10 mil espectadores, el también llamado “Coloso de Reforma”, se ha convertido en una de las plataformas musicales más importantes en la República Mexicana, motivo por el cual estas presentaciones son trascendentes para cualquier artista. \r\n\r\nLos boletos están a la venta a partir del día de hoy a precios muy accesibles. La idea es que todo el público pueda asistir y ser parte de una noche inolvidable con la agrupación más influyente del género: BANDA MS \r\n\r\nBoletos disponibles través de ticketmaster.com.mx\r\n\r\nFacebook: Banda MS\r\nInstagram: bandamsoficial\r\nTwitter: @banda_ms\r\nwww.bandams.com.mx\r\nCanal de YouTube Lizos Music:\r\nhttps://www.youtube.com/c/LizosMusic\r\n\r\nPara mayor Información: \r\nSara Eva Pérez \r\nMarketing & PR \r\n(818) 620-7269 \r\nEvacisneros62@gmail.com \r\nEvacisneros62@hotmail.com', 1),
(3, 'Boletos para The Legend Of Zelda Symphony Of The Goddesses', 'CDMX', 'CDMX', 'Paseo de la Reforma # 50 Col Polanco V Sección, Del. Miguel Hidalgo,  Ciudad de México,  DF  11560', 'Auditorio Nacional', '2017-06-11', '18:00', 'http://s1.ticketm.net/tm/es-mx/dam/a/079/57dcff16-1feb-4e28-ac77-1548c4d77079_362471_CUSTOM.jpg', 'Es un excelente e imperdible concierto para cualquier fan de the legend of zelda, abarcando la mayoría de las aventuras vividas en los videojuegos y recordando los momentos mas simpáticos, épicos, tristes y divertidos. Combinando una orquesta de talla mun', 1),
(4, 'Boletos para Banda MS', 'CDMX', 'CDMX', 'Paseo de la Reforma 50, Miguel Hidalgo, Bosque de Chapultepec I Secc, 11580 Ciudad de México, CDMX', 'Auditorio Nacional', '2017-06-01', '20:30', 'http://s1.ticketm.net/tm/es-mx/dam/a/407/dd5bc658-b734-4a1d-b282-5988bc02d407_288441_CUSTOM.jpg', 'La banda viene precedida de exitosos conciertos en los principales teatros y arenas de México y Estados Unidos \r\n\r\nPresentará un nuevo espectáculo totalmente renovado, con lo más sofisticado en escenografía, audio e iluminación\r\n\r\nLa BANDA MS presentará un espectáculo totalmente renovado, en el cual el común denominador es la moderna tecnología en cuanto a audio, video y música se refiere. Este show, ha sido objeto de comentarios muy positivos por parte de la crítica especializada en México y los Estados Unidos. \r\n\r\nPantallas gigantes de alta definición (HD), en las cuales paralelamente con el espectáculo musical, se comienza a representar una breve historia, que, como si fuera una telenovela, es el hilo conductor a lo largo de más de 2 horas de música continua. \r\n\r\nLa BANDA MS DE SERGIO LIZÁRRAGA, esta rompiendo parámetros y haciendo historia, pues éste concepto tecnológico es algo totalmente novedoso, nunca antes visto entre los exponentes del género regional mexicano. \r\n\r\nCon una capacidad para más 10 mil espectadores, el también llamado “Coloso de Reforma”, se ha convertido en una de las plataformas musicales más importantes en la República Mexicana, motivo por el cual estas presentaciones son trascendentes para cualquier artista. \r\n\r\nLos boletos están a la venta a partir del día de hoy a precios muy accesibles. La idea es que todo el público pueda asistir y ser parte de una noche inolvidable con la agrupación más influyente del género: BANDA MS \r\n\r\nBoletos disponibles través de ticketmaster.com.mx\r\n\r\nFacebook: Banda MS\r\nInstagram: bandamsoficial\r\nTwitter: @banda_ms\r\nwww.bandams.com.mx\r\nCanal de YouTube Lizos Music:\r\nhttps://www.youtube.com/c/LizosMusic\r\n\r\nPara mayor Información: \r\nSara Eva Pérez \r\nMarketing & PR \r\n(818) 620-7269 \r\nEvacisneros62@gmail.com \r\nEvacisneros62@hotmail.com', 1),
(5, 'El Rey León', 'CDMX', 'CDMX', 'Lago Zurich #219, Primer Piso, Col. Ampliación Granada, México, DF 11529', 'Teatro Telcel', '2017-06-01', '20:00', 'http://s1.ticketm.net/tm/es-mx/dam/a/015/ab39976e-42cd-4a51-b5fb-f6919fdbb015_190661_EVENT_DETAIL_PAGE_16_9.jpg', 'Desde su estreno en Broadway en 1997, El Rey León ha ganado más de 70 de los mayores galardones del orbe, entre ellos seis premios Tony, en las 22 producciones globales que han sido vistas por más de 75 millones de personas. El ingenio y creatividad sinigual de su directora, Julie Taymor, lograron una fusión de sofisticadas disciplinas africanas, occidentales y asiáticas, enmarcadas por la música inolvidable de Elton John. Un musical extraordinario, que impacta al espectador por su belleza, al mismo tiempo que lo hace reflexionar sobre el efecto que causan nuestras acciones en el entorno, ya que todos formamos parte de un ciclo vital. Sin lugar a dudas, El Rey León, completamente en español, es el espectáculo teatral más importante que ha albergado la ciudad de México hasta el día de hoy', 2),
(6, 'El Rey León', 'CDMX', 'CDMX', 'Lago Zurich #219, Primer Piso, Col. Ampliación Granada, México, DF 11529', 'Teatro Telcel', '2017-06-01', '20:00', 'http://s1.ticketm.net/tm/es-mx/dam/a/015/ab39976e-42cd-4a51-b5fb-f6919fdbb015_190661_EVENT_DETAIL_PAGE_16_9.jpg', 'Desde su estreno en Broadway en 1997, El Rey León ha ganado más de 70 de los mayores galardones del orbe, entre ellos seis premios Tony, en las 22 producciones globales que han sido vistas por más de 75 millones de personas. El ingenio y creatividad sinigual de su directora, Julie Taymor, lograron una fusión de sofisticadas disciplinas africanas, occidentales y asiáticas, enmarcadas por la música inolvidable de Elton John. Un musical extraordinario, que impacta al espectador por su belleza, al mismo tiempo que lo hace reflexionar sobre el efecto que causan nuestras acciones en el entorno, ya que todos formamos parte de un ciclo vital. Sin lugar a dudas, El Rey León, completamente en español, es el espectáculo teatral más importante que ha albergado la ciudad de México hasta el día de hoy', 2),
(7, 'El Rey León', 'CDMX', 'CDMX', 'Lago Zurich #219, Primer Piso, Col. Ampliación Granada, México, DF 11529', 'Teatro Telcel', '2017-06-01', '20:00', 'http://s1.ticketm.net/tm/es-mx/dam/a/015/ab39976e-42cd-4a51-b5fb-f6919fdbb015_190661_EVENT_DETAIL_PAGE_16_9.jpg', 'Desde su estreno en Broadway en 1997, El Rey León ha ganado más de 70 de los mayores galardones del orbe, entre ellos seis premios Tony, en las 22 producciones globales que han sido vistas por más de 75 millones de personas. El ingenio y creatividad sinigual de su directora, Julie Taymor, lograron una fusión de sofisticadas disciplinas africanas, occidentales y asiáticas, enmarcadas por la música inolvidable de Elton John. Un musical extraordinario, que impacta al espectador por su belleza, al mismo tiempo que lo hace reflexionar sobre el efecto que causan nuestras acciones en el entorno, ya que todos formamos parte de un ciclo vital. Sin lugar a dudas, El Rey León, completamente en español, es el espectáculo teatral más importante que ha albergado la ciudad de México hasta el día de hoy', 2),
(8, 'Boletos para Banda MS', 'CDMX', 'CDMX', 'Paseo de la Reforma 50, Miguel Hidalgo, Bosque de Chapultepec I Secc, 11580 Ciudad de México, CDMX', 'Auditorio Nacional', '2017-06-01', '20:30', 'http://s1.ticketm.net/tm/es-mx/dam/a/407/dd5bc658-b734-4a1d-b282-5988bc02d407_288441_CUSTOM.jpg', 'La banda viene precedida de exitosos conciertos en los principales teatros y arenas de México y Estados Unidos \r\n\r\nPresentará un nuevo espectáculo totalmente renovado, con lo más sofisticado en escenografía, audio e iluminación\r\n\r\nLa BANDA MS presentará un espectáculo totalmente renovado, en el cual el común denominador es la moderna tecnología en cuanto a audio, video y música se refiere. Este show, ha sido objeto de comentarios muy positivos por parte de la crítica especializada en México y los Estados Unidos. \r\n\r\nPantallas gigantes de alta definición (HD), en las cuales paralelamente con el espectáculo musical, se comienza a representar una breve historia, que, como si fuera una telenovela, es el hilo conductor a lo largo de más de 2 horas de música continua. \r\n\r\nLa BANDA MS DE SERGIO LIZÁRRAGA, esta rompiendo parámetros y haciendo historia, pues éste concepto tecnológico es algo totalmente novedoso, nunca antes visto entre los exponentes del género regional mexicano. \r\n\r\nCon una capacidad para más 10 mil espectadores, el también llamado “Coloso de Reforma”, se ha convertido en una de las plataformas musicales más importantes en la República Mexicana, motivo por el cual estas presentaciones son trascendentes para cualquier artista. \r\n\r\nLos boletos están a la venta a partir del día de hoy a precios muy accesibles. La idea es que todo el público pueda asistir y ser parte de una noche inolvidable con la agrupación más influyente del género: BANDA MS \r\n\r\nBoletos disponibles través de ticketmaster.com.mx\r\n\r\nFacebook: Banda MS\r\nInstagram: bandamsoficial\r\nTwitter: @banda_ms\r\nwww.bandams.com.mx\r\nCanal de YouTube Lizos Music:\r\nhttps://www.youtube.com/c/LizosMusic\r\n\r\nPara mayor Información: \r\nSara Eva Pérez \r\nMarketing & PR \r\n(818) 620-7269 \r\nEvacisneros62@gmail.com \r\nEvacisneros62@hotmail.com', 1),
(9, 'Boletos para Banda MS', 'CDMX', 'CDMX', 'Paseo de la Reforma 50, Miguel Hidalgo, Bosque de Chapultepec I Secc, 11580 Ciudad de México, CDMX', 'Auditorio Nacional', '2017-06-01', '20:30', 'http://s1.ticketm.net/tm/es-mx/dam/a/407/dd5bc658-b734-4a1d-b282-5988bc02d407_288441_CUSTOM.jpg', 'La banda viene precedida de exitosos conciertos en los principales teatros y arenas de México y Estados Unidos \r\n\r\nPresentará un nuevo espectáculo totalmente renovado, con lo más sofisticado en escenografía, audio e iluminación\r\n\r\nLa BANDA MS presentará un espectáculo totalmente renovado, en el cual el común denominador es la moderna tecnología en cuanto a audio, video y música se refiere. Este show, ha sido objeto de comentarios muy positivos por parte de la crítica especializada en México y los Estados Unidos. \r\n\r\nPantallas gigantes de alta definición (HD), en las cuales paralelamente con el espectáculo musical, se comienza a representar una breve historia, que, como si fuera una telenovela, es el hilo conductor a lo largo de más de 2 horas de música continua. \r\n\r\nLa BANDA MS DE SERGIO LIZÁRRAGA, esta rompiendo parámetros y haciendo historia, pues éste concepto tecnológico es algo totalmente novedoso, nunca antes visto entre los exponentes del género regional mexicano. \r\n\r\nCon una capacidad para más 10 mil espectadores, el también llamado “Coloso de Reforma”, se ha convertido en una de las plataformas musicales más importantes en la República Mexicana, motivo por el cual estas presentaciones son trascendentes para cualquier artista. \r\n\r\nLos boletos están a la venta a partir del día de hoy a precios muy accesibles. La idea es que todo el público pueda asistir y ser parte de una noche inolvidable con la agrupación más influyente del género: BANDA MS \r\n\r\nBoletos disponibles través de ticketmaster.com.mx\r\n\r\nFacebook: Banda MS\r\nInstagram: bandamsoficial\r\nTwitter: @banda_ms\r\nwww.bandams.com.mx\r\nCanal de YouTube Lizos Music:\r\nhttps://www.youtube.com/c/LizosMusic\r\n\r\nPara mayor Información: \r\nSara Eva Pérez \r\nMarketing & PR \r\n(818) 620-7269 \r\nEvacisneros62@gmail.com \r\nEvacisneros62@hotmail.com', 1),
(10, 'Boletos para The Legend Of Zelda Symphony Of The Goddesses', 'CDMX', 'CDMX', 'Paseo de la Reforma # 50 Col Polanco V Sección, Del. Miguel Hidalgo,  Ciudad de México,  DF  11560', 'Auditorio Nacional', '2017-06-11', '18:00', 'http://s1.ticketm.net/tm/es-mx/dam/a/079/57dcff16-1feb-4e28-ac77-1548c4d77079_362471_CUSTOM.jpg', 'Es un excelente e imperdible concierto para cualquier fan de the legend of zelda, abarcando la mayoría de las aventuras vividas en los videojuegos y recordando los momentos mas simpáticos, épicos, tristes y divertidos. Combinando una orquesta de talla mun', 1),
(11, 'Boletos para Banda MS', 'CDMX', 'CDMX', 'Paseo de la Reforma 50, Miguel Hidalgo, Bosque de Chapultepec I Secc, 11580 Ciudad de México, CDMX', 'Auditorio Nacional', '2017-06-01', '20:30', 'http://s1.ticketm.net/tm/es-mx/dam/a/407/dd5bc658-b734-4a1d-b282-5988bc02d407_288441_CUSTOM.jpg', 'La banda viene precedida de exitosos conciertos en los principales teatros y arenas de México y Estados Unidos \r\n\r\nPresentará un nuevo espectáculo totalmente renovado, con lo más sofisticado en escenografía, audio e iluminación\r\n\r\nLa BANDA MS presentará un espectáculo totalmente renovado, en el cual el común denominador es la moderna tecnología en cuanto a audio, video y música se refiere. Este show, ha sido objeto de comentarios muy positivos por parte de la crítica especializada en México y los Estados Unidos. \r\n\r\nPantallas gigantes de alta definición (HD), en las cuales paralelamente con el espectáculo musical, se comienza a representar una breve historia, que, como si fuera una telenovela, es el hilo conductor a lo largo de más de 2 horas de música continua. \r\n\r\nLa BANDA MS DE SERGIO LIZÁRRAGA, esta rompiendo parámetros y haciendo historia, pues éste concepto tecnológico es algo totalmente novedoso, nunca antes visto entre los exponentes del género regional mexicano. \r\n\r\nCon una capacidad para más 10 mil espectadores, el también llamado “Coloso de Reforma”, se ha convertido en una de las plataformas musicales más importantes en la República Mexicana, motivo por el cual estas presentaciones son trascendentes para cualquier artista. \r\n\r\nLos boletos están a la venta a partir del día de hoy a precios muy accesibles. La idea es que todo el público pueda asistir y ser parte de una noche inolvidable con la agrupación más influyente del género: BANDA MS \r\n\r\nBoletos disponibles través de ticketmaster.com.mx\r\n\r\nFacebook: Banda MS\r\nInstagram: bandamsoficial\r\nTwitter: @banda_ms\r\nwww.bandams.com.mx\r\nCanal de YouTube Lizos Music:\r\nhttps://www.youtube.com/c/LizosMusic\r\n\r\nPara mayor Información: \r\nSara Eva Pérez \r\nMarketing & PR \r\n(818) 620-7269 \r\nEvacisneros62@gmail.com \r\nEvacisneros62@hotmail.com', 1),
(12, 'El Rey León', 'CDMX', 'CDMX', 'Lago Zurich #219, Primer Piso, Col. Ampliación Granada, México, DF 11529', 'Teatro Telcel', '2017-06-01', '20:00', 'http://s1.ticketm.net/tm/es-mx/dam/a/015/ab39976e-42cd-4a51-b5fb-f6919fdbb015_190661_EVENT_DETAIL_PAGE_16_9.jpg', 'Desde su estreno en Broadway en 1997, El Rey León ha ganado más de 70 de los mayores galardones del orbe, entre ellos seis premios Tony, en las 22 producciones globales que han sido vistas por más de 75 millones de personas. El ingenio y creatividad sinigual de su directora, Julie Taymor, lograron una fusión de sofisticadas disciplinas africanas, occidentales y asiáticas, enmarcadas por la música inolvidable de Elton John. Un musical extraordinario, que impacta al espectador por su belleza, al mismo tiempo que lo hace reflexionar sobre el efecto que causan nuestras acciones en el entorno, ya que todos formamos parte de un ciclo vital. Sin lugar a dudas, El Rey León, completamente en español, es el espectáculo teatral más importante que ha albergado la ciudad de México hasta el día de hoy', 2),
(13, 'Boletos para Lucha Libre CMLL', 'CDMX', 'CDMX', 'Calle Dr. Lavista 197, Doctores, 06720 Ciudad de México, CDMX', 'Arena México', '2017-06-04', '17:00', 'http://s1.ticketm.net/tm/es-mx/dbimages/142540a.jpg', 'Un gran espectáculo de la lucha libre mexicana un buen ambiente familiar, hubo muchas familias disfrutando, los niños sorprendidos por los lances de la tercera cuerda, recomiendo acudir, algo fuera de lo cotidiano, sobre todo explicar a los niños que no es solo golpearse, sino todo el entrenamiento y esfuerzo requerido, al final es un deporte.', 3),
(14, 'algo', 'qro', 'qro', 'serca de aqui lejos de alla', 'mi casa', '0017-06-04', '17:00', 'http://s1.ticketm.net/tm/es-mx/dbimages/142540a.jpg', 'Un gran espectáculo de la lucha libre mexicana un buen ambiente familiar, hubo muchas familias disfrutando, los niños sorprendidos por los lances de la tercera cuerda, recomiendo acudir, algo fuera de lo cotidiano, sobre todo explicar a los niños que no es solo golpearse, sino todo el entrenamiento y esfuerzo requerido, al final es un deporte.', 3),
(15, 'evento1', 'qro', 'qro', 'hola', 'otra cosa', '2017-06-04', '17:00', 'http://s1.ticketm.net/tm/es-mx/dbimages/142540a.jpg', 'La banda viene precedida de exitosos conciertos en los principales teatros y arenas de México y Estados Unidos \r\n\r\nPresentará un nuevo espectáculo totalmente renovado, con lo más sofisticado en escenografía, audio e iluminación\r\n\r\nLa BANDA MS presentará un espectáculo totalmente renovado, en el cual el común denominador es la moderna tecnología en cuanto a audio, video y música se refiere. Este show, ha sido objeto de comentarios muy positivos por parte de la crítica especializada en México y los Estados Unidos. \r\n\r\nPantallas gigantes de alta definición (HD), en las cuales paralelamente con el espectáculo musical, se comienza a representar una breve historia, que, como si fuera una telenovela, es el hilo conductor a lo largo de más de 2 horas de música continua. \r\n\r\nLa BANDA MS DE SERGIO LIZÁRRAGA, esta rompiendo parámetros y haciendo historia, pues éste concepto tecnológico es algo totalmente novedoso, nunca antes visto entre los exponentes del género regional mexicano. \r\n\r\nCon una capacidad para más 10 mil espectadores, el también llamado “Coloso de Reforma”, se ha convertido en una de las plataformas musicales más importantes en la República Mexicana, motivo por el cual estas presentaciones son trascendentes para cualquier artista. \r\n\r\nLos boletos están a la venta a partir del día de hoy a precios muy accesibles. La idea es que todo el público pueda asistir y ser parte de una noche inolvidable con la agrupación más influyente del género: BANDA MS \r\n\r\nBoletos disponibles través de ticketmaster.com.mx\r\n\r\nFacebook: Banda MS\r\nInstagram: bandamsoficial\r\nTwitter: @banda_ms\r\nwww.bandams.com.mx\r\nCanal de YouTube Lizos Music:\r\nhttps://www.youtube.com/c/LizosMusic\r\n\r\nPara mayor Información: \r\nSara Eva Pérez \r\nMarketing ', 3),
(16, 'evento1', 'qro', 'qro', 'serca de aqui y lejos de alla', 'otra cosa', '2017-06-04', '17:00', 'http://s1.ticketm.net/tm/es-mx/dbimages/142540a.jpg', 'La banda viene precedida de exitosos conciertos en los principales teatros y arenas de México y Estados Unidos \r\n\r\nPresentará un nuevo espectáculo totalmente renovado, con lo más sofisticado en escenografía, audio e iluminación\r\n\r\nLa BANDA MS presentará un espectáculo totalmente renovado, en el cual el común denominador es la moderna tecnología en cuanto a audio, video y música se refiere. Este show, ha sido objeto de comentarios muy positivos por parte de la crítica especializada en México y los Estados Unidos. \r\n\r\nPantallas gigantes de alta definición (HD), en las cuales paralelamente con el espectáculo musical, se comienza a representar una breve historia, que, como si fuera una telenovela, es el hilo conductor a lo largo de más de 2 horas de música continua. \r\n\r\nLa BANDA MS DE SERGIO LIZÁRRAGA, esta rompiendo parámetros y haciendo historia, pues éste concepto tecnológico es algo totalmente novedoso, nunca antes visto entre los exponentes del género regional mexicano. \r\n\r\nCon una capacidad para más 10 mil espectadores, el también llamado “Coloso de Reforma”, se ha convertido en una de las plataformas musicales más importantes en la República Mexicana, motivo por el cual estas presentaciones son trascendentes para cualquier artista. \r\n\r\nLos boletos están a la venta a partir del día de hoy a precios muy accesibles. La idea es que todo el público pueda asistir y ser parte de una noche inolvidable con la agrupación más influyente del género: BANDA MS \r\n\r\nBoletos disponibles través de ticketmaster.com.mx\r\n\r\nFacebook: Banda MS\r\nInstagram: bandamsoficial\r\nTwitter: @banda_ms\r\nwww.bandams.com.mx\r\nCanal de YouTube Lizos Music:\r\nhttps://www.youtube.com/c/LizosMusic\r\n\r\nPara mayor Información: \r\nSara Eva Pérez \r\nMarketing ', 3),
(17, 'Boletos para Lucha Libre CMLL', 'CDMX', 'CDMX', 'Calle Dr. Lavista 197, Doctores, 06720 Ciudad de México, CDMX', 'Arena México', '2017-06-04', '17:00', 'http://s1.ticketm.net/tm/es-mx/dbimages/142540a.jpg', 'Un gran espectáculo de la lucha libre mexicana un buen ambiente familiar, hubo muchas familias disfrutando, los niños sorprendidos por los lances de la tercera cuerda, recomiendo acudir, algo fuera de lo cotidiano, sobre todo explicar a los niños que no es solo golpearse, sino todo el entrenamiento y esfuerzo requerido, al final es un deporte.', 3),
(18, 'Boletos para Lucha Libre CMLL', 'CDMX', 'CDMX', 'Calle Dr. Lavista 197, Doctores, 06720 Ciudad de México, CDMX', 'Arena México', '2017-06-04', '17:00', 'http://s1.ticketm.net/tm/es-mx/dbimages/142540a.jpg', 'Un gran espectáculo de la lucha libre mexicana un buen ambiente familiar, hubo muchas familias disfrutando, los niños sorprendidos por los lances de la tercera cuerda, recomiendo acudir, algo fuera de lo cotidiano, sobre todo explicar a los niños que no es solo golpearse, sino todo el entrenamiento y esfuerzo requerido, al final es un deporte.', 3),
(19, 'fsadf', 'fsdfsdafdsa', 'dsafsdfds', 'asdfsdafsd', 'fdsfsdafds', '2017-06-14', '17:00', 'http://www.flashcoo.com/cartoon/space_1600/images/wallcoo.com_Space_Art_ProtoGalaxya.jpg', 'sdfsdafsdafdsa dfd afds fda fd fdsa fdsafdfadsfads', 2),
(20, 'arewrewqade', 'wfewafsdafdsaf', 'dsafdsafdsaf', 'dsafdsafdsaf', 'dsafdsafsda', '2017-06-15', '17:00', 'http://1.bp.blogspot.com/-Sm3U2LSe1-s/UD0aJp3DkrI/AAAAAAAAB78/1YX0w61QycI/s1600/summer%2Bnight%2Bin%2Bthe%2Bsombrero%2Bgalaxya.jpg', ' dsfadsa dsafd fdsafdsfdas da dsaf dsf adsfadsa dsafd fdsafdsfdas da dsaf dsf adsfadsa dsafd fdsafdsfdas da dsaf dsf adsfadsa dsafd fdsafdsfdas da dsaf dsf adsfadsa dsafd fdsafdsfdas da dsaf dsf adsfadsa dsafd fdsafdsfdas da dsaf dsf adsfadsa dsafd fdsafdsfdas da dsaf dsf adsfadsa dsafd fdsafdsfdas da dsaf dsf adsfadsa dsafd fdsafdsfdas da dsaf dsf adsfadsa dsafd fdsafdsfdas da dsaf dsf adsfadsa dsafd fdsafdsfdas da dsaf dsf adsfadsa dsafd fdsafdsfdas da dsaf dsf a', 3),
(21, 'ñopiñoiñoiñ', 'afdsafdasfsdf', 'dsagrtjuykuil', 'ñoiñoiñoiuñ', 'iouñoiuñiouñ', '2017-06-14', '17:00', 'http://assets2.mi-web.org/entradas/0006/7911/playa-paisaje-formentera.JPG?1313435530', 'data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBxMTEhUTEhIWFhUXFxcVFRcYGBgXFRUVFRUWFhUVFRUYHSggGBolHRUVITEhJSkrLi4uFx8zODMtNygtLisBCgoKDg0OFxAQGy0lHR0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLf/AABEIAMIBAwMBIgACEQEDEQH/xAAbAAACAwEBAQAAAAAAAAAAAAACAwABBAUGB//EAD4QAAIBAgMFBgIIBQQCAwAAAAABAgMRBCFRBRIxQWETcYGRofAGFBUiMlJTscHRYnKS4fEzQ1SigoMjQmT/xAAZAQADAQEBAAAAAAAAAAAAAAAAAQIDBAX/xAApEQACAgEEAQIGAwEAAAAAAAAAAQIREgMTIVFBMZEEFCKhsfBCUmGB/9oADAMBAAIRAxEAPwD3ENn34B/RrMGFxrbvc2VtuSTslF26cT1Pq8HDaClgGhMsOaKG21LKcVw4rXqZp1G3xGm/IAuiyvl2aaWIhFWk233GiOJgx5COf2DKdE3vELNeT/cyzxDvayYWIyTiKaHVajvnkB2qGAqxOyZdS17h0MRYLELdNgbrOrhpRl9rIz4iKUmuQrGYt1hKDNNNJuw90kldyQWFGKEGMXeFKKvk7hrDZfaS1CwAc+oMarfAU4q/EOrFRV7iGMnWtzEJ5mGtilcBYodDs6UqgidQxvGIFVbgI1yYKkhM6iXFmOVe3AYDsbiORyq1c1ujKXEyYzDNOwwMs8SzPUqGuGBb6CcXQtkAjm1qxgr1h2KTMcsNJ8iqJFPEECeCZApByfVqM7DKjOXvy+8inXmySjpX6minWy4nGdaSHUpX5sGM3RqNs2vE2VjjupbmH8xlxEB0FiXc01KuSscbtQ1ixUI0VKr5iu0Eyq3AGBslUuXGBmhWsaFUEBpUgZS6mapibCHibi5GblUtwFObfMzQlJuxpoYVyV27BwgLWIsLqYxtWWY2rhlzsLpU0nkhWgAo0ZyYyph5yyudDBNp3a5DJY3dukkuonJ2Ojg4rY9WLV/zGYPY+99p2R2IYpS+0rlxg5O0VZK/D9QzYUcHH7PUX9XPPj0NeDwDyaTeWdz12E2XRjT+v9aTz6LuF4nEqMbQRO74RWHZ5unsRt3Zoew3906MMckjsbIruc7y4JW1TZMtSS5GopnmqOx391jq/wAPOWaVsuZ7xRWh5r4y2q4QUI3u7qTzStbh14mcdaUpUjR6airZ8/2hQlF2ir9xip0Jt5xOxvalTrJczrUjnrk5MNkxbcml4icbST+rGJ0quI6i+1Q7A4a2Q2WdrtEQMmFITCm9UScprgkzk08eks+PeBVx9+ZpiyLR1PmmuMRkMWtDz88S9QfmZfeHgGR6V4lMuNdHn6eNetzRSxdyXEeR13WuMhVOZGuT5gmh2df5lLmXGtc58MTHRBrHWyQqA6CklncqriznqvfmMTWohhyqylwyG0U453zE3YzDpyebsJsDXRcuKebOthqkZRStZ8Wc2jTihkkuX9zKUrKSNtdrQGjJJ5mJIKVRLmKwN05K+TuZ6lmYqmKRnq1tGNIGdGm0mdPA4zcbtzPMU674XOjhMSl1HJAmegli7ipVrv8ATkY6O00slFP9DRHayim92Ltn1ZlyvBfHZ3NlbNU85U1bWx38NS3csuiStZL82eHo/F8rWksuVuPiZ6/xnPhFJdeLM5aepIuMoo723fiiVKW7TjG2a3nm7ri0k8l3nmMLtiUe0k91uX3kpfWzs0nw4+iPPYjHXbfFsx1MTbn6nTDRSVGctRtm+vjHczVcXqcuvtVLqc2ttVX5m6g+jFyR2qle/MGlVzsmcShjXN2StqaqeJ3QaaBOzub5DkraJZNMo848W9SljGYrslmd9I56OjHGDoYs5F2EpMTigO3HEDIYtLmcXekuTLc3zTIxHZ3FtOIFTaN+BwnMvfDBBkzu0cdY1U9ormebjWDhiBOCDI9RDGJ8DSsVY8ksV1HQx+pm9MpTPV08XfmaYY2x5CGO6j4bQMnpstSPWwxzJU2k+Fzy0tpdRH0gxLSBzPVrH9Qvn1qeTltRu2dgY463MrZFmeqq4tWM8cbZ34M4cMeXKtcFAWR6CONT0G0sRlxPOwxFh0MdYeDHkekhV/jsV2z+8cD58KG0OottjzR3L34PPvKhh0/tS77HJW0nr6FS2noxbcgzid2WEoaz81+wivhaPKPmcWW1ZamertFvixrRn2LdidCvh6a5Q8kYqtGGkfQxTxYieLNNuRG4h2ItH7Kfhkc6pKejGyxjEVMU+g1GSDJMBVZe2WJdUhWLCz7Vivh3BNbsqUFblwt5CZ7PwyW7ToxfKy4W8DDP4hwz/wB2m3xu2v2MmL+MaFPJVYPnaKk1a+ecIvPRc/U8THVrlv3PRyh4o11PhyhJf6FKOetpeSd2aqPwzQhmqUYvXn5s4VH44wuf/wAso/8AqqZ+UToR+IcPNKXbwzWW89126qWa7mNvVfFuv+iWHX4NGLwlBZSjF/l/c5uOw1FxtGMW+CyvlzND2vhr/wCtS/qiIqbWoXyq0/CURxUl2JyT6OBX2ZTT/wBNeVl5GWrs6F/sLP3kdjF7RpLN1IZcbyX7nCxnxZho5RvUesVaK6Nyt6JnRvuPqZbal6DY7OVrbnpcOGy7/wC2vI40/jCbvu7kVyyzXjJ2fkZam36suOI3f5XZr+lGMvj2vRM1XwnbPVw2Kk7qKCq7Di891dTw1fFzk7qs5a/WbXq+mguLqJXVSV+k3fN6Jmfz0i/lInvobEhzS8MipbJgsjw2H2tiI5KtVa/mv5byZujt/Fx4pS5XlFX81bzGvi3fLD5bjhHop7NgZ57Pho/NnOh8SVHlKh/S3+Vv1N+D2pTqRvKoqXSall42t5NvodMPiU/5GE9BrwKngIdfMBYWK6h/OQfCrTf/AJ8e7IPB05VVvKyjdq+bvbju2WZ0x1U16nO9N36C1TS5Fti8TKUHaSXS0lfy4+gj5ld3ebRd8mbVGlyK3zFUx8E2t+OTtxVgPpKn95Bvaa9ZL3Dam/RM6KmEqhhhik+GfdmR4tEr4nSf8l7oexqf1fsb3VBdQxfOx5uxPmlZtPJcXp36G0dSD9GjNwkvBqlUFymZVjIN2Uk28kk7tsOc3vbm7Lf+7Z72XHIe5HsWEug5TFSkViG4P66ce9ZcL5MTKqrX5XtflfQNxdj25dBSkA2U39Vy5Li+S72IlXjqvMl6iXkuMH0MuQQ8TH7yILdj2i8H0d/5WWj8yLCT6+Z0nB6MHs37sc2Rlb/w5/ysvbDjhp6LzNzovqX2DDInlmNUZ/dj5sLsJfdj5s2xw/u4Xy3f5/2FmTic6eEvk4Qfe3+wH0dHnSp+/A6/y/VkWG7xOSCmvJyPouH4NL34F/RVP8Gl78Dr/KrqHHCom10H1dv7nG+iaf4NL34BLZNL8Kn5HZWFXu42NBCtdB9XbOEtlUPwoeQX0XR/Ch6neWGWgSwy0JbXSGnPt+5w4bMo8qUfJhfRdH8GHkd5UFoEqS0FcekVc/7P3ODT2dSj9mlFdyaCeCp/hL1O8qS0J2a0HmLF9v3OD8jD8Jf9iPAx/CXmzvqCI4INweL/AN9zzr2bB/7EX4sJbLh/x4noVEJIWY0n392ee+jF/wAePmRbLX/Hj5npN1ahJE5lpP8AWzzcdl//AJ4+bHR2Y1woLrm1loehUVzDXeTmWk/2zzNTAyXClnytORkr4Obd3Tz1dSV7HrZ+BkqRWpS1BOP7yeQns+X4X/eQuWAn+H/2fmeslBCZUkXuEYvv7s8m9nS5Ul/UD9Gy/CXn/c9VKmgHBCyXRVS7/J5n6K/g/L9yHpGkWLKPQ6l2wbEQfgy1Fd3ei7IoC3vMJRCS/lDS6LzFYqAT6e/IvwDXuxaktRWOgbvT1ZV8+AxNe3/cKz+763CwxFW/h9UF5ry/QNO3ItrS3mS2GJUYvoEr6lwi/bLVuvqS5DxLin7/AMhpAby6+P8AgJVETkPEtJhpdQHItzFkPEJ9zLXcUn0I29PfmGQYlslupSk9AW5afoFjxGKJaE59BkYvX0Cx4hpBIFIpMVjoaosLcF74V1oBVIqUDNVyGVKi0/MRKVxidCpTAci6qENdWUhDHJAOa1/IXJ3BbWgAE5rUgm3QgDNO6ympLqLSfXzJvs0sihq77BLwYntFbNehas+F/fcKwodvPu8Ak30FpW5suPe/zJsKGtt8l5ElCXQHPoWoS6LxJsdFuH8ViKm+b/J/oTcl0K7B+2Kw4DVP+NeSL3UucSKHu92Wu6PkIAo9PSQSX8wElqkRW0/MQxl7alqXV+gtPqymuogGt9fzJvr/ABYCNNcy92K5BYBby0uTeWi8mA2tCKS6hYw1O2hbrcv1Fdp19C03qgsKGKT9/wCC7sU2yJsdjobF2Xu5cqgu5U13hYUBOYE5EeevvvAn1HY6AlITOYxxAdJhkGIhzKchvZl9ghOaKWm2ZHFENXYL3/ghO5E02mU76lqT4A9o1xRcJnQcoSn0DUuguVTo376hKdhAMVToEpX5WAUy5VF7RLAYkrZ39S+z0bBTVuReXJpEhQVpakvIuMbc7hqQh0AlJFwm+aYfaIvtEKwoFPvXqXz45aEbLUhZFUVG61ff+REwmDZdCbHRbj1KceoTRWfILCgWupFF6lqT9qxTfcKx0S8tUUk9EXGLDDIeIPmWvEJIuwZlKDBuWm9Bjiys+fgS9QtaTFTb6C3F6IfbRBxpEPVNVodmTs/fEYqK5GiURM5iuTKUIxEun0FvwCqSEtFJBZbqe7IgtohdIVszRvbn76hpGanPx9ByqHW2edQ9xQMsl7YvfzDUibHQyL19+JcLPh+4AUegrHQ24Sdxe+Fv9CbHQ1RI4MCnMZcVjopLoMS6AKfQPeJbHQCgEqaK3kXukuQ6LVPqS2f2SRyCJcisQJRWhLd/mMVPqHudCXIpQM6j/F4DI0ed/RDuzLUUZuZotJgbluYUY358A+4iJc2ax0kAn0Du+UV4hxpM0QprQXLNEkjNThN6eC/dmmjhtW/QMZTmNRByG4fDx5K3W36sDEtckm9bpvy5DVVBqUFLPd9bFpE5HKqRZmqROlWwdtfNMxzpopEsxSQG4btzREdNc0WSYrENbqR6EHyB5jeDS6mWn3D6fcdNnDQ9J+3ctXJAZYlsdEjJ6BqWfMFS8A+PNImyqGLvLSFwhbqMUcyXIeJFST5hRovV+ZaiNiQ5FKACpvUJUXqw1LUbdGbmaLTYuNLVhqmy4zDTM3M1WkSEWMT5WBUW+Q6ELcZPuuTk2aLTSFN9C0nyHKMdAkLkr6UKVNjFTLsTeHiGROzRaiTfBch4kuQalYJVBDZaZdEjXV6A74G+TeGA6MjVGpZGFMtyYCDqVm2CoAXsIddlJCs1uxnqvrYVKoxFS75lqkS2W4ssTukGI8tTqWNFOa4ZmffS55mmi0zRyRhgzVSaNEY6GWC53NEJ5dTNzRa02NVEKnS6gxqdAt7T34kOZotINUw9y2glDEzNzZotNBwyz48gk9BY2CItstRSLiNjSuSMrF9oGLCxiproHFJCLhxkPELHbxBZdx0Fht2BdUguUdAoTCdQtSAiEoaDEGmRsKERipgMQWaOyKdMKEIURigE2uRnm78SkhNhzxEV1AdcW6MSKkiqJsNzAYSggVC3u4xASFyTGyYpyAALkAbLGB46r/8AU20SEIY0aW8vEfSeZCEM0NFN5FxIQRQxhEIAxtI0EINCYLKIQokJBxIQAGoFkIIAS4shAAIbAhBDHwQ1EINABVZkuQhaJkMgDMhAJFyJEhCkIKYqZCAISxUyEEMAhCASf//Z', 4),
(22, 'dsfasfs', 'fdsafsdaf', 'dsfsdfsda', 'dsafdafd', 'sfsdafdsafds', '2017-06-21', '05:00', 'http://assets2.mi-web.org/entradas/0006/7911/playa-paisaje-formentera.JPG?1313435530', 'fdsafdsaf dfd asfdafdsafdsafd', 2);

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
(3, 'Palcos', '2500.00', 100, 1),
(4, 'undefined', '0.00', 0, 21),
(5, 'undefined', '0.00', 0, 21),
(6, 'undefined', '0.00', 0, 21),
(7, 'undefined', '0.00', 0, 21),
(8, 'undefined', '0.00', 0, 21),
(9, 'zona 1', '456.00', 451, 22),
(10, 'zona 2', '45.00', 45, 22),
(11, 'zona 3', '12.00', 45, 22),
(12, 'zona 7', '5864.00', 562, 22),
(13, 'zona 6', '231.00', 56, 22),
(14, 'zona 4', '21.00', 5641, 22),
(15, 'zona 5', '564.00', 5648, 22);

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
(1, 'Ricardo Antonio Pizano Pérez', 'rikymon2@hotmail.com', '827ccb0eea8a706c4c34a16891f84e7b', 'a', 'Jesus Yuren No. 117 Col. Lazaro Cardenas', ''),
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
(1, 1, 1, '1'),
(2, 1, 1, '1'),
(3, 2, 1, '1'),
(4, 2, 3, '1'),
(5, 2, 1, '1'),
(6, 1, 10, '1');

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
