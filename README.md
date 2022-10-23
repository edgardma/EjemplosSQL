# Base de datos SQL

## Oracle

### Solucionar el error ORA-65096 al crear un usuario

> *Advertencia: se debe revisar el la correcta forma de nombrar a los usuarios, para lo cual, revisar el siguiente manual:*
> 
> [CREATE USER](https://docs.oracle.com/en/database/oracle/oracle-database/19/sqlrf/CREATE-USER.html#GUID-F0246961-558F-480B-AC0F-14B50134621C)

Si se tiene un script de creación de usuario, como el siguiente:

```plsql
-- USER SQL
CREATE USER "USUARIO1" IDENTIFIED BY "P@a$$123"
DEFAULT TABLESPACE USERS
TEMPORARY TABLESPACE TEMP;

-- QUOTAS
ALTER USER "NSRTM" QUOTA 300M ON "USERS";

-- ROLES
GRANT "CONNECT" TO "NSRTM" ;
GRANT "RESOURCE" TO "NSRTM" ;
```

Y sale el siguiente error al ejecutar en Oracle XE 18c:

```
Informe de error -
ORA-65096: nombre de usuario o rol común no válido
65096. 00000 -  "invalid common user or role name"
*Cause:    An attempt was made to create a common user or role with a name
           that was not valid for common users or roles. In addition to the
           usual rules for user and role names, common user and role names
           must consist only of ASCII characters, and must contain the prefix
           specified in common_user_prefix parameter.
*Action:   Specify a valid common user or role name.
```

Se debe poner la siguiente sentencia al inicio del script:

```sql
alter session set "_ORACLE_SCRIPT"=true;
```

Con esto se ejecutará sin problemas el script de creación de usuario.

*Fuente: [oracle12c - error: ORA-65096: invalid common user or role name in oracle - Stack Overflow](https://stackoverflow.com/questions/33330968/error-ora-65096-invalid-common-user-or-role-name-in-oracle)*

*[ORA-65096: create 12c user without c## prefix](http://www.dba-oracle.com/t_ora_65096_create_user_12c_without_c_prefix.htm)*

*[Multi-tenant local vs. common users tips](http://www.dba-oracle.com/t_multi_tenant_local_common_users.htm)*
