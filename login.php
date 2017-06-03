<?php
/**
 * Conexion a la base de datos y comprobación de conexion correta
 */
require_once('bd.php');

/**
 * Funcion encargada de verificar el login y regresar 0 en caso de que no haya usuarios registrado
 * y regresa 1 más un JSON con los datos del usuario
 */
function login(){
    if(isset($_GET['cor'], $_GET['pas'])){
    	// Obtencion de valores por metodo GET
    	$correo = $_GET['cor'];
    	$contrasena = $_GET['pas'];

    	// Conexion a la base de datos
        $con = conexion();

    	// Validar existencia de usuario
        $query = "SELECT * FROM usuarios WHERE usu_correo = '".$correo."' AND usu_contrasena = '".md5($contrasena)."'";
        $select = $con->query($query);

        // Comprueba que el resultado no sea vacio
        if($select -> num_rows > 0) {
            $respuestaUsu = $select->fetch_assoc();

            // Creacion de array con la informacion del usuario
            $usuario = [
                "Id" => $respuestaUsu['usu_id'],
                "Nombre" => $respuestaUsu['usu_nombre'],
                "Correo" => $respuestaUsu['usu_correo'],
                "Contraseña" => $respuestaUsu['usu_contrasena'],
                "Tipo" => $respuestaUsu['usu_tipo'],
                "Direccion" => $respuestaUsu['usu_direccion'],
                "Telefono" => $respuestaUsu['usu_telefono']
            ];

            // Creacion del JSON, cierre de la conexion a la base de datos e imprime el JSON
            $json = json_encode(["res" => "1", "usuario" => $usuario]);
            $con->close();
            print($json);
        }else{
        	// Respuesta en caso de que no exista el usuario
            $con->close();
        	$json = json_encode(["res"=>"0", "msg"=>"Usuario o contraseña incorrectos"]);
        	print($json);
        }
    }else{
    	// Respuesta en caso de que no contenga todos los datos necesarios la url
        $json = json_encode(["res"=>"0", "msg"=>"La operación deseada no existe"]);
        print($json);
    }
}

/**
 * Funcion encargada de registrar al usuario en la base de datos el cual regresa un 0 en caso de no poder
 * registrase y 1 más un JSON con los valores del usuario registrado
 */
function setUsuario(){
    // Validacion de que la url tenga todos los parametros necesitados
    if(isset($_GET['nom'], $_GET['cor'], $_GET['pas'], $_GET['tip'], $_GET['dir'], $_GET['tel'])){

        // Obtencion de valores por metodo GET
        $nombre = $_GET['nom'];
        $correo = $_GET['cor'];
        $contrasena = $_GET['pas'];
        $tipo = $_GET['tip'];
        $direccion =$_GET['dir'];
        $telefono = $_GET['tel'];

        // Conexion a la base de datos
        $con = conexion();

        // Validar existencia de usuario
        $query = "SELECT * FROM usuarios WHERE usu_correo = '".$correo."'";
        $select = $con->query($query);
        if(count($select->fetch_assoc()) == 0) {

            // Query insert
            $query = "INSERT INTO usuarios VALUES(DEFAULT, '" . $nombre . "', '" . $correo . "', '" .
                md5($contrasena) . "', '" . $tipo . "', '" . $direccion . "', '" . $telefono . "')";

            // Ejecucion del query
            $insert = $con->query($query);

            // Verifica que la ejecucion del query regrese true
            if ($insert) {

                // Ejecuta query el cual selecciona al usuario recien ingresado
                $query = "SELECT * FROM usuarios WHERE usu_correo = '" . $correo . "' AND usu_contrasena = '" . md5($contrasena) . "'";
                $select = $con->query($query);


                // Verifica que el usuario recien insertado este en la base de datos
                if ($select -> num_rows > 0) {
                    $respuestaUsu = $select->fetch_assoc();

                    // Creacion de array con la informacion del usuario
                    $usuario = [
                        "Id" => $respuestaUsu['usu_id'],
                        "Nombre" => $respuestaUsu['usu_nombre'],
                        "Correo" => $respuestaUsu['usu_correo'],
                        "Contraseña" => $respuestaUsu['usu_contrasena'],
                        "Tipo" => $respuestaUsu['usu_tipo'],
                        "Direccion" => $respuestaUsu['usu_direccion'],
                        "Telefono" => $respuestaUsu['usu_telefono']
                    ];

                    // Creacion del JSON, cierre de la conexion a la base de datos e imprime el JSON
                    $json = json_encode(["res" => "1", "usuario" => $usuario]);
                    $con->close();
                    print($json);
                } else {
                    // Respuesta en caso de que no se encuentre ningun usuario con el nombre y contraseña
                    $json = json_encode(["res" => "1", "msg" => "Ocurrio un error al validar el registro"]);
                    $con->close();
                    print($json);
                }
            } else {
                // Respuesta en caso de que no el insert sea false
                $json = json_encode(["res" => "0", "msg" => "no se pudo insertar el valor"]);
                $con->close();
                print($json);
            }
        }else{
            // Respuesta en caso de que ya exista un correo registrado igual
            $json = json_encode(["res"=>"0", "msg"=>"Ya existe un usuario registrado con ese correo"]);
            $con->close();
            print($json);
        }
    }else{
        // Respuesta en caso de que no contenga todos los datos necesarios la url
        $json = json_encode(["res"=>"0", "msg"=>"La operación deseada no existe"]);
        print($json);
    }
}

