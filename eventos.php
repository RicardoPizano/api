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
    $query = "SELECT * FROM eventos e, categorias c WHERE e.cat_id = c.cat_id AND NOW() <= e.eve_fecha";
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
        $json = json_encode(["res"=>"0", "msg"=>"No se encontro ningun evento"]);
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
    $query = "SELECT * FROM eventos e, categorias c WHERE e.cat_id = c.cat_id AND NOW() <= e.eve_fecha AND c.cat_id = 1";
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
    $query = "SELECT * FROM eventos e, categorias c WHERE e.cat_id = c.cat_id AND NOW() <= e.eve_fecha AND c.cat_id = 2";
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
    $query = "SELECT * FROM eventos e, categorias c WHERE e.cat_id = c.cat_id AND NOW() <= e.eve_fecha AND c.cat_id = 3";
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
    $query = "SELECT * FROM eventos e, categorias c WHERE e.cat_id = c.cat_id AND NOW() <= e.eve_fecha AND c.cat_id = 4";
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
 * Funcion encargada de regresar un JSON de un evento pos su id
 */
function findEvento(){
    // Validacion de que la url contenga el valor del id
    if(isset($_GET['id'])){

        // Asignacion de la variable del id
        $id = $_GET['id'];

        // Conexion a la base de datos
        $con = conexion();

        // Selecciona todos los eventos de tipo culturales
        $query = "SELECT * FROM eventos e, categorias c WHERE e.cat_id = c.cat_id AND NOW() <= e.eve_fecha AND e.eve_id = ".$id;
        $select = $con -> query($query);

        // Validacion de que existan eventos tipo culturales en la base de datos
        if(($select -> num_rows) > 0){

            // Obtencion de la consulta en un array
            $row = $select -> fetch_assoc();

            // Llena un array con los lementos de la consulta en otro array con el formato que regresara
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

            // Crea el array de respuesta con todos los eventos de tipo culturales de la base de datos
            $eventos = ["res" => "1", "evento" => $evento];

            // Creacion del JSON, cierre de la conexion a la base de datos e imprime el JSON
            $json = json_encode($eventos);
            $con -> close();
            print($json);
        }else{
            // Respuesta en caso de que no haya registros del evento tipo culturales
            $json = json_encode(["res"=>"0", "msg"=>"No hay eventos con ese id"]);
            $con -> close();
            print($json);
        }
    }else{
        // Respuesta en caso de que no contenga id el url
        $json = json_encode(["res"=>"0", "msg"=>"La operación deseada no existe"]);
        print($json);
    }
}

/**
 * Funcion que inserta un evento a la base de datos
 */
function setEvento(){
    // Validacion de que el url contenga todos los elementos del evento
    if(isset($_GET['nom'], $_GET['est'], $_GET['ciu'], $_GET['dir'], $_GET['lug'], $_GET['fec'],
        $_GET['hor'], $_GET['img'], $_GET['des'], $_GET['cat'])){

        //Asignacion de las variables del url
        $nombre = $_GET['nom'];
        $estado = $_GET['est'];
        $ciudad = $_GET['ciu'];
        $direccion = $_GET['dir'];
        $lugar = $_GET['lug'];
        $fecha = $_GET['fec'];
        $hora = $_GET['hor'];
        $imagen = $_GET['img'];
        $descripcion = $_GET['des'];
        $idCategoria = $_GET['cat'];

        // Conexion a la base de datos
        $con = conexion();

        // Insercion en la base de datos el evento nuevo
        $query = "INSERT INTO eventos VALUES(DEFAULT, '".$nombre."', '".$estado."', '".$ciudad."', '".
            $direccion."', '".$lugar."', '".$fecha."', '".$hora."', '".$imagen."', '".
            $descripcion."', ".$idCategoria." )";
        $insert = $con -> query($query);

        //Validacion de insercion correcta
        if($insert){

            // Seleccion del evento recien creado
            $query = "SELECT eve_id FROM eventos WHERE eve_nombre = '".$nombre."' AND eve_estado = '".$estado.
                "' AND eve_ciudad = '".$ciudad."' AND eve_direccion = '".$direccion."'";
            $select = $con -> query($query);

            //Validacion de que la seleccion se hizo correctamente
            if($select -> num_rows > 0){

                // Obtencion de la consulta en un array
                $row = $select -> fetch_assoc();

                // Crea el array de respuesta con el id del evento creado
                $evento = ["res" => "1", "id" => $row['eve_id']];

                // Creacion del JSON, cierre de la conexion a la base de datos e imprime el JSON
                $json = json_encode($evento);
                $con -> close();
                print($json);
            }else{
                // Respuesta en caso de que no se encuentre ningun evento con la informacion obtenida
                $json = json_encode(["res" => "0", "msg" => "Ocurrio un error al validar el evento"]);
                $con->close();
                print($json);
            }
        }else{
            // Respuesta en caso de que no se haya insertado el evento
            $json = json_encode(["res"=>"0", "msg"=>"No se pudo crear el evento, intentalo nuevamente"]);
            $con -> close();
            print($json);
        }
    }else{
        // Respuesta en caso de que no contenga todos los datos el url
        $json = json_encode(["res"=>"0", "msg"=>"La operación deseada no existe"]);
        print($json);
    }
}

/**
 * Funcion encargada de buscar los eventos existentes por medio de una palabra clave
 */
function findEventoPalabra(){
    // Validacion de que la url contenga el valor del id
    if(isset($_GET['pal'])){

        // Asignacion de la variable del id
        $palabra = $_GET['pal'];

        // Conexion a la base de datos
        $con = conexion();

        // Selecciona todos los eventos que contengan la palabra enviada
        $query = "SELECT * FROM eventos e, categorias c WHERE e.cat_id = c.cat_id AND NOW() <= e.eve_fecha AND (e.eve_nombre LIKE '%".$palabra."%')";
        $select = $con -> query($query);

        // Validacion de que existan eventos con la palabra en la base de datos
        if(($select -> num_rows) > 0){

            // Creacion de array vacio que contendra todos los eventos encontrados
            $arrayEventos = array();

            // Mientras exista un evento en la busqueda crea un array del evento y lo agrega a la variable de
            // todos los eventos que existen
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

            // Crea el array de respuesta con todos los eventos encontrados de la base de datos
            $eventos = ["res" => "1", "eventos" => $arrayEventos];

            // Creacion del JSON, cierre de la conexion a la base de datos e imprime el JSON
            $json = json_encode($eventos);
            $con -> close();
            print($json);
        }else{
            // Respuesta en caso de que no haya registros del evento tipo culturales
            $json = json_encode(["res"=>"0", "msg"=>"No hay eventos que contengan ".$palabra]);
            $con -> close();
            print($json);
        }
    }else{
        // Respuesta en caso de que no contenga id el url
        $json = json_encode(["res"=>"0", "msg"=>"La operación deseada no existe"]);
        print($json);
    }
}

/**
 * Funcion que regresa todos los eventos de la base de datos
 */
function getTodoEventos(){
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
/*------------------------------------------------------------------------------------- OBTENCION EVENTO POR ID ------*/
        case 'findEvento':
            findEvento();
            break;
/*------------------------------------------------------------------------------------- OBTENCION EVENTO POR ID ------*/
        case 'setEvento':
            setEvento();
            break;
/*------------------------------------------------------------------------------------- OBTENCION EVENTO POR ID ------*/
        case 'findEventoPalabra':
            findEventoPalabra();
            break;
/*------------------------------------------------------------------------------------- OBTENCION EVENTO POR ID ------*/
        case 'getTodoEventos':
            getTodoEventos();
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
