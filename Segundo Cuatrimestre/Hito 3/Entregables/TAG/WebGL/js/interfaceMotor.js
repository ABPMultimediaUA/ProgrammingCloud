/********************************************** METODOS INICIALIZACION *************************************/
function initGL(canvas) {
    try {
        gl = canvas.getContext("experimental-webgl");
        gl.viewportWidth = canvas.width;
        gl.viewportHeight = canvas.height;
    } catch (e) {
    }
    if (!gl) {
        alert("Could not initialise WebGL, sorry :-(");
    }
}
//METODO PARA INICIALIZAR LOS SHADERS Y SUS VARIABLES
function iniciarShaders() {
	var fragmentShader = getShader(gl, "per-fragment-lighting-fs");
	var vertexShader = getShader(gl, "per-fragment-lighting-vs");

	shaderProgram = gl.createProgram();
	gl.attachShader(shaderProgram, vertexShader);
	gl.attachShader(shaderProgram, fragmentShader);
	gl.linkProgram(shaderProgram);

	if (!gl.getProgramParameter(shaderProgram, gl.LINK_STATUS)) {
	    alert("No es posible inicializar los shaders");
	}

	gl.useProgram(shaderProgram);

	shaderProgram.vertexPositionAttribute = gl.getAttribLocation(shaderProgram, "aVertexPosition");
	gl.enableVertexAttribArray(shaderProgram.vertexPositionAttribute);

	shaderProgram.vertexNormalAttribute = gl.getAttribLocation(shaderProgram, "aVertexNormal");
	gl.enableVertexAttribArray(shaderProgram.vertexNormalAttribute);

	shaderProgram.textureCoordAttribute = gl.getAttribLocation(shaderProgram, "aTextureCoord");
	gl.enableVertexAttribArray(shaderProgram.textureCoordAttribute);

	shaderProgram.pMatrixUniform = gl.getUniformLocation(shaderProgram, "uPMatrix");
    shaderProgram.mvMatrixUniform = gl.getUniformLocation(shaderProgram, "uMVMatrix");
    shaderProgram.nMatrixUniform = gl.getUniformLocation(shaderProgram, "uNMatrix");
    shaderProgram.samplerUniform = gl.getUniformLocation(shaderProgram, "uSampler");
    shaderProgram.materialShininessUniform = gl.getUniformLocation(shaderProgram, "uMaterialShininess");
    shaderProgram.useTexturesUniform = gl.getUniformLocation(shaderProgram, "uUseTextures");

    shaderProgram.useLightingUniform = gl.getUniformLocation(shaderProgram, "uUseLighting");
    shaderProgram.ambientColorUniform = gl.getUniformLocation(shaderProgram, "uAmbientColor");

    shaderProgram.nDirectionalLightsUniform = gl.getUniformLocation(shaderProgram, "uNDirectionalLights");
    shaderProgram.sceneDirectionalLightsUniform = gl.getUniformLocation(shaderProgram, "uSceneDirectionalLights");
    
    shaderProgram.nLightsUniform = gl.getUniformLocation(shaderProgram, "uNLights");
    shaderProgram.scenePointLightsUniform = gl.getUniformLocation(shaderProgram, "uScenePointLights");
}

//METODO PARA RECOGER LOS SHADERS DEL HTML
function getShader(gl, id) {
    var shaderScript = document.getElementById(id);
    if (!shaderScript) {
        return null;
    }

    var str = "";
    var k = shaderScript.firstChild;
    while (k) {
        if (k.nodeType == 3) {
            str += k.textContent;
        }
        k = k.nextSibling;
    }

    var shader;
    if (shaderScript.type == "x-shader/x-fragment") {
        shader = gl.createShader(gl.FRAGMENT_SHADER);
    } else if (shaderScript.type == "x-shader/x-vertex") {
        shader = gl.createShader(gl.VERTEX_SHADER);
    } else {
        return null;
    }

    gl.shaderSource(shader, str);
    gl.compileShader(shader);

    if (!gl.getShaderParameter(shader, gl.COMPILE_STATUS)) {
        alert("Informe inicializador WebGL: " + gl.getShaderInfoLog(shader));
        return null;
    }

    return shader;
}

