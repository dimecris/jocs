/* 
  Kris Darias
  Mayo 2023
  Ejercio UOC, diseño paramétrico
  
  Objetivos: 
  - Diseña un modelo gráfico cuya representación dependa de, al menos, 3 variables.
  - Crea la función o clase que permita representar el modelo pasándole valores a esas variables principales.
  - Crea una escena en la que haya al menos una representación del modelo.
  - Añade varios tipos de interacción.
    
  Título : El PÁJARO NEGRO
   println("TECLAS: ");
   println("--- DOWN:         SUBE EL PÁJARO JUGADOR   ");
   println("--- UP:           BAJA EL PÁJARO JUGADOR   ");
   println("--- LEFT:         MUEVE A LA IZQUIERDA EL PÁJARO JUGADOR   ");
   println("--- RIGHT:        MUEVE A LA DERECHA EL PÁJARO JUGADOR   ");
    


  Explicación: 
  - Se ha creado una clase con un pájaro negro y 6 pájaros blancos.
  - Cuando salen de pantalla cuelven a aparecer con unas coordenadas y nuevas desde el otro lado
  - Las alas de cada pájaro se mueven a una velocidad aleatoria y eso determina la velocidad a la que avanzan los pájaros
  - Los pajaros se crean de tamaños diferentes de forma aleatoria
  - Se interactuan con ellos a través de los cursores
  
  Esto podría ser el preludio de un juego

*/
Pajaro[] gaviotas = new Pajaro[6];
float velBajada = 1; // Velocidad de bajada de los pájaros


void setup() {
  size(600, 800);
  background(135, 206, 250); // Fondo celeste
  for (int i=0; i < gaviotas.length; i++){
    float x = random(-50, 100);
    float y = random(0, height);
    float size = (i==0) ? (size = (random(100,400))) : (size = (random(50,100))) ;
    gaviotas[i] = new Pajaro(x, y, size);
  }
   println("TECLAS: ");
   println("--- DOWN:         SUBE EL PÁJARO JUGADOR   ");
   println("--- UP:           BAJA EL PÁJARO JUGADOR   ");
   println("--- LEFT:         MUEVE A LA IZQUIERDA EL PÁJARO JUGADOR   ");
   println("--- RIGHT:        MUEVE A LA DERECHA EL PÁJARO JUGADOR   ");
  

}

void draw() {
  background(135, 206, 250); // Fondo celeste
  //Iteramos el array para pintar las gaviotas
  for (int i=0; i < gaviotas.length; i++){
    if (i==0){
      gaviotas[0].cCuerpo = 0;
      gaviotas[0].cOjo = 255;
    }
            gaviotas[i].update();
            gaviotas[i].dibujar();
  }
}
  
void keyPressed() {
    if (keyCode == UP) {   // Flecha hacia arriba
      for (int i = 0; i < gaviotas.length; i++) {
        gaviotas[0].py -= velBajada; // Modificamos la posición Y del pájaro jugador
      }
    } else if (keyCode == DOWN) {   // Flecha hacia abajo
      for (int i = 0; i < gaviotas.length; i++) {
        gaviotas[0].py += velBajada; // Modificamos la posición Y del pajaro jugador
      }
    } else if (keyCode == LEFT) {   // Flecha hacia la izquierda
         gaviotas[0].px -= velBajada*4; // Modificamos la posición Y del pajaro jugador
    } else if (keyCode == RIGHT) {  // Flecha hacia la derecha
         gaviotas[0].px += velBajada*2; // Modificamos la posición Y del pajaro jugador
    }
}
