class Level {
  int level;
  ArrayList<Bubble> bubbles = new ArrayList<Bubble>();
  
  Level(int level) {
    this.level = level; 
    for(int bubbleId = 0; bubbleId < this.level*2; bubbleId++) {
       bubbles.add(bubbleId, new Bubble(random(255), random(255), random(255) ) ); 
    
    }
    
  }
}
