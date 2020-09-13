SET SERVEROUTPUT ON;

DECLARE
    y   number := 20;
BEGIN
    while (y <= 100) loop
        DBMS_OUTPUT.PUT_LINE(y);
        
        y := y + 20;
    end loop;
END;
/