/**
 * Funcion encargada de actualizar al usuario en la base de datos el cual regresa un 0 en caso de no poder
 * registrase y 1 más un json con los valores del usuario registrado
 */
function updateUsuario(){
	// Validacion de que la url tenga todos los parametros necesitados
    if(isset($_GET['id'], $_GET['nom'], $_GET['cor'], $_GET['dir'], $_GET['tel'])){
        // Obtencion de valores por metodo GET
        $id = $_GET['id'];
        $nombre = $_GET['nom'];
        $correo = $_GET['cor'];
        $direccion =$_GET['dir'];
        $telefono = $_GET['tel'];

        // Conexion a la base de datos
        $con = conexion();

        // Validar existencia de usuario
        $query = "SELECT * FROM usuarios WHERE usu_id = ".$id." AND usu_correo = '".$correo."'";
        $select = $con->query($query);

        // Valida si el usuario existe en la base de datos
        if ($select->num_rows > 0) {

            // Query update
            $query = "UPDATE usuarios SET usu_nombre = '" . $nombre .
                "', usu_correo = '".$correo.
                "', usu_direccion = '" . $direccion .
                "', usu_telefono = '" . $telefono .
                "' WHERE usu_id = '" . $id . "'";

            // Ejecucion del query
            $update = $con->query($query);

            // Verifica que la ejecucion del query regrese true
            if ($update) {

                // Ejecuta query el cual selecciona al usuario con los cambios realizados
                $query = "SELECT * FROM usuarios WHERE usu_id = " . $id;
                $select = $con->query($query);

                // Valida que el usuario este en la base de datos
                if ($select->num_rows > 0) {
                    $respuestaUsu = $select->fetch_assoc();

                    // Creacion de array con la informacion del usuario
                    $usuario = [
                        "Id" => $respuestaUsu['usu_id'],
                        "Nombre" => $respuestaUsu['usu_nombre'],
                        "Correo" => $respuestaUsu['usu_correo'],
                        "Contraseña" => $respuestaUsu['usu_contrasena'],
                        "Tipo" => $respuestaUsu['usu_tipo'],
                        "Direccion" => $respuestaUsu['usu_direccion'],
                        "Telefono" => $respuestaUsu['usu_telefono']
                    ];

                    // Creacion del JSON, cierre de la conexion a la base de datos e imprime el JSON
                    $json = json_encode(["res" => "1", "usuario" => $usuario]);
                    $con->close();
                    print($json);
                } else {
                    // Respuesta en caso de que no se encuentre ningun usuario con el nombre y contraseña
                    $json = json_encode(["res" => "1", "msg" => "Ocurrio un error al validar la actualizacion"]);
                    $con->close();
                    print($json);
                }
            } else {
                // Respuesta en caso de que el update sea false
                $json = json_encode(["res" => "0", "msg" => "no se pudo actualizar el usuario"]);
                $con->close();
                print($json);
            }
        } else {
            // Respuesta en caso de que no exista el usuario
            $json = json_encode(["res" => "0", "msg" => "No existe el usuario"]);
            $con->close();
            print($json);
        }
    }else{
        // Respuesta en caso de que no contenga todos los datos necesarios la url
        $json = json_encode(["res"=>"0", "msg"=>"La operación deseada no existe"]);
        print($json);
    }
}

/**
 * Funcion encargada de verificar el usuario y contraseña de un usuario para regresar la informacion del usuario
 */
