-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 11-05-2017 a las 19:52:21
-- Versión del servidor: 10.1.16-MariaDB
-- Versión de PHP: 5.6.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bd_l2f`
--
CREATE DATABASE IF NOT EXISTS `bd_l2f` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `bd_l2f`;
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_ejercicio`
--

CREATE TABLE `tbl_ejercicio` (
  `id_ejercicio` int(11) NOT NULL,
  `nombre_ejercicio` varchar(50) NOT NULL,
  `id_tipo_ejercicio` int(11) NOT NULL,
  `img_ejercicio` varchar(50) NOT NULL,
  `descripcion_ejercicio` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_especialista`
--

CREATE TABLE `tbl_especialista` (
  `id_especilista` int(11) NOT NULL,
  `nombre_especialista` varchar(50) NOT NULL,
  `pass_especialista` varchar(500) NOT NULL,
  `id_tipo_Especialista` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_historial_medidas`
--

CREATE TABLE `tbl_historial_medidas` (
  `id_historial_medidas` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `fecha_his_med` date NOT NULL,
  `id_parte_cuerpo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_historial_peso`
--

CREATE TABLE `tbl_historial_peso` (
  `id_historial_peso` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `fecha_his_pes` date NOT NULL,
  `peso` int(3) NOT NULL COMMENT 'en kg'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tbl_historial_peso`
--

INSERT INTO `tbl_historial_peso` (`id_historial_peso`, `id_usuario`, `fecha_his_pes`, `peso`) VALUES
(1, 2, '0000-00-00', 70),
(2, 2, '2017-05-11', 70),
(3, 2, '2017-05-11', 70);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_objetivo`
--

CREATE TABLE `tbl_objetivo` (
  `id_objetivo` int(11) NOT NULL,
  `nombre_objetivo` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tbl_objetivo`
--

INSERT INTO `tbl_objetivo` (`id_objetivo`, `nombre_objetivo`) VALUES
(1, 'Adelgazar '),
(2, 'Aumentar Masa Corporal'),
(3, 'mantenerse en forma'),
(4, 'Definir musculatura'),
(5, 'ganar músculo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_parte_cuerpo`
--

CREATE TABLE `tbl_parte_cuerpo` (
  `id_parte_cuerpo` int(11) NOT NULL,
  `nombre_parte_cuerpo` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_parte_cuerpo_ejerc`
--

CREATE TABLE `tbl_parte_cuerpo_ejerc` (
  `id_parte_cuerpo_ejer` int(11) NOT NULL,
  `id_parte_cuerpo` int(11) NOT NULL,
  `id_ejercicio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_rutina`
--

CREATE TABLE `tbl_rutina` (
  `id_rutina` int(11) NOT NULL,
  `nombre_rutina` varchar(50) NOT NULL,
  `duracion_rutina` int(2) NOT NULL COMMENT 'duracion en meses',
  `id_objetivo` int(11) NOT NULL,
  `descripcion` text NOT NULL,
  `id_especialista` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tbl_rutina`
--

INSERT INTO `tbl_rutina` (`id_rutina`, `nombre_rutina`, `duracion_rutina`, `id_objetivo`, `descripcion`, `id_especialista`) VALUES
(1, 'RUTINA DEFINICIÓN 1', 2, 4, 'rutina para definir musculatura', NULL),
(2, 'RUTINA DEFINICIÓN 1', 2, 4, 'rutina para definir musculatura', NULL),
(3, 'Rutina perder 5 kgs en 1 mes', 1, 1, 'on esta rutina puedes perder 5 kilos de músculo en un mes. Para ello trabajarás cada grupo muscular dos veces por semana. ', NULL),
(4, 'RUTINA PARA FUERZA Y VOLUMEN 1', 12, 2, 'Rutinas para aumentar fuerza y volumen de masa muscular, si sigues de verdad los principios básicos de culturismo podrás conseguir tus objetivos de aumentar de masa muscular sin aumentar de grasa.', NULL),
(5, 'Rutina ganar msuculo', 5, 5, 'La mayoría de las veces intentamos ganar músculo de una manera rápida sin pensar que para cumplir este objetivo necesitamos seguir unos pasos y completar unas etapas, nuestro cuerpo requiere una adaptación y preparación para ser capaz de alcanzar un estadio de hipertrofia muscular. Necesita prepararse para todos los cambios que conlleva un programa de entrenamiento destinado a conseguir una hipertrofia muscular.', NULL),
(6, 'Rutina mantenimiento', 3, 3, 'Este programa es para todo aquel que pretenda mantenerse en forma, sin tener interés primordial en las competencias de culturismo o de un deporte en específico de competencia, solamente estar en forma y con cuerpo agradable. Además, esta rutina afecta todo el cuerpo planificado para trabajar todos los músculos del cuerpo desarrollando tanto la fuerza como la resistencia muscular.', NULL),
(7, 'rutina mantenimiento largo plazo', 5, 3, 'para mucho tiempo....', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_rutina_ejer`
--

CREATE TABLE `tbl_rutina_ejer` (
  `id_rutina_ejer` int(11) NOT NULL,
  `id_rutina` int(11) NOT NULL,
  `id_ejercicio` int(11) NOT NULL,
  `series` int(3) NOT NULL,
  `repeticiones` int(3) NOT NULL,
  `num_dia` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_rutina_usuario`
--

CREATE TABLE `tbl_rutina_usuario` (
  `id_rutina_usuario` int(11) NOT NULL,
  `fecha_incio` date NOT NULL,
  `fecha_fin` int(11) NOT NULL,
  `id_rutina` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_tipo_cuerpo`
--

CREATE TABLE `tbl_tipo_cuerpo` (
  `id_tipo_cuerpo` int(11) NOT NULL,
  `nombre_tipo_cuerpo` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tbl_tipo_cuerpo`
--

INSERT INTO `tbl_tipo_cuerpo` (`id_tipo_cuerpo`, `nombre_tipo_cuerpo`) VALUES
(1, 'Mesomorfo'),
(2, 'Ectomorfo'),
(3, 'Endomorfo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_tipo_ejercicio`
--

CREATE TABLE `tbl_tipo_ejercicio` (
  `id_tipo_ejercicio` int(11) NOT NULL,
  `nombre_tipo_ejercicio` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tbl_tipo_ejercicio`
--

INSERT INTO `tbl_tipo_ejercicio` (`id_tipo_ejercicio`, `nombre_tipo_ejercicio`) VALUES
(1, 'Aerobico'),
(2, 'Anaerobico');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_tipo_especialista`
--

CREATE TABLE `tbl_tipo_especialista` (
  `id_tipo_especialista` int(11) NOT NULL,
  `nombre_tipo_especialista` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_usuario`
--
CREATE TABLE IF NOT EXISTS `tbl_dieta` (
  `id_dieta` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_dieta` varchar(25) NOT NULL,
  `fecha_inicio_dieta` date DEFAULT NULL,
  `fecha_final_dieta` date DEFAULT NULL,
  `id_especialista` int(11) NOT NULL,
  `v_energetico_dieta` varchar(6) NOT NULL,
  PRIMARY KEY (`id_dieta`),
  KEY `FK_diet_espec` (`id_especialista`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



CREATE TABLE `tbl_usuario` (
  `id_usuario` int(11) NOT NULL,
  `nombre_usuario` varchar(50) NOT NULL,
  `pass_usuario` varchar(500) NOT NULL,
  `email_usuario` varchar(50) NOT NULL,
  `sexo_usuario` enum('Hombre','Mujer','No Especifica','') DEFAULT NULL,
  `apellidos_usuario` varchar(50) DEFAULT NULL,
  `fecha_registro` date NOT NULL,
  `altura_usuario` int(11) DEFAULT NULL,
  `fecha_nacimiento` text,
  `estado_usuario` enum('Activo','Inactivo','Dado de baja') NOT NULL DEFAULT 'Inactivo',
  `id_objetivo` int(11) DEFAULT NULL,
  `id_tipo_cuerpo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tbl_usuario`
--

INSERT INTO `tbl_usuario` (`id_usuario`, `nombre_usuario`, `pass_usuario`, `email_usuario`, `sexo_usuario`, `apellidos_usuario`, `fecha_registro`, `altura_usuario`, `fecha_nacimiento`, `estado_usuario`, `id_objetivo`, `id_tipo_cuerpo`) VALUES
(1, 'marc', '3c9909afec25354d551dae21590bb26e38d53f2173b8d3dc3eee4c047e7ab1c1eb8b85103e3be7ba613b31bb5c9c36214dc9f14a42fd7a2fdb84856bca5c44c2', 'mpetit@gmail.com', NULL, NULL, '2017-05-09', NULL, NULL, 'Inactivo', NULL, NULL),
(2, 'admin', 'c7ad44cbad762a5da0a452f9e854fdc1e0e7a52a38015f23f3eab1d80b931dd472634dfac71cd34ebc35d16ab7fb8a90c81f975113d6c7538dc69dd8de9077ec', 'admin@gmail.com', 'Hombre', 'petit fernandez', '2017-05-11', 173, '1992-09-16', 'Activo', 3, NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tbl_ejercicio`
--
ALTER TABLE `tbl_ejercicio`
  ADD PRIMARY KEY (`id_ejercicio`);

--
-- Indices de la tabla `tbl_especialista`
--
ALTER TABLE `tbl_especialista`
  ADD PRIMARY KEY (`id_especilista`);

--
-- Indices de la tabla `tbl_historial_medidas`
--
ALTER TABLE `tbl_historial_medidas`
  ADD PRIMARY KEY (`id_historial_medidas`);

--
-- Indices de la tabla `tbl_historial_peso`
--
ALTER TABLE `tbl_historial_peso`
  ADD PRIMARY KEY (`id_historial_peso`);

--
-- Indices de la tabla `tbl_objetivo`
--
ALTER TABLE `tbl_objetivo`
  ADD PRIMARY KEY (`id_objetivo`);

--
-- Indices de la tabla `tbl_parte_cuerpo`
--
ALTER TABLE `tbl_parte_cuerpo`
  ADD PRIMARY KEY (`id_parte_cuerpo`);

--
-- Indices de la tabla `tbl_parte_cuerpo_ejerc`
--
ALTER TABLE `tbl_parte_cuerpo_ejerc`
  ADD PRIMARY KEY (`id_parte_cuerpo_ejer`);

--
-- Indices de la tabla `tbl_rutina`
--
ALTER TABLE `tbl_rutina`
  ADD PRIMARY KEY (`id_rutina`);

--
-- Indices de la tabla `tbl_rutina_ejer`
--
ALTER TABLE `tbl_rutina_ejer`
  ADD PRIMARY KEY (`id_rutina_ejer`);

--
-- Indices de la tabla `tbl_rutina_usuario`
--
ALTER TABLE `tbl_rutina_usuario`
  ADD PRIMARY KEY (`id_rutina_usuario`);

--
-- Indices de la tabla `tbl_tipo_cuerpo`
--
ALTER TABLE `tbl_tipo_cuerpo`
  ADD PRIMARY KEY (`id_tipo_cuerpo`);

--
-- Indices de la tabla `tbl_tipo_ejercicio`
--
ALTER TABLE `tbl_tipo_ejercicio`
  ADD PRIMARY KEY (`id_tipo_ejercicio`);

--
-- Indices de la tabla `tbl_tipo_especialista`
--
ALTER TABLE `tbl_tipo_especialista`
  ADD PRIMARY KEY (`id_tipo_especialista`);

--
-- Indices de la tabla `tbl_usuario`
--
ALTER TABLE `tbl_usuario`
  ADD PRIMARY KEY (`id_usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tbl_ejercicio`
--
ALTER TABLE `tbl_ejercicio`
  MODIFY `id_ejercicio` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `tbl_especialista`
--
ALTER TABLE `tbl_especialista`
  MODIFY `id_especilista` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `tbl_historial_medidas`
--
ALTER TABLE `tbl_historial_medidas`
  MODIFY `id_historial_medidas` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `tbl_historial_peso`
--
ALTER TABLE `tbl_historial_peso`
  MODIFY `id_historial_peso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `tbl_objetivo`
--
ALTER TABLE `tbl_objetivo`
  MODIFY `id_objetivo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `tbl_parte_cuerpo`
--
ALTER TABLE `tbl_parte_cuerpo`
  MODIFY `id_parte_cuerpo` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `tbl_parte_cuerpo_ejerc`
--
ALTER TABLE `tbl_parte_cuerpo_ejerc`
  MODIFY `id_parte_cuerpo_ejer` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `tbl_rutina`
--
ALTER TABLE `tbl_rutina`
  MODIFY `id_rutina` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT de la tabla `tbl_rutina_ejer`
--
ALTER TABLE `tbl_rutina_ejer`
  MODIFY `id_rutina_ejer` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `tbl_rutina_usuario`
--
ALTER TABLE `tbl_rutina_usuario`
  MODIFY `id_rutina_usuario` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `tbl_tipo_cuerpo`
--
ALTER TABLE `tbl_tipo_cuerpo`
  MODIFY `id_tipo_cuerpo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `tbl_tipo_ejercicio`
--
ALTER TABLE `tbl_tipo_ejercicio`
  MODIFY `id_tipo_ejercicio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `tbl_tipo_especialista`
--
ALTER TABLE `tbl_tipo_especialista`
  MODIFY `id_tipo_especialista` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `tbl_usuario`
--
ALTER TABLE `tbl_usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
CREATE TABLE IF NOT EXISTS `tbl_plato` (
  `id_plato` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_plato` varchar(35) NOT NULL,
  `preparacion_plato` text NOT NULL,
  `descripcion_plato` text NOT NULL,
  `tipo_plato` varchar(15) NOT NULL,
  PRIMARY KEY (`id_plato`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE IF NOT EXISTS `tbl_dieta_usuario` (
  `id_dieta_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `id_dieta` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  PRIMARY KEY (`id_dieta_usuario`),
  KEY `FK_diet_us` (`id_dieta`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `tbl_comida_dieta` (
  `id_comidieta` int(11) NOT NULL AUTO_INCREMENT,
  `id_dieta` int(11) NOT NULL,
  `momento_comida_comidieta` varchar(30) NOT NULL,
  `id_plato` int(11) NOT NULL,
  PRIMARY KEY (`id_comidieta`),
  KEY `FK_com_diet` (`id_dieta`),
  KEY `FK_com_plat` (`id_plato`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


ALTER TABLE `tbl_comida_dieta`
  ADD CONSTRAINT `FK_com_diet` FOREIGN KEY (`id_dieta`) REFERENCES `tbl_dieta` (`id_dieta`),
  ADD CONSTRAINT `FK_com_plat` FOREIGN KEY (`id_plato`) REFERENCES `tbl_plato` (`id_plato`);

--
-- Filtros para la tabla `tbl_dieta`
--
ALTER TABLE `tbl_dieta`
  ADD CONSTRAINT `FK_diet_espec` FOREIGN KEY (`id_especialista`) REFERENCES `tbl_especialista` (`id_especialista`);

--
-- Filtros para la tabla `tbl_dieta_usuario`
--
ALTER TABLE `tbl_dieta_usuario`
  ADD CONSTRAINT `FK_diet_us` FOREIGN KEY (`id_dieta`) REFERENCES `tbl_dieta` (`id_dieta`);

--
-- Filtros para la tabla `tbl_ejercicio`
--
ALTER TABLE `tbl_ejercicio`
  ADD CONSTRAINT `FK_ejer-tip_ejerc` FOREIGN KEY (`id_tipo_ejercicio`) REFERENCES `tbl_tipo_ejercicio` (`id_tipo_ejercicio`);

--
-- Filtros para la tabla `tbl_especialista`
--
ALTER TABLE `tbl_especialista`
  ADD CONSTRAINT `FK_especialista_tipo` FOREIGN KEY (`id_tipo_Especialista`) REFERENCES `tbl_tipo_especialista` (`id_tipo_especialista`);

--
-- Filtros para la tabla `tbl_historial_medidas`
--
ALTER TABLE `tbl_historial_medidas`
  ADD CONSTRAINT `FK_hmedidas_usu` FOREIGN KEY (`id_usuario`) REFERENCES `tbl_usuario` (`id_usuario`);

--
-- Filtros para la tabla `tbl_historial_peso`
--
ALTER TABLE `tbl_historial_peso`
  ADD CONSTRAINT `FK_hpeso_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `tbl_usuario` (`id_usuario`);

--
-- Filtros para la tabla `tbl_parte_cuerpo_ejerc`
--
ALTER TABLE `tbl_parte_cuerpo_ejerc`
  ADD CONSTRAINT `FK_pc_ejer_pcuerpo` FOREIGN KEY (`id_parte_cuerpo`) REFERENCES `tbl_parte_cuerpo` (`id_parte_cuerpo`),
  ADD CONSTRAINT `FK_pcejercicio_ej` FOREIGN KEY (`id_ejercicio`) REFERENCES `tbl_ejercicio` (`id_ejercicio`);

--
-- Filtros para la tabla `tbl_rutina`
--
ALTER TABLE `tbl_rutina`
  ADD CONSTRAINT `FK_rutina_especialista` FOREIGN KEY (`id_especialista`) REFERENCES `tbl_especialista` (`id_especialista`),
  ADD CONSTRAINT `FK_rutina_objetivo` FOREIGN KEY (`id_objetivo`) REFERENCES `tbl_objetivo` (`id_objetivo`);

--
-- Filtros para la tabla `tbl_rutina_ejer`
--
ALTER TABLE `tbl_rutina_ejer`
  ADD CONSTRAINT `FK_rejercicio_ej` FOREIGN KEY (`id_ejercicio`) REFERENCES `tbl_ejercicio` (`id_ejercicio`),
  ADD CONSTRAINT `FK_rejercicio_ejercicio` FOREIGN KEY (`id_rutina`) REFERENCES `tbl_rutina` (`id_rutina`);

--
-- Filtros para la tabla `tbl_rutina_usuario`
--
ALTER TABLE `tbl_rutina_usuario`
  ADD CONSTRAINT `FK_rusu_rutina` FOREIGN KEY (`id_rutina`) REFERENCES `tbl_rutina` (`id_rutina`),
  ADD CONSTRAINT `FK_rusu_usu` FOREIGN KEY (`id_usuario`) REFERENCES `tbl_usuario` (`id_usuario`);

--
-- Filtros para la tabla `tbl_usuario`
--
ALTER TABLE `tbl_usuario`
  ADD CONSTRAINT `FK_us_obj` FOREIGN KEY (`id_objetivo`) REFERENCES `tbl_objetivo` (`id_objetivo`),
  ADD CONSTRAINT `FK_usu_cue` FOREIGN KEY (`id_tipo_cuerpo`) REFERENCES `tbl_tipo_cuerpo` (`id_tipo_cuerpo`);-- Filtros para la tabla `tbl_comida_dieta`
