<?php
/**
 * Conexion a la base de datos y comprobación de conexion correta
 */
require_once('bd.php');

/**
 * Funcion encargada de regresar un JSON con los eventos
 */
function getEventos(){
    // Conexion a la base de datos
    $con = conexion();

    // Selecciona todos los eventos
    $query = "SELECT * FROM eventos e, categorias c WHERE e.cat_id = c.cat_id";
    $select = $con -> query($query);

    // Validacion de que existan eventos en la base de datos
    if(($select -> num_rows) > 0){

        // Creacion de array vacio que contendra todos los eventos
        $arrayEventos = array();

        // Mientras exista un evento crea un array del evento y lo agrega a la variable de
        // toso lso eventos que existen
        while($row = $select->fetch_assoc()){
            $evento = [
                "id" => $row['eve_id'],
                "nombre" => $row['eve_nombre'],
                "estado" => $row['eve_estado'],
                "ciudad" => $row['eve_ciudad'],
                "direccion" => $row['eve_direccion'],
                "lugar" => $row['eve_lugar'],
                "fecha" => $row['eve_fecha'],
                "hora" => $row['eve_hora'],
                "foto" => $row['eve_foto'],
                "descripcion" => $row['eve_descripcion'],
                "categoria" => $row['cat_nombre']
            ];
            $arrayEventos[] = $evento;
        }

        // Crea el array de respuesta con todos los eventos de la base de datos
        $eventos = ["res" => "1", "eventos" => $arrayEventos];

        // Creacion del JSON, cierre de la conexion a la base de datos e imprime el JSON
        $json = json_encode($eventos);
        $con -> close();
        print($json);
    }else{
        // Respuesta en caso de que no haya registros de eventos
        $json = json_encode(["res"=>"0", "msg"=>"La operación deseada no existe"]);
        $con -> close();
        print($json);
    }
}

/**
 * Funcion encargada de regresar un JSON con los eventos de tipo concierto
 */
function getConciertos(){
    // Conexion a la base de datos
    $con = conexion();

    // Selecciona todos los eventos de tipo concierto
    $query = "SELECT * FROM eventos e, categorias c WHERE e.cat_id = c.cat_id AND c.cat_id = 1";
    $select = $con -> query($query);

    // Validacion de que existan eventos tipo concierto en la base de datos
    if(($select -> num_rows) > 0){

        // Creacion de array vacio que contendra todos los eventos tipo concierto
        $arrayEventos = array();

        // Mientras exista un evento de tipo concierto crea un array del evento y lo agrega a la variable de
        // toso lso eventos que existen
        while($row = $select->fetch_assoc()){
            $evento = [
                "id" => $row['eve_id'],
                "nombre" => $row['eve_nombre'],
                "estado" => $row['eve_estado'],
                "ciudad" => $row['eve_ciudad'],
                "direccion" => $row['eve_direccion'],
                "lugar" => $row['eve_lugar'],
                "fecha" => $row['eve_fecha'],
                "hora" => $row['eve_hora'],
                "foto" => $row['eve_foto'],
                "descripcion" => $row['eve_descripcion'],
                "categoria" => $row['cat_nombre']
            ];
            $arrayEventos[] = $evento;
        }

        // Crea el array de respuesta con todos los eventos de tipo concierto de la base de datos
        $eventos = ["res" => "1", "eventos" => $arrayEventos];

        // Creacion del JSON, cierre de la conexion a la base de datos e imprime el JSON
        $json = json_encode($eventos);
        $con -> close();
        print($json);
    }else{
        //Respuesta en caso de que no haya registros del evento tipo concierto
        $json = json_encode(["res"=>"0", "msg"=>"No se encontraron eventos de tipo concierto"]);
        $con -> close();
        print($json);
    }
}

/**
 * Funcion encargada de regresar un JSON con los eventos de tipo teatro
 */
function getTeatro(){
    // Conexion a la base de datos
    $con = conexion();

    // Selecciona todos los eventos de tipo teatro
    $query = "SELECT * FROM eventos e, categorias c WHERE e.cat_id = c.cat_id AND c.cat_id = 2";
    $select = $con -> query($query);

    // Validacion de que existan eventos tipo teatro en la base de datos
    if(($select -> num_rows) > 0){

        // Creacion de array vacio que contendra todos los eventos tipo teatro
        $arrayEventos = array();

        // Mientras exista un evento de tipo teatro crea un array del evento y lo agrega a la variable de
        // toso lso eventos que existen
        while($row = $select->fetch_assoc()){
            $evento = [
                "id" => $row['eve_id'],
                "nombre" => $row['eve_nombre'],
                "estado" => $row['eve_estado'],
                "ciudad" => $row['eve_ciudad'],
                "direccion" => $row['eve_direccion'],
                "lugar" => $row['eve_lugar'],
                "fecha" => $row['eve_fecha'],
                "hora" => $row['eve_hora'],
                "foto" => $row['eve_foto'],
                "descripcion" => $row['eve_descripcion'],
                "categoria" => $row['cat_nombre']
            ];
            $arrayEventos[] = $evento;
        }

        // Crea el array de respuesta con todos los eventos de tipo teatro de la base de datos
        $eventos = ["res" => "1", "eventos" => $arrayEventos];

        // Creacion del JSON, cierre de la conexion a la base de datos e imprime el JSON
        $json = json_encode($eventos);
        $con -> close();
        print($json);
    }else{
        // Respuesta en caso de que no haya registros del evento tipo teatro
        $json = json_encode(["res"=>"0", "msg"=>"No se encontraron eventos de tipo teatro"]);
        $con -> close();
        print($json);
    }
}

