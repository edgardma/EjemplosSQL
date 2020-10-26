set serveroutput on;

declare
    promedio    number;
begin
    for fila in (select * from notas order by nombre) loop
        promedio := (fila.nota1 + fila.nota2 + fila.nota3 + fila.nota4) / 4;
        
        dbms_output.put_line('Nombre: ' || fila.nombre || ', promedio: ' || promedio);
    end loop;
end;
/