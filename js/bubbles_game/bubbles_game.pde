
Game currentGame;
int BG = 0;
void setup() {
  size(700, 700);
  
  // start the game
  currentGame = new Game();
}
int time = millis();
void draw() {
  fill(BG, BG, BG, 40);
  rect(0, 0, width, height);
  if (!currentGame.restart && (currentGame.level.number % 5 != 0 || currentGame.level.number == 0)) {
    // fade color back in from a death
    if (BG > 0) {
     BG--; 
    }
    
    // start the tutorial
    if (currentGame.level.number == 0) {
     currentGame.playTutorial(); 
     fill(100);
     text("Level: Tutorial", 560, 30);
    } else {
    // display level
    fill(100);
    textSize(16);
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
    
    if (millis() > time + 9000 + random(0, 3000) ) {
      if (currentGame.powerups.size() < 4) {
      currentGame.powerups.add(new Powerup(currentGame.players.get(0) ) );
      }
      time = millis();
    }
    
    // powerups!
    for (int powerupId = 0; powerupId < currentGame.powerups.size(); powerupId++) {
      Powerup powerup = currentGame.powerups.get(powerupId);
      
      powerup.show();
      
      if(dist(currentGame.players.get(0).position.x, currentGame.players.get(0).position.y, powerup.position.x, 
      powerup.position.y) <= currentGame.players.get(0).radius + 5) {
        powerup.on = true;
        currentGame.players.get(0).effects.add(powerup);
        currentGame.powerups.remove(powerupId);
        }
      
    }
    
    for (int effectId = 0; effectId < currentGame.players.get(0).effects.size(); effectId++) {
      Powerup effect = currentGame.players.get(0).effects.get(effectId);
     if(effect.on == true) {
       effect.update();
     } else {
         currentGame.players.get(0).effects.remove(effectId);
     }
    }
    
    // Get the bubbles
    for (int bubbleId = 0; bubbleId < currentGame.bubbles.size(); bubbleId++) {
       Bubble bubble = currentGame.bubbles.get(bubbleId);
       bubble.update();
       bubble.show();

       if(currentGame.popBubble(bubble, bubbleId)) {
        currentGame.popped.add(bubble); 
       }
    }
    
    for (int bubbleId = 0; bubbleId < currentGame.popped.size(); bubbleId++) {
      Bubble bubble = currentGame.popped.get(bubbleId);
      bubble.pop();
      if (bubble.popDelay >= 22) {
       currentGame.popped.remove(bubbleId); 
      }
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
  } else if (currentGame.restart) {
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
  } else if (currentGame.level.number % 5 == 0) {
     ItemRoom IR = new ItemRoom(currentGame.level.number, currentGame.gameItems, currentGame.players.get(0));
     
     currentGame.players.get(0).update();
     currentGame.players.get(0).show();
     
     if(IR.draw() ) {
        currentGame.newLevel(); 
     }
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
