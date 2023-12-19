--Instancias minimas para el funcionamiento de un gimnacio

INSERT INTO Gerencia.LUGARES (ID, PAIS, REGION, CIUDAD, DIRECCION, DETALLES, CODIGOPOSTAL)
VALUES (0, 'Colombia', 'Cundinamarca', 'Bogota', 'Avenida Jimenez 2-10', 'Gimnasio La Papa', '110011');

INSERT INTO Gerencia.SEDES (ID, NOMBRE, UBICACION)
SELECT 1, 'Gimnacio La Papa', ID  FROM GERENCIA.LUGARES
WHERE DETALLES = 'Gimnasio La Papa' AND ROWNUM = 1;

INSERT INTO Administracion.ZONAS (NOMBRE, SEDE, DESCRIPCION)
VALUES ('Zona Principal', 1, 'Zona General');
INSERT INTO Administracion.ZONAS (NOMBRE, SEDE, DESCRIPCION)
VALUES ('Zona Piscina', 1, 'Zona con Piscina de 50000L');
INSERT INTO Administracion.ZONAS (NOMBRE, SEDE, DESCRIPCION)
VALUES ('Zona Cardio', 1, 'Zona con Maquinas de cardio especializadas');
INSERT INTO Administracion.ZONAS (NOMBRE, SEDE, DESCRIPCION)
VALUES ('Zona Canchas', 1, 'Zona con Canchas de futbol, tennis y boley');

--SIGUE TIPO MEMBRESIA en Gerencia.TIPOMEMBRESIA.SQL

INSERT INTO Gerencia.BENEFICIOSEDES (TIPO_MEMBRESIA, SEDE, DESCRIPCION)
VALUES ('MEM_BASICA_1', 1, 'Descripcion');
INSERT INTO Gerencia.BENEFICIOSEDES (TIPO_MEMBRESIA, SEDE, DESCRIPCION)
VALUES ('MEM_BASICA_2', 1, 'Descripcion');
INSERT INTO Gerencia.BENEFICIOSEDES (TIPO_MEMBRESIA, SEDE, DESCRIPCION)
VALUES ('MEM_PISCINA', 1, 'Descripcion');
INSERT INTO Gerencia.BENEFICIOSEDES (TIPO_MEMBRESIA, SEDE, DESCRIPCION)
VALUES ('MEM_PREMIUM', 1, 'Descripcion');
INSERT INTO Gerencia.BENEFICIOSEDES (TIPO_MEMBRESIA, SEDE, DESCRIPCION)
VALUES ('MEM_FULL', 1, 'Descripcion');


-- Beneficios para la membresía MEM_BASICA_1
INSERT INTO Gerencia.BENEFICIOZONAS (TIPO_MEMBRESIA, ZONA, SEDE, DESCRIPCION)
VALUES ('MEM_BASICA_1', 'Zona Principal', 1, 'Acceso a Zona General');

-- Beneficios para la membresía MEM_BASICA_2
INSERT INTO Gerencia.BENEFICIOZONAS (TIPO_MEMBRESIA, ZONA, SEDE, DESCRIPCION)
VALUES ('MEM_BASICA_2', 'Zona Principal', 1, 'Acceso a Zona General');
INSERT INTO Gerencia.BENEFICIOZONAS (TIPO_MEMBRESIA, ZONA, SEDE, DESCRIPCION)
VALUES ('MEM_BASICA_2', 'Zona Cardio', 1, 'Acceso a Zona con Máquinas de Cardio');

-- Beneficios para la membresía MEM_PISCINA
INSERT INTO Gerencia.BENEFICIOZONAS (TIPO_MEMBRESIA, ZONA, SEDE, DESCRIPCION)
VALUES ('MEM_PISCINA', 'Zona Principal', 1, 'Acceso a Zona General y Piscina');
INSERT INTO Gerencia.BENEFICIOZONAS (TIPO_MEMBRESIA, ZONA, SEDE, DESCRIPCION)
VALUES ('MEM_PISCINA', 'Zona Piscina', 1, 'Acceso a Zona con Piscina');

