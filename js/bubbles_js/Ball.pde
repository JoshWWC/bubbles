class Ball {
  PVector position;
  PVector velocity;
  float radius = 20;
  
  float r; 
  float g; 
  float b;
  
 Ball(float r, float g, float b) {
    position = new PVector(random(0,width), random(0,height));
    velocity = PVector.random2D();
    velocity.mult(2);

    this.r = r; //<>//
    this.g = g; //<>//
    this.b = b; //<>//
 }
  
  void checkBoundaryCollision() {
    if (position.x > width-radius) {
      position.x = width-radius;
      velocity.x *= -1;
    } else if (position.x < radius) {
      position.x = radius;
      velocity.x *= -1;
    } else if (position.y > height-radius) {
      position.y = height-radius;
      velocity.y *= -1;
    } else if (position.y < radius) {
      position.y = radius;
      velocity.y *= -1;
    } else if (position.x >= mouseX - 5 && position.x <= mouseX + 5) {
      velocity.x *= -1;
    } else if (position.y >= mouseY - 5 && position.x <= mouseY + 5) {
      velocity.y *= -1;
    }
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
