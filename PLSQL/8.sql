SET SERVEROUTPUT ON;

DECLARE
    nota number := 66;
    
BEGIN
    -- IF (nota in (68, 69)) THEN
    IF (nota between 67 and 69) THEN
        nota := 70;
    END IF;
    
    dbms_output.put_line('Nota: ' || nota);
    
    IF (nota >= 70) THEN
        dbms_output.put_line('Paso la clase');
    ELSE
        dbms_output.put_line('Lo siento... reprobo la clase');
    END IF;
END;
/