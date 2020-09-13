SET SERVEROUTPUT ON;

DECLARE

BEGIN
    /*
    for i in 1..10 loop
        DBMS_OUTPUT.PUT_LINE (i || ' * 2 = ' || (i * 2));
    end loop;
    */
    <<ciclo_tabla_2>>
    for i in 1..10 loop
        DBMS_OUTPUT.PUT (i);
        DBMS_OUTPUT.PUT (' * 2 = ');
        DBMS_OUTPUT.PUT_LINE (i * 2);
    end loop ciclo_tabla_2;
END;
/