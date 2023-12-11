--TODO: Ningun TRIGGER esta en el archivo Astah
CREATE OR REPLACE TRIGGER TGR_NO_ELIMINAR_FACTURAS
    BEFORE DELETE
    ON FACTURAS
    FOR EACH ROW
BEGIN
    RAISE_APPLICATION_ERROR(-20001, 'No se puede eliminar una factura');
END;

CREATE OR REPLACE TRIGGER TGR_SOLO_SE_PUEDE_ACTUALIZAR_DETALLES_EN_FACTURAS
    BEFORE UPDATE
    ON FACTURAS
    FOR EACH ROW
BEGIN
    IF :NEW.id <> :OLD.id OR :NEW.valor <> :OLD.valor OR :NEW.MomentoPago <> :OLD.momentoPago THEN
        RAISE_APPLICATION_ERROR(-20002, 'Solo se pueden actualizar los detalles de una afactura');
    end if;
END;

CREATE OR REPLACE TRIGGER TGR_NO_ELIMINAR_TIPO_MEMBRESIA
    BEFORE DELETE
    ON TIPOMEMBRESIA
    FOR EACH ROW
BEGIN
    RAISE_APPLICATION_ERROR(-20003, 'No se puede eliminar un tipo de membresia');
END;


CREATE OR REPLACE TRIGGER TGR_NO_PUEDEN_EXISTIR_2_OPERADORES
    BEFORE INSERT OR UPDATE
    ON EMPLEADOS
    FOR EACH ROW
DECLARE
    operador_por_sede NUMBER(1);
BEGIN
    IF 'Operador' = :NEW.CARGO THEN
        SELECT COUNT(*) INTO operador_por_sede FROM EMPLEADOS WHERE CARGO = 'Operador' AND SEDE = :NEW.SEDE;

        IF operador_por_sede > 0 THEN
            RAISE_APPLICATION_ERROR(-20004, 'Solo Puede haber un Operador por Sede');
        end if;
    end if;
END;

CREATE SEQUENCE Seq_UID_Facturas_Membresias
    START WITH 100000
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;

CREATE OR REPLACE TRIGGER TGR_BEFORE_INSERT_MEMBRESIAS
    BEFORE INSERT
    ON MEMBRESIAS
    FOR EACH ROW
DECLARE
    valor_Membresia NUMBER(10, 5);
    id_Factura      NUMBER(10);
    id_Membresia    NUMBER(10);
    momento_pago    Timestamp;
BEGIN

    SELECT Seq_UID_Facturas_Membresias.nextval INTO id_Membresia FROM dual;
    SELECT Seq_UID_Facturas_Membresias.currval INTO id_Factura FROM dual;

    :NEW.ID := id_Membresia;
    :NEW.Factura := id_Factura;

    SELECT PRECIO
    INTO valor_membresia
    FROM TIPOMEMBRESIA
    WHERE TIPOMEMBRESIA.TIPO = :NEW.Tipo;

    INSERT INTO FACTURAS (ID, VALOR, DETALLES, MOMENTOPAGO)
    VALUES (id_Factura, valor_Membresia, 'Sin Novedades.', SYSTIMESTAMP);
end;

CREATE SEQUENCE SEQ_UID_EVENTOS
    START WITH 100
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;


CREATE OR REPLACE TRIGGER TGR_BEFORE_INSERT_EVENT
    BEFORE INSERT ON EVENTOS
    FOR EACH ROW
DECLARE
    cargo_del_lider VARCHAR2(50);
BEGIN
    SELECT CARGO INTO cargo_del_lider FROM EMPLEADOS
        WHERE DOCUMENTO = :NEW.LIDER;
    IF cargo_del_lider != 'Entrenador' THEN
        RAISE_APPLICATION_ERROR(-20005, 'Un Evento solo Puede ser Liderado por un Entrenador');
    end if;

    SELECT SEQ_UID_EVENTOS.nextval INTO :NEW.ID FROM DUAL;
end;