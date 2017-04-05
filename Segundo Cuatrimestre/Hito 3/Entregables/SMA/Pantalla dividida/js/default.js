$(document).ready(function(){
	var code = $(".codemirror")[0];
	var editor = CodeMirror.fromTextArea(code, {
		lineNumbers : true, //mostrar el num de lineas
		mode : "css", //el Mode del editor
		theme : "mdn-like", //el tema del editor
		tabSize : 5,
		extraKeys : {"Ctrl-Space" : "autocomplete"}, //para el autocompletado
		autofocus : true, //al cargar la pagin el focus esta en el editor
		lineWrapping : true, //si las lineas se van para abajo al llegar al final o siguien 
		extraKeys: { //comportamiento de la pantalla completa para el Editor
	        "F11": function(cm) {
	          cm.setOption("fullScreen", !cm.getOption("fullScreen"));
	        },
	        "Esc": function(cm) {
	          if (cm.getOption("fullScreen")) cm.setOption("fullScreen", false);
	        }
      	},
	}); //coge dos parametros
	editor.setSize(600,500); //x,y
})

$(document).ready(function(){
    $("#flip").click(function(){
        $("#panel").slideToggle("slow");
         document.getElementById("leccion").setAttribute("class", "col-md-4 container");
          document.getElementById("leccion").setAttribute("editor", "col-md-4 container");
    });
});

function openNav() {
    document.getElementById("mySidenav").style.width = "33%";
    document.getElementById("mySidenav").style.height = "100%";
    document.getElementById("contenido").style.opacity = "0.6";
}

function closeNav() {
    document.getElementById("mySidenav").style.width = "0";
    document.getElementById("contenido").style.opacity = "1";

}