//CON ESTE METODO INICIALIZAREMOS LA ESCENA
function creaEscena(canvasID){
	if(canvasID != null && canvasID instanceof HTMLCanvasElement){
		initGL(canvasID);
		iniciarShaders();
		escena = new Tescena();
		gl.clearColor(0.0, 0.0, 0.0, 1.0);
        gl.enable(gl.DEPTH_TEST);
	}else{
		alert("Es necesario indicar la id del canvas en donde se representa la escena");
	}
}

// function iniciarDibujado(){
// 	motor.tick();
// }
function tick(){
	// alert("entra en tick");
    requestAnimFrame(tick);
    escena.drawEscena();
}

function borrarNodo(nodo){
	if(nodo != null && nodo instanceof Tnode){
		nodo.remTnode();
	}else{
		alert("El objeto pasado por parametros no es valido");
	}
}
/********************************************** METODOS PARA CREACION DEL ARBOL Y TRANSFORMACIONES****************************/

//PARA CREAR UNA TRANSFORMACION DE ROTACION
function crearRotacion(nodoPadre, vectorXYZ, bucle){
	var transformacion = null;
	if(escena != null && escena instanceof Tescena){
		if(vectorXYZ == null && nodoPadre instanceof Tnode){
			alert("Vector no valido, este ha de ser un objeto vec3 de la libreria glMatrix-0.9.5.min.js");
			vectorXYZ = vec3.fromValues(0.0, 0.0, 0.0);
		}
		if(nodoPadre != null){
			var entidad = new Trotacion(vectorXYZ);
			if(bucle){
				entidad.changeBucle(vectorXYZ, 0.1);
			}
			transformacion = new Tnode (entidad, null, nodoPadre);
			if(!nodoPadre.addHijo(transformacion)){
				transformacion.remTnode();
				alert("El nodo padre debe ser una transformacion o el nodo raiz");
				transformacion = null;
			}
		}
	}else{
		alert("Escena no valida, para inicializarla utilice el metodo crearEscena");
	}
	return transformacion;
}
//CREAR TRASLACION
function crearTraslacion(nodoPadre, vectorXYZ, bucle){
	var transformacion = null;
		if(vectorXYZ == null){
			alert("TRASLACION: Vector no valido, este ha de ser un objeto vec3 de la libreria glMatrix");
			vectorXYZ = vec3.fromValues(0.0, 0.0, 0.0);
		}
		if(nodoPadre != null && nodoPadre instanceof Tnode){
			var entidad = new Ttraslacion(vectorXYZ);
			if(bucle){
				entidad.changeBucle(vectorXYZ, 0.1);
			}
			transformacion = new Tnode (entidad, null, nodoPadre);
			if(!nodoPadre.addHijo(transformacion)){
				transformacion.remTnode();
				alert("TRASLACION: El nodo padre debe ser una transformacion o el nodo raiz");
				transformacion = null;
			}
		}
	return transformacion;
}
//CREAR ESCALADO
function crearEscalado(nodoPadre, vectorXYZ, bucle){
	var transformacion = null;
		if(vectorXYZ == null && nodoPadre instanceof Tnode){
			alert("ESCALADO: Vector no valido, este ha de ser un objeto vec3 de la libreria glMatrix");
			vectorXYZ = [1.0, 1.0, 1.0];
		}
		if(nodoPadre != null){
			var entidad = new Tescalado(vectorXYZ);
			if(bucle){
				entidad.changeBucle(vectorXYZ, 0.1);
			}
			transformacion = new Tnode (entidad, null, nodoPadre);
			if(!nodoPadre.addHijo(transformacion)){
				transformacion.remTnode();
				alert("ESCALADO: El nodo padre debe ser una transformacion o el nodo raiz");
				transformacion = null;
			}
		}
	return transformacion;
}

