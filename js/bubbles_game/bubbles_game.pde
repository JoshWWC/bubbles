
Game currentGame = new Game();

void setup() {
  size(700, 700);
  background(0);

  
  for (int levelId = 0; levelId <= 5; levelId++) {
     currentGame.levels.add(levelId, new Level(levelId, currentGame.p1));
     
  }
  
}

void draw() {
  background(0);
  
  // Print the remaining bubbles in play
  textSize(16);
  fill(100);
  text("Bubbles in Play: ", 530, 30);
  text(currentGame.bubbles.size(), 660, 30); 
  
  // Play through the levels
  if (currentGame.levelWon() && currentGame.level < currentGame.levels.size() ) {
    currentGame.currentLvl = currentGame.levels.get(currentGame.level++);
    currentGame.bubbles = new ArrayList<Bubble>(currentGame.currentLvl.bubbles);
    currentGame.enemies = new ArrayList<Enemy>(currentGame.currentLvl.enemies);
  }

  // Create the player
  currentGame.p1.update();
  currentGame.p1.show();
  
  // Get the bubbles
  for (int bubbleId = 0; bubbleId < currentGame.bubbles.size(); bubbleId++) {
     Bubble bubble = currentGame.bubbles.get(bubbleId);
     bubble.update();
     bubble.show();
     
     // Pop bubble on collision with player
     currentGame.popBubble(bubble, bubbleId);
  }
  
  // Get the enemies
  for (int enemyId = 0; enemyId < currentGame.enemies.size(); enemyId++) {
     Enemy enemy = currentGame.enemies.get(enemyId);
     enemy.update();
     enemy.show();
  }
 }
