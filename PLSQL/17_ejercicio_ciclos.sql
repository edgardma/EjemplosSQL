SET SERVEROUTPUT ON;

DECLARE
    type            notasArray is varray(4) of number;
    notas           notasArray := notasArray(95, 60, 75, 85);
    promedio        number(6,2) := 0;
BEGIN
    for i in 1..4 loop
        promedio := promedio + notas(i);
    end loop;
    
    promedio := promedio / 4;
    DBMS_OUTPUT.PUT_LINE(promedio);
END;
/