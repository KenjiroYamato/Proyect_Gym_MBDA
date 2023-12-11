ALTER TABLE CONTROLES
    ADD CONSTRAINT FK_CONTROLES_USUARIO FOREIGN KEY (USUARIO) REFERENCES USUARIOS;

ALTER TABLE MEMBRESIAS
    ADD CONSTRAINT FK_MEMBRESIAS_USUARIO FOREIGN KEY (USUARIO) REFERENCES USUARIOS;
ALTER TABLE MEMBRESIAS
    ADD CONSTRAINT FK_MEMBRESIAS_TIPO FOREIGN KEY (TIPO) REFERENCES TIPOMEMBRESIA;
ALTER TABLE MEMBRESIAs
    ADD CONSTRAINT FK_FACTURA_MEMBRESIAS FOREIGN KEY (Factura) REFERENCES MEMBRESIAS;

ALTER TABLE SEDES
    ADD CONSTRAINT FK_SEDES_UBICACION FOREIGN KEY (UBICACION) REFERENCES LUGARES;

ALTER TABLE EMPLEADOS
    ADD CONSTRAINT FK_EMPLEADOS_SEDE FOREIGN KEY (SEDE) REFERENCES SEDES;

ALTER TABLE CONTRATOS
    ADD CONSTRAINT FK_CONTRATOS_EMPLEADO FOREIGN KEY (EMPLEADO) REFERENCES EMPLEADOS;

ALTER TABLE SOLICITUDES
    ADD CONSTRAINT FK_SOLICITUDES_CREADOR FOREIGN KEY (CREADOR) REFERENCES EMPLEADOS;

ALTER TABLE EVENTOS
    ADD CONSTRAINT FK_EVENTO_LIDER FOREIGN KEY (LIDER) REFERENCES EMPLEADOS;
ALTER TABLE EVENTOS
    ADD CONSTRAINT FK_EVENTO_SEDE FOREIGN KEY (SEDE) REFERENCES SEDES;

ALTER TABLE ASISTENTES
    ADD CONSTRAINT FK_ASISTENTES_USUARIO FOREIGN KEY (USUARIO) REFERENCES USUARIOS;
ALTER TABLE ASISTENTES
    ADD CONSTRAINT FK_ASISTENTES_EVENTO FOREIGN KEY (EVENTO) REFERENCES EVENTOS;

ALTER TABLE REGISTROENTRADASALIDAS
    ADD CONSTRAINT FK_REGISTRO_ENTRADAS_PERSONA FOREIGN KEY (PERSONA) REFERENCES USUARIOS;
ALTER TABLE REGISTROENTRADASALIDAS
    ADD CONSTRAINT FK_REGISTRO_ENTRADAS_ZONA FOREIGN KEY (ZONA, SEDE) REFERENCES ZONAS;

ALTER TABLE BENEFICIOZONAS
    ADD CONSTRAINT FK_BENEFICIO_ZONAS_TIPO FOREIGN KEY (TIPO_MEMBRESIA) REFERENCES TIPOMEMBRESIA;
ALTER TABLE BENEFICIOZONAS
    ADD CONSTRAINT FK_BENEFICIO_ZONAS_ZONA FOREIGN KEY (ZONA, SEDE) REFERENCES ZONAS;

ALTER TABLE BENEFICIOSEDES
    ADD CONSTRAINT FK_BENEFICIO_SEDES_TIPO FOREIGN KEY (TIPO_MEMBRESIA) REFERENCES TIPOMEMBRESIA;
ALTER TABLE BENEFICIOSEDES
    ADD CONSTRAINT FK_BENEFICIO_SEDES_SEDE FOREIGN KEY (SEDE) REFERENCES SEDES;

ALTER TABLE INVENTARIO
    ADD CONSTRAINT FK_INVENTARIO_SEDE FOREIGN KEY (SEDE) REFERENCES SEDES;

ALTER TABLE MAQUINAS
    ADD CONSTRAINT FK_MAQUINAS_ID FOREIGN KEY (ID) REFERENCES INVENTARIO;

ALTER TABLE ELEMENTOS
    ADD CONSTRAINT FK_ELEMENTO_ID FOREIGN KEY (ID) REFERENCES INVENTARIO;
