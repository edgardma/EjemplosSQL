SET SERVEROUTPUT ON;

DECLARE

BEGIN
    -- Luego de cada sentencia que afecta a datos (SELECT, INSERT, UPDATE, DELETE)
    -- Se crea un cursor implicito
    update empleados set actualizado = sysdate;
    -- En esta instrcuccion se accede a los datos de este cursor
    -- En la siguiente variable de Oracle, devuelve los registros afectados por la ultima sentencia
    dbms_output.put_line('Afectados: ' || SQL%ROWCOUNT);
    
    -- Devuelve TRUE si la última sentencia devolvio registros
    if (SQL%FOUND) then
        dbms_output.put_line('Encontro registros');
    else
        dbms_output.put_line('No encontro registros');
    end if;
    
    -- Devuelve TRUE si la última sentencia NO devolvio registros
    if (SQL%NOTFOUND) then
        dbms_output.put_line('No encontro registros');
    else
        dbms_output.put_line('Encontro registros');
    end if;
    
    -- Se se va utilizar un commit, este se debe ejecutar luego de consultar los datos del cursor implicito
    commit;
END;
/