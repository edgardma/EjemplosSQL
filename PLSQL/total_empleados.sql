create or replace function total_empleados
return number
is
    total   number := 0;
begin
    select count(*) 
    into total
    from empleados;
    
    return total;
end;
/