function infoUsuario(){
    if(isset($_GET['cor'], $_GET['pas'])){
        // Obtencion de valores por metodo GET
        $correo = $_GET['cor'];
        $contrasena = $_GET['pas'];

        // Conexion a la base de datos
        $con = conexion();

        // Validar existencia de usuario
        $query = "SELECT * FROM usuarios WHERE usu_correo = '".$correo."' AND usu_contrasena = '".$contrasena."'";
        $select = $con->query($query);

        // Comprueba que el resultado no sea vacio
        if($select -> num_rows > 0) {
            $respuestaUsu = $select->fetch_assoc();

            // Creacion de array con la informacion del usuario
            $usuario = [
                "Id" => $respuestaUsu['usu_id'],
                "Nombre" => $respuestaUsu['usu_nombre'],
                "Correo" => $respuestaUsu['usu_correo'],
                "Contraseña" => $respuestaUsu['usu_contrasena'],
                "Tipo" => $respuestaUsu['usu_tipo'],
                "Direccion" => $respuestaUsu['usu_direccion'],
                "Telefono" => $respuestaUsu['usu_telefono']
            ];

            // Creacion del JSON, cierre de la conexion a la base de datos e imprime el JSON
            $json = json_encode(["res" => "1", "usuario" => $usuario]);
            $con->close();
            print($json);
        }else{
            // Respuesta en caso de que no exista el usuario
            $con->close();
            $json = json_encode(["res"=>"0", "msg"=>"Usuario o contraseña incorrectos"]);
            print($json);
        }
    }else{
        // Respuesta en caso de que no contenga todos los datos necesarios la url
        $json = json_encode(["res"=>"0", "msg"=>"La operación deseada no existe"]);
        print($json);
    }
}

/**
 * Funcion encargada de eliminar a un usuario por su id
 */
function deleteUsuario(){
    if(isset($_GET['id'])){
        // Obtencion de valores por metodo GET
        $id = $_GET['id'];

        // Conexion a la base de datos
        $con = conexion();

        // Validar existencia de usuario
        $query = "DELETE FROM usuarios WHERE usu_id = ".$id;
        $delete = $con->query($query);

        // Comprueba que el resultado no sea vacio
        if($delete) {

            // Creacion del JSON, cierre de la conexion a la base de datos e imprime el JSON
            $json = json_encode(["res" => "1", "msg" => "Se elimino correctamente el usuario"]);
            $con->close();
            print($json);
        }else{
            // Respuesta en caso de que no se pudo eliminar el usuario
            $con->close();
            $json = json_encode(["res" => "0", "msg"=>"Ocurrio un error inesperado, vuelva a intentar"]);
            print($json);
        }
    }else{
        // Respuesta en caso de que no contenga todos los datos necesarios la url
        $json = json_encode(["res" => "0", "msg"=>"La operación deseada no existe"]);
        print($json);
    }
}

/**
 * segmento encargado de verificar que la url tenga el parametro de la accion, en caso de no tener el parametro a
 * regresa un json con res=0 y un msg de operacion no existe en caso contrario conprueba la accion y dependiendo
 * de la accion solicitada realiza una funcion especifrica
 */
if(isset($_GET['a'])){
    $accion = $_GET['a']; // Se obtiene la accion po0r metodo GET
    switch ($accion){ // Switch encargado de verificar la accion
/*------------------------------------------------------------------------------------- VALIDACION LOGIN -------------*/
        case 'login':
            login();
            break;
/*------------------------------------------------------------------------------------- INSERCION DE USUARIO ---------*/
        case 'setUsuario':
            setUsuario();
            break;
/*------------------------------------------------------------------------------------- ACTUALIZACION DE USUARIO -----*/
        case 'updateUsuario':
            updateUsuario();
            break;
/*------------------------------------------------------------------------------------- AINFORMACION DE USUARIO ------*/
        case 'infoUsuario':
            infoUsuario();
            break;
/*------------------------------------------------------------------------------------- ELIMINAR DE USUARIO -----*/
        case 'deleteUsuario':
            deleteUsuario();
            break;
/*------------------------------------------------------------------------------------- CASO DEFAULT -----------------*/
        default:
            $json = json_encode(["res"=>"0", "msg"=>"La operación deseada no existe"]);
            print($json);
            break;
    }
}else{
    $json = json_encode(["res"=>"0", "msg"=>"La operación deseada no existe"]);
    print($json);
}
