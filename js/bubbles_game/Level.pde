class Level {
  int level;
  ArrayList<Bubble> bubbles = new ArrayList<Bubble>();
  ArrayList<Enemy> enemies = new ArrayList<Enemy>();
  
  Level(int level) {
    this.level = level; 
    
    // create bubbles
    for(int bubbleId = 0; bubbleId < level*2; bubbleId++) 
    {
      // random bubble colors, but always visible and never too red
      bubbles.add(bubbleId, new Bubble(random(20, 70), random(20, 255), random(20, 255) ) ); 
    }
    
    // create enemies
    for (int enemyId = 0; enemyId < 2; enemyId++) {
        enemies.add(enemyId, new Enemy() );
    }
    
  }
}
