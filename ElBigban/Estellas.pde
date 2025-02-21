//para la funcion dibujar estrellas
float maxSize = 100; //tamaño máximo de diametro de la estrella
//encapsulamos en una función la creación de estrellas
// en este caso no se generó una clase aunque se pod´ia haber hecho
void crearEstrellas(){
      /* Con este for hacemos que se ejecute un poco más rápido ya que cada vez que pasa por el draw se ejecuta en este caso do veces. 
         Si aumentamos el número se dibujaran las estrellas más rápido
      */
      for (int i=0 ; i<2; i++){ 
        float x = random(width);
        float y = random(height);
        float size = random(maxSize);
        color c = color(random(255), random(100), random(10));
        fill(c, random(100));
        noStroke();
        ellipse(x, y, size, size);
       }
  
}
