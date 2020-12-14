SET SERVEROUTPUT ON;

DECLARE
    nombre NVARCHAR2(100);

BEGIN
    SELECT nombre 
    INTO nombre
    FROM empleados
    WHERE id = 20;
    
    DBMS_OUTPUT.PUT_LINE(nombre);
    
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No encontro empleado con ese codigo');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Algo raro pasó');
END;
/