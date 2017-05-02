-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 02-05-2017 a las 18:51:42
-- Versión del servidor: 10.1.13-MariaDB
-- Versión de PHP: 7.0.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bd_l2f`
--

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

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_objetivo`
--

CREATE TABLE `tbl_objetivo` (
  `id_objetivo` int(11) NOT NULL,
  `nombre_objetivo` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  `fecha_inicio` date NOT NULL,
  `fecha_final` date NOT NULL,
  `id_objetivo` int(11) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `id_especialista` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_tipo_ejercicio`
--

CREATE TABLE `tbl_tipo_ejercicio` (
  `id_tipo_ejercicio` int(11) NOT NULL,
  `nombre_tipo_ejercicio` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  MODIFY `id_historial_peso` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `tbl_objetivo`
--
ALTER TABLE `tbl_objetivo`
  MODIFY `id_objetivo` int(11) NOT NULL AUTO_INCREMENT;
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
  MODIFY `id_rutina` int(11) NOT NULL AUTO_INCREMENT;
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
  MODIFY `id_tipo_cuerpo` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `tbl_tipo_ejercicio`
--
ALTER TABLE `tbl_tipo_ejercicio`
  MODIFY `id_tipo_ejercicio` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `tbl_tipo_especialista`
--
ALTER TABLE `tbl_tipo_especialista`
  MODIFY `id_tipo_especialista` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `tbl_usuario`
--
ALTER TABLE `tbl_usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
