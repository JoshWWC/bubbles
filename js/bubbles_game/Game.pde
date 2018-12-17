class Game {
  Level level;
  ArrayList<Player> players = new ArrayList<Player>();
  ArrayList<Bubble> bubbles = new ArrayList<Bubble>();
  ArrayList<Bubble> popped = new ArrayList<Bubble>();
  ArrayList<Enemy> enemies = new ArrayList<Enemy>();
  boolean restart = false;
  int score = 0;
  
  Game() {
    this.level = new Level(0);
    
    bubbles.add(new Bubble(100, 90, 150) );
    enemies.add(new Enemy() );
    
    // create a player
    this.players.add(0, new Player(3) );
  }
  
  void playTutorial() {
    if (bubbles.size() > 0 && enemies.size() > 0) {
      bubbles.get(0).position.x = 200;
      bubbles.get(0).position.y = 500;
      bubbles.get(0).velocity.x = 0;
      bubbles.get(0).velocity.y = 0;
       
      textAlign(CENTER);
      fill(255);
      text("This is a bubble!", 200, 450);
      
      // ------ tutorial enemy ------
      enemies.get(0).position.x = 500;
      enemies.get(0).position.y = 500;
      enemies.get(0).velocity.x = 0;
      enemies.get(0).velocity.y = 0;
       
      textAlign(CENTER);
      fill(255);
      text("This is an enemy!", 500, 450);
      
      text("You can move using the arrow keys.", width/2, 550);
      text("Move to the bubble to eat it and start the game!", width/2, 570);
      text("You can also just die if you want to.", width/2, 590);
      textAlign(BASELINE);
    }
  }
  void newLevel() {
      level = new Level(++this.level.number);
      this.bubbles = new ArrayList<Bubble>(level.bubbles);
      this.enemies = new ArrayList<Enemy>(level.enemies);
   }


  // if player hits bubble, delete it
  boolean popBubble(Bubble bubble, int bubbleId) {
    // if player's position reaches bubble position, collission occured
    if(dist(players.get(0).position.x, players.get(0).position.y, bubble.position.x, bubble.position.y) <= players.get(0).radius + 5) {
        Bubble temp = bubbles.get(bubbleId);
        bubbles.remove(bubbleId);
        score+=100;
        return true;
    }
    return false;
  }
  
  
  // decrement player hp and bounce enemy on hit
  void hitPlayer(Player p1, Enemy e) {
    if (dist(p1.position.x, p1.position.y, e.position.x, e.position.y) <= p1.radius) {
      // if collission with player, make enemy bounce
      e.velocity.x *= -1;
      e.velocity.y *= -1;
      
      // ball needs to be placed outside p1 radius or we get hit too many times
      if (e.position.x < p1.position.x) {
        e.position.x -= p1.radius;
      } else {
       e.position.x += p1.radius; 
      }
      if (e.position.y < p1.position.y) {
        e.position.y -= p1.radius;
      } else {
       e.position.y += p1.radius; 
      }
      
      p1.health--;
    }
 }
}
