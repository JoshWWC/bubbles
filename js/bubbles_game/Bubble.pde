class Bubble extends Entity {
  
  float r, g, b;
  float popDelay;
  
 Bubble(float r, float g, float b) {
    super(new PVector(random(0,width), random(0,height)), PVector.random2D(), 20);
    velocity.mult(3);

    this.r = r;
    this.g = g;
    this.b = b;
    
    this.popDelay = 0;
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
  
  void pop() {
    Bubble bubble = this;
    noStroke();
    strokeWeight(3);
    stroke(bubble.r, bubble.g, bubble.b);
    
    if (bubble.popDelay < 25) {
     popDelay += 0.8; 
    }
    
    textSize(14);
    textAlign(CENTER);
    text("+100", bubble.position.x,bubble.position.y);
    textAlign(BASELINE);

    for (int pixel = 0; pixel < 20; pixel++) {
      pushMatrix();
      translate(bubble.position.x,bubble.position.y);
      point(sin(radians(pixel*(360/20)))*popDelay,cos(radians(pixel*(360/20)))*popDelay);
      popMatrix();
    }
    
    strokeWeight(1);
  }
}
