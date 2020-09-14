SET SERVEROUTPUT ON;

DECLARE
    numero      number := 4;
    factorial   number;
    
BEGIN

    factorial := numero;
    
    <<while_factorial>>
    while numero > 1 loop
        numero := numero -1;
        factorial := factorial * numero;
    end loop while_factorial;
    
    DBMS_OUTPUT.PUT_LINE(factorial);
END;
/