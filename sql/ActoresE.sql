CREATE OR REPLACE PACKAGE ADMINISTRACION.PKG_ADMINISTRACION AS
    -- CRUD ZONAS
    PROCEDURE REGISTRAR_ZONA(
        P_NOMBRE      IN VARCHAR2,
        P_SEDE        IN NUMBER,
        P_DESCRIPCION IN VARCHAR2
    );

    FUNCTION OBTENER_ZONAS RETURN SYS_REFCURSOR;
    FUNCTION OBTENER_ZONA(P_NOMBRE IN VARCHAR2) RETURN SYS_REFCURSOR;
    FUNCTION OBTENER_ZONAS_SEDE(P_SEDE IN NUMBER) RETURN SYS_REFCURSOR;

    PROCEDURE ACTUALIZAR_ZONA(
        P_NOMBRE      IN VARCHAR2,
        P_SEDE        IN NUMBER,
        P_DESCRIPCION IN VARCHAR2
    );

    PROCEDURE ELIMINAR_ZONA(P_NOMBRE IN VARCHAR2, P_SEDE IN NUMBER);

    -- CRU SOLICITUDES
    PROCEDURE REGISTRAR_SOLICITUD(
        P_CREADOR     IN NUMBER,
        P_IMPORTANCIA IN NUMBER,
        P_ASUNTO      IN VARCHAR2,
        P_DESCRIPCION IN VARCHAR2
    );

    FUNCTION OBTENER_SOLICITUDES RETURN SYS_REFCURSOR;
    FUNCTION OBTENER_SOLICITUD(P_ID IN NUMBER) RETURN SYS_REFCURSOR;
    FUNCTION OBTENER_SOLICITUDES_CREADOR(P_CREADOR IN NUMBER) RETURN SYS_REFCURSOR;

    PROCEDURE ACTUALIZAR_SOLICITUD(
        P_ID          IN NUMBER,
        P_IMPORTANCIA IN NUMBER,
        P_ESTADO      IN VARCHAR2,
        P_DESCRIPCION IN VARCHAR2
    );

    -- CRUD INVENTARIO
    PROCEDURE REGISTRAR_INVENTARIO(
        P_SEDE        IN NUMBER,
        P_NOMBRE      IN VARCHAR2,
        P_PRECIO      IN NUMBER,
        P_FECHACOMPRA IN DATE,
        P_TIPO        IN VARCHAR2,
        P_DESCRIPCION IN VARCHAR2
    );

    FUNCTION OBTENER_INVENTARIO_SEDE(P_SEDE IN NUMBER) RETURN SYS_REFCURSOR;

    PROCEDURE ACTUALIZAR_INVENTARIO(
        P_ID          IN NUMBER,
        P_NOMBRE      IN VARCHAR2,
        P_PRECIO      IN NUMBER,
        P_FECHACOMPRA IN DATE,
        P_TIPO        IN VARCHAR2,
        P_DESCRIPCION IN VARCHAR2
    );

    PROCEDURE ELIMINAR_INVENTARIO(P_ID IN NUMBER);

    -- CRUD MAQUINAS
    PROCEDURE REGISTRAR_MAQUINA(
        P_ID     IN NUMBER,
        P_ESTADO IN VARCHAR2
    );

    FUNCTION OBTENER_MAQUINAS_SEDE(P_SEDE IN NUMBER) RETURN SYS_REFCURSOR;
    FUNCTION OBTENER_MAQUINA(P_ID IN NUMBER) RETURN SYS_REFCURSOR;

    PROCEDURE ACTUALIZAR_MAQUINA(
        P_ID          IN NUMBER,
        P_ESTADO      IN VARCHAR2,
        P_DESCRIPCION IN VARCHAR2,
        P_SEDE        IN NUMBER
    );

    PROCEDURE ELIMINAR_MAQUINA(P_ID IN NUMBER);

    -- CRUD ELEMENTOS
    PROCEDURE REGISTRAR_ELEMENTO(
        P_ID IN NUMBER
    );

    FUNCTION OBTENER_ELEMENTOS_SEDE(P_SEDE IN NUMBER) RETURN SYS_REFCURSOR;
    FUNCTION OBTENER_ELEMENTO(P_ID IN NUMBER) RETURN SYS_REFCURSOR;

    PROCEDURE ACTUALIZAR_ELEMENTO(
        P_ID          IN NUMBER,
        P_DESCRIPCION IN VARCHAR2
    );

    PROCEDURE ELIMINAR_ELEMENTO(P_ID IN NUMBER);

    -- CR [CREATE, READ] REGISTRO ENTRADA SALIDA
    PROCEDURE REGISTRAR_ENTRADA_SALIDA(
        P_PERSONA     IN NUMBER,
        P_ZONA        IN VARCHAR2,
        P_SEDE        IN NUMBER,
        P_FECHA       IN DATE,
        P_HORAENTRADA IN TIMESTAMP,
        P_HORASALIDA  IN TIMESTAMP
    );

    FUNCTION OBTENER_ENTRADAS_SALIDAS RETURN SYS_REFCURSOR;
    FUNCTION OBTENER_ENTRADAS_SALIDAS_PERSONA(P_PERSONA IN NUMBER) RETURN SYS_REFCURSOR;
    FUNCTION OBTENER_ENTRADAS_SALIDAS_ZONA(P_ZONA IN VARCHAR2) RETURN SYS_REFCURSOR;

    -- CR [CREATE, READ] EVENTOS
    PROCEDURE REGISTRAR_EVENTO(
        P_LIDER       IN NUMBER,
        P_SEDE        IN NUMBER,
        P_NOMBRE      IN VARCHAR2,
        P_FECHAYHORA  IN DATE,
        P_DURACION    IN NUMBER,
        P_ESTADO      IN VARCHAR2,
        P_DESCRIPCION IN VARCHAR2
    );

    FUNCTION OBTENER_EVENTOS RETURN SYS_REFCURSOR;
    FUNCTION OBTENER_EVENTO(P_ID IN NUMBER) RETURN SYS_REFCURSOR;
    FUNCTION OBTENER_EVENTOS_SEDE(P_SEDE IN NUMBER) RETURN SYS_REFCURSOR;

    -- CR [CREATE, READ] ASISTENTES
    PROCEDURE REGISTRAR_ASISTENTE(
        P_USUARIO IN NUMBER,
        P_EVENTO  IN NUMBER
    );

    FUNCTION OBTENER_ASISTENTES_EVENTO(P_EVENTO IN NUMBER) RETURN SYS_REFCURSOR;

    -- R [READ] CONTRATOS
    FUNCTION OBTENER_CONTRATOS RETURN SYS_REFCURSOR;
    FUNCTION OBTENER_CONTRATO(P_ID IN NUMBER) RETURN SYS_REFCURSOR;

    -- R [READ] EMPLEADOS
    FUNCTION OBTENER_EMPLEADOS_SEDE(P_SEDE IN NUMBER) RETURN SYS_REFCURSOR;
