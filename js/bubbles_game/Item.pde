/* Going to fill this out more later with actual defaults.
 * 
 *
 */

class Item {
  PVector position;
  float itemWidth;
  Item(float xpos, float ypos, float itemWidth) {
   position = new PVector(xpos, ypos); 
   this.itemWidth = itemWidth;
  }
  
  boolean update(Player p1) {
    if (dist(p1.position.x, p1.position.y, this.position.x, this.position.y) <= p1.radius) {
       p1.items.add(this);
       return true;
    }
    return false;
  }
  
  void displayItem() {
    
  }
  
  void show() {
    
  }
}
