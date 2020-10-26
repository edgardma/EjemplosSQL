set serveroutput on;

declare
    a   number := 20;
    b   number := 10;
    c   number;

begin
    menor_entre(a, b, c);
    dbms_output.put_line('El menor es: ' || c);
end;
/