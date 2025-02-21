/* Creamos ua clase Para crear el inicio del big ban. Un círculo que parpadea de color amarillo y blanco
   Le pasamos el color pior el array. Esto hace el efcto de parpadeo
*/

class Bigban{ 
      //Declaramos las variables que usaremos en el constructor
      float xBB, yBB, diametroBB; //Coordenda x y del la elipsis y diámetro
      Bigban(float _xBB, float _yBB, float _diametroBB){
        xBB = _xBB; 
        yBB = _yBB;
        diametroBB = _diametroBB;
      }
      //Creaos el método para dibujar y que llamaremos en la pestalla INICIO
      void dibujar(){ 
        background(c[int(random(2))], random(200,250)); //Hacemos que se pinte el fonco para crear el efecto parpadeo. Se limpia cada vez que pasa por el draw
        noStroke();
 
        if (diametroBB > 0){ //decrece
            fill(c[int(random(1,4))]);
            diametroBB -= random (10); //esto hace que cree un efecto de parpadeo
            circle(xBB, yBB, diametroBB);
            if ( dist(xBB, yBB, pmouseX, pmouseY) < diametroBB ){ //el BB comienza dibujándose en el centro y luego  para que el cambio no sea brusco calcula que el ratón esté encima del BB
              xBB=pmouseX;
              yBB=pmouseY;
            }
        } else{
            estado = 2;
        }     
     }
}
  
