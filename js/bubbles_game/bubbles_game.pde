
Game currentGame;
int BG = 0;

void setup() {
  size(700, 700);
  
  // start the game
  currentGame = new Game();
}

void draw() {
  background(BG);
  if (!currentGame.restart) {
    // fade color back in from a death
    if (BG > 0) {
     BG--; 
    }
    
    // start the tutorial
    if (currentGame.level.number == 0) {
     currentGame.playTutorial(); 
     text("Level: Tutorial", 560, 30);
    } else {
    // display level
    text("Level: ", 560, 30);
    text(currentGame.level.number, 660, 30);
    }
    
    // Start a new level
    if (currentGame.bubbles.size() == 0) {
     currentGame.newLevel(); 
    }
    
    // Print the remaining bubbles in play
    textSize(16);
    fill(100);
    text("Bubbles: ", 560, 50);
    text(currentGame.bubbles.size(), 660, 50); 
  
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
    
    // display score
    text("Score: ", 560, 90);
    text(currentGame.score, 660, 90);
    
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
   if (currentGame.restart == true) {
     if (key == ' ') {
       // start new game
       currentGame = new Game();
       
       // skip tutorial
       currentGame.newLevel();
    }
   }
 }
