// Clase de Random Walker
class Caminante{
     // Declaramos las variables que usaremos en el constructor
     float x, x2, y, vel, movimiento, nuevoMovimiento, d;
     color c;
     int margen = 100;
     Caminante(float _x, float _y, float _vel, color _color, float _d){
        x = constrain (_x, 100, width-margen);      //aseguramos que no sale de la pantalla y el margen con constrain (que un valor no exceda de dos puntos)
        y = constrain (_y, 100, height-margen); 
        vel = _vel;
        c = _color;
        d = _d;
     }
     
     //hacemos un método para dibujar cada caminante que llamaremos en uno de nuestros estados
     void dibujar(){
       strokeWeight(1);
       stroke(c);
       fill (c,random(3));
       circle(x, y, d);        //dibujamos al caminante
     }
      //hacemos un método para mover aleatoriamente cada caminanate que llamaremos en uno de nuestros estados
     void mover(){
       float  walk = random (1,100);  
       //establecemos direccion de movimiento de forma aleatoria por intervalos de 25
       if (walk < 25){
          x += vel; 
       }else if (walk < 50){
          x -=  vel;
       }else if (walk < 75){
          y -= vel;
       }else{
          y += vel;
       }
     }
     // 
     void direccion(){
       // cambiamos de dirección si chocamos pared
       if (x == 0 + margen || x == width-margen || y == 0 + margen  || y == height-margen){
          movimiento += vel;
       }else{
           movimiento -= vel;
       }
     }     
}
