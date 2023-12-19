--Consultar Total de Beneficios de Todas las Sedes
CREATE OR REPLACE FUNCTION calcular_beneficios_totales(p_fecha_inicial IN DATE, p_fecha_final IN DATE)
    RETURN NUMBER
IS
    total_ingresos NUMBER(50);
    total_egresos NUMBER(50);
    beneficios_totales NUMBER(50);
BEGIN
    -- Calcular ingresos (SUM de VALOR en FACTURAS)
    SELECT NVL(SUM(VALOR), 0)
    INTO total_ingresos
    FROM Gerencia.FACTURAS
    WHERE MOMENTOPAGO BETWEEN p_fecha_inicial AND p_fecha_final;

    -- Calcular egresos (SUM de VALOR en FACTURAS con DETALLES que indican egreso)
    SELECT NVL(SUM(VALOR), 0)
    INTO total_egresos
    FROM Gerencia.FACTURAS
    WHERE MOMENTOPAGO BETWEEN p_fecha_inicial AND p_fecha_final;

    -- Calcular beneficios totales (Ingresos - Egresos)
    beneficios_totales := total_ingresos - total_egresos;

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
    beneficios := calcular_beneficios_totales(TO_DATE('2023-01-01', 'YYYY-MM-DD'), TO_DATE('2023-12-31', 'YYYY-MM-DD'));
    DBMS_OUTPUT.PUT_LINE('Beneficios totales: ' || beneficios);
END;

CREATE VIEW VistaMembresiasIngresos AS
SELECT
    TO_CHAR(MOMENTOPAGO, 'YYYY-MM') AS MES,
    COUNT(MEMBRESIAS.FACTURA) AS NUMERO_DE_MEMBRESIAS,
    SUM(FACTURAS.VALOR) AS INGRESOS_GENERADOS
FROM
    Gerencia.MEMBRESIAS
JOIN Gerencia.FACTURAS ON MEMBRESIAS.Factura = FACTURAS.ID
GROUP BY
    TO_CHAR(MOMENTOPAGO, 'YYYY-MM')
ORDER BY
    TO_CHAR(MOMENTOPAGO, 'YYYY-MM');

--Obtener en Orden Decendente que Tipo de Membresias Son las Mas Compradas
CREATE VIEW VistaMembresiasMasCompradas AS
SELECT TIPO_MEMBRESIA, COUNT(*) AS TOTAL_COMPRAS
FROM Gerencia.MEMBRESIAS
GROUP BY TIPO_MEMBRESIA
ORDER BY TOTAL_COMPRAS DESC;