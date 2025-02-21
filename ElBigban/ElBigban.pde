/* 
  Kris Darias
  Abril 2023
  Ejercio UOC, arte generativo
  Objetivos: que contenga un array, un random y bucles
  
  Título : El bigban
   println("TECLAS: ");
    println("--- ENTER:         PASAR A LA PANTALLA DE GALAXIA                 --(Si estás en la pantalla de caminantes)  ");
    println("--- ESPACIADOR:    CREA UNA NUEVA GALAXIA                         --(Si estás  ESTADIO 4 que es la última pantalla)  ");
    println("--- C:             CAMBIA DE COLOR ALEATORIAMENTE LAS GALAXIAS    --(Si estás  ESTADIO 4 que es la última pantalla)  ");
    println("--- CLICK DERECHO: LIMPIA PANTALLA                                --(Si estás  ESTADIO 4 que es la última pantalla)  ");
    println("--- S:             GUARDAR PANTALLAZO  "); C


  Explicación: Primero todas las partículas se contraen, para generar una explosión de estrellas y luego se van creando las diferentes galaxias en el último estadio
  Se construye esta obra a través de bucles, arrays, clases, utilizando elementos aleatorios y cambiando con la interacción del usuario.
  Es por esto que se puede conciderar arte generativo.

*/
int startTime; //vaiable que nos ayudará en el temporalizador;
Caminante[] caminantes; // Array de objeto Caminante
Galaxia[] galaxias; // Array de objeto Galaxia
MoleculaBB[] moleculasBB; // Array de objeto MoleculaBB
Bigban bigban; // objeto Bigban


//Variablers para controlar las diferentes pantallas    
int estado = 1;   
color[] c = new color[4]; //Declaramos un array color para guardar nuestra paleta de colores

int n; //contador que se usa para cambiar el nombre a la imagen capturada

void setup(){
    size(1400,800); //dimensiones de la pantalla
    background(c[0]); //asignamos por variable un color a la galaxia
    
    // Declaramos array de colores
    c[0] =  color(0, 0, 0);//negro
    c[1] =  color(255, 255, 255);//blanco
    c[2] =  color(251, 200, 47);//amarillo
    c[3] =  color(243, 59, 9);//rojo
    
    /*
      Inicializamos array de caminantes estableciendo en número de caminantes
      -- establecemos el número de caminantes a 2000
      -- recorremos el array e inicializamos cada caminante pasándole los parametros que necesita el constructor de la clase
    */
    caminantes = new Caminante[2000]; 
    for (int i=0; i< caminantes.length; i++){ 
        caminantes[i] = new Caminante(random(width), random(height), random(-1, 5), c[1], random(5)); //(x, y, vel, color, diametro)
    } 
    /*
      Establecemos elementos  del array  e incializamos cada elemento (en este caso 1)
      --- En galaxia empezamos con sólo 1 elemento del array que se crea en el centro. 
      --- Después con el espaciador se pueden ir creando más galaxias
    */
    galaxias = new Galaxia[1];
    galaxias[0] = new Galaxia(width/2, height/2, 300, 100, c[1], 0.01);  //(x, y, ancho, alto, color, velocidad)
     
    /*
      Establecemos elementos  del array  e incializamos cada elemento. 
    */
    moleculasBB = new  MoleculaBB[100];
    for (int i=0; i< moleculasBB.length; i++){ //recorremos el array e inicializamos cada caminante
         moleculasBB[i] = new  MoleculaBB(width/2, height/2, random(300), random(300), c[1], random(-3,3) );  //(x, y, ancho, alto, color, velocidad)
    }
    /*
      Inicializamos el objeto perteneciente a la clase Bigban. 
    */
    bigban = new Bigban( width/2, height/2, 500 ); //x, y, diametro)
    
    
    println("TECLAS: ");
    println("--- ENTER:         PASAR A LA PANTALLA DE GALAXIA                 --(Si estás en la pantalla de caminantes)  ");
    println("--- ESPACIADOR:    CREA UNA NUEVA GALAXIA                         --(Si estás  ESTADIO 4 que es la última pantalla)  ");
    println("--- C:             CAMBIA DE COLOR ALEATORIAMENTE LAS GALAXIAS    --(Si estás  ESTADIO 4 que es la última pantalla)  ");
    println("--- MOVER EL RATÓN:CAMBIA EL DIAMETRO DE LA GALAXIA                  --(Si estás  ESTADIO 4 que es la última pantalla)  ");
    println("--- CLICK DERECHO: LIMPIA PANTALLA                                --(Si estás  ESTADIO 4 que es la última pantalla)  ");
    println("--- S:             GUARDAR PANTALLAZO  "); 



}
    
