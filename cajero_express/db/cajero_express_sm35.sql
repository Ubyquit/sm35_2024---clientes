-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:8889
-- Tiempo de generación: 18-06-2024 a las 17:13:11
-- Versión del servidor: 5.7.39
-- Versión de PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `cajero_express_sm35`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_clientes`
--

CREATE TABLE `tb_clientes` (
  `id_cliente` int(11) NOT NULL,
  `nombre` varchar(25) DEFAULT NULL,
  `ap_paterno` varchar(25) DEFAULT NULL,
  `ap_materno` varchar(25) DEFAULT NULL,
  `estado` enum('Activo','Inactivo') DEFAULT 'Inactivo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tb_clientes`
--

INSERT INTO `tb_clientes` (`id_cliente`, `nombre`, `ap_paterno`, `ap_materno`, `estado`) VALUES
(1, 'Luis Fernando', 'Villafaña', 'Rejón', 'Inactivo');

--
-- Disparadores `tb_clientes`
--
DELIMITER $$
CREATE TRIGGER `tg_log_clientes_delete` BEFORE DELETE ON `tb_clientes` FOR EACH ROW BEGIN
INSERT INTO
    tb_log_clientes (accion, id_cliente, nombre_completo)
VALUES
    (
        'DELETE',
        OLD.id_cliente,
        CONCAT(
            OLD.nombre,
            ' ',
            OLD.ap_paterno,
            ' ',
            OLD.ap_materno
        )
    );
    END
$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER `tg_log_clientes_insert` AFTER INSERT ON `tb_clientes` FOR EACH ROW BEGIN
    INSERT INTO tb_log_clientes (accion, id_cliente, nombre_completo)
    VALUES ('INSERT', NEW.id_cliente, CONCAT(NEW.nombre, ' ', NEW.ap_paterno, ' ', NEW.ap_materno));
END
$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER `tg_log_clientes_update` AFTER UPDATE ON `tb_clientes` FOR EACH ROW BEGIN
INSERT INTO
    tb_log_clientes (accion, id_cliente, nombre_completo)
VALUES
    (
        'UPDATE',
        OLD.id_cliente,
        CONCAT(
            'viejo: ', OLD.nombre,' nuevo: ',NEW.nombre,
            ' ',
            'viejo: ', OLD.ap_paterno,' nuevo: ', NEW.ap_paterno,
            ' ',
            'viejo: ', OLD.ap_materno,' nuevo: ', NEW.ap_materno
        )
    );

END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `tg_login_cliente` AFTER UPDATE ON `tb_clientes` FOR EACH ROW BEGIN
IF NEW.estado = 'Activo' AND OLD.estado <> "Activo" THEN
INSERT INTO tb_log_clientes (accion, id_cliente, nombre_completo)
VALUES ('LOGIN', NEW.id_cliente,CONCAT(NEW.nombre, ' ', NEW.ap_paterno,' ', NEW.ap_materno));
END IF;
END
$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER `tg_logout_cliente` AFTER UPDATE ON `tb_clientes` FOR EACH ROW BEGIN
IF NEW.estado = 'Inactivo' AND OLD.estado <> "Inactivo" THEN
INSERT INTO tb_log_clientes (accion, id_cliente, nombre_completo)
VALUES ('LOGOUT', OLD.id_cliente, CONCAT(OLD.nombre, ' ', OLD.ap_paterno,' ', OLD.ap_materno));
END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_log_clientes`
--

CREATE TABLE `tb_log_clientes` (
  `id_log_cliente` int(11) NOT NULL,
  `accion` varchar(10) DEFAULT NULL,
  `id_cliente` int(11) DEFAULT NULL,
  `nombre_completo` varchar(250) DEFAULT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tb_log_clientes`
--

