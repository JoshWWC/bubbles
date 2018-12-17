class ItemRoom {
  int level;
  ArrayList<Item> roomItems = new ArrayList<Item>();
  Player p1;
  
  ItemRoom(int level, ArrayList<Item> gameItems, Player p1) {
    this.level = level;
    
      roomItems.add(gameItems.get(0));
      roomItems.add(gameItems.get(1));
     
     this.p1 = p1;
  }
  
  boolean draw() {
   if (BG < 120) {
    BG++; 
   }
   if(lvl5() ) {
     return true;
   }
   return false;
  }
  
  boolean lvl5() {
    textAlign(CENTER);
     textSize(22);
     fill(0);
     text("Congragulations!", width/2, 50); 
     text("Your bubble popping prowess reverberates around the nation.", width/2, 90); 
     text("Please take a reward, mighty warrior.", width/2, 130); 
     
     if(roomItems.get(0).update(p1) ) {
       return true;
     }else if (roomItems.get(1).update(p1) ) {
       return true;
     } 
     
     roomItems.get(0).displayItem();
     roomItems.get(1).displayItem();
     
     textSize(16);
     textAlign(BASELINE);
     
     return false;
  }
}
