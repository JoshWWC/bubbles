// this is so overpowered and feels laggy

class StickItem extends Item {
  Player p1;
  StickItem(Player p1) {
    super(width/2 + 150, height/2 + 150, 20);
    this.p1 = p1;
  }
  
  void displayItem() {
    textSize(20);
    textAlign(CENTER);
    fill(255);
    text("Grow A Stick", this.position.x, this.position.y-80); 
    text("it's long...", this.position.x, this.position.y-40);
    textAlign(BASELINE);
    textSize(16);
    
    noStroke();
    stroke(255);
    strokeWeight(1);
    noFill();
    line(this.position.x, this.position.y, this.position.x-10, this.position.y-10);
  }
  
  void show() {
    line(p1.position.x, p1.position.y, width/2, height/2); // lol
    p1.hasStick = true;
  }
}
