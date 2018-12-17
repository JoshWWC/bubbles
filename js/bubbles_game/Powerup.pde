class Powerup extends Bubble{
  Player p1;
  boolean on = false;
  Powerup (Player p1) {
   super(255,223,0);
   this.p1 = p1; 
  }
  int begin = millis();
     int duration = 5;
     int time = 5;
 void update() {
   if (on) {
     effect();
     
     
     if (time > 0)  {
       time = duration - (millis() - begin)/1000;
     } else 
     {
       on = false; 
       this.p1.velocityAmt = 2.25;
    }
   }
 }
 
 
 void effect() {
   fill (random(255), random(255), random(255) );
   ellipse(p1.position.x, p1.position.y, p1.radius, p1.radius );
   p1.velocityAmt = 4.75;
 }
}
