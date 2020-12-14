SET SERVEROUTPUT ON;

DECLARE
    empleado empleados%ROWTYPE;
    
    CURSOR c_empleados IS 
    SELECT * FROM empleados;
    
    -- PROCEDIMIENTO 
    PROCEDURE imprimir_empleado(empleado empleados%ROWTYPE) IS
    salarioDiario NUMBER;
    BEGIN
        salarioDiario := empleado.salario / 30;
        DBMS_OUTPUT.PUT_LINE('===============================');
        DBMS_OUTPUT.PUT_LINE('Nombre: ' || empleado.nombre);
        DBMS_OUTPUT.PUT_LINE('Salario diario: ' || ROUND(salarioDiario, 2));
        DBMS_OUTPUT.PUT_LINE('Dias trabajados: ' || empleado.diastrabajados);
        DBMS_OUTPUT.PUT_LINE('Salario a pagar: ' || ROUND((salarioDiario * empleado.diastrabajados), 2));
        DBMS_OUTPUT.PUT_LINE('===============================');
    END;
    -- FIN PROCEDIMIENTO
BEGIN
    OPEN c_empleados;
    LOOP
        FETCH c_empleados INTO empleado;
        EXIT WHEN c_empleados%NOTFOUND;
        
        imprimir_empleado(empleado);
    END LOOP;
    CLOSE c_empleados;
END;
/