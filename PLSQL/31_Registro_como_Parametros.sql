SET SERVEROUTPUT ON;

DECLARE
    TYPE carro IS RECORD (
        marca NVARCHAR2(100),
        modelo NVARCHAR2(100),
        puertas NUMBER
    );
    
    mazda carro;
    toyoya carro;
    
    -- Procedimiento de impresion
    PROCEDURE imprimir_carro(car carro) IS
    BEGIN
        DBMS_OUTPUT.PUT_LINE('-----------------');
        DBMS_OUTPUT.PUT_LINE(car.marca);
        DBMS_OUTPUT.PUT_LINE(car.modelo);
        DBMS_OUTPUT.PUT_LINE(car.puertas);
    END;
    -- Fin Procedimiento de impresion
BEGIN
    mazda.marca := 'Mazda';
    mazda.modelo := 'Mazda 3';
    mazda.puertas :=4;

    toyoya.marca := 'Toyota';
    toyoya.modelo := 'Prado';
    toyoya.puertas := 5;
    
    imprimir_carro(mazda);
    imprimir_carro(toyoya);
END;
/