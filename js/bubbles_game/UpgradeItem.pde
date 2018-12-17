class UpgradeItem extends Item {
  float upgradeRadius;
  Player p1;
  float oldR;
  UpgradeItem(float playerR, Player p1) {
    super(width/2 - 150, height/2 + 150, playerR*1.5);
    upgradeRadius = playerR*3;
    this.p1 = p1;
    oldR = p1.radius;
  }
  
  boolean update(Player p1) {
    if (dist(p1.position.x, p1.position.y, this.position.x, this.position.y) <= p1.radius) {
       p1.items.add(this);
       p1.radius = upgradeRadius;
       return true;
    }
    return false;
  }
  
  void displayItem() {
    textSize(20);
    textAlign(CENTER);
    fill(255);
    text("Grow Your Sphere", this.position.x, this.position.y-80); 
    text("(of influence)", this.position.x, this.position.y-40);
    textAlign(BASELINE);
    textSize(16);
    
    noStroke();
    stroke(255);
    noFill();
    ellipse(this.position.x, this.position.y, upgradeRadius, upgradeRadius);
  }
  
  void show() {
    ellipse(p1.position.x, p1.position.y, this.oldR, this.oldR);
  }
}
