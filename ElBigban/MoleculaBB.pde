/* Esta clase es muy parecida a Galaxia 
  Se utiliza de forma paralela con BigBan.
  Funciona diferente que la de galaxia porque con cada paso por el draw se limpia la pantalla y por lo tanto parece más una molécula
*/


class MoleculaBB {
  float xo, yo, x, y; // posición de la galaxias
  float w = 100; // ancho de la galaxias
  float h = 50; // alto de la galaxias
  float angulo = 2; // ángulo inicial
  float speed = 0.51; // velocidad angular
  color cG;
  float alpha = random(0, 100);
  int op = 50;
  
  MoleculaBB(float _xo, float _yo, float _w, float _h, color _cG, float _speed){
    xo = _xo;
    yo = _yo;
    w = _w;
    h = _h;
    cG = color(red(_cG), green(_cG), blue(_cG), alpha);
    speed = _speed;
  }
  void dibujar(){
    // Calculamos la posición de la galaxias

    // Dibujamos las galaxias en la posición calculada
    noFill(); 
    stroke(c[int(random(0,2) )]);
    if ( estado == 1) {
      for (int i = 0; i<1; i++){
        x = xo + cos(angulo) * 100;
        y = yo + sin(angulo) * 100;
        ellipse(x, y, w, h);
        angulo += speed;     // Incrementamos el ángulo para que la galaxias se mueva  
        w--; //disminuimos el tamaños poco a poco de las galaxias
        h--;
      }      
     }
    
  }
  void cambiarColor(color nuevoCG){
    cG = nuevoCG;
    //println(nuevoCG);
  }
  
}
