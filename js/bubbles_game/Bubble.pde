/* A bubble is a moving entity which starts at a random
 * location and moves at a random speed. It also has a
 * a random color.
 *
 * Variety is the spice of life and bubble popping games.
 */

class Bubble extends Entity {
  
  float r, g, b;
  float popDelay; // popDelay allows us to display popping animation
  
 // bubble is an entity but holding a spork and being random
 Bubble(float r, float g, float b) {
    super(new PVector(random(0,width), random(0,height)), PVector.random2D(), 20);
    velocity.mult(3);

    this.r = r;
    this.g = g;
    this.b = b;
    
    this.popDelay = 0;
 }
  
  // keep the bubble location updated
  void update() {
    checkBoundaryCollision(); // from entity, stay within screen
    position.add(velocity);   // update position based on velocity
  }
  
  // show the bubble
  void show() {
    noStroke();
    fill(r,g,b);
    ellipse(position.x, position.y, 20, 20);
  }
  
  void pop() {
    Bubble bubble = this;
    noStroke();
    strokeWeight(3);
    stroke(bubble.r, bubble.g, bubble.b);
    
    if (bubble.popDelay < 25) {
     popDelay += 0.8; 
    }
    
    // dispaly the +100 score indicator
    textSize(14);
    textAlign(CENTER);
    text("+100", bubble.position.x,bubble.position.y);
    textAlign(BASELINE);

    // This boils down to 20 pixels shooting out at fixed intervals from
    // the bubble's last location on pop
    for (int pixel = 0; pixel < 20; pixel++) {
      pushMatrix();
      translate(bubble.position.x,bubble.position.y);
      point(sin(radians(pixel*(360/20)))*popDelay,cos(radians(pixel*(360/20)))*popDelay);
      popMatrix();
    }
    
    // reset text
    textSize(16);
    strokeWeight(1);
  }
}
