-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 05-05-2017 a las 19:52:25
-- Versión del servidor: 10.1.9-MariaDB
-- Versión de PHP: 5.6.15

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
-- Estructura de tabla para la tabla `tbl_comida_dieta`
--

CREATE TABLE IF NOT EXISTS `tbl_comida_dieta` (
  `id_comidieta` int(11) NOT NULL AUTO_INCREMENT,
  `id_dieta` int(11) NOT NULL,
  `momento_comida_comidieta` varchar(30) NOT NULL,
  `id_plato` int(11) NOT NULL,
  PRIMARY KEY (`id_comidieta`),
  KEY `FK_com_diet` (`id_dieta`),
  KEY `FK_com_plat` (`id_plato`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_dieta`
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

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_dieta_usuario`
--

CREATE TABLE IF NOT EXISTS `tbl_dieta_usuario` (
  `id_dieta_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `id_dieta` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  PRIMARY KEY (`id_dieta_usuario`),
  KEY `FK_diet_us` (`id_dieta`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_ejercicio`
--

CREATE TABLE IF NOT EXISTS `tbl_ejercicio` (
  `id_ejercicio` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_ejercicio` varchar(50) NOT NULL,
  `id_tipo_ejercicio` int(11) NOT NULL,
  `img_ejercicio` varchar(50) NOT NULL,
  `descripcion_ejercicio` varchar(100) NOT NULL,
  PRIMARY KEY (`id_ejercicio`),
  KEY `FK_ejer-tip_ejerc` (`id_tipo_ejercicio`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_especialista`
--

CREATE TABLE IF NOT EXISTS `tbl_especialista` (
  `id_especialista` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_especialista` varchar(50) NOT NULL,
  `pass_especialista` varchar(500) NOT NULL,
  `id_tipo_Especialista` int(11) NOT NULL,
  PRIMARY KEY (`id_especialista`),
  KEY `FK_especialista_tipo` (`id_tipo_Especialista`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_historial_medidas`
--

CREATE TABLE IF NOT EXISTS `tbl_historial_medidas` (
  `id_historial_medidas` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) NOT NULL,
  `fecha_his_med` date NOT NULL,
  `id_parte_cuerpo` int(11) NOT NULL,
  PRIMARY KEY (`id_historial_medidas`),
  KEY `FK_hmedidas_usu` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_historial_peso`
--

CREATE TABLE IF NOT EXISTS `tbl_historial_peso` (
  `id_historial_peso` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) NOT NULL,
  `fecha_his_pes` date NOT NULL,
  `peso` int(3) NOT NULL COMMENT 'en kg',
  PRIMARY KEY (`id_historial_peso`),
  KEY `FK_hpeso_usuario` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_objetivo`
--

CREATE TABLE IF NOT EXISTS `tbl_objetivo` (
  `id_objetivo` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_objetivo` varchar(50) NOT NULL,
  PRIMARY KEY (`id_objetivo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_parte_cuerpo`
--

CREATE TABLE IF NOT EXISTS `tbl_parte_cuerpo` (
  `id_parte_cuerpo` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_parte_cuerpo` varchar(50) NOT NULL,
  PRIMARY KEY (`id_parte_cuerpo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_parte_cuerpo_ejerc`
--

CREATE TABLE IF NOT EXISTS `tbl_parte_cuerpo_ejerc` (
  `id_parte_cuerpo_ejer` int(11) NOT NULL AUTO_INCREMENT,
  `id_parte_cuerpo` int(11) NOT NULL,
  `id_ejercicio` int(11) NOT NULL,
  PRIMARY KEY (`id_parte_cuerpo_ejer`),
  KEY `FK_pc_ejer_pcuerpo` (`id_parte_cuerpo`),
  KEY `FK_pcejercicio_ej` (`id_ejercicio`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_plato`
--

CREATE TABLE IF NOT EXISTS `tbl_plato` (
  `id_plato` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_plato` varchar(35) NOT NULL,
  `preparacion_plato` text NOT NULL,
  `descripcion_plato` text NOT NULL,
  `tipo_plato` varchar(15) NOT NULL,
  PRIMARY KEY (`id_plato`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_rutina`
--

CREATE TABLE IF NOT EXISTS `tbl_rutina` (
  `id_rutina` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_rutina` varchar(50) NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_final` date NOT NULL,
  `id_objetivo` int(11) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `id_especialista` int(11) NOT NULL,
  PRIMARY KEY (`id_rutina`),
  KEY `FK_rutina_objetivo` (`id_objetivo`),
  KEY `FK_rutina_especialista` (`id_especialista`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_rutina_ejer`
--

CREATE TABLE IF NOT EXISTS `tbl_rutina_ejer` (
  `id_rutina_ejer` int(11) NOT NULL AUTO_INCREMENT,
  `id_rutina` int(11) NOT NULL,
  `id_ejercicio` int(11) NOT NULL,
  `series` int(3) NOT NULL,
  `repeticiones` int(3) NOT NULL,
  `num_dia` varchar(20) NOT NULL,
  PRIMARY KEY (`id_rutina_ejer`),
  KEY `FK_rejercicio_ejercicio` (`id_rutina`),
  KEY `FK_rejercicio_ej` (`id_ejercicio`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_rutina_usuario`
--

CREATE TABLE IF NOT EXISTS `tbl_rutina_usuario` (
  `id_rutina_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `id_rutina` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  PRIMARY KEY (`id_rutina_usuario`),
  KEY `FK_rusu_rutina` (`id_rutina`),
  KEY `FK_rusu_usu` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_tipo_cuerpo`
--

CREATE TABLE IF NOT EXISTS `tbl_tipo_cuerpo` (
  `id_tipo_cuerpo` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_tipo_cuerpo` varchar(50) NOT NULL,
  PRIMARY KEY (`id_tipo_cuerpo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_tipo_ejercicio`
--

CREATE TABLE IF NOT EXISTS `tbl_tipo_ejercicio` (
  `id_tipo_ejercicio` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_tipo_ejercicio` varchar(50) NOT NULL,
  PRIMARY KEY (`id_tipo_ejercicio`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_tipo_especialista`
--

CREATE TABLE IF NOT EXISTS `tbl_tipo_especialista` (
  `id_tipo_especialista` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_tipo_especialista` varchar(50) NOT NULL,
  PRIMARY KEY (`id_tipo_especialista`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_usuario`
--

CREATE TABLE IF NOT EXISTS `tbl_usuario` (
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT,
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
  `id_tipo_cuerpo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_usuario`),
  KEY `FK_us_obj` (`id_objetivo`),
  KEY `FK_usu_cue` (`id_tipo_cuerpo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `tbl_comida_dieta`
--
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
  ADD CONSTRAINT `FK_usu_cue` FOREIGN KEY (`id_tipo_cuerpo`) REFERENCES `tbl_tipo_cuerpo` (`id_tipo_cuerpo`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
