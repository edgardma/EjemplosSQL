SET SERVEROUTPUT ON;

DECLARE
    salarioBase     number := 900;
    aumento         number;
    baseConaumento  number;

BEGIN
    IF (salarioBase between 0 and 600) THEN
        aumento := salarioBase * 0.15;
    ELSIF (salarioBase <= 950) THEN
        aumento := salarioBase *0.135;
    ELSIF (salarioBase <= 1400) THEN
        aumento := salarioBase * 0.10;
    ELSE
        aumento := salarioBase * 0.05;
    END IF;
    
    baseConAumento := salarioBase + aumento;
    
    dbms_output.put_line('Salario Base: ' || salarioBase);
    dbms_output.put_line('Aumento: ' || aumento);
    dbms_output.put_line('Nuevo Salario: ' || baseConaumento);
END;
/