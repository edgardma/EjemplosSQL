# Manual de MySQL

Aquí se encuentra algunas sentencias y ejemplos del uso personal de MySQL:

## Cambiar la clave del usuario "root"

Para poder cambiar la clave del usuario `root`se debe hacer lo siguiente:

* En la carpeta `bin` de `mysql` ejecutar la siguiente sentencia:
  
  ```bash
  mysql -y root -p
  ```

* Ingrese la clave del usuario.

* En la línea de comando de MySQL ejecutar las siguientes sentencias:
  
  ```sql
  mysql> use mysql;
  mysql> update user set password=PASSWORD(“root”) where User=’root’;
  mysql> flush privileges;
  mysql> quit.
  ```

*Fuente: [Cambiar la password de root en MySQL - Blog de Javier Rguez](https://www.javierrguez.com/cambiar-la-password-de-root-en-mysql/)*

## Error al conectar

Si al conectarse al servidor devuelve el mensaje `Public key retrieval is not allowed`, se debe poner la propiedad  `allowPublicKeyRetrieval` en `TRUE`. Esto se puede poner de la siguiente forma en la cadena de conexión:

```
jdbc:mysql://localhost:3306/db?allowPublicKeyRetrieval=true&useSSL=false
```

*Fuente: [Connection Java - MySQL : Public Key Retrieval is not allowed - Stack Overflow](https://stackoverflow.com/questions/50379839/connection-java-mysql-public-key-retrieval-is-not-allowed)*
