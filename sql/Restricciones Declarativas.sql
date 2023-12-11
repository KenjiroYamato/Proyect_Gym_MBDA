-- Tabla FACTURAS
ALTER TABLE FACTURAS
    ADD CONSTRAINT CHK_FACTURAS_VALORx CHECK (VALOR >= 0);

-- Tabla TIPOMEMBRESIA
ALTER TABLE TIPOMEMBRESIA
    ADD CONSTRAINT CHK_MEMBRESIA_PRECIO CHECK (PRECIO >= 0);
ALTER TABLE TIPOMEMBRESIA
    ADD CONSTRAINT CHK_TIPO_MEMBRESIA_DIA_POSITIVO CHECK (DURACIONDIAS >= 0);

-- Tabla USUARIOS
ALTER TABLE USUARIOS
    ADD CONSTRAINT CHK_TIPO_DOC_USER CHECK (TIPODOCUMENTO IN ('Cedula', 'Pasaporte', 'Licencia', 'Carnet', 'Otro'));
ALTER TABLE USUARIOS
    ADD CONSTRAINT CHK_USUARIO_CORREO CHECK (CORREO LIKE '%@%.%');
ALTER TABLE USUARIOS
    ADD CONSTRAINT CHK_USUARIO_TELEFONO CHECK (REGEXP_LIKE(TELEFONO, '^3[0-9]{2}[0-9]{7}$'));
ALTER TABLE USUARIOS
    ADD CONSTRAINT CHK_USUARIO_GENERO CHECK (GENERO IN ('Masculino', 'Femenino', 'Otro'));

-- Tabla CONTROLES
ALTER TABLE CONTROLES
    ADD CONSTRAINT CHK_CONTROL_MEDIDAS CHECK (PESO >= 0 AND ALTURA >= 0 AND MBICEP >= 0 AND MTRICEP >= 0 AND
                                              MTORSO >= 0 AND MABDOMEN >= 0);

-- Tabla MEMBRESIAS
ALTER TABLE MEMBRESIAS
    ADD CONSTRAINT CHK_MEMBRESIA_ESTADO CHECK (ESTATUS IN ('Activo', 'Inactivo', 'Suspendido', 'Finalizado'));
ALTER TABLE MEMBRESIAS
    ADD CONSTRAINT CHK_FACTURA_METODO_PAGO CHECK (METODOPAGO IN
                                                  ('Efectivo', 'Tarjeta de credito', 'Tarjeta de debito', 'PSE',
                                                   'Otro'));

-- Tabla CONTRATOS
ALTER TABLE CONTRATOS
    ADD CONSTRAINT CHK_CONTRATO_TIPO CHECK (TIPOCONTRATO IN ('Fijo', 'Indefinido', 'Obra y labor'));
ALTER TABLE CONTRATOS
    ADD CONSTRAINT CHK_CONTRATO_SUELDO CHECK (SUELDO >= 0);
ALTER TABLE CONTRATOS
    ADD CONSTRAINT CHK_CONTRATO_ESTADO CHECK (ESTADO IN ('Activo', 'Inactivo', 'Suspendido', 'Finalizado'));
--TODO: Agregar al archivo Astah
ALTER TABLE CONTRATOS
    ADD CONSTRAINT CHK_CONTRATO_FECHA_FINAL
        CHECK ((TIPOCONTRATO = 'Indefinido' AND fechaFinal IS NULL) OR
               (TIPOCONTRATO != 'Indefinido' AND fechaFinal IS NOT NULL));


-- Tabla SOLICITUDES
ALTER TABLE SOLICITUDES
    ADD CONSTRAINT CHK_SOLICITUD_IMPORTANCIA CHECK (IMPORTANCIA > 0 AND IMPORTANCIA <= 5);

-- Tabla EVENTO
ALTER TABLE EVENTO
    ADD CONSTRAINT CHK_DURACION_POSITIVO CHECK (DURACION >= 0);
ALTER TABLE EVENTO
    ADD CONSTRAINT CHK_EVENTO_ESTADO CHECK (ESTADO IN ('Activo', 'Suspendido', 'Finalizado'));

-- Tabla EMPLEADOS
ALTER TABLE EMPLEADOS
    ADD CONSTRAINT CHK_TIPO_DOC_EMPLE CHECK (TIPODOCUMENTO IN ('Cedula', 'Pasaporte', 'Licencia', 'Carnet', 'Otro'));
ALTER TABLE EMPLEADOS
    ADD CONSTRAINT CHK_EMPLEADO_CORREO CHECK (CORREO LIKE '%@%.%');
ALTER TABLE EMPLEADOS
    ADD CONSTRAINT CHK_EMPLEADO_GENERO CHECK (GENERO IN ('Masculino', 'Femenino', 'Otro'));
ALTER TABLE EMPLEADOS
    ADD CONSTRAINT CHK_EMPLEADO_ESTADO CHECK (ESTATUS IN ('Activo', 'Inactivo', 'Incapacitado', 'Despedido'));
ALTER TABLE EMPLEADOS
    ADD CONSTRAINT CHK_CONTRATO_CARGO CHECK (CARGO IN
                                             ('Recepcionista', 'Entrenador', 'Personal', 'Limpieza', 'Operador'));

-- Tabla INVENTARIO
ALTER TABLE INVENTARIO
    ADD CONSTRAINT CHK_INVENTARIO_PRECIO CHECK (PRECIO >= 0);

-- Tabla MAQUINAS
ALTER TABLE MAQUINAS
    ADD CONSTRAINT CHK_MAQUINA_ESTADO CHECK (ESTADO IN
                                             ('Activo', 'Inactivo', 'Mantenimiento', 'Reparacion', 'Desecho'));
