create or replace function edad_actual(fechanacimiento in date)
return number is
    edad    number(3) := 0;
begin
    edad := trunc((to_number(to_char(sysdate, 'yyyymmdd')) - to_number(to_char(fechanacimiento, 'yyyymmdd'))) / 10000);
    
    return edad;
    
    exception
    when others then
        edad := 0;
    return edad;
end;