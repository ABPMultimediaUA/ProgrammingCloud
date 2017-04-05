<?php 

	$comm = null;

	if($_SERVER['REQUEST_METHOD'] == 'POST' && !empty($_POST['prew-comm']))
		$comm = $_POST['prew-comm'];
?>

<!DOCTYPE html>
<html land="es">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>Pantalla Dividida - Formulario</title>
	<link rel="stylesheet" type="text/css" href="plugin/codemirror/lib/codemirror.css">

	<!--Javascript-->
	<script src="js/jquery.min.js" type="text/javascript"></script>
	<script src="plugin/codemirror/lib/codemirror.js" type="text/javascript"></script>
	<script src="js/default.js" type="text/javascript"></script>
</head>
<body>
	
	

	<form id="prew-form" method="post" action="<?php echo $_SERVER['PHP_SELF']; ?>">
		<textarea class="codemirror" name="prew-comm" id="prew-comm"><?php echo $comm; ?></textarea>
		<br>
		<input type="submit" name="prew-submit" id="prew-submit" value="submit"></input>
	</form>

	<div id="prew-comment">
		<?php echo $comm; ?>
	</div>
</body>
</html>