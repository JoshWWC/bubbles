class Game {
  Player p1 = new Player();
  int level = 0;
  Level currentLvl;
  ArrayList<Level> levels = new ArrayList<Level>();
  ArrayList<Bubble> bubbles = new ArrayList<Bubble>();
  
  boolean levelWon() {
   if(bubbles.size() == 0) {
      return true; 
    }
   return false;
   }

  void popBubble(Bubble bubble, int bubbleId) {
    // if player's position reaches bubble position, collission occured
    if(dist(p1.position.x, p1.position.y, bubble.position.x, bubble.position.y) <= p1.radius) {
        bubbles.remove(bubbleId);
    }
  }
}
