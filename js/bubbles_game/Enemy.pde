class Enemy extends Bubble {
  Player p1;
  
 Enemy(Player p1) {
   super(178,34,34);
   
   this.p1 = p1;
   velocity.mult(2);
 }
 
 void update() {
   checkBoundaryCollision();
   bouncePlayer();
   position.add(velocity);
 }
 
 void bouncePlayer() {
    
    if (position.x > p1.position.x-p1.radius) {
      position.x = width-radius;
      velocity.x *= -1;
    } else if (p1.position.y > p1.position.y-p1.radius) {
      position.y = height-radius;
      velocity.y *= -1;
    }
 }
}
