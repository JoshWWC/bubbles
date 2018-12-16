class Enemy extends Entity {
 Enemy() {
    super(new PVector(random(0,width), random(0,height)), PVector.random2D(), 20);
    velocity.mult(5);
 }
  
  void update() {
    checkBoundaryCollision();
    position.add(velocity);
  }
  
  void show() {
    noStroke();
    fill(255,0,0);
    ellipse(position.x, position.y, 20, 20);
  }
}
