-- phpMyAdmin SQL Dump
-- version 5.1.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 05, 2023 at 05:06 AM
-- Server version: 5.7.24
-- PHP Version: 8.0.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_starts`
--

-- --------------------------------------------------------

--
-- Table structure for table `aviso`
--

CREATE TABLE `aviso` (
  `id` int(11) NOT NULL,
  `id_prod` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `aviso` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `carrito`
--

CREATE TABLE `carrito` (
  `id` int(11) NOT NULL,
  `vendido` enum('si','no') NOT NULL DEFAULT 'no',
  `fecha_vendido` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `categoria`
--

CREATE TABLE `categoria` (
  `id` int(11) NOT NULL,
  `categoria` tinytext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `comentarios`
--

CREATE TABLE `comentarios` (
  `id` int(11) NOT NULL,
  `id_prod` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `comentario` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `direccion`
--

CREATE TABLE `direccion` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `colonia` text NOT NULL,
  `cod_postal` int(11) NOT NULL,
  `municipio` text NOT NULL,
  `calle` text NOT NULL,
  `num_ext` int(11) NOT NULL,
  `num_int` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `fotos_perfil`
--

CREATE TABLE `fotos_perfil` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `imagen` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `imagenes`
--

CREATE TABLE `imagenes` (
  `id` int(11) NOT NULL,
  `id_prod` int(11) NOT NULL,
  `imagen` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `met_pago`
--

CREATE TABLE `met_pago` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `num_tarjeta` text NOT NULL,
  `nombre` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `municipios_jalisco`
--

CREATE TABLE `municipios_jalisco` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `municipios_jalisco`
--

INSERT INTO `municipios_jalisco` (`id`, `nombre`) VALUES
(1, 'Acatic'),
(2, 'Acatlán de Juárez'),
(3, 'Ahualulco de Mercado'),
(4, 'Amacueca'),
(5, 'Amatitán'),
(6, 'Ameca'),
(7, 'Arandas'),
(8, 'Atemajac de Brizuela'),
(9, 'Atengo'),
(10, 'Atenguillo'),
(11, 'Atotonilco el Alto'),
(12, 'Atoyac'),
(13, 'Autlán de Navarro'),
(14, 'Ayotlán'),
(15, 'Ayutla'),
(16, 'Bolaños'),
(17, 'Cabo Corrientes'),
(18, 'Cañadas de Obregón'),
(19, 'Casimiro Castillo'),
(20, 'Chapala'),
(21, 'Chimaltitán'),
(22, 'Chiquilistlán'),
(23, 'Cihuatlán'),
(24, 'Cocula'),
(25, 'Colotlán'),
(26, 'Concepción de Buenos Aires'),
(27, 'Cuautitlán de García Barragán'),
(28, 'Cuautla'),
(29, 'Cuquío'),
(30, 'Degollado'),
(31, 'Ejutla'),
(32, 'El Arenal'),
(33, 'El Grullo'),
(34, 'El Limón'),
(35, 'El Salto'),
(36, 'Encarnación de Díaz'),
(37, 'Etzatlán'),
(38, 'Gómez Farías'),
(39, 'Guachinango'),
(40, 'Guadalajara'),
(41, 'Hostotipaquillo'),
(42, 'Huejúcar'),
(43, 'Huejuquilla el Alto'),
(44, 'Ixtlahuacán de los Membrillos'),
(45, 'Ixtlahuacán del Río'),
(46, 'Jalostotitlán'),
(47, 'Jamay'),
(48, 'Jesús María'),
(49, 'Jilotlán de los Dolores'),
(50, 'Jocotepec'),
(51, 'Juanacatlán'),
(52, 'Juchitlán'),
(53, 'La Barca'),
(54, 'La Huerta'),
(55, 'La Manzanilla de la Paz'),
(56, 'Lagos de Moreno'),
(57, 'Magdalena'),
(58, 'Mascota'),
(59, 'Mazamitla'),
(60, 'Mexticacán'),
(61, 'Mezquitic'),
(62, 'Mixtlán'),
(63, 'Ocotlán'),
(64, 'Ojuelos de Jalisco'),
(65, 'Pihuamo'),
(66, 'Poncitlán'),
(67, 'Puerto Vallarta'),
(68, 'Quitupan'),
(69, 'San Cristóbal de la Barranca'),
(70, 'San Diego de Alejandría'),
(71, 'San Gabriel'),
(72, 'San Ignacio Cerro Gordo'),
(73, 'San Juan de los Lagos'),
(74, 'San Juanito de Escobedo'),
(75, 'San Julián'),
(76, 'San Marcos'),
(77, 'San Martín de Bolaños'),
(78, 'San Martín Hidalgo'),
(79, 'San Miguel el Alto'),
(80, 'San Sebastián del Oeste'),
(81, 'Santa María de los Ángeles'),
(82, 'Santa María del Oro'),
(83, 'Sayula'),
(84, 'Tala'),
(85, 'Talpa de Allende'),
(86, 'Tamazula de Gordiano'),
(87, 'Tapalpa'),
(88, 'Tecalitlán'),
(89, 'Techaluta de Montenegro'),
(90, 'Tecolotlán'),
(91, 'Tenamaxtlán'),
(92, 'Teocaltiche'),
(93, 'Teocuitatlán de Corona'),
(94, 'Tepatitlán de Morelos'),
(95, 'Tequila'),
(96, 'Teuchitlán'),
(97, 'Tizapán el Alto'),
(98, 'Tlajomulco de Zúñiga'),
(99, 'Tlaquepaque'),
(100, 'Tolimán'),
(101, 'Tomatlán'),
(102, 'Tonala'),
(103, 'Tonaya'),
(104, 'Totatiche'),
(105, 'Tototlán'),
(106, 'Tuxcacuesco'),
(107, 'Tuxcueca'),
(108, 'Tuxpan'),
(109, 'Unión de San Antonio'),
(110, 'Unión de Tula'),
(111, 'Valle de Guadalupe'),
(112, 'Valle de Juárez'),
(113, 'Villa Corona'),
(114, 'Villa Guerrero'),
(115, 'Villa Hidalgo'),
(116, 'Villa Purificación'),
(117, 'Yahualica de González Gallo'),
(118, 'Zacoalco de Torres'),
(119, 'Zapopan'),
(120, 'Zapotiltic'),
(121, 'Zapotitlán de Vadillo'),
(122, 'Zapotlán del Rey'),
(123, 'Zapotlán el Grande'),
(124, 'Zapotlanejo');

-- --------------------------------------------------------

--
-- Table structure for table `permisos`
--

CREATE TABLE `permisos` (
  `id` int(11) NOT NULL COMMENT 'Identificador de los permisos',
  `permiso` varchar(25) NOT NULL COMMENT 'Permiso que se le asignará a un rol',
  `descripcion` tinytext NOT NULL COMMENT 'Descripción del permiso'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `productos`
--

CREATE TABLE `productos` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `titulo` text NOT NULL,
  `descripcion` text NOT NULL,
  `existencia` int(11) NOT NULL,
  `precio` int(11) NOT NULL,
  `categoria` tinytext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `rel_car_prod`
--

CREATE TABLE `rel_car_prod` (
  `id_prod` int(11) NOT NULL,
  `id_car` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `rel_rol_permiso`
--

CREATE TABLE `rel_rol_permiso` (
  `id_permiso` int(11) NOT NULL,
  `id_rol` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `rel_user_car`
--

CREATE TABLE `rel_user_car` (
  `id_user` int(11) NOT NULL,
  `id_car` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL COMMENT 'Identificador de la tabla roles',
  `rol` varchar(25) NOT NULL COMMENT 'Rol que se le asignará a un usuario',
  `descripcion` tinytext NOT NULL COMMENT 'Descripción del rol'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `usuario`
--

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `nombre` text NOT NULL,
  `correo` text NOT NULL,
  `contraseña` text NOT NULL,
  `nombre_usuario` text NOT NULL,
  `f_nacimiento` date NOT NULL,
  `numero_tel` text NOT NULL,
  `activo_desde` datetime DEFAULT CURRENT_TIMESTAMP,
  `id_rol` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `aviso`
--
ALTER TABLE `aviso`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_prod` (`id_prod`),
  ADD KEY `fk_user` (`id_user`);

