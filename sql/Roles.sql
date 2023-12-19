alter session set "_oracle_script"=TRUE;

--Creacion de Roles
CREATE ROLE GymGerenteRole;

CREATE ROLE GymAdminRole;

CREATE ROLE GymRecepcionRole;

CREATE ROLE GymUsuarioRole;

--Creacion De Schemas
CREATE USER Gerencia IDENTIFIED BY gerencia DEFAULT TABLESPACE USERS TEMPORARY TABLESPACE TEMP;
GRANT GymGerenteRole TO Gerencia;
GRANT UNLIMITED TABLESPACE TO Gerencia;

CREATE USER Administracion IDENTIFIED BY administracion DEFAULT TABLESPACE USERS TEMPORARY TABLESPACE TEMP;
GRANT GymAdminRole TO Administracion;
GRANT UNLIMITED TABLESPACE TO Administracion;

CREATE USER Recepcion IDENTIFIED BY recepcion DEFAULT TABLESPACE USERS TEMPORARY TABLESPACE TEMP;
GRANT GymRecepcionRole TO Recepcion;
GRANT UNLIMITED TABLESPACE TO Recepcion;

CREATE USER Usuario IDENTIFIED BY usuario DEFAULT TABLESPACE USERS TEMPORARY TABLESPACE TEMP;
GRANT GymUsuarioRole TO Usuario;
GRANT UNLIMITED TABLESPACE TO Usuario;