-- Beneficios para la membresía MEM_PREMIUM
INSERT INTO Gerencia.BENEFICIOZONAS (TIPO_MEMBRESIA, ZONA, SEDE, DESCRIPCION)
VALUES ('MEM_PREMIUM', 'Zona Principal', 1, 'Acceso a Zona General y Piscina');
INSERT INTO Gerencia.BENEFICIOZONAS (TIPO_MEMBRESIA, ZONA, SEDE, DESCRIPCION)
VALUES ('MEM_PREMIUM', 'Zona Cardio', 1, 'Acceso a Zona con Máquinas de Cardio');
INSERT INTO Gerencia.BENEFICIOZONAS (TIPO_MEMBRESIA, ZONA, SEDE, DESCRIPCION)
VALUES ('MEM_PREMIUM', 'Zona Canchas', 1, 'Acceso a Zona con Canchas de futbol, tennis y boley');

-- Beneficios para la membresía MEM_FULL
INSERT INTO Gerencia.BENEFICIOZONAS (TIPO_MEMBRESIA, ZONA, SEDE, DESCRIPCION)
VALUES ('MEM_FULL', 'Zona Principal', 1, 'Acceso a Zona General y Piscina');
INSERT INTO Gerencia.BENEFICIOZONAS (TIPO_MEMBRESIA, ZONA, SEDE, DESCRIPCION)
VALUES ('MEM_FULL', 'Zona Piscina', 1, 'Acceso a Zona con Piscina');
INSERT INTO Gerencia.BENEFICIOZONAS (TIPO_MEMBRESIA, ZONA, SEDE, DESCRIPCION)
VALUES ('MEM_FULL', 'Zona Cardio', 1, 'Acceso a Zona con Máquinas de Cardio');
INSERT INTO Gerencia.BENEFICIOZONAS (TIPO_MEMBRESIA, ZONA, SEDE, DESCRIPCION)
VALUES ('MEM_FULL', 'Zona Canchas', 1, 'Acceso a Zona con Canchas de futbol, tennis y boley');

--SIGEN LOS EMPLEADOS EN GERENCIA.EMPLEADOS.SQL

--SIGUEN SUS CONTRATOS EN GERENCIA.CONTRATOS.SQL

-- Final de las instancias minimas

INSERT INTO Gerencia.USUARIOS (DOCUMENTO, TIPODOCUMENTO, CORREO, TELEFONO, FECHANACIMIENTO, NOMBRE, APELLIDO, GENERO, EDAD)
VALUES (12345678901234, 'Cedula', 'juan.camargo@gmail.com', 3113732948, DATE '2000-12-23', 'Juan Camargo',
        'Pablo Teheran', 'Masculino', 21);

INSERT INTO Gerencia.MEMBRESIAS (ID, USUARIO, TIPO, FACTURA, ESTATUS, METODOPAGO, FECHAINICIO, FECHAFINAL)
VALUES (0, 12345678901234, 'Basica', 0, 'Activo', 'PSE', DATE '2023-01-01', DATE '2023-02-02');

INSERT INTO Administracion.EVENTOS (ID, LIDER, SEDE, NOMBRE, FECHAYHORA, DURACION, ESTADO, DESCRIPCION) --Evento Vencido
VALUES (1, 1000000002, 1, 'Cardio Intenso', TIMESTAMP '2023-11-30 13:00:00', 2, 'Activo', 'Evento Para Mejorar tu Cardio');
INSERT INTO Administracion.EVENTOS (ID, LIDER, SEDE, NOMBRE, FECHAYHORA, DURACION, ESTADO, DESCRIPCION) --Evento Valido
VALUES (1, 1000000002, 1, 'Cardio Suave', TIMESTAMP '2023-12-31 13:00:00', 2, 'Activo', 'Evento Para Mejorar tu Cardio desde Cero');

INSERT INTO Administracion.EVENTOS (ID, LIDER, SEDE, NOMBRE, FECHAYHORA, DURACION, ESTADO, DESCRIPCION) --Debe dar Error
VALUES (1, 100000000, 1, 'Debe Dar Error', TIMESTAMP '2023-12-31 13:00:00', 2, 'Activo', 'Evento Para Dar Error');