--
-- Indexes for table `carrito`
--
ALTER TABLE `carrito`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comentarios`
--
ALTER TABLE `comentarios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_prod` (`id_prod`),
  ADD KEY `fk_user` (`id_user`);

--
-- Indexes for table `direccion`
--
ALTER TABLE `direccion`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_user` (`id_user`),
  ADD KEY `fk_user` (`id_user`);

--
-- Indexes for table `fotos_perfil`
--
ALTER TABLE `fotos_perfil`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_user` (`id_user`),
  ADD KEY `fk_user` (`id_user`);

--
-- Indexes for table `imagenes`
--
ALTER TABLE `imagenes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_prod` (`id_prod`);

--
-- Indexes for table `met_pago`
--
ALTER TABLE `met_pago`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_user` (`id_user`);

--
-- Indexes for table `municipios_jalisco`
--
ALTER TABLE `municipios_jalisco`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permisos`
--
ALTER TABLE `permisos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_user` (`id_user`);

--
-- Indexes for table `rel_car_prod`
--
ALTER TABLE `rel_car_prod`
  ADD KEY `fk_prod` (`id_prod`),
  ADD KEY `fk_car` (`id_car`);

--
-- Indexes for table `rel_rol_permiso`
--
ALTER TABLE `rel_rol_permiso`
  ADD KEY `fk_permiso` (`id_permiso`),
  ADD KEY `fk_rol` (`id_rol`);

--
-- Indexes for table `rel_user_car`
--
ALTER TABLE `rel_user_car`
  ADD KEY `fk_user` (`id_user`),
  ADD KEY `fk_car` (`id_car`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_rol` (`id_rol`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `aviso`
--
ALTER TABLE `aviso`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `carrito`
--
ALTER TABLE `carrito`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `comentarios`
--
ALTER TABLE `comentarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `direccion`
--
ALTER TABLE `direccion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fotos_perfil`
--
ALTER TABLE `fotos_perfil`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `imagenes`
--
ALTER TABLE `imagenes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `met_pago`
--
ALTER TABLE `met_pago`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `municipios_jalisco`
--
ALTER TABLE `municipios_jalisco`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=125;

--
-- AUTO_INCREMENT for table `permisos`
--
ALTER TABLE `permisos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador de los permisos';

--
-- AUTO_INCREMENT for table `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador de la tabla roles';

--
-- AUTO_INCREMENT for table `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `rel_rol_permiso`
--
ALTER TABLE `rel_rol_permiso`
  ADD CONSTRAINT `fk_permiso` FOREIGN KEY (`id_permiso`) REFERENCES `permisos` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_rol` FOREIGN KEY (`id_rol`) REFERENCES `roles` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
