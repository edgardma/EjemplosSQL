SET SERVEROUTPUT ON;

DECLARE
    empleados   number;
BEGIN
    empleados := total_empleados();
    DBMS_OUTPUT.PUT_LINE('Total empleados: ' || empleados);
    
    -- select total_empleados from dual;
END;
/