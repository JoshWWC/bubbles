
Game currentGame = new Game();
int BG = 0;

void setup() {
  size(700, 700);
  
}

void draw() {
  background(BG);
  if (!currentGame.restart) {
    if (BG > 0) {
     BG--; 
    }
    // Print the remaining bubbles in play
    textSize(16);
    fill(100);
    text("Bubbles in Play: ", 530, 30);
    text(currentGame.bubbles.size(), 660, 30); 
    
    // Play through the levels
    if (currentGame.levelWon() && currentGame.level <= 5 ) {
      currentGame.currentLvl = new Level(currentGame.level++);
      currentGame.bubbles = new ArrayList<Bubble>(currentGame.currentLvl.bubbles);
      currentGame.enemies = new ArrayList<Enemy>(currentGame.currentLvl.enemies);
    }
  
    // Get the player
    currentGame.players.get(0).update();
    currentGame.players.get(0).show();
    
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
       
       currentGame.hitPlayer(currentGame.players.get(0), enemy);
    }
    // player hp has to be displayed after hit to display accurately on death
    fill(100);
    text("Current HP: ", 560, 70);
    text(currentGame.players.get(0).health, 660, 70);
    
    // if hp == 0 set game to restart
    if (currentGame.players.get(0).health == 0) {
      currentGame.restart = true;
    }
  } else {
    // if hp == 0, stop drawing objects and fade to wait
    // wait till spacebar then restart the game
    background(BG);
    if (BG < 255) {
      BG++;
    }
    
    textAlign(CENTER);
    fill(0);
    text("Press Spacebar to Restart", width/2, height/2);
    
    keyPressed();
  }
 }
 
 void keyPressed() {
   if (key == ' ') {
     currentGame = new Game();
  }
 }
