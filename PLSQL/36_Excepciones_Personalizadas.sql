SET SERVEROUTPUT ON;

DECLARE
    ran NUMBER := ROUND(DBMS_RANDOM.VALUE(1, 3));
    error_1 EXCEPTION;
    error_2 EXCEPTION;
    error_3 EXCEPTION;

BEGIN
    CASE 
        WHEN ran = 1 THEN
            RAISE error_1;
        WHEN ran = 2 THEN
            RAISE error_2;
        WHEN ran = 3 THEN
            RAISE error_3;
    END CASE;
    
    DBMS_OUTPUT.PUT_LINE('No se ejecutará');
    
EXCEPTION
    WHEN error_1 THEN
        DBMS_OUTPUT.PUT_LINE('Error 1');
    WHEN error_2 THEN
        DBMS_OUTPUT.PUT_LINE('Error 2');
    WHEN error_3 THEN
        DBMS_OUTPUT.PUT_LINE('Error 3');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Algo raro pasó');
END;
/