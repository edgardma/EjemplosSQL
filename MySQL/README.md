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
