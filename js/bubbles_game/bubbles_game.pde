/* Core principles:
 *  The aesthetic should always be relaxing.
 *  The difficulty should never exceed that expected of a bubble game.
 *  Bubbles.
 *
 * Initial setup: We create a new game for the player
 * and run them through the tutorial. If the player hp
 * reaches 0 we restart. Every 5 levels is an item room.
 *
 * Powerups spawn at set intervals and may not exceed
 * 3 at a time.
 */

// setup a game state and a background color
Game currentGame;
int BG = 0; // this allows us to fade to white on death and then back to black on restart

void setup() {
  size(700, 700);
  
  // start the game on load
  currentGame = new Game();
}

int time = millis(); // powerups are based on a timer

// ** NEEDS TO BE SIGNIFICANTLY REFACTORED
void draw() {
  
  // slightly transparent rect gives us the tracing behind the bubbles
  fill(BG, BG, BG, 90);
  rect(0, 0, width, height);
  
  // choose what to display based on if player is dead or at an item room
  if (!currentGame.restart && (currentGame.level.number % 5 != 0 || currentGame.level.number == 0)) {
    // fade color back in from a death
    if (BG > 0) {
     BG--; 
    }
    
    // start the tutorial if just starting game
    if (currentGame.level.number == 0) {
     currentGame.playTutorial(); 
     fill(100);
     textSize(16);
     text("Level: Tutorial", 560, 30);
    } else {
    // display level
    fill(100);
    textSize(16);
    text("Level: ", 560, 30);
    text(currentGame.level.number, 660, 30);
    }
    
    // Start a new level once we clear all bubbles on current level
    if (currentGame.bubbles.size() == 0) {
     currentGame.newLevel(); 
    }
    
    // Print the remaining bubbles in play
    textSize(16);
    fill(100);
    text("Bubbles: ", 560, 50);
    text(currentGame.bubbles.size(), 660, 50); 
  
    // Get and show the player, update position on key presses
    currentGame.players.get(0).update();
    currentGame.players.get(0).show();
    
    // spawn powerups on semi-random intervals
    if (millis() > time + 9000 + random(0, 3000) ) {
      if (currentGame.powerups.size() < 4) {
      currentGame.powerups.add(new Powerup(currentGame.players.get(0) ) );
      }
      time = millis(); // update global time so intervals are consistant
    }
    
    // powerups! Display them and allow them to be eaten.
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
    
    // Player must be effected by powerups
    for (int effectId = 0; effectId < currentGame.players.get(0).effects.size(); effectId++) {
      Powerup effect = currentGame.players.get(0).effects.get(effectId);
     if(effect.on == true) {
       effect.update();
     } else {
         currentGame.players.get(0).effects.remove(effectId);
     }
    }
    
    // Get the edible bubbles
    for (int bubbleId = 0; bubbleId < currentGame.bubbles.size(); bubbleId++) {
       Bubble bubble = currentGame.bubbles.get(bubbleId);
       bubble.update();
       bubble.show();

       // for each bubble, on contact with player, pop
       if(currentGame.popBubble(bubble, bubbleId)) {
        currentGame.popped.add(bubble); 
       }
    }
    
    // display the "popped" animation
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
       
       // on contact with player, damage player and bounce enemy away
       currentGame.hitPlayer(currentGame.players.get(0), enemy);
    }
    // display hp
    // (hp has to be displayed after hit to display accurately on death)
    fill(100);
    text("Current HP: ", 560, 70);
    text(currentGame.players.get(0).health, 660, 70);
    
    // display score, incremented by +100 every bubble eaten
    text("Score: ", 560, 90);
    text(currentGame.score, 660, 90);
    
    // if hp == 0 we need to restart
    if (currentGame.players.get(0).health == 0) {
      currentGame.restart = true;
    }
  } else if (currentGame.restart) {
    // if hp == 0, stop drawing objects and fade to
    // wait till spacebar then restart the game
    background(BG);
    if (BG < 255) {
      BG++;
    }
    
    // tell player how to restart
    textAlign(CENTER);
    fill(0);
    text("Press Spacebar to Restart", width/2, height/2);
    
    keyPressed(); // wait for the spacebar
  } else if (currentGame.level.number % 5 == 0) {
    // if we're at an item room level, display the item room instead of bubbles
     ItemRoom IR = new ItemRoom(currentGame.level.number, currentGame.gameItems, currentGame.players.get(0));
     
     currentGame.players.get(0).update();
     currentGame.players.get(0).show();
     
     // draw is returning true when an item is picked. If item is picked we go to a new level.
     if(IR.draw() ) {
        currentGame.newLevel(); 
     }
  }
 }
 
 // wait for the space key to restart game
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
