class Pajaro {
  float x, y;
  float px, py, velX, velY, velAlas, tiempo; // posición del oso
  
  float lado, fPico, fOjo, fOjoX, fAla ;
  float diamCabeza, diamOjo, diamCuerpo, diamAlas;
  float anchoPico, largoPico, anchoAla, largoAla, largoAlaInicial, largoCuerpo, anchoCuerpo  ;
  
  PVector posCabeza, posOjo, posCuerpo, posAla1, posAla2, posPico;
  float posAlaD, posAlaI;
  color cPico, cOjo, cCuerpo;
  


  
  Pajaro(float _px, float _py, float _lado) {
    px = _px;
    py = _py;
    lado = _lado;
    
    // velocidades iniciales
    velAlas = random(0.6, 2);            // El movimiento de las alas determina la velocidad de avance 
                                        // pasandole los parametros a la velocidad del pájaro y ampeándolo
    velX = map(velAlas, 0.6, 2, 0.1, 2 ); //establezco una velocida aleatoria
    velY = map(velAlas, 0.6, 2, 0.2, 2 );
    tiempo = 0;
    
    // Diferenciales para cambiar las dimensiones y las posciones
    fOjo= 0.2;
    fOjoX = 1.1;
    fPico = 3;
    fAla = 1.1; 
    
    
   
   
    
    //Colores
   
    cPico = color(255, 215, 0);
    cOjo = color(0);
    cCuerpo = color(255);
   
  }
  
  
  // Declaramos los métodos de la clase. Uno irá actualizando posiciones, velocidades y demás
  // y el otro dibuja el pájaro
  void update() {
    // Actualizamos el largo de las alas modificando fAla
    fAla = sin(tiempo * velAlas) * PI / 4; // Usamos esta funcion de onda seno o coseno para producir un movimiento sinuidal 8parecido a una onda)
    tiempo += 0.2;                         // aumentamos el tiempo para que se produzca el movimeinto
    px += velX;                            // hacemos que se desplace horizontalmente y verticalmente
    py -= velY;
    if (py < anchoCuerpo || py> height - anchoCuerpo) {              // Si toca el alto de la pantalla cambia de dirección y baja el pájaro
      velY *= -1;
    }else if(px > width + lado){           // Si se sale de pantalla cuelve al inicio sin verse y sale otra vez por la pantalla 
      px = -lado;                          // Ajustamos para que aparezca de la nada
      py = random (lado, height -lado); 
      lado = random(50,200); // Rehaceos el tamaño
    }
  }
 
  void dibujar() {
    
     // Dimensiones buscando cmo referencia el aldo que corresponde al cuerpo del pájaro. 
    // A partir de ahí se sacan las proporciones
    // También usamos diferenciales para poder modificar el grosor del Ojo y el laro del pico
    diamCabeza = lado/4;
    diamOjo = diamCabeza * fOjo;
    anchoPico = lado/20;
    largoPico = anchoPico*fPico;
    anchoAla = lado/2;
    largoAlaInicial = lado ;


    largoCuerpo = lado;
    anchoCuerpo = lado/2;
     
    //posiciones
    posCuerpo = new PVector(0,0);
    posCabeza = new PVector(lado*1/2, y - 10);
    posOjo = new PVector(posCabeza.x *fOjoX, posCabeza.y );
    posPico = new PVector(posCabeza.x + diamCabeza/3, posCabeza.y);
    posAlaD = x - anchoAla/2;
    posAlaI = x - anchoAla/2 *0.5;
    
    
    
    stroke(0);
    pushMatrix();
    translate(px,py);
    

    // Ala Izquierda (la dibujamos antes que el cuerpo para que vaya detrás)
    // ---------------
 
    largoAla = largoAlaInicial * fAla;
    fill(cCuerpo); 
    pushMatrix();                    // Guardamos el estado actual del sistema de coordenadas
    translate(posAlaI, y-10);        // modificamos el origen de coordenadas pasandole el valor que le hemos asignado más 
                                     // arriba a la posción del Ala Izquierda con respecto al cuerpo
                                     // lo hacemos aquí porque al no tratarse de una elipse es más fácil dibujar el triangulo 
                                     // si partimos de coordenadas 0,0 para el primer vertice del triangulo
    triangle(0, 0, anchoAla, 0, anchoAla, largoAla); // Dibujamos el ala pasandole el ancho y el alto del ala
    popMatrix();                     // Restauramos el estado anterior del sistema de coordenadas

    
    // Cuerpo del pájaro
    // ---------------
    
    fill(cCuerpo); 
    ellipse(posCuerpo.x, posCabeza.y, largoCuerpo, anchoCuerpo); // Esta vez no hacemos traslación porque hemos recuperado el centro de coordenadas que anterior pasado por parámetro.
                                                           // Le pasamos la variable de la posicion del cuerpo que hemos recogido a través de un variable PVector
    
    
    // Ala derecha del pájaro (Va delante del cuerpo)
    // ---------------
    
    fill(cCuerpo); 
    pushMatrix(); // Guardamos el estado actual del sistema de coordenadas
    translate(posAlaD, y-10); // Movmos 
    triangle(0, 0, anchoAla, 0, anchoAla, largoAla); // Triángulo dibujando el ancho y el alto del ala
    popMatrix(); // Restaurar el estado anterior del sistema de coordenadas

    pushMatrix(); // Guardamos coordenadas
    // Pico del pájaro
    // ---------------
    
    fill(cPico); 
    translate(posPico.x, posPico.y); // Mover el pico alrededor del cuerpo del pájaro
    triangle(0, -anchoPico, largoPico, 0, 0, anchoPico); // Triángulo del pico que lo dibujamos cn el ancho y el largo que hemos declarado anteriormente
    popMatrix(); // Restauramos  coordenadas 

    // Cabeza del pájaro
    // ---------------
    
    fill(cCuerpo); 
    ellipse(posCabeza.x, posCabeza.y, diamCabeza, diamCabeza); // Dibujamos una elipse pasandole los valores de posición del vector Cabeza

     
    // Ojo del pájaro
    // ---------------
    
    fill(cOjo); 
    ellipse(posOjo.x, posOjo.y, diamOjo, diamOjo); // Dibujamos una elipse pasandole los valores de posición del vector Ojo
    
    popMatrix();
  
  }
  

}
