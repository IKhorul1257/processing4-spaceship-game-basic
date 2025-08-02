// Star class
class Star {
  float starX, starY;
  float starSize;
  float starSpeedY;
  float starBrightness;
  
  Star() {
    // Randomly placing stars in the background
    starX = random(width);
    starY = random(height);
    starSize = random(1, 3); // Randomize the size of stars
    starSpeedY = random(0.5, 2); 
    starBrightness = random(100, 255); // Randomize the brightness of stars
  }
  
  void update() {
    starY += starSpeedY;
    
    // Reset stars when it goes off screen
    if (starY > height) {
      starX = random(width);
      starY = random(-50, 0);
      starBrightness = random(100, 255);
    }
  }
  
  void display() {
    // Draw stars
    fill(starBrightness, starBrightness, 255);
    noStroke();
    ellipse(starX, starY, starSize, starSize);
  }
}
