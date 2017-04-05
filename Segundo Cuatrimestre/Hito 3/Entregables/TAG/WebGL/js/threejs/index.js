//***************************** variables ************************/
    //Preparing the Render
    var Render = new THREE.WebGLRenderer();
    //Scene
    var Escenario = new THREE.Scene();
    //Camera
    var Camara = new THREE.PerspectiveCamera();
    //Drawing
    var Dibujo;
    //Orbit Control
    var Controls;
    //Plane
    //var Textura_plano;
    //***************************** execute ***********************************/
    start();
    animation();
    //************************** functions **********************/
    function start(){
        //RENDER
        //render size
        Render.setSize(800, 600);
        //including render into div
        document.getElementById('render').appendChild(Render.domElement);
        //CAMERA
        //giving a position to the camera
        Camara.position.z = 100;
        //adding camera to the scene
        Escenario.add(Camara);
        //MODEL
        //creating the ground
        createPlane();
        //loading the model using the function 'cargarModelo'
        loadModel();
        //CONTROLS
        Controls = new THREE.OrbitControls(Camara,Render.domElement);
    }

    function createPlane(){
        //Geometry of the plane
        Geometria_plano = new THREE.PlaneGeometry(1000,1000,10,10);
        //Texture
        Textura_plano = new THREE.TextureLoader("texturas/cesped.jpg");
        Textura_plano.wrapS = Textura_plano.wrapT = THREE.RepeatWrapping;
        Textura_plano.repeat.set(10,10);
        //creating a material and adding a texture in it
        Material_plano = new THREE.MeshBasicMaterial({map:Textura_plano, side:THREE.DoubleSide});
        //the plane
        Territorio = new THREE.Mesh(Geometria_plano, Material_plano);
        Escenario.add(Territorio);
    }

    function loadModel(){
            //Geometry
        Geometria = new THREE.Geometry();
        //lines
        var vertices = [[2,7,0],
                        [7,2,0],
                        [12,7,0],
                        [12,17,0],
                        [7,12,0],
                        [2,17,0],
                        [2,7,0],
                        [2,7,2],
                        [7,2,2],
                        [12,7,2],
                        [12,17,2],
                        [7,12,2],
                        [2,17,2],
                        [2,7,2]];
        var long_vertices = vertices.length;
        for(i=0; i<vertices.length; i++){
            x = vertices[i][0];
            y = vertices[i][1];
            z = vertices[i][2];
            //agregamos los vertices al vector
            Vector = new THREE.Vector3(x,y,z);
            //agregamos el vector a la geometria
            Geometria.vertices.push(Vector);
        }

        //adding the point or the particle to the scene
        Material = new THREE.PointsMaterial({color:0xFF0000});
        Dibujo = new THREE.Line(Geometria, Material);
        Escenario.add(Dibujo);
    }

    function animation(){
            requestAnimationFrame(animation);
        renderModel();
    }

    function renderModel(){
            Controls.update();
            Dibujo.rotation.y = Dibujo.rotation.y + 0.01;
        //executing render
            Render.render(Escenario, Camara);
    }