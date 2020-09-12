SET SERVEROUTPUT ON;
    
DECLARE
    A number := 5;
    B number := 10;
    
    nombre1 nvarchar2(100) := 'Edgard';
    nombre2 nvarchar2(100);
BEGIN
    IF (A <> B) THEN
        dbms_output.put_line('A es diferente a B');
    END IF;
    
    IF (nombre1 like 'E%') THEN
        dbms_output.put_line('El nombre contiene E');
    END IF;
    
    IF (A between 0 and 10) THEN
        dbms_output.put_line('A esta entre 0 a 10');
    END IF;
    
    IF (B in (5, 10, 15, 20)) THEN
        dbms_output.put_line('B esta en el grupo de elementos');
    END IF;
    
    IF (nombre2 is null) THEN
        dbms_output.put_line('El nombre2 es nulo');
    END IF;
END;
/