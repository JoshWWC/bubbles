class Entity {
  PVector position;
  PVector velocity;
  int radius;
  
  Entity(PVector p, PVector v, int r) {
    this.position = p;
    this.velocity = v;
    this.radius = r;
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
    }
  }
}
