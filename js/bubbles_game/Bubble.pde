class Bubble extends Entity {
  
  float r, g, b;
  
 Bubble(float r, float g, float b) {
    super(new PVector(random(0,width), random(0,height)), PVector.random2D(), 20);
    velocity.mult(3);

    this.r = r;
    this.g = g;
    this.b = b;
 }
  
  void update() {
    checkBoundaryCollision();
    position.add(velocity);
  }
  
  void show() {
    noStroke();
    fill(r,g,b);
    ellipse(position.x, position.y, 20, 20);
  }
  
}
