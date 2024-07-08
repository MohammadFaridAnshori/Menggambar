ArrayList<Fish> fishes = new ArrayList<Fish>();
float diverX = 400; // Position of the diver
float diverY = 500; // Starting position of the diver
float diverSpeed = 2; // Speed of the diver's movement
boolean moveUp = false;
boolean moveDown = false;
boolean moveLeft = false;
boolean moveRight = false;

void setup() {
  size(800, 600);
  background(173, 216, 230); // Light blue background
  
  // Initialize fishes
  for (int i = 0; i < 10; i++) {
    fishes.add(new Fish(random(width), random(height - 200), random(1, 3)));
  }
}

void draw() {
  background(173, 216, 230); // Refresh background with light blue color
  
  // Draw the sea floor
  fill(139, 69, 19); // Brown color for the sea floor
  rect(0, height - 50, width, 50);
  
  // Draw seaweeds
  for (int i = 0; i < width; i += 100) {
    drawSeaweed(i, height - 50);
  }
  
  // Draw corals
  drawCoral(100, height - 80);
  drawCoral(300, height - 60);
  drawCoral(500, height - 70);
  
  // Draw and move fishes
  for (Fish fish : fishes) {
    fish.move();
    fish.display();
  }
  
  // Move diver
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
  
  // Draw the diver at the bottom of the sea
  drawDiverAtBottom(diverX, diverY, color(255, 69, 0)); // Changing shirt color to orange-red
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

void drawDiverAtBottom(float x, float y, color shirtColor) {
  fill(255, 224, 189); // Skin color
  ellipse(x, y - 10, 40, 40); // Head
  
  // Draw the body at the bottom
  fill(shirtColor); // Shirt color
  rect(x - 15, y + 10, 30, 60); // Body

  // Draw the legs with integrated flippers
  fill(0); // Black color for flippers and legs
  rect(x - 15, y + 70, 10, 30); // Left leg with flipper
  triangle(x - 20, y + 100, x - 5, y + 100, x - 15, y + 120); // Left flipper extension
  rect(x + 5, y + 70, 10, 30); // Right leg with flipper
  triangle(x + 5, y + 100, x + 20, y + 100, x + 15, y + 120); // Right flipper extension

  // Draw the arms at the bottom
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
