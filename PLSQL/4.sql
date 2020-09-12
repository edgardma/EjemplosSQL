SET SERVEROUTPUT ON;

DECLARE
    cantidad    NUMBER;
    usuario     NVARCHAR2(100);
    
BEGIN
    /*
    SELECT COUNT(*) INTO cantidad FROM dual;
    SELECT user INTO usuario FROM dual;
    SYS.dbms_output.put_line('Usuario:  ' || usuario);
    SYS.dbms_output.put_line('Cantidad: ' || cantidad);
    */
    SELECT user, COUNT(*) INTO usuario, cantidad FROM dual;
    
    SYS.dbms_output.put_line('Usuario:  ' || usuario);
    SYS.dbms_output.put_line('Cantidad: ' || cantidad);
END;
/