-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         5.5.5-10.0.7-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             8.2.0.4675
-- Author:                       Antonio Vila Juan
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Volcando estructura de base de datos para gestion_2014
CREATE DATABASE IF NOT EXISTS `gestion_2014` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `gestion_2014`;


-- Volcando estructura para tabla gestion_2014.alm_almacen
CREATE TABLE IF NOT EXISTS `alm_almacen` (
  `Codigo` int(10) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) NOT NULL,
  `Direccion` varchar(100) DEFAULT NULL,
  `Contacto` varchar(50) DEFAULT NULL,
  `Telefono` varchar(50) DEFAULT NULL,
  `Movil` varchar(50) DEFAULT NULL,
  `Fax` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `Observaciones` mediumtext,
  `Poblacion` varchar(10) DEFAULT NULL,
  `FechaCreacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `FechaModificacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Codigo`),
  KEY `fk_almacen_poblacion` (`Poblacion`),
  CONSTRAINT `fk_almacen_poblacion` FOREIGN KEY (`Poblacion`) REFERENCES `mtr_poblacion` (`Codigo`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla gestion_2014.alm_articulo
CREATE TABLE IF NOT EXISTS `alm_articulo` (
  `Codigo` varchar(12) NOT NULL,
  `Nombre` varchar(100) NOT NULL,
  `Ult_Pre_Com` decimal(16,6) DEFAULT NULL,
  `Precio_Compra` decimal(16,6) DEFAULT NULL,
  `Por_Beneficio` decimal(4,2) DEFAULT NULL,
  `Imp_Beneficio` decimal(16,6) DEFAULT NULL,
  `Precio_Venta` decimal(16,6) DEFAULT NULL,
  `Precio_Venta_con_Iva` decimal(16,6) DEFAULT NULL,
  `Coste_Materia` decimal(16,6) DEFAULT NULL,
  `Coste_Mano_Obra` decimal(16,6) DEFAULT NULL,
  `Precio_Coste` decimal(16,6) DEFAULT NULL,
  `Por_S_Coste` decimal(4,2) DEFAULT NULL,
  `Imp_S_Coste` decimal(16,6) DEFAULT NULL,
  `Precio_Venta_Estimado` decimal(16,6) DEFAULT NULL,
  `Observaciones` mediumtext,
  `Stock_Minimo` decimal(12,2) DEFAULT NULL,
  `Stock_Maximo` decimal(12,2) DEFAULT NULL,
  `Ubicacion` varchar(50) DEFAULT NULL,
  `Codigo_Barras` varchar(50) DEFAULT NULL,
  `Descatalogado` tinyint(4) DEFAULT NULL,
  `Precio_Millar` tinyint(4) DEFAULT NULL,
  `Codigo_Cliente` varchar(50) DEFAULT NULL,
  `Codigo_Proveedor` varchar(50) DEFAULT NULL,
  `Familia1` varchar(5) DEFAULT NULL,
  `Familia2` varchar(5) DEFAULT NULL,
  `Familia3` varchar(5) DEFAULT NULL,
  `Almacen` int(11) DEFAULT NULL,
  `Seccion` int(11) DEFAULT NULL,
  `Material` int(11) DEFAULT NULL,
  `Unidad_Medida` int(11) DEFAULT NULL,
  `FechaCreacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `FechaModificacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Codigo`),
  KEY `fk_articulo_familia1` (`Familia1`),
  KEY `fk_articulo_familia3` (`Familia3`),
  KEY `fk_articulo_familia2` (`Familia2`),
  KEY `fk_articulo_almacen` (`Almacen`),
  KEY `fk_articulo_seccion` (`Seccion`),
  KEY `fk_articulo_material` (`Material`),
  KEY `fk_articulo_unidad_medida` (`Unidad_Medida`),
  CONSTRAINT `fk_articulo_almacen` FOREIGN KEY (`Almacen`) REFERENCES `alm_almacen` (`Codigo`) ON UPDATE CASCADE,
  CONSTRAINT `fk_articulo_familia1` FOREIGN KEY (`Familia1`) REFERENCES `alm_articulo_familia` (`Codigo`) ON UPDATE CASCADE,
  CONSTRAINT `fk_articulo_familia2` FOREIGN KEY (`Familia2`) REFERENCES `alm_articulo_familia` (`Codigo`) ON UPDATE CASCADE,
  CONSTRAINT `fk_articulo_familia3` FOREIGN KEY (`Familia3`) REFERENCES `alm_articulo_familia` (`Codigo`) ON UPDATE CASCADE,
  CONSTRAINT `fk_articulo_material` FOREIGN KEY (`Material`) REFERENCES `mtr_material` (`Codigo`) ON UPDATE CASCADE,
  CONSTRAINT `fk_articulo_seccion` FOREIGN KEY (`Seccion`) REFERENCES `mtr_seccion` (`Codigo`) ON UPDATE CASCADE,
  CONSTRAINT `fk_articulo_unidad_medida` FOREIGN KEY (`Unidad_Medida`) REFERENCES `mtr_unidades_medida` (`Codigo`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla gestion_2014.alm_articulo_familia
CREATE TABLE IF NOT EXISTS `alm_articulo_familia` (
  `Codigo` varchar(5) NOT NULL,
  `Nombre` varchar(100) NOT NULL,
  `Beneficio` decimal(4,2) DEFAULT NULL,
  `FechaCreacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `FechaModificacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla gestion_2014.alm_articulo_medida
CREATE TABLE IF NOT EXISTS `alm_articulo_medida` (
  `Articulo` varchar(12) NOT NULL,
  `Unidades` int(10) DEFAULT NULL,
  `Medidas` int(10) DEFAULT NULL,
  `Peso_Neto_Embalaje` decimal(10,3) DEFAULT NULL,
  `Peso_Bruto_Embalaje` decimal(10,3) DEFAULT NULL,
  `Alto_Embalaje` decimal(10,2) DEFAULT NULL,
  `Largo_Embalaje` decimal(10,2) DEFAULT NULL,
  `Ancho_Embalaje` decimal(10,2) DEFAULT NULL,
  `Volumen_Embalaje` decimal(10,3) DEFAULT NULL,
  `Peso_Neto_Articulo` decimal(10,3) DEFAULT NULL,
  `Peso_Bruto_Articulo` decimal(10,3) DEFAULT NULL,
  `Alto_Articulo` decimal(10,2) DEFAULT NULL,
  `Largo_Articulo` decimal(10,2) DEFAULT NULL,
  `Ancho_Articulo` decimal(10,2) DEFAULT NULL,
  `Volumen_Articulo` decimal(10,3) DEFAULT NULL,
  `FechaCreacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `FechaModificacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Articulo`),
  CONSTRAINT `fk_media_articulo` FOREIGN KEY (`Articulo`) REFERENCES `alm_articulo` (`Codigo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla gestion_2014.alm_escandallo
CREATE TABLE IF NOT EXISTS `alm_escandallo` (
  `Articulo` varchar(12) NOT NULL,
  `Componente` varchar(12) NOT NULL,
  `Cantidad` decimal(16,6) DEFAULT NULL,
  `Precio` decimal(16,6) DEFAULT NULL,
  `Importe` decimal(16,6) DEFAULT NULL,
  PRIMARY KEY (`Articulo`,`Componente`),
  KEY `fk_componente_articulo` (`Componente`),
  CONSTRAINT `fk_articulo_articulo` FOREIGN KEY (`Articulo`) REFERENCES `alm_articulo` (`Codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_componente_articulo` FOREIGN KEY (`Componente`) REFERENCES `alm_articulo` (`Codigo`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla gestion_2014.alm_movimiento
CREATE TABLE IF NOT EXISTS `alm_movimiento` (
  `Codigo` int(10) NOT NULL AUTO_INCREMENT,
  `Articulo` varchar(12) DEFAULT NULL,
  `Cantidad` decimal(10,2) unsigned DEFAULT NULL,
  `Precio` decimal(10,6) unsigned DEFAULT NULL,
  `Importe` decimal(10,2) unsigned DEFAULT NULL,
  `Tipo` int(10) DEFAULT NULL,
  `FechaCreacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `FechaModifiacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Codigo`),
  KEY `fk_movimiento_articulo` (`Articulo`),
  CONSTRAINT `fk_movimiento_articulo` FOREIGN KEY (`Articulo`) REFERENCES `alm_articulo` (`Codigo`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla gestion_2014.alm_movimiento_tipo
CREATE TABLE IF NOT EXISTS `alm_movimiento_tipo` (
  `Codigo` int(10) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(50) NOT NULL DEFAULT '0',
  `FechaCreacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `FechaModificacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla gestion_2014.alm_stock
CREATE TABLE IF NOT EXISTS `alm_stock` (
  `almacen` int(10) NOT NULL,
  `articulo` varchar(12) NOT NULL,
  `entidad` varchar(10) NOT NULL COMMENT 'entidad 0 todas las entidades',
  `stock` decimal(16,2) DEFAULT NULL,
  `Stock_Disponible` decimal(16,2) DEFAULT NULL COMMENT 'Stock - pendiente venta + pendiente compra',
  `pedido_venta` decimal(16,2) DEFAULT NULL,
  `servido_venta` decimal(16,2) DEFAULT NULL,
  `pendiente_venta` decimal(16,2) DEFAULT NULL,
  `pedido_compra` decimal(16,2) DEFAULT NULL,
  `servido_compra` decimal(16,2) DEFAULT NULL,
  `pendiente_compra` decimal(16,2) DEFAULT NULL,
  `FechaCreacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `FechaModificacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`almacen`,`articulo`,`entidad`),
  KEY `fk_stock_articulo` (`articulo`),
  KEY `fk_stock_entidad` (`entidad`),
  KEY `fk_stock_almacen` (`almacen`),
  CONSTRAINT `fk_stock_almacen` FOREIGN KEY (`almacen`) REFERENCES `alm_almacen` (`Codigo`) ON UPDATE CASCADE,
  CONSTRAINT `fk_stock_articulo` FOREIGN KEY (`articulo`) REFERENCES `alm_articulo` (`Codigo`) ON UPDATE CASCADE,
  CONSTRAINT `fk_stock_entidad` FOREIGN KEY (`entidad`) REFERENCES `mtr_entidad` (`Codigo`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla gestion_2014.alm_tarifa_venta
CREATE TABLE IF NOT EXISTS `alm_tarifa_venta` (
  `Articulo` varchar(12) NOT NULL,
  `Tarifa` int(10) NOT NULL,
  `Precio` decimal(15,4) DEFAULT NULL,
  `FechaCreacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `FechaModificacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Tarifa`,`Articulo`),
  KEY `fk_tarifa_venta_articulo` (`Articulo`),
  KEY `fk_tarifa_venta_tarifa` (`Tarifa`),
  CONSTRAINT `fk_tarifa_venta_articulo` FOREIGN KEY (`Articulo`) REFERENCES `alm_articulo` (`Codigo`) ON UPDATE CASCADE,
  CONSTRAINT `fk_tarifa_venta_tarifa` FOREIGN KEY (`Tarifa`) REFERENCES `mtr_tarifa` (`Codigo`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla gestion_2014.emp_canal
CREATE TABLE IF NOT EXISTS `emp_canal` (
  `Codigo` int(10) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `FechaCreacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `FechaModificacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla gestion_2014.emp_contador
CREATE TABLE IF NOT EXISTS `emp_contador` (
  `serie` int(10) NOT NULL,
  `ejercicio` int(10) NOT NULL,
  `VPresupuesto` int(10) DEFAULT '0',
  `VProforma` int(10) DEFAULT '0',
  `VPedido` int(10) DEFAULT '0',
  `VAlbaran` int(10) DEFAULT '0',
  `VFactura` int(10) DEFAULT '0',
  `CPedido` int(10) DEFAULT '0',
  `CAlbaran` int(10) DEFAULT '0',
  `CFactura` int(10) DEFAULT '0',
  `FechaCreacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `FechaModificacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`serie`,`ejercicio`),
  KEY `fk_contador_ejercicio` (`ejercicio`),
  KEY `fk_contador_serie` (`serie`),
  CONSTRAINT `fk_contador_ejercicio` FOREIGN KEY (`ejercicio`) REFERENCES `emp_ejercicio` (`Codigo`) ON UPDATE CASCADE,
  CONSTRAINT `fk_contador_serie` FOREIGN KEY (`serie`) REFERENCES `emp_serie` (`Codigo`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla gestion_2014.emp_ejercicio
CREATE TABLE IF NOT EXISTS `emp_ejercicio` (
  `Codigo` int(10) NOT NULL AUTO_INCREMENT COMMENT 'Será el ejercicio',
  `FechaDesde` date NOT NULL,
  `FechaHasta` date NOT NULL,
  `FechaCreacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `FechaModificacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla gestion_2014.emp_empresa
CREATE TABLE IF NOT EXISTS `emp_empresa` (
  `Codigo` int(10) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) NOT NULL,
  `Comercial` varchar(100) DEFAULT NULL,
  `Dirección` varchar(100) DEFAULT NULL,
  `Telefono` varchar(50) DEFAULT NULL,
  `Movil` varchar(50) DEFAULT NULL,
  `Fax` varchar(50) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Web` varchar(100) DEFAULT NULL,
  `CIF` varchar(15) DEFAULT NULL,
  `Poblacion` varchar(10) DEFAULT NULL,
  `iva` int(10) DEFAULT NULL,
  `FechaCreacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `FechaModificacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Codigo`),
  KEY `EMP_EMPRESA_FKIndex1` (`iva`),
  KEY `fk_empresa_ciudad` (`Poblacion`),
  CONSTRAINT `fk_empresa_iva` FOREIGN KEY (`iva`) REFERENCES `mtr_iva` (`codigo`) ON UPDATE CASCADE,
  CONSTRAINT `fk_empresa_poblacion` FOREIGN KEY (`Poblacion`) REFERENCES `mtr_poblacion` (`Codigo`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla gestion_2014.emp_serie
CREATE TABLE IF NOT EXISTS `emp_serie` (
  `Codigo` int(10) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) NOT NULL,
  `Exenta` tinyint(4) NOT NULL DEFAULT '0',
  `FechaCreacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `FechaModificacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla gestion_2014.ges_cab_ped_ven
CREATE TABLE IF NOT EXISTS `ges_cab_ped_ven` (
  `Codigo` int(10) NOT NULL AUTO_INCREMENT,
  `Ejercicio` int(10) NOT NULL,
  `Serie` int(10) NOT NULL,
  `Canal` int(10) NOT NULL,
  `Pedido` int(10) NOT NULL,
  `TipoIva_1` int(10) NOT NULL,
  `TipoIva_2` int(10) NOT NULL,
  `TipoIva_3` int(10) NOT NULL,
  `Entidad` varchar(10) NOT NULL,
  `DireccionEnvio` int(11) NOT NULL,
  `FormaPago` varchar(3) NOT NULL,
  `AgenciaTransporte` int(11) NOT NULL,
  `FechaPedido` date DEFAULT NULL,
  `FechaServicio` date DEFAULT NULL,
  `Nombre` varchar(100) NOT NULL,
  `Suma1` decimal(16,2) DEFAULT NULL,
  `Suma2` decimal(16,2) DEFAULT NULL,
  `Suma3` decimal(16,2) DEFAULT NULL,
  `Dto` decimal(4,2) DEFAULT NULL,
  `Imp_Dto_Com1` decimal(16,2) DEFAULT NULL,
  `Imp_Dto_Com2` decimal(16,2) DEFAULT NULL,
  `Imp_Dto_Com3` decimal(16,2) DEFAULT NULL,
  `Dto_pp` decimal(4,2) DEFAULT NULL,
  `Imp_Dto_pp1` decimal(16,2) DEFAULT NULL,
  `Imp_Dto_pp2` decimal(16,2) DEFAULT NULL,
  `Imp_Dto_pp3` decimal(16,2) DEFAULT NULL,
  `Base1` decimal(16,2) DEFAULT NULL,
  `Base2` decimal(16,2) DEFAULT NULL,
  `Base3` decimal(16,2) DEFAULT NULL,
  `Iva1` decimal(16,2) DEFAULT NULL,
  `Iva2` decimal(16,2) DEFAULT NULL,
  `Iva3` decimal(16,2) DEFAULT NULL,
  `RE1` decimal(16,2) DEFAULT NULL,
  `RE2` decimal(16,2) DEFAULT NULL,
  `RE3` decimal(16,2) DEFAULT NULL,
  `Total1` decimal(16,2) DEFAULT NULL,
  `Total2` decimal(16,2) DEFAULT NULL,
  `Total3` decimal(16,2) DEFAULT NULL,
  `Servido` tinyint(4) NOT NULL DEFAULT '0',
  `Observaciones` mediumtext,
  `FechaCreacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `FechaModificacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Ejercicio`,`Serie`,`Canal`,`Pedido`),
  UNIQUE KEY `Id` (`Codigo`),
  KEY `fk_cab_ped_ven_serie` (`Serie`),
  KEY `fk_cab_ped_ven_canal` (`Canal`),
  KEY `fk_cab_ped_ven_ejercicio` (`Ejercicio`),
  KEY `fk_cab_ped_ven_tipoiva1` (`TipoIva_1`),
  KEY `fk_cab_ped_ven_tipoiva2` (`TipoIva_2`),
  KEY `fk_cab_ped_ven_tipoiva3` (`TipoIva_3`),
  KEY `fk_cab_ped_ven_entidad` (`Entidad`),
  KEY `fk_cab_ped_ven_direccion_envio` (`DireccionEnvio`),
  KEY `fk_cab_ped_ven_formapago` (`FormaPago`),
  KEY `fk_cab_ped_ven_agenciatransporte` (`AgenciaTransporte`),
  CONSTRAINT `fk_cab_ped_ven_agenciatransporte` FOREIGN KEY (`AgenciaTransporte`) REFERENCES `mtr_agencia_transporte` (`Codigo`) ON UPDATE CASCADE,
  CONSTRAINT `fk_cab_ped_ven_canal` FOREIGN KEY (`Canal`) REFERENCES `emp_canal` (`Codigo`) ON UPDATE CASCADE,
  CONSTRAINT `fk_cab_ped_ven_direccion_envio` FOREIGN KEY (`DireccionEnvio`) REFERENCES `mtr_entidad_direccion` (`Codigo`) ON UPDATE CASCADE,
  CONSTRAINT `fk_cab_ped_ven_ejercicio` FOREIGN KEY (`Ejercicio`) REFERENCES `emp_ejercicio` (`Codigo`) ON UPDATE CASCADE,
  CONSTRAINT `fk_cab_ped_ven_entidad` FOREIGN KEY (`Entidad`) REFERENCES `mtr_entidad` (`Codigo`) ON UPDATE CASCADE,
  CONSTRAINT `fk_cab_ped_ven_formapago` FOREIGN KEY (`FormaPago`) REFERENCES `mtr_forma_pago` (`Codigo`) ON UPDATE CASCADE,
  CONSTRAINT `fk_cab_ped_ven_serie` FOREIGN KEY (`Serie`) REFERENCES `emp_serie` (`Codigo`) ON UPDATE CASCADE,
  CONSTRAINT `fk_cab_ped_ven_tipoiva1` FOREIGN KEY (`TipoIva_1`) REFERENCES `mtr_iva` (`codigo`) ON UPDATE CASCADE,
  CONSTRAINT `fk_cab_ped_ven_tipoiva2` FOREIGN KEY (`TipoIva_2`) REFERENCES `mtr_iva` (`codigo`) ON UPDATE CASCADE,
  CONSTRAINT `fk_cab_ped_ven_tipoiva3` FOREIGN KEY (`TipoIva_3`) REFERENCES `mtr_iva` (`codigo`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla gestion_2014.ges_det_ped_ven
CREATE TABLE IF NOT EXISTS `ges_det_ped_ven` (
  `Codigo` int(10) NOT NULL AUTO_INCREMENT,
  `articulo` varchar(12) NOT NULL,
  `Descripcion` varchar(100) NOT NULL,
  `Cantidad` decimal(16,2) NOT NULL,
  `Precio` decimal(16,6) NOT NULL,
  `Dto` decimal(4,2) NOT NULL,
  `ImpDto` decimal(16,2) NOT NULL,
  `Importe` decimal(16,2) NOT NULL,
  `cabecera_id` int(10) NOT NULL,
  PRIMARY KEY (`Codigo`),
  KEY `fk_ges_det_ped_ven_articulo` (`articulo`),
  KEY `fk_ges_det_ped_ven_cabecera` (`cabecera_id`),
  CONSTRAINT `fk_ges_det_ped_ven_articulo` FOREIGN KEY (`articulo`) REFERENCES `alm_articulo` (`Codigo`) ON UPDATE CASCADE,
  CONSTRAINT `fk_ges_det_ped_ven_cabecera` FOREIGN KEY (`cabecera_id`) REFERENCES `ges_cab_ped_ven` (`Codigo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla gestion_2014.mtr_agencia_transporte
CREATE TABLE IF NOT EXISTS `mtr_agencia_transporte` (
  `Codigo` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) NOT NULL,
  `Direccion` varchar(100) DEFAULT NULL,
  `Contacto` varchar(50) DEFAULT NULL,
  `Telefono` varchar(50) DEFAULT NULL,
  `Movil` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `web` varchar(100) DEFAULT NULL,
  `Poblacion` varchar(10) DEFAULT NULL,
  `Observaciones` mediumtext,
  PRIMARY KEY (`Codigo`),
  KEY `fk_agencia_transporte_poblacion` (`Poblacion`),
  CONSTRAINT `fk_agencia_transporte_poblacion` FOREIGN KEY (`Poblacion`) REFERENCES `mtr_poblacion` (`Codigo`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla gestion_2014.mtr_agente_tarifa
CREATE TABLE IF NOT EXISTS `mtr_agente_tarifa` (
  `Codigo` int(10) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) NOT NULL,
  `FechaCreacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `FechaModificacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla gestion_2014.mtr_banco
CREATE TABLE IF NOT EXISTS `mtr_banco` (
  `Codigo` int(10) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) NOT NULL,
  `Direccion` varchar(100) DEFAULT NULL,
  `Telefono` varchar(100) DEFAULT NULL,
  `Fax` varchar(100) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Contacto` varchar(100) DEFAULT NULL,
  `CCC` varchar(20) DEFAULT NULL,
  `IBAN` varchar(35) DEFAULT NULL,
  `BIC` varchar(11) DEFAULT NULL,
  `Poblacion` varchar(10) DEFAULT NULL,
  `FechaCreacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `FechaModificacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Codigo`),
  KEY `fk_banco_poblacion` (`Poblacion`),
  CONSTRAINT `fk_banco_poblacion` FOREIGN KEY (`Poblacion`) REFERENCES `mtr_poblacion` (`Codigo`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla gestion_2014.mtr_comunidad_autonoma
CREATE TABLE IF NOT EXISTS `mtr_comunidad_autonoma` (
  `Codigo` int(10) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) NOT NULL,
  `FechaCreacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `FechaModificacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla gestion_2014.mtr_entidad
CREATE TABLE IF NOT EXISTS `mtr_entidad` (
  `Codigo` varchar(10) NOT NULL,
  `Agente` varchar(10) DEFAULT NULL,
  `Serie` int(10) DEFAULT NULL,
  `Tarifa` int(10) DEFAULT NULL,
  `Ingreso` int(10) DEFAULT NULL,
  `Zona` int(10) DEFAULT NULL,
  `ComunidadAutonoma` int(10) DEFAULT NULL,
  `FormaPago` varchar(3) DEFAULT NULL,
  `Familia` int(10) DEFAULT NULL,
  `Poblacion` varchar(10) DEFAULT NULL,
  `CIF` varchar(15) NOT NULL,
  `Nombre` varchar(100) NOT NULL,
  `Nombre_Comercial` varchar(100) DEFAULT NULL,
  `Direccion` varchar(100) DEFAULT NULL,
  `Telefono` varchar(20) DEFAULT NULL,
  `Movil` varchar(20) DEFAULT NULL,
  `Fax` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `PagWeb` varchar(100) DEFAULT NULL,
  `EsCliente` bit(1) DEFAULT NULL,
  `EsProveedor` bit(1) DEFAULT NULL,
  `EsAgente` bit(1) DEFAULT NULL,
  `DiaPag1` int(10) unsigned DEFAULT NULL,
  `DiaPag2` int(10) unsigned DEFAULT NULL,
  `Dtopp` decimal(4,2) DEFAULT NULL,
  `DtoLin1` decimal(4,2) DEFAULT NULL,
  `DtoLin2` decimal(4,2) DEFAULT NULL,
  `DtoLin3` decimal(4,2) DEFAULT NULL,
  `DtoLin4` decimal(4,2) DEFAULT NULL,
  `Apdo` varchar(20) DEFAULT NULL,
  `AgeCom` decimal(4,2) DEFAULT NULL,
  `RieRef` varchar(20) DEFAULT NULL COMMENT 'Referencia Riesgo',
  `RieAse` decimal(12,2) DEFAULT NULL COMMENT 'Riesgo Asegurado',
  `RiePed` decimal(12,2) DEFAULT NULL COMMENT 'Riesgo Pedido',
  `RieFec` date DEFAULT NULL COMMENT 'Fecha petición riesgo',
  `Remesar` bit(1) DEFAULT NULL,
  `RecEqu` bit(1) DEFAULT NULL,
  `Retencion` bit(1) DEFAULT NULL,
  `Valorar_Albaranes` bit(1) DEFAULT NULL COMMENT 'Valorar albarán',
  `Agrupar_Facturas` bit(1) DEFAULT NULL COMMENT 'Agrupar facturas',
  `Sin_Actividad` bit(1) DEFAULT NULL COMMENT 'Sin Actividad',
  `Entidad_Disuelta` bit(1) DEFAULT NULL COMMENT 'Empresa Disuelta',
  `Peligro_Impago` bit(1) DEFAULT NULL COMMENT 'Peligro impago',
  `Contacto` varchar(100) DEFAULT NULL,
  `Observaciones` mediumtext,
  `FechaCreacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `FechaModificacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Codigo`),
  UNIQUE KEY `Clientes_CIF` (`CIF`),
  KEY `Clientes_FKPoblacion` (`Poblacion`),
  KEY `Entidad_FKTarifa` (`Tarifa`),
  KEY `fk_entidad_com_aut` (`ComunidadAutonoma`),
  KEY `fk_entidad_zona` (`Zona`),
  KEY `fk_entidad_formapago` (`FormaPago`),
  KEY `fk_entidad_ingreso` (`Ingreso`),
  KEY `fk_entidad_familia` (`Familia`),
  KEY `fk_entidad_serie` (`Serie`),
  KEY `fk_entidad_agente` (`Agente`),
  CONSTRAINT `fk_entidad_agente` FOREIGN KEY (`Agente`) REFERENCES `mtr_entidad` (`Codigo`) ON UPDATE CASCADE,
  CONSTRAINT `fk_entidad_com_aut` FOREIGN KEY (`ComunidadAutonoma`) REFERENCES `mtr_comunidad_autonoma` (`Codigo`) ON UPDATE CASCADE,
  CONSTRAINT `fk_entidad_familia` FOREIGN KEY (`Familia`) REFERENCES `mtr_entidad_familia` (`Codigo`) ON UPDATE CASCADE,
  CONSTRAINT `fk_entidad_formapago` FOREIGN KEY (`FormaPago`) REFERENCES `mtr_forma_pago` (`Codigo`) ON UPDATE CASCADE,
  CONSTRAINT `fk_entidad_ingreso` FOREIGN KEY (`Ingreso`) REFERENCES `mtr_ingreso` (`Codigo`) ON UPDATE CASCADE,
  CONSTRAINT `fk_entidad_serie` FOREIGN KEY (`Serie`) REFERENCES `emp_serie` (`Codigo`) ON UPDATE CASCADE,
  CONSTRAINT `fk_entidad_tarifa` FOREIGN KEY (`Tarifa`) REFERENCES `mtr_tarifa` (`Codigo`) ON UPDATE CASCADE,
  CONSTRAINT `fk_entidad_zona` FOREIGN KEY (`Zona`) REFERENCES `mtr_zona` (`Codigo`) ON UPDATE CASCADE,
  CONSTRAINT `mtr_entidad_poblacion` FOREIGN KEY (`Poblacion`) REFERENCES `mtr_poblacion` (`Codigo`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla gestion_2014.mtr_entidad_banco
CREATE TABLE IF NOT EXISTS `mtr_entidad_banco` (
  `Codigo` int(10) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) NOT NULL,
  `Direccion` varchar(100) DEFAULT NULL,
  `Telefono` varchar(100) DEFAULT NULL,
  `Fax` varchar(100) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Contacto` varchar(100) DEFAULT NULL,
  `CCC` varchar(20) DEFAULT NULL,
  `IBAN` varchar(35) DEFAULT NULL,
  `BIC` varchar(11) DEFAULT NULL,
  `Principal` bit(1) DEFAULT NULL,
  `Entidad` varchar(10) NOT NULL,
  `Poblacion` varchar(10) DEFAULT NULL,
  `FechaCreacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `FechaModificacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Codigo`),
  KEY `EntBan_FKPoblacion` (`Poblacion`),
  KEY `EntBan_FKEntidad` (`Entidad`),
  CONSTRAINT `mtr_entidad_banco_entidad` FOREIGN KEY (`Entidad`) REFERENCES `mtr_entidad` (`Codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `mtr_entidad_banco_poblacion` FOREIGN KEY (`Poblacion`) REFERENCES `mtr_poblacion` (`Codigo`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla gestion_2014.mtr_entidad_contable
CREATE TABLE IF NOT EXISTS `mtr_entidad_contable` (
  `Codigo` varchar(10) NOT NULL,
  `Cta_Cliente` varchar(12) DEFAULT NULL,
  `Cta_Proveedor` varchar(12) DEFAULT NULL,
  `Cta_Agente` varchar(12) DEFAULT NULL,
  `Cta_Ventas` varchar(12) DEFAULT NULL,
  `Cta_Compras` varchar(12) DEFAULT NULL,
  `Cta_Servicio` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`Codigo`),
  CONSTRAINT `fk_contable_entidad` FOREIGN KEY (`Codigo`) REFERENCES `mtr_entidad` (`Codigo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla gestion_2014.mtr_entidad_direccion
CREATE TABLE IF NOT EXISTS `mtr_entidad_direccion` (
  `Codigo` int(10) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) NOT NULL,
  `Direccion` varchar(100) DEFAULT NULL,
  `Telefono` varchar(50) DEFAULT NULL,
  `Fax` varchar(50) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Contacto` varchar(100) DEFAULT NULL,
  `Entidad` varchar(10) NOT NULL,
  `Poblacion` varchar(10) DEFAULT NULL,
  `FechaCreacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `FechaModificacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Codigo`),
  KEY `EntDir_FKEntidad` (`Entidad`),
  KEY `EntDir_FKPoblacion` (`Poblacion`),
  CONSTRAINT `fk_direccion_entidad` FOREIGN KEY (`Entidad`) REFERENCES `mtr_entidad` (`Codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_direccion_poblacion` FOREIGN KEY (`Poblacion`) REFERENCES `mtr_poblacion` (`Codigo`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla gestion_2014.mtr_entidad_familia
CREATE TABLE IF NOT EXISTS `mtr_entidad_familia` (
  `Codigo` int(10) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) NOT NULL,
  `FechaCreacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `FechaModificacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla gestion_2014.mtr_forma_pago
CREATE TABLE IF NOT EXISTS `mtr_forma_pago` (
  `Codigo` varchar(3) NOT NULL,
  `Nombre` varchar(100) NOT NULL,
  `Dia1` int(10) unsigned DEFAULT NULL,
  `Dia2` int(10) unsigned DEFAULT NULL,
  `Dia3` int(10) unsigned DEFAULT NULL,
  `Dia4` int(10) unsigned DEFAULT NULL,
  `Dia5` int(10) unsigned DEFAULT NULL,
  `Vto1` decimal(5,2) DEFAULT NULL,
  `Vto2` decimal(5,2) DEFAULT NULL,
  `Vto3` decimal(5,2) DEFAULT NULL,
  `Vto4` decimal(5,2) DEFAULT NULL,
  `Vto5` decimal(5,2) DEFAULT NULL,
  `FechaCreacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `FechaModificacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla gestion_2014.mtr_ingreso
CREATE TABLE IF NOT EXISTS `mtr_ingreso` (
  `Codigo` int(10) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) NOT NULL,
  `FechaCreacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `FechaModificacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla gestion_2014.mtr_iva
CREATE TABLE IF NOT EXISTS `mtr_iva` (
  `Codigo` int(10) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) DEFAULT NULL,
  `Iva` decimal(4,2) DEFAULT NULL,
  `RecEqu` decimal(4,2) DEFAULT NULL,
  `CtaVen` varchar(12) DEFAULT NULL,
  `CtaCom` varchar(12) DEFAULT NULL,
  `CtaVenRe` varchar(12) DEFAULT NULL,
  `FechaCreacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `FechaModfiicacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla gestion_2014.mtr_maquina
CREATE TABLE IF NOT EXISTS `mtr_maquina` (
  `Codigo` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) NOT NULL DEFAULT '0',
  `PrecioHora` decimal(16,6) DEFAULT NULL COMMENT 'Suma de todos los gastos',
  `GastoLuz` decimal(16,6) DEFAULT NULL COMMENT 'Gasto de luz por hora',
  `GastoAmortizacion` decimal(16,6) DEFAULT NULL COMMENT 'Gasto amortización hora',
  `GastosGenerales` decimal(16,6) DEFAULT NULL COMMENT 'Gatos generales o varios',
  PRIMARY KEY (`Codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla gestion_2014.mtr_material
CREATE TABLE IF NOT EXISTS `mtr_material` (
  `Codigo` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(50) NOT NULL,
  `FechaCreacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `FechaModificacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla gestion_2014.mtr_moneda
CREATE TABLE IF NOT EXISTS `mtr_moneda` (
  `Codigo` int(10) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(50) NOT NULL DEFAULT '0',
  `Abreviado` varchar(5) DEFAULT '0',
  `Simbolo` varchar(1) DEFAULT '0',
  `FechaCreacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `FechaModificacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla gestion_2014.mtr_pais
CREATE TABLE IF NOT EXISTS `mtr_pais` (
  `Codigo` int(10) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) NOT NULL,
  `Moneda` int(10) DEFAULT '0',
  `FechaCreacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `FechaModificacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Codigo`),
  KEY `fk_pais_moneda` (`Moneda`),
  CONSTRAINT `fk_pais_moneda` FOREIGN KEY (`Moneda`) REFERENCES `mtr_moneda` (`Codigo`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla gestion_2014.mtr_poblacion
CREATE TABLE IF NOT EXISTS `mtr_poblacion` (
  `Codigo` varchar(10) NOT NULL,
  `Nombre` varchar(100) NOT NULL,
  `Provincia` int(10) DEFAULT NULL,
  `FechaCreacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `FechaModificacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Codigo`),
  KEY `Poblacion_FKProvincia` (`Provincia`),
  CONSTRAINT `fk_poblacion_provincia` FOREIGN KEY (`Provincia`) REFERENCES `mtr_provincia` (`Codigo`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla gestion_2014.mtr_provincia
CREATE TABLE IF NOT EXISTS `mtr_provincia` (
  `Codigo` int(10) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) NOT NULL,
  `Pais` int(10) DEFAULT NULL,
  `ComunidadAutonoma` int(10) DEFAULT NULL,
  `FechaCreacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `FechaModificacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Codigo`),
  KEY `Provincia_FKPais` (`Pais`),
  KEY `fk_provincia_comunidad` (`ComunidadAutonoma`),
  CONSTRAINT `fk_provincia_comunidad` FOREIGN KEY (`ComunidadAutonoma`) REFERENCES `mtr_comunidad_autonoma` (`Codigo`) ON UPDATE CASCADE,
  CONSTRAINT `fk_provincia_pais` FOREIGN KEY (`Pais`) REFERENCES `mtr_pais` (`Codigo`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla gestion_2014.mtr_seccion
CREATE TABLE IF NOT EXISTS `mtr_seccion` (
  `Codigo` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(50) NOT NULL DEFAULT '0',
  `FechaCreacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `FechaModificacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla gestion_2014.mtr_tarifa
CREATE TABLE IF NOT EXISTS `mtr_tarifa` (
  `Codigo` int(10) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) NOT NULL,
  `FechaCreacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `FechaModficacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla gestion_2014.mtr_trabajador
CREATE TABLE IF NOT EXISTS `mtr_trabajador` (
  `Codigo` int(10) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) NOT NULL,
  `Dirección` varchar(100) DEFAULT NULL,
  `Telefono` varchar(50) DEFAULT NULL,
  `Movil` varchar(50) DEFAULT NULL,
  `Fax` varchar(50) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Web` varchar(100) DEFAULT NULL,
  `CIF` varchar(15) DEFAULT NULL,
  `PrecioHora` decimal(16,4) DEFAULT NULL,
  `PrecioHoraFestivo` decimal(16,4) DEFAULT NULL,
  `Poblacion` varchar(10) DEFAULT NULL,
  `FechaCreacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `FechaModificacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Codigo`),
  KEY `fk_trabajador_ciudad` (`Poblacion`),
  CONSTRAINT `fk_trabajador_ciudad` FOREIGN KEY (`Poblacion`) REFERENCES `mtr_poblacion` (`Codigo`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla gestion_2014.mtr_unidades_medida
CREATE TABLE IF NOT EXISTS `mtr_unidades_medida` (
  `Codigo` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(50) NOT NULL DEFAULT '0',
  `Abreviado` varchar(3) DEFAULT '0',
  `FechaCreacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `FechaModificacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla gestion_2014.mtr_zona
CREATE TABLE IF NOT EXISTS `mtr_zona` (
  `Codigo` int(10) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) NOT NULL,
  `FechaCreacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `FechaModificacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para procedimiento gestion_2014.alm_stock_actualiza
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `alm_stock_actualiza`()
BEGIN
DECLARE EXISTE INT;
SELECT alm_stock INTO EXISTE FROM MOV_PEDIDO_SERVIDO WHERE ARTICULO=IN_ARTICULO AND CLIENTE=IN_CLIENTE;
IF EXISTE IS NULL THEN
	INSERT INTO MOV_PEDIDO_SERVIDO (CLIENTE, ARTICULO,PEDIDO,SERVIDO,PENDIENTE) values (IN_CLIENTE,IN_ARTICULO,IN_PEDIDA,IN_SERVIDA,IN_PEDIDA-IN_SERVIDA);
ELSE
	UPDATE MOV_PEDIDO_SERVIDO SET PEDIDO=PEDIDO+IN_PEDIDA, SERVIDO=SERVIDO+IN_SERVIDA,PENDIENTE=PENDIENTE+(IN_PEDIDA-IN_SERVIDA) WHERE  ARTICULO=IN_ARTICULO AND CLIENTE=IN_CLIENTE;
END IF;
END//
DELIMITER ;


-- Volcando estructura para procedimiento gestion_2014.mtr_entidad_contable_alta
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `mtr_entidad_contable_alta`(IN `IN_CODIGO` VARCHAR(10), IN `CTA_CLI` VARCHAR(12), IN `CTA_PRO` VARCHAR(12), IN `CTA_AGE` VARCHAR(12), IN `CTA_VEN` VARCHAR(12), IN `CTA_COM` VARCHAR(12), IN `CTA_SER` VARCHAR(12))
BEGIN
	DECLARE EXISTE INT;
	SELECT CODIGO INTO EXISTE FROM MTR_ENTIDAD_CONTABLE WHERE CODIGO = IN_CODIGO;
	IF EXISTE IS NULL THEN
		INSERT INTO mtr_entidad_contable  (CODIGO,CTA_CLIENTE,CTA_PROVEEDOR,CTA_AGENTE,CTA_VENTAS,CTA_COMPRAS,CTA_SERVICIO) values (IN_CODIGO,CTA_CLI,CTA_PRO,CTA_AGE,CTA_VEN,CTA_COM,CTA_SER);
	ELSE
		UPDATE mtr_entidad_contable SET CTA_CLIENTE=CTA_CLI,CTA_PROVEEDOR=CTA_PRO,CTA_AGENTE=CTA_AGE,CTA_VENTAS=CTA_VEN,CTA_COMPRAS=CTA_COM,CTA_SERVICIO=CTA_SER WHERE CODIGO = IN_CODIGO;
	END IF;
END//
DELIMITER ;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
