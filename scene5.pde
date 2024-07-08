ArrayList<Fish> fishes = new ArrayList<Fish>();
float diverX = 400; // Position of the diver
float diverY = 500; // Starting position of the diver
float diverSpeed = 2; // Speed of the diver's movement
boolean moveUp = false;
boolean moveDown = false;
boolean moveLeft = false;
boolean moveRight = false;
boolean treasureFound = false;
boolean inTemple = false;

void setup() {
  size(800, 600);
  background(173, 216, 230); // Light blue background
  
  // Initialize fishes
  for (int i = 0; i < 10; i++) {
    fishes.add(new Fish(random(width), random(height - 200), random(1, 3)));
  }
}

void draw() {
  if (!inTemple) {
    background(173, 216, 230); // Refresh background with light blue color
  } else {
    background(100, 100, 100); // Darker gray background for interior
  }
  
  // Draw the sea floor
  fill(139, 69, 19); // Brown color for the sea floor
  rect(0, height - 50, width, 50);
  
  if (!inTemple) {
    // Draw seaweeds
    for (int i = 0; i < width; i += 100) {
      drawSeaweed(i, height - 50);
    }
    
    // Draw and move fishes
    for (Fish fish : fishes) {
      fish.move();
      fish.display();
    }
    
    // Draw Atlantis city
    drawAtlantisCity();
  } else {
    // Draw temple interior
    drawTempleInterior();
  }
  
  // Move diver
  if (!inTemple) {
    if (moveUp && diverY > 0) {
      diverY -= diverSpeed;
    }
    if (moveDown && diverY < height - 50) {
      diverY += diverSpeed;
    }
    if (moveLeft && diverX > 0) {
      diverX -= diverSpeed;
    }
    if (moveRight && diverX < width) {
      diverX += diverSpeed;
    }
  } else {
    if (moveUp && diverY > 200) {
      diverY -= diverSpeed;
    }
    if (moveDown && diverY < height - 200) {
      diverY += diverSpeed;
    }
    if (moveLeft && diverX > 200) {
      diverX -= diverSpeed;
    }
    if (moveRight && diverX < width - 200) {
      diverX += diverSpeed;
    }
  }

  // Check if diver enters the temple
  if (dist(diverX, diverY, 200, height - 200) < 50 && !inTemple) {
    inTemple = true;
    diverX = width / 2;
    diverY = height / 2;
  }
  
  // Check if diver found the treasure
  if (inTemple && dist(diverX, diverY, width / 2, height / 2) < 50 && !treasureFound) {
    treasureFound = true;
    println("Treasure Found!");
  }
  
  // Draw the diver
  drawDiver(diverX, diverY, color(255, 69, 0)); // Changing shirt color to orange-red

  // Display message if treasure found
  if (treasureFound) {
    fill(255, 255, 0);
    textSize(32);
    textAlign(CENTER);
    text("MISTERI KOTA BAWAH LAUT", width / 2, height / 2 - 50);
  }
}

void keyPressed() {
  if (key == 'w' || key == 'W') {
    moveUp = true;
  }
  if (key == 's' || key == 'S') {
    moveDown = true;
  }
  if (key == 'a' || key == 'A') {
    moveLeft = true;
  }
  if (key == 'd' || key == 'D') {
    moveRight = true;
  }
}

void keyReleased() {
  if (key == 'w' || key == 'W') {
    moveUp = false;
  }
  if (key == 's' || key == 'S') {
    moveDown = false;
  }
  if (key == 'a' || key == 'A') {
    moveLeft = false;
  }
  if (key == 'd' || key == 'D') {
    moveRight = false;
  }
}

void drawDiver(float x, float y, color shirtColor) {
  fill(255, 224, 189); // Skin color
  ellipse(x, y - 10, 40, 40); // Head
  
  // Draw the body
  fill(shirtColor); // Shirt color
  rect(x - 15, y + 10, 30, 60); // Body

  // Draw the legs with integrated flippers
  fill(0); // Black color for flippers and legs
  rect(x - 15, y + 70, 10, 30); // Left leg with flipper
  triangle(x - 20, y + 100, x - 5, y + 100, x - 15, y + 120); // Left flipper extension
  rect(x + 5, y + 70, 10, 30); // Right leg with flipper
  triangle(x + 5, y + 100, x + 20, y + 100, x + 15, y + 120); // Right flipper extension

  // Draw the arms
  rect(x - 25, y + 10, 10, 40); // Left arm
  rect(x + 15, y + 10, 10, 40); // Right arm

  // Draw the eyes
  fill(0); // Eye color
  ellipse(x - 5, y - 15, 5, 5); // Left eye
  ellipse(x + 5, y - 15, 5, 5); // Right eye

  // Draw the mouth
  fill(0);
  arc(x, y - 5, 10, 5, 0, PI);
}

