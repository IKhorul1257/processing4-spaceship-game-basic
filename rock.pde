// Rock class
class Rock {
  float rockX, rockY;
  float rockSize;
  float rockSpeedY;
  
  Rock() {
    rockX = random(width);
    rockY = random(-100, -50);
    rockSize = random(30, 60); // Randomize the size of rocks
    rockSpeedY = random(2, 5);
  }
  
  void update() {
    rockY += rockSpeedY;
    
    // Reset rocks when it goes off screen
    if (rockY > height + rockSize) {
      rockX = random(width);
      rockY = random(-100, -50);
      rockSize = random(30, 60); 
      rockSpeedY = random(2, 5);
    }
  }
  
  void display() {
    // Draw rock
    fill(120, 100, 80);
    stroke(50);
    strokeWeight(3);
    ellipse(rockX, rockY, rockSize, rockSize);
    // Rock Body Details
    fill(100, 80, 60);
    noStroke();
    ellipse(rockX - rockSize/6, rockY - rockSize/6, rockSize/4, rockSize/4);
    ellipse(rockX + rockSize/4, rockY + rockSize/8, rockSize/5, rockSize/5);
    ellipse(rockX - rockSize/8, rockY + rockSize/4, rockSize/6, rockSize/6);
  }
  
  // Checks Collision between ship and rock
  boolean collide(Spaceship other) {
    float distance = dist(rockX, rockY, other.shipX, other.shipY);
    return distance < (rockSize/2 + other.shipSize/2);
  }
}
