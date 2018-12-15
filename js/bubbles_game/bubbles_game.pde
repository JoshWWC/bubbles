ArrayList<Bubble> bubbles = new ArrayList<Bubble>();
Player p1 = new Player();

void setup() {
  size(700, 700);
  background(0);
  noStroke();
  
  for(int i = 0; i < 15; i++) {
     bubbles.add(i, new Bubble(random(255), random(255), random(255) ) ); 
  }
  
}

void draw() {
  background(0);
  textSize(16);
  fill(100);
  text("Bubbles in Play: ", 530, 30);
  text(bubbles.size(), 660, 30); 
  
  p1.update();
  p1.show();
  
  for (Bubble bubble : bubbles) {
     bubble.update();
     bubble.show();
     
  }
  
  for(int bubbleId = 0; bubbleId < bubbles.size(); bubbleId++) {
     popBubble(bubbles.get(bubbleId), bubbleId);
  }
  
}

void popBubble(Bubble bubble, int bubbleId) {
  if(dist(p1.position.x, p1.position.y, bubble.position.x, bubble.position.y) <= p1.radius) {
      bubbles.remove(bubbleId);
  }
}
