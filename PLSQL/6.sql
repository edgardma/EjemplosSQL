SET SERVEROUTPUT ON;

DECLARE
    -- Definir los arreglos
    TYPE alumnosArray   IS VARRAY(5) OF NVARCHAR2(100);
    TYPE notasArray     IS VARRAY(5) OF NUMBER;
    
    -- Utilizar los arreglos
    alumnos     alumnosArray;
    notas       notasArray;
    
BEGIN
    alumnos:= alumnosArray('Fernando', 'Melisa', 'Andrea', 'Antonio', 'Clarissa');
    notas:= notasArray(10, 15, 11, 13, 16);
    
    dbms_output.put_line(alumnos(1));
    dbms_output.put_line(alumnos(2));
    dbms_output.put_line(alumnos(3));
    
    dbms_output.put_line(notas(1));
    --dbms_output.put_line(notas(2));
    --dbms_output.put_line(notas(3));
    
    notas(1):= 15;
    dbms_output.put_line(notas(1));
END;
/