INSERT INTO `tb_log_clientes` (`id_log_cliente`, `accion`, `id_cliente`, `nombre_completo`, `fecha`) VALUES
(1, 'INSERT', 2, 'Bianca Eb Lizama', '2024-06-17 16:39:51'),
(2, 'UPDATE', 2, 'viejo: Bianca nuevo: Bianca Stefania viejo: Eb nuevo: Eb viejo: Lizama nuevo: Lizama', '2024-06-17 16:46:37'),
(3, 'DELETE', 2, 'Bianca Stefania Eb Lizama', '2024-06-17 16:52:20'),
(4, 'UPDATE', 1, 'viejo: Luis Fernando nuevo: Luis Fernando viejo: Villafaña nuevo: Villafaña viejo: Rejón nuevo: Rejón', '2024-06-18 16:57:25'),
(5, 'LOGIN', 1, 'Luis Fernando Villafaña Rejón', '2024-06-18 16:57:25'),
(6, 'UPDATE', 1, 'viejo: Luis Fernando nuevo: Luis Fernando viejo: Villafaña nuevo: Villafaña viejo: Rejón nuevo: Rejón', '2024-06-18 17:02:46'),
(7, 'LOGOUT', 1, 'Luis Fernando Villafaña Rejón', '2024-06-18 17:02:46'),
(8, 'UPDATE', 1, 'viejo: Luis Fernando nuevo: Luis Fernando viejo: Villafaña nuevo: Villafaña viejo: Rejón nuevo: Rejón', '2024-06-18 17:02:55'),
(9, 'LOGIN', 1, 'Luis Fernando Villafaña Rejón', '2024-06-18 17:02:55'),
(10, 'UPDATE', 1, 'viejo: Luis Fernando nuevo: Luis Fernando viejo: Villafaña nuevo: Villafaña viejo: Rejón nuevo: Rejón', '2024-06-18 17:03:03'),
(11, 'LOGOUT', 1, 'Luis Fernando Villafaña Rejón', '2024-06-18 17:03:03'),
(12, 'UPDATE', 1, 'viejo: Luis Fernando nuevo: Luis Fernando viejo: Villafaña nuevo: Villafaña viejo: Rejón nuevo: Rejón', '2024-06-18 17:04:47'),
(13, 'LOGIN', 1, 'Luis Fernando Villafaña Rejón', '2024-06-18 17:04:47'),
(14, 'UPDATE', 1, 'viejo: Luis Fernando nuevo: Luis Fernando viejo: Villafaña nuevo: Villafaña viejo: Rejón nuevo: Rejón', '2024-06-18 17:05:05'),
(15, 'LOGOUT', 1, 'Luis Fernando Villafaña Rejón', '2024-06-18 17:05:05');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_movimientos`
--

CREATE TABLE `tb_movimientos` (
  `id_movimiento` int(11) NOT NULL,
  `monto` decimal(7,2) DEFAULT NULL,
  `fecha_movimiento` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_tarjeta` int(11) DEFAULT NULL,
  `id_tipo_movimiento` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_tarjetas`
--

CREATE TABLE `tb_tarjetas` (
  `id_tarjeta` int(11) NOT NULL,
  `n_tarjeta` varchar(16) DEFAULT NULL,
  `nip` varchar(4) DEFAULT NULL,
  `saldo` decimal(20,2) DEFAULT NULL,
  `id_cliente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tb_tarjetas`
--

INSERT INTO `tb_tarjetas` (`id_tarjeta`, `n_tarjeta`, `nip`, `saldo`, `id_cliente`) VALUES
(1, '1234567890098765', '1234', '1000000.00', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_tipo_movimientos`
--

CREATE TABLE `tb_tipo_movimientos` (
  `id_tipo_movimiento` int(11) NOT NULL,
  `tipo` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tb_clientes`
--
ALTER TABLE `tb_clientes`
  ADD PRIMARY KEY (`id_cliente`);

--
-- Indices de la tabla `tb_log_clientes`
--
ALTER TABLE `tb_log_clientes`
  ADD PRIMARY KEY (`id_log_cliente`);

--
-- Indices de la tabla `tb_movimientos`
--
ALTER TABLE `tb_movimientos`
  ADD PRIMARY KEY (`id_movimiento`),
  ADD KEY `id_tarjeta` (`id_tarjeta`),
  ADD KEY `id_tipo_movimiento` (`id_tipo_movimiento`);

--
-- Indices de la tabla `tb_tarjetas`
--
ALTER TABLE `tb_tarjetas`
  ADD PRIMARY KEY (`id_tarjeta`),
  ADD KEY `id_cliente` (`id_cliente`);

--
-- Indices de la tabla `tb_tipo_movimientos`
--
ALTER TABLE `tb_tipo_movimientos`
  ADD PRIMARY KEY (`id_tipo_movimiento`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tb_clientes`
--
ALTER TABLE `tb_clientes`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `tb_log_clientes`
--
ALTER TABLE `tb_log_clientes`
  MODIFY `id_log_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `tb_movimientos`
--
ALTER TABLE `tb_movimientos`
  MODIFY `id_movimiento` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tb_tarjetas`
--
ALTER TABLE `tb_tarjetas`
  MODIFY `id_tarjeta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `tb_tipo_movimientos`
--
ALTER TABLE `tb_tipo_movimientos`
  MODIFY `id_tipo_movimiento` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `tb_movimientos`
--
ALTER TABLE `tb_movimientos`
  ADD CONSTRAINT `tb_movimientos_ibfk_1` FOREIGN KEY (`id_tarjeta`) REFERENCES `tb_tarjetas` (`id_tarjeta`),
  ADD CONSTRAINT `tb_movimientos_ibfk_2` FOREIGN KEY (`id_tipo_movimiento`) REFERENCES `tb_tipo_movimientos` (`id_tipo_movimiento`);

--
-- Filtros para la tabla `tb_tarjetas`
--
ALTER TABLE `tb_tarjetas`
  ADD CONSTRAINT `tb_tarjetas_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `tb_clientes` (`id_cliente`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
