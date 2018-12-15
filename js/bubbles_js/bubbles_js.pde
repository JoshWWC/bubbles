ArrayList<Ball> ballPit = new ArrayList<Ball>();

void setup() {
  size(700, 400);
  background(0);
  noStroke();
  
  
  for(int i = 0; i < 20; i++) {
     ballPit.add(i, new Ball(random(255), random(255), random(255) ) );  //<>//
  }
}

void draw() {
  background(0);
  for (Ball ball : ballPit) {
     ball.update();
     ball.show();
  }
}
