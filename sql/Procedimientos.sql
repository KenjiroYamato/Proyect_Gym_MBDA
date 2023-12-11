--TODO: Eliminar cuando CrudI este listo

CREATE OR REPLACE FUNCTION Membresia_Valida(IdUsuario NUMBER)
    RETURN BOOLEAN
    IS
    estatus_usuario VARCHAR2(25);
BEGIN
    SELECT ESTATUS
    INTO estatus_usuario
    FROM MEMBRESIAS
    WHERE USUARIO = IdUsuario;

    IF estatus_usuario <> 'Activo' THEN
        RETURN False;
    END IF;
    RETURN True;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN False;
END Membresia_Valida;

CREATE OR REPLACE FUNCTION Acceso_Zona(idUsuario NUMBER, sede_actual NUMBER, zona_actual VARCHAR2)
    RETURN BOOLEAN
    IS
    existe_beneficio VARCHAR2(1);
    tipo_membresia_ VARCHAR2(50);
BEGIN
    SELECT TIPO
    INTO tipo_membresia_
    FROM MEMBRESIAS
    WHERE USUARIO = idUsuario;

    SELECT 1 INTO existe_beneficio FROM BENEFICIOZONAS
    WHERE TIPO_MEMBRESIA = tipo_membresia_ AND SEDE = sede_actual AND ZONA = zona_actual;

    IF NOT Membresia_Valida(idUsuario) THEN
        RETURN False;
    END IF;
    IF NOT existe_beneficio THEN
        RETURN False;
    end if;

    RETURN True;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
     RETURN False;
END Acceso_Zona;
