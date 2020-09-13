SET SERVEROUTPUT ON;

DECLARE
    x number := 10;
BEGIN
    loop
        DBMS_OUTPUT.PUT_LINE(x);
        x := x + 10;
        
        -- Se debe definir como se debe salir del loop
        if( x > 120) then
            exit;
        end if;
    end loop;
END;
/