create or replace procedure actualiza_fecha_empleados
as
begin
    update empleados set 
    actualizado = sysdate;
end;
/