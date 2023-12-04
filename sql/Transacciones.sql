BEGIN
    SAVEPOINT Verificar_Membresias;

    UPDATE Membresias
    SET estatus = 'Finalizado'
    WHERE FechaFinal < SYSDATE;

    COMMIT;

EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK TO Verificar_Membresias;
END;

--Prueba
CREATE OR REPLACE FUNCTION Obtener_Estado_Membresia(IdUsuario NUMBER)
    RETURN BOOLEAN
    IS
    estatus_usuario VARCHAR2(25);
BEGIN
    SELECT ESTATUS
    INTO estatus_usuario
    FROM MEMBRESIAS
    WHERE USUARIO = IdUsuario;

    IF estatus_usuario <> 'Activa' THEN
        RETURN False;
    END IF;
    RETURN True;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN False;
END Obtener_Estado_Membresia;

-- CREATE OR REPLACE FUNCTION Acceso_Sede(IdUsuario NUMBER)
--     RETURN BOOLEAN
--     IS
--     tipo_membresia VARCHAR2(25);
-- BEGIN
--     SELECT TIPO
--     INTO tipo_membresia
--     FROM MEMBRESIAS
--     WHERE USUARIO = IdUsuario;
--
--     IF estatus_usuario <> 'Activa' THEN
--         RETURN False;
--     END IF;
--     RETURN True;
-- EXCEPTION
--     WHEN NO_DATA_FOUND THEN
--         RETURN False;
-- END Obtener_Estado_Membresia;

DECLARE
    estadoMembresia VARCHAR2(500);
BEGIN
    estadoMembresia := Obtener_Estado_Membresia(12345678901234); -- Reemplaza 123 con el ID del usuario que deseas consultar.


END;