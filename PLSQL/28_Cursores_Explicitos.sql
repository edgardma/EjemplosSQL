SET SERVEROUTPUT ON;

DECLARE
    nombre  nvarchar2(200);
    salario number;
    
    CURSOR c_empleado is
    SELECT nombre, salario
    FROM empleados
    ORDER BY nombre ASC;
BEGIN
    OPEN c_empleado;
    LOOP
        FETCH c_empleado INTO nombre, salario;
        EXIT WHEN c_empleado%NOTFOUND;
        
        DBMS_OUTPUT.PUT_LINE(nombre || ' ' || salario);
        
    END LOOP;
    
    CLOSE c_empleado;
END;
/