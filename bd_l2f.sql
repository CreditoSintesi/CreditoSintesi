-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: May 24, 2017 at 08:09 PM
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
CREATE TABLE `tbl_comida_dieta` (
  `id_comidieta` int(11) NOT NULL,
  `id_dieta` int(11) NOT NULL,
  `momento_comida_comidieta` varchar(30) NOT NULL,
  `id_plato` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `tbl_comida_dieta`:
--   `id_dieta`
--       `tbl_dieta` -> `id_dieta`
--   `id_plato`
--       `tbl_plato` -> `id_plato`
--

--
-- Dumping data for table `tbl_comida_dieta`
--

INSERT INTO `tbl_comida_dieta` (`id_comidieta`, `id_dieta`, `momento_comida_comidieta`, `id_plato`) VALUES(1, 1, 'desayuno', 1);
INSERT INTO `tbl_comida_dieta` (`id_comidieta`, `id_dieta`, `momento_comida_comidieta`, `id_plato`) VALUES(2, 1, 'mediamañana', 2);
INSERT INTO `tbl_comida_dieta` (`id_comidieta`, `id_dieta`, `momento_comida_comidieta`, `id_plato`) VALUES(3, 1, 'comida mediodia', 3);
INSERT INTO `tbl_comida_dieta` (`id_comidieta`, `id_dieta`, `momento_comida_comidieta`, `id_plato`) VALUES(4, 1, 'post entreno', 4);
INSERT INTO `tbl_comida_dieta` (`id_comidieta`, `id_dieta`, `momento_comida_comidieta`, `id_plato`) VALUES(5, 1, 'cena', 5);
INSERT INTO `tbl_comida_dieta` (`id_comidieta`, `id_dieta`, `momento_comida_comidieta`, `id_plato`) VALUES(6, 1, 'antes de dormir', 6);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_dieta`
--

DROP TABLE IF EXISTS `tbl_dieta`;
CREATE TABLE `tbl_dieta` (
  `id_dieta` int(11) NOT NULL,
  `nombre_dieta` varchar(25) NOT NULL,
  `id_especialista` int(11) DEFAULT NULL,
  `v_energetico_dieta` varchar(6) NOT NULL,
  `id_objetivo` int(11) NOT NULL,
  `duracion_dieta` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `tbl_dieta`:
--   `id_objetivo`
--       `tbl_objetivo` -> `id_objetivo`
--   `id_especialista`
--       `tbl_especialista` -> `id_especialista`
--   `id_objetivo`
--       `tbl_objetivo` -> `id_objetivo`
--

--
-- Dumping data for table `tbl_dieta`
--

INSERT INTO `tbl_dieta` (`id_dieta`, `nombre_dieta`, `id_especialista`, `v_energetico_dieta`, `id_objetivo`, `duracion_dieta`) VALUES(1, 'Dieta ganar músculo', NULL, '3136 ', 5, 3);
INSERT INTO `tbl_dieta` (`id_dieta`, `nombre_dieta`, `id_especialista`, `v_energetico_dieta`, `id_objetivo`, `duracion_dieta`) VALUES(2, 'Dieta mantenimiento', NULL, '3400', 3, 4);
INSERT INTO `tbl_dieta` (`id_dieta`, `nombre_dieta`, `id_especialista`, `v_energetico_dieta`, `id_objetivo`, `duracion_dieta`) VALUES(3, 'Dieta perder 10kg', NULL, '2000', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_dieta_usuario`
--

DROP TABLE IF EXISTS `tbl_dieta_usuario`;
CREATE TABLE `tbl_dieta_usuario` (
  `id_dieta_usuario` int(11) NOT NULL,
  `id_dieta` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `fecha_fin_dieta` date NOT NULL,
  `fecha_inicio_dieta` date NOT NULL,
  `dieta_finalizada` varchar(2) NOT NULL DEFAULT 'no' COMMENT 'si/no'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `tbl_dieta_usuario`:
--   `id_dieta`
--       `tbl_dieta` -> `id_dieta`
--

--
-- Dumping data for table `tbl_dieta_usuario`
--

INSERT INTO `tbl_dieta_usuario` (`id_dieta_usuario`, `id_dieta`, `id_usuario`, `fecha_fin_dieta`, `fecha_inicio_dieta`, `dieta_finalizada`) VALUES(1, 1, 1, '2017-05-23', '2017-05-23', 'si');
INSERT INTO `tbl_dieta_usuario` (`id_dieta_usuario`, `id_dieta`, `id_usuario`, `fecha_fin_dieta`, `fecha_inicio_dieta`, `dieta_finalizada`) VALUES(2, 1, 1, '2017-05-23', '2017-05-23', 'si');
INSERT INTO `tbl_dieta_usuario` (`id_dieta_usuario`, `id_dieta`, `id_usuario`, `fecha_fin_dieta`, `fecha_inicio_dieta`, `dieta_finalizada`) VALUES(3, 1, 1, '1970-01-01', '2017-05-23', 'no');
INSERT INTO `tbl_dieta_usuario` (`id_dieta_usuario`, `id_dieta`, `id_usuario`, `fecha_fin_dieta`, `fecha_inicio_dieta`, `dieta_finalizada`) VALUES(4, 2, 2, '2017-05-24', '2017-05-24', 'si');
INSERT INTO `tbl_dieta_usuario` (`id_dieta_usuario`, `id_dieta`, `id_usuario`, `fecha_fin_dieta`, `fecha_inicio_dieta`, `dieta_finalizada`) VALUES(6, 2, 2, '1970-01-01', '2017-05-24', 'no');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_ejercicio`
--

DROP TABLE IF EXISTS `tbl_ejercicio`;
CREATE TABLE `tbl_ejercicio` (
  `id_ejercicio` int(11) NOT NULL,
  `nombre_ejercicio` varchar(50) NOT NULL,
  `id_tipo_ejercicio` int(11) NOT NULL,
  `img_ejercicio` varchar(50) NOT NULL,
  `descripcion_ejercicio` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `tbl_ejercicio`:
--   `id_tipo_ejercicio`
--       `tbl_tipo_ejercicio` -> `id_tipo_ejercicio`
--

--
-- Dumping data for table `tbl_ejercicio`
--

INSERT INTO `tbl_ejercicio` (`id_ejercicio`, `nombre_ejercicio`, `id_tipo_ejercicio`, `img_ejercicio`, `descripcion_ejercicio`) VALUES(1, 'Prensa de Pecho en Banco', 1, 'Media\\rutinas\\1.gif', 'Recuéstate de espalda sobre un banco y sujeta 2 mancuernas al nivel del pecho, a los lados del cuerpo, con las palmas apuntando hacia tus pies. Eleva las mancuernas en forma recta hacia arriba hasta que tus codos se encuentren cerca de trabarse y bájalas lentamente luego de una breve pausa. Exhala al levantar las mancuernas e inhala al bajarlas.');
INSERT INTO `tbl_ejercicio` (`id_ejercicio`, `nombre_ejercicio`, `id_tipo_ejercicio`, `img_ejercicio`, `descripcion_ejercicio`) VALUES(2, 'Prensa de Pecho en Banco (Empuñadura Neutral)', 1, 'Media\\rutinas\\2.gif', 'Recuéstate de espalda sobre un banco y sujeta 2 mancuernas al nivel del pecho, a los lados del cuerpo, con las palmas apuntando una hacia otra. Eleva las mancuernas en forma recta hacia arriba hasta que tus codos se encuentren cerca de trabarse y bájalas lentamente luego de una breve pausa. Exhala al levantar las mancuernas e inhala al bajarlas.');
INSERT INTO `tbl_ejercicio` (`id_ejercicio`, `nombre_ejercicio`, `id_tipo_ejercicio`, `img_ejercicio`, `descripcion_ejercicio`) VALUES(3, 'Prensa de Pecho en Banco - Inclinada', 1, 'Media\\rutinas\\3.gif', 'Recuéstate de espalda sobre un banco inclinado y sujeta 2 mancuernas al nivel del pecho, a los lados del cuerpo, con las palmas apuntando hacia adelante. Eleva las mancuernas en forma recta hacia arriba hasta que tus codos se encuentren cerca de trabarse y bájalas lentamente luego de una breve pausa. Exhala al levantar las mancuernas e inhala al bajarlas.');
INSERT INTO `tbl_ejercicio` (`id_ejercicio`, `nombre_ejercicio`, `id_tipo_ejercicio`, `img_ejercicio`, `descripcion_ejercicio`) VALUES(4, 'Prensa de Pecho en Banco - Inclinada (Empuñadura N', 1, 'Media\\rutinas\\4.gif', 'Recuéstate de espalda sobre un banco inclinado y sujeta 2 mancuernas al nivel del pecho, a los lados del cuerpo, con las palmas apuntando una hacia otra. Eleva las mancuernas en forma recta hacia arriba hasta que tus codos se encuentren cerca de trabarse y bájalas lentamente luego de una breve pausa. Exhala al levantar las mancuernas e inhala al bajarlas.');
INSERT INTO `tbl_ejercicio` (`id_ejercicio`, `nombre_ejercicio`, `id_tipo_ejercicio`, `img_ejercicio`, `descripcion_ejercicio`) VALUES(5, 'Prensa de Pecho en Banco - Declinada', 1, 'Media\\rutinas\\5.gif', 'Recuéstate de espalda sobre un banco declinado y sujeta 2 mancuernas al nivel del pecho, con las palmas apuntando hacia adelante. Eleva las mancuernas en forma recta hacia arriba hasta que tus codos se encuentren cerca de trabarse y bájalas lentamente luego de una breve pausa. Exhala al levantar las mancuernas e inhala al bajarlas.');
INSERT INTO `tbl_ejercicio` (`id_ejercicio`, `nombre_ejercicio`, `id_tipo_ejercicio`, `img_ejercicio`, `descripcion_ejercicio`) VALUES(6, 'Apertura - Recostado', 1, 'Media\\rutinas\\6.gif', 'Recuéstate de espalda sobre el banco y coge una mancuerna con cada mano a la altura del cuerpo, con tus codos ligeramente arqueados. Eleva las mancuernas hasta que estén lado a lado por encima de tu cuerpo y luego de una breve pausa bájalas lentamente. Intenta mantener el mismo ángulo en tus codos durante todo el movimiento.');
INSERT INTO `tbl_ejercicio` (`id_ejercicio`, `nombre_ejercicio`, `id_tipo_ejercicio`, `img_ejercicio`, `descripcion_ejercicio`) VALUES(7, 'Apertura - Inclinada', 1, 'Media\\rutinas\\7.gif', 'Recuéstate de espalda sobre un banco inclinado y coge una mancuerna con cada mano a la altura del cuerpo, con tus codos ligeramente arqueados. Eleva las mancuernas hasta que estén lado a lado por encima de tu cuerpo y luego de una breve pausa bájalas lentamente. Intenta mantener el mismo ángulo en tus codos durante todo el movimiento.');
INSERT INTO `tbl_ejercicio` (`id_ejercicio`, `nombre_ejercicio`, `id_tipo_ejercicio`, `img_ejercicio`, `descripcion_ejercicio`) VALUES(8, 'Pullover – Brazos Rectos', 1, 'Media\\rutinas\\8.gif', 'Recuéstate de espalda sobre uno de los extremos del banco y sujeta una mancuerna con ambas manos por sobre el área de tu pecho, con los brazos extendidos. Eleva la mancuerna hacia arriba en forma recta, hasta que tus brazos estén perpendiculares al suelo y bájala nuevamente luego de una breve pausa. Mantén tus brazos extendidos a lo largo de todo el movimiento, conservando el ángulo de tus codos.');
INSERT INTO `tbl_ejercicio` (`id_ejercicio`, `nombre_ejercicio`, `id_tipo_ejercicio`, `img_ejercicio`, `descripcion_ejercicio`) VALUES(9, 'Pullover – Brazos Flexionados', 1, 'Media\\rutinas\\9.gif', 'Recuéstate de espalda sobre uno de los extremos del banco y sujeta 2 mancuernas por debajo del nivel de tu cabeza, con los codos formando un ángulo de 90 grados. Eleva ambas mancuernas hasta que estén próximas a tu pecho, mientras mantienes un ángulo de 90 grados en tus codos, y luego de una breve pausa bájalas nuevamente. Exhala al levantar las mancuernas e inhala al bajarlas.');
INSERT INTO `tbl_ejercicio` (`id_ejercicio`, `nombre_ejercicio`, `id_tipo_ejercicio`, `img_ejercicio`, `descripcion_ejercicio`) VALUES(10, 'Encogimientos - Con Carga', 1, 'Media\\rutinas\\10.gif', 'Recuéstate de espalda sobre un banco y sujeta una mancuerna por encima de tu pecho. Eleva la parte superior de tu cuerpo hasta que tus omóplatos dejen de tocar el banco y luego de una breve pausa vuelve a bajarlo. Para evitar tirar de tu cuello con tus manos, mira recto hacia adelante en lugar de mirar a tus rodillas.');
INSERT INTO `tbl_ejercicio` (`id_ejercicio`, `nombre_ejercicio`, `id_tipo_ejercicio`, `img_ejercicio`, `descripcion_ejercicio`) VALUES(11, 'Elevaciones de Piernas - Con Carga', 1, 'Media\\rutinas\\11.gif', 'Recuéstate de espalda sobre el banco, con tus manos agarrando los costados del mismo y sujeta una mancuerna entre tus pies. Eleva tus piernas hacia arriba hasta que estén perpendiculares al suelo, y luego de una breve pausa bájalas. Intenta mantener tus piernas extendidas conservando tus rodillas con el mismo ángulo.');
INSERT INTO `tbl_ejercicio` (`id_ejercicio`, `nombre_ejercicio`, `id_tipo_ejercicio`, `img_ejercicio`, `descripcion_ejercicio`) VALUES(12, 'Encogimientos - Con Carga', 1, 'Media\\rutinas\\12.gif', 'Sujeta una mancuerna con una mano, al costado de tu cuerpo.Inclina la parte superior de tu cuerpo hacia el costado en el que sostienes la mancuerna, y luego de una breve pausa, vuelve a la posición inicial. Completa tu serie y cambia de lado. Ten cuidado de no inclinar demasiado profundamente tu cuerpo hacia los costados, desde donde puede resultar dificultoso volver a enderezarte.');
INSERT INTO `tbl_ejercicio` (`id_ejercicio`, `nombre_ejercicio`, `id_tipo_ejercicio`, `img_ejercicio`, `descripcion_ejercicio`) VALUES(13, 'Prensa de Hombros, Palmas Hacia Adentro', 1, 'Media\\rutinas\\13.gif', 'Ponte de pie y sujeta dos mancuernas al nivel de los hombros, con las palmas apuntando una hacia la otra. Empuja las mancuernas en forma recta hacia arriba, hasta que tus codos estén cerca de trabarse y bájalas luego de una breve pausa. Ten cuidado de NO mover tu espalda en el intento de ayudar a levantar las mancuernas.');
INSERT INTO `tbl_ejercicio` (`id_ejercicio`, `nombre_ejercicio`, `id_tipo_ejercicio`, `img_ejercicio`, `descripcion_ejercicio`) VALUES(14, 'Prensa de Hombros, Palmas Hacia Adentro – Con Resp', 1, 'Media\\rutinas\\14.gif', 'Siéntate sobre un banco (o silla) y sujeta dos mancuernas al nivel de los hombros, con las palmas apuntando una hacia la otra. Empuja las mancuernas en forma recta hacia arriba, hasta que tus codos estén cerca de trabarse y bájalas luego de una breve pausa. Ten cuidado de NO mover tu espalda en el intento de ayudar a levantar las mancuernas.');
INSERT INTO `tbl_ejercicio` (`id_ejercicio`, `nombre_ejercicio`, `id_tipo_ejercicio`, `img_ejercicio`, `descripcion_ejercicio`) VALUES(15, 'Prensa de Hombros, Palmas Hacia Adentro, Alternada', 1, 'Media\\rutinas\\15.gif', 'Ponte de pie y sujeta dos mancuernas, una al nivel de tus hombros y la otra más alto con tu brazo extendido, con las palmas apuntando una hacia la otra. Empuja una mancuerna en forma recta hacia arriba, hasta que tu codo esté cerca de trabarse y bájala luego de una breve pausa. Alterna las manos. Ten cuidado de NO mover tu espalda en el intento de ayudar a levantar las mancuernas.');
INSERT INTO `tbl_ejercicio` (`id_ejercicio`, `nombre_ejercicio`, `id_tipo_ejercicio`, `img_ejercicio`, `descripcion_ejercicio`) VALUES(16, 'Prensa de Hombros, Palmas Hacia Adentro, Alternada', 1, 'Media\\rutinas\\16.gif', 'Siéntate sobre un banco y sujeta dos mancuernas, una al nivel de tus hombros y la otra más alto con tu brazo extendido, con las palmas apuntando una hacia la otra. Empuja una mancuerna en forma recta hacia arriba, hasta que tu codo esté cerca de trabarse y bájala luego de una breve pausa. Alterna las manos. Ten cuidado de NO mover tu espalda en el intento de ayudar a levantar las mancuernas.');
INSERT INTO `tbl_ejercicio` (`id_ejercicio`, `nombre_ejercicio`, `id_tipo_ejercicio`, `img_ejercicio`, `descripcion_ejercicio`) VALUES(17, 'Prensa de Hombros', 1, 'Media\\rutinas\\17.gif', 'Ponte de pie y sujeta dos mancuernas cerca de tus hombros, con las palmas apuntando hacia adelante. Empuja las mancuernas en forma recta hacia arriba, hasta que tus codos estén cerca de trabarse y bájalas luego de una breve pausa. Ten cuidado de NO mover tu espalda en el intento de ayudar a levantar las mancuernas.');
INSERT INTO `tbl_ejercicio` (`id_ejercicio`, `nombre_ejercicio`, `id_tipo_ejercicio`, `img_ejercicio`, `descripcion_ejercicio`) VALUES(18, 'Prensa de Hombros Sentado', 1, 'Media\\rutinas\\18.gif', 'Siéntate sobre un banco y sujeta dos mancuernas a la altura de tus hombros, con las palmas apuntando hacia adelante. Empuja las mancuernas en forma recta hacia arriba, hasta que tus codos estén cerca de trabarse y bájalas luego de una breve pausa. Ten cuidado de NO mover tu espalda en el intento de ayudar a levantar las mancuernas.');
INSERT INTO `tbl_ejercicio` (`id_ejercicio`, `nombre_ejercicio`, `id_tipo_ejercicio`, `img_ejercicio`, `descripcion_ejercicio`) VALUES(19, 'Prensa de Hombros con Respaldo', 1, 'Media\\rutinas\\19.gif', 'Siéntate sobre un banco con respaldo y sujeta dos mancuernas a la altura de tus hombros, con las palmas apuntando una hacia otra. Empuja las mancuernas en forma recta hacia arriba, hasta que tus codos estén cerca de trabarse y bájalas luego de una breve pausa. Ten cuidado de NO mover tu espalda en el intento de ayudar a levantar las mancuernas.');
INSERT INTO `tbl_ejercicio` (`id_ejercicio`, `nombre_ejercicio`, `id_tipo_ejercicio`, `img_ejercicio`, `descripcion_ejercicio`) VALUES(20, 'Vuelos Laterales', 1, 'Media\\rutinas\\20.gif', 'Ponte de pie y sujeta una mancuerna con cada mano frente a tus caderas, con las palmas apuntando una hacia otra. Eleva las mancuernas hacia los costados, hasta que tus brazos estén cerca de quedar paralelos al suelo y bájalas luego de una breve pausa. Intenta mantener los ángulos en tus codos durante todo el movimiento.');
INSERT INTO `tbl_ejercicio` (`id_ejercicio`, `nombre_ejercicio`, `id_tipo_ejercicio`, `img_ejercicio`, `descripcion_ejercicio`) VALUES(21, 'Vuelos para Deltoides Inclinados, A Un Brazo', 1, 'Media\\rutinas\\21.gif', 'Inclínate hacia abajo y sujeta una mancuerna con una mano entre tus piernas, y las rodillas ligeramente dobladas. Eleva la mancuerna hacia el costado hasta que tu brazo esté paralelo al piso y bájala lentamente luego de una breve pausa. Mantén tu espalda recta a lo largo del movimiento.');
INSERT INTO `tbl_ejercicio` (`id_ejercicio`, `nombre_ejercicio`, `id_tipo_ejercicio`, `img_ejercicio`, `descripcion_ejercicio`) VALUES(22, 'Vuelos Laterales, Sentado', 1, 'Media\\rutinas\\22.gif', 'Siéntate sobre uno de los extremos del banco y sujeta una mancuerna con cada mano, hacia abajo y a los costados de tu cuerpo. Eleva las mancuernas hacia los costados, hasta que tus brazos estén cerca de quedar paralelos al suelo y bájalas lentamente luego de una breve pausa. Mantén tu espalda recta a lo largo del movimiento. ');
INSERT INTO `tbl_ejercicio` (`id_ejercicio`, `nombre_ejercicio`, `id_tipo_ejercicio`, `img_ejercicio`, `descripcion_ejercicio`) VALUES(23, 'Vuelos para Deltoides Posteriores - Inclinado', 1, 'Media\\rutinas\\23.gif', 'Siéntate sobre uno de los extremos del banco y baja tu cuerpo para coger una mancuerna en cada mano, justo sobre el suelo. Eleva ambas mancuernas hacia tus costados hasta que tus brazos estén casi paralelos al suelo y bájalas lentamente luego de una breve pausa. Mantén el mismo arco pequeño en tus codos durante todo el movimiento.');
INSERT INTO `tbl_ejercicio` (`id_ejercicio`, `nombre_ejercicio`, `id_tipo_ejercicio`, `img_ejercicio`, `descripcion_ejercicio`) VALUES(24, 'Vuelos para Deltoides Posteriores', 1, 'Media\\rutinas\\24.gif', 'Recuéstate sobre un banco elevado (boca abajo) y sujeta una mancuerna en cada mano por debajo de tu pecho, con los brazos ligeramente doblados. Eleva ambas mancuernas hacia los costados hasta que tus brazos estén casi paralelos al suelo y bájalas lentamente luego de una breve pausa. Mantén el mismo arco pequeño en tus codos durante todo el movimiento.');
INSERT INTO `tbl_ejercicio` (`id_ejercicio`, `nombre_ejercicio`, `id_tipo_ejercicio`, `img_ejercicio`, `descripcion_ejercicio`) VALUES(25, 'Círculos para Deltoides Posteriores', 1, 'Media\\rutinas\\25.gif', 'Recuéstate sobre tu pecho sobre un banco y sujeta una mancuerna en cada mano a cada lado de tus caderas, con los brazos ligeramente arqueados. Lleva ambas mancuernas hacia adelante hasta que las veas a ambas al mismo tiempo y lentamente llévalas hacia atrás luego de una breve pausa. Mantén el mismo arco pequeño en tus codos y conserva ambas mancuernas a la misma altura desde el piso, durante todo el movimiento. ');
INSERT INTO `tbl_ejercicio` (`id_ejercicio`, `nombre_ejercicio`, `id_tipo_ejercicio`, `img_ejercicio`, `descripcion_ejercicio`) VALUES(26, 'Vuelos para Deltoides Frontales, Brazo Recto', 1, 'Media\\rutinas\\26.gif', 'Ponte de pie y sujeta una mancuerna en cada mano enfrente de tus muslos. Eleva las mancuernas hacia el nivel de tus hombros y continúa elevándolas hasta tener tus brazos estirados y bájalas lentamente luego de una breve pausa. Mantén tus brazos extendidos durante todo el movimiento.');
INSERT INTO `tbl_ejercicio` (`id_ejercicio`, `nombre_ejercicio`, `id_tipo_ejercicio`, `img_ejercicio`, `descripcion_ejercicio`) VALUES(27, 'Remo Vertical', 1, 'Media\\rutinas\\27.gif', 'Ponte de pie y sujeta una mancuerna en cada mano enfrente de tus muslos. Levanta ambas mancuernas hasta que tus brazos estén casi paralelos al suelo y bájalas lentamente luego de una breve pausa. Ten cuidado de NO mover tu espalda en el intento de ayudar a levantar las mancuernas.');
INSERT INTO `tbl_ejercicio` (`id_ejercicio`, `nombre_ejercicio`, `id_tipo_ejercicio`, `img_ejercicio`, `descripcion_ejercicio`) VALUES(28, 'Vuelos Frontales', 1, 'Media\\rutinas\\28.gif', 'Ponte de pie y sujeta una mancuerna con cada mano frente a tus muslos, con las palmas apuntando hacia tu cuerpo. Eleva las mancuernas hacia adelante hasta que tus brazos estén casi paralelos al suelo, y bájalas luego de una breve pausa. Mantén tus brazos extendidos durante todo el movimiento.');
INSERT INTO `tbl_ejercicio` (`id_ejercicio`, `nombre_ejercicio`, `id_tipo_ejercicio`, `img_ejercicio`, `descripcion_ejercicio`) VALUES(29, 'Encogimiento de Hombros', 1, 'Media\\rutinas\\29.gif', 'Ponte de pie y sujeta una mancuerna con cada mano frente a tus muslos, con las palmas apuntando hacia tu cuerpo. Eleva las mancuernas en forma recta hacia arriba encogiendo tus hombros y bájalas luego de una breve pausa. Mantén tus brazos extendidos durante todo el movimiento.');
INSERT INTO `tbl_ejercicio` (`id_ejercicio`, `nombre_ejercicio`, `id_tipo_ejercicio`, `img_ejercicio`, `descripcion_ejercicio`) VALUES(30, 'Prensa Superior', 1, 'Media\\rutinas\\30.gif', 'Ponte de pie y sujeta dos mancuernas justo por encima de tus hombros, con las palmas apuntando una hacia otra, y las rodillas arqueadas. Empuja las mancuernas en forma recta hacia arriba hasta que tus brazos estén cerca de trabarse y bájalas lentamente luego de una breve pausa. Exhala al empujar hacia arriba e inhala al bajar las mancuernas.');
INSERT INTO `tbl_ejercicio` (`id_ejercicio`, `nombre_ejercicio`, `id_tipo_ejercicio`, `img_ejercicio`, `descripcion_ejercicio`) VALUES(31, 'Remo para Deltoides Posteriores, Agachado', 1, 'Media\\rutinas\\31.gif', 'Agáchate flexionando tus caderas y rodillas y coge una mancuerna con cada mano, cerca de tus rodillas, con las palmas apuntando hacia atrás. Eleva las mancuernas hacia arriba en forma recta hasta que tus codos formen un ángulo de 90 grados y bájalas luego de una breve pausa. Intenta concentrarte en sólo mover tus brazos durante el ejercicio.');
INSERT INTO `tbl_ejercicio` (`id_ejercicio`, `nombre_ejercicio`, `id_tipo_ejercicio`, `img_ejercicio`, `descripcion_ejercicio`) VALUES(32, 'Flexiones de Bíceps, Una a la Vez', 1, 'Media\\rutinas\\32.gif', 'Sujeta una mancuerna en cada mano, con las palmas apuntando hacia adelante. Con un brazo a la vez, eleva una mancuerna mediante la flexión de tu codo y bájala luego de una breve pausa. Alterna las manos luego de que el movimiento complete esté finalizado.');
INSERT INTO `tbl_ejercicio` (`id_ejercicio`, `nombre_ejercicio`, `id_tipo_ejercicio`, `img_ejercicio`, `descripcion_ejercicio`) VALUES(33, 'Flexiones de Bíceps Alternadas', 1, 'Media\\rutinas\\33.gif', 'Ponte de pie y sujeta una mancuerna con cada mano, a los costados de tu cuerpo, con las palmas apuntando una hacia otra. Eleva una mancuerna hasta que alcance la altura de tu hombro, y mientras la bajas lentamente, luego de una breve pausa, comienza a elevar la otra. Trata de NO mover tu tronco en el intento de ayudar a levantar las cargas.');
INSERT INTO `tbl_ejercicio` (`id_ejercicio`, `nombre_ejercicio`, `id_tipo_ejercicio`, `img_ejercicio`, `descripcion_ejercicio`) VALUES(34, 'Flexiones de Bíceps Interior', 1, 'Media\\rutinas\\34.gif', 'Ponte de pie y sujeta una mancuerna con cada mano, a los costados de tu cuerpo, con las palmas apuntando una hacia otra. Eleva ambas mancuernas hasta que alcancen la altura de tus hombros y bájalas lentamente luego de una breve pausa. Trata de NO mover tu tronco en el intento de ayudar a levantar las cargas.');
INSERT INTO `tbl_ejercicio` (`id_ejercicio`, `nombre_ejercicio`, `id_tipo_ejercicio`, `img_ejercicio`, `descripcion_ejercicio`) VALUES(35, 'Flexiones de Bíceps', 1, 'Media\\rutinas\\35.gif', 'Ponte de pie y sujeta una mancuerna con cada mano, a los costados de tu cuerpo, con las palmas apuntando una hacia otra. Eleva ambas mancuernas hasta que alcancen la altura de tus hombros y bájalas lentamente hacia atrás luego de una breve pausa. Trata de NO mover tu tronco en el intento de ayudar a levantar las cargas.');
INSERT INTO `tbl_ejercicio` (`id_ejercicio`, `nombre_ejercicio`, `id_tipo_ejercicio`, `img_ejercicio`, `descripcion_ejercicio`) VALUES(36, 'Flexiones Martillo', 1, 'Media\\rutinas\\36.gif', 'Coge una mancuerna con cada mano, hacia los costados de tu cuerpo, con las palmas apuntando hacia tu cuerpo. Eleva ambas mancuernas mediante la flexión de tus codos y bájalas luego de una breve pausa. Mantén quieta la parte superior de tus brazos durante todo el movimiento.');
INSERT INTO `tbl_ejercicio` (`id_ejercicio`, `nombre_ejercicio`, `id_tipo_ejercicio`, `img_ejercicio`, `descripcion_ejercicio`) VALUES(37, 'Flexiones de Bíceps Sentado, Alternadas', 1, 'Media\\rutinas\\37.gif', 'Siéntate sobre un banco y sujeta una mancuerna con cada mano, hacia los costados de tu cuerpo, con las palmas de tu mano apuntando una hacia otra. Eleva una mancuerna hasta que alcance la altura de tu hombro, y mientras la bajas lentamente, luego de una breve pausa, comienza a elevar la otra. Trata de NO mover tu tronco en el intento de ayudar a levantar las cargas. ');
INSERT INTO `tbl_ejercicio` (`id_ejercicio`, `nombre_ejercicio`, `id_tipo_ejercicio`, `img_ejercicio`, `descripcion_ejercicio`) VALUES(38, 'Flexiones de Bíceps Sentado', 1, 'Media\\rutinas\\38.gif', 'Siéntate sobre un banco y sujeta una mancuerna con cada mano, hacia los costados de tu cuerpo, con las palmas de tu mano apuntando una hacia otra. Eleva ambas mancuernas hasta que alcancen la altura de tus hombros y luego de una breve pausa, bájalas lentamente. Trata de NO mover tu tronco en el intento de ayudar a levantar las cargas.');
INSERT INTO `tbl_ejercicio` (`id_ejercicio`, `nombre_ejercicio`, `id_tipo_ejercicio`, `img_ejercicio`, `descripcion_ejercicio`) VALUES(39, 'Flexiones de Bíceps Inclinado, Alternadas', 1, 'Media\\rutinas\\39.gif', 'Siéntate sobre un banco inclinado y sujeta una mancuerna con cada mano, hacia los costados de tu cuerpo, con las palmas de tu mano apuntando una hacia otra. Eleva una mancuerna hasta que alcance la altura de tu hombro, y mientras la bajas lentamente, luego de una breve pausa, comienza a elevar la otra. Trata de NO mover tu tronco en el intento de ayudar a levantar las cargas.');
INSERT INTO `tbl_ejercicio` (`id_ejercicio`, `nombre_ejercicio`, `id_tipo_ejercicio`, `img_ejercicio`, `descripcion_ejercicio`) VALUES(40, 'Flexiones de Bíceps Inclinado', 1, 'Media\\rutinas\\40.gif', 'Siéntate sobre un banco inclinado y sujeta una mancuerna con cada mano, con las palmas de tu mano apuntando una hacia otra. Eleva ambas mancuernas hasta que alcancen la altura de tus hombros y luego de una breve pausa, bájalas lentamente. Trata de NO mover tu tronco en el intento de ayudar a levantar las cargas.');
INSERT INTO `tbl_ejercicio` (`id_ejercicio`, `nombre_ejercicio`, `id_tipo_ejercicio`, `img_ejercicio`, `descripcion_ejercicio`) VALUES(41, 'Flexiones de Bíceps en Banco Inclinado', 1, 'Media\\rutinas\\41.gif', 'Siéntate sobre un banco inclinado y sujeta una mancuerna con cada mano, hacia los costados de tu cuerpo, con las palmas de tu mano apuntando una hacia otra. Eleva ambas mancuernas hasta que alcancen la altura de tus hombros y luego de una breve pausa, bájalas lentamente. Trata de NO mover tu tronco en el intento de ayudar a levantar las cargas.');
INSERT INTO `tbl_ejercicio` (`id_ejercicio`, `nombre_ejercicio`, `id_tipo_ejercicio`, `img_ejercicio`, `descripcion_ejercicio`) VALUES(42, 'Flexiones de Bíceps Concentradas', 1, 'Media\\rutinas\\42.gif', 'Párate detrás de un banco inclinado y apoya un brazo sobre el respaldo, mientras sujetas una mancuerna, con la palma apuntando hacia adelante. Eleva la mancuerna hacia tu hombro y bájala luego de una breve pausa. Durante el ejercicio, sólo debes mover la parte inferior de tu brazo.');
INSERT INTO `tbl_ejercicio` (`id_ejercicio`, `nombre_ejercicio`, `id_tipo_ejercicio`, `img_ejercicio`, `descripcion_ejercicio`) VALUES(43, 'Flexiones de Bíceps Interior, Sentado', 1, 'Media\\rutinas\\43.gif', 'Siéntate sobre un banco y sujeta una mancuerna con cada mano, hacia los costados de tu cuerpo, con las palmas de tu mano apuntando una hacia otra. Eleva ambas mancuernas hasta que alcancen la altura de tus hombros y luego de una breve pausa, bájalas lentamente. Trata de NO mover tu tronco en el intento de ayudar a levantar las cargas.');
INSERT INTO `tbl_ejercicio` (`id_ejercicio`, `nombre_ejercicio`, `id_tipo_ejercicio`, `img_ejercicio`, `descripcion_ejercicio`) VALUES(44, 'Flexiones Concentradas, Sentado', 1, 'Media\\rutinas\\44.gif', 'Siéntate sobre un banco, apoya un brazo en tu muslo y sujeta por lo bajo una mancuerna con esa mano, entre tus piernas, con la palma apuntando hacia la otra pierna. Eleva la mancuerna hasta que alcance tu hombro y lentamente bájala luego de una breve pausa. Luego de finalizar la serie, cambia de brazo. Trata de NO mover tu tronco en el intento de ayudar a levantar las cargas.');
INSERT INTO `tbl_ejercicio` (`id_ejercicio`, `nombre_ejercicio`, `id_tipo_ejercicio`, `img_ejercicio`, `descripcion_ejercicio`) VALUES(45, 'Flexiones Concentradas, Sentado', 1, 'Media\\rutinas\\45.gif', 'Siéntate sobre uno de los extremos del banco, sujeta una mancuerna con tu mano y apoya el codo (extendido) de dicha mano sobre el frente de tu muslo. Eleva una mancuerna hasta que alcance la altura de tus hombros y lentamente bájala luego de una breve pausa. Luego de finalizar la serie, cambia de brazo. Trata de NO mover tu tronco en el intento de ayudar a levantar las cargas.');
INSERT INTO `tbl_ejercicio` (`id_ejercicio`, `nombre_ejercicio`, `id_tipo_ejercicio`, `img_ejercicio`, `descripcion_ejercicio`) VALUES(46, 'Flexiones de Bíceps – Scott (Empuñadura Supinadora', 1, 'Media\\rutinas\\46.gif', 'Coloca la parte superior de uno de tus brazos sobre la almohadilla, la otra en un ángulo de 90 grados, y coge una mancuerna con cada mano, con las palmas apuntando hacia arriba. Eleva las mancuernas alternadamente, hasta que tus antebrazos estén paralelos al suelo, y luego de una breve pausa, bájalas alternadamente. Trata de NO mover tu tronco en el intento de ayudar a levantar las cargas.');
INSERT INTO `tbl_ejercicio` (`id_ejercicio`, `nombre_ejercicio`, `id_tipo_ejercicio`, `img_ejercicio`, `descripcion_ejercicio`) VALUES(47, 'Flexiones de Bíceps – Scott (Empuñadura Neutral)', 1, 'Media\\rutinas\\47.gif', 'Coloca la parte superior de uno de tus brazos sobre la almohadilla, la otra en un ángulo de 90 grados, y coge una mancuerna con cada mano, con las palmas apuntando una hacia otra. Eleva las mancuernas alternadamente, hasta que tus antebrazos estén paralelos al suelo, y luego de una breve pausa, bájalas alternadamente. Trata de NO mover tu tronco en el intento de ayudar a levantar las cargas.');
INSERT INTO `tbl_ejercicio` (`id_ejercicio`, `nombre_ejercicio`, `id_tipo_ejercicio`, `img_ejercicio`, `descripcion_ejercicio`) VALUES(48, 'Flexiones de Bíceps Alternadas en Banco', 1, 'Media\\rutinas\\48.gif', 'Recuéstate boca abajo sobre un banco elevado, y sujeta una mancuerna con cada mano, en línea recta por debajo de tus hombros. Eleva una mancuerna hasta que alcance la altura de tu hombro, y mientras la bajas lentamente, luego de una breve pausa, comienza a elevar la otra. Trata de NO mover tu tronco en el intento de ayudar a levantar las cargas.');
INSERT INTO `tbl_ejercicio` (`id_ejercicio`, `nombre_ejercicio`, `id_tipo_ejercicio`, `img_ejercicio`, `descripcion_ejercicio`) VALUES(49, 'Flexiones de Bíceps Supinadoras', 1, 'Media\\rutinas\\49.gif', 'Recuéstate de espalda sobre un banco y sujeta una mancuerna con cada mano hacia cada lado de tu cuerpo, por debajo de la altura del cuerpo, con las palmas apuntando hacia arriba. Eleva las mancuernas hasta que alcancen la altura de tu cuerpo y lentamente bájalas luego de una breve pausa. Exhala en el momento de levantar las cargas e inhala al bajarlas.');
INSERT INTO `tbl_ejercicio` (`id_ejercicio`, `nombre_ejercicio`, `id_tipo_ejercicio`, `img_ejercicio`, `descripcion_ejercicio`) VALUES(50, 'Extensiones de Tríceps, A Dos Brazos', 1, 'Media\\rutinas\\50.gif', 'Ponte de pie y sujeta una mancuerna con ambas manos, detrás de tu cabeza, con las partes superiores de los brazos apuntando hacia arriba en forma recta. Eleva la mancuerna hacia arriba mediante la flexión de tus codos y luego de una breve pausa bájala lentamente. Las partes superiores de tus brazos deben permanecer firmes durante todo el movimiento.');
INSERT INTO `tbl_ejercicio` (`id_ejercicio`, `nombre_ejercicio`, `id_tipo_ejercicio`, `img_ejercicio`, `descripcion_ejercicio`) VALUES(51, 'Extensiones de Tríceps, A Un Brazo', 1, 'Media\\rutinas\\51.gif', 'Ponte de pie y sujeta una mancuerna con una mano, detrás de tu cabeza, con el codo formando un ángulo de 90 grados, y la parte superior del brazo apuntando hacia arriba en forma recta. Eleva la mancuerna con una mano hasta que tu brazo esté casi totalmente extendido y luego de una breve pausa bájala lentamente. Luego de cada serie ve alternando el brazo. Mantén firmes las partes superiores de tus brazos durante todo el movimiento.');
INSERT INTO `tbl_ejercicio` (`id_ejercicio`, `nombre_ejercicio`, `id_tipo_ejercicio`, `img_ejercicio`, `descripcion_ejercicio`) VALUES(52, 'Extensiones de Tríceps Sentado', 1, 'Media\\rutinas\\52.gif', 'Siéntate y sujeta una mancuerna con ambas manos, detrás de tu cabeza, con los codos formando ángulos de 90 grados y las partes superiores de los brazos hacia arriba en forma recta. Eleva la mancuerna con ambas manos hasta que tus brazos estén casi totalmente extendidos y luego de una breve pausa bájala lentamente. Mantén firmes las partes superiores de tus brazos durante todo el movimiento.');
INSERT INTO `tbl_ejercicio` (`id_ejercicio`, `nombre_ejercicio`, `id_tipo_ejercicio`, `img_ejercicio`, `descripcion_ejercicio`) VALUES(53, 'Patada de Burro de Tríceps', 1, 'Media\\rutinas\\53.gif', 'Coloca tu rodilla y tu mano sobre un banco y coge una mancuerna con tu otra mano, con la palma apuntando hacia tu cuerpo, y la parte superior de tu brazo paralela a tu cuerpo. Empuja la mancuerna hacia atrás mediante la extensión de tu codo y permítele retornar lentamente luego de una breve pausa. Mantén firmes las partes superiores de tus brazos durante todo el movimiento.');
INSERT INTO `tbl_ejercicio` (`id_ejercicio`, `nombre_ejercicio`, `id_tipo_ejercicio`, `img_ejercicio`, `descripcion_ejercicio`) VALUES(54, 'Extensiones de Tríceps Inclinado, A Un Brazo', 1, 'Media\\rutinas\\54.gif', 'Siéntate, agáchate hacia adelante y sujeta una mancuerna con una mano, con tu codo formando un ángulo de 90 grados y la palma apuntando hacia tu cuerpo. Eleva la mancuerna con una mano hasta que tu brazo esté paralelo al suelo y luego de una breve pausa lentamente bájala. Luego de cada serie ve alternando el brazo. Mantén firmes las partes superiores de tus brazos durante todo el movimiento.');
INSERT INTO `tbl_ejercicio` (`id_ejercicio`, `nombre_ejercicio`, `id_tipo_ejercicio`, `img_ejercicio`, `descripcion_ejercicio`) VALUES(55, 'Extensiones de Tríceps Acostado', 1, 'Media\\rutinas\\55.gif', 'Recuéstate de espalda sobre un banco y sujeta una mancuerna en cada mano, con las palmas apuntando hacia arriba, y las partes superiores de tus brazos apuntando al techo. Eleva las mancuernas mediante la extensión de tus codos y luego de una breve pausa, permíteles retornar al punto de partida. Mantén firmes las partes superiores de tus brazos durante todo el movimiento.');
INSERT INTO `tbl_ejercicio` (`id_ejercicio`, `nombre_ejercicio`, `id_tipo_ejercicio`, `img_ejercicio`, `descripcion_ejercicio`) VALUES(56, 'Prensa en Banco para Tríceps', 1, 'Media\\rutinas\\56.gif', 'Recuéstate de espalda sobre un banco y sujeta las mancuernas a los costados de tu cuerpo, justo por encima de tu pecho, con las palmas apuntando una a otra. Empuja las mancuernas hacia arriba hasta que tus brazos estén casi totalmente extendidos y luego de una breve pausa bájalas. Exhala al empujar las mancuernas hacia arriba e inhala al bajarlas.');
INSERT INTO `tbl_ejercicio` (`id_ejercicio`, `nombre_ejercicio`, `id_tipo_ejercicio`, `img_ejercicio`, `descripcion_ejercicio`) VALUES(57, 'Remo con Mancuernas', 1, 'Media\\rutinas\\57.gif', 'Coge una mancuerna con cada mano y flexiona tus rodillas y caderas como para colocarte en una posición de sentadillas. Eleva ambas mancuernas en forma recta hacia arriba sin alterar los ángulos de tus rodillas y caderas, y bájalas nuevamente luego de una breve pausa. Exhala al levantar las mancuernas e inhala al retornar a la posición de inicio.');
INSERT INTO `tbl_ejercicio` (`id_ejercicio`, `nombre_ejercicio`, `id_tipo_ejercicio`, `img_ejercicio`, `descripcion_ejercicio`) VALUES(58, 'Remo Inclinado Hacia Adelante', 1, 'Media\\rutinas\\58.gif', 'Ponte de pie y estírate hacia abajo de modo de tomar dos mancuernas con ambas manos (las rodillas ligeramente flexionadas). Levanta las mancuernas hacia arriba hasta que la parte superior de tus brazos estén paralelas a tu cuerpo y bájalas luego de una breve pausa. Intenta mantener tu espalda recta durante todo el movimiento. Sólo los brazos deben moverse.');
INSERT INTO `tbl_ejercicio` (`id_ejercicio`, `nombre_ejercicio`, `id_tipo_ejercicio`, `img_ejercicio`, `descripcion_ejercicio`) VALUES(59, 'Remo Arrodillado – A Un Brazo', 1, 'Media\\rutinas\\59.gif', 'Coloca tu rodilla y mano sobre un banco y coge una mancuerna con tu otra mano. Eleva la mancuerna sin mover otra cosa que tu brazo y bájala luego de una breve pausa. Exhala al levantar la mancuerna e inhala al retornar a la posición inicial.');
INSERT INTO `tbl_ejercicio` (`id_ejercicio`, `nombre_ejercicio`, `id_tipo_ejercicio`, `img_ejercicio`, `descripcion_ejercicio`) VALUES(60, 'Remo – A Un Brazo', 1, 'Media\\rutinas\\60.gif', 'Colócate en posición inclinada hacia adelante enfrente de un banco, mientras sostienes una mancuerna con una mano (con el brazo extendido).Levanta la mancuerna hacia arriba, hasta que la parte superior de tu brazo esté paralela a tu cuerpo, y bájala luego de una breve pausa. Cuando la serie esté completa, ve alternando las manos. Intenta mantener tu espalda recta durante todo el movimiento. Sólo los brazos deben moverse.');
INSERT INTO `tbl_ejercicio` (`id_ejercicio`, `nombre_ejercicio`, `id_tipo_ejercicio`, `img_ejercicio`, `descripcion_ejercicio`) VALUES(61, 'Peso Muerto', 1, 'Media\\rutinas\\61.gif', 'Ponte de pie y sujeta una mancuerna con cada una de tus manos. Flexiona tus rodillas y caderas de manera de bajar las mancuernas hacia abajo en forma recta, y elévate a ti mismo luego de una breve pausa. Inhala al bajar y exhala al retornar a la posición inicial.');
INSERT INTO `tbl_ejercicio` (`id_ejercicio`, `nombre_ejercicio`, `id_tipo_ejercicio`, `img_ejercicio`, `descripcion_ejercicio`) VALUES(62, 'Flexiones al Pie Opuesto', 1, 'Media\\rutinas\\62.gif', 'Ponte de pie, estírate hacia abajo y coge una mancuerna justo por encima de uno de tus pies con tu mano opuesta (las rodillas ligeramente dobladas). Eleva la mancuerna hacia arriba hasta que estés parado y bájala luego de una breve pausa. A lo largo de todo el movimiento, mantén un ligero arqueo en tus rodillas.');
INSERT INTO `tbl_ejercicio` (`id_ejercicio`, `nombre_ejercicio`, `id_tipo_ejercicio`, `img_ejercicio`, `descripcion_ejercicio`) VALUES(63, 'Flexiones al Pie Opuesto, Cambiando', 1, 'Media\\rutinas\\63.gif', 'Ponte de pie, estírate hacia abajo y coge 2 mancuernas justo por encima de uno de tus pies con tus manos (las rodillas ligeramente dobladas). Eleva las mancuernas hacia arriba hasta que estés parado y luego bájalas, pero hacia el otro pie. Alterna los lados. A lo largo de todo el movimiento, mantén un ligero arqueo en tus rodillas.');
INSERT INTO `tbl_ejercicio` (`id_ejercicio`, `nombre_ejercicio`, `id_tipo_ejercicio`, `img_ejercicio`, `descripcion_ejercicio`) VALUES(64, 'Apertura de Espalda', 1, 'Media\\rutinas\\64.gif', 'Recuéstate sobre tu pecho en el banco y coge dos mancuernas con tus manos, con los codos formando ángulos de 90 grados. \r\nEleva las mancuernas hasta que tus brazos estén paralelos al suelo y bájalas nuevamente luego de una breve pausa. Exhala cuando jales de las mancuernas e inhala al bajarlas.');
INSERT INTO `tbl_ejercicio` (`id_ejercicio`, `nombre_ejercicio`, `id_tipo_ejercicio`, `img_ejercicio`, `descripcion_ejercicio`) VALUES(65, 'Sentadillas', 1, 'Media\\rutinas\\65.gif', 'Ponte de pie y sujeta una mancuerna con ambas manos, enfrente de tus muslos. Baja tu cuerpo flexionando tus rodillas hasta que formen un ángulo de 90 grados, y elévate a ti mismo hacia arriba luego de una breve pausa. Mantén tu tronco firme durante todo el movimiento.');
INSERT INTO `tbl_ejercicio` (`id_ejercicio`, `nombre_ejercicio`, `id_tipo_ejercicio`, `img_ejercicio`, `descripcion_ejercicio`) VALUES(66, 'Estocadas Inversas', 1, 'Media\\rutinas\\66.gif', 'Ponte de pie y sujeta una mancuerna en cada mano a los costados de tu cuerpo, con las palmas apuntando hacia tu cuerpo. Ubica un pie atrás y flexiona tus rodillas de manera de llevar tu cuerpo abajo hasta que tus rodillas formen un ángulo de 90 grados, y luego de una breve pausa elévate a ti mismo. Mantén tu tronco firme durante todo el movimiento.');
INSERT INTO `tbl_ejercicio` (`id_ejercicio`, `nombre_ejercicio`, `id_tipo_ejercicio`, `img_ejercicio`, `descripcion_ejercicio`) VALUES(67, 'Estocadas Estáticas', 1, 'Media\\rutinas\\67.gif', 'Ponte de pie con un pie al frente, el otro atrás y sujeta una mancuerna en cada mano a los costados de tu cuerpo, con las palmas apuntando una hacia la otra. Bájate a ti mismo sin mover tus pies hasta que tus rodillas forme un ángulo de 90 grados y luego de una breve pausa elévate a ti mismo. Mantén tu tronco firme durante todo el movimiento.');
INSERT INTO `tbl_ejercicio` (`id_ejercicio`, `nombre_ejercicio`, `id_tipo_ejercicio`, `img_ejercicio`, `descripcion_ejercicio`) VALUES(68, 'Estocadas Laterales', 1, 'Media\\rutinas\\68.gif', 'Ponte de pie y sujeta una mancuerna en cada mano contra los lados de tu cuerpo, con las palmas apuntando una hacia la otra. Da un amplio paso hacia el costado, de manera que tu rodilla muestre un ángulo de 90 grados y lentamente vuelve a la posición inicial luego de una breve pausa. Mantén tu espalda recta durante todo el movimiento.');
INSERT INTO `tbl_ejercicio` (`id_ejercicio`, `nombre_ejercicio`, `id_tipo_ejercicio`, `img_ejercicio`, `descripcion_ejercicio`) VALUES(69, 'Balanceo Integral con Mancuernas', 1, 'Media\\rutinas\\69.gif', 'Sujeta una mancuerna con ambas manos entre tus piernas y agáchate hasta que tus rodillas se encuentren formando ángulos de 90 grados. Levántate a ti mismo hacia la posición de pie mientras llevas la mancuerna por encima de tu cabeza y lentamente retorna a la posición inicial luego de una breve pausa. Mantén tu espalda recta durante todo el movimiento.');
INSERT INTO `tbl_ejercicio` (`id_ejercicio`, `nombre_ejercicio`, `id_tipo_ejercicio`, `img_ejercicio`, `descripcion_ejercicio`) VALUES(70, 'Peso Muerto – Piernas Rectas', 1, 'Media\\rutinas\\70.gif', 'Ponte de pie y sujeta una mancuerna en cada mano contra los costados de tu cuerpo, con las palmas apuntando una hacia la otra. Baja las mancuernas mediante la flexión de tus caderas hacia adelante y elévate nuevamente hacia arriba luego de una breve pausa. Mantén tu espalda recta durante todo el movimiento.');
INSERT INTO `tbl_ejercicio` (`id_ejercicio`, `nombre_ejercicio`, `id_tipo_ejercicio`, `img_ejercicio`, `descripcion_ejercicio`) VALUES(71, 'Elevación de Punta del Pie', 1, 'Media\\rutinas\\71.gif', 'Ponte de pie y sujeta una mancuerna en cada mano contra los costados de tu cuerpo, con las palmas apuntando una hacia la otra. Levanta tus talones del suelo haciendo presión sobre los dedos del pie y bájate nuevamente luego de una breve pausa. Mantén firme el resto de tu cuerpo durante todo el movimiento.');
INSERT INTO `tbl_ejercicio` (`id_ejercicio`, `nombre_ejercicio`, `id_tipo_ejercicio`, `img_ejercicio`, `descripcion_ejercicio`) VALUES(72, 'Elevación de Punta del Pie – A Una Pierna', 1, 'Media\\rutinas\\72.gif', 'Párate en un pie sobre un pequeño escalón y sujeta una mancuerna con una mano contra el costado de tu cuerpo. Elévate a ti mismo parándote sobre los dedos de tu pie y lentamente bájate luego de una breve pausa. Luego de terminada la serie, cambia de pie. Asegúrate de que sólo los gemelos estén trabajando.');
INSERT INTO `tbl_ejercicio` (`id_ejercicio`, `nombre_ejercicio`, `id_tipo_ejercicio`, `img_ejercicio`, `descripcion_ejercicio`) VALUES(73, 'Elevación de Punta del Pie, Sentado – A Una Pierna', 1, 'Media\\rutinas\\73.gif', 'Siéntate sobre un banco, ubica la parte delantera de uno de tus pies por sobre un escalón y sujeta una mancuerna con ambas manos encima del muslo de dicho pie. Eleva la mancuerna parándote sobre tus dedos del pie y lentamente bájala luego de una breve pausa. Luego de culminar la serie, ve alternando los pies. Asegúrate de que sólo los gemelos estén trabajando.');
INSERT INTO `tbl_ejercicio` (`id_ejercicio`, `nombre_ejercicio`, `id_tipo_ejercicio`, `img_ejercicio`, `descripcion_ejercicio`) VALUES(74, 'Flexiones de Muñeca, Palmas Hacia Arriba', 1, 'Media\\rutinas\\74.gif', 'Siéntate sobre uno de los extremos de un banco y sujeta una mancuerna con cada mano, tus muñecas contra las rodillas, con las palmas apuntando hacia arriba. Eleva las mancuernas hacia arriba levantando sólo tus manos y lentamente bájalas luego de una breve pausa. Mantén tus brazos firmes durante todo el movimiento.');
INSERT INTO `tbl_ejercicio` (`id_ejercicio`, `nombre_ejercicio`, `id_tipo_ejercicio`, `img_ejercicio`, `descripcion_ejercicio`) VALUES(75, 'Flexiones de Muñeca, Palmas Hacia Arriba – A Un Br', 1, 'Media\\rutinas\\75.gif', 'Siéntate sobre uno de los extremos de un banco y sujeta una mancuerna con una mano, tu muñeca contra la rodilla, con la palma apuntando hacia arriba. Eleva una mancuerna hacia arriba levantando sólo tu mano y lentamente bájala luego de una breve pausa. Luego de cada serie, alterna las manos. Mantén tus brazos firmes durante todo el movimiento.');
INSERT INTO `tbl_ejercicio` (`id_ejercicio`, `nombre_ejercicio`, `id_tipo_ejercicio`, `img_ejercicio`, `descripcion_ejercicio`) VALUES(76, 'Flexiones de Muñeca, Palmas Hacia Abajo', 1, 'Media\\rutinas\\76.gif', 'Siéntate sobre uno de los extremos de un banco y sujeta una mancuerna con cada mano, tus muñecas contra las rodillas, con las palmas apuntando hacia abajo. Eleva las mancuernas hacia arriba levantando sólo tus manos y lentamente bájalas luego de una breve pausa. Mantén tus brazos firmes durante todo el movimiento.');
INSERT INTO `tbl_ejercicio` (`id_ejercicio`, `nombre_ejercicio`, `id_tipo_ejercicio`, `img_ejercicio`, `descripcion_ejercicio`) VALUES(77, 'Flexiones de Muñeca, Palmas Hacia Abajo – A Un Bra', 1, 'Media\\rutinas\\77.gif', 'Siéntate sobre uno de los extremos de un banco y sujeta una mancuerna con una mano, tu muñeca contra la rodilla, con la palma apuntando hacia abajo. Eleva una mancuerna hacia arriba levantando sólo tu mano y lentamente bájala luego de una breve pausa. Luego de cada serie, alterna las manos. Mantén tus brazos firmes durante todo el movimiento.');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_especialista`
--

DROP TABLE IF EXISTS `tbl_especialista`;
CREATE TABLE `tbl_especialista` (
  `id_especialista` int(11) NOT NULL,
  `nombre_especialista` varchar(50) NOT NULL,
  `pass_especialista` varchar(500) NOT NULL,
  `id_tipo_Especialista` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `tbl_especialista`:
--   `id_tipo_Especialista`
--       `tbl_tipo_especialista` -> `id_tipo_especialista`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_historial_medidas`
--

DROP TABLE IF EXISTS `tbl_historial_medidas`;
CREATE TABLE `tbl_historial_medidas` (
  `id_historial_medidas` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `fecha_his_med` date NOT NULL,
  `cm` int(11) NOT NULL,
  `id_parte_cuerpo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `tbl_historial_medidas`:
--   `id_parte_cuerpo`
--       `tbl_parte_cuerpo` -> `id_parte_cuerpo`
--   `id_usuario`
--       `tbl_usuario` -> `id_usuario`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_historial_peso`
--

DROP TABLE IF EXISTS `tbl_historial_peso`;
CREATE TABLE `tbl_historial_peso` (
  `id_historial_peso` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `fecha_his_pes` date NOT NULL,
  `peso` int(3) NOT NULL COMMENT 'en kg'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `tbl_historial_peso`:
--   `id_usuario`
--       `tbl_usuario` -> `id_usuario`
--

--
-- Dumping data for table `tbl_historial_peso`
--

INSERT INTO `tbl_historial_peso` (`id_historial_peso`, `id_usuario`, `fecha_his_pes`, `peso`) VALUES(1, 2, '0000-00-00', 70);
INSERT INTO `tbl_historial_peso` (`id_historial_peso`, `id_usuario`, `fecha_his_pes`, `peso`) VALUES(2, 2, '2017-05-11', 70);
INSERT INTO `tbl_historial_peso` (`id_historial_peso`, `id_usuario`, `fecha_his_pes`, `peso`) VALUES(3, 2, '2017-05-11', 70);
INSERT INTO `tbl_historial_peso` (`id_historial_peso`, `id_usuario`, `fecha_his_pes`, `peso`) VALUES(4, 0, '2017-05-19', 65);
INSERT INTO `tbl_historial_peso` (`id_historial_peso`, `id_usuario`, `fecha_his_pes`, `peso`) VALUES(5, 0, '2017-05-19', 67);
INSERT INTO `tbl_historial_peso` (`id_historial_peso`, `id_usuario`, `fecha_his_pes`, `peso`) VALUES(6, 0, '2017-05-19', 71);
INSERT INTO `tbl_historial_peso` (`id_historial_peso`, `id_usuario`, `fecha_his_pes`, `peso`) VALUES(7, 1, '2017-05-23', 70);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_historial_rutinas`
--

DROP TABLE IF EXISTS `tbl_historial_rutinas`;
CREATE TABLE `tbl_historial_rutinas` (
  `id_historial_rutinas` int(11) NOT NULL,
  `sesion_rutina` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_rutina` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `tbl_historial_rutinas`:
--   `id_usuario`
--       `tbl_usuario` -> `id_usuario`
--   `id_rutina`
--       `tbl_rutina` -> `id_rutina`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_objetivo`
--

DROP TABLE IF EXISTS `tbl_objetivo`;
CREATE TABLE `tbl_objetivo` (
  `id_objetivo` int(11) NOT NULL,
  `nombre_objetivo` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `tbl_objetivo`:
--

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
CREATE TABLE `tbl_parte_cuerpo` (
  `id_parte_cuerpo` int(11) NOT NULL,
  `nombre_parte_cuerpo` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `tbl_parte_cuerpo`:
--

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
CREATE TABLE `tbl_parte_cuerpo_ejerc` (
  `id_parte_cuerpo_ejer` int(11) NOT NULL,
  `id_parte_cuerpo` int(11) NOT NULL,
  `id_ejercicio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `tbl_parte_cuerpo_ejerc`:
--   `id_parte_cuerpo`
--       `tbl_parte_cuerpo` -> `id_parte_cuerpo`
--   `id_ejercicio`
--       `tbl_ejercicio` -> `id_ejercicio`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_plato`
--

DROP TABLE IF EXISTS `tbl_plato`;
CREATE TABLE `tbl_plato` (
  `id_plato` int(11) NOT NULL,
  `nombre_plato` varchar(35) NOT NULL,
  `preparacion_plato` text NOT NULL,
  `descripcion_plato` text NOT NULL,
  `tipo_plato` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `tbl_plato`:
--

--
-- Dumping data for table `tbl_plato`
--

INSERT INTO `tbl_plato` (`id_plato`, `nombre_plato`, `preparacion_plato`, `descripcion_plato`, `tipo_plato`) VALUES(1, 'Brécoles + Pechuga de pollo', '2 huevos + 4 claras de huevo\r\n30 g.de leche desgrasada\r\n1 taza de brécoles troceados. al vapor.\r\n60 g. de pechuga de pollo cocido.\r\nSal. pimienta o ajo en polvo para sabor.\r\nAceite de oliva.', 'Bate los huevos y la leche. Cocina los brécoles y el pollo. Añádeles luego la mezcla de huevos, tápalo y cocínalo a fuego lento durante aproximadamente 10 minutos.\r\n\r\n1 rebanada de pan integral.\r\n30 g. de queso desgrasado.\r\n1 vaso de jugo vegetal.', 'Desayuno');
INSERT INTO `tbl_plato` (`id_plato`, `nombre_plato`, `preparacion_plato`, `descripcion_plato`, `tipo_plato`) VALUES(2, 'Manzana + Yogur desnatado', '1 manzana grande\r\n1 Yogur desnatado', '1 manzana grande\r\n1 Yogur desnatado', 'mediamañana');
INSERT INTO `tbl_plato` (`id_plato`, `nombre_plato`, `preparacion_plato`, `descripcion_plato`, `tipo_plato`) VALUES(3, 'Bocadillo de carne', '85 g. de carne magra cortada en trozo\r\n2 rebanadas de pan de centeno\r\n1 tomate mediano, troceado\r\n60 g. de queso desgrasado\r\nMostaza o especias según nuestro gusto\r\n1 vaso de leche desgrasada', '85 g. de carne magra cortada en trozo\r\n2 rebanadas de pan de centeno\r\n1 tomate mediano, troceado\r\n60 g. de queso desgrasado\r\nMostaza o especias según nuestro gusto\r\n1 vaso de leche desgrasada', 'Mediodía Comida');
INSERT INTO `tbl_plato` (`id_plato`, `nombre_plato`, `preparacion_plato`, `descripcion_plato`, `tipo_plato`) VALUES(4, 'Bebida + Barrita energética', '1/2 litro de bebida post entrenamiento (unas 380 calorías. 35 g. de proteína y 60 g. de carbohidratos)\r\n1 barrita energética.', 'Después del entrenamiento a casi nadie le apetece cocinar, por lo que somos realistas y utilizamos un suplemento post entrenamiento. Puedes pasar esta comida a otra parte del día si entrenas a una hora diferente. Si pesas poco o no necesitas las 620 calorías de aquí, no tomes la barrita energética (240 calorías, selecciona una con un elevado índice glucémico).', 'post-entrenar');
INSERT INTO `tbl_plato` (`id_plato`, `nombre_plato`, `preparacion_plato`, `descripcion_plato`, `tipo_plato`) VALUES(5, 'Salmón y pasta', '85 g. de salmón cocido.\r\n225 g. de tomates. cortados o aplastados con espátula mientras los cocinamos.\r\n1/2 taza de champiñones, troceados.\r\nEspecias para sazonar.\r\nCocedlo durante 3 a 4 m.\r\n1 taza pequeña de pasta cocida.\r\n1 taza pequeña de vegetales mezclados.\r\n1 batata, cocida.', 'Esta comida será algo más contundente ya que es muy importante para el entrenamiento que hemos realizado unas horas antes. De echo se podría decir que la comida postentrenamiento recupera y esta pone en marcha el mecanismo de crecimiento muscular.', 'cena');
INSERT INTO `tbl_plato` (`id_plato`, `nombre_plato`, `preparacion_plato`, `descripcion_plato`, `tipo_plato`) VALUES(6, '225 gramos de yogur desnatado.', '225 gramos de yogur desnatado.', '10’30 de la noche: Antes de acostarse', 'Antes de dormir');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_rutina`
--

DROP TABLE IF EXISTS `tbl_rutina`;
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
-- RELATIONS FOR TABLE `tbl_rutina`:
--   `id_especialista`
--       `tbl_especialista` -> `id_especialista`
--   `id_objetivo`
--       `tbl_objetivo` -> `id_objetivo`
--

--
-- Dumping data for table `tbl_rutina`
--

INSERT INTO `tbl_rutina` (`id_rutina`, `nombre_rutina`, `duracion_rutina`, `id_objetivo`, `descripcion`, `sesiones_semana_rutina`, `id_especialista`) VALUES(1, 'Rutinas de Entrenamiento para perder peso', 4, 1, 'Las rutinas de entrenamiento que son presentadas aquí pueden ser desarrolladas utilizando ejercicios con mancuernas, y te permitirán alcanzar los músculos de una región específica de tu cuerpo. Son presentados aquí para resaltar cuán efectivo puede resultar un entrenamiento basado en ejercicios con mancuernas. ', 3, NULL);
INSERT INTO `tbl_rutina` (`id_rutina`, `nombre_rutina`, `duracion_rutina`, `id_objetivo`, `descripcion`, `sesiones_semana_rutina`, `id_especialista`) VALUES(2, 'Rutinas de Entrenamiento Ganar Masa Corporal', 4, 2, 'Las rutinas de entrenamiento que son presentadas aquí pueden ser desarrolladas utilizando ejercicios con mancuernas, y te permitirán alcanzar los músculos de una región específica de tu cuerpo. Son presentados aquí para resaltar cuán efectivo puede resultar un entrenamiento basado en ejercicios con mancuernas. ', 3, NULL);
INSERT INTO `tbl_rutina` (`id_rutina`, `nombre_rutina`, `duracion_rutina`, `id_objetivo`, `descripcion`, `sesiones_semana_rutina`, `id_especialista`) VALUES(3, 'Rutinas de Entrenamiento para manternerse', 4, 3, 'Las rutinas de entrenamiento que son presentadas aquí pueden ser desarrolladas utilizando ejercicios con mancuernas, y te permitirán alcanzar los músculos de una región específica de tu cuerpo. Son presentados aquí para resaltar cuán efectivo puede resultar un entrenamiento basado en ejercicios con mancuernas. ', 3, NULL);
INSERT INTO `tbl_rutina` (`id_rutina`, `nombre_rutina`, `duracion_rutina`, `id_objetivo`, `descripcion`, `sesiones_semana_rutina`, `id_especialista`) VALUES(4, 'Rutinas de Entrenamiento para definir', 4, 4, 'Las rutinas de entrenamiento que son presentadas aquí pueden ser desarrolladas utilizando ejercicios con mancuernas, y te permitirán alcanzar los músculos de una región específica de tu cuerpo. Son presentados aquí para resaltar cuán efectivo puede resultar un entrenamiento basado en ejercicios con mancuernas. ', 3, NULL);
INSERT INTO `tbl_rutina` (`id_rutina`, `nombre_rutina`, `duracion_rutina`, `id_objetivo`, `descripcion`, `sesiones_semana_rutina`, `id_especialista`) VALUES(5, 'Rutinas de Entrenamiento Ganar Músculo', 4, 5, 'Las rutinas de entrenamiento que son presentadas aquí pueden ser desarrolladas utilizando ejercicios con mancuernas, y te permitirán alcanzar los músculos de una región específica de tu cuerpo. Son presentados aquí para resaltar cuán efectivo puede resultar un entrenamiento basado en ejercicios con mancuernas. ', 3, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_rutina_ejer`
--

DROP TABLE IF EXISTS `tbl_rutina_ejer`;
CREATE TABLE `tbl_rutina_ejer` (
  `id_rutina_ejer` int(11) NOT NULL,
  `id_rutina` int(11) NOT NULL,
  `id_ejercicio` int(11) NOT NULL,
  `series` int(3) NOT NULL,
  `repeticiones` int(3) NOT NULL,
  `num_dia` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `tbl_rutina_ejer`:
--   `id_ejercicio`
--       `tbl_ejercicio` -> `id_ejercicio`
--   `id_rutina`
--       `tbl_rutina` -> `id_rutina`
--

--
-- Dumping data for table `tbl_rutina_ejer`
--

INSERT INTO `tbl_rutina_ejer` (`id_rutina_ejer`, `id_rutina`, `id_ejercicio`, `series`, `repeticiones`, `num_dia`) VALUES(1, 1, 1, 4, 10, '1');
INSERT INTO `tbl_rutina_ejer` (`id_rutina_ejer`, `id_rutina`, `id_ejercicio`, `series`, `repeticiones`, `num_dia`) VALUES(2, 1, 3, 4, 10, '1');
INSERT INTO `tbl_rutina_ejer` (`id_rutina_ejer`, `id_rutina`, `id_ejercicio`, `series`, `repeticiones`, `num_dia`) VALUES(3, 1, 4, 4, 10, '1');
INSERT INTO `tbl_rutina_ejer` (`id_rutina_ejer`, `id_rutina`, `id_ejercicio`, `series`, `repeticiones`, `num_dia`) VALUES(4, 1, 6, 4, 10, '1');
INSERT INTO `tbl_rutina_ejer` (`id_rutina_ejer`, `id_rutina`, `id_ejercicio`, `series`, `repeticiones`, `num_dia`) VALUES(5, 1, 9, 4, 10, '1');
INSERT INTO `tbl_rutina_ejer` (`id_rutina_ejer`, `id_rutina`, `id_ejercicio`, `series`, `repeticiones`, `num_dia`) VALUES(6, 1, 50, 4, 10, '1');
INSERT INTO `tbl_rutina_ejer` (`id_rutina_ejer`, `id_rutina`, `id_ejercicio`, `series`, `repeticiones`, `num_dia`) VALUES(7, 1, 56, 4, 10, '1');
INSERT INTO `tbl_rutina_ejer` (`id_rutina_ejer`, `id_rutina`, `id_ejercicio`, `series`, `repeticiones`, `num_dia`) VALUES(8, 1, 54, 4, 10, '1');
INSERT INTO `tbl_rutina_ejer` (`id_rutina_ejer`, `id_rutina`, `id_ejercicio`, `series`, `repeticiones`, `num_dia`) VALUES(9, 1, 53, 4, 10, '1');
INSERT INTO `tbl_rutina_ejer` (`id_rutina_ejer`, `id_rutina`, `id_ejercicio`, `series`, `repeticiones`, `num_dia`) VALUES(10, 1, 52, 4, 10, '1');
INSERT INTO `tbl_rutina_ejer` (`id_rutina_ejer`, `id_rutina`, `id_ejercicio`, `series`, `repeticiones`, `num_dia`) VALUES(11, 2, 1, 4, 10, '1');
INSERT INTO `tbl_rutina_ejer` (`id_rutina_ejer`, `id_rutina`, `id_ejercicio`, `series`, `repeticiones`, `num_dia`) VALUES(12, 2, 3, 4, 10, '1');
INSERT INTO `tbl_rutina_ejer` (`id_rutina_ejer`, `id_rutina`, `id_ejercicio`, `series`, `repeticiones`, `num_dia`) VALUES(13, 2, 4, 4, 10, '1');
INSERT INTO `tbl_rutina_ejer` (`id_rutina_ejer`, `id_rutina`, `id_ejercicio`, `series`, `repeticiones`, `num_dia`) VALUES(14, 2, 6, 4, 10, '1');
INSERT INTO `tbl_rutina_ejer` (`id_rutina_ejer`, `id_rutina`, `id_ejercicio`, `series`, `repeticiones`, `num_dia`) VALUES(15, 2, 9, 4, 10, '1');
INSERT INTO `tbl_rutina_ejer` (`id_rutina_ejer`, `id_rutina`, `id_ejercicio`, `series`, `repeticiones`, `num_dia`) VALUES(16, 2, 50, 4, 10, '1');
INSERT INTO `tbl_rutina_ejer` (`id_rutina_ejer`, `id_rutina`, `id_ejercicio`, `series`, `repeticiones`, `num_dia`) VALUES(17, 2, 56, 4, 10, '1');
INSERT INTO `tbl_rutina_ejer` (`id_rutina_ejer`, `id_rutina`, `id_ejercicio`, `series`, `repeticiones`, `num_dia`) VALUES(18, 2, 54, 4, 10, '1');
INSERT INTO `tbl_rutina_ejer` (`id_rutina_ejer`, `id_rutina`, `id_ejercicio`, `series`, `repeticiones`, `num_dia`) VALUES(19, 2, 53, 4, 10, '1');
INSERT INTO `tbl_rutina_ejer` (`id_rutina_ejer`, `id_rutina`, `id_ejercicio`, `series`, `repeticiones`, `num_dia`) VALUES(20, 2, 52, 4, 10, '1');
INSERT INTO `tbl_rutina_ejer` (`id_rutina_ejer`, `id_rutina`, `id_ejercicio`, `series`, `repeticiones`, `num_dia`) VALUES(21, 3, 1, 4, 10, '1');
INSERT INTO `tbl_rutina_ejer` (`id_rutina_ejer`, `id_rutina`, `id_ejercicio`, `series`, `repeticiones`, `num_dia`) VALUES(22, 3, 3, 4, 10, '1');
INSERT INTO `tbl_rutina_ejer` (`id_rutina_ejer`, `id_rutina`, `id_ejercicio`, `series`, `repeticiones`, `num_dia`) VALUES(23, 3, 4, 4, 10, '1');
INSERT INTO `tbl_rutina_ejer` (`id_rutina_ejer`, `id_rutina`, `id_ejercicio`, `series`, `repeticiones`, `num_dia`) VALUES(24, 3, 6, 4, 10, '1');
INSERT INTO `tbl_rutina_ejer` (`id_rutina_ejer`, `id_rutina`, `id_ejercicio`, `series`, `repeticiones`, `num_dia`) VALUES(25, 3, 9, 4, 10, '1');
INSERT INTO `tbl_rutina_ejer` (`id_rutina_ejer`, `id_rutina`, `id_ejercicio`, `series`, `repeticiones`, `num_dia`) VALUES(26, 3, 50, 4, 10, '1');
INSERT INTO `tbl_rutina_ejer` (`id_rutina_ejer`, `id_rutina`, `id_ejercicio`, `series`, `repeticiones`, `num_dia`) VALUES(27, 3, 56, 4, 10, '1');
INSERT INTO `tbl_rutina_ejer` (`id_rutina_ejer`, `id_rutina`, `id_ejercicio`, `series`, `repeticiones`, `num_dia`) VALUES(28, 3, 54, 4, 10, '1');
INSERT INTO `tbl_rutina_ejer` (`id_rutina_ejer`, `id_rutina`, `id_ejercicio`, `series`, `repeticiones`, `num_dia`) VALUES(29, 3, 53, 4, 10, '1');
INSERT INTO `tbl_rutina_ejer` (`id_rutina_ejer`, `id_rutina`, `id_ejercicio`, `series`, `repeticiones`, `num_dia`) VALUES(30, 3, 52, 4, 10, '1');
INSERT INTO `tbl_rutina_ejer` (`id_rutina_ejer`, `id_rutina`, `id_ejercicio`, `series`, `repeticiones`, `num_dia`) VALUES(31, 4, 1, 4, 10, '1');
INSERT INTO `tbl_rutina_ejer` (`id_rutina_ejer`, `id_rutina`, `id_ejercicio`, `series`, `repeticiones`, `num_dia`) VALUES(32, 4, 3, 4, 10, '1');
INSERT INTO `tbl_rutina_ejer` (`id_rutina_ejer`, `id_rutina`, `id_ejercicio`, `series`, `repeticiones`, `num_dia`) VALUES(33, 4, 4, 4, 10, '1');
INSERT INTO `tbl_rutina_ejer` (`id_rutina_ejer`, `id_rutina`, `id_ejercicio`, `series`, `repeticiones`, `num_dia`) VALUES(34, 4, 6, 4, 10, '1');
INSERT INTO `tbl_rutina_ejer` (`id_rutina_ejer`, `id_rutina`, `id_ejercicio`, `series`, `repeticiones`, `num_dia`) VALUES(35, 4, 9, 4, 10, '1');
INSERT INTO `tbl_rutina_ejer` (`id_rutina_ejer`, `id_rutina`, `id_ejercicio`, `series`, `repeticiones`, `num_dia`) VALUES(36, 4, 50, 4, 10, '1');
INSERT INTO `tbl_rutina_ejer` (`id_rutina_ejer`, `id_rutina`, `id_ejercicio`, `series`, `repeticiones`, `num_dia`) VALUES(37, 4, 56, 4, 10, '1');
INSERT INTO `tbl_rutina_ejer` (`id_rutina_ejer`, `id_rutina`, `id_ejercicio`, `series`, `repeticiones`, `num_dia`) VALUES(38, 4, 54, 4, 10, '1');
INSERT INTO `tbl_rutina_ejer` (`id_rutina_ejer`, `id_rutina`, `id_ejercicio`, `series`, `repeticiones`, `num_dia`) VALUES(39, 4, 53, 4, 10, '1');
INSERT INTO `tbl_rutina_ejer` (`id_rutina_ejer`, `id_rutina`, `id_ejercicio`, `series`, `repeticiones`, `num_dia`) VALUES(40, 4, 52, 4, 10, '1');
INSERT INTO `tbl_rutina_ejer` (`id_rutina_ejer`, `id_rutina`, `id_ejercicio`, `series`, `repeticiones`, `num_dia`) VALUES(41, 5, 1, 4, 10, '1');
INSERT INTO `tbl_rutina_ejer` (`id_rutina_ejer`, `id_rutina`, `id_ejercicio`, `series`, `repeticiones`, `num_dia`) VALUES(42, 5, 3, 4, 10, '1');
INSERT INTO `tbl_rutina_ejer` (`id_rutina_ejer`, `id_rutina`, `id_ejercicio`, `series`, `repeticiones`, `num_dia`) VALUES(43, 5, 4, 4, 10, '1');
INSERT INTO `tbl_rutina_ejer` (`id_rutina_ejer`, `id_rutina`, `id_ejercicio`, `series`, `repeticiones`, `num_dia`) VALUES(44, 5, 6, 4, 10, '1');
INSERT INTO `tbl_rutina_ejer` (`id_rutina_ejer`, `id_rutina`, `id_ejercicio`, `series`, `repeticiones`, `num_dia`) VALUES(45, 5, 9, 4, 10, '1');
INSERT INTO `tbl_rutina_ejer` (`id_rutina_ejer`, `id_rutina`, `id_ejercicio`, `series`, `repeticiones`, `num_dia`) VALUES(46, 5, 50, 4, 10, '1');
INSERT INTO `tbl_rutina_ejer` (`id_rutina_ejer`, `id_rutina`, `id_ejercicio`, `series`, `repeticiones`, `num_dia`) VALUES(47, 5, 56, 4, 10, '1');
INSERT INTO `tbl_rutina_ejer` (`id_rutina_ejer`, `id_rutina`, `id_ejercicio`, `series`, `repeticiones`, `num_dia`) VALUES(48, 5, 54, 4, 10, '1');
INSERT INTO `tbl_rutina_ejer` (`id_rutina_ejer`, `id_rutina`, `id_ejercicio`, `series`, `repeticiones`, `num_dia`) VALUES(49, 5, 53, 4, 10, '1');
INSERT INTO `tbl_rutina_ejer` (`id_rutina_ejer`, `id_rutina`, `id_ejercicio`, `series`, `repeticiones`, `num_dia`) VALUES(50, 5, 52, 4, 10, '1');
INSERT INTO `tbl_rutina_ejer` (`id_rutina_ejer`, `id_rutina`, `id_ejercicio`, `series`, `repeticiones`, `num_dia`) VALUES(51, 1, 57, 4, 10, '2');
INSERT INTO `tbl_rutina_ejer` (`id_rutina_ejer`, `id_rutina`, `id_ejercicio`, `series`, `repeticiones`, `num_dia`) VALUES(52, 1, 59, 4, 10, '2');
INSERT INTO `tbl_rutina_ejer` (`id_rutina_ejer`, `id_rutina`, `id_ejercicio`, `series`, `repeticiones`, `num_dia`) VALUES(53, 1, 60, 4, 10, '2');
INSERT INTO `tbl_rutina_ejer` (`id_rutina_ejer`, `id_rutina`, `id_ejercicio`, `series`, `repeticiones`, `num_dia`) VALUES(54, 1, 62, 4, 10, '2');
INSERT INTO `tbl_rutina_ejer` (`id_rutina_ejer`, `id_rutina`, `id_ejercicio`, `series`, `repeticiones`, `num_dia`) VALUES(55, 1, 64, 4, 10, '2');
INSERT INTO `tbl_rutina_ejer` (`id_rutina_ejer`, `id_rutina`, `id_ejercicio`, `series`, `repeticiones`, `num_dia`) VALUES(56, 3, 32, 4, 10, '2');
INSERT INTO `tbl_rutina_ejer` (`id_rutina_ejer`, `id_rutina`, `id_ejercicio`, `series`, `repeticiones`, `num_dia`) VALUES(57, 4, 40, 4, 10, '2');
INSERT INTO `tbl_rutina_ejer` (`id_rutina_ejer`, `id_rutina`, `id_ejercicio`, `series`, `repeticiones`, `num_dia`) VALUES(58, 1, 37, 4, 10, '2');
INSERT INTO `tbl_rutina_ejer` (`id_rutina_ejer`, `id_rutina`, `id_ejercicio`, `series`, `repeticiones`, `num_dia`) VALUES(59, 1, 45, 4, 10, '2');
INSERT INTO `tbl_rutina_ejer` (`id_rutina_ejer`, `id_rutina`, `id_ejercicio`, `series`, `repeticiones`, `num_dia`) VALUES(60, 1, 38, 4, 10, '2');
INSERT INTO `tbl_rutina_ejer` (`id_rutina_ejer`, `id_rutina`, `id_ejercicio`, `series`, `repeticiones`, `num_dia`) VALUES(61, 2, 57, 4, 10, '2');
INSERT INTO `tbl_rutina_ejer` (`id_rutina_ejer`, `id_rutina`, `id_ejercicio`, `series`, `repeticiones`, `num_dia`) VALUES(62, 2, 59, 4, 10, '2');
INSERT INTO `tbl_rutina_ejer` (`id_rutina_ejer`, `id_rutina`, `id_ejercicio`, `series`, `repeticiones`, `num_dia`) VALUES(63, 2, 60, 4, 10, '2');
INSERT INTO `tbl_rutina_ejer` (`id_rutina_ejer`, `id_rutina`, `id_ejercicio`, `series`, `repeticiones`, `num_dia`) VALUES(64, 2, 62, 4, 10, '2');
INSERT INTO `tbl_rutina_ejer` (`id_rutina_ejer`, `id_rutina`, `id_ejercicio`, `series`, `repeticiones`, `num_dia`) VALUES(65, 2, 64, 4, 10, '2');
INSERT INTO `tbl_rutina_ejer` (`id_rutina_ejer`, `id_rutina`, `id_ejercicio`, `series`, `repeticiones`, `num_dia`) VALUES(66, 2, 32, 4, 10, '2');
INSERT INTO `tbl_rutina_ejer` (`id_rutina_ejer`, `id_rutina`, `id_ejercicio`, `series`, `repeticiones`, `num_dia`) VALUES(67, 2, 40, 4, 10, '2');
INSERT INTO `tbl_rutina_ejer` (`id_rutina_ejer`, `id_rutina`, `id_ejercicio`, `series`, `repeticiones`, `num_dia`) VALUES(68, 2, 37, 4, 10, '2');
INSERT INTO `tbl_rutina_ejer` (`id_rutina_ejer`, `id_rutina`, `id_ejercicio`, `series`, `repeticiones`, `num_dia`) VALUES(69, 2, 45, 4, 10, '2');
INSERT INTO `tbl_rutina_ejer` (`id_rutina_ejer`, `id_rutina`, `id_ejercicio`, `series`, `repeticiones`, `num_dia`) VALUES(70, 2, 38, 4, 10, '2');
INSERT INTO `tbl_rutina_ejer` (`id_rutina_ejer`, `id_rutina`, `id_ejercicio`, `series`, `repeticiones`, `num_dia`) VALUES(71, 3, 57, 4, 10, '2');
INSERT INTO `tbl_rutina_ejer` (`id_rutina_ejer`, `id_rutina`, `id_ejercicio`, `series`, `repeticiones`, `num_dia`) VALUES(72, 3, 59, 4, 10, '2');
INSERT INTO `tbl_rutina_ejer` (`id_rutina_ejer`, `id_rutina`, `id_ejercicio`, `series`, `repeticiones`, `num_dia`) VALUES(73, 3, 60, 4, 10, '2');
INSERT INTO `tbl_rutina_ejer` (`id_rutina_ejer`, `id_rutina`, `id_ejercicio`, `series`, `repeticiones`, `num_dia`) VALUES(74, 3, 62, 4, 10, '2');
INSERT INTO `tbl_rutina_ejer` (`id_rutina_ejer`, `id_rutina`, `id_ejercicio`, `series`, `repeticiones`, `num_dia`) VALUES(75, 3, 64, 4, 10, '2');
INSERT INTO `tbl_rutina_ejer` (`id_rutina_ejer`, `id_rutina`, `id_ejercicio`, `series`, `repeticiones`, `num_dia`) VALUES(77, 3, 40, 4, 10, '2');
INSERT INTO `tbl_rutina_ejer` (`id_rutina_ejer`, `id_rutina`, `id_ejercicio`, `series`, `repeticiones`, `num_dia`) VALUES(78, 3, 37, 4, 10, '2');
INSERT INTO `tbl_rutina_ejer` (`id_rutina_ejer`, `id_rutina`, `id_ejercicio`, `series`, `repeticiones`, `num_dia`) VALUES(79, 3, 45, 4, 10, '2');
INSERT INTO `tbl_rutina_ejer` (`id_rutina_ejer`, `id_rutina`, `id_ejercicio`, `series`, `repeticiones`, `num_dia`) VALUES(80, 3, 38, 4, 10, '2');
INSERT INTO `tbl_rutina_ejer` (`id_rutina_ejer`, `id_rutina`, `id_ejercicio`, `series`, `repeticiones`, `num_dia`) VALUES(81, 4, 57, 4, 10, '2');
INSERT INTO `tbl_rutina_ejer` (`id_rutina_ejer`, `id_rutina`, `id_ejercicio`, `series`, `repeticiones`, `num_dia`) VALUES(82, 4, 59, 4, 10, '2');
INSERT INTO `tbl_rutina_ejer` (`id_rutina_ejer`, `id_rutina`, `id_ejercicio`, `series`, `repeticiones`, `num_dia`) VALUES(83, 4, 60, 4, 10, '2');
INSERT INTO `tbl_rutina_ejer` (`id_rutina_ejer`, `id_rutina`, `id_ejercicio`, `series`, `repeticiones`, `num_dia`) VALUES(84, 4, 62, 4, 10, '2');
INSERT INTO `tbl_rutina_ejer` (`id_rutina_ejer`, `id_rutina`, `id_ejercicio`, `series`, `repeticiones`, `num_dia`) VALUES(85, 4, 64, 4, 10, '2');
INSERT INTO `tbl_rutina_ejer` (`id_rutina_ejer`, `id_rutina`, `id_ejercicio`, `series`, `repeticiones`, `num_dia`) VALUES(86, 4, 32, 4, 10, '2');
INSERT INTO `tbl_rutina_ejer` (`id_rutina_ejer`, `id_rutina`, `id_ejercicio`, `series`, `repeticiones`, `num_dia`) VALUES(88, 4, 37, 4, 10, '2');
INSERT INTO `tbl_rutina_ejer` (`id_rutina_ejer`, `id_rutina`, `id_ejercicio`, `series`, `repeticiones`, `num_dia`) VALUES(89, 4, 45, 4, 10, '2');
INSERT INTO `tbl_rutina_ejer` (`id_rutina_ejer`, `id_rutina`, `id_ejercicio`, `series`, `repeticiones`, `num_dia`) VALUES(90, 4, 38, 4, 10, '2');
INSERT INTO `tbl_rutina_ejer` (`id_rutina_ejer`, `id_rutina`, `id_ejercicio`, `series`, `repeticiones`, `num_dia`) VALUES(91, 5, 57, 4, 10, '2');
INSERT INTO `tbl_rutina_ejer` (`id_rutina_ejer`, `id_rutina`, `id_ejercicio`, `series`, `repeticiones`, `num_dia`) VALUES(92, 5, 59, 4, 10, '2');
INSERT INTO `tbl_rutina_ejer` (`id_rutina_ejer`, `id_rutina`, `id_ejercicio`, `series`, `repeticiones`, `num_dia`) VALUES(93, 5, 60, 4, 10, '2');
INSERT INTO `tbl_rutina_ejer` (`id_rutina_ejer`, `id_rutina`, `id_ejercicio`, `series`, `repeticiones`, `num_dia`) VALUES(94, 5, 62, 4, 10, '2');
INSERT INTO `tbl_rutina_ejer` (`id_rutina_ejer`, `id_rutina`, `id_ejercicio`, `series`, `repeticiones`, `num_dia`) VALUES(95, 5, 64, 4, 10, '2');
INSERT INTO `tbl_rutina_ejer` (`id_rutina_ejer`, `id_rutina`, `id_ejercicio`, `series`, `repeticiones`, `num_dia`) VALUES(96, 5, 32, 4, 10, '2');
INSERT INTO `tbl_rutina_ejer` (`id_rutina_ejer`, `id_rutina`, `id_ejercicio`, `series`, `repeticiones`, `num_dia`) VALUES(97, 5, 40, 4, 10, '2');
INSERT INTO `tbl_rutina_ejer` (`id_rutina_ejer`, `id_rutina`, `id_ejercicio`, `series`, `repeticiones`, `num_dia`) VALUES(98, 5, 37, 4, 10, '2');
INSERT INTO `tbl_rutina_ejer` (`id_rutina_ejer`, `id_rutina`, `id_ejercicio`, `series`, `repeticiones`, `num_dia`) VALUES(99, 5, 45, 4, 10, '2');
INSERT INTO `tbl_rutina_ejer` (`id_rutina_ejer`, `id_rutina`, `id_ejercicio`, `series`, `repeticiones`, `num_dia`) VALUES(100, 5, 38, 4, 10, '2');
INSERT INTO `tbl_rutina_ejer` (`id_rutina_ejer`, `id_rutina`, `id_ejercicio`, `series`, `repeticiones`, `num_dia`) VALUES(101, 1, 74, 4, 10, '3');
INSERT INTO `tbl_rutina_ejer` (`id_rutina_ejer`, `id_rutina`, `id_ejercicio`, `series`, `repeticiones`, `num_dia`) VALUES(102, 1, 76, 4, 10, '3');
INSERT INTO `tbl_rutina_ejer` (`id_rutina_ejer`, `id_rutina`, `id_ejercicio`, `series`, `repeticiones`, `num_dia`) VALUES(103, 1, 13, 4, 10, '3');
INSERT INTO `tbl_rutina_ejer` (`id_rutina_ejer`, `id_rutina`, `id_ejercicio`, `series`, `repeticiones`, `num_dia`) VALUES(104, 1, 30, 4, 10, '3');
INSERT INTO `tbl_rutina_ejer` (`id_rutina_ejer`, `id_rutina`, `id_ejercicio`, `series`, `repeticiones`, `num_dia`) VALUES(105, 1, 25, 4, 10, '3');
INSERT INTO `tbl_rutina_ejer` (`id_rutina_ejer`, `id_rutina`, `id_ejercicio`, `series`, `repeticiones`, `num_dia`) VALUES(106, 1, 31, 4, 10, '3');
INSERT INTO `tbl_rutina_ejer` (`id_rutina_ejer`, `id_rutina`, `id_ejercicio`, `series`, `repeticiones`, `num_dia`) VALUES(107, 1, 73, 4, 10, '3');
INSERT INTO `tbl_rutina_ejer` (`id_rutina_ejer`, `id_rutina`, `id_ejercicio`, `series`, `repeticiones`, `num_dia`) VALUES(108, 1, 70, 4, 10, '3');
INSERT INTO `tbl_rutina_ejer` (`id_rutina_ejer`, `id_rutina`, `id_ejercicio`, `series`, `repeticiones`, `num_dia`) VALUES(109, 1, 68, 4, 10, '3');
INSERT INTO `tbl_rutina_ejer` (`id_rutina_ejer`, `id_rutina`, `id_ejercicio`, `series`, `repeticiones`, `num_dia`) VALUES(110, 1, 65, 4, 10, '3');
INSERT INTO `tbl_rutina_ejer` (`id_rutina_ejer`, `id_rutina`, `id_ejercicio`, `series`, `repeticiones`, `num_dia`) VALUES(111, 2, 74, 4, 10, '3');
INSERT INTO `tbl_rutina_ejer` (`id_rutina_ejer`, `id_rutina`, `id_ejercicio`, `series`, `repeticiones`, `num_dia`) VALUES(112, 2, 76, 4, 10, '3');
INSERT INTO `tbl_rutina_ejer` (`id_rutina_ejer`, `id_rutina`, `id_ejercicio`, `series`, `repeticiones`, `num_dia`) VALUES(113, 2, 13, 4, 10, '3');
INSERT INTO `tbl_rutina_ejer` (`id_rutina_ejer`, `id_rutina`, `id_ejercicio`, `series`, `repeticiones`, `num_dia`) VALUES(114, 2, 30, 4, 10, '3');
INSERT INTO `tbl_rutina_ejer` (`id_rutina_ejer`, `id_rutina`, `id_ejercicio`, `series`, `repeticiones`, `num_dia`) VALUES(115, 2, 25, 4, 10, '3');
INSERT INTO `tbl_rutina_ejer` (`id_rutina_ejer`, `id_rutina`, `id_ejercicio`, `series`, `repeticiones`, `num_dia`) VALUES(116, 2, 31, 4, 10, '3');
INSERT INTO `tbl_rutina_ejer` (`id_rutina_ejer`, `id_rutina`, `id_ejercicio`, `series`, `repeticiones`, `num_dia`) VALUES(117, 2, 73, 4, 10, '3');
INSERT INTO `tbl_rutina_ejer` (`id_rutina_ejer`, `id_rutina`, `id_ejercicio`, `series`, `repeticiones`, `num_dia`) VALUES(118, 2, 70, 4, 10, '3');
INSERT INTO `tbl_rutina_ejer` (`id_rutina_ejer`, `id_rutina`, `id_ejercicio`, `series`, `repeticiones`, `num_dia`) VALUES(119, 2, 68, 4, 10, '3');
INSERT INTO `tbl_rutina_ejer` (`id_rutina_ejer`, `id_rutina`, `id_ejercicio`, `series`, `repeticiones`, `num_dia`) VALUES(120, 2, 65, 4, 10, '3');
INSERT INTO `tbl_rutina_ejer` (`id_rutina_ejer`, `id_rutina`, `id_ejercicio`, `series`, `repeticiones`, `num_dia`) VALUES(121, 3, 74, 4, 10, '3');
INSERT INTO `tbl_rutina_ejer` (`id_rutina_ejer`, `id_rutina`, `id_ejercicio`, `series`, `repeticiones`, `num_dia`) VALUES(122, 3, 76, 4, 10, '3');
INSERT INTO `tbl_rutina_ejer` (`id_rutina_ejer`, `id_rutina`, `id_ejercicio`, `series`, `repeticiones`, `num_dia`) VALUES(123, 3, 13, 4, 10, '3');
INSERT INTO `tbl_rutina_ejer` (`id_rutina_ejer`, `id_rutina`, `id_ejercicio`, `series`, `repeticiones`, `num_dia`) VALUES(124, 3, 30, 4, 10, '3');
INSERT INTO `tbl_rutina_ejer` (`id_rutina_ejer`, `id_rutina`, `id_ejercicio`, `series`, `repeticiones`, `num_dia`) VALUES(125, 3, 25, 4, 10, '3');
INSERT INTO `tbl_rutina_ejer` (`id_rutina_ejer`, `id_rutina`, `id_ejercicio`, `series`, `repeticiones`, `num_dia`) VALUES(126, 3, 31, 4, 10, '3');
INSERT INTO `tbl_rutina_ejer` (`id_rutina_ejer`, `id_rutina`, `id_ejercicio`, `series`, `repeticiones`, `num_dia`) VALUES(127, 3, 73, 4, 10, '3');
INSERT INTO `tbl_rutina_ejer` (`id_rutina_ejer`, `id_rutina`, `id_ejercicio`, `series`, `repeticiones`, `num_dia`) VALUES(128, 3, 70, 4, 10, '3');
INSERT INTO `tbl_rutina_ejer` (`id_rutina_ejer`, `id_rutina`, `id_ejercicio`, `series`, `repeticiones`, `num_dia`) VALUES(129, 3, 68, 4, 10, '3');
INSERT INTO `tbl_rutina_ejer` (`id_rutina_ejer`, `id_rutina`, `id_ejercicio`, `series`, `repeticiones`, `num_dia`) VALUES(130, 4, 65, 4, 10, '3');
INSERT INTO `tbl_rutina_ejer` (`id_rutina_ejer`, `id_rutina`, `id_ejercicio`, `series`, `repeticiones`, `num_dia`) VALUES(131, 4, 74, 4, 10, '3');
INSERT INTO `tbl_rutina_ejer` (`id_rutina_ejer`, `id_rutina`, `id_ejercicio`, `series`, `repeticiones`, `num_dia`) VALUES(132, 4, 76, 4, 10, '3');
INSERT INTO `tbl_rutina_ejer` (`id_rutina_ejer`, `id_rutina`, `id_ejercicio`, `series`, `repeticiones`, `num_dia`) VALUES(133, 4, 13, 4, 10, '3');
INSERT INTO `tbl_rutina_ejer` (`id_rutina_ejer`, `id_rutina`, `id_ejercicio`, `series`, `repeticiones`, `num_dia`) VALUES(134, 4, 30, 4, 10, '3');
INSERT INTO `tbl_rutina_ejer` (`id_rutina_ejer`, `id_rutina`, `id_ejercicio`, `series`, `repeticiones`, `num_dia`) VALUES(135, 4, 25, 4, 10, '3');
INSERT INTO `tbl_rutina_ejer` (`id_rutina_ejer`, `id_rutina`, `id_ejercicio`, `series`, `repeticiones`, `num_dia`) VALUES(136, 4, 31, 4, 10, '3');
INSERT INTO `tbl_rutina_ejer` (`id_rutina_ejer`, `id_rutina`, `id_ejercicio`, `series`, `repeticiones`, `num_dia`) VALUES(137, 4, 73, 4, 10, '3');
INSERT INTO `tbl_rutina_ejer` (`id_rutina_ejer`, `id_rutina`, `id_ejercicio`, `series`, `repeticiones`, `num_dia`) VALUES(138, 4, 70, 4, 10, '3');
INSERT INTO `tbl_rutina_ejer` (`id_rutina_ejer`, `id_rutina`, `id_ejercicio`, `series`, `repeticiones`, `num_dia`) VALUES(139, 4, 68, 4, 10, '3');
INSERT INTO `tbl_rutina_ejer` (`id_rutina_ejer`, `id_rutina`, `id_ejercicio`, `series`, `repeticiones`, `num_dia`) VALUES(141, 5, 74, 4, 10, '3');
INSERT INTO `tbl_rutina_ejer` (`id_rutina_ejer`, `id_rutina`, `id_ejercicio`, `series`, `repeticiones`, `num_dia`) VALUES(142, 5, 76, 4, 10, '3');
INSERT INTO `tbl_rutina_ejer` (`id_rutina_ejer`, `id_rutina`, `id_ejercicio`, `series`, `repeticiones`, `num_dia`) VALUES(143, 5, 13, 4, 10, '3');
INSERT INTO `tbl_rutina_ejer` (`id_rutina_ejer`, `id_rutina`, `id_ejercicio`, `series`, `repeticiones`, `num_dia`) VALUES(144, 5, 30, 4, 10, '3');
INSERT INTO `tbl_rutina_ejer` (`id_rutina_ejer`, `id_rutina`, `id_ejercicio`, `series`, `repeticiones`, `num_dia`) VALUES(145, 5, 25, 4, 10, '3');
INSERT INTO `tbl_rutina_ejer` (`id_rutina_ejer`, `id_rutina`, `id_ejercicio`, `series`, `repeticiones`, `num_dia`) VALUES(146, 5, 31, 4, 10, '3');
INSERT INTO `tbl_rutina_ejer` (`id_rutina_ejer`, `id_rutina`, `id_ejercicio`, `series`, `repeticiones`, `num_dia`) VALUES(147, 5, 73, 4, 10, '3');
INSERT INTO `tbl_rutina_ejer` (`id_rutina_ejer`, `id_rutina`, `id_ejercicio`, `series`, `repeticiones`, `num_dia`) VALUES(148, 5, 70, 4, 10, '3');
INSERT INTO `tbl_rutina_ejer` (`id_rutina_ejer`, `id_rutina`, `id_ejercicio`, `series`, `repeticiones`, `num_dia`) VALUES(149, 5, 68, 4, 10, '3');
INSERT INTO `tbl_rutina_ejer` (`id_rutina_ejer`, `id_rutina`, `id_ejercicio`, `series`, `repeticiones`, `num_dia`) VALUES(150, 5, 65, 4, 10, '3');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_rutina_usuario`
--

DROP TABLE IF EXISTS `tbl_rutina_usuario`;
CREATE TABLE `tbl_rutina_usuario` (
  `id_rutina_usuario` int(11) NOT NULL,
  `fecha_inicio` text NOT NULL,
  `fecha_fin` text NOT NULL,
  `rutina_finalizada` varchar(2) NOT NULL DEFAULT 'no' COMMENT 'finalizada : si/no',
  `id_rutina` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `tbl_rutina_usuario`:
--   `id_rutina`
--       `tbl_rutina` -> `id_rutina`
--   `id_usuario`
--       `tbl_usuario` -> `id_usuario`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_tipo_cuerpo`
--

DROP TABLE IF EXISTS `tbl_tipo_cuerpo`;
CREATE TABLE `tbl_tipo_cuerpo` (
  `id_tipo_cuerpo` int(11) NOT NULL,
  `nombre_tipo_cuerpo` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `tbl_tipo_cuerpo`:
--

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
CREATE TABLE `tbl_tipo_ejercicio` (
  `id_tipo_ejercicio` int(11) NOT NULL,
  `nombre_tipo_ejercicio` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `tbl_tipo_ejercicio`:
--

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
CREATE TABLE `tbl_tipo_especialista` (
  `id_tipo_especialista` int(11) NOT NULL,
  `nombre_tipo_especialista` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `tbl_tipo_especialista`:
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_usuario`
--

DROP TABLE IF EXISTS `tbl_usuario`;
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
-- RELATIONS FOR TABLE `tbl_usuario`:
--   `id_objetivo`
--       `tbl_objetivo` -> `id_objetivo`
--   `id_objetivo`
--       `tbl_objetivo` -> `id_objetivo`
--   `id_tipo_cuerpo`
--       `tbl_tipo_cuerpo` -> `id_tipo_cuerpo`
--

--
-- Dumping data for table `tbl_usuario`
--

INSERT INTO `tbl_usuario` (`id_usuario`, `nombre_usuario`, `pass_usuario`, `email_usuario`, `sexo_usuario`, `apellidos_usuario`, `fecha_registro`, `altura_usuario`, `fecha_nacimiento`, `estado_usuario`, `id_objetivo`, `id_tipo_cuerpo`) VALUES(0, 'sergi', '3c9909afec25354d551dae21590bb26e38d53f2173b8d3dc3eee4c047e7ab1c1eb8b85103e3be7ba613b31bb5c9c36214dc9f14a42fd7a2fdb84856bca5c44c2', 'sergi@email.com', 'Hombre', 'sergi sergi', '2017-05-19', 170, '1996-02-06', 'Activo', 3, NULL);
INSERT INTO `tbl_usuario` (`id_usuario`, `nombre_usuario`, `pass_usuario`, `email_usuario`, `sexo_usuario`, `apellidos_usuario`, `fecha_registro`, `altura_usuario`, `fecha_nacimiento`, `estado_usuario`, `id_objetivo`, `id_tipo_cuerpo`) VALUES(1, 'marc', '3c9909afec25354d551dae21590bb26e38d53f2173b8d3dc3eee4c047e7ab1c1eb8b85103e3be7ba613b31bb5c9c36214dc9f14a42fd7a2fdb84856bca5c44c2', 'mpetit@gmail.com', 'Hombre', 'petit fernandez', '2017-05-09', 173, '1992-06-09', 'Activo', 5, NULL);
INSERT INTO `tbl_usuario` (`id_usuario`, `nombre_usuario`, `pass_usuario`, `email_usuario`, `sexo_usuario`, `apellidos_usuario`, `fecha_registro`, `altura_usuario`, `fecha_nacimiento`, `estado_usuario`, `id_objetivo`, `id_tipo_cuerpo`) VALUES(2, 'admin', 'c7ad44cbad762a5da0a452f9e854fdc1e0e7a52a38015f23f3eab1d80b931dd472634dfac71cd34ebc35d16ab7fb8a90c81f975113d6c7538dc69dd8de9077ec', 'admin@gmail.com', 'Hombre', 'petit fernandez', '2017-05-11', 173, '1992-09-16', 'Activo', 3, NULL);

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
  MODIFY `id_dieta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `tbl_dieta_usuario`
--
ALTER TABLE `tbl_dieta_usuario`
  MODIFY `id_dieta_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `tbl_ejercicio`
--
ALTER TABLE `tbl_ejercicio`
  MODIFY `id_ejercicio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;
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
  MODIFY `id_rutina_ejer` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=151;
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
