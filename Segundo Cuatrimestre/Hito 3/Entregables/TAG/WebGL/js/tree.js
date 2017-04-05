var gl = null;
var escena = null;

// GESTOR DE RECURSOS
var gestorRecursos = new TGestorRecursos();

// MATRIZ MODEL
var modelMatrix = mat4.create();
modelMatrix = mat4.identity(modelMatrix);

//CREACION DE VIEWMATRIX
var viewMatrix = mat4.create();
viewMatrix = mat4.identity(viewMatrix);

// MATRIZ DE PROYECCION
var pMatrix = mat4.create();
pMatrix = mat4.identity(pMatrix);

// CREACION DE PILA
// var aux = mat4.create();
// mat4.identity(aux);
var pilaMatrix = [];
// pilaMatrix.push(aux);

function apila(m){
    var copy = mat4.create();
    mat4.set(m, copy);
    pilaMatrix.push(copy);
}
function desapila(){
    if (pilaMatrix.length == 0) {
        throw "Invalid popMatrix!";
    }else{
        pilaMatrix.pop();
    }
}

class Tmotor{
    constructor(){
      this.escenasMotor = [];
    }

    getEscenas(){
        return this.escenasMotor;
    }
    setEscena(e){
        if(e != null && e instanceof Tescena){
            this.escenasMotor.push(e);
        }
    }

    tick(){
        requestAnimFrame(this.tick());
        for(var i=0; i<this.escenasMotor.length; i++){
            this.escenasMotor[i].drawEscena();
        }
    }
}

// MOTOR DE ESCENAS
var motor = new Tmotor();

  "use strict";
/************************************************* ESCENA *******************************************/
class Tescena{
    constructor(){
        this.treeNode = new Tnode(null, null, null);

        // CAMARAS ESCENA
        this.Tcamaras = [];
        // PARA SABER SI LA ESCENA TIENE UNA CAMARA PRINCIPAL
        this.mainCamera = null;

        // LUCES ESCENA
        this.Tluces = [];
        // ARRAY DE POSICIONES DE LAS LUCES
        this.TlightMatrix = [];
        // LUZ AMBIENTAL GENERAL PARA TODA LA ESCENA
        this.ambiental = [1.0, 1.0, 1.0];

        motor.setEscena(this);
    }

    //METODOS ARBOL ESCENA
    getTreeNode(){
        return this.treeNode;
    }

