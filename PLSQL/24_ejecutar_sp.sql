SET SERVEROUTPUT ON;
-- Invocar a un SP
execute hola_mundo();

select * from empleados;
execute actualiza_fecha_empleados();
select * from empleados;

select a.*,
        promedio_notas(nota1, nota2, nota3, nota4) as promedio
from notas a;