/*
Autor: Edgard M. Marquez A.
Version: 1.1.0
*/
SET SERVEROUTPUT ON;

DECLARE
    nombrePaquete   VARCHAR2(250) := 'package pe.com.dyd.ejemplo.servicio.model.entity';
    autor           VARCHAR2(250) := 'Edgard M. Marquez A.';
    version         VARCHAR2(10)  := '1.0';
    ownerTabla      all_tab_cols.OWNER%type;
    nombreTabla     all_tab_cols.table_name%type;
    columnas        all_tab_cols%ROWTYPE;
    columnasId      all_tab_cols%ROWTYPE;
    
    -- Cursor de las tablas
    CURSOR c_tablas IS
    SELECT DISTINCT OWNER, table_name
    FROM all_tab_cols 
    WHERE table_name IN ('CLIENTES');
    
    -- Cursor de las columnas de las tablas
    CURSOR c_columnas IS 
    SELECT * 
    FROM all_tab_cols
    WHERE table_name = nombreTabla
    ORDER BY COLUMN_ID;
    
    -- Cursor de las columnas Id de las tablas
    CURSOR c_columnasId IS 
    SELECT a.* 
    FROM all_tab_cols a
    INNER JOIN (
            SELECT
               all_cons_columns.*
            FROM all_constraints, all_cons_columns 
            WHERE all_constraints.constraint_type = 'P'
              AND all_constraints.constraint_name = all_cons_columns.constraint_name
              AND all_constraints.OWNER = all_cons_columns.OWNER
            ORDER BY all_cons_columns.OWNER,
               all_cons_columns.table_name, 
               all_cons_columns.position
    ) b ON (a.table_name = b.table_name AND a.column_name = b.column_name)
    WHERE a.table_name = nombreTabla
    ORDER BY a.COLUMN_ID;
    
    -- Formatear el nombre de un objeto
    FUNCTION obtenerNombreAtributo(columna  VARCHAR,
                                   inicio   NUMBER)
    RETURN VARCHAR2
    IS
        nombreAtributo  VARCHAR2(150);
        letra           VARCHAR2(15);
        nombreJava      VARCHAR2(150) := '';
        contador        NUMBER(2) := 1;
        flag            NUMBER(1) := 0;
    BEGIN
        nombreAtributo := columna;
        
        IF (inicio > 1) THEN
            nombreJava := UPPER(SUBSTR(nombreAtributo, 1, 1));
            contador := inicio;
        END IF;
        
        -- Obtener el nombre del atributo
        WHILE contador <= LENGTH(nombreAtributo) LOOP 
            letra := SUBSTR(nombreAtributo, contador, 1);
            
            IF (letra = '_') THEN
                flag := 1;
            ELSE
                IF (flag = 1) THEN
                    nombreJava := CONCAT(nombreJava, UPPER(letra));
                ELSE
                    nombreJava := CONCAT(nombreJava, LOWER(letra));
                END IF;
                
                flag := 0;
            END IF;
            
            contador := contador + 1; 
        END LOOP;   
        
        RETURN nombreJava;
    END;
    
    -- Devolver el tipo de variable
    FUNCTION obtenerTipoVariable(columna   all_tab_cols%ROWTYPE)
    RETURN VARCHAR2
    IS
        tipoDato        VARCHAR2(50) := '';
    BEGIN
        -- Obtener el tipo de variable Java
        CASE 
             WHEN columna.data_type = 'NUMBER' AND columna.data_precision = 1  AND columna.data_scale = 0 THEN tipoDato := 'Boolean ';
             WHEN columna.data_type = 'NUMBER' AND columna.data_precision >= 10 AND columna.data_scale = 0 THEN tipoDato := 'Long ';
             WHEN columna.data_type = 'NUMBER' AND columna.data_precision <  10 AND columna.data_scale = 0 THEN tipoDato := 'Integer ';
             WHEN columna.data_type = 'NUMBER' AND columna.data_scale > 3  THEN tipoDato := 'Double ';
             WHEN columna.data_type = 'NUMBER' AND columna.data_scale <= 3 THEN tipoDato := 'BigDecimal ';
             WHEN columna.data_type = 'CHAR' THEN tipoDato := 'String ';
             WHEN columna.data_type = 'VARCHAR2' THEN tipoDato := 'String ';
             WHEN columna.data_type = 'DATE' THEN tipoDato := 'Date ';
             WHEN columna.data_type = 'TIMESTAMP(6)' THEN tipoDato := 'Date ';
             ELSE tipoDato := columna.data_type;
        END CASE;
        
        RETURN tipoDato;
    END;
    
    -- PROCEDIMIENTO IMPRIMIR tablaId
    PROCEDURE imprimirTablaId(ownerTabla      all_tab_cols.OWNER%type, 
                              nombreTabla     all_tab_cols.table_name%type) IS
        nombre          VARCHAR2(150);
        nombreJava      VARCHAR2(150) := '';
    BEGIN
        nombreJava := obtenerNombreAtributo(nombreTabla, 2);
        
        -- Imprimir la cabecera de de la clase
        DBMS_OUTPUT.PUT_LINE(nombrePaquete || '.id;');
        DBMS_OUTPUT.PUT_LINE('');
        
        DBMS_OUTPUT.PUT_LINE('import javax.persistence.Column;');
        DBMS_OUTPUT.PUT_LINE('import javax.persistence.Entity;');
        DBMS_OUTPUT.PUT_LINE('import javax.persistence.Id;');
        DBMS_OUTPUT.PUT_LINE('import java.io.Serializable;');
        DBMS_OUTPUT.PUT_LINE('import java.util.Date;');
        DBMS_OUTPUT.PUT_LINE('import lombok.Data;');
        DBMS_OUTPUT.PUT_LINE('');
        
        DBMS_OUTPUT.PUT_LINE('/**');
        DBMS_OUTPUT.PUT_LINE('* Clase Id que contiene los atributos de la PK de la entidad ' || nombreJava);
        DBMS_OUTPUT.PUT_LINE('*');
        DBMS_OUTPUT.PUT_LINE('* @author ' || autor );
        DBMS_OUTPUT.PUT_LINE('* @version ' || version || ', ' || TO_DATE(sysdate, 'DD/MM/YYYY') );
        DBMS_OUTPUT.PUT_LINE('*/');
        
        DBMS_OUTPUT.PUT_LINE('@Data');
        DBMS_OUTPUT.PUT_LINE('public class '|| nombreJava ||'Id implements Serializable {');
        DBMS_OUTPUT.PUT_LINE('');
    END;
    -- FIN PROCEDIMIENTO
    
    -- PROCEDIMIENTO IMPRIMIR tabla
    PROCEDURE imprimirTabla(ownerTabla      all_tab_cols.OWNER%type, 
                            nombreTabla     all_tab_cols.table_name%type) IS
        nombre          VARCHAR2(150);
        nombreJava      VARCHAR2(150) := '';
    BEGIN
        nombreJava := obtenerNombreAtributo(nombreTabla, 2);
        
        -- Imprimir la cabecera de de la clase
        DBMS_OUTPUT.PUT_LINE(nombrePaquete || ';');
        DBMS_OUTPUT.PUT_LINE('');
        
        DBMS_OUTPUT.PUT_LINE('import javax.persistence.Column;');
        DBMS_OUTPUT.PUT_LINE('import javax.persistence.Entity;');
        DBMS_OUTPUT.PUT_LINE('import javax.persistence.Id;');
        DBMS_OUTPUT.PUT_LINE('import javax.persistence.IdClass;');
        DBMS_OUTPUT.PUT_LINE('import javax.persistence.Table;');
        DBMS_OUTPUT.PUT_LINE('import java.io.Serializable;');
        DBMS_OUTPUT.PUT_LINE('import java.math.BigDecimal;');
        DBMS_OUTPUT.PUT_LINE('import java.util.Date;');
        DBMS_OUTPUT.PUT_LINE('import lombok.Data;');
        DBMS_OUTPUT.PUT_LINE('');
        
        DBMS_OUTPUT.PUT_LINE('/**');
        DBMS_OUTPUT.PUT_LINE('* Clase que contiene los atributos de la entidad ' || nombreJava);
        DBMS_OUTPUT.PUT_LINE('*');
        DBMS_OUTPUT.PUT_LINE('* @author ' || autor );
        DBMS_OUTPUT.PUT_LINE('* @version ' || version || ', ' || TO_DATE(sysdate, 'DD/MM/YYYY') );
        DBMS_OUTPUT.PUT_LINE('*/');
        
        DBMS_OUTPUT.PUT_LINE('@Entity');
        DBMS_OUTPUT.PUT_LINE('@Data');
        DBMS_OUTPUT.PUT_LINE('@Table(name = "' || nombreTabla ||'", schema = "'|| ownerTabla ||'")');
        DBMS_OUTPUT.PUT_LINE('@IdClass('|| nombreJava ||'Entity.class)');
        DBMS_OUTPUT.PUT_LINE('public class '|| nombreJava ||'Entity implements Serializable {');
        DBMS_OUTPUT.PUT_LINE('');
    END;
    -- FIN PROCEDIMIENTO
    
    -- PROCEDIMIENTO IMPRIMIR COLUMNA
    PROCEDURE imprimirColumna(columna   all_tab_cols%ROWTYPE) IS
        tipoDato        VARCHAR2(50);
        nombreJava      VARCHAR2(150) := '';
        nombrePk        VARCHAR2(150) := '';
        comentario      VARCHAR2(350) := '';
    BEGIN
        nombreJava := obtenerNombreAtributo(columna.column_name, 1);
        tipoDato := obtenerTipoVariable(columna);
        
        -- Detectar si el campo es parte de la PK
        BEGIN
            SELECT
               all_cons_columns.column_name
            INTO  nombrePk
            FROM all_constraints, all_cons_columns 
            WHERE all_constraints.constraint_type = 'P'
              AND all_constraints.constraint_name = all_cons_columns.constraint_name
              AND all_constraints.OWNER = all_cons_columns.OWNER
              AND all_cons_columns.table_name = columna.table_name
              AND all_cons_columns.column_name = columna.column_name
            ORDER BY all_cons_columns.OWNER,
               all_cons_columns.table_name, 
               all_cons_columns.position;
        EXCEPTION
        WHEN NO_DATA_FOUND THEN
            nombrePk := '';
        END;
        
        -- Poner los comentarios
        BEGIN
            SELECT SYS.ALL_COL_COMMENTS.COMMENTS
            INTO comentario
            FROM SYS.ALL_TAB_COLUMNS
            INNER JOIN SYS.ALL_COL_COMMENTS ON SYS.ALL_TAB_COLUMNS.COLUMN_NAME = SYS.ALL_COL_COMMENTS.COLUMN_NAME 
                AND SYS.ALL_TAB_COLUMNS.TABLE_NAME = SYS.ALL_COL_COMMENTS.TABLE_NAME 
                AND SYS.ALL_TAB_COLUMNS.OWNER = SYS.ALL_COL_COMMENTS.OWNER
            WHERE SYS.ALL_TAB_COLUMNS.table_name = columna.table_name
              AND SYS.ALL_TAB_COLUMNS.COLUMN_NAME = columna.column_name;
        EXCEPTION
        WHEN NO_DATA_FOUND THEN
            comentario := '';
        END;
        
        -- Imprimir los datosde del atributo
        DBMS_OUTPUT.PUT_LINE('    /**');
        DBMS_OUTPUT.PUT_LINE('     * ' || comentario);
        DBMS_OUTPUT.PUT_LINE('     */');
        
        -- Si es PK, marcarlo como tal
        IF (NVL(nombrePk, '') = columna.column_name) THEN
            DBMS_OUTPUT.PUT_LINE('    @Id');
        END IF;
        
        DBMS_OUTPUT.PUT_LINE('    @Column(name = "' || columna.column_name || '")');
        DBMS_OUTPUT.PUT_LINE('    private ' || tipoDato || nombreJava || ';');
        DBMS_OUTPUT.PUT_LINE('    ');
    END;
    -- FIN PROCEDIMIENTO
    
    -- PROCEDIMIENTO IMPRIMIR COLUMNA ID
    PROCEDURE imprimirColumnaId(columna   all_tab_cols%ROWTYPE) IS
        tipoDato        VARCHAR2(50);
        nombreJava      VARCHAR2(150) := '';
        nombrePk        VARCHAR2(150) := '';
        comentario      VARCHAR2(350) := '';
    BEGIN
        nombreJava := obtenerNombreAtributo(columna.column_name, 1);
        tipoDato := obtenerTipoVariable(columna);
        
        -- Poner los comentarios
        BEGIN
            SELECT SYS.ALL_COL_COMMENTS.COMMENTS
            INTO comentario
            FROM SYS.ALL_TAB_COLUMNS
            INNER JOIN SYS.ALL_COL_COMMENTS ON SYS.ALL_TAB_COLUMNS.COLUMN_NAME = SYS.ALL_COL_COMMENTS.COLUMN_NAME 
                AND SYS.ALL_TAB_COLUMNS.TABLE_NAME = SYS.ALL_COL_COMMENTS.TABLE_NAME 
                AND SYS.ALL_TAB_COLUMNS.OWNER = SYS.ALL_COL_COMMENTS.OWNER
            WHERE SYS.ALL_TAB_COLUMNS.table_name = columna.table_name
              AND SYS.ALL_TAB_COLUMNS.COLUMN_NAME = columna.column_name;
        EXCEPTION
        WHEN NO_DATA_FOUND THEN
            comentario := '';
        END;
        
        -- Imprimir los datosde del atributo
        DBMS_OUTPUT.PUT_LINE('    /**');
        DBMS_OUTPUT.PUT_LINE('     * ' || comentario);
        DBMS_OUTPUT.PUT_LINE('     */');
        
        DBMS_OUTPUT.PUT_LINE('    @Id');
        DBMS_OUTPUT.PUT_LINE('    @Column(name = "' || columna.column_name || '")');
        DBMS_OUTPUT.PUT_LINE('    private ' || tipoDato || nombreJava || ';');
        DBMS_OUTPUT.PUT_LINE('    ');
    END;
    -- FIN PROCEDIMIENTO
BEGIN
    OPEN c_tablas;
    LOOP
        FETCH c_tablas INTO ownerTabla, nombreTabla;
        EXIT WHEN c_tablas%NOTFOUND;
        
        imprimirTablaId(ownerTabla, nombreTabla);
        
        OPEN c_columnasId;
        LOOP
            FETCH c_columnasId INTO columnasId;
            EXIT WHEN c_columnasId%NOTFOUND;
            
            imprimirColumnaId(columnasId);
        END LOOP;
        DBMS_OUTPUT.PUT_LINE('}');
        DBMS_OUTPUT.PUT_LINE('');
        
        CLOSE c_columnasId;
        
        imprimirTabla(ownerTabla, nombreTabla);
        
        OPEN c_columnas;
        LOOP
            FETCH c_columnas INTO columnas;
            EXIT WHEN c_columnas%NOTFOUND;
            
            imprimirColumna(columnas);
        END LOOP;
        DBMS_OUTPUT.PUT_LINE('}');
        
        CLOSE c_columnas;
        
    END LOOP;
    
    CLOSE c_tablas;
END;
/