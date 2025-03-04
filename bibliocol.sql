-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 04-03-2025 a las 05:43:17
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bibliocol`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `devoluciones`
--

CREATE TABLE `devoluciones` (
  `id_devoluciones` int(100) NOT NULL,
  `id_usuario` int(100) NOT NULL,
  `id_prestamos` int(100) NOT NULL,
  `celular` int(50) NOT NULL,
  `Titulo` varchar(50) NOT NULL,
  `Fechadevo` date NOT NULL,
  `observaciones` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `donaciones`
--

CREATE TABLE `donaciones` (
  `id_donaciones` int(100) NOT NULL,
  `id_usuario` int(100) NOT NULL,
  `Titulo` varchar(100) NOT NULL,
  `autor` varchar(100) NOT NULL,
  `Genero` varchar(50) NOT NULL,
  `añopubli` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `donaciones`
--

INSERT INTO `donaciones` (`id_donaciones`, `id_usuario`, `Titulo`, `autor`, `Genero`, `añopubli`) VALUES
(1, 1, 'El principito', 'Antoine de Saint-Exupéry', 'Infantil', 1943);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `elimilibro`
--

CREATE TABLE `elimilibro` (
  `id_elimilibro` int(100) NOT NULL,
  `id_usuario` int(100) NOT NULL,
  `Titulo` varchar(100) NOT NULL,
  `Autor` varchar(100) NOT NULL,
  `copias` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prestamos`
--

CREATE TABLE `prestamos` (
  `id_prestamos` int(11) NOT NULL,
  `id_usuario` int(100) NOT NULL,
  `Celular` int(100) NOT NULL,
  `Titulo` varchar(100) NOT NULL,
  `FechaPresta` date NOT NULL,
  `FechaDevo` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `prestamos`
--

INSERT INTO `prestamos` (`id_prestamos`, `id_usuario`, `Celular`, `Titulo`, `FechaPresta`, `FechaDevo`) VALUES
(1, 1, 32167985, 'Satanas', '2025-03-03', '2025-03-31');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `regislibro`
--

CREATE TABLE `regislibro` (
  `id_regislibro` int(100) NOT NULL,
  `id_usuario` int(100) NOT NULL,
  `titulo` varchar(100) NOT NULL,
  `autor` varchar(100) NOT NULL,
  `copias` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `regislibro`
--

INSERT INTO `regislibro` (`id_regislibro`, `id_usuario`, `titulo`, `autor`, `copias`) VALUES
(1, 2, 'Satanas', 'Mario Mendoza', '26');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Contra` varchar(50) NOT NULL,
  `Rol` enum('Usuario','Administrador') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `Nombre`, `Email`, `Contra`, `Rol`) VALUES
(2, 'Jorge Lopez', 'Jornn7@gmail.com', 'jorff5%', 'Administrador'),
(1, 'Juana Perez', 'juan56@gmail.com', 'Jua56Jua', 'Usuario');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `devoluciones`
--
ALTER TABLE `devoluciones`
  ADD PRIMARY KEY (`id_devoluciones`),
  ADD KEY `id_usuario` (`id_usuario`,`id_prestamos`,`celular`,`Titulo`,`Fechadevo`,`observaciones`);

--
-- Indices de la tabla `donaciones`
--
ALTER TABLE `donaciones`
  ADD PRIMARY KEY (`id_donaciones`),
  ADD KEY `id_usuario` (`id_usuario`,`Titulo`,`autor`,`Genero`,`añopubli`);

--
-- Indices de la tabla `elimilibro`
--
ALTER TABLE `elimilibro`
  ADD PRIMARY KEY (`id_elimilibro`),
  ADD KEY `id_usuario` (`id_usuario`,`Titulo`,`Autor`,`copias`);

--
-- Indices de la tabla `prestamos`
--
ALTER TABLE `prestamos`
  ADD PRIMARY KEY (`id_prestamos`),
  ADD KEY `id_usuario` (`id_usuario`,`Celular`,`Titulo`,`FechaPresta`,`FechaDevo`);

--
-- Indices de la tabla `regislibro`
--
ALTER TABLE `regislibro`
  ADD PRIMARY KEY (`id_regislibro`),
  ADD KEY `id_usuario` (`id_usuario`,`titulo`,`autor`,`copias`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`),
  ADD KEY `Nombre` (`Nombre`,`Email`,`Contra`,`Rol`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
