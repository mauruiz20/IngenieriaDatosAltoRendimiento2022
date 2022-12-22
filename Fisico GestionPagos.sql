--
-- ER/Studio 8.0 SQL Code Generation
-- Company :      UNT
-- Project :      GestionPagos.DM1
-- Author :       Francisco Mauricio Ruiz
--
-- Date Created : Tuesday, December 20, 2022 12:06:16
-- Target DBMS : MySQL 5.x
--

-- 
-- TABLE: Comercios 
--

CREATE TABLE Comercios(
    IdComercio        INT             AUTO_INCREMENT,
    Comercio          VARCHAR(100)    NOT NULL,
    Telefono          VARCHAR(12)     NOT NULL,
    Direccion         VARCHAR(100)    NOT NULL,
    Localidad         VARCHAR(100)    NOT NULL,
    EstadoComercio    CHAR(1)         NOT NULL,
    PRIMARY KEY (IdComercio)
)ENGINE=INNODB
COMMENT='Tabla que almacena los comercios del sistema.'
;

-- 
-- TABLE: MediosPago 
--

CREATE TABLE MediosPago(
    IdMedioPago    TINYINT         AUTO_INCREMENT,
    MedioPago      VARCHAR(100)    NOT NULL,
    Tipo           VARCHAR(10)     NOT NULL,
    Banco          VARCHAR(100),
    PRIMARY KEY (IdMedioPago)
)ENGINE=INNODB
COMMENT='Tabla que almacena los medios de pago del sistema.'
;

-- 
-- TABLE: Planes 
--

CREATE TABLE Planes(
    IdPlan         SMALLINT         AUTO_INCREMENT,
    IdMedioPago    TINYINT          NOT NULL,
    Codigo         VARCHAR(15)      NOT NULL,
    NumCuotas      TINYINT          NOT NULL,
    TNA            DECIMAL(5, 2)    NOT NULL,
    PRIMARY KEY (IdPlan, IdMedioPago)
)ENGINE=INNODB
COMMENT='Tabla que almacena los planes soportados del sistema.'
;

-- 
-- TABLE: PlanesComercio 
--

CREATE TABLE PlanesComercio(
    IdPlanComercio     INT         AUTO_INCREMENT,
    IdComercio         INT         NOT NULL,
    IdPlan             SMALLINT    NOT NULL,
    IdMedioPago        TINYINT     NOT NULL,
    EstadoPComercio    CHAR(1)     NOT NULL,
    PRIMARY KEY (IdPlanComercio, IdComercio, IdPlan, IdMedioPago)
)ENGINE=INNODB
COMMENT='Tabla que almacena los planes de comercio del sistema.'
;

-- 
-- TABLE: Usuarios 
--

CREATE TABLE Usuarios(
    IdUsuario        INT            AUTO_INCREMENT,
    IdComercio       INT            NOT NULL,
    Nombres          VARCHAR(60)    NOT NULL,
    Apellidos        VARCHAR(60)    NOT NULL,
    Telefono         VARCHAR(12)    NOT NULL,
    Email            VARCHAR(60)    NOT NULL,
    DNI              VARCHAR(10)    NOT NULL,
    EstadoUsuario    CHAR(1)        NOT NULL,
    PRIMARY KEY (IdUsuario, IdComercio)
)ENGINE=INNODB
COMMENT='Tabla que almacena los usuarios.'
;

-- 
-- TABLE: Ventas 
--

CREATE TABLE Ventas(
    IdVenta              INT               AUTO_INCREMENT,
    IdPlanComercio       INT,
    IdUsuario            INT               NOT NULL,
    IdComercio           INT               NOT NULL,
    IdPlan               SMALLINT,
    IdMedioPago          TINYINT,
    FechaAlta            DATETIME          NOT NULL,
    Monto                DECIMAL(12, 2)    NOT NULL,
    Detalles             TEXT              NOT NULL,
    ApellidosCliente     VARCHAR(60)       NOT NULL,
    NombresCliente       VARCHAR(60)       NOT NULL,
    DireccionCliente     VARCHAR(100)      NOT NULL,
    DNICliente           VARCHAR(10)       NOT NULL,
    NumTarjetaCliente    VARCHAR(20)       NOT NULL,
    EstadoVenta          CHAR(1)           NOT NULL,
    Observaciones        TEXT,
    PRIMARY KEY (IdVenta)
)ENGINE=INNODB
COMMENT='Tabla que almacena las ventas del sistema.'
;

-- 
-- INDEX: UI_Comercio 
--

CREATE UNIQUE INDEX UI_Comercio ON Comercios(Comercio)
;
-- 
-- INDEX: UI_MedioPago 
--

CREATE UNIQUE INDEX UI_MedioPago ON MediosPago(MedioPago)
;
-- 
-- INDEX: UI_IdPlan 
--

CREATE UNIQUE INDEX UI_IdPlan ON Planes(IdPlan)
;
-- 
-- INDEX: UI_Codigo 
--