void draw(){ 
     //println (estado);
     /*
       Revisamos el estado:
       vemos en qué estado estamos para ejecutar las diferentes funciones
     */
     
     /*
       1.- MoleculaBB y bigban
       --- Dibujamos el bigban aplicando el metodo dibujar de la clase Bigban 
       --- Dibujamos cada elemento del array moleculasBB de la clase MoleculaBB
       --- Nota: Al trabajar con Array de objetos hay una forma de recorrerlo más sencilla que la iteraccion típica de for 
     */
     if ( estado <= 1 ) {                  
          bigban.dibujar(); 
          for ( MoleculaBB g : moleculasBB){ 
            g.dibujar();
          }
          
      /* 
        2.- LIMPIAMOS PANTALLA: Si ya se ha producido la explosion y pasamos al estado 3
        --- Añadimos  segundos  desde el incio del programa  y cambiamos al estado 3
      */   
      }else if ( estado == 2) {          
          for (int i = 0 ; i <= 1; i++){
             background(c[0]);    
          }
          if ( (millis() - startTime > 4000)) {
             estado = 3;
          } 
      /* 
        3.- Creación del mundo: pintamos a todos los caminantes, las galaxias y las estrellas
        --- CAMINANTES
        --- Para cambiar de estado se toca ENTER o cuando han pasado 14s
      */  
      }else if (estado == 3){ 
         for (Caminante c : caminantes) {
             c.dibujar();
             c.mover();
             c.direccion();
         }
         if ( (millis() - startTime > 10000)) {
             estado = 4;
          }
      /* 
        4.- ESTRELLAS Y GALAXIAS
        --- Llamamos a la función que crea las estrellas
        --- Vamos creando nuevas galaxias. Hay un evento que si tocas el espaciador se crea otra nueva galaxia
        --- Si tocas la tecla "C" cambia de color aleatoriamente
      */  
       }else if (estado == 4){                             
           crearEstrellas();       
           for (Galaxia g : galaxias){ 
              g.dibujar();
           }
       }  
}

void mousePressed(){
     background(0);
}

void keyPressed() {
  
    if(key=='s'){ //guardamos un pantallazo
      save("KrisProcessing"+ n +"-2.png");
      n ++;
    }else if (key=='c' && estado == 4){
       for (Galaxia g : galaxias){ //Al trabajar con Array de objetos hay una forma de recorrerlo más sencilla a la anterior
         g.cambiarColor (color (c[int(random(1,4))],100));
         //println("ESTOYDENTRO");
       }
    }else if(keyCode== 32 && estado== 4) { // barra espaciadora
        Galaxia nuevaGalaxia = new Galaxia(random(width), random(height), random(100,100), random(50, 100), c[1], random(-0.08, 0.04) );  //(x, y, ancho, alto, color, velocidad)
        Galaxia[] nuevoArray = (Galaxia[]) append(galaxias, nuevaGalaxia);  //    La función append nos devuelve un array del tipo Object[] pero queremos que sea del tipo Galaxia[].                                                              
                                                                            //    Tenemos que hacer un casting explicito y convertirlo en un array del tipo Galaxias[]
        galaxias = nuevoArray;
    }else if(keyCode== ENTER && estado == 3){ // barra espaciadora
        estado=4;
    }
   

}
