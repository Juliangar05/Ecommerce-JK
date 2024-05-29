
<?php
//validamos datos del servidor
$user = "root";
$pass = "";
$host = "localhost";

//conetamos al base datos
$connection = mysqli_connect($host, $user, $pass);

//hacemos llamado al imput de formuario

$ID = $_POST["documento"] ;
$NOMBRE_APELLIDOS = $_POST["name"] ;
$CORREO_ELECTRONICO = $_POST["email"] ;
$CONTRASENA = $_POST["password"] ;
$FECHA_NACIMIENTO = $_POST["birth"] ;
$TELEFONO = $_POST["phoneNumber"] ;
$DIRECCION = $_POST["address"] ;
$CIUDAD = $_POST["city"] ;




//verificamos la conexion a base datos
if(!$connection) 
        {
            echo "No se ha podido conectar con el servidor" . mysql_error();
        }
  else
        {
            echo "<b><h3>Hemos conectado al servidor</h3></b>" ;
        }
        //indicamos el nombre de la base datos
        $datab = "jkropa";
        //indicamos selecionar ala base datos
        $db = mysqli_select_db($connection,$datab);

        if (!$db)
        {
        echo "No se ha podido encontrar la Tabla";
        }
        else
        {
        echo "<h3>Tabla seleccionada:</h3>" ;
        }
        //insertamos datos de registro al mysql xamp, indicando nombre de la tabla y sus atributos
        $instruccion_SQL = "INSERT INTO clientes (ID, NOMBRE_APELLIDOS, CORREO_ELECTRONICO, CONTRASENA, FECHA_NACIMIENTO, TELEFONO, DIRECCION, CIUDAD )
                             VALUES ('$ID','$NOMBRE_APELLIDOS','$CORREO_ELECTRONICO','$CONTRASENA','$FECHA_NACIMIENTO','$TELEFONO','$DIRECCION','$CIUDAD')";
                           
                            
        $resultado = mysqli_query($connection,$instruccion_SQL);

        //$consulta = "SELECT * FROM tabla where id ='2'"; si queremos que nos muestre solo un registro en especifico de ID
        $consulta = "SELECT * FROM clientes";
        



?>