//PARA MODIFICAR LOS PARAMETROS DE UNA TRANSFORMACION YA CREADA
function editarTransformacion(nodo, nuevoVectorXYZ){
	if(nodo != null && nodo.getEntidad() != null && nodo.getEntidad() instanceof Ttransf){
		if(nuevoVectorXYZ != null){
			nodo.getEntidad().setXYZ(nuevoVectorXYZ[0], nuevoVectorXYZ[1], nuevoVectorXYZ[2]);
		}else{
			alert("TRANSFORMACION: Vector no valido, este ha de ser un objeto vec3 de la libreria glMatrix");
		}
	}else{
		alert("TRANSFORMACION: El nodo introducido debe ser una transformacion");
	}
}

/********************************************** METODOS CAMARA *********************************************/
function crearCamara(nodoPadre){
	var camara = null;
	if(escena != null && escena instanceof Tescena){
		if(nodoPadre != null && nodoPadre instanceof Tnode){
			var entidad = new Tcamara(escena);
			camara = new Tnode (entidad, null, nodoPadre);
			if(!nodoPadre.addHijo(camara)){
				camara.remTnode();
				alert("CAMARA: El nodo padre debe ser una transformacion o el nodo raiz");
				camara = null;
			}
		}
	}else{
		alert("CAMARA: Escena no valida, para inicializarla utilice el metodo crearEscena");
	}
	return camara;
}

function usarCamara(nodoCamara){
	if(nodoCamara != null && nodoCamara.getEntidad() != null && nodoCamara.getEntidad() instanceof Tcamara){
		escena.setMainCamera(nodoCamara);
	}else{
		alert("CAMARA: El objeto pasado por parametros debe ser un nodo que contenga una camara");
	}
}

function usaPerspectiva(camara, angle, near, far){
	var ok = false;
	if(camara != null && camara.getEntidad() != null && camara.getEntidad() instanceof Tcamara && 
		near > 0.0 && far > near && angle >= 0 && angle < 360){

		camara.getEntidad().setPerspective(angle, near, far);
		ok = true;
	}
	return ok;
}
// function lookAt(){

// }

/********************************************** METODOS LUCES **********************************************/
/********************************* PROBLEMA CON LA DIRECCION, ASUNTO ROTACION ******************************/
function crearLuz(nodoPadre, vec3IntensidadDifusa, vec3IntensidadEspecular, vec3Direccion, anguloCono){
	var luz = null;
	if(escena != null && escena instanceof Tescena){
		if(nodoPadre != null && nodoPadre instanceof Tnode){
			var entidad = new Tluz(escena);
			luz = new Tnode (entidad, null, nodoPadre);
			if(!nodoPadre.addHijo(luz)){
				luz.remTnode();
				alert("LUZ: El nodo padre debe ser una transformacion o el nodo raiz");
				luz = null;
			}
		}
		if(luz != null){
			if(vec3IntensidadDifusa != null){
				luz.getEntidad().setIntensidadDifusa(vec3IntensidadDifusa[0], vec3IntensidadDifusa[1], vec3IntensidadDifusa[2]);
			}else{
				alert("LUZ: Parametro vec3IntensidadDifusa no valido, este ha de ser un objeto vec3 de la libreria glMatrix");
			}
			if(vec3IntensidadEspecular != null){
				luz.getEntidad().setIntensidadEspecular(vec3IntensidadEspecular[0], vec3IntensidadEspecular[1], vec3IntensidadEspecular[2]);
			}else{
				alert("LUZ: Parametro vec3IntensidadEspecular no valido, este ha de ser un objeto vec3 de la libreria glMatrix");
			}
			if(vec3Direccion != null){
				luz.getEntidad().setDireccion(vec3Direccion[0], vec3Direccion[1], vec3Direccion[2]);
				if(anguloCono<90 && anguloCono >= 0){
					luz.getEntidad().setConusAngle(anguloCono);
				}else{
					alert("LUZ: El angulo debe ser valor positivo y menos a 90");
				}
			}
		}
	}else{
		alert("LUZ: Escena no valida, para inicializarla utilice el metodo crearEscena");
	}
	return luz;
}

