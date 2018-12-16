class Game {
  int level = 0;
  Level currentLvl;
  ArrayList<Player> players = new ArrayList<Player>();
  ArrayList<Bubble> bubbles = new ArrayList<Bubble>();
  ArrayList<Enemy> enemies = new ArrayList<Enemy>();
  boolean restart = false;
  
  Game() {
    // create a player
    Player p1 = new Player(3);
    this.players.add(0, p1);
  }
  
  // if bubbles == 0 then the level is over
  boolean levelWon() {
   if(bubbles.size() == 0) {
      return true; 
    }
   return false;
   }

  // if player hits bubble, delete it
  void popBubble(Bubble bubble, int bubbleId) {
    // if player's position reaches bubble position, collission occured
    if(dist(players.get(0).position.x, players.get(0).position.y, bubble.position.x, bubble.position.y) <= players.get(0).radius) {
        bubbles.remove(bubbleId);
    }
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