    drawEscena(){
        if(gl != null && this.treeNode.getHijos() != null && this.treeNode.getHijos().length > 0 && this.Tcamaras.length>0 && this.mainCamera != null){
            var searchState = 0;
            while(searchState<3){
              switch (searchState) {
                //CALCULAMOS POSICION DE LAS CAMARAS
                case 0:
                  var ok; var actualNode; var nodesWayCamera; var aux;
                  for(var i=0; i<this.Tcamaras.length; i++){
                      nodesWayCamera = [];
                      //Anyadimos camara al vector
                      nodesWayCamera.push(this.Tcamaras[i]);
                      ok = false;
                      actualNode = this.Tcamaras[i];
                      while(!ok){
                        if(actualNode.getPadre() != null){
                          actualNode = actualNode.getPadre();
                          //Colocamos el padre al inicio del vector
                          nodesWayCamera.unshift(actualNode);
                        }else{
                          ok = true;
                        }
                      }
                      //multiplicamos las matrices de las transformaciones para calcular la posicion de la camara
                      aux = mat4.create();
                      aux = mat4.identity(aux);
                      for(var j=0; j<nodesWayCamera.length; j++){
                          if(nodesWayCamera[j].getEntidad() != null){
                              aux = nodesWayCamera[j].getEntidad().calculaMatrix(aux);
                          }
                      }
                  }
                  break;
                //CALCULAMOS LA POSICION DE LAS LUCES
                case 1:
                  var nodesWayLuz; var ok; var actualNode; var aux;
                  for(var i=0; i<this.Tluces.length; i++){
                      nodesWayLuz = [];
                      //Anyadimos luz al vector
                      nodesWayLuz.push(this.Tluces[i]);
                      ok = false;
                      actualNode = this.Tluces[i];
                      while(!ok){
                          if(actualNode.getPadre() != null){
                            actualNode = actualNode.getPadre();
                            //Colocamos el padre al inicio del vector
                            nodesWayLuz.unshift(actualNode);
                          }else{
                            ok = true;
                          }
                      }
                      //multiplicamos las transformaciones para calcular la posicion de la luz
                      aux = mat4.create();
                      aux = mat4.identity(aux);
                      for(var j=0; j<nodesWayLuz.length; j++){
                          if(nodesWayLuz[j].getEntidad() != null){
                            aux = nodesWayLuz[j].getEntidad().calculaMatrix(aux);
                          }
                      }
                  }
                  break;
                case 2:
                  //LE ASIGNO TAMANYO AL VIEWPORT Y RESETEO LA VENTANA
                  gl.viewport(0, 0, gl.viewportWidth, gl.viewportHeight);
                  gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);

                  this.treeNode.drawNode();
                  break;
                default:
                  // statements_def
                  break;
              }
              searchState++;
            }
        }
    }

    /********************** METODOS PARA GESTION DE LAS CAMARAS DE LA ESCENA**********/
    getTcamaras(){
        return this.Tcamaras;
    }
    setCamara(c){
        if(c != null && c instanceof Tnode && c.getEntidad() != null && c.getEntidad() instanceof Tcamara){
            this.Tcamaras.push(c);
        }
    }

    getMainCamera(){
        return this.mainCamera;
    }
    setMainCamera(c){
        if(c != null && c instanceof Tnode && c.getEntidad() != null && c.getEntidad() instanceof Tcamara){
            if(this.mainCamera != null){
                this.mainCamera.getEntidad().changeMain();
                c.getEntidad().changeMain();
                this.mainCamera = c;
            }else{
                c.getEntidad().changeMain();
                this.mainCamera = c;
            }
        }
    }

    /********************** METODOS PARA GESTION DE LAS LUCES DE LA ESCENA************/
    getLuces(){
        return this.Tluces;
    }
    setLuz(l){
        if(l != null && l instanceof Tnode && l.getEntidad() != null && l.getEntidad() instanceof Tluz){
            this.Tluces.push(l);
        }
    }

    getLightMatrix(){
        return this.TlightMatrix;
    }
    setTlightMatrix(l){
        if(l != null){
            this.TlightMatrix.push(l);
        }
    }

    getAmbiental(){
        return this.ambiental;
    }
    setAmbiental(a){
        if(a != null && a.length == 3){
            vec3.set(a, this.ambiental);
        }
    }
      
} 

/*************************************************CLASE TNODO*******************************************/
class Tnode{
    constructor(entidad, hijos, padre){
        this.entidad = entidad;
        this.hijos = hijos;
        this.padre = padre;
        var aux = entidad;
        var aux2 = entidad;
        if(entidad =! null && entidad instanceof Tluz){
            aux.getMiEscena().setLuz(this);
        }
        if( aux =! null && aux instanceof Tcamara){
            aux2.getEscena().setCamara(this);
        }
    }
    
    remTnode(){
      if(this.padre != null && this.padre.hasChild()){
        if(this.hasChild()){
          for(var i=0; i<this.hijos.length; i++){
            this.hijos[i].setPadre(padre);
            this.padre.addHijo(hijos[i]);
          }
        }
        var aux = this.padre.getHijos().indexOf(this); //indexOf -> obtener el indice del objeto pasado por parametros en el array
        this.padre.getHijos().splice(aux, 1); // splice -> borra x elemente en la posicion del array que le pases
      }else{
        if(this.hasChild()){
          for(var i=0; i<this.hijos.length; i++){
            this.hijos[i].setPadre(null);
          }
        }
      }
    }

    addHijo(nodo){
        var ok = false;
        if(nodo != null){
          if(this.entidad == null || this.entidad instanceof Ttransf){ 
            if(this.hijos == null){ 
              this.hijos = []; 
            }
            this.hijos.push(nodo);

            ok = true;
          }
        }
        return ok;
    }
    hasChild(){
        var ok = false;
        if(this.hijos != null && this.hijos.length > 0){
          ok = true;
        }
        return ok;
    }
    getHijos(){
        return this.hijos;
    }

    setEntidad(entidad){
        this.entidad = entidad;
    }
    getEntidad(){
        return this.entidad;
    }

    getPadre(){
        return this.padre;
    }
    setPadre(node){
        this.padre = node;
    }

    drawNode(){
        if(this.entidad != null){
            this.entidad.beginDraw();
        }
        for(var i=0; this.hijos != null && i<this.hijos.length; i++){
            this.hijos[i].drawNode();
        }
        if(this.entidad != null){
            this.entidad.endDraw();
        }
    }
}
    
