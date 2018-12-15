class Level {
  Player p1;
  int levelBubbles;
  ArrayList<Bubble> bubbles = new ArrayList<Bubble>();
  
  Level(Player p1, int levelBubbles) {
    this.p1 = p1;
    this.levelBubbles = levelBubbles; 
    for(int i = 0; i < levelBubbles; i++) {
       bubbles.add(i, new Bubble(random(255), random(255), random(255) ) ); 
    }
    
    
  }
}
