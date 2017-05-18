-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: May 15, 2017 at 08:48 PM
-- Server version: 10.1.13-MariaDB
-- PHP Version: 7.0.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bd_l2f`
--
CREATE DATABASE IF NOT EXISTS `bd_l2f` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `bd_l2f`;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_comida_dieta`
--

DROP TABLE IF EXISTS `tbl_comida_dieta`;
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
-- Table structure for table `tbl_dieta`
--

DROP TABLE IF EXISTS `tbl_dieta`;
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
-- Table structure for table `tbl_dieta_usuario`
--

DROP TABLE IF EXISTS `tbl_dieta_usuario`;
CREATE TABLE IF NOT EXISTS `tbl_dieta_usuario` (
  `id_dieta_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `id_dieta` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  PRIMARY KEY (`id_dieta_usuario`),
  KEY `FK_diet_us` (`id_dieta`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_ejercicio`
--

DROP TABLE IF EXISTS `tbl_ejercicio`;
CREATE TABLE IF NOT EXISTS `tbl_ejercicio` (
  `id_ejercicio` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_ejercicio` varchar(50) NOT NULL,
  `id_tipo_ejercicio` int(11) NOT NULL,
  `img_ejercicio` varchar(50) NOT NULL,
  `descripcion_ejercicio` text NOT NULL,
  PRIMARY KEY (`id_ejercicio`),
  KEY `FK_ejer-tip_ejerc` (`id_tipo_ejercicio`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_ejercicio`
--

INSERT INTO `tbl_ejercicio` (`id_ejercicio`, `nombre_ejercicio`, `id_tipo_ejercicio`, `img_ejercicio`, `descripcion_ejercicio`) VALUES(1, 'Prensa de Pecho en Banco', 1, 'img 1', 'Recuéstate de espalda sobre un banco y sujeta 2 mancuernas al nivel del pecho, a los lados del cuerpo, con las palmas apuntando hacia tus pies.\r\n\r\nEleva las mancuernas en forma recta hacia arriba hasta que tus codos se encuentren cerca de trabarse y bájalas lentamente luego de una breve pausa.\r\n\r\nExhala al levantar las mancuernas e inhala al bajarlas.');
INSERT INTO `tbl_ejercicio` (`id_ejercicio`, `nombre_ejercicio`, `id_tipo_ejercicio`, `img_ejercicio`, `descripcion_ejercicio`) VALUES(2, 'Prensa de Pecho en Banco (Empuñadura Neutral)', 1, 'img 2', 'Recuéstate de espalda sobre un banco y sujeta 2 mancuernas al nivel del pecho, a los lados del cuerpo, con las palmas apuntando una hacia otra.\r\n\r\nEleva las mancuernas en forma recta hacia arriba hasta que tus codos se encuentren cerca de trabarse y bájalas lentamente luego de una breve pausa.\r\n\r\nExhala al levantar las mancuernas e inhala al bajarlas.');
INSERT INTO `tbl_ejercicio` (`id_ejercicio`, `nombre_ejercicio`, `id_tipo_ejercicio`, `img_ejercicio`, `descripcion_ejercicio`) VALUES(3, 'Prensa de Pecho en Banco - Inclinada', 1, 'img 3', 'Recuéstate de espalda sobre un banco inclinado y sujeta 2 mancuernas al nivel del pecho, a los lados del cuerpo, con las palmas apuntando hacia adelante.\r\n\r\nEleva las mancuernas en forma recta hacia arriba hasta que tus codos se encuentren cerca de trabarse y bájalas lentamente luego de una breve pausa.\r\n\r\nExhala al levantar las mancuernas e inhala al bajarlas.');
INSERT INTO `tbl_ejercicio` (`id_ejercicio`, `nombre_ejercicio`, `id_tipo_ejercicio`, `img_ejercicio`, `descripcion_ejercicio`) VALUES(4, 'Prensa de Pecho Banco Inclinada Empuñadura Neutral', 1, 'img 4', 'Recuéstate de espalda sobre un banco inclinado y sujeta 2 mancuernas al nivel del pecho, a los lados del cuerpo, con las palmas apuntando una hacia otra.\r\n\r\nEleva las mancuernas en forma recta hacia arriba hasta que tus codos se encuentren cerca de trabarse y bájalas lentamente luego de una breve pausa.\r\n\r\nExhala al levantar las mancuernas e inhala al bajarlas.');
INSERT INTO `tbl_ejercicio` (`id_ejercicio`, `nombre_ejercicio`, `id_tipo_ejercicio`, `img_ejercicio`, `descripcion_ejercicio`) VALUES(5, 'Prensa de Pecho en Banco - Declinada', 1, 'img 5', 'Recuéstate de espalda sobre un banco declinado y sujeta 2 mancuernas al nivel del pecho, con las palmas apuntando hacia adelante.\r\n\r\nEleva las mancuernas en forma recta hacia arriba hasta que tus codos se encuentren cerca de trabarse y bájalas lentamente luego de una breve pausa.\r\n\r\nExhala al levantar las mancuernas e inhala al bajarlas.\r\n\r\nApertura - Recostado');
INSERT INTO `tbl_ejercicio` (`id_ejercicio`, `nombre_ejercicio`, `id_tipo_ejercicio`, `img_ejercicio`, `descripcion_ejercicio`) VALUES(6, 'Apertura - Inclinada', 1, 'img 6', 'Recuéstate de espalda sobre un banco inclinado y coge una mancuerna con cada mano a la altura del cuerpo, con tus codos ligeramente arqueados.\r\n\r\nEleva las mancuernas hasta que estén lado a lado por encima de tu cuerpo y luego de una breve pausa bájalas lentamente.\r\n\r\nIntenta mantener el mismo ángulo en tus codos durante todo el movimiento.\r\n');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_especialista`
--

DROP TABLE IF EXISTS `tbl_especialista`;
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
-- Table structure for table `tbl_historial_medidas`
--

DROP TABLE IF EXISTS `tbl_historial_medidas`;
CREATE TABLE IF NOT EXISTS `tbl_historial_medidas` (
  `id_historial_medidas` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) NOT NULL,
  `fecha_his_med` date NOT NULL,
  `id_parte_cuerpo` int(11) NOT NULL,
  PRIMARY KEY (`id_historial_medidas`),
  KEY `FK_hmedidas_usu` (`id_usuario`),
  KEY `FK_hmedidas_pcuerpo` (`id_parte_cuerpo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_historial_peso`
--

DROP TABLE IF EXISTS `tbl_historial_peso`;
CREATE TABLE IF NOT EXISTS `tbl_historial_peso` (
  `id_historial_peso` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) NOT NULL,
  `fecha_his_pes` date NOT NULL,
  `peso` int(3) NOT NULL COMMENT 'en kg',
  PRIMARY KEY (`id_historial_peso`),
  KEY `FK_hpeso_usuario` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_historial_peso`
--

INSERT INTO `tbl_historial_peso` (`id_historial_peso`, `id_usuario`, `fecha_his_pes`, `peso`) VALUES(1, 2, '0000-00-00', 70);
INSERT INTO `tbl_historial_peso` (`id_historial_peso`, `id_usuario`, `fecha_his_pes`, `peso`) VALUES(2, 2, '2017-05-11', 70);
INSERT INTO `tbl_historial_peso` (`id_historial_peso`, `id_usuario`, `fecha_his_pes`, `peso`) VALUES(3, 2, '2017-05-11', 70);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_objetivo`
--

DROP TABLE IF EXISTS `tbl_objetivo`;
CREATE TABLE IF NOT EXISTS `tbl_objetivo` (
  `id_objetivo` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_objetivo` varchar(50) NOT NULL,
  PRIMARY KEY (`id_objetivo`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_objetivo`
--

INSERT INTO `tbl_objetivo` (`id_objetivo`, `nombre_objetivo`) VALUES(1, 'Adelgazar ');
INSERT INTO `tbl_objetivo` (`id_objetivo`, `nombre_objetivo`) VALUES(2, 'Aumentar Masa Corporal');
INSERT INTO `tbl_objetivo` (`id_objetivo`, `nombre_objetivo`) VALUES(3, 'mantenerse en forma');
INSERT INTO `tbl_objetivo` (`id_objetivo`, `nombre_objetivo`) VALUES(4, 'Definir musculatura');
INSERT INTO `tbl_objetivo` (`id_objetivo`, `nombre_objetivo`) VALUES(5, 'ganar músculo');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_parte_cuerpo`
--

DROP TABLE IF EXISTS `tbl_parte_cuerpo`;
CREATE TABLE IF NOT EXISTS `tbl_parte_cuerpo` (
  `id_parte_cuerpo` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_parte_cuerpo` varchar(50) NOT NULL,
  PRIMARY KEY (`id_parte_cuerpo`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_parte_cuerpo`
--

INSERT INTO `tbl_parte_cuerpo` (`id_parte_cuerpo`, `nombre_parte_cuerpo`) VALUES(1, 'Pecho');
INSERT INTO `tbl_parte_cuerpo` (`id_parte_cuerpo`, `nombre_parte_cuerpo`) VALUES(2, 'Espalda');
INSERT INTO `tbl_parte_cuerpo` (`id_parte_cuerpo`, `nombre_parte_cuerpo`) VALUES(3, 'Bíceps y antebrazos');
INSERT INTO `tbl_parte_cuerpo` (`id_parte_cuerpo`, `nombre_parte_cuerpo`) VALUES(4, 'Tríceps');
INSERT INTO `tbl_parte_cuerpo` (`id_parte_cuerpo`, `nombre_parte_cuerpo`) VALUES(5, 'Piernas');
INSERT INTO `tbl_parte_cuerpo` (`id_parte_cuerpo`, `nombre_parte_cuerpo`) VALUES(6, 'Hombro');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_parte_cuerpo_ejerc`
--

DROP TABLE IF EXISTS `tbl_parte_cuerpo_ejerc`;
CREATE TABLE IF NOT EXISTS `tbl_parte_cuerpo_ejerc` (
  `id_parte_cuerpo_ejer` int(11) NOT NULL AUTO_INCREMENT,
  `id_parte_cuerpo` int(11) NOT NULL,
  `id_ejercicio` int(11) NOT NULL,
  PRIMARY KEY (`id_parte_cuerpo_ejer`),
  KEY `FK_pc_ejer_pcuerpo` (`id_parte_cuerpo`),
  KEY `FK_pcejercicio_ej` (`id_ejercicio`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_parte_cuerpo_ejerc`
--

INSERT INTO `tbl_parte_cuerpo_ejerc` (`id_parte_cuerpo_ejer`, `id_parte_cuerpo`, `id_ejercicio`) VALUES(1, 1, 1);
INSERT INTO `tbl_parte_cuerpo_ejerc` (`id_parte_cuerpo_ejer`, `id_parte_cuerpo`, `id_ejercicio`) VALUES(2, 1, 2);
INSERT INTO `tbl_parte_cuerpo_ejerc` (`id_parte_cuerpo_ejer`, `id_parte_cuerpo`, `id_ejercicio`) VALUES(3, 1, 3);
INSERT INTO `tbl_parte_cuerpo_ejerc` (`id_parte_cuerpo_ejer`, `id_parte_cuerpo`, `id_ejercicio`) VALUES(4, 1, 4);
INSERT INTO `tbl_parte_cuerpo_ejerc` (`id_parte_cuerpo_ejer`, `id_parte_cuerpo`, `id_ejercicio`) VALUES(5, 1, 5);
INSERT INTO `tbl_parte_cuerpo_ejerc` (`id_parte_cuerpo_ejer`, `id_parte_cuerpo`, `id_ejercicio`) VALUES(6, 1, 6);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_plato`
--

DROP TABLE IF EXISTS `tbl_plato`;
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
-- Table structure for table `tbl_rutina`
--

DROP TABLE IF EXISTS `tbl_rutina`;
CREATE TABLE IF NOT EXISTS `tbl_rutina` (
  `id_rutina` int(11) NOT NULL,
  `nombre_rutina` varchar(50) NOT NULL,
  `duracion_rutina` int(2) NOT NULL COMMENT 'duracion en meses',
  `id_objetivo` int(11) NOT NULL,
  `descripcion` text NOT NULL,
  `id_especialista` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_rutina`),
  KEY `FK_rutina_objetivo` (`id_objetivo`),
  KEY `FK_rutina_espe` (`id_especialista`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_rutina`
--

INSERT INTO `tbl_rutina` (`id_rutina`, `nombre_rutina`, `duracion_rutina`, `id_objetivo`, `descripcion`, `id_especialista`) VALUES(1, 'RUTINA DEFINICIÓN 1', 2, 4, 'rutina para definir musculatura', NULL);
INSERT INTO `tbl_rutina` (`id_rutina`, `nombre_rutina`, `duracion_rutina`, `id_objetivo`, `descripcion`, `id_especialista`) VALUES(2, 'RUTINA DEFINICIÓN 1', 2, 4, 'rutina para definir musculatura', NULL);
INSERT INTO `tbl_rutina` (`id_rutina`, `nombre_rutina`, `duracion_rutina`, `id_objetivo`, `descripcion`, `id_especialista`) VALUES(3, 'Rutina perder 5 kgs en 1 mes', 1, 1, 'on esta rutina puedes perder 5 kilos de músculo en un mes. Para ello trabajarás cada grupo muscular dos veces por semana. ', NULL);
INSERT INTO `tbl_rutina` (`id_rutina`, `nombre_rutina`, `duracion_rutina`, `id_objetivo`, `descripcion`, `id_especialista`) VALUES(4, 'RUTINA PARA FUERZA Y VOLUMEN 1', 12, 2, 'Rutinas para aumentar fuerza y volumen de masa muscular, si sigues de verdad los principios básicos de culturismo podrás conseguir tus objetivos de aumentar de masa muscular sin aumentar de grasa.', NULL);
INSERT INTO `tbl_rutina` (`id_rutina`, `nombre_rutina`, `duracion_rutina`, `id_objetivo`, `descripcion`, `id_especialista`) VALUES(5, 'Rutina ganar msuculo', 5, 5, 'La mayoría de las veces intentamos ganar músculo de una manera rápida sin pensar que para cumplir este objetivo necesitamos seguir unos pasos y completar unas etapas, nuestro cuerpo requiere una adaptación y preparación para ser capaz de alcanzar un estadio de hipertrofia muscular. Necesita prepararse para todos los cambios que conlleva un programa de entrenamiento destinado a conseguir una hipertrofia muscular.', NULL);
INSERT INTO `tbl_rutina` (`id_rutina`, `nombre_rutina`, `duracion_rutina`, `id_objetivo`, `descripcion`, `id_especialista`) VALUES(6, 'Rutina mantenimiento', 3, 3, 'Este programa es para todo aquel que pretenda mantenerse en forma, sin tener interés primordial en las competencias de culturismo o de un deporte en específico de competencia, solamente estar en forma y con cuerpo agradable. Además, esta rutina afecta todo el cuerpo planificado para trabajar todos los músculos del cuerpo desarrollando tanto la fuerza como la resistencia muscular.', NULL);
INSERT INTO `tbl_rutina` (`id_rutina`, `nombre_rutina`, `duracion_rutina`, `id_objetivo`, `descripcion`, `id_especialista`) VALUES(7, 'rutina mantenimiento largo plazo', 5, 3, 'para mucho tiempo....', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_rutina_ejer`
--

DROP TABLE IF EXISTS `tbl_rutina_ejer`;
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
-- Table structure for table `tbl_rutina_usuario`
--

DROP TABLE IF EXISTS `tbl_rutina_usuario`;
CREATE TABLE IF NOT EXISTS `tbl_rutina_usuario` (
  `id_rutina_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_inicio` text NOT NULL,
  `fecha_fin` text NOT NULL,
  `id_rutina` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  PRIMARY KEY (`id_rutina_usuario`),
  KEY `FK_rutusu_rutina` (`id_rutina`),
  KEY `FK_rutusu_usu` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_rutina_usuario`
--

INSERT INTO `tbl_rutina_usuario` (`id_rutina_usuario`, `fecha_inicio`, `fecha_fin`, `id_rutina`, `id_usuario`) VALUES(2, '2017-05-15', '2017-08-15', 6, 2);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_tipo_cuerpo`
--

DROP TABLE IF EXISTS `tbl_tipo_cuerpo`;
CREATE TABLE IF NOT EXISTS `tbl_tipo_cuerpo` (
  `id_tipo_cuerpo` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_tipo_cuerpo` varchar(50) NOT NULL,
  PRIMARY KEY (`id_tipo_cuerpo`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_tipo_cuerpo`
--

INSERT INTO `tbl_tipo_cuerpo` (`id_tipo_cuerpo`, `nombre_tipo_cuerpo`) VALUES(1, 'Mesomorfo');
INSERT INTO `tbl_tipo_cuerpo` (`id_tipo_cuerpo`, `nombre_tipo_cuerpo`) VALUES(2, 'Ectomorfo');
INSERT INTO `tbl_tipo_cuerpo` (`id_tipo_cuerpo`, `nombre_tipo_cuerpo`) VALUES(3, 'Endomorfo');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_tipo_ejercicio`
--

DROP TABLE IF EXISTS `tbl_tipo_ejercicio`;
CREATE TABLE IF NOT EXISTS `tbl_tipo_ejercicio` (
  `id_tipo_ejercicio` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_tipo_ejercicio` varchar(50) NOT NULL,
  PRIMARY KEY (`id_tipo_ejercicio`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_tipo_ejercicio`
--

INSERT INTO `tbl_tipo_ejercicio` (`id_tipo_ejercicio`, `nombre_tipo_ejercicio`) VALUES(1, 'Musculación');
INSERT INTO `tbl_tipo_ejercicio` (`id_tipo_ejercicio`, `nombre_tipo_ejercicio`) VALUES(2, 'Cardio-Vascular');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_tipo_especialista`
--

DROP TABLE IF EXISTS `tbl_tipo_especialista`;
CREATE TABLE IF NOT EXISTS `tbl_tipo_especialista` (
  `id_tipo_especialista` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_tipo_especialista` varchar(50) NOT NULL,
  PRIMARY KEY (`id_tipo_especialista`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_usuario`
--

DROP TABLE IF EXISTS `tbl_usuario`;
CREATE TABLE IF NOT EXISTS `tbl_usuario` (
  `id_usuario` int(11) NOT NULL,
  `nombre_usuario` varchar(50) NOT NULL,
  `pass_usuario` varchar(500) NOT NULL,
  `email_usuario` varchar(50) NOT NULL,
  `sexo_usuario` enum('Hombre','Mujer','No Especifica','') DEFAULT NULL,
  `apellidos_usuario` varchar(50) DEFAULT NULL,
  `fecha_registro` text NOT NULL,
  `altura_usuario` int(11) DEFAULT NULL,
  `fecha_nacimiento` text,
  `estado_usuario` enum('Activo','Inactivo','Dado de baja') NOT NULL DEFAULT 'Inactivo',
  `id_objetivo` int(11) DEFAULT NULL,
  `id_tipo_cuerpo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_usuario`),
  KEY `FK_usu_obj` (`id_objetivo`),
  KEY `FK_usu_tcuerp` (`id_tipo_cuerpo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_usuario`
--

INSERT INTO `tbl_usuario` (`id_usuario`, `nombre_usuario`, `pass_usuario`, `email_usuario`, `sexo_usuario`, `apellidos_usuario`, `fecha_registro`, `altura_usuario`, `fecha_nacimiento`, `estado_usuario`, `id_objetivo`, `id_tipo_cuerpo`) VALUES(1, 'marc', '3c9909afec25354d551dae21590bb26e38d53f2173b8d3dc3eee4c047e7ab1c1eb8b85103e3be7ba613b31bb5c9c36214dc9f14a42fd7a2fdb84856bca5c44c2', 'mpetit@gmail.com', NULL, NULL, '2017-05-09', NULL, NULL, 'Inactivo', NULL, NULL);
INSERT INTO `tbl_usuario` (`id_usuario`, `nombre_usuario`, `pass_usuario`, `email_usuario`, `sexo_usuario`, `apellidos_usuario`, `fecha_registro`, `altura_usuario`, `fecha_nacimiento`, `estado_usuario`, `id_objetivo`, `id_tipo_cuerpo`) VALUES(2, 'admin', 'c7ad44cbad762a5da0a452f9e854fdc1e0e7a52a38015f23f3eab1d80b931dd472634dfac71cd34ebc35d16ab7fb8a90c81f975113d6c7538dc69dd8de9077ec', 'admin@gmail.com', 'Hombre', 'petit fernandez', '2017-05-11', 173, '1992-09-16', 'Activo', 3, NULL);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_comida_dieta`
--
ALTER TABLE `tbl_comida_dieta`
  ADD CONSTRAINT `FK_com_diet` FOREIGN KEY (`id_dieta`) REFERENCES `tbl_dieta` (`id_dieta`),
  ADD CONSTRAINT `FK_com_plat` FOREIGN KEY (`id_plato`) REFERENCES `tbl_plato` (`id_plato`);

--
-- Constraints for table `tbl_dieta`
--
ALTER TABLE `tbl_dieta`
  ADD CONSTRAINT `FK_diet_espec` FOREIGN KEY (`id_especialista`) REFERENCES `tbl_especialista` (`id_especialista`);

--
-- Constraints for table `tbl_dieta_usuario`
--
ALTER TABLE `tbl_dieta_usuario`
  ADD CONSTRAINT `FK_diet_us` FOREIGN KEY (`id_dieta`) REFERENCES `tbl_dieta` (`id_dieta`);

--
-- Constraints for table `tbl_ejercicio`
--
ALTER TABLE `tbl_ejercicio`
  ADD CONSTRAINT `FK_ejer-tip_ejerc` FOREIGN KEY (`id_tipo_ejercicio`) REFERENCES `tbl_tipo_ejercicio` (`id_tipo_ejercicio`);

--
-- Constraints for table `tbl_especialista`
--
ALTER TABLE `tbl_especialista`
  ADD CONSTRAINT `FK_especialista_tipo` FOREIGN KEY (`id_tipo_Especialista`) REFERENCES `tbl_tipo_especialista` (`id_tipo_especialista`);

--
-- Constraints for table `tbl_historial_medidas`
--
ALTER TABLE `tbl_historial_medidas`
  ADD CONSTRAINT `FK_hmedidas_pcuerpo` FOREIGN KEY (`id_parte_cuerpo`) REFERENCES `tbl_parte_cuerpo` (`id_parte_cuerpo`),
  ADD CONSTRAINT `FK_hmedidas_usu` FOREIGN KEY (`id_usuario`) REFERENCES `tbl_usuario` (`id_usuario`);

--
-- Constraints for table `tbl_historial_peso`
--
ALTER TABLE `tbl_historial_peso`
  ADD CONSTRAINT `FK_hpeso_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `tbl_usuario` (`id_usuario`);

--
-- Constraints for table `tbl_parte_cuerpo_ejerc`
--
ALTER TABLE `tbl_parte_cuerpo_ejerc`
  ADD CONSTRAINT `FK_pc_ejer_pcuerpo` FOREIGN KEY (`id_parte_cuerpo`) REFERENCES `tbl_parte_cuerpo` (`id_parte_cuerpo`),
  ADD CONSTRAINT `FK_pcejercicio_ej` FOREIGN KEY (`id_ejercicio`) REFERENCES `tbl_ejercicio` (`id_ejercicio`);

--
-- Constraints for table `tbl_rutina`
--
ALTER TABLE `tbl_rutina`
  ADD CONSTRAINT `FK_rutina_especialista` FOREIGN KEY (`id_especialista`) REFERENCES `tbl_especialista` (`id_especialista`),
  ADD CONSTRAINT `FK_rutina_objetivo` FOREIGN KEY (`id_objetivo`) REFERENCES `tbl_objetivo` (`id_objetivo`);

--
-- Constraints for table `tbl_rutina_ejer`
--
ALTER TABLE `tbl_rutina_ejer`
  ADD CONSTRAINT `FK_rejercicio_ej` FOREIGN KEY (`id_ejercicio`) REFERENCES `tbl_ejercicio` (`id_ejercicio`),
  ADD CONSTRAINT `FK_rejercicio_ejercicio` FOREIGN KEY (`id_rutina`) REFERENCES `tbl_rutina` (`id_rutina`);

--
-- Constraints for table `tbl_rutina_usuario`
--
ALTER TABLE `tbl_rutina_usuario`
  ADD CONSTRAINT `FK_rusu_rutina` FOREIGN KEY (`id_rutina`) REFERENCES `tbl_rutina` (`id_rutina`),
  ADD CONSTRAINT `FK_rusu_usu` FOREIGN KEY (`id_usuario`) REFERENCES `tbl_usuario` (`id_usuario`);

--
-- Constraints for table `tbl_usuario`
--
ALTER TABLE `tbl_usuario`
  ADD CONSTRAINT `FK_us_obj` FOREIGN KEY (`id_objetivo`) REFERENCES `tbl_objetivo` (`id_objetivo`),
  ADD CONSTRAINT `FK_usu_cue` FOREIGN KEY (`id_tipo_cuerpo`) REFERENCES `tbl_tipo_cuerpo` (`id_tipo_cuerpo`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
