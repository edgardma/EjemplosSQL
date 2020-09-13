SET SERVEROUTPUT ON;

DECLARE

BEGIN
    <<ciclo_tabla_2>>
    for i in 1..20 loop
        -- No ejecuta el 2, se pasa al 3
        if (i = 2) then
            continue;
        end if;
        
        -- Imprimir solo números pares
        if (mod(i, 2) <> 0) then
            continue;
        end if;
    
        DBMS_OUTPUT.PUT (i);
        DBMS_OUTPUT.PUT (' * 2 = ');
        DBMS_OUTPUT.PUT_LINE (i * 2);
        
        -- Salir del bucle FOR
        if (i = 10) then
            exit;
        end if;
        
    end loop ciclo_tabla_2;
END;
/