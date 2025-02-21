/* Esta clase dibujará las galaxias que se crean después del bigban

TECLAS: 

---- ESPACIADOR : CREA UNA NUEVA GALAXIA (SOLO FUNCIONA CUANDO ESTAMOS EN EL ESTADIO 4)
---- "C": CAMBIA DE COLOR ALEATORIAMENTE LAS GALAXIAS


*/

class Galaxia {
  //Declaramos las variables que usaremos en el constructor
  
  float xo, yo, x, y; // posición de la galaxias
  float w = 100; // ancho de la galaxias
  float h = 50; // alto de la galaxias
  float angulo = 2; // ángulo inicial
  float speed = 0.01; // velocidad angular
  color cG; // Color de la galaxia
  float alpha = random(50, 150);
  int op = 50;
  
  Galaxia(float _xo, float _yo, float _w, float _h, color _cG, float _speed){
    xo = _xo;
    yo = _yo;
    w = _w;
    h = _h;
    cG = color(red(_cG), green(_cG), blue(_cG), alpha);
    speed = _speed;
    //xo = width/2;
    //yo = height/2;
   
  }
  void dibujar(){
   // Calcula la posición de la galaxias
    x = xo + cos(angulo) * 100;
    y = yo + sin(angulo) * 100;
    if (dist(x,y,mouseX,mouseY)< w*2){
        w = map(mouseX, 0, width, 300, 0);
        h = map(mouseY, 0, height, 300, 0);
    }

    // Dibuja la galaxias en la posición calculada
    noFill(); 
    stroke(cG);
    ellipse(x, y, w, h);
    angulo += speed;     // Incrementamos el ángulo para que la galaxias se mueva  
  }
 
  void cambiarColor(color nuevoCG){
    cG = nuevoCG;
    //println(nuevoCG);
  }
  
}
