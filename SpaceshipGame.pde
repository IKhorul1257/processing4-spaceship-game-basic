/*
 Macquarie University
 COMP1000 Programming Project - Spaceship Game
 Author Name: Iftakharul Islam
 Student ID: 49108743
 Degree: BSc.IT(AI)
 
 Project Description:
 This project is a 2D arcade-style dodging game implemented using Processing (Java).
 The player controls a spaceship and avoids incoming space rocks while collecting score to beat the highest score.
 
 Semester Topic Integration:
 This project demonstrates core concepts of interactive programming covered in this semester, including:
 - Object-Oriented Programming (OOP): Custom classes for Spaceship, Rock, and Star.
 - 2D Graphics: Use of Processing shapes (ellipse, triangle) to draw objects.
 - Event Handling: Real-time user input through keyboard (WASD/Arrow keys, SPACE, R).
 - Arrays and Loops: Managing and updating multiple objects (rocks and stars) with arrays and for-loops.
 - Game Logic: Collision detection, scoring system, and game state control.
 
 Instructions:
 - Use Arrow keys or WASD to move the spaceship.
 - Avoid hitting the rocks.
 - Press SPACE to start and R to restart.
 - Press ESC to terminate the game.
*/

// Global variables
Spaceship ship;
Rock[] rocks;
Star[] stars;
int numRocks = 10;
int numStars = 50;
int score = 0;                  // Game Score
int highscore = 0;              // High Score
boolean showStartScreen = true; // Start Screen
boolean gameOver = false;       // Game state

void setup() {
  size(800, 600);

  // Initialize Spaceship Class
  ship = new Spaceship(width/2, height - 50);

  // Initiallize Rocks and Stars Array Class
  rocks = new Rock[numRocks];
  for (int i = 0; i < numRocks; i++) {
    rocks[i] = new Rock();
  }

  stars = new Star[numStars];
  for (int i = 0; i < numStars; i++) {
    stars[i] = new Star();
  }
}

void draw() {
  background(0, 0, 30); // Dark blue space background
  frameRate(60);

  if (showStartScreen) {
    // START SCREEN
    fill(255, 140, 0);
    textAlign(CENTER);
    textSize(48);
    text("Spaceship Game", width/2, height/2 - 100);
    fill(255);
    textSize(14);
    text("Ver 1.0 | Author: Iftakharul Islam (49108743)", width/2, height - 20);
    textSize(24);
    text("Use WASD or Arrow Keys to Move", width/2, height/2 - 40);
    text("Avoid the Rocks!", width/2, height/2);
    fill(0, 255, 0);
    text("Press SPACE to Start", width/2, height/2 + 80);
    fill(255, 0, 0);
    text("Press Esc to Quit", width/2, height/2 + 110);
    // Show Spaceships to make the startscreen look better
    Spaceship startShip1 = new Spaceship(width/2 + 200, height/2 - 130);
    startShip1.display();
    Spaceship startShip2 = new Spaceship(width/2 - 200, height/2 - 130);
    startShip2.display();
  } else if (!gameOver) {
    // Display stars in loop motion along y-direction
    for (int i = 0; i < numStars; i++) {
      stars[i].update();
      stars[i].display();
    }

    // Update and display ship
    ship.update();
    ship.display();

    // Update and display rocks
    for (int i = 0; i < numRocks; i++) {
      rocks[i].update();
      rocks[i].display();

      // Check collision with spaceship
      if (rocks[i].collide(ship)) {
        gameOver = true;
      }
    }

    // Update and Display score and high score
    score++;
    textAlign(LEFT);
    textSize(20);
    fill(255, 255, 0);
    text("High Score: " + highscore, width/2 - 380, height/2 - 270);
    fill(255);
    text("Score: " + score, width/2 - 380, height/2 - 250);
  } else {
    // Game over screen
    if (score>highscore) {   // Check High Score
      highscore = score;
    }
    textAlign(CENTER);
    fill(255, 0, 0);
    textSize(48);
    text("GAME OVER", width/2, height/2 - 40);
    fill(255);
    textSize(24);
    text("Final Score: " + score, width/2, height/2 + 10);
    fill(255, 255, 0);
    text("High Score: " + highscore, width/2, height/2 + 40);
    fill(0, 255, 0);
    text("Press R to Restart", width/2, height/2 + 80);
  }
}

void keyPressed() {
  // Start Game
  if (showStartScreen && key == ' ') {
    showStartScreen = false;
  } else if (gameOver && (key == 'r' || key == 'R')) {
    // Restart game
    gameOver = false;
    score = 0;
    ship = new Spaceship(width/2, height - 50);

    // Reset rocks
    for (int i = 0; i < numRocks; i++) {
      rocks[i] = new Rock();
    }
  }
}
