class Player {
  float radius = 15;
   
  PVector position;
  PVector velocity;
  
  boolean upPressed = false;
  boolean downPressed = false;
  boolean leftPressed = false;
  boolean rightPressed = false;
 
 Player() {
  this.position = new PVector(width/2, height/2); 
  this.velocity = new PVector(0, 0);
 }
 
 void update() {
   checkBoundaryCollision();
   keyPressed();
   
   if (upPressed && velocity.y >= -1.4) {
    velocity.y-=1.4;
    position.add(velocity);
  }

  if (downPressed && velocity.y <= 1.4) {
    velocity.y+=1.4;
    position.add(velocity);
  }

  if (leftPressed && velocity.x >= -1.4) {
    velocity.x-=1.4;
    position.add(velocity);
  }

  if (rightPressed && velocity.x <= 1.4) {
    velocity.x+=1.4;
    position.add(velocity);
  }
   
   keyReleased();
   
   position.add(velocity);
  
 }
  
  void show() {
     noFill();
     stroke(255);
     ellipse(position.x, position.y, radius, radius); 
    }
    
    void keyPressed() {
    if (keyCode == UP) {
      upPressed = true;
    }
    else if (keyCode == DOWN) {
      downPressed = true;
    }
    else if (keyCode == LEFT) {
      leftPressed = true;
    }
    else if (keyCode == RIGHT) {
      rightPressed = true;
    }
  }

  void keyReleased() {
    if (keyCode == UP) {
      upPressed = false;
    }
    else if (keyCode == DOWN) {
      downPressed = false;
    }
    else if (keyCode == LEFT) {
      leftPressed = false;
    }
    else if (keyCode == RIGHT) {
      rightPressed = false;
    }
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
