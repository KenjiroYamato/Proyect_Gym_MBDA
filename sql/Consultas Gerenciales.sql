--Consultar Total de Beneficios de Todas las Sedes
CREATE OR REPLACE FUNCTION Gerencia.calcular_beneficios_totales(p_fecha_inicial IN DATE, p_fecha_final IN DATE)
    RETURN NUMBER
IS
    total_ingresos NUMBER(20);
    total_egresos_sueldos NUMBER(20);
    total_egresos_inventario NUMBER(20);
    beneficios_totales NUMBER(20);
BEGIN
    -- Calcular ingresos (SUM de VALOR en FACTURAS)
    SELECT SUM(VALOR)
    INTO total_ingresos
    FROM Gerencia.FACTURAS
    WHERE MOMENTOPAGO BETWEEN p_fecha_inicial AND p_fecha_final;

    -- Calcular egresos (SUM de VALOR de EGRESOS)
    SELECT SUM(SUELDO)
    INTO total_egresos_sueldos
    FROM Gerencia.CONTRATOS
    WHERE FECHAINICIO BETWEEN p_fecha_inicial AND p_fecha_final;

    SELECT SUM(PRECIO)
    INTO total_egresos_inventario
    FROM Administracion.INVENTARIO
    WHERE FECHACOMPRA BETWEEN p_fecha_inicial AND p_fecha_final;

    -- Calcular beneficios totales (Ingresos - Egresos)
    beneficios_totales := total_ingresos - total_egresos_sueldos - total_egresos_inventario;

    -- Devolver el resultado
    RETURN beneficios_totales;
EXCEPTION
    WHEN OTHERS THEN
        -- Manejar cualquier excepción que pueda ocurrir
        RETURN NULL;
END calcular_beneficios_totales;

--Obtener el numero de membresias que se compraron en cada mes y cuantos ingesos estas generaron
DECLARE
    beneficios NUMBER;
BEGIN
    beneficios := Gerencia.calcular_beneficios_totales(TO_DATE('2020-12-01', 'YYYY-MM-DD'), TO_DATE('2023-12-31', 'YYYY-MM-DD'));
    DBMS_OUTPUT.PUT_LINE('Beneficios totales: ' || beneficios);
END;

CREATE VIEW VistaMembresiasIngresos AS
SELECT
    TO_CHAR(FECHAINICIO, 'YYYY-MM') AS MES,
    COUNT(MEMBRESIAS.FACTURA) AS NUMERO_DE_MEMBRESIAS,
    SUM(FACTURAS.VALOR) AS INGRESOS_GENERADOS
FROM
    Gerencia.MEMBRESIAS
JOIN Gerencia.FACTURAS ON MEMBRESIAS.Factura = FACTURAS.ID
GROUP BY
    TO_CHAR(FECHAINICIO, 'YYYY-MM')
ORDER BY
    TO_CHAR(FECHAINICIO, 'YYYY-MM');

--Obtener en Orden Decendente que Tipo de Membresias Son las Mas Compradas
CREATE VIEW VistaMembresiasMasCompradas AS
SELECT TIPO, COUNT(*) AS TOTAL_COMPRAS
FROM Gerencia.MEMBRESIAS
GROUP BY TIPO
ORDER BY TOTAL_COMPRAS DESC;