END;

CREATE OR REPLACE PACKAGE RECEPCION.PKG_RECEPCION AS
    -- CRUD USUARIOS
    PROCEDURE REGISTRAR_USUARIO(
        P_DOCUMENTO       IN NUMBER,
        P_TIPODOCUMENTO   IN VARCHAR2,
        P_CORREO          IN VARCHAR2,
        P_TELEFONO        IN VARCHAR2,
        P_FECHANACIMIENTO IN DATE,
        P_NOMBRE          IN VARCHAR2,
        P_APELLIDO        IN VARCHAR2,
        P_GENERO          IN VARCHAR2,
        P_EDAD            IN NUMBER
    );

    FUNCTION OBTENER_USUARIOS RETURN SYS_REFCURSOR;
    FUNCTION OBTENER_USUARIO(P_DOCUMENTO IN NUMBER) RETURN SYS_REFCURSOR;

    PROCEDURE ACTUALIZAR_USUARIO(
        P_DOCUMENTO       IN NUMBER,
        P_TIPODOCUMENTO   IN VARCHAR2,
        P_CORREO          IN VARCHAR2
    );

    PROCEDURE ELIMINAR_USUARIO(P_DOCUMENTO IN NUMBER);

    -- CR [CREATE, READ] MEMBRESIAS
    PROCEDURE REGISTRAR_MEMBRESIA(
        P_USUARIO     IN NUMBER,
        P_TIPO        IN VARCHAR2,
        P_ESTATUS     IN VARCHAR2,
        P_METODOPAGO  IN VARCHAR2,
        P_FECHAINICIO IN DATE
    );

    FUNCTION OBTENER_MEMBRESIAS RETURN SYS_REFCURSOR;
    FUNCTION OBTENER_MEMBRESIA(P_ID IN NUMBER) RETURN SYS_REFCURSOR;
    FUNCTION OBTENER_MEMBRESIAS_USUARIO(P_USUARIO IN NUMBER) RETURN SYS_REFCURSOR;

    -- R [READ] TIPOS DE MEMBRESIA
    FUNCTION OBTENER_TIPOS_MEMBRESIA RETURN SYS_REFCURSOR;
    FUNCTION OBTENER_TIPO_MEMBRESIA(P_TIPO IN VARCHAR2) RETURN SYS_REFCURSOR;

    -- R [READ] SEDES
    FUNCTION OBTENER_SEDES RETURN SYS_REFCURSOR;
    FUNCTION OBTENER_SEDE(P_ID IN NUMBER) RETURN SYS_REFCURSOR;

    -- R [READ] BENEFICIOS SEDES
    FUNCTION OBTENER_BENEFICIOS_SEDES RETURN SYS_REFCURSOR;
    FUNCTION OBTENER_BENEFICIO_SEDE(P_TIPO_MEMBRESIA IN VARCHAR2, P_SEDE IN NUMBER) RETURN SYS_REFCURSOR;

    -- R [READ] ZONAS
    FUNCTION OBTENER_ZONAS RETURN SYS_REFCURSOR;
    FUNCTION OBTENER_ZONA(P_NOMBRE IN VARCHAR2) RETURN SYS_REFCURSOR;
    FUNCTION OBTENER_ZONAS_SEDE(P_SEDE IN NUMBER) RETURN SYS_REFCURSOR;

    -- R [READ] BENEFICIOS ZONAS
    FUNCTION OBTENER_BENEFICIOS_ZONAS RETURN SYS_REFCURSOR;
    FUNCTION OBTENER_BENEFICIO_ZONA(P_TIPO_MEMBRESIA IN VARCHAR2, P_ZONA IN VARCHAR2, P_SEDE IN NUMBER) RETURN SYS_REFCURSOR;

    -- R [READ] EVENTOS
    FUNCTION OBTENER_EVENTOS RETURN SYS_REFCURSOR;
    FUNCTION OBTENER_EVENTO(P_ID IN NUMBER) RETURN SYS_REFCURSOR;
