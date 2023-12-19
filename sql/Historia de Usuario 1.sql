-- Juan se registra y adquiere una membresía básica
insert into Gerencia.USUARIOS (DOCUMENTO, TIPODOCUMENTO, CORREO, TELEFONO, FECHANACIMIENTO, NOMBRE, APELLIDO, GENERO, EDAD)
values (10, 'Cedula', 'PepitoPerez@skyrock.com', 3431170601, DATE '1998-07-26', 'Pepito', 'Perez', 'Masculino', 23);

insert into Gerencia.MEMBRESIAS (ID, USUARIO, TIPO, FACTURA, ESTATUS, METODOPAGO, FECHAINICIO)
values (0, 10, 'MEM_BASICA_1', 0, null, 'Tarjeta de debito', DATE '2023-12-12');

DECLARE
    valido BOOLEAN;
BEGIN
    valido := ADMINISTRACION.Acceso_Zona(10, 1, 'Zona Principal');
    DBMS_OUTPUT.PUT_LINE(valido);
end;

