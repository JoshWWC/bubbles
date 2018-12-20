/* Entity: A moving ellipse in the game
 *
 * Everything that's a moving part of the game needs to
 * have a position, a velocity to update that position,
 * and a radius. Nothing is allowed to go past the boundaries
 * of the window.
 */

class Entity {
  PVector position;
  PVector velocity;
  float radius;
  
  Entity(PVector p, PVector v, float r) {
    this.position = p;
    this.velocity = v;
    this.radius = r;
  }
  
  // check if we're hitting the edge of the window
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
