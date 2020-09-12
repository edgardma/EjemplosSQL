SET SERVEROUTPUT ON;

DECLARE 
-- Definicion de funciones y variables
    salario         NUMBER := 1500;
    nombreEmpleado  NVARCHAR2(100);
    activo          BOOLEAN;
    fecha           DATE;
    
BEGIN
    nombreEmpleado := 'Edgard Marquez';
    activo := TRUE;
    fecha := '26-06-2020';
    
    dbms_output.put_line('Nombre: ' || nombreEmpleado);
    dbms_output.put_line('Salario: ' || salario);
    dbms_output.put_line('Fecha: ' || fecha);
    dbms_output.put_line('Activo: ' || CASE WHEN activo THEN 'Si' ELSE 'No' END); 
END;
/