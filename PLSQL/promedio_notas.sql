create or replace function promedio_notas(n1 number, n2 number, n3 number, n4 number)
return number is
    promedio    number := 0;
begin
    promedio := (n1 + n2 + n3 + n4) / 4;
    
    return promedio;
end;
/