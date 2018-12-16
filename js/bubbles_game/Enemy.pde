class Enemy extends Bubble {
  
  
 Enemy() {
   super(178,34,34);
   
   velocity.mult(2);
 }
 
 void update() {
   checkBoundaryCollision();
   position.add(velocity);
 }

}
