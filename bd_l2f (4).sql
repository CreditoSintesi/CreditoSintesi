-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: May 23, 2017 at 05:19 PM
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

-- --------------------------------------------------------

--
-- Table structure for table `tbl_comida_dieta`
--

CREATE TABLE `tbl_comida_dieta` (
  `id_comidieta` int(11) NOT NULL,
  `id_dieta` int(11) NOT NULL,
  `momento_comida_comidieta` varchar(30) NOT NULL,
  `id_plato` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_comida_dieta`
--

INSERT INTO `tbl_comida_dieta` (`id_comidieta`, `id_dieta`, `momento_comida_comidieta`, `id_plato`) VALUES
(1, 1, 'desayuno', 1),
(2, 1, 'mediamañana', 2),
(3, 1, 'comida mediodia', 3),
(4, 1, 'post entreno', 4),
(5, 1, 'cena', 5),
(6, 1, 'antes de dormir', 6);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_dieta`
--

CREATE TABLE `tbl_dieta` (
  `id_dieta` int(11) NOT NULL,
  `nombre_dieta` varchar(25) NOT NULL,
  `id_especialista` int(11) DEFAULT NULL,
  `v_energetico_dieta` varchar(6) NOT NULL,
  `id_objetivo` int(11) NOT NULL,
  `duracion_dieta` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_dieta`
--

INSERT INTO `tbl_dieta` (`id_dieta`, `nombre_dieta`, `id_especialista`, `v_energetico_dieta`, `id_objetivo`, `duracion_dieta`) VALUES
(1, 'Dieta ganar músculo', NULL, '3136 ', 5, 3);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_dieta_usuario`
--

CREATE TABLE `tbl_dieta_usuario` (
  `id_dieta_usuario` int(11) NOT NULL,
  `id_dieta` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `fecha_fin_dieta` date NOT NULL,
  `fecha_inicio_dieta` date NOT NULL,
  `dieta_finalizada` varchar(2) NOT NULL DEFAULT 'no' COMMENT 'si/no'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_dieta_usuario`
--

INSERT INTO `tbl_dieta_usuario` (`id_dieta_usuario`, `id_dieta`, `id_usuario`, `fecha_fin_dieta`, `fecha_inicio_dieta`, `dieta_finalizada`) VALUES
(1, 1, 1, '1970-01-01', '2017-05-23', 'no');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_ejercicio`
--

CREATE TABLE `tbl_ejercicio` (
  `id_ejercicio` int(11) NOT NULL,
  `nombre_ejercicio` varchar(50) NOT NULL,
  `id_tipo_ejercicio` int(11) NOT NULL,
  `img_ejercicio` varchar(50) NOT NULL,
  `descripcion_ejercicio` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_ejercicio`
--

INSERT INTO `tbl_ejercicio` (`id_ejercicio`, `nombre_ejercicio`, `id_tipo_ejercicio`, `img_ejercicio`, `descripcion_ejercicio`) VALUES
(1, 'Prensa de Pecho en Banco', 1, 'img 1', 'Recuéstate de espalda sobre un banco y sujeta 2 mancuernas al nivel del pecho, a los lados del cuerpo, con las palmas apuntando hacia tus pies.\r\n\r\nEleva las mancuernas en forma recta hacia arriba hasta que tus codos se encuentren cerca de trabarse y bájalas lentamente luego de una breve pausa.\r\n\r\nExhala al levantar las mancuernas e inhala al bajarlas.'),
(2, 'Prensa de Pecho en Banco (Empuñadura Neutral)', 1, 'img 2', 'Recuéstate de espalda sobre un banco y sujeta 2 mancuernas al nivel del pecho, a los lados del cuerpo, con las palmas apuntando una hacia otra.\r\n\r\nEleva las mancuernas en forma recta hacia arriba hasta que tus codos se encuentren cerca de trabarse y bájalas lentamente luego de una breve pausa.\r\n\r\nExhala al levantar las mancuernas e inhala al bajarlas.'),
(3, 'Prensa de Pecho en Banco - Inclinada', 1, 'img 3', 'Recuéstate de espalda sobre un banco inclinado y sujeta 2 mancuernas al nivel del pecho, a los lados del cuerpo, con las palmas apuntando hacia adelante.\r\n\r\nEleva las mancuernas en forma recta hacia arriba hasta que tus codos se encuentren cerca de trabarse y bájalas lentamente luego de una breve pausa.\r\n\r\nExhala al levantar las mancuernas e inhala al bajarlas.'),
(4, 'Prensa de Pecho Banco Inclinada Empuñadura Neutral', 1, 'img 4', 'Recuéstate de espalda sobre un banco inclinado y sujeta 2 mancuernas al nivel del pecho, a los lados del cuerpo, con las palmas apuntando una hacia otra.\r\n\r\nEleva las mancuernas en forma recta hacia arriba hasta que tus codos se encuentren cerca de trabarse y bájalas lentamente luego de una breve pausa.\r\n\r\nExhala al levantar las mancuernas e inhala al bajarlas.'),
(5, 'Prensa de Pecho en Banco - Declinada', 1, 'img 5', 'Recuéstate de espalda sobre un banco declinado y sujeta 2 mancuernas al nivel del pecho, con las palmas apuntando hacia adelante.\r\n\r\nEleva las mancuernas en forma recta hacia arriba hasta que tus codos se encuentren cerca de trabarse y bájalas lentamente luego de una breve pausa.\r\n\r\nExhala al levantar las mancuernas e inhala al bajarlas.\r\n\r\nApertura - Recostado'),
(6, 'Apertura - Inclinada', 1, 'img 6', 'Recuéstate de espalda sobre un banco inclinado y coge una mancuerna con cada mano a la altura del cuerpo, con tus codos ligeramente arqueados.\r\n\r\nEleva las mancuernas hasta que estén lado a lado por encima de tu cuerpo y luego de una breve pausa bájalas lentamente.\r\n\r\nIntenta mantener el mismo ángulo en tus codos durante todo el movimiento.\r\n');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_especialista`
--

CREATE TABLE `tbl_especialista` (
  `id_especialista` int(11) NOT NULL,
  `nombre_especialista` varchar(50) NOT NULL,
  `pass_especialista` varchar(500) NOT NULL,
  `id_tipo_Especialista` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_historial_medidas`
--

CREATE TABLE `tbl_historial_medidas` (
  `id_historial_medidas` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `fecha_his_med` date NOT NULL,
  `cm` int(11) NOT NULL,
  `id_parte_cuerpo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_historial_peso`
--

CREATE TABLE `tbl_historial_peso` (
  `id_historial_peso` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `fecha_his_pes` date NOT NULL,
  `peso` int(3) NOT NULL COMMENT 'en kg'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_historial_peso`
--

INSERT INTO `tbl_historial_peso` (`id_historial_peso`, `id_usuario`, `fecha_his_pes`, `peso`) VALUES
(1, 2, '0000-00-00', 70),
(2, 2, '2017-05-11', 70),
(3, 2, '2017-05-11', 70),
(4, 0, '2017-05-19', 65),
(5, 0, '2017-05-19', 67),
(6, 0, '2017-05-19', 71),
(7, 1, '2017-05-23', 70);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_historial_rutinas`
--

CREATE TABLE `tbl_historial_rutinas` (
  `id_historial_rutinas` int(11) NOT NULL,
  `sesion_rutina` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_rutina` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_historial_rutinas`
--

INSERT INTO `tbl_historial_rutinas` (`id_historial_rutinas`, `sesion_rutina`, `fecha`, `id_usuario`, `id_rutina`) VALUES
(4, 1, '2017-05-17', 2, 6),
(5, 1, '2017-05-18', 2, 6),
(6, 1, '2017-05-20', 0, 6),
(9, 2, '2017-05-21', 2, 6);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_objetivo`
--

CREATE TABLE `tbl_objetivo` (
  `id_objetivo` int(11) NOT NULL,
  `nombre_objetivo` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_objetivo`
--

INSERT INTO `tbl_objetivo` (`id_objetivo`, `nombre_objetivo`) VALUES
(1, 'Adelgazar '),
(2, 'Aumentar Masa Corporal'),
(3, 'mantenerse en forma'),
(4, 'Definir musculatura'),
(5, 'ganar músculo');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_parte_cuerpo`
--

CREATE TABLE `tbl_parte_cuerpo` (
  `id_parte_cuerpo` int(11) NOT NULL,
  `nombre_parte_cuerpo` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_parte_cuerpo`
--

INSERT INTO `tbl_parte_cuerpo` (`id_parte_cuerpo`, `nombre_parte_cuerpo`) VALUES
(1, 'Pecho'),
(2, 'Espalda'),
(3, 'Bíceps y antebrazos'),
(4, 'Tríceps'),
(5, 'Piernas'),
(6, 'Hombro');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_parte_cuerpo_ejerc`
--

CREATE TABLE `tbl_parte_cuerpo_ejerc` (
  `id_parte_cuerpo_ejer` int(11) NOT NULL,
  `id_parte_cuerpo` int(11) NOT NULL,
  `id_ejercicio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_parte_cuerpo_ejerc`
--

INSERT INTO `tbl_parte_cuerpo_ejerc` (`id_parte_cuerpo_ejer`, `id_parte_cuerpo`, `id_ejercicio`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 1, 5),
(6, 1, 6);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_plato`
--

CREATE TABLE `tbl_plato` (
  `id_plato` int(11) NOT NULL,
  `nombre_plato` varchar(35) NOT NULL,
  `preparacion_plato` text NOT NULL,
  `descripcion_plato` text NOT NULL,
  `tipo_plato` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_plato`
--

INSERT INTO `tbl_plato` (`id_plato`, `nombre_plato`, `preparacion_plato`, `descripcion_plato`, `tipo_plato`) VALUES
(1, 'Brécoles + Pechuga de pollo', '2 huevos + 4 claras de huevo\r\n30 g.de leche desgrasada\r\n1 taza de brécoles troceados. al vapor.\r\n60 g. de pechuga de pollo cocido.\r\nSal. pimienta o ajo en polvo para sabor.\r\nAceite de oliva.', 'Bate los huevos y la leche. Cocina los brécoles y el pollo. Añádeles luego la mezcla de huevos, tápalo y cocínalo a fuego lento durante aproximadamente 10 minutos.\r\n\r\n1 rebanada de pan integral.\r\n30 g. de queso desgrasado.\r\n1 vaso de jugo vegetal.', 'Desayuno'),
(2, 'Manzana + Yogur desnatado', '1 manzana grande\r\n1 Yogur desnatado', '1 manzana grande\r\n1 Yogur desnatado', 'mediamañana'),
(3, 'Bocadillo de carne', '85 g. de carne magra cortada en trozo\r\n2 rebanadas de pan de centeno\r\n1 tomate mediano, troceado\r\n60 g. de queso desgrasado\r\nMostaza o especias según nuestro gusto\r\n1 vaso de leche desgrasada', '85 g. de carne magra cortada en trozo\r\n2 rebanadas de pan de centeno\r\n1 tomate mediano, troceado\r\n60 g. de queso desgrasado\r\nMostaza o especias según nuestro gusto\r\n1 vaso de leche desgrasada', 'Mediodía Comida'),
(4, 'Bebida + Barrita energética', '1/2 litro de bebida post entrenamiento (unas 380 calorías. 35 g. de proteína y 60 g. de carbohidratos)\r\n1 barrita energética.', 'Después del entrenamiento a casi nadie le apetece cocinar, por lo que somos realistas y utilizamos un suplemento post entrenamiento. Puedes pasar esta comida a otra parte del día si entrenas a una hora diferente. Si pesas poco o no necesitas las 620 calorías de aquí, no tomes la barrita energética (240 calorías, selecciona una con un elevado índice glucémico).', 'post-entrenar'),
(5, 'Salmón y pasta', '85 g. de salmón cocido.\r\n225 g. de tomates. cortados o aplastados con espátula mientras los cocinamos.\r\n1/2 taza de champiñones, troceados.\r\nEspecias para sazonar.\r\nCocedlo durante 3 a 4 m.\r\n1 taza pequeña de pasta cocida.\r\n1 taza pequeña de vegetales mezclados.\r\n1 batata, cocida.', 'Esta comida será algo más contundente ya que es muy importante para el entrenamiento que hemos realizado unas horas antes. De echo se podría decir que la comida postentrenamiento recupera y esta pone en marcha el mecanismo de crecimiento muscular.', 'cena'),
(6, '225 gramos de yogur desnatado.', '225 gramos de yogur desnatado.', '10’30 de la noche: Antes de acostarse', 'Antes de dormir');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_rutina`
--

CREATE TABLE `tbl_rutina` (
  `id_rutina` int(11) NOT NULL,
  `nombre_rutina` varchar(50) NOT NULL,
  `duracion_rutina` int(2) NOT NULL COMMENT 'duracion en meses',
  `id_objetivo` int(11) NOT NULL,
  `descripcion` text NOT NULL,
  `sesiones_semana_rutina` int(11) NOT NULL,
  `id_especialista` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_rutina`
--

INSERT INTO `tbl_rutina` (`id_rutina`, `nombre_rutina`, `duracion_rutina`, `id_objetivo`, `descripcion`, `sesiones_semana_rutina`, `id_especialista`) VALUES
(1, 'RUTINA DEFINICIÓN 1', 2, 4, 'rutina para definir musculatura', 3, NULL),
(2, 'RUTINA DEFINICIÓN 1', 2, 4, 'rutina para definir musculatura', 2, NULL),
(3, 'Rutina perder 5 kgs en 1 mes', 1, 1, 'on esta rutina puedes perder 5 kilos de músculo en un mes. Para ello trabajarás cada grupo muscular dos veces por semana. ', 3, NULL),
(4, 'RUTINA PARA FUERZA Y VOLUMEN 1', 12, 2, 'Rutinas para aumentar fuerza y volumen de masa muscular, si sigues de verdad los principios básicos de culturismo podrás conseguir tus objetivos de aumentar de masa muscular sin aumentar de grasa.', 4, NULL),
(5, 'Rutina ganar msuculo', 5, 5, 'La mayoría de las veces intentamos ganar músculo de una manera rápida sin pensar que para cumplir este objetivo necesitamos seguir unos pasos y completar unas etapas, nuestro cuerpo requiere una adaptación y preparación para ser capaz de alcanzar un estadio de hipertrofia muscular. Necesita prepararse para todos los cambios que conlleva un programa de entrenamiento destinado a conseguir una hipertrofia muscular.', 3, NULL),
(6, 'Rutina mantenimiento', 3, 3, 'Este programa es para todo aquel que pretenda mantenerse en forma, sin tener interés primordial en las competencias de culturismo o de un deporte en específico de competencia, solamente estar en forma y con cuerpo agradable. Además, esta rutina afecta todo el cuerpo planificado para trabajar todos los músculos del cuerpo desarrollando tanto la fuerza como la resistencia muscular.', 2, NULL),
(7, 'rutina mantenimiento largo plazo', 5, 3, 'para mucho tiempo....', 3, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_rutina_ejer`
--

CREATE TABLE `tbl_rutina_ejer` (
  `id_rutina_ejer` int(11) NOT NULL,
  `id_rutina` int(11) NOT NULL,
  `id_ejercicio` int(11) NOT NULL,
  `series` int(3) NOT NULL,
  `repeticiones` int(3) NOT NULL,
  `num_dia` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_rutina_ejer`
--

INSERT INTO `tbl_rutina_ejer` (`id_rutina_ejer`, `id_rutina`, `id_ejercicio`, `series`, `repeticiones`, `num_dia`) VALUES
(1, 6, 1, 4, 5, '1'),
(2, 6, 2, 4, 6, '2'),
(3, 6, 3, 3, 5, '1'),
(4, 6, 4, 6, 5, '2'),
(5, 6, 2, 3, 5, '1'),
(9, 6, 5, 5, 3, '2');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_rutina_usuario`
--

CREATE TABLE `tbl_rutina_usuario` (
  `id_rutina_usuario` int(11) NOT NULL,
  `fecha_inicio` text NOT NULL,
  `fecha_fin` text NOT NULL,
  `rutina_finalizada` varchar(2) NOT NULL DEFAULT 'no' COMMENT 'finalizada : si/no',
  `id_rutina` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_rutina_usuario`
--

INSERT INTO `tbl_rutina_usuario` (`id_rutina_usuario`, `fecha_inicio`, `fecha_fin`, `rutina_finalizada`, `id_rutina`, `id_usuario`) VALUES
(19, '2017-05-22', '2017-05-22', 'si', 6, 2),
(20, '2017-05-22', '2017-05-22', 'no', 6, 2);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_tipo_cuerpo`
--

CREATE TABLE `tbl_tipo_cuerpo` (
  `id_tipo_cuerpo` int(11) NOT NULL,
  `nombre_tipo_cuerpo` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_tipo_cuerpo`
--

INSERT INTO `tbl_tipo_cuerpo` (`id_tipo_cuerpo`, `nombre_tipo_cuerpo`) VALUES
(1, 'Mesomorfo'),
(2, 'Ectomorfo'),
(3, 'Endomorfo');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_tipo_ejercicio`
--

CREATE TABLE `tbl_tipo_ejercicio` (
  `id_tipo_ejercicio` int(11) NOT NULL,
  `nombre_tipo_ejercicio` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_tipo_ejercicio`
--

INSERT INTO `tbl_tipo_ejercicio` (`id_tipo_ejercicio`, `nombre_tipo_ejercicio`) VALUES
(1, 'Musculación'),
(2, 'Cardio-Vascular');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_tipo_especialista`
--

CREATE TABLE `tbl_tipo_especialista` (
  `id_tipo_especialista` int(11) NOT NULL,
  `nombre_tipo_especialista` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_usuario`
--

CREATE TABLE `tbl_usuario` (
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
  `id_tipo_cuerpo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_usuario`
--

INSERT INTO `tbl_usuario` (`id_usuario`, `nombre_usuario`, `pass_usuario`, `email_usuario`, `sexo_usuario`, `apellidos_usuario`, `fecha_registro`, `altura_usuario`, `fecha_nacimiento`, `estado_usuario`, `id_objetivo`, `id_tipo_cuerpo`) VALUES
(0, 'sergi', '3c9909afec25354d551dae21590bb26e38d53f2173b8d3dc3eee4c047e7ab1c1eb8b85103e3be7ba613b31bb5c9c36214dc9f14a42fd7a2fdb84856bca5c44c2', 'sergi@email.com', 'Hombre', 'sergi sergi', '2017-05-19', 170, '1996-02-06', 'Activo', 3, NULL),
(1, 'marc', '3c9909afec25354d551dae21590bb26e38d53f2173b8d3dc3eee4c047e7ab1c1eb8b85103e3be7ba613b31bb5c9c36214dc9f14a42fd7a2fdb84856bca5c44c2', 'mpetit@gmail.com', 'Hombre', 'petit fernandez', '2017-05-09', 173, '1992-06-09', 'Activo', 5, NULL),
(2, 'admin', 'c7ad44cbad762a5da0a452f9e854fdc1e0e7a52a38015f23f3eab1d80b931dd472634dfac71cd34ebc35d16ab7fb8a90c81f975113d6c7538dc69dd8de9077ec', 'admin@gmail.com', 'Hombre', 'petit fernandez', '2017-05-11', 173, '1992-09-16', 'Activo', 3, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_comida_dieta`
--
ALTER TABLE `tbl_comida_dieta`
  ADD PRIMARY KEY (`id_comidieta`),
  ADD KEY `FK_com_diet` (`id_dieta`),
  ADD KEY `FK_com_plat` (`id_plato`);

--
-- Indexes for table `tbl_dieta`
--
ALTER TABLE `tbl_dieta`
  ADD PRIMARY KEY (`id_dieta`),
  ADD KEY `FK_diet_espec` (`id_especialista`),
  ADD KEY `FK_diet_objet` (`id_objetivo`);

--
-- Indexes for table `tbl_dieta_usuario`
--
ALTER TABLE `tbl_dieta_usuario`
  ADD PRIMARY KEY (`id_dieta_usuario`),
  ADD KEY `FK_diet_us` (`id_dieta`);

--
-- Indexes for table `tbl_ejercicio`
--
ALTER TABLE `tbl_ejercicio`
  ADD PRIMARY KEY (`id_ejercicio`),
  ADD KEY `FK_ejer-tip_ejerc` (`id_tipo_ejercicio`);

--
-- Indexes for table `tbl_especialista`
--
ALTER TABLE `tbl_especialista`
  ADD PRIMARY KEY (`id_especialista`),
  ADD KEY `FK_especialista_tipo` (`id_tipo_Especialista`);

--
-- Indexes for table `tbl_historial_medidas`
--
ALTER TABLE `tbl_historial_medidas`
  ADD PRIMARY KEY (`id_historial_medidas`),
  ADD KEY `FK_hmedidas_usu` (`id_usuario`),
  ADD KEY `FK_hmedidas_pcuerpo` (`id_parte_cuerpo`);

--
-- Indexes for table `tbl_historial_peso`
--
ALTER TABLE `tbl_historial_peso`
  ADD PRIMARY KEY (`id_historial_peso`),
  ADD KEY `FK_hpeso_usuario` (`id_usuario`);

--
-- Indexes for table `tbl_historial_rutinas`
--
ALTER TABLE `tbl_historial_rutinas`
  ADD PRIMARY KEY (`id_historial_rutinas`),
  ADD KEY `FK_hist_rutina` (`id_rutina`),
  ADD KEY `FK_h_rut_user` (`id_usuario`);

--
-- Indexes for table `tbl_objetivo`
--
ALTER TABLE `tbl_objetivo`
  ADD PRIMARY KEY (`id_objetivo`);

--
-- Indexes for table `tbl_parte_cuerpo`
--
ALTER TABLE `tbl_parte_cuerpo`
  ADD PRIMARY KEY (`id_parte_cuerpo`);

--
-- Indexes for table `tbl_parte_cuerpo_ejerc`
--
ALTER TABLE `tbl_parte_cuerpo_ejerc`
  ADD PRIMARY KEY (`id_parte_cuerpo_ejer`),
  ADD KEY `FK_pc_ejer_pcuerpo` (`id_parte_cuerpo`),
  ADD KEY `FK_pcejercicio_ej` (`id_ejercicio`);

--
-- Indexes for table `tbl_plato`
--
ALTER TABLE `tbl_plato`
  ADD PRIMARY KEY (`id_plato`);

--
-- Indexes for table `tbl_rutina`
--
ALTER TABLE `tbl_rutina`
  ADD PRIMARY KEY (`id_rutina`),
  ADD KEY `FK_rutina_objetivo` (`id_objetivo`),
  ADD KEY `FK_rutina_espe` (`id_especialista`);

--
-- Indexes for table `tbl_rutina_ejer`
--
ALTER TABLE `tbl_rutina_ejer`
  ADD PRIMARY KEY (`id_rutina_ejer`),
  ADD KEY `FK_rejercicio_ejercicio` (`id_rutina`),
  ADD KEY `FK_rejercicio_ej` (`id_ejercicio`);

--
-- Indexes for table `tbl_rutina_usuario`
--
ALTER TABLE `tbl_rutina_usuario`
  ADD PRIMARY KEY (`id_rutina_usuario`),
  ADD KEY `FK_rutusu_rutina` (`id_rutina`),
  ADD KEY `FK_rutusu_usu` (`id_usuario`);

--
-- Indexes for table `tbl_tipo_cuerpo`
--
ALTER TABLE `tbl_tipo_cuerpo`
  ADD PRIMARY KEY (`id_tipo_cuerpo`);

--
-- Indexes for table `tbl_tipo_ejercicio`
--
ALTER TABLE `tbl_tipo_ejercicio`
  ADD PRIMARY KEY (`id_tipo_ejercicio`);

--
-- Indexes for table `tbl_tipo_especialista`
--
ALTER TABLE `tbl_tipo_especialista`
  ADD PRIMARY KEY (`id_tipo_especialista`);

--
-- Indexes for table `tbl_usuario`
--
ALTER TABLE `tbl_usuario`
  ADD PRIMARY KEY (`id_usuario`),
  ADD KEY `FK_usu_obj` (`id_objetivo`),
  ADD KEY `FK_usu_tcuerp` (`id_tipo_cuerpo`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_comida_dieta`
--
ALTER TABLE `tbl_comida_dieta`
  MODIFY `id_comidieta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `tbl_dieta`
--
ALTER TABLE `tbl_dieta`
  MODIFY `id_dieta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `tbl_dieta_usuario`
--
ALTER TABLE `tbl_dieta_usuario`
  MODIFY `id_dieta_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `tbl_ejercicio`
--
ALTER TABLE `tbl_ejercicio`
  MODIFY `id_ejercicio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `tbl_especialista`
--
ALTER TABLE `tbl_especialista`
  MODIFY `id_especialista` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_historial_medidas`
--
ALTER TABLE `tbl_historial_medidas`
  MODIFY `id_historial_medidas` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_historial_peso`
--
ALTER TABLE `tbl_historial_peso`
  MODIFY `id_historial_peso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `tbl_historial_rutinas`
--
ALTER TABLE `tbl_historial_rutinas`
  MODIFY `id_historial_rutinas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `tbl_objetivo`
--
ALTER TABLE `tbl_objetivo`
  MODIFY `id_objetivo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `tbl_parte_cuerpo`
--
ALTER TABLE `tbl_parte_cuerpo`
  MODIFY `id_parte_cuerpo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `tbl_parte_cuerpo_ejerc`
--
ALTER TABLE `tbl_parte_cuerpo_ejerc`
  MODIFY `id_parte_cuerpo_ejer` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `tbl_plato`
--
ALTER TABLE `tbl_plato`
  MODIFY `id_plato` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `tbl_rutina_ejer`
--
ALTER TABLE `tbl_rutina_ejer`
  MODIFY `id_rutina_ejer` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `tbl_rutina_usuario`
--
ALTER TABLE `tbl_rutina_usuario`
  MODIFY `id_rutina_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `tbl_tipo_cuerpo`
--
ALTER TABLE `tbl_tipo_cuerpo`
  MODIFY `id_tipo_cuerpo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `tbl_tipo_ejercicio`
--
ALTER TABLE `tbl_tipo_ejercicio`
  MODIFY `id_tipo_ejercicio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `tbl_tipo_especialista`
--
ALTER TABLE `tbl_tipo_especialista`
  MODIFY `id_tipo_especialista` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_usuario`
--
ALTER TABLE `tbl_usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
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
  ADD CONSTRAINT `FK_diet_espec` FOREIGN KEY (`id_especialista`) REFERENCES `tbl_especialista` (`id_especialista`),
  ADD CONSTRAINT `FK_diet_objet` FOREIGN KEY (`id_objetivo`) REFERENCES `tbl_objetivo` (`id_objetivo`);

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
-- Constraints for table `tbl_historial_rutinas`
--
ALTER TABLE `tbl_historial_rutinas`
  ADD CONSTRAINT `FK_h_rut_user` FOREIGN KEY (`id_usuario`) REFERENCES `tbl_usuario` (`id_usuario`),
  ADD CONSTRAINT `FK_hist_rutina` FOREIGN KEY (`id_rutina`) REFERENCES `tbl_rutina` (`id_rutina`);

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