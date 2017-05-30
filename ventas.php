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
                    "id venta" => $row['ven_id'],
                    "estado de pago" => $row['ven_pago_realizado'],
                    "id seccion" => $row['sec_id'],
                    "nombre seccion" => $row['sec_nombre'],
                    "costo" => $row['sec_costo'],
                    "id evento" => $row['eve_id'],
                    "nombre evento" => $row['eve_nombre'],
                    "fecha" => $row['eve_fecha'],
                    "hora" => $row['eve_hora'],
                    "nombre categoria" => $row['cat_nombre'],
                    "id usuario" => $row['usu_id'],
                    "correo usuario" => $row['usu_correo'],
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
 * segmento encargado de verificar que la url tenga el parametro de la accion, en caso de no tener el parametro a
 * regresa un json con res=0 y un msg de operacion no existe en caso contrario conprueba la accion y dependiendo
 * de la accion solicitada realiza una funcion especifrica
 */
if(isset($_GET['a'])){
    $accion = $_GET['a']; // Se obtiene la accion por metodo GET
    switch ($accion){ // Switch encargado de verificar la accion
        /*------------------------------------------------------------------------------------- OBTENCION EVENTOS ------------*/
        case 'getVentasUsuario':
            getVentasUsuario();
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