function editarLuz(luz, vec3IntensidadDifusa, vec3IntensidadEspecular, vec3Direccion, anguloCono){
	if(luz != null && luz.getEntidad() != null &&  luz.getEntidad() instanceof Tluz){
		if(vec3IntensidadDifusa != null && vec3IntensidadEspecular != null){
		 	luz.getEntidad().setIntensidadDifusa(vec3IntensidadDifusa[0], vec3IntensidadDifusa[1], vec3IntensidadDifusa[2]);		
		 	luz.getEntidad().setIntensidadEspecular(vec3IntensidadEspecular[0], vec3IntensidadEspecular[1], vec3IntensidadEspecular[2]);	
		}
		
		if(vec3Direccion != null){
			luz.getEntidad().setDireccion(vec3Direccion[0], vec3Direccion[1], vec3Direccion[2]);
			if(anguloCono<90 && anguloCono >= 0){
				luz.getEntidad().setConusAngle(anguloCono);
			}else{
				alert("LUZ: El angulo debe ser valor positivo y menor a 90");
			}
		}
	}
}
function ponerLuzAmbiental(vec3Ambiental){
	if(escena != null && escena instanceof Tescena){
		if(vec3Ambiental != null){
			escena.setAmbiental(vec3Ambiental);
		}else{
			alert("AMBIENTAL: Parametro vec3Ambiental no valido, este ha de ser un objeto vec3 de la libreria glMatrix");
		}
	}else{
		alert("AMBIENTAL: Escena no valida, para inicializarla utilice el metodo crearEscena");
	}
}

/********************************************** METODOS MALLA *********************************************/
function crearMalla(nodoPadre, nombreFichero, nombreTextura){
	var malla = null;
	if(nombreFichero != null){
		if(escena != null && escena instanceof Tescena){
			if(nodoPadre != null && nodoPadre instanceof Tnode){
				var entidad = new Tmalla(escena, nombreFichero, nombreTextura);
				malla = new Tnode (entidad, null, nodoPadre);
				if(!nodoPadre.addHijo(malla)){
					malla.remTnode();
					alert("MALLA: El nodo padre debe ser una transformacion o el nodo raiz");
					malla = null;
				}else{
					entidad.cargar();
					entidad.setTextura();
				}
			}
		}
	}else{
		alert("MALLA: Se requiere la direccion de un fichero JSON valido");
	}
	return malla;
}

/********************************************** METODOS ANIMACIONES ****************************************/
// ARRAYNODOMALLAS -> [X][0] == NOMBRE FICHERO
//**************** -> [X][1] == NOMBRE TEXTURA
function crearAnimacion(nodoPadre, arrayNodoMallas){
	var animacion = null;
	if(escena != null && escena instanceof Tescena){
		if(nodoPadre != null && nodoPadre instanceof Tnode){
			var entidad = new Tanimacion();
			animacion = new Tnode (entidad, null, nodoPadre);
			if(!nodoPadre.addHijo(animacion)){
				animacion.remTnode();
				alert("ANIMACION: El nodo padre debe ser una transformacion o el nodo raiz");
				animacion = null;
			}else{
				ponerArrayFrames(animacion, arrayNodoMallas);
			}
		}
	}
	return animacion;
}

function ponerArrayFrames(nodoAnimacion, arrayMalla){
	if(nodoAnimacion != null && nodoAnimacion instanceof Tnode && 
		nodoAnimacion.getEntidad() != null && nodoAnimacion.getEntidad() instanceof Tanimacion){
		if(arrayMalla != null && arrayMalla.length > 0 && arrayMalla[0].length == 2){
			var entidad;
			var arrayAux = [];
			for(var i=0; i<arrayMalla.length; i++){
				if(arrayMalla[i][0] != null && arrayMalla[i][1] != null){
					entidad = new Tmalla(escena, arrayMalla[i][0], arrayMalla[i][1]);
					arrayAux.push(entidad);
				}
			}
			nodoAnimacion.getEntidad().setMallaAnimacion(arrayAux);
		}
		
	}
}