END;

CREATE OR REPLACE PACKAGE USUARIO.PKG_USUARIO AS
    -- CRD CONTROLES
    PROCEDURE REGISTRAR_CONTROL(
        P_USUARIO  IN NUMBER,
        P_FECHA    IN DATE,
        P_PESO     IN NUMBER,
        P_ALTURA   IN NUMBER,
        P_MBICEP   IN NUMBER,
        P_MTRICEP  IN NUMBER,
        P_MTORSO   IN NUMBER,
        P_MABDOMEN IN NUMBER,
        P_IMC      IN NUMBER
    );

    FUNCTION OBTENER_CONTROL(P_USUARIO IN NUMBER) RETURN SYS_REFCURSOR;

    PROCEDURE ELIMINAR_CONTROL(P_USUARIO IN NUMBER);

    -- R EVENTOS
    FUNCTION OBTENER_EVENTOS RETURN SYS_REFCURSOR;
    FUNCTION OBTENER_EVENTO(P_ID IN NUMBER) RETURN SYS_REFCURSOR;
    FUNCTION OBTENER_EVENTOS_SEDE(P_SEDE IN NUMBER) RETURN SYS_REFCURSOR;
END;

CREATE OR REPLACE PACKAGE GERENCIA.PKG_GERENCIA AS

    -- CRUD SEDES
    PROCEDURE REGISTRAR_SEDE(
        P_ID          IN NUMBER,
        P_NOMBRE      IN VARCHAR2,
        P_LUGAR       IN NUMBER
    );

    FUNCTION OBTENER_SEDES RETURN SYS_REFCURSOR;
    FUNCTION OBTENER_SEDE(P_ID IN NUMBER) RETURN SYS_REFCURSOR;

    PROCEDURE ACTUALIZAR_SEDE(
        P_ID          IN NUMBER,
        P_NOMBRE      IN VARCHAR2
    );

    PROCEDURE ELIMINAR_SEDE(P_ID IN NUMBER);

    -- CRUD LUGARES
    PROCEDURE REGISTRAR_LUGAR(
        P_PAIS         IN VARCHAR2,
        P_REGION       IN VARCHAR2,
        P_CIUDAD       IN VARCHAR2,
        P_DIRECCION    IN VARCHAR2,
        P_DETALLES     IN VARCHAR2,
        P_CODIGOPOSTAL IN VARCHAR2
    );

    FUNCTION OBTENER_LUGARES RETURN SYS_REFCURSOR;
    FUNCTION OBTENER_LUGAR(P_ID IN NUMBER) RETURN SYS_REFCURSOR;
    FUNCTION OBTENER_LUGARES_CIUDAD(P_PAIS IN VARCHAR2, P_REGION IN VARCHAR2, P_CIUDAD IN VARCHAR2) RETURN SYS_REFCURSOR;

    PROCEDURE ACTUALIZAR_LUGAR(
        P_ID       IN NUMBER,
        P_DETALLES IN VARCHAR2
    );

    PROCEDURE ELIMINAR_LUGAR(
        P_ID IN NUMBER
    );

    -- CR [CREATE, READ] EMPLEADO
    PROCEDURE REGISTRAR_EMPLEADO(
        P_DOCUMENTO       IN NUMBER,
        P_TIPODOCUMENTO   IN VARCHAR2,
        P_CORREO          IN VARCHAR2,
        P_TELEFONO        IN VARCHAR2,
        P_FECHANACIMIENTO IN DATE,
        P_NOMBRE          IN VARCHAR2,
        P_APELLIDO        IN VARCHAR2,
        P_GENERO          IN VARCHAR2,
        P_EDAD            IN NUMBER,
        P_SEDE            IN NUMBER,
        P_ESTATUS         IN VARCHAR2,
        P_CARGO           IN VARCHAR2
    );

    FUNCTION OBTENER_EMPLEADOS RETURN SYS_REFCURSOR;
    FUNCTION OBTENER_EMPLEADO(P_DOCUMENTO IN NUMBER) RETURN SYS_REFCURSOR;
    FUNCTION OBTENER_EMPLEADOS_SEDE(P_SEDE IN NUMBER) RETURN SYS_REFCURSOR;
    FUNCTION OBTENER_EMPLEADOS_ESTATUS(P_ESTATUS IN VARCHAR2) RETURN SYS_REFCURSOR;

    -- CR [CREATE, READ] CONTRATOS
    PROCEDURE REGISTRAR_CONTRATO(
        P_EMPLEADO     IN NUMBER,
        P_TIPOCONTRATO IN VARCHAR2,
        P_FECHAINICIO  IN DATE,
        P_FECHAFINAL   IN DATE,
        P_SUELDO       IN NUMBER,
        P_DESCRIPCION  IN VARCHAR2,
        P_ESTADO       IN VARCHAR2
    );

    FUNCTION OBTENER_CONTRATOS RETURN SYS_REFCURSOR;
    FUNCTION OBTENER_CONTRATO(P_ID IN NUMBER) RETURN SYS_REFCURSOR;
    FUNCTION OBTENER_CONTRATOS_EMPLEADO(P_EMPLEADO IN NUMBER) RETURN SYS_REFCURSOR;

    -- CR [CREATE, READ] TIPOS DE MEMBRESIA
    PROCEDURE REGISTRAR_TIPO_MEMBRESIA(
        P_TIPO         IN VARCHAR2,
        P_PRECIO       IN NUMBER,
        P_DURACIONDIAS IN NUMBER,
        P_DESCRIPCION  IN VARCHAR2
    );

    FUNCTION OBTENER_TIPOS_MEMBRESIA RETURN SYS_REFCURSOR;
    FUNCTION OBTENER_TIPO_MEMBRESIA(P_TIPO IN VARCHAR2) RETURN SYS_REFCURSOR;

    -- CR [CREATE, READ] BENEFICIOS SEDES
    PROCEDURE REGISTRAR_BENEFICIO_SEDE(
        P_TIPO_MEMBRESIA IN VARCHAR2,
        P_SEDE           IN NUMBER,
        P_DESCRIPCION    IN VARCHAR2
    );

    FUNCTION OBTENER_BENEFICIOS_SEDES RETURN SYS_REFCURSOR;

    -- CR [CREATE, READ] BENEFICIOS ZONAS
    PROCEDURE REGISTRAR_BENEFICIO_ZONA(
        P_TIPO_MEMBRESIA IN VARCHAR2,
        P_ZONA           IN VARCHAR2,
        P_SEDE           IN NUMBER,
        P_DESCRIPCION    IN VARCHAR2
    );

    FUNCTION OBTENER_BENEFICIOS_ZONAS RETURN SYS_REFCURSOR;
END PKG_GERENCIA;