SET SERVEROUTPUT ON;

DECLARE
    TYPE carro IS RECORD (
        marca NVARCHAR2(100),
        modelo NVARCHAR2(100),
        puertas NUMBER
    );
    
    mazda carro;
    toyoya carro;
    
BEGIN
    mazda.marca := 'Mazda';
    mazda.modelo := 'Mazda 3';
    mazda.puertas :=4;

    toyoya.marca := 'Toyota';
    toyoya.modelo := 'Prado';
    toyoya.puertas :=5;
    
    DBMS_OUTPUT.PUT_LINE(mazda.modelo);    
END;
/