<!doctype html>
<?php include '/php/comprobarUsu.php'; ?>
<html lang="en"><head>
    <meta charset="utf-8">
    <title>Panel ADM - Compila</title>
    <meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,700' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" type="text/css" href="lib/bootstrap/css/bootstrap.css">
    <link rel="stylesheet" href="lib/font-awesome/css/font-awesome.css">

    <script src="lib/jquery-1.11.1.min.js" type="text/javascript"></script>

    <?php include '/php/wysiwyg.php' ?>

    <link rel="stylesheet" type="text/css" href="stylesheets/theme.css">

</head>
<body class=" theme-blue">
    <style type="text/css">
        #line-chart {
            height:300px;
            width:800px;
            margin: 0px auto;
            margin-top: 1em;
        }
        .navbar-default .navbar-brand, .navbar-default .navbar-brand:hover { 
            color: #fff;
        }
    </style>

      <!--Incluyo la barra TOP y el NAV LEFT-->
    <?php include '/php/navTop.php'; ?>
    
    <?php include '/php/navSide.php'; 
        activado(14);
    ?>

    <div class="content"> <!-- INICIO CONTENIDO -->
        <div class="header">
            <h1 class="page-title">Editar Lección</h1>
            <ul class="breadcrumb">
                <li><a href="lecciones.php">Lecciones</a> </li>
                <li class="active">Editar Lección</li>
            </ul>
        </div>
        <div class="main-content"> <!--CONTENIDO PRINCIAL -->
        <?php

            if(isset($_POST['submit']) & isset($_GET['leccion'])){
                editarLeccion($_GET['leccion']);
            }
        
            function msgExito(){
                $mensaje='<div class="alert alert-success">';
                $mensaje.='<strong>Éxito!</strong> Datos de la lección actualizados.';
                $mensaje.='</div>';
                echo $mensaje;
            }
            function msgError($msg){
                 $mensaje='<div class="alert alert-danger">';
                $mensaje.='<strong>Error!</strong> '.$msg;
                $mensaje.='</div>';
                echo $mensaje;
            }
        ?>
        <?php   if(isset($_GET['leccion'])){
                    include '/php/conexionBD.php';
                    $lecc=$_GET['leccion'];
                    
                    $sql="SELECT * FROM leccion WHERE leccion.Id='$lecc'";

                    $result = mysqli_query($conn, $sql);

                    $titulo="";
                    $contenido="";
                    $solucion="";
                    $curso="";
                    while($row = mysqli_fetch_assoc($result)) {           
                        $titulo=$row['Titulo'];
                        $contenido=$row['Contenido'];
                        $solucion=$row['Solucion'];
                        $curso=$row['Id_Curso'];
                    } 
                }
        ?>

        <div class="row">
            <div class="col-md-6">
                <br>
                <form id="tab" action="" method="POST" enctype="multipart/form-data">
                    <div class="form-group" action="" method="POST">
                        <label>Título</label>
                        <input type="text" name="titulo" value="<?php if(isset($lecc)) echo $titulo; ?>" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label>Contenido</label>
                        <textarea form="tab" id="w" name="contenido" required><?php if(isset($lecc)) echo $contenido; ?></textarea>
                    </div>
                    <div class="form-group">
                        <label>Solución</label>
                        <textarea form="tab" name="solucion" class="form-control" rows="6" required><?php if(isset($lecc)) echo $solucion; ?></textarea>
                    </div>
                    <div class="form-group">
                        <label>Curso Asignado</label>
                            <select name="curso" class="form-control">
                                <?php cursos(); ?>
                            </select>
                    </div>

                    <hr>
                    <div class="form-group">
                        <input type="submit" name="submit" class="btn btn-primary"value="Actualizar Leccion">
                        <input type="button" class="btn btn-danger" onclick="adios()" value="Descartar Cambios">
                    </div>
                </form>
            </div>
        </div>
        
        <script type="text/javascript">
            function adios(){
                window.location.replace("http://localhost/compila.es/lecciones.php");
            }   
        </script>

            <footer>
                <hr>
                <p class="pull-right"></p>
                <p>© 2017 <a href="http://www.compila.es" target="_blank">Compila!</a></p>
            </footer>
        </div> <!--END CONTENIDO PRINCIAL -->
    </div> <!-- END CONTENIDO -->


    <!-- *****Función que me hace el animado del sidebar***** -->
    <script src="lib/bootstrap/js/bootstrap.js"></script>
    <script type="text/javascript">
        $("[rel=tooltip]").tooltip();
        $(function() {
            $('.demo-cancel-click').click(function(){return false;});
        });
    </script>
    
  
</body></html>


<?php 
    function editarLeccion($id_lecc){
        include '/php/conexionBD.php';

        $titulo=$_POST['titulo'];
        $contenido=$_POST['contenido'];
        $solucion=$_POST['solucion'];
        $curso=$_POST['curso'];

        $sql="UPDATE leccion SET Titulo = '$titulo', Contenido = '$contenido', Solucion = '$solucion', Id_Curso='$curso' WHERE leccion.Id = '$id_lecc'";

        if(mysqli_query($conn,$sql)){
            msgExito();
        }else{
            $msg="Algo ha ido mal: ".mysqli_error($conn);
            msgError($msg);
        }
    }

    function cursos(){
        include '/php/conexionBD.php';

        $sql="SELECT * FROM curso";

        $result = mysqli_query($conn, $sql);

        while($row = mysqli_fetch_assoc($result)){
            if($GLOBALS['curso'] == $row['Id']){
                echo"<option value='".$row['Id']."' selected>".$row['Nombre']."</option>";
            }else{
                echo"<option value='".$row['Id']."'>".$row['Nombre']."</option>";
            }
            
        }

        mysqli_close($conn);
    }
?>