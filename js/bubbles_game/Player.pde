class Player extends Entity {
  int health = 3;
  boolean hasStick = false;
  boolean upPressed = false;
  boolean downPressed = false;
  boolean leftPressed = false;
  boolean rightPressed = false;
  ArrayList<Item> items = new ArrayList<Item>();
  ArrayList<Powerup> effects = new ArrayList<Powerup>();
  float velocityAmt = 2.25;
  PImage playerImage;
 
 Player(int hp) {
  super(new PVector(width/2, height/2), new PVector(0, 0), 15);
  this.health = hp;
  
  playerImage = loadImage("player.png"); // load player image
 }
 
 void update() {
   checkBoundaryCollision();
   keyPressed();
   
   if (upPressed && velocity.y >= -velocityAmt) {
    velocity.y-=velocityAmt;
    velocity.x=0;
    position.add(velocity);
  }

  if (downPressed && velocity.y <= velocityAmt) {
    velocity.y+=velocityAmt;
    velocity.x = 0;
    position.add(velocity);
  }

  if (leftPressed && velocity.x >= -velocityAmt) {
    velocity.x-=velocityAmt;
    velocity.y = 0;
    position.add(velocity);
  }

  if (rightPressed && velocity.x <= velocityAmt) {
    velocity.x+=velocityAmt;
    velocity.y = 0;
    position.add(velocity);
    keyPressed();
    keyReleased();
  }
   
   keyReleased();
   
   position.add(velocity);
  
 }
  
  void show() {
     noFill();
     noStroke();
     ellipse(position.x, position.y, radius, radius);
     image(playerImage, position.x, position.y);
     for (Item item : items) {
        item.show(); 
     }
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
 
 // overload boundary collission check so we aren't reversing player velocity
 // if instead of else-if since we're no longer bouncing and can now be doing both at once
 // optional. Bouncing like crazy is kinda fun.
 void checkBoundaryCollision() {
    if (position.x > width-radius) {
      position.x = width-radius;
    } if (position.x < radius) {
      position.x = radius;
    } if (position.y > height-radius) {
      position.y = height-radius;
    } if (position.y < radius) {
      position.y = radius;
    }
  }
  
  void getItem(Item item) {
    items.add(item);
  }
    
}