CREATE UNIQUE INDEX UI_Codigo ON Planes(Codigo)
;
-- 
-- INDEX: Ref34 
--

CREATE INDEX Ref34 ON Planes(IdMedioPago)
;
-- 
-- INDEX: UI_IdPlanComercio 
--

CREATE UNIQUE INDEX UI_IdPlanComercio ON PlanesComercio(IdPlanComercio)
;
-- 
-- INDEX: UI_IdComercioIdPlantIdMedioPago 
--

CREATE UNIQUE INDEX UI_IdComercioIdPlantIdMedioPago ON PlanesComercio(IdComercio, IdPlan, IdMedioPago)
;
-- 
-- INDEX: Ref45 
--

CREATE INDEX Ref45 ON PlanesComercio(IdMedioPago, IdPlan)
;
-- 
-- INDEX: Ref16 
--

CREATE INDEX Ref16 ON PlanesComercio(IdComercio)
;
-- 
-- INDEX: IX_NombresApellidos 
--

CREATE INDEX IX_NombresApellidos ON Usuarios(Nombres, Apellidos)
;
-- 
-- INDEX: UI_IdUsuario 
--

CREATE UNIQUE INDEX UI_IdUsuario ON Usuarios(IdUsuario)
;
-- 
-- INDEX: UI_DNI 
--

CREATE UNIQUE INDEX UI_DNI ON Usuarios(DNI)
;
-- 
-- INDEX: Ref11 
--

CREATE INDEX Ref11 ON Usuarios(IdComercio)
;
-- 
-- INDEX: IX_FechaAlta 
--

CREATE INDEX IX_FechaAlta ON Ventas(FechaAlta)
;
-- 
-- INDEX: IX_DNI 
--

CREATE INDEX IX_DNI ON Ventas(DNICliente)
;
-- 
-- INDEX: Ref22 
--

CREATE INDEX Ref22 ON Ventas(IdComercio, IdUsuario)
;
-- 
-- INDEX: Ref63 
--

CREATE INDEX Ref63 ON Ventas(IdMedioPago, IdPlan, IdPlanComercio, IdComercio)
;
-- 
-- TABLE: Planes 
--

ALTER TABLE Planes ADD CONSTRAINT RefMediosPago43 
    FOREIGN KEY (IdMedioPago)
    REFERENCES MediosPago(IdMedioPago)
;


-- 
-- TABLE: PlanesComercio 
--

ALTER TABLE PlanesComercio ADD CONSTRAINT RefPlanes53 
    FOREIGN KEY (IdPlan, IdMedioPago)
    REFERENCES Planes(IdPlan, IdMedioPago)
;

ALTER TABLE PlanesComercio ADD CONSTRAINT RefComercios63 
    FOREIGN KEY (IdComercio)
    REFERENCES Comercios(IdComercio)
;


-- 
-- TABLE: Usuarios 
-- comercioscomercios

ALTER TABLE Usuarios ADD CONSTRAINT RefComercios13 
    FOREIGN KEY (IdComercio)
    REFERENCES Comercios(IdComercio)
;


-- 
-- TABLE: Ventas 
--

ALTER TABLE Ventas ADD CONSTRAINT RefUsuarios23 
    FOREIGN KEY (IdUsuario, IdComercio)
    REFERENCES Usuarios(IdUsuario, IdComercio)
;

ALTER TABLE Ventas ADD CONSTRAINT RefPlanesComercio33 
    FOREIGN KEY (IdPlanComercio, IdComercio, IdPlan, IdMedioPago)
    REFERENCES PlanesComercio(IdPlanComercio, IdComercio, IdPlan, IdMedioPago)
;

/* ----------------------------------------------------------------------- */

-- 
-- Auditoria Comercios
--

CREATE TABLE `aud_comercios` (
`Id` BIGINT NOT NULL AUTO_INCREMENT,
`FechaAud` DATETIME NOT NULL,
`UsuarioAud` VARCHAR(30) NOT NULL,
`IP` VARCHAR(40) NOT NULL,
`UserAgent` VARCHAR(255) NULL,
`Aplicacion` VARCHAR(50) NOT NULL,
`Motivo` VARCHAR(100) NULL,
`TipoAud` CHAR(1) NOT NULL,
  `IdComercio` int NOT NULL,
  `Comercio` varchar(100) NOT NULL,
  `Telefono` varchar(12) NOT NULL,
  `Direccion` varchar(100) NOT NULL,
  `Localidad` varchar(100) NOT NULL,
  `EstadoComercio` char(1) NOT NULL,
PRIMARY KEY (`Id`),
INDEX `IX_FechaAud` (`FechaAud` ASC),
INDEX `IX_Usuario` (`UsuarioAud` ASC),
INDEX `IX_IP` (`IP` ASC),
INDEX `IX_Aplicacion` (`Aplicacion` ASC)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Tabla que almacena la auditoria de los comercios del sistema.';



