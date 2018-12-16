
Player p1 = new Player();
ArrayList<Level> levels = new ArrayList<Level>();
ArrayList<Bubble> bubbles = new ArrayList<Bubble>();
int currentLevel = 0;
int maxLevel =  5;

void setup() {
  size(700, 700);
  background(0);
  noStroke();
  
  for (int levelId = 0; levelId <= maxLevel; levelId++) {
     levels.add(levelId, new Level(p1, levelId*2));
     
  }
  
}

void draw() {
  background(0);
  
  // Print the remaining bubbles in play
  textSize(16);
  fill(100);
  text("Bubbles in Play: ", 530, 30);
  text(bubbles.size(), 660, 30); 
  
  // Start a level
  if (levelWon() && currentLevel != maxLevel) {
       this.bubbles = new ArrayList<Bubble>(levels.get(currentLevel).bubbles);
       currentLevel++;
     }
  
  // Create the player
  p1.update();
  p1.show();
  
  // Create the bubbles
  for (int bubbleId = 0; bubbleId < bubbles.size(); bubbleId++) {
     Bubble bubble = bubbles.get(bubbleId);
     bubble.update();
     bubble.show();
     
     // Pop bubble on collision with player
     popBubble(bubble, bubbleId);
  }
  
}

void popBubble(Bubble bubble, int bubbleId) {
  if(dist(p1.position.x, p1.position.y, bubble.position.x, bubble.position.y) <= p1.radius) {
      bubbles.remove(bubbleId);
  }
}

boolean levelWon() {
   if(bubbles.size() == 0) {
      return true; 
   }
  return false;
}
