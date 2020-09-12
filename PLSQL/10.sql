SET SERVEROUTPUT ON;

DECLARE
    ran number := round(dbms_random.value(0, 9));

BEGIN
    dbms_output.put_line(ran);
    
    CASE 
        when ran = 0 then
            dbms_output.put_line('Cero');
        when ran = 1 then
            dbms_output.put_line('Uno');
        when ran = 2 then
            dbms_output.put_line('Dos');
        when ran = 3 then
            dbms_output.put_line('Tres');
        when ran = 4 then
            dbms_output.put_line('Cuatro');
        when ran = 5 then
            dbms_output.put_line('Cinco');
        when ran = 6 then
            dbms_output.put_line('Seis');
        when ran = 7 then
            dbms_output.put_line('Siete');
        when ran = 8 then
            dbms_output.put_line('Ocho');
        else
            dbms_output.put_line('Nueve');
    END CASE;
END;
/