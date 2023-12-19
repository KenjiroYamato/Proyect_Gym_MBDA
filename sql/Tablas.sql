CREATE TABLE Gerencia.FACTURAS
(
    ID          NUMBER(13)    NOT NULL,
    VALOR       NUMBER(10, 2) NOT NULL,
    DETALLES    VARCHAR2(255) NOT NULL,
    MOMENTOPAGO TIMESTAMP(6)  NOT NULL
);

CREATE TABLE Gerencia.TIPOMEMBRESIA
(
    TIPO         VARCHAR2(30)  NOT NULL,
    PRECIO       NUMBER(10, 2) NOT NULL,
    DURACIONDIAS NUMBER(4)     NOT NULL,
    DESCRIPCION  VARCHAR2(255)
);

CREATE TABLE Gerencia.MEMBRESIAS
(
    ID          NUMBER(13)   NOT NULL,
    USUARIO     NUMBER(14)   NOT NULL,
    TIPO        VARCHAR2(30) NOT NULL,
    Factura     NUMBER(13)   NOT NULL,
    ESTATUS     VARCHAR2(12) NOT NULL,
    METODOPAGO  VARCHAR2(30) NOT NULL,
    FECHAINICIO DATE         NOT NULL,
    FECHAFINAL  DATE         NOT NULL
);

CREATE TABLE Gerencia.SEDES
(
    ID        NUMBER(4)    NOT NULL,
    NOMBRE    VARCHAR2(50) NOT NULL,
    UBICACION NUMBER(13)   NOT NULL
);

CREATE TABLE Gerencia.BENEFICIOZONAS
(
    TIPO_MEMBRESIA VARCHAR2(30) NOT NULL,
    ZONA           VARCHAR2(15) NOT NULL,
    SEDE           NUMBER(4)    NOT NULL,
    DESCRIPCION    VARCHAR2(255)
);

CREATE TABLE Gerencia.BENEFICIOSEDES
(
    TIPO_MEMBRESIA VARCHAR2(30) NOT NULL,
    SEDE           NUMBER(4)    NOT NULL,
    DESCRIPCION    VARCHAR2(255)
);

CREATE TABLE Gerencia.EMPLEADOS
(
    DOCUMENTO       NUMBER(14)   NOT NULL,
    TIPODOCUMENTO   VARCHAR2(10) NOT NULL,
    CORREO          VARCHAR2(50) NOT NULL,
    TELEFONO        VARCHAR2(16) NOT NULL,
    FECHANACIMIENTO DATE         NOT NULL,
    NOMBRE          VARCHAR2(50) NOT NULL,
    APELLIDO        VARCHAR2(50) NOT NULL,
    GENERO          VARCHAR2(10) NOT NULL,
    EDAD            NUMBER(3)    NOT NULL,
    SEDE            NUMBER(13)   NOT NULL,
    ESTATUS         VARCHAR2(20) NOT NULL,
    CARGO           VARCHAR2(30) NOT NULL
);

CREATE TABLE Gerencia.CONTRATOS
(
    ID           NUMBER(13)    NOT NULL,
    EMPLEADO     NUMBER(14)    NOT NULL,
    TIPOCONTRATO VARCHAR2(26)  NOT NULL,
    FECHAINICIO  DATE          NOT NULL,
    FECHAFINAL   DATE,
    SUELDO       NUMBER(10, 2) NOT NULL,
    DESCRIPCION  VARCHAR2(255) NOT NULL,
    ESTADO       VARCHAR2(12)  NOT NULL
);

CREATE TABLE Gerencia.USUARIOS
(
    DOCUMENTO       NUMBER(14)   NOT NULL,
    TIPODOCUMENTO   VARCHAR2(10) NOT NULL,
    CORREO          VARCHAR2(50) NOT NULL,
    TELEFONO        VARCHAR2(16) NOT NULL,
    FECHANACIMIENTO DATE         NOT NULL,
    NOMBRE          VARCHAR2(50) NOT NULL,
    APELLIDO        VARCHAR2(50) NOT NULL,
    GENERO          VARCHAR2(10) NOT NULL,
    EDAD            NUMBER(3)    NOT NULL
);

CREATE TABLE Gerencia.LUGARES
(
    ID           NUMBER(13)   NOT NULL,
    PAIS         VARCHAR2(50) NOT NULL,
    REGION       VARCHAR2(50) NOT NULL,
    CIUDAD       VARCHAR2(50) NOT NULL,
    DIRECCION    VARCHAR2(50),
    DETALLES     VARCHAR2(255),
    CODIGOPOSTAL VARCHAR2(10)
);

CREATE TABLE Usuario.CONTROLES
(
    USUARIO  NUMBER(14) NOT NULL,
    FECHA    DATE       NOT NULL,
    PESO     NUMBER(3, 2),
    ALTURA   NUMBER(3, 2),
    MBICEP   NUMBER(3, 2),
    MTRICEP  NUMBER(3, 2),
    MTORSO   NUMBER(3, 2),
    MABDOMEN NUMBER(3, 2),
    IMC      NUMBER(3, 2)
);

CREATE TABLE Administracion.SOLICITUDES
(
    ID            NUMBER(13)   NOT NULL,
    CREADOR       NUMBER(14)   NOT NULL,
    FECHACREACION TIMESTAMP(6) NOT NULL,
    IMPORTANCIA   NUMBER(1)    NOT NULL,
    ASUNTO        VARCHAR2(50) NOT NULL,
    DESCRIPCION   VARCHAR2(1024)
);

CREATE TABLE Administracion.EVENTOS
(
    ID          NUMBER(13)   NOT NULL,
    LIDER       NUMBER(14),
    SEDE        NUMBER(4)    NOT NULL,
    NOMBRE      VARCHAR2(50) NOT NULL,
    FECHAYHORA  DATE         NOT NULL,
    DURACION    NUMBER(1)    NOT NULL,
    ESTADO      VARCHAR2(12) NOT NULL,
    DESCRIPCION VARCHAR2(255)
);

CREATE TABLE Administracion.ASISTENTES
(
    USUARIO NUMBER(14) NOT NULL,
    EVENTO  NUMBER(13) NOT NULL
);

CREATE TABLE Administracion.ZONAS
(
    NOMBRE      VARCHAR2(15)  NOT NULL,
    SEDE        NUMBER(4)     NOT NULL,
    DESCRIPCION VARCHAR2(255) NOT NULL
);

CREATE TABLE Administracion.REGISTROENTRADASALIDAS
(
    ID          NUMBER(13)   NOT NULL,
    PERSONA     NUMBER(14)   NOT NULL,
    ZONA        VARCHAR2(15) NOT NULL,
    SEDE        NUMBER(4)    NOT NULL,
    FECHA       DATE         NOT NULL,
    HORAENTRADA TIMESTAMP(6) NOT NULL,
    HORASALIDA  TIMESTAMP(6) NOT NULL
);

CREATE TABLE Administracion.INVENTARIO
(
    ID          NUMBER(13)    NOT NULL,
    SEDE        NUMBER(4)     NOT NULL,
    NOMBRE      VARCHAR2(50)  NOT NULL,
    PRECIO      NUMBER(10, 2) NOT NULL,
    FECHACOMPRA DATE          NOT NULL,
    TIPO        VARCHAR2(20)  NOT NULL,
    DESCRIPCION VARCHAR2(255)
);

CREATE TABLE Administracion.MAQUINAS
(
    ID     NUMBER(13)   NOT NULL,
    ESTADO VARCHAR2(16) NOT NULL
);

CREATE TABLE Administracion.ELEMENTOS
(
    ID NUMBER(13) NOT NULL
);
