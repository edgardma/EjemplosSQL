SET SERVEROUTPUT ON;

DECLARE
    salarioPromedio number := 0;
    --=================================
    -- Obtener promedio
    --=================================
    function obtener_promedio
    return number
    is
        promedio    number := 0;
    begin
        select avg(salario)
        into promedio
        from empleados;
        
        return promedio;
    end;
    --==========Fin de Funcion Promedio
BEGIN
    salarioPromedio := obtener_promedio();
    DBMS_OUTPUT.put_line('El salario promedio es: ' || salariopromedio);
END;
/