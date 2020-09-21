SET SERVEROUTPUT ON;

DECLARE
    a   number := 10;
    b   number := 25;
    z   number;
BEGIN
    z:= mayor_entre(10, 25);
    DBMS_OUTPUT.put_line('El mayor es: ' || z);
END;
/