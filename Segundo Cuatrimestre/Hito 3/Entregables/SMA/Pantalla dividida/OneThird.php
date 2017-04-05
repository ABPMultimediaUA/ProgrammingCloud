<!DOCTYPE html>
<html land="es">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Pantalla Dividida</title>
	<link rel="stylesheet" type="text/css" href="plugin/codemirror/lib/codemirror.css">
	<link rel="stylesheet" type="text/css" href="plugin/codemirror/theme/mdn-like.css">
	<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
	<!--HINT ADDON -->
	<link rel="stylesheet" type="text/css" href="plugin/codemirror/addon/hint/show-hint.css">
	<!--Javascript-->
	<link rel="stylesheet" type="text/css" href="plugin/codemirror/addon/display/fullscreen.css">
	
</head>
<body>
	<div id="contenido">
		<nav class="navbar navbar-default">
			<div class="container-fluid">
			    <!-- Brand and toggle get grouped for better mobile display -->
			     <div class="navbar-header">
				     <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
					     <span class="sr-only">Menú</span>
					     <span class="icon-bar"></span>
					     <span class="icon-bar"></span>
					     <span class="icon-bar"></span>
				     </button>
				     <a class="navbar-brand" href="#">Compila!</a>
			    	</div>	

			    <!-- Collect the nav links, forms, and other content for toggling -->
			    	<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				      <!--<ul class="nav navbar-nav">
					     <li class="active"><a href="#">Link <span class="sr-only">(current)</span></a></li>
					     <li><a href="#">Link</a></li>
					     <li class="dropdown">
					          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Dropdown <span class="caret"></span></a>
					          <ul class="dropdown-menu">
						          <li><a href="#">Action</a></li>
						          <li><a href="#">Another action</a></li>
						          <li><a href="#">Something else here</a></li>
						          <li role="separator" class="divider"></li>
						          <li><a href="#">Separated link</a></li>
						          <li role="separator" class="divider"></li>
					          	<li><a href="#">One more separated link</a></li>
					          </ul>
					     </li>
				     </ul> -->
				     <ul class="nav navbar-nav navbar-right">
					     <li class="dropdown pull-right">
					          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><img src="unnamed.jpg" class="img-circle" alt="Cinque Terre" width="25" height="25"></a>

					          <ul class="dropdown-menu">
						          <li><a href="#">Perfil</a></li>
						          <li><a href="#">Mis Cursos</a></li>
						          <li role="separator" class="divider"></li>
						          <li><a href="#">Cerrar Sesión</a></li>
					          </ul>
					     </li>
				     </ul>
			    	</div><!-- /.navbar-collapse -->
			</div><!-- /.container-fluid -->
		</nav>
		
		<div class="row">
			<div class="col-md-1 container" id="leccion">

			</div>
			<div class="col-md-7" id="editor">
				<textarea class="codemirror"></textarea>
			</div >
			<div class="col-md-4" style="background-color:lavender;">
				<p>Lorem Ipsum es simplemente el texto de relleno de las imprentas y archivos de texto. Lorem Ipsum ha sido el texto de relleno estándar de las industrias desde el año 1500, cuando un impresor (N. del T. persona que se dedica a la imprenta) desconocido usó una galería de textos y los mezcló de tal manera que logró hacer un libro de textos especimen. No sólo sobrevivió 500 años, sino que tambien ingresó como texto de relleno en documentos electrónicos, quedando esencialmente igual al original. Fue popularizado en los 60s con la creación de las hojas "Letraset", las cuales contenian pasajes de Lorem Ipsum, y más recientemente con software de autoedición, como por ejemplo Aldus PageMaker, el cual incluye versiones de Lorem Ipsum.</p>
				
			</div>
		</div>	
	</div>
	
	<div class="container" id="foot">
		<div id="mySidenav" class="sidenav">
			<div class="row">
				<div class="col-md-9">
					<h2>Nombre del curso</h2>
				</div>
				<div class="col-md-3">
					<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
				</div>
			</div>
				
				
			<a href="#" class=""><span class="glyphicon glyphicon-ok-sign"></span> Leccion 1</a>
			<a href="#"><span class="glyphicon glyphicon-ok-sign"></span> Leccion 2</a>
			<a href="#"><span class="glyphicon glyphicon-ok-sign"></span> Leccion 3</a>
			<a href="#" class="activo"><span class="glyphicon glyphicon-minus-sign"></span> Leccion 4</a>
			<a href="#" class="disabled"><span class="glyphicon glyphicon-remove-sign"></span> Leccion 5</a>
			<a href="#" class="disabled"><span class="glyphicon glyphicon-remove-sign"></span> Leccion 6</a>
			<a href="#" class="disabled"><span class="glyphicon glyphicon-remove-sign"></span> Leccion 7</a>
			<a href="#" class="disabled"><span class="glyphicon glyphicon-remove-sign"></span> Leccion 8</a>
		</div>
	</div>

	
	<!-- <span style="font-size:30px;cursor:pointer;background-color: gray" onclick="openNav()">&#9776;</span> -->
	

	<script src="js/jquery.min.js" type="text/javascript"></script>
	<script src="https://npmcdn.com/tether@1.2.4/dist/js/tether.min.js"></script>
	<script src="js/bootstrap.min.js" type="text/javascript"></script>
	<script src="plugin/codemirror/lib/codemirror.js" type="text/javascript"></script>
	<!-- Mode del Codemirror -->
	<script src="plugin/codemirror/mode/css/css.js" type="text/javascript"></script>
	<!--HINT ADDON -->
	<script src="plugin/codemirror/addon/hint/show-hint.js" type="text/javascript"></script>
	<script src="plugin/codemirror/addon/hint/css-hint.js" type="text/javascript"></script>
	<!--FULL SCREEN -->
	<script src="plugin/codemirror/addon/display/fullscreen.js" type="text/javascript"></script>

	<script src="js/default.js" type="text/javascript"></script>
	<!-- <script src="js/bootstrap.js" type="text/javascript"></script> -->


	<footer class="footer">
        <button type="button" id="btn-foot" class="btn btn-default" onclick="openNav()" aria-expanded="false">
					<span class="glyphicon glyphicon-list-alt"></span>
					Lecciones
        </button>
    </footer>
	
</body>
</html>