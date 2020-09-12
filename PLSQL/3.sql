SET SERVEROUTPUT ON;

DECLARE
    -- Constantes
    PI CONSTANT Number := 3.141559;
    
    -- Variables
    area number;
    radio number;
BEGIN
    radio := 7;
    area := PI * (radio * radio);
    dbms_output.put_line('Area: ' || ROUND(area, 2) || 'cm2');
END;
/