<?php
/**
 * Conexion a la base de datos y comprobación de conexion correta
 */
require_once('bd.php');

/**
 * Funcion encargada de mostrar las compras de un usuario
 */
function getVentasUsuario(){
    if(isset($_GET['id'])){

        // Obtencion del id del usuario
        $idUsuario = $_GET['id'];

        // Conexion a la base de datos
        $con = conexion();

        // Selecciona todas las ventas del usuario
        $query = "SELECT * FROM ver_ventas_usuario WHERE usu_id = ".$idUsuario;
        $select = $con -> query($query);

        // Validacion de que el usuario tenga boletos comprados
        if($select -> num_rows > 0){

            // Creacion de array vacio que contendra todas las compras
            $arrayVentas = array();

            // Mientras exista una venta de boletos del usuario crea un array de la seccion y lo
            // agrega a la variable de todas las compras que existen
            while($row = $select -> fetch_assoc()){
                $compra = [
                    "id_venta" => $row['ven_id'],
                    "estado_de_pago" => $row['ven_pago_realizado'],
                    "id_seccion" => $row['sec_id'],
                    "nombre_seccion" => $row['sec_nombre'],
                    "costo" => $row['sec_costo'],
                    "id_evento" => $row['eve_id'],
                    "nombre_evento" => $row['eve_nombre'],
                    "estado" => $row['eve_estado'],
                    "ciudad" => $row['eve_ciudad'],
                    "direccion" => $row['eve_direccion'],
                    "lugar" => $row['eve_lugar'],
                    "fecha" => $row['eve_fecha'],
                    "hora" => $row['eve_hora'],
                    "foto" => $row['eve_foto'],
                    "descripcion" => $row['eve_descripcion'],
                    "nombre_categoria" => $row['cat_nombre'],
                    "id_usuario" => $row['usu_id'],
                    "correo_usuario" => $row['usu_correo'],
                ];
                $arrayVentas[] = $compra;
            }

            // Crea el array de respuesta con todas las compras del usuario de la base de datos
            $compras = ["res" => "1", "compras" => $arrayVentas];

            // Creacion del JSON, cierre de la conexion a la base de datos e imprime el JSON
            $json = json_encode($compras);
            $con -> close();
            print($json);
        }else{
            // Respuesta en caso de que no contenga boletos comprados el usuario
            $json = json_encode(["res" => "0", "msg" => "No se encontraron boletos comprados"]);
            $con->close();
            print($json);
        }
    }else{
        // Respuesta en caso de que la url no contenga el id del usuario
        $json = json_encode(["res"=>"0", "msg"=>"La operación deseada no existe"]);
        print($json);
    }
}

/**
 * Funcion encargada de insertar una compra de un usuario en la base de datos
 */
function setVenta(){
    if(isset($_GET['idUsu'], $_GET['idSec'], $_GET['pago'])){

        // Obtencion de los parametros
        $idUsuario = $_GET['idUsu'];
        $idSeccion = $_GET['idSec'];
        $pago = $_GET['pago'];

        // Conexion a la base de datos
        $con = conexion();

        //Validacion de lugares disponibles
        $json = file_get_contents('http://localhost/api/secciones.php?a=getLugaresDisponibles&idSec='.$idSeccion);
        $objeto = json_decode($json, true);

        // Validacion de que haya lugares disponibles
        if($objeto['lugares disponibles'] > 0){

            // Inserta los valores en la base de datos
            $query = "INSERT INTO ventas VALUES(DEFAULT, ".$idUsuario.", ".$idSeccion.", '".$pago."')";
            $insert = $con -> query($query);

            // Validacion de que la insercion se hizo correctamente
            if($insert){

                // Crea el array de respuesta con un mensaje de correcto
                $respuesta = ["res" => "1", "msg" => "Se realizó la compra correctamente"];

                // Creacion del JSON, cierre de la conexion a la base de datos e imprime el JSON
                $json = json_encode($respuesta);
                $con -> close();
                print($json);
            }else{
                // Respuesta en caso de que no
                $json = json_encode(["res" => "0", "msg" => "No se pudo realizar la compra, intente nuevamente"]);
                $con->close();
                print($json);
            }
        }else{
            // Respuesta en caso de que no haya lugares disponibles
            $json = json_encode(["res"=>"0", "msg"=>"Lo sentimos pero no hay lugares disponibles para esta sección"]);
            print($json);
        }
    }else{
        // Respuesta en caso de que la url no contenga el id del usuario, id de seccion y el estado de pago
        $json = json_encode(["res"=>"0", "msg"=>"La operación deseada no existe"]);
        print($json);
    }
}

/**
 * segmento encargado de verificar que la url tenga el parametro de la accion, en caso de no tener el parametro a
 * regresa un json con res=0 y un msg de operacion no existe en caso contrario conprueba la accion y dependiendo
 * de la accion solicitada realiza una funcion especifrica
 */
if(isset($_GET['a'])){
    $accion = $_GET['a']; // Se obtiene la accion por metodo GET
    switch ($accion){ // Switch encargado de verificar la accion
/*------------------------------------------------------------------------------------- OBTENCION DE VENTAS USUARIO --*/
        case 'getVentasUsuario':
            getVentasUsuario();
            break;
/*------------------------------------------------------------------------------------- INSERTAR VENTAS --------------*/
        case 'setVenta':
            setVenta();
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