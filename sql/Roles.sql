alter session set "_oracle_script"=TRUE;

--Creacion de Roles
CREATE ROLE GymGerenteRole;

CREATE ROLE GymAdminRole;

CREATE ROLE GymAdminSede1Role;

CREATE ROLE GymRecepcionRole;

CREATE ROLE GymUsuarioRole;

--Creacion De Schemas
CREATE USER Gerencia IDENTIFIED BY gerencia DEFAULT TABLESPACE USERS TEMPORARY TABLESPACE TEMP;
GRANT GymGerenteRole TO Gerencia;
GRANT UNLIMITED TABLESPACE TO Gerencia;

CREATE USER Administracion IDENTIFIED BY administracion DEFAULT TABLESPACE USERS TEMPORARY TABLESPACE TEMP;
GRANT GymAdminRole TO Administracion;
GRANT UNLIMITED TABLESPACE TO Administracion;

CREATE USER AdministracionSede1 IDENTIFIED BY administracionsede1 DEFAULT TABLESPACE USERS TEMPORARY TABLESPACE TEMP;
GRANT GymAdminSede1Role TO AdministracionSede1;
GRANT UNLIMITED TABLESPACE TO AdministracionSede1;

CREATE USER Recepcion IDENTIFIED BY recepcion DEFAULT TABLESPACE USERS TEMPORARY TABLESPACE TEMP;
GRANT GymRecepcionRole TO Recepcion;
GRANT UNLIMITED TABLESPACE TO Recepcion;

CREATE USER Usuario IDENTIFIED BY usuario DEFAULT TABLESPACE USERS TEMPORARY TABLESPACE TEMP;
GRANT GymUsuarioRole TO Usuario;
GRANT UNLIMITED TABLESPACE TO Usuario;

--_________________________________________________Asignacion de Permisos para el Schema Gerencia_______________
GRANT REFERENCES ON Administracion.Zonas TO Gerencia;

--__________________________________________________Asignacion de Permisos para el Rol de Gerente____________________
GRANT CONNECT TO GymGerenteRole;
GRANT CREATE SESSION TO GymGerenteRole;

GRANT SELECT ANY TABLE TO GymGerenteRole;

GRANT INSERT, SELECT, UPDATE, DELETE ON Gerencia.SEDES TO GymGerenteRole;
GRANT INSERT, SELECT, UPDATE, DELETE ON Gerencia.LUGARES TO GymGerenteRole;

GRANT INSERT, SELECT ON Gerencia.EMPLEADOS TO GymGerenteRole;
GRANT INSERT, SELECT ON Gerencia.CONTRATOS TO GymGerenteRole;
GRANT INSERT, SELECT ON Gerencia.TIPOMEMBRESIA TO GymGerenteRole;
GRANT INSERT, SELECT ON Gerencia.BENEFICIOSEDES TO GymGerenteRole;
GRANT INSERT, SELECT ON Gerencia.BENEFICIOZONAS TO GymGerenteRole;

GRANT EXECUTE ANY PROCEDURE TO GymGerenteRole;
GRANT AUDIT ANY TO GymGerenteRole;
GRANT SELECT_CATALOG_ROLE TO GymGerenteRole;

--_________________________________________________Asignacion de Permisos para el Schema Administracion______________
GRANT CONNECT TO GymAdminRole;
GRANT CREATE SESSION TO GymAdminRole;

GRANT REFERENCES ON Gerencia.EMPLEADOS TO Administracion;
GRANT REFERENCES ON Gerencia.SEDES TO Administracion;
GRANT REFERENCES ON Gerencia.USUARIOS TO Administracion;
GRANT REFERENCES ON Gerencia.SEDES TO Administracion;

--__________________________________________________Asignacion de Permisos para el Rol de Administrador______________
GRANT INSERT, SELECT, UPDATE, DELETE ON ADMINISTRACION.INVENTARIO TO GymAdminRole;
GRANT INSERT, SELECT, UPDATE, DELETE ON ADMINISTRACION.MAQUINAS TO GymAdminRole;
GRANT INSERT, SELECT, UPDATE, DELETE ON ADMINISTRACION.ELEMENTOS TO GymAdminRole;
GRANT INSERT, SELECT, UPDATE, DELETE ON ADMINISTRACION.ZONAS TO GymAdminRole;
GRANT INSERT, SELECT, UPDATE, DELETE ON ADMINISTRACION.SOLICITUDES TO GymAdminRole;

GRANT INSERT, SELECT ON ADMINISTRACION.EVENTOS TO GymAdminRole;
GRANT INSERT, SELECT ON Administracion.REGISTROENTRADASALIDAS TO GymAdminRole;
GRANT INSERT, SELECT ON Administracion.ASISTENTES TO GymAdminRole;

GRANT SELECT ON Gerencia.EMPLEADOS TO GymAdminRole;
GRANT SELECT ON Gerencia.CONTRATOS TO GymAdminRole;

--__________________________________________________Asignacion de Permisos para el Schema Usuario____________________
GRANT REFERENCES ON Gerencia.USUARIOS TO Usuario;

--__________________________________________________Asignacion de Permisos para Usuario______________________________
GRANT CONNECT TO GymUsuarioRole;
GRANT CREATE SESSION TO GymUsuarioRole;

GRANT INSERT, SELECT, DELETE ON Usuario.CONTROLES TO GymUsuarioRole;
GRANT SELECT ON Administracion.EVENTOS TO GymUsuarioRole;

--__________________________________________________Asignacion de Permisos para el Schema Recepcion___________________
--No tiene tablas
--__________________________________________________Asignacion de Permisos para el Rol de Recepcionista_______________
GRANT CONNECT TO GymRecepcionRole;
GRANT CREATE SESSION TO GymRecepcionRole;

GRANT INSERT, SELECT, UPDATE ON GERENCIA.USUARIOS TO GymRecepcionRole;
GRANT INSERT, SELECT, UPDATE ON GERENCIA.MEMBRESIAS TO GymRecepcionRole;

GRANT SELECT ON GERENCIA.SEDES TO GymRecepcionRole;
GRANT SELECT ON GERENCIA.TIPOMEMBRESIA TO GymRecepcionRole;
GRANT SELECT ON GERENCIA.BENEFICIOZONAS TO GymRecepcionRole;
GRANT SELECT ON GERENCIA.BENEFICIOSEDES TO GymRecepcionRole;
GRANT SELECT ON ADMINISTRACION.ZONAS TO GymRecepcionRole;
GRANT SELECT ON ADMINISTRACION.EVENTOS TO GymRecepcionRole;