/**
 * Funcion encargada de regresar un JSON con los eventos de tipo deportes
 */
function getDeportes(){
    // Conexion a la base de datos
    $con = conexion();

    // Selecciona todos los eventos de tipo deportes
    $query = "SELECT * FROM eventos e, categorias c WHERE e.cat_id = c.cat_id AND c.cat_id = 3";
    $select = $con -> query($query);

    // Validacion de que existan eventos tipo deportes en la base de datos
    if(($select -> num_rows) > 0){

        // Creacion de array vacio que contendra todos los eventos tipo deportes
        $arrayEventos = array();

        // Mientras exista un evento de tipo deportes crea un array del evento y lo agrega a la variable de
        // toso lso eventos que existen
        while($row = $select->fetch_assoc()){
            $evento = [
                "id" => $row['eve_id'],
                "nombre" => $row['eve_nombre'],
                "estado" => $row['eve_estado'],
                "ciudad" => $row['eve_ciudad'],
                "direccion" => $row['eve_direccion'],
                "lugar" => $row['eve_lugar'],
                "fecha" => $row['eve_fecha'],
                "hora" => $row['eve_hora'],
                "foto" => $row['eve_foto'],
                "descripcion" => $row['eve_descripcion'],
                "categoria" => $row['cat_nombre']
            ];
            $arrayEventos[] = $evento;
        }

        // Crea el array de respuesta con todos los eventos de tipo deportes de la base de datos
        $eventos = ["res" => "1", "eventos" => $arrayEventos];

        // Creacion del JSON, cierre de la conexion a la base de datos e imprime el JSON
        $json = json_encode($eventos);
        $con -> close();
        print($json);
    }else{
        // Respuesta en caso de que no haya registros del evento tipo deportes
        $json = json_encode(["res"=>"0", "msg"=>"No se encontraron eventos de tipo deportes"]);
        $con -> close();
        print($json);
    }
}

/**
 * Funcion encargada de regresar un JSON con los eventos de tipo culturales
 */
function getCulturales(){
    // Conexion a la base de datos
    $con = conexion();

    // Selecciona todos los eventos de tipo culturales
    $query = "SELECT * FROM eventos e, categorias c WHERE e.cat_id = c.cat_id AND c.cat_id = 3";
    $select = $con -> query($query);

    // Validacion de que existan eventos tipo culturales en la base de datos
    if(($select -> num_rows) > 0){

        // Creacion de array vacio que contendra todos los eventos tipo culturales
        $arrayEventos = array();

        // Mientras exista un evento de tipo culturales crea un array del evento y lo agrega a la variable de
        // toso lso eventos que existen
        while($row = $select->fetch_assoc()){
            $evento = [
                "id" => $row['eve_id'],
                "nombre" => $row['eve_nombre'],
                "estado" => $row['eve_estado'],
                "ciudad" => $row['eve_ciudad'],
                "direccion" => $row['eve_direccion'],
                "lugar" => $row['eve_lugar'],
                "fecha" => $row['eve_fecha'],
                "hora" => $row['eve_hora'],
                "foto" => $row['eve_foto'],
                "descripcion" => $row['eve_descripcion'],
                "categoria" => $row['cat_nombre']
            ];
            $arrayEventos[] = $evento;
        }

        // Crea el array de respuesta con todos los eventos de tipo culturales de la base de datos
        $eventos = ["res" => "1", "eventos" => $arrayEventos];

        // Creacion del JSON, cierre de la conexion a la base de datos e imprime el JSON
        $json = json_encode($eventos);
        $con -> close();
        print($json);
    }else{
        // Respuesta en caso de que no haya registros del evento tipo culturales
        $json = json_encode(["res"=>"0", "msg"=>"No se encontraron eventos de tipo culturales"]);
        $con -> close();
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
        case 'getEventos':
            getEventos();
            break;
/*------------------------------------------------------------------------------------- OBTENCION CONCIERTOS ---------*/
        case 'getConciertos':
            getConciertos();
            break;
/*------------------------------------------------------------------------------------- OBTENCION TEATRO -------------*/
        case 'getTeatro':
            getTeatro();
            break;
/*------------------------------------------------------------------------------------- OBTENCION DEPORTES -----------*/
        case 'getDeportes':
            getDeportes();
            break;
/*------------------------------------------------------------------------------------- OBTENCION CULTURALES ---------*/
        case 'getCulturales':
            getCulturales();
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