/*************************************************CLASE TENTIDAD*******************************************/
class Tentidad{
    constructor(){}
    calculaMatrix(vm){
        return vm;
    }
    beginDraw(){}
    endDraw(){}
}
    
  /*************************************************HERENCIA TENTIDAD*******************************************/
  /*************************************************CLASE TRANSFORMACIONES*******************************************/
  class Ttransf extends Tentidad{
      constructor(){
          super();
          this.matrix = mat4.create();  
          this.bucle = false;    
          this.firstVecTrans = vec3.create();
          this.vecTrans = vec3.create();
          this.tiempoBucle = 0.2;
          this.lastTime = 0;
      }

      opera(v){}

      getMatrix(){
          return this.matrix;
      }

      anima(){
          var timeNow = new Date().getTime();
          if (this.lastTime != 0) {
              var elapsed = timeNow - this.lastTime;
              if(elapsed > this.tiempoBucle){                   
                this.vecTrans[0] = this.vecTrans[0] + this.firstVecTrans[0];
                this.vecTrans[1] = this.vecTrans[1] + this.firstVecTrans[1];
                this.vecTrans[2] = this.vecTrans[2] + this.firstVecTrans[2];
                this.opera(this.vecTrans);
                this.lastTime = timeNow;
              }
          }else{
            this.lastTime = timeNow;
          }
      }
      
      changeBucle(vecXYZ, tb){
          if(this.bucle){
              this.bucle = false;
              this.vecTrans = vec3.create();
          }else{
              this.bucle = true;
              this.vecTrans = [vecXYZ[0], vecXYZ[1], vecXYZ[2]];
              this.firstVecTrans = [vecXYZ[0], vecXYZ[1], vecXYZ[2]];
              this.tiempoBucle = tb;
          }
      }

      calculaMatrix(vm){
          if(this.bucle){
              this.anima();
          }
          var aux = mat4.create();
          mat4.multiply(vm, this.matrix, aux);
          return aux;
      }

      beginDraw(){
          if(this.bucle){
              this.anima();
          }
          var aux = mat4.create();
          mat4.set(modelMatrix, aux);
          apila(aux);          
          mat4.multiply(aux, this.matrix, modelMatrix);
      }

      endDraw(){
          mat4.set(pilaMatrix[pilaMatrix.length - 1], modelMatrix);
          desapila();
      }
  }
    
  //   /*************************************************HERENCIA TTRANSF*******************************************/
  //   /*************************************************CLASE TRASLADAR*******************************************/
        class Ttraslacion extends Ttransf{
            constructor(vector){
                super();
                this.bucle = false;    
                this.firstVecTrans = vec3.create();
                this.vecTrans = vec3.create(); 
                this.matrix = mat4.create();
                this.opera(vector);
            }

            opera(v){
                this.matrix = mat4.identity(this.matrix);
                mat4.translate(this.matrix, v);
            }

        }
 
    /*************************************************CLASE ROTAR*******************************************/
    class Trotacion extends Ttransf{
        constructor(vector){
            super();
            this.bucle = false;    
            this.firstVecTrans = vec3.create();
            this.vecTrans = vec3.create(); 
            this.matrix = mat4.create();
            this.opera(vector);
        }

        degToRad(d) {
            return d * Math.PI / 180;
        }

        opera(v){
            this.matrix = mat4.identity(this.matrix);
            mat4.rotate(this.matrix, this.degToRad(v[0]), [1, 0, 0]);
            mat4.rotate(this.matrix, this.degToRad(v[1]), [0, 1, 0]);
            mat4.rotate(this.matrix, this.degToRad(v[2]), [0, 0, 1]);
        }
    }
        
    /*************************************************CLASE ESCALAR*******************************************/
    class Tescalado extends Ttransf{
        constructor(vector){
            super();
            this.bucle = false;    
            this.firstVecTrans = vec3.create();
            this.vecTrans = vec3.create(); 
            this.matrix = mat4.create();
            this.opera(vector);
        }
        
        opera(v){
          this.matrix = mat4.identity(this.matrix);
          mat4.scale(this.matrix, v);
        }

        anima(){
            var timeNow = new Date().getTime();
            if (this.lastTime != 0) {
                var elapsed = timeNow - this.lastTime;
                if(elapsed > this.tiempoBucle){                   
                  this.vecTrans[0] = this.vecTrans[0] * this.firstVecTrans[0];
                  this.vecTrans[1] = this.vecTrans[1] * this.firstVecTrans[1];
                  this.vecTrans[2] = this.vecTrans[2] * this.firstVecTrans[2];
                  this.opera(this.vecTrans);
                  this.lastTime = timeNow;
                }
            }else{
              this.lastTime = timeNow;
            }
        }
    }
        
  /*************************************************CLASE LUZ*******************************************/
  class Tluz extends Tentidad{
      constructor(esc){
          super();
          this.esc = esc;
          
          this.intensidadDifusa = [1.0, 1.0, 1.0];
          this.intensidadEspecular = [0.0, 0.0, 0.0];
          this.direccion = null;
          this.conusAngle = 0.5;

          this.matrix = mat4.create();
          this.matrix = mat4.identity(this.matrix);
      }
      getMiEscena(){
          return this.esc;
      }

      setIntensidadDifusa(fx, fy, fz){  
          this.intensidadDifusa = [fx, fy, fz];
      }
      getIntensidadDifusa(){
          return this.intensidadDifusa;
      }

      setIntensidadEspecular(fx, fy, fz){  
          this.intensidadEspecular = [fx, fy, fz];
      }
      getIntensidadEspecular(){
          return this.intensidadEspecular;
      }

      getDireccion(){
          return this.direccion;
      }
      setDireccion(fx, fy, fz){
          this.direccion = [fx, fy, fz];
      }

      getConusAngle(){
          return this.conusAngle;
      }
      setConusAngle(angle){
          //PASAMOS A RADIANES
          angle = angle * Math.PI / 180;
          //CALCULAMOS EL COSENO
          this.conusAngle = Math.cos(angle);
      }

      calculaMatrix(lm){
          var aux = mat4.multiply(this.matrix, lm, aux);
          var lightingPosition = [aux[12], aux[13], aux[14]];
          this.esc.setTlightMatrix(lightingPosition);
      }

      beginDraw(){};

      endDraw(){};
  }
      
  /*************************************************CLASE CAMARA*******************************************/
  class Tcamara extends Tentidad{
      constructor(esc){
          super();
          this.esc = esc;

          this.matrix = mat4.create();
          this.matrix = mat4.identity(this.matrix);
          this.main = false;
          this.perspectiva = mat4.create();

          this.setPerspective(45, 0.1, 100.0);
      }
      getEscena(){
          return this.esc;
      }

      setPerspective(angle, near, far){
          mat4.perspective(angle, gl.viewportWidth / gl.viewportHeight, near, far, this.perspectiva);
      }

      changeMain(){
          if(this.main){
              this.main = false;
          }else{
              this.main = true;
          }
      }

      calculaMatrix(vm){
          var mv = mat4.create();
          mv = mat4.identity(mv);
          mat4.inverse(vm, mv);
          this.matrix = mv;
          if(this.main){
              mat4.set(this.matrix, viewMatrix);
              mat4.set(this.perspectiva, pMatrix);
          }
      }

      beginDraw(){}

      endDraw(){}
  }

  class Tanimacion extends Tentidad{
    constructor(){
        super();
        this.mallas = [];
        this.iterador = 0;
        this.lastTime = 0;
        this.tiempoBucle = 500;
    }

    setMallaAnimacion(nMalla){
        for(var i=0; i<nMalla.length; i++){
            nMalla[i].cargar();
            nMalla[i].setTextura();
            this.mallas.push(nMalla[i]);
        }
    }

    beginDraw(){
        if(this.mallas != null && this.mallas.length > 0){
            var timeNow = new Date().getTime();
            if (this.lastTime != 0) {
                var elapsed = timeNow - this.lastTime;
                if(elapsed > this.tiempoBucle){                   
                  this.iterador++;
                  if(this.iterador >= this.mallas.length){
                      this.iterador = 0;
                  }
                  this.lastTime = timeNow;
                }
                this.mallas[this.iterador].beginDraw();
            }else{
                this.lastTime = timeNow;
            }
        }
    }

    endDraw(){}
  }
    
  /*************************************************CLASE MALLA*******************************************/
  class Tmalla extends Tentidad{
      constructor(esc, nombreRecurso, nombreTextura){
          super();
          this.esc = esc;

          this.nombreRecurso = nombreRecurso;
          this.malla = null;

          this.nombreTextura = nombreTextura;
          this.textura = null;

          this.shininess = 32.0;
      }

      setTextura(){
          this.textura = gestorRecursos.getRecursoTextura(this.nombreTextura);
      } 
      //AQUI NOS COMUNICAMOS CON EL GESTOR DE RECURSOS Y ESTE NOS DEVUELVE LA MALLA PARSEADA
      cargar(){
          this.malla = gestorRecursos.getRecurso(this.nombreRecurso);
      }

      //PARA INICIALIZAR LAS MATRICES EN EL SHADER
      setMatrixUniforms(){
          console.log("NOMBRE MALLA: " + this.malla.getNombre());
          //CREO LA MATRIZ MODEL VIEW MULTIPLICANDO LAS MATRICES MODEL Y VIEW Y LAS ANYADO AL SHADER
          var aux = mat4.create();
          aux = mat4.set(viewMatrix, aux);
          var TMVmatrix = mat4.multiply(aux, modelMatrix, TMVmatrix);
          gl.uniformMatrix4fv(shaderProgram.mvMatrixUniform, false, TMVmatrix);
          gl.uniformMatrix4fv(shaderProgram.pMatrixUniform, false, pMatrix);
          
          //AQUI CREO LA MATRIZ DE LAS NORMALES, QUE ES BASICAMENTE LA INVERSA DE AL TRASPUESTA DE LA MODELVIEWMATRIX
          var normalMatrix = mat3.create();
          mat4.toInverseMat3(TMVmatrix, normalMatrix);
          mat3.transpose(normalMatrix);
          gl.uniformMatrix3fv(shaderProgram.nMatrixUniform, false, normalMatrix);
      }  

      beginDraw(){
          alert("stop");
          //LE ASIGNO TAMANYO AL VIEWPORT Y RESETEO LA VENTANA
          console.log("entra en beginDraw");
          // gl.viewport(0, 0, gl.viewportWidth, gl.viewportHeight);
          // gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
          if(this.malla == null){
              return;
          }
          var bufferPosicion = this.malla.getMeshVertexPositionBuffer();
          var bufferTextura = this.malla.getMeshVertexTextureCoordBuffer();
          var bufferNormales = this.malla.getMeshVertexNormalBuffer();
          var bufferIndices = this.malla.getMeshVertexIndexBuffer();
          //COMPRUEBO QUE SE HAYA INICIALIZADO LA MALLA
          console.log("recurso: " + this.malla);
          console.log("BufferPosiciones: " + bufferPosicion);
          console.log("BufferNormales: " + bufferNormales);
          console.log("textura: " + bufferTextura);
          console.log("indices: " + bufferIndices);
          
          if (bufferPosicion == null || bufferNormales == null || bufferTextura == null || bufferIndices == null) {
              console.log("**********************************");
              return;
          }
          alert(this.shininess);
          gl.uniform1f(shaderProgram.materialShininessUniform, this.shininess);
          var ok = true;
          if(this.esc.getLuces() != null && this.esc.getLuces().length > 0 && ok){
              gl.uniform1i(shaderProgram.useLightingUniform, true);
              //VALOR DE LA LUZ AMBIENTAL
              gl.uniform3fv(shaderProgram.ambientColorUniform, this.esc.getAmbiental());

              var arrayLucesDireccionales = [];
              
              var arrayLucesPuntuales = [];
              var nlp = 0;
              var nld = 0;
              
              for(var i=0; i<this.esc.getLuces().length; i++){
                  if(this.esc.getLuces()[i].getEntidad().getDireccion() != null){
                      arrayLucesDireccionales.push(this.esc.getLightMatrix()[i][0]);
                      arrayLucesDireccionales.push(this.esc.getLightMatrix()[i][1]);
                      arrayLucesDireccionales.push(this.esc.getLightMatrix()[i][2]);

                      arrayLucesDireccionales.push(this.esc.getLuces()[i].getEntidad().getIntensidadDifusa()[0]);
                      arrayLucesDireccionales.push(this.esc.getLuces()[i].getEntidad().getIntensidadDifusa()[1]);
                      arrayLucesDireccionales.push(this.esc.getLuces()[i].getEntidad().getIntensidadDifusa()[2]);

                      arrayLucesDireccionales.push(this.esc.getLuces()[i].getEntidad().getIntensidadEspecular()[0]);
                      arrayLucesDireccionales.push(this.esc.getLuces()[i].getEntidad().getIntensidadEspecular()[1]);
                      arrayLucesDireccionales.push(this.esc.getLuces()[i].getEntidad().getIntensidadEspecular()[2]);

                      arrayLucesDireccionales.push(this.esc.getLuces()[i].getEntidad().getDireccion()[0]);
                      arrayLucesDireccionales.push(this.esc.getLuces()[i].getEntidad().getDireccion()[1]);
                      arrayLucesDireccionales.push(this.esc.getLuces()[i].getEntidad().getDireccion()[2]);

                      arrayLucesDireccionales.push(this.esc.getLuces()[i].getEntidad().getConusAngle()[0]);
                      arrayLucesDireccionales.push(this.esc.getLuces()[i].getEntidad().getConusAngle()[1]);
                      arrayLucesDireccionales.push(this.esc.getLuces()[i].getEntidad().getConusAngle()[2]);

                      nld++;
                  }else{
                      arrayLucesPuntuales.push(this.esc.getLightMatrix()[i][0]);
                      arrayLucesPuntuales.push(this.esc.getLightMatrix()[i][1]);
                      arrayLucesPuntuales.push(this.esc.getLightMatrix()[i][2]);

                      arrayLucesPuntuales.push(this.esc.getLuces()[i].getEntidad().getIntensidadDifusa()[0]);
                      arrayLucesPuntuales.push(this.esc.getLuces()[i].getEntidad().getIntensidadDifusa()[1]);
                      arrayLucesPuntuales.push(this.esc.getLuces()[i].getEntidad().getIntensidadDifusa()[2]);

                      arrayLucesPuntuales.push(this.esc.getLuces()[i].getEntidad().getIntensidadEspecular()[0]);
                      arrayLucesPuntuales.push(this.esc.getLuces()[i].getEntidad().getIntensidadEspecular()[1]);
                      arrayLucesPuntuales.push(this.esc.getLuces()[i].getEntidad().getIntensidadEspecular()[2]);

                      nlp++;
                  }
              }
              //LUCES DIRECCIONALES
              gl.uniform1i(shaderProgram.nDireccionalLightsUniform, nld);
              if(nld > 0){
                  var aux = arrayLucesDireccionales.length % 3;

                  for(var i=0; i<aux; i++){
                      arrayLucesDireccionales.push(0.0);
                  }
                  gl.uniform3fv(shaderProgram.sceneDirectionalLightsUniform, arrayLucesDireccionales);
              }
              
              //LUCES PUNTUALES
              gl.uniform1i(shaderProgram.nLightsUniform, nlp);
              if(nlp > 0){
                  alert(arrayLucesPuntuales);
                  gl.uniform1fv(shaderProgram.scenePointLightsUniform, arrayLucesPuntuales);
              }
          }else{
              gl.uniform1i(shaderProgram.useLightingUniform, false);
          }

          
          if(this.textura.getTextureMesh() != null){
              gl.uniform1i(shaderProgram.useTexturesUniform, true);
              //LE INDICO AL SHADER QUE TEXTURA VAMOS A UTILIZAR
              gl.activeTexture(gl.TEXTURE0);
              gl.bindTexture(gl.TEXTURE_2D, this.textura.getTextureMesh());

              gl.uniform1i(shaderProgram.samplerUniform, 0);
          }else{
              gl.uniform1i(shaderProgram.useTexturesUniform, false);
          }

          //AQUI LE PASO LOS BUFFER AL SHADER
          gl.bindBuffer(gl.ARRAY_BUFFER, bufferPosicion);
          gl.vertexAttribPointer(shaderProgram.vertexPositionAttribute, bufferPosicion.itemSize, gl.FLOAT, false, 0, 0);

          gl.bindBuffer(gl.ARRAY_BUFFER, bufferTextura);
          gl.vertexAttribPointer(shaderProgram.textureCoordAttribute, bufferTextura.itemSize, gl.FLOAT, false, 0, 0);

          gl.bindBuffer(gl.ARRAY_BUFFER, bufferNormales);
          gl.vertexAttribPointer(shaderProgram.vertexNormalAttribute, bufferNormales.itemSize, gl.FLOAT, false, 0, 0);

          gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, bufferIndices);

          //Y AQUI FINALMENTE INVOCO AL METODO QUE INICIALIZA LAS MATRICES MODEL VIEW Y LA DE LAS NORMALES
          this.setMatrixUniforms();
          //INVOCO AL DRAW ELEMENTS PARA QUE PINTE LA MALLA
          gl.drawElements(gl.TRIANGLES, bufferIndices.numItems, gl.UNSIGNED_SHORT, 0);
          console.log("**********************************");
      }

      endDraw(){}
  }
      