void drawAtlantisCity() {
  // Draw main temple
  drawTemple(150, height - 200);
  drawTemple(550, height - 200);
  
  // Draw pillars
  drawPillar(300, height - 100);
  drawPillar(500, height - 100);
  
  // Draw statues
  drawStatue(200, height - 150);
  drawStatue(600, height - 150);
}

void drawTemple(float x, float y) {
  fill(192, 192, 192); // Light gray color for the temple
  rect(x, y, 100, 150); // Main building
  
  // Draw arched windows
  for (int i = 0; i < 4; i++) {
    drawArchedWindow(x + 20, y + 25 + i * 30);
    drawArchedWindow(x + 60, y + 25 + i * 30);
  }
  
  fill(255, 215, 0); // Gold color for the top
  triangle(x - 10, y, x + 50, y - 40, x + 110, y); // Roof

  // Draw cracks and broken parts
  drawCracks(x, y);
}

void drawArchedWindow(float x, float y) {
  fill(169, 169, 169); // Darker gray for the window
  rect(x, y, 20, 30); // Main window body
  arc(x + 10, y, 20, 20, PI, TWO_PI); // Arched top
}

void drawPillar(float x, float y) {
  fill(255, 255, 255); // White color for the pillar
  rect(x, y, 20, 100); // Main pillar
  fill(211, 211, 211); // Light gray for the base and top
  rect(x - 5, y - 10, 30, 10); // Top of the pillar
  rect(x - 5, y + 100, 30, 10); // Base of the pillar

  // Draw cracks and broken parts
  drawCracks(x, y);
}

void drawStatue(float x, float y) {
  fill(128, 128, 128); // Gray color for the statue
  ellipse(x, y - 20, 30, 30); // Head
  rect(x - 15, y - 20, 30, 50); // Body
  rect(x - 20, y + 30, 40, 10); // Base

  // Draw cracks and broken parts
  drawCracks(x - 15, y - 20);
}

void drawTempleInterior() {
  fill(192, 192, 192); // Light gray color for the temple interior
  rect(200, 200, width - 400, height - 400); // Main interior space

  // Draw treasure chest
  drawTreasureChest(width / 2, height / 2);
}

void drawTreasureChest(float x, float y) {
  fill(139, 69, 19); // Brown color for the chest
  rect(x - 30, y - 20, 60, 40); // Main chest body
  fill(255, 215, 0); // Gold color for the lock
  rect(x - 5, y - 5, 10, 10); // Lock
}

void drawCracks(float x, float y) {
  stroke(0);
  strokeWeight(2);
  line(x + 10, y + 10, x + 20, y + 20);
  line(x + 15, y + 15, x + 25, y + 25);
  line(x + 20, y + 5, x + 30, y + 15);
  noStroke();
}

void drawCoral(float x, float y) {
  fill(255, 105, 180); // Pink color for the coral
  beginShape();
  vertex(x, y);
  vertex(x + 10, y - 20);
  vertex(x + 20, y);
  vertex(x + 30, y - 30);
  vertex(x + 40, y);
  vertex(x + 50, y - 10);
  vertex(x + 60, y);
  endShape(CLOSE);
}

void drawFish(float x, float y) {
  fill(255, 165, 0); // Orange color for the fish
  ellipse(x, y, 40, 20); // Body
  triangle(x + 20, y, x + 40, y - 10, x + 40, y + 10); // Tail
  fill(0);
  ellipse(x - 10, y - 5, 5, 5); // Eye
}

void drawSeaweed(float x, float y) {
  fill(34, 139, 34); // Green color for the seaweed
  beginShape();
  vertex(x, y);
  vertex(x + 10, y - 20);
  vertex(x, y - 40);
  vertex(x + 10, y - 60);
  vertex(x, y - 80);
  endShape();
}

// Fish class
class Fish {
  float x, y;
  float speed;

  Fish(float startX, float startY, float startSpeed) {
    x = startX;
    y = startY;
    speed = startSpeed;
  }

  void move() {
    x -= speed;
    if (x < 0) {
      x = width;
    }
  }

  void display() {
    drawFish(x, y);
  }
}
