SET SERVEROUTPUT ON;

DECLARE
    numero      number := 4;
    factorial   number;
    
BEGIN

    factorial := 1;
    
    for i in 1..numero loop
        factorial := factorial * i;
    end loop;
    
    DBMS_OUTPUT.PUT_LINE(factorial);
END;
/