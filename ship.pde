// Spaceship class
class Spaceship {
  float shipX, shipY;
  float shipSize;
  float shipSpeed;

  Spaceship(float startX, float startY) {
    shipX = startX;
    shipY = startY;
    shipSize = 50;
    shipSpeed = 5;
  }

  void update() {
    // Move spaceship with WASD keys(Checks if key is pressed and the ship is on the screen)
    if (keyPressed) {
      if ((key == 'a' || key == 'A') && shipX > shipSize/2) {
        shipX -= shipSpeed;
      }
      if ((key == 'd' || key == 'D') && shipX < width - shipSize/2) {
        shipX += shipSpeed;
      }
      if ((key == 'w' || key == 'W') && shipY > shipSize/2) {
        shipY -= shipSpeed;
      }
      if ((key == 's' || key == 'S') && shipY < height - shipSize/2) {
        shipY += shipSpeed;
      }

      // Move spaceship with arrow keys
      else if (key == CODED) {
        if (keyCode == LEFT && shipX > shipSize/2) {
          shipX -= shipSpeed;
        }
        if (keyCode == RIGHT && shipX < width - shipSize/2) {
          shipX += shipSpeed;
        }
        if (keyCode == UP && shipY > shipSize/2) {
          shipY -= shipSpeed;
        }
        if (keyCode == DOWN && shipY < height - shipSize/2) {
          shipY += shipSpeed;
        }
      }
    }
  }

  void display() {
    // Draw spaceship body (main triangle)
    fill(220, 220, 255);
    stroke(50);
    strokeWeight(3);
    triangle(shipX, shipY - shipSize/2, shipX - shipSize/3, shipY + shipSize/2, shipX + shipSize/3, shipY + shipSize/2);
    // Draw side boosters
    fill(180, 180, 220);
    stroke(50);
    strokeWeight(2);
    ellipse(shipX - shipSize/4, shipY + shipSize/6, shipSize/6, shipSize/3);
    ellipse(shipX + shipSize/4, shipY + shipSize/6, shipSize/6, shipSize/3);
    // Draw cockpit window
    fill(100, 200, 255);
    stroke(50);
    strokeWeight(2);
    ellipse(shipX, shipY - shipSize/6, shipSize/3, shipSize/3);
    fill(200, 230, 255);
    noStroke();
    ellipse(shipX - shipSize/12, shipY - shipSize/4, shipSize/8, shipSize/8);
    // Draw main engine flame
    fill(255, 180, 0);
    stroke(50);
    strokeWeight(2);
    ellipse(shipX, shipY + shipSize/2 + 12, shipSize/3, shipSize/2);
    // Draw side engine flames
    fill(255, 120, 0);
    noStroke();
    ellipse(shipX - shipSize/4, shipY + shipSize/2 + 8, shipSize/8, shipSize/4);
    ellipse(shipX + shipSize/4, shipY + shipSize/2 + 8, shipSize/8, shipSize/4);
  }
}
