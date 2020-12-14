SET SERVEROUTPUT ON;

DECLARE
    reg_empleado empleados%rowtype;
    
BEGIN
    SELECT *
    INTO reg_empleado
    FROM empleados
    WHERE id = 5;
    
    DBMS_OUTPUT.PUT_LINE(reg_empleado.nombre);
    DBMS_OUTPUT.PUT_LINE(reg_empleado.id);
    DBMS_OUTPUT.PUT_LINE(reg_empleado.salario);
    DBMS_OUTPUT.PUT_LINE(reg_empleado.actualizado);
    
END;
/