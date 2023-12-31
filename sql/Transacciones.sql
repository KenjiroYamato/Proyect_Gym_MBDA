BEGIN
    LOCK TABLE Gerencia.MEMBRESIAS IN SHARE MODE;

    SAVEPOINT Verificar_Membresias;

    UPDATE Gerencia.Membresias
    SET estatus = 'Finalizado'
    WHERE FechaFinal < SYSDATE;

    COMMIT;

EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK TO Verificar_Membresias;
END;

BEGIN
    SAVEPOINT Finalizar_Evento;

    UPDATE Administracion.EVENTOS
    SET ESTADO = 'Finalizado'
    WHERE (FECHAYHORA + NUMTODSINTERVAL(DURACION, 'HOUR')) < SYSTIMESTAMP;

    COMMIT;

EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK TO Finalizar_Evento;
END;

--Consultar si un usuario puede acceder a una zona
DECLARE
    estadoMembresia BOOLEAN;
BEGIN
    estadoMembresia :=
            PKG_USUARIOS.ACCESO_ZONA(12345678901234, 1, 'Zona Principal'); -- Reemplaza 123 con el ID del usuario que deseas consultar.
    DBMS_OUTPUT.put_line(CASE WHEN estadoMembresia THEN 'TRUE' ELSE 'FALSE' END);
END;
