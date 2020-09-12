SET SERVEROUTPUT ON;

DECLARE
    nombre          nvarchar2(100) := ' Edgard ';
    apellido        nvarchar2(100) := ' Marquez ';
    nombreCompleto  nvarchar2(200);
    hoy             date := sysdate;
    nombre2         nvarchar2(100);
    
BEGIN
    nombreCompleto := trim(nombre) || ' ' || trim(apellido);
    
    -- Funciones con textos o variables String
    SYS.dbms_output.put_line('Largo: ' || length(nombre));
    SYS.dbms_output.put_line('Trim: ' || trim(nombre) || ';');
    SYS.dbms_output.put_line('Minusculas: ' || lower(nombre));
    SYS.dbms_output.put_line('Mayusculas: ' || upper(nombre));
    
    nombre := trim(nombre);
    SYS.dbms_output.put_line('Cortar: ' || substr(nombre, 1, 3));
    SYS.dbms_output.put_line('Reemplazo: ' || replace(nombre, 'g', 'w'));
    SYS.dbms_output.put_line('Reemplazo: ' || replace(nombre, 'g', 'w'));
    SYS.dbms_output.put_line('Concatenar: ' || nombreCompleto);
    
    -- Funcion de fecha
    SYS.dbms_output.put_line('Hoy: ' || hoy);
    SYS.dbms_output.put_line('Agregar mes: ' || add_months(hoy, 1));
    SYS.dbms_output.put_line('Agregar dia: ' || (hoy + 1));
    SYS.dbms_output.put_line('Dia: ' || to_char(hoy, 'dd'));
    SYS.dbms_output.put_line('Dia Mes: ' || to_char(hoy, 'dd-MM'));
    SYS.dbms_output.put_line('Anio: ' || to_char(hoy, 'yyyy'));
    SYS.dbms_output.put_line('NVL: ' || nvl(nombre2, 'NULL'));
END;
/