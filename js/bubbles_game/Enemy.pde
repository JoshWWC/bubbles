/* Enemies are literally just different colored 
 * bubbles that move faster. Currently handling
 * collisions with player in Game state to avoid
 * having to pass a player object to the enemy class.
 */

class Enemy extends Bubble {
  PImage enemyImage;
  
 Enemy() {
   super(178,34,34);
   enemyImage = loadImage("enemy.png");
   velocity.mult(2);
 }
 
 void show() {
    noStroke();
    image(enemyImage, position.x, position.y);
  }

}
