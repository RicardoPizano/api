<?php
/**
 * Conexion a la base de datos y comprobación de conexion correta
 */
require_once('bd.php');

/**
 * funcion que regresa las secciones asi como los lugares disponibles y totales de un evento
 */
function getSecciones(){
    if(isset($_GET['id'])){

        // Obtencion del id del evento
        $idEvento = $_GET['id'];

        // Conexion a la base de datos
        $con = conexion();

        // Selecciona todas las secciones del evento
        $query = "SELECT * FROM secciones s, eventos e WHERE s.eve_id = e.eve_id AND s.eve_id = ".$idEvento;
        $select = $con -> query($query);

        // Validacion de que el evento contenga secciones
        if(($select -> num_rows) > 0){

            // Creacion de array vacio que contendra todas las secciones
            $arraySecciones = array();

            // Mientras exista una seccion crea un array de la seccion y lo agrega a la variable de
            // todas las secciones que existen
            while($row = $select -> fetch_assoc()){

                // Calculo de las entradas disponibles por seccion
                $selectCompras = $con ->query("SELECT COUNT(ven_id) vendidas FROM ventas WHERE sec_id = ".$row['sec_id']);
                $resultadoCompras = $selectCompras -> fetch_assoc();
                $lugaresDisponibles = $row['sec_lugares'] - $resultadoCompras['vendidas'];

                // Creacion del array con los datos de la seccion
                $seccion = [
                    "id" => $row['sec_id'],
                    "nombre" => $row['sec_nombre'],
                    "costo" => $row['sec_costo'],
                    "lugares totales" => $row['sec_lugares'],
                    "lugares disponibles" => $lugaresDisponibles."",
                    "nombre del evento" => $row['eve_nombre']
                ];
                $arraySecciones[] = $seccion;
            }

            // Crea el array de respuesta con todos los eventos de la base de datos
            $secciones = ["res" => "1", "secciones" => $arraySecciones];

            // Creacion del JSON, cierre de la conexion a la base de datos e imprime el JSON
            $json = json_encode($secciones);
            $con -> close();
            print($json);
        }else {
            // Respuesta en caso de que no contenga secciones el evento
            $json = json_encode(["res" => "0", "msg" => "No se encontraron secciones del evento"]);
            $con->close();
            print($json);
        }
    }else{
        // Respuesta en caso de que la url no contenga el id del evento
        $json = json_encode(["res"=>"0", "msg"=>"La operación deseada no existe"]);
        print($json);
    }
}

/**
 * Funcion que regresa los lugares disponibles de una seccion de un evento
 */
function getLugaresDisponibles(){
    if(isset($_GET['idSec'])){

        // Obtencion del id del evento
        $idSeccion = $_GET['idSec'];

        // Conexion a la base de datos
        $con = conexion();

        // Selecciona todas la seccion deceada
        $query = "SELECT * FROM secciones WHERE sec_id = ".$idSeccion;
        $select = $con -> query($query);

        // Validacion de que la consulta tenga información
        if(($select -> num_rows) > 0){

            // Obtencion en un array la consulta
            $row = $select -> fetch_assoc();

            // Calculo de las entradas disponibles por seccion
            $selectCompras = $con ->query("SELECT COUNT(ven_id) vendidas FROM ventas WHERE sec_id = ".$row['sec_id']);
            $resultadoCompras = $selectCompras -> fetch_assoc();
            $lugaresDisponibles = $row['sec_lugares'] - $resultadoCompras['vendidas'];


            // Crea el array de respuesta con los lugares disponibles de la seccion
            $secciones = ["res" => "1", "lugares disponibles" => $lugaresDisponibles];

            // Creacion del JSON, cierre de la conexion a la base de datos e imprime el JSON
            $json = json_encode($secciones);
            $con -> close();
            print($json);
        }else {
            // Respuesta en caso de que no exista a seccion
            $json = json_encode(["res" => "0", "msg" => "No se encontró la sección"]);
            $con->close();
            print($json);
        }
    }else{
        // Respuesta en caso de que la url no contenga el id del evento
        $json = json_encode(["res"=>"0", "msg"=>"La operación deseada no existe"]);
        print($json);
    }
}

/**
 * Funcion que ingresa una seccion a la base de datos
 */
function setSeccion(){
    // Validacion de la url que contenga los vaoler necesitados
    if(isset($_GET['nom'], $_GET['cos'], $_GET['lug'], $_GET['idEve'])){

        // Asignacion de variables
        $nombre = $_GET['nom'];
        $costo = $_GET['cos'];
        $lugares = $_GET['lug'];
        $idEvento = $_GET['idEve'];

        // Conexion co la base de datos
        $con = conexion();

        // Insercion en la base de datos
        $query = "INSERT INTO secciones VALUES(DEFAULT , '".$nombre."', '".$costo."', '".$lugares."', ".$idEvento.")";
        $insert = $con -> query($query);

        //Validacion de insercion correcta
        if($insert){

            // Crea el array de respuesta con el id del evento creado
            $respuesta = ["res" => "1", "mag" => "Se agrego correctamente la seccion"];

            // Creacion del JSON, cierre de la conexion a la base de datos e imprime el JSON
            $json = json_encode($respuesta);
            $con -> close();
            print($json);
        }else{
            // Respuesta en caso de que no se haya insertado la seccion
            $json = json_encode(["res"=>"0", "msg"=>"No se pudo crear la seccion, intentalo nuevamente"]);
            $con -> close();
            print($json);
        }
    }else{
        // Respuesta en caso de que la url no contenga los valores necesitados
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
/*------------------------------------------------------------------------------------- OBTENCION DE SECCIONES -------*/
        case 'getSecciones':
            getSecciones();
            break;
/*------------------------------------------------------------------------------------- OBTENCION LUGARES DISPONIBLES */
        case 'getLugaresDisponibles':
            getLugaresDisponibles();
            break;
/*------------------------------------------------------------------------------------- INSERCION DE SECCION ---------*/
        case 'setSeccion':
